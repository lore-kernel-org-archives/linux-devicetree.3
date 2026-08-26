Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E153C5536
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739700; cv=none; b=m1xBl3GzofWn9qF17Owqjn/SSie0oPYrJ69iJZAKECZdUzhUtaeftHvY3Tmap5iBzIvTloBIY4P6BM71z6QHNgshynV/ivVhTcKVTPiaYARn10xs9lNWX3e+XzzZksKPG/hHMOOJsaWeCY1meQQcei5i3e6dF3YNzcG6xJGayzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739700; c=relaxed/simple;
	bh=YBtJuyuCcBkwqYl01JcZ5S9mEEDbf84lSQW87dPINvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A0StYcBos4ydGVIee6UupYDu/+twg3XSPOq/3id8vRGC6pNfXADJUpJQM0LhyDi6xrHUSK2n53t75CRZsSUnohCAwvrapf088DXNE0COMHP9Y/CMKpSRPqfGLs4lu2y2PbSDjV6POQI120UxLl0ftR/i0gaoEFIXUiSnLmtl62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKk5GaTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vbaw3GAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKk5GaTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vbaw3GAO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGRor017255
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+72vngQ50G3eLUQ8/BBfMo
	jknKPnstMObMUh+RH9RuI=; b=eKk5GaTw67ZhYQ4bZ7RaAE1ynU0qooyZDK3du8
	/XL+ud/03ihPnp8NrAw2JCN9IqzBG6R35sfIaP4m9SkyuPEySaTL7zWvuLo0ON7L
	gd/BSZayMiNwUiUeNyliR+bqwCGs2PefzjvQnZv5Dte5TaQ5fz/nmfL57E9fGhRN
	hXc/J7OZP8UueuwV+ogjPC+8ps+TjtmkEQ6dzo0yiX+LJA+AVmr0MK22oF6DAqId
	n1sg0TxonoKxyLNacwOmU9KjQb47CSVRHR6XCYrg72PwXMU3vJHZBJC5O2POkXo0
	RiEB/kYZWGVTaDN+j4Yd9ipdKL1ePDnHNnxYzYmP8zkYWZ+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3d3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so7798141cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739697; x=1788344497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+72vngQ50G3eLUQ8/BBfMojknKPnstMObMUh+RH9RuI=;
        b=Vbaw3GAO06jMSGsgUdLKcisoB0EcCyFh5R8bhX5ApGlclflB+iL+NxC9e7wip6E1zA
         pzXbisagM+ZqgddIKxv/trProFq7mfvB2CUbLE6OJxffn+VV2B2ppaaZcU8V+KJS3Nru
         xntLqbtOR2AL7aXmRiUgp+/W/0yRh9Wv3qrpSs6826WI0otzd5Kw9M6zfBcf3hSMLYF1
         U7AbkAxgKKvfWZOgU7f0dx5uxPXu5mW5/JhVSazJdnYXPiaecVSV7fVoC3anjGjhD7x4
         xb55dNf9ZE8TXIZZBw1P3GEl9HHEQk2vf0Z30rZ/dlVRo+YCZUMkrz7aPChVg/jX7N0R
         cZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739697; x=1788344497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+72vngQ50G3eLUQ8/BBfMojknKPnstMObMUh+RH9RuI=;
        b=jFi5DIrovKWc3HM6QdPB09m/RKXurbVQL5/KoZCo05DMZeTLPyrepFZ0B8/4ll174Z
         L2WIbCFAmk5tFheG4MDDYg5Md51kNPWg8CgW3OFainwq9xA74UtXddNVvDjBdaXAU9oI
         x0B3ug9X3cIcOUAYMiBwiieUAIhqKmoR/Q2yszSGkw3/a3i2y/m/95g2MFuzrd1r9akm
         2FNlLfmKU6nJ4x4IV6Ve6qIRZOUabrnB/LMozOsLqP0nFpm3ydjCkARiCwVarnlAsph8
         CVeyVZr2Mjch/Qyu2jz1fRfWrUl3P3CBESdCWmMkx0w3mky4ENLmnR1oeSi2QdsETgR6
         vElA==
X-Gm-Message-State: AFuF++mCjh1DHvyOAguqElw6xcJcwIgkIjMYEGHES+dgm2NrgiPVAdNL
	DO7PNuJF3cjs39wRBm2jqS67dSux/iV9E1YyHLlKElnQyL09aGUBL+HP3g5tl0daTlKc2QFI5lX
	NtteUZMhzyb0Z1HiDkNVfEn0F5Lq4nytUE4t0WJEV1QhbNPumkrn4CSC0wn4QsrEL
X-Gm-Gg: AR+sD12ig8ESaIMIA/ntS7YAD815bAtQ7ByHECriSE4qLsApoU+ATbvs/v0ZLMkezDp
	QwK/oVp6/SeGoTKlEHGLnDPh6W+CW39MX+690fJBBr3PH4L3BpAe6lGSeMILc4a1HP4fcy0jWp9
	eDwkUnBnAuvQEPd/hoASJRDf3SdEw+pEQ4PqqWIMperDc1xqQWjSoxAzpsVOX8ID2LPYR5uDQbU
	ndUbHJtvyELKfX26yBxNdeRpXJJQ4Qzo/FlRSmamRAUY2FawtopOJjBgFeH6aI0OtSF/BKKGnGv
	MHkMso2AmpTbQEdJSNeeyf0Rz33dOOrSBT43ndL+FW5kB+NMoSPPfavbLWEvn9RqbaUEUYgIrAE
	8y1FlOmRolpFWmyt8yPdGI4A=
X-Received: by 2002:a05:622a:4c12:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52e42266eebmr51582291cf.3.1787739696774;
        Wed, 26 Aug 2026 03:21:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4c12:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52e42266eebmr51581781cf.3.1787739696240;
        Wed, 26 Aug 2026 03:21:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 00/10] dtc: dt-check-style: Improvements for false
 positives
Date: Wed, 26 Aug 2026 12:21:21 +0200
Message-Id: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PTU7DMBAF4KtUXuNq4sR/rLgHYhHbE2JobbCdi
 KrK3XHCgi6owmakJ42+N3MlGZPHTB4PV5Jw9tnHUAN/OBA79uEVqXc1EwZMgGSCBupKprlcTkj
 tiPYdE7UxFB8mdNSIHjgyqZRuSDU+Eg7+a/OfX35ynswb2rKi68boc4npsh0wN+vef7vmhgI1w
 I0alJZCwlPM+fg59Scbz+djHWStnNkvqoDtoayiwnJnXGPtgN0dtL1F2z203VAtpdBMWezvoN0
 Nuv9+V1FgDAWAbrTgf6DLsnwD+ju4CuIBAAA=
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8303;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YBtJuyuCcBkwqYl01JcZ5S9mEEDbf84lSQW87dPINvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4kulTTD9cQvVrg69xH9n2RxuggEPPEPZhmf
 7cpGUpJdOyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+JAAKCRDBN2bmhouD
 14xzEACDALKG8OH92HuTalpjwpuT6H8ZU31/Ua/GMDa48n0Y7seEGpDBaR8JiHnS4Ie54uDNza2
 HedYiEWKXaOe8jNqTY2gPJULxrKzG2rQcWpqr/lZ77nid0C4nBUhKkBxASK6u1NQzDMP4MtCZ/h
 mcQI8qzY9aMv3/LybNHjP1OJKNCjcMY7p4/I9H3lNZqGR+8xeWCr0AR0pShiyKtVS0zovT7yNoo
 U2KufgKf8LgBp4kDmYNNn1u5+6Kl1wvl80m69Nj+70NVSxHJRxGQQZQF+kbLgN3qiz9FHC6egiB
 grki7TMzWVin3kB/9fbyM2IWocHyaa8jcqdxKIDSJosChkh9GUR2NcfFSNp96g+GTuuhbJGRFN0
 unBbta99BtUHl6J5GQsaxwhtbHW0Rhhg/6Vt1jfLKNQJwhC7WExn66soQceNfJm4DlCt0oKnCif
 o7O3bGlrxsqabEI8sj1WbRB89jtVkqjsq3NinOlzT3154/4/qLsu4AsIuwTPD1jTpgF+QIry+I7
 4gBaACCk31POzeSMPdbGrLN1+PKkTotbLgzkmo1/MKUQWZ9G05y8hpp1gqX1QE21jA60lXsgJ5f
 1gQTkV1NlsORh+xcYgFj+mT4QrrO7EQENYZzjtqT7dsjJB6U1LpR6N4NWBbCl/3h9I3zr7NwbTf
 4SE7b4Hg36cFh9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: USvp8tMzgvE5nlQ_6get6AR8l_PwnhF8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXz2ECWsYmRvgr
 KektL3nwdKCv+MNOeDE/6Zg2uT+4tbjOuD7Jx8U0mvNuu4e0BXhTRVkfGsh3f3TkS53tNktPl+0
 9KRvwRJ3InmRmHZ91Gz9WxbuyVUe9k8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX/Z0IeMZEFP4Z
 7SFwJr+EQqPpmFqa9Upq3g/LabSaAQl/vPOJFaZDIQPujnWWkImRiGEcaGCSc7rFSOhcnibFS1Q
 +rQa/RauH9kDIqRtQjyCRf8jH9tsZBEmMFL483Ggf8Zh7mU76vL4sVLaLykWhqnr9uJnj3r224R
 wN4VCIyjbVqbB9B7TwdVUX8eKtoJweQhSZAX5MGVdebEsm17jpMnmSMdvK9OJoYibbQcGSEJBHR
 ZhXtA5rK5LLLRXb9jUrwpYwSHA5AQvPRJKEka6XrHDeO/eWPS4OCbA9FvFNOu1hltzInjmKqtp+
 XrtRVZUxaRvahIqFTZyYgSsdGSlm1mTGfLw/+arr25i5pkFp0L22HqFROLL/Qd7uHdlhI+j+ecL
 EIAbAgaRrUaCkpQyultAGu+2g/tHZo3SNWuRPVEpfOIx7MqD+m5qt5nkMIxtJJZuhhLDom/+cSm
 BegcXSUS05oylhUMREQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebe31 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=C9I128NeD9plNWH0hSYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: USvp8tMzgvE5nlQ_6get6AR8l_PwnhF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

This might be a frequent posting, because Sashiko finds a lot of border
cases.  It turns out parsing text is not that easy (surprise!).

Changes in v5:
- Patch #3: Trailing whitespace or comments break multi-line property alignment validation
- Patch #9: The regular expression `r'(\s\s+|\t){'` uses an unescaped `{`
            The redundant whitespace checks do not validate continuation lines of multi-line properties
- More tests for each of cases brought by Sashiko
- Link to v4: https://patch.msgid.link/20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com

Changes in v4:
- First two patches merged
- Squashed previous #3 into next one (#4... but now it is patch #1),
  because: detection of root is still needed for DTS/DTSO with code:
  &soc {
	children ...
  };
  where comparing the c.parent.node_name to None or / would give false
  results of being child of root node.
  Fix regex pattern for "/{" case.
- Fix comments from Sashiko (rebasing issue, help msg, align continued
  values based on previous one ending with ',', do not report whitespace
  issues for comments)
- More test fixtures
- New patches:
  dtc: dt-check-style: Replace Test User email with Rob Herring
  dtc: dt-check-style: Call _strip_strings_and_comments() only once
- Link to v3: https://patch.msgid.link/20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com

Changes in v3:
- Responded to Sashiko and implemented its comments
- Properly handle root node with more than one space "/  {"
- Add more unit tests for DTSO whether properties and nodes are properly
  detected as top-level
- Link to v2: https://patch.msgid.link/20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com

Changes in v2:
- Trailing slash to maintainers path
- New patches:
   - Patch #9: dtc: dt-check-style: Add test for trailing white-space in DTS
   - Patch #10: dtc: dt-check-style: Add warning for redundant white-spaces
- Several fixes based on Sashiko's report (I responded to these on the
  lists)
   - _walk_bodies(): Fix setting up proper parent to each node after
     exiting node parsing. This wasn't working correctly.
   - check_child_name_order(): Properly sort top-level nodes by names,
     even if it comes with unit address like memory@1000
   - Add rest of property_bucket sorting for top-level properties,
     even though no properties are expected there, except few vendor
     ones
   - check_continuation_alignment(): Improve error msg for
     continuned-lines alignment warnings

- Link to v1: https://patch.msgid.link/20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com

Few improvements and proper handling of top-level node (name, not unit
address sorting) and property (model before compatible) sorting.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      dtc: dt-check-style: Replace Test User email with Rob Herring
      dtc: dt-check-style: Call _strip_strings_and_comments() only once
      dtc: dt-check-style: Add test for trailing white-space in DTS
      dtc: dt-check-style: Add warning for redundant white-spaces
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

 MAINTAINERS                                        |   2 +
 scripts/dtc/dt-check-style                         | 212 ++++++++++++++++-----
 .../bad/dts-child-name-order.dtso                  |  33 ++++
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  26 +++
 .../{good => bad}/dts-digit-node-order.dts         |  13 +-
 .../dts-digit-node-order.dtso}                     |  16 +-
 .../bad/dts-extend-node-child-name-order.dtso      |  26 +++
 .../bad/dts-extend-node-digit-node-order.dtso      |  34 ++++
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  21 ++
 .../dt-style-selftest/bad/dts-property-order.dts   |   7 +-
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../bad/dts-redundant-ws-strict.dts                |  27 +++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts |  28 +++
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 ++
 .../bad/yaml-child-addr-order.yaml                 |   2 +-
 .../bad/yaml-child-name-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   8 +-
 .../bad/yaml-digit-node-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   2 +-
 .../dt-style-selftest/bad/yaml-indent-strict.yaml  |   2 +-
 .../bad/yaml-label-in-string.yaml                  |   2 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   2 +-
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   2 +-
 .../dt-style-selftest/bad/yaml-multi-close.yaml    |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-node-close.yaml |   2 +-
 .../bad/yaml-prop-order-device-type.yaml           |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   2 +-
 .../dt-style-selftest/bad/yaml-prop-pairing.yaml   |   2 +-
 .../bad/yaml-redundant-ws-strict.yaml              |  31 +++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   |  35 ++++
 .../dt-style-selftest/bad/yaml-required-blank.yaml |   2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml    |   2 +-
 .../bad/yaml-trailing-comment.yaml                 |   2 +-
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   2 +-
 .../bad/yaml-unclosed-comment.yaml                 |   2 +-
 .../bad/yaml-unit-addr-prefix.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-unit-addr.yaml  |   2 +-
 .../dt-style-selftest/bad/yaml-unused-label.yaml   |   2 +-
 .../bad/yaml-value-ws-multiline.yaml               |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-value-ws.yaml   |   2 +-
 .../expected/dts-child-name-order.dts.txt          |   1 +
 .../expected/dts-child-name-order.dtso.txt         |   3 +
 .../expected/dts-cont-align.dts.txt                |  10 +
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../expected/dts-digit-node-order.dtso.txt         |   2 +
 .../dts-extend-node-child-name-order.dtso.txt      |   2 +
 .../dts-extend-node-digit-node-order.dtso.txt      |   2 +
 .../expected/dts-line-length.dts.txt               |   2 +
 .../expected/dts-property-order.dts.txt            |  13 +-
 .../expected/dts-property-order.dtso.txt           |   8 +
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 ++
 .../expected/dts-redundant-ws.dts.txt              |  10 +
 .../expected/dts-trailing-ws.dts.txt               |   2 +
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-redundant-ws-strict.yaml.txt     |   5 +
 .../expected/yaml-redundant-ws.yaml.txt            |   4 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dtso                 |  44 +++++
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  13 +-
 .../good/dts-digit-node-order.dts                  |   3 -
 ...it-node-order.dts => dts-digit-node-order.dtso} |  24 ++-
 .../good/dts-extend-node-child-name-order.dtso     |  26 +++
 .../good/dts-extend-node-digit-node-order.dtso     |  34 ++++
 .../dt-style-selftest/good/dts-property-order.dts  |   5 +
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../dtc/dt-style-selftest/good/yaml-4space.yaml    |   2 +-
 .../{bad => good}/yaml-cont-align.yaml             |  10 +-
 .../good/yaml-tricky-parsing.yaml                  |   2 +-
 scripts/dtc/dt-style-selftest/run.sh               |   2 +-
 71 files changed, 739 insertions(+), 121 deletions(-)
---
base-commit: 40d0be799a2d27aead9d1b401371f762fead59d4
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

