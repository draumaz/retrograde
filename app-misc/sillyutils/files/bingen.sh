#!/bin/sh -e

for LINK in `cat ${WORKDIR}/sillyutils.sh | \
  tr ' ' '\n' | \
  grep '()' | \
  tr '()' '\n' | \
  grep '[Aa-zZ]'`; do
    cat > ${WORKDIR}/${LINK} << EOF
#!/bin/sh -e
sillyutils ${i} \${@}
EOF
  echo written
  chmod -v +x "${WORKDIR}"/"${LINK}"
done
