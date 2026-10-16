Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61073A16B2
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132619; cv=none; b=o93JiY+04M4lnqy1461SV4e0k/iEhibmIF5sOTCNFML+Amz/kXQFkn4VwKPOJ6276Ac8/qcyKn2pdr1EDMqzbf/jLqYC81bgKg5bf53vw8Z9/+mjC3xc/sIlNWg3m2NwElxyCOfbS03WWVR2ixngScqECJFJ0yXCnQpEGfzSiGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132619; c=relaxed/simple;
	bh=SbBWi7rAu2d4dqKIgQF1wHBrOqOAZBnCc5ssmW97zPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qs+3efBj46yFIJKy9gQC6Sf073R0B81zIzJ5ceh5h6oO6cDwUSx3Bx30tcoRF1cXTmLKAZc3+E8VNHWAoM0jLgSWkxXjnYCGjKEGiRSrnmqTOBCW1ffUJ3BQETVbkvjLC10L+9Dpup0Y6CpUBmYZfsPjPdvrfCopdF62NxnfVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GghQcuj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUOk2vt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GghQcuj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUOk2vt/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G5rIDL4126289
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q8Z9/44SQcBcx5h/zSBNc6
	T9xEkCG/Pel3ap2KBOJTs=; b=GghQcuj6DT+MkdKFX4twfD47S+2ZXIsxHwss0y
	xFA/olz0732XFMYGhbDSZM4Cs+Dk3U2FFl81gX9FvccJ20RXI+YzsABdTtTiwPH6
	V0igMh1TNZzt0v5LY07hkzEzhLRR2YRrOSabT1d2HXm+Xmk+iiWrJ82kht9Ivsk0
	gI8rZRHGhG1kQEAuXgOdwqDiDtOxmU60eEPRUoSfWnLW7rPQAf+n+gUpxIvpN3QL
	836nqyYSlp1GNvPhI4ris80U9inwPZ4FmAm06UCQoYkNiiwtGp+GtakuRfXakNJc
	oP7ck56S1c1GlhRvzzE3IxuXrq//mBWi4aDNVjAKCMn65pQw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m33ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:36:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso6394383a12.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132615; x=1792737415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8Z9/44SQcBcx5h/zSBNc6T9xEkCG/Pel3ap2KBOJTs=;
        b=LUOk2vt/cK5d3OG3OP/6lXaw2Uhck8dBBmYW5YttNjIWZqykK79VojIP/lkWKjnPJd
         xtISAYGF76DP627Mm9U4t3JsSAjbFaYU11VDjtBfkwlK8vXepf72Yre88YxA4NgQtChd
         A1zXvrcyNvUTUFDFU2rUFlwafT+/f+yDDwjCAK9lPt9osIgAMvwov/3cViKy5DNagyBa
         7l5nOo5N1DjjHpErlcVl7qvdGugwZ1KEeWAMF/vgP7VMUpMJlr2vSgI3bu88OSMT0qAI
         KjSx26cQPRzTL6opAYkouIUPpagU1JeCDgnofUUfdnZ4sNPQtjArMAOVpen0suYL+mu2
         V0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132615; x=1792737415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8Z9/44SQcBcx5h/zSBNc6T9xEkCG/Pel3ap2KBOJTs=;
        b=do0JXTjWV9j7YRgS+/pSIS4qwb5Awv0MXR3WMiihxRzIcIEvJ695XIPJR+/c2vEGO/
         FOd8IoKPdu5JRCGnyfCspcUBN7mexmjDqqXGCLfmgfwPo5p/tfadzIPd+rErFbTt4BW+
         uIx/tuDBYtVW3bYynIjye2eH2kXpfAwUviZaPtKHL2pYmb0YXOtobymFM6qtd8U/2gbP
         RYNhsDUT8gVlZVte/4PvuIlag+GcnWf0klGuZovj3shD+IHwhrdre88CoMVs6CttUTe3
         LoqQ0dPGS+Af384L9aCGFE8B9lXjMY1tPXxgs83Vm/TYYHbI/fesjqSfIaLhHwKD5QR8
         qqsA==
X-Forwarded-Encrypted: i=1; AKwUvBw5xvannmhI2FSB7hpbURtH13Ps3pfYs7Sc5iKNW8yThkN8fTIh3jO1xHCRjCISTdjsIC0fOh8yKsZv@vger.kernel.org
X-Gm-Message-State: AFq9FYLLjbcIZghdf4sr0GK96RIXeA105XoGwqS1EhknIu01NuClUEGr
	D1gKebysJYwYOVgLsCDb9RJBG4g7TucIYgWf8SyEy4qCR7wVQ3gplmi/5PSdacJmzIWT8FS+Xh6
	7VKvq1LYf5nLQmmiw+eQTWDUJtJLdVvDjZd2oHCgyfF3i2B9Btj54EvIRcfMD35jr
X-Gm-Gg: AYBFou2b5fiGEs58XtRUEIF5PtnK6HD0FqDOPeSrY4fbnZzhOEuj6SnJBwJ7vry/NH4
	HD/kfNJp3wRKBU9i9HftYh4KJMOFS2fZRQ0yVrHyZRUO36jgcax/AaVITCwEAvYB5fE6+QaMeka
	NI6mM6gmtHmcysaNQ20WNctLH09PY1n6EFHscZRbm6d3FkOjbsNL7ihKfxRd+j/hmAnUX2bMpZ1
	fuzayLMgOdYxEiaxYmeizF0AHDYrgu3k6oVF7dTrthELtldT4CRdYrxCUHe/8KoHoHxK2I6gD1V
	LKsGDDByKQm6blxUE5aNr+lfQiUrToyYjEjzPF47ehIsieTTQp4iqjWGYV6NgVMFWe5NXItN5Wd
	5Gz8b0DhqbhsiMLmF/5CkuHWdFrsKL+I=
X-Received: by 2002:a17:90b:384c:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ab3a735fd2mr23121508a91.15.1792132615512;
        Thu, 15 Oct 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ab3a735fd2mr23121474a91.15.1792132614984;
        Thu, 15 Oct 2026 23:36:54 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:36:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Fri, 16 Oct 2026 12:06:45 +0530
Message-Id: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7F0WoC/3XM3YrCMBAF4FeRXG/KZPK32at9D/GiSUcNWLuba
 FGk7+7oxVLKloGBc+B8D1GpZKria/MQhcZc83DmYD82Ih3b84Fk7jgLBHQQEOXhdO+vRXaXfb5
 Jp5Wx6KKJgIInP4W4fnPbHedjrpeh3N/6qF7tCjQqyWdD17oIRF34Hmptfq/tKQ193/ATL2/Eu
 aEXBrLRmqgCfhIkjyuG/jMUgFsYWoI0hjAmqz2kNcPMDb8wDBta7b0ymrwN8R9jmqYnavV0eXs
 BAAA=
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=2079;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=SbBWi7rAu2d4dqKIgQF1wHBrOqOAZBnCc5ssmW97zPc=;
 b=VS1o8OFndnIWvmaRgXEEgPFHVS3EFhV4lUdzNEP8pErkH18I4Bsx9tmaHsYIA7VqGoV6Gtht1
 BIye6BW1sAJDeaf7z6Irp2xiIqOAOQLhD6L5umNOrSke39THQpys3ti
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1c608 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BLdeznasY9QL0IlsjIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: rvu31h_foZjpfB7FX8_7MBgfhA4LjNIG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXzT52ahJAgcuY
 MbvRFx9Q4NdRJPryM2SQr9QpTwpi7qpGz4K7OhJFibSS9TSRcxZjhnpfTJ6kjFNlx+xQZKdzhEN
 Nmw2Tzh71DDOvsWdgezcI35wlxVuLQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXzHam9xoAi0BV
 66R8jSBlJycQWtiVIfWZWkFAI5sNsWYWFROww6i1MnQAlzEZNdwSezQ2oDpcZnZezbFWy6SEpnJ
 BoQRTayjDdBq0n/+27g4KJpZln8WSix+eiwB399Q7WFdlcc2LqGMn93s5Hu2zwMs5Hin3llr9Yw
 ScHFmRAAF7ZoA+0ERWn9GAdoO0e3wWH0QkcCZP96tny0ftxlR7x5MxuMDQecp6NetcKk0NbfY/p
 OJYMmfWg3uPqct207D56CwS561fBPdash1+RUysEQaVlo+AKNn0HyOfxR/6IEvhxvKKQWxGeDBf
 VdLVtg5Dp728Th/+NNZVVWbXTfykCwGR2TqFwH6cBvoCTxyjfycTi59JxudyLqoS1QE1Ubxo7DU
 oIfcL7OlWSoWGamEu2CT9SRHIlS008gdP2LdHR/hQ+WL6Kz/3/ZPkg8lgU4djmrRYOxXKIP6jcE
 ALOM/zDqbPBfbVWOawQ==
X-Proofpoint-GUID: rvu31h_foZjpfB7FX8_7MBgfhA4LjNIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v5:
- Write reg values in hex notation: <0xc>, <0xd>, <0xe> instead of
  <12>, <13>, <14>.
- Link to v4: https://lore.kernel.org/r/20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com

Changes in v4:
- Change [0-9a-f]* to [0-9a-f]+ in the binding pattern to require at
  least one digit in the compute-cb unit address.
- Link to v3: https://lore.kernel.org/r/20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com

Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

