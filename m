Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414A425CFF
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485054; cv=none; b=iVv9g7oVGST/kct6YmCgaUOFIYNcxh9RHf3VrEMM4VF6+mv0hv6H/NB/oOD5McEHSSz0jaoNBT1NRRitSlMSEd/7Mg6WX2TQo8Koeb0DXoWcO+3QDjWvW9vIpoS13NaXNMM/tc7re21m2AM+SOWvGRNyqM1U+ytrjkbZwZZ8zGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485054; c=relaxed/simple;
	bh=Vs+9CbuVD/QgRSsN7Bgck8hT5qPQPlXEkllEYE9DOgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=myMtWwyPwkuYu23dTX1Cp290Dz1m2QwHS6UqKON2uPIJhpQi9Y6ePJDN+36sVtX7SMWIkLbNseQb9aFvGa/xNRsfiVmvGLuxAb8fJhuF8SrWK7xa0F37pH9GHZfZ3wEbpudfcQJa3kTTB+IU3hGMfE3/BoUXhH2Z+cq01h6F2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnrAniin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlQ6gc+R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnrAniin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlQ6gc+R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536vClm1755426
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/64rIzA/Pb/Cnm6v4Tx5KR
	XT2mXNM2Pr3Na6j1LlbsU=; b=SnrAniinvhPxcfw33x/RrnXwNsFr2urPXQMqkx
	BuSvZv3l6oNamCBe7mfn29F+UCQ/w1fF3wBQnJAT7qmsXTl2NOt3GMBA86kVKAlo
	YQ1Y2NfGFdz71OrzvjmladSgHQuV2mDkqdRyTDEBB1tjA8GEnDRkLGTcLPMi9/rb
	ch54jYtxEskw8JY+wg0hLP5HS5q56xI5YsgegVHval5gFsPNNhMeJ2GVhnriaofY
	+0xH7URMoJIWnMyaoAhpiBwV7M9DmZ00ye8Po0v4UkSpiCgwO+M/HvBKqo5ZUsAl
	AN8shDFSLAxDJX5sFC9jYlB28yhdoP6tYyG2PcrNGTixBmLA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff012nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:10:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a329928dso4698093a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485051; x=1781089851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/64rIzA/Pb/Cnm6v4Tx5KRXT2mXNM2Pr3Na6j1LlbsU=;
        b=AlQ6gc+ReEu/QzDMlW3Z5vQwwfL7Jz85HniyrlvCNEnJbVFIF7g85N+FwWDPa44P4F
         wd41zQIcZo6/UM0ndIbHvYsaxRfB7fVWJgVcgS78fdgAZrlEVc0m/UMSn/7AXHr0QYtS
         ERsJ2/7BFOSsFFq7L5Mq+5kbKg4Bht69/lb9xHwQKTggjKYRe/nk9DNv+uFs1iPQ7eLL
         g8GhS/0o0MuEWOUNqe+EpM4suxr6tbnEM860fYiTb4U6vSdCzxqSshghwIgKGMpzo61U
         4VJQkzDP7sN872P2Eql/IijC5DxXoSVr1VXee+tPcgNDXK0lk5v+Vm6mxeXVhVndvKdf
         rNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485051; x=1781089851;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/64rIzA/Pb/Cnm6v4Tx5KRXT2mXNM2Pr3Na6j1LlbsU=;
        b=fNABnXDUkZ21MN6hGneBXrqOdOQRDM5Rf3eBCCAL/lxT2T2WIa5vSk62DMMp7FRlx7
         gvU4WY4AWFJsaX5v5trONSkw6Hx25Ht+JlnLHjknQT8qdRaj2zYNDNl/hnQKI4VV3Wrb
         cboIHHyO3p7bhuth+Wlzc8ExlCHaSyZ5haHud/MlRYOpQpyNL3szoxkWcjj0TL9rCSy3
         zn+PrdFvlS09ewL43oad4h74KbQrBtrCOQ8gNKcYa7TuaqhOUSDMNMdAJWxTIzQKyXyZ
         +u/mmMyAr6Os7oDncVwqfuGEv0sOAtjUTJi+O5ZNFO3gKqmjvUv4xlNIcSV9Vr8OSEkB
         fIXw==
X-Forwarded-Encrypted: i=1; AFNElJ8q0B5dVGZHECLcN2Un6qcfcLEQNDfMba8h0ICT+c3CAEb7xA4PAfYqzzxF9Pl1gO62V3v5zXF3zQI2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMjGCcWfYpJIngRHqGKC/0pKcwd5PchSxJle1E4Ksh/e/yeGa
	+gSlU+Dr+AOcK0KyBm4YkSUa/1J0iEhIS2z4RnrfG+p/BG/ZKJgJVTXhcHMdrQXGq8/w2iKVpMU
	rF+Wf2x/t+xwPM4wLdGT7aI3WMNLeRSWrrQlJGZsIs8CLiIuSVgrF2AR40bKcjcTh
X-Gm-Gg: Acq92OFuLcq320rJmSAKIhwSrda67ikVz7Hpi3JOLvZchG6ad25duAWSz0NXGFO+4I0
	iHtsXJXUvFtI5ABROz8GQKlu64HO0hnrfdTvGWQqIxoE53tYGK2okX1lhIiNZhck3qf+EnAuICo
	Txuxa1jTCpkK5Nn0sdLyaDsL/woI8YGrFTB8Xj+d5+skuIA09vl5GNQUrWesHq/1jYOkVroGZ05
	YWcsXdnKmOrPL2PMoF5YYIZO+Hz38PtMc5Rrj6THDR8eRNztJutfyNm/27FKi7PITwJy9buh0Jw
	rhzN8YXhOIUxSCINkUIZkUiSRGCZHD+gNdpsR5dCtj5hqVy8iMr5beYAP2lXG61+eQ6aq2nghDb
	vo6isq8sB4UwJyZ3agtHm0QpT4LLOe7c5NiWYQh8ojU5K1l2KIEHTmLY=
X-Received: by 2002:a17:903:32c7:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c163a16f5dmr30956375ad.5.1780485051422;
        Wed, 03 Jun 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c163a16f5dmr30955865ad.5.1780485050900;
        Wed, 03 Jun 2026 04:10:50 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm22148805ad.51.2026.06.03.04.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:10:50 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Wed, 03 Jun 2026 11:10:36 +0000
Message-Id: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwLIGoC/3WNQQ6CMBREr0K6toR+WkJceQ9DSMFfqQLFfmg0h
 LtbcO1mkpfMvFkZobdI7JyszGOwZN0YAU4Jazs93pHbW2QGGRSZAsmps0+va5yI6j7nCkAblKY
 pjWJxNHk09n0Ir9WPaWke2M67ZW90lmbnP8djEHvvrzwInvFGKCi1zAuRy4sjSl+L7ls3DGkMV
 m3b9gWqcqPTxQAAAA==
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 9o37fibisjgPJDAXCM0IdlZpoJRifXDw
X-Proofpoint-ORIG-GUID: 9o37fibisjgPJDAXCM0IdlZpoJRifXDw
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a200bbc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=r389I4eL0Z4o-6KvsIcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwNiBTYWx0ZWRfXyuQeL1Fsu82f
 kiB8YVD4nH8U3ME71i74JmkvaDQWrHPBk0P/WzCtIZvRytaYMVBjqBLNHSZNvIq22EnQIqlkFLT
 +Ecgqa4LoLDuI9wrX/CBqlQCWveaCYszn3Sl0wAdFfAlmBXGL1g9J6Y7aDnIGOssrQTTI/dOks6
 QUsPPFaYF8DEhcrbjXqGfQ/WUfIFQeHrUSsswGeS9tlRI/nWmpgk8tnV+jWO5vyyytQ8EbJpC5i
 M5eJCk01d+MHauSSJ5MCq0KUf7cELNnreb7Kxwbh9i4k1WCwS/GrH3S8d/Nbbu+O3nGDFdrSrHs
 hsoMDihGlwMVXEVcRFyqTuBvwjvG94UFIqKtE8Ln7erqCEhnEbbeUqmkK5ZlsHC5+E41W/QAZ/v
 jDiuP4ai11xhKXhU2k1N0PoKdx7x/RFGE+cPD6OwVMVH9s94Tfp1WfmClJJ3Up728kiebFgctXY
 x5LHGB6vCrQ+09KRQTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030106

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new compatible to represent this constrained variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v2:
- Use the existing qcom,osm-l3 bindings to describe the Qualcomm Shikra
  EPSS L3 hardware, as it is similar to other Qualcomm EPSS/OSM L3
  hardware. [Krzysztof]
- Link to v1: https://patch.msgid.link/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,shikra-epss-l3: Add EPSS L3 DT binding
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml    |  2 ++
 drivers/interconnect/qcom/osm-l3.c                       | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

