Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B63ACA60
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742980; cv=none; b=rXmFQUdBKi3BrdbreN+By+Vfcw1zzK9gt9+ldE5AmNC2yQb7LvT59o9BeBmYgTQ/3WLmJ8pLIYmSM4Gp/I3CK8VydhWxTVxmNFFAySO99IRFRUxMIjmBSxYvhG9US2IqaCwv9Ot0SXMDL8kcyMRnVnVml90hsvQCBzLiMoUwwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742980; c=relaxed/simple;
	bh=vYgZnGw3HoPq+YUQpICbWM11tdy9m0LFLeaoSCgLxiI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FfAK2RW27qywe7KjWQ74MB9VbznTjF9EAumJREd0xV/M+NO5xBlZEapxoWvI7Yr6wkFtoAHhV25f5QjYDffKU42x86V7/4cYMWd65y3XI0g1VFZj+7hnJWj3enTu1DqnIleJ9ostLhSVPpq1ZllHocTglB5SLibhoqzWJK5nELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoEamMOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bx/jsRqE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoEamMOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bx/jsRqE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGqNV972277
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rhO+uHp9DPxSeNZfZGEVWa
	lGsSmitwOKoe3gIx10Sjw=; b=hoEamMOkzgmVo4UMDEEKEHFwrIuxseQ3eiP8sf
	NWCA3s8PQ86fc70Hv6/dxB+1y86ta4fmY1oiBqSeb+pSrdO1SIjznzHKt8q0pu0q
	TC2/dK0LQioTtRyD4pAHVs9LutlHYnbzzj73oOvpl3GV84Em2Awoa537+HRtDowA
	YceMpkxxbHf0bNgXFZ06xMxm6ZChBTYKThlrDciv6Qtscix8on1wb6FPRqvLsSSK
	b8gU7VrOWtmYvnrktbCosHvcrfEKMvcVsoKY7fqXawlN9g2FWT+/x22+ClbGCLeJ
	TWFQOAixPkLMgsP2MYKKr/NysiB2QEnh/TaRuVsRwZ/TT5Cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghrr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so11463621cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742968; x=1788347768; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rhO+uHp9DPxSeNZfZGEVWalGsSmitwOKoe3gIx10Sjw=;
        b=bx/jsRqEG90a8w7wq68IQBCPDPHdd7hAoKPrITOWOQT/VC9FYbrwtpHMqXmdYQOqX5
         Sz4MMXHIot1LRA12WkyMKQk4wG3vyn+QTpFL55Yb6fnnLbYEPB48Y8SQytmTmzedaw6P
         vWVddpQ5MCdgdsTl7wRHrPynyHHv7RUUtUr2OkmCmRlV3nKTnVK0Khsx8yyqBBYzl7QL
         NyWY+y3jj3f8UI3aJ1+E9tERdRnbDES5huqOy+vY2g1R/hh4BS/0+s/wglORDCd0qphb
         BdANmG0XjQPnEq22DxvYG4/ArbFV/9nMcSFvrybNglxbr+kBIhWeRpRDSNAiB41gqTdn
         3L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742968; x=1788347768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rhO+uHp9DPxSeNZfZGEVWalGsSmitwOKoe3gIx10Sjw=;
        b=mYKNMx8j/GcGEYjys9QfgpY+w2Dm2B98EGJ1ZCYM/bgwqEMfSqgivO6bitnySib9oB
         c3xbt2+Tx1qY42Yen1/11tiutxuW8olcVUTUI4OOAVkqCRlB4pRH9rbir9vhOOzrj6rP
         0YNGAbTHuPJ4y1ZRywYmQvylqAgJJv2mJcYlwJ8ThSFQXmHjc70vikrRXXkOZg6L+4xh
         HZVwz9uf3m/eheHofuBS6Meb+3qYa/Gs0yz9RRb1iLK31PGqMLcNCXXS97jWCP8Throa
         U1ARx5yueDT0OEDvdkyNvDWQqDUByu/xeD1LPaGXn5eDCBS71bNTrwivzGUzOJxCrYj/
         4Kjg==
X-Gm-Message-State: AFuF++mYrSW9imSFfw3yfLLrchBTpFSaPlgR2dZ7BkCLesQ9cMLA3hH3
	03lSrfHZUP+guBayW1j8gPebYavk6K+FEieWFMwz7BbqTk0JR5aXTL6LO/1FnUyC/saRIyA28+V
	0vLBAO3FLl+P2cmluHYm9shewCT8YpV7spQWQiKmPLPWm4YxtzOUh5FrPXe5BeOJC
X-Gm-Gg: AR+sD11zoF1i6q5QFUFfa5G1jq5KBbQLz6Z73CoEGM+PtADkkeKXzAC9Bx+FYczOx/m
	CB2TvqpwF6flWi6/agXi7dTw2oVDUUYKYQleW/pukLEWYWfLpWGS3QW+fVZajTsS+2CvE5aUFQq
	gUAYFc7RvBq/fcZa0bVNwDXy6yHxNBsphGPr3SAVi5D4xKbSvDIZF6zGntij0UiFDxdayVaM/fk
	8GT54S/JkpfjynlPB/o3sE0f6QDvFJLcufwMFIUUvb2QRfJ50XmOpoijMAq3miH6W2QXxLl3VGb
	5gwwyuUppL+EGrLCXC9n2tYCZjPA+hfTLI53DlZKYrYsWvJDQ1/g+OF9ecAS9NAeD/IJ9uLRrgD
	95KMZhZF8VNTRkCJ5EVUblic=
X-Received: by 2002:a05:622a:15d3:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52e422cbda1mr52494751cf.17.1787742968410;
        Wed, 26 Aug 2026 04:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52e422cbda1mr52493921cf.17.1787742967649;
        Wed, 26 Aug 2026 04:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 00/10] dtc: dt-check-style: Improvements for false
 positives
Date: Wed, 26 Aug 2026 13:15:52 +0200
Message-Id: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XPwU6EMBAG4FfZ9Gw3baHTdk++h/EA00Gqu0UpE
 Dcb3t2CB/cgQS+T/Mnk+2duLFEfKLHT4cZ6mkIKXcwBHg4M2yq+EA8+Z6aEAmEU8Mj9kHgarmf
 i2BK+Uc+xi0OII3leQyU0KWOtkywb7z014XP1n56/cxrrV8JhQZeNNqSh66/rAZNc9v7aNUkue
 C10bRvrDBjx2KV0/BirM3aXyzEPtlRO6ge1Qu2hKqOA2tdeIjZUbqDFPVrsocWKOmPAKYtUbaD
 lHbr/fplRoRSBEE460Buo/heqM9p4LwErIGPkL+g8z1+k98mQNwIAAA==
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8715;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vYgZnGw3HoPq+YUQpICbWM11tdy9m0LFLeaoSCgLxiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrsD9yi373toGSTGeqflm07SNN9EOcnkJGTF
 ra0K/98iluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K7AAKCRDBN2bmhouD
 18v4D/9ORy8mmsjTcdNPE4dFipZygWHLLRqYOQvGT6Zna9puMuAARFz1ilasdugfakZ28ieIbMn
 tOCCMJOFxjWJgrX35wlGCwUh4SHElGt3R3bpcfY0CPgW6qgeSpsV/zDW23fZsloVQ1pB2HuaopY
 +4VLnJ0Icm3y3RlhApCdFlCxJv5FkNKYM1DyLsaaETEjmG050+xoE4mqkKtyEt9I9fmkKOPK2QX
 R4AmUXjKMGZUcMOc0mvqxKb51FpSlqzEg7Uqy4SHmIktf4LwmaBPD4kuivP8cVBB/ToWR6L0n9d
 H1G/KkXpm3GvcnXBQ82yF64nS0GpYlacZuPqSABc3paP2CzrrltE2YgTPtdo7sBCKeDWw4iIcIM
 3plpfW5iQvO9KxkkzrXERiPBfdtB0T4G3M8szEAOPNaeALvhb5ViAYvvKyF4mm+e65IEKMpDIH6
 gnIn8uKtQpbcqke9cPYth++MWUGjg8rl1/OqnDnojF5EsAiudTV1Ko+bWWnzZFgC3vMGH3sDBAT
 ghEA6yiaN6Gz9uTgXPVQe8U4qU58wAGBzVyvLhc6dRn+k0Zy6xx7PCqSepy78lA9kYQ2LZAewhH
 KcQ/1WXTgfpUcbJljFdlWODzuczzpKdx7dcQsGT/DfbwcvO6cq+pOJmbQiX8feeoAN9qy1gvZ65
 f3LX8KiUxzaXffw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: dUko1VlT7cmxaikpT_Jk3JM8TuL_gK2T
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ecaf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=C9I128NeD9plNWH0hSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX/F8vld+nsong
 lHODwkOSBuXnXBCet5gKQ8OOZxKhBGb1Q79ruoc2ennev75tzna44w6b5LB5kJ+GhR8imazpqj9
 lcBsq5G6Hi7SetNDrGMlkce0h7CE/c0=
X-Proofpoint-ORIG-GUID: dUko1VlT7cmxaikpT_Jk3JM8TuL_gK2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXyT68ySS/9tB+
 vN+Wi+QemhM3A1S4l1JTQxgcEyHzquqNohldQ9oD07yQSSOMgLe+cj6WnbpDUf0KerfAB1AkCSt
 nlJTeV5bU4dszdv88ujPGIXXhtqNC41XwvNcE9vEItz1PbsP1vdXy7w6JwiynPwnA5ZxJZykIrU
 4vI0oGykuxrj89TKfAvM2u3bhMzpzrjF+makdHSS7+khIismRiUnT4byw+l/al6ou+pJ/hK0qBa
 am3qU/OVnT7X+kCv0CkApEbA4n6opBTvvf+H0CO0u46fnfDUgrjxbWrBmjIilxWFFMQisEwA7gB
 kZAtzd/cim+x1RoVGqpDdIoMW6akzEtWRi0to+86CsqPUY5uPWLNRhw3xodc9hng+KTn9cUjmUk
 ZyC7LsxLzu5RkpEuetJSgP34Wx10+K8SS+2yxhM+cRpEZKuiAGewBinA37/TD07QFNwSuIU+2Om
 p16llHvY0SSHdDRa02A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

This might be a frequent posting, because Sashiko finds a lot of border
cases.  It turns out parsing text is not that easy (surprise!).

Changes in v6:
- Handle white-space differences in overlays '&{/} {' part
- Bring back strip() from _strip_strings_and_comments() rework
- Minor commit msg improvements
- Link to v5: https://patch.msgid.link/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com

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
 .../dt-style-selftest/bad/dts-property-order.dts   |  15 ++
 ...-property-order.dts => dts-property-order.dtso} |  18 +-
 .../bad/dts-redundant-ws-strict.dts                |  27 +++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts |  28 +++
 .../dt-style-selftest/bad/dts-redundant-ws.dtso    |   9 +
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
 .../expected/dts-property-order.dts.txt            |  15 +-
 .../expected/dts-property-order.dtso.txt           |  11 ++
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 ++
 .../expected/dts-redundant-ws.dts.txt              |  10 +
 .../expected/dts-redundant-ws.dtso.txt             |   2 +
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
 73 files changed, 774 insertions(+), 120 deletions(-)
---
base-commit: 880f167cefcb850a423293bde8ec132292a40d65
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

