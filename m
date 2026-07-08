Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EB637996B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535125; cv=none; b=FTmoXqaO/fAErTsmIM4aBz/vXAexyLivJSAuyLjSROio8tSYt0H1F5fidDzktZqBuz3M7r5pRynRV6AsdGXKW0G07gkj9kG6UyfQBrImkQ6EX/FCINoxr54N5/iL8tvaCZ1X5Qt088jnok2Hs4+W6LvKTbF3QXt1V5DKGfpxSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535125; c=relaxed/simple;
	bh=xEfWcNodSiJaimKcnO8lld02aNd9L/RRemVH+bXC/Qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcm1DnaJbLXReheOaa4KkhHQX38j8srKWJibZvJvW+DdD5jEdWuUqw3oPfVUIbDF/GT/fZC1okhl02q0u3b04GF95ZtU7eoZGUVN9L6ocxRlctgPMWIAltTlfdcrkD22QV2O0x5aRVFlO5VZjctzmtRayLAIVwZLhq6xcK03cU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0J2K3OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWMhLB3G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0J2K3OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWMhLB3G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL9Ke3125820
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 18:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DlOq9cyGVjo1GSBmam8JHq
	IncEW7Ur5TJOCioZSLmxk=; b=S0J2K3ODUevZxf5v5BEoGFyQz+DKj/rkQbuwUF
	KNRDtROjiI1QhxDIAaiFI3uH0rFdi+eKjZN1x+P+G7LocbzkcW0j+Ut3U4hvFjXp
	1wUd551D5kA4hghQX/D9/2m3T4L/YO1BmdakF8gMWgf0jdqlj0r+/89ZZJYqqyAK
	spfo9WzvZ3XBA55Ox99QqBBCtGsRbWkOxW6qE20A8OfLzUshJPl3XjwxMUDg/syI
	7UySzfmvn1FZFB9NtyuJZlDiF3+hhraP30R+iIvdWZAGUmC+W95NgIWWIBZv5NJl
	MakU9FAOh0m+MoRjF8Wuq8YNCwN69IqCEBBSzfxPFccsAheQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s9gva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 18:25:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so23355745ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535123; x=1784139923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=HWMhLB3GFwv3gwJV6vW8loRtFqfhRkfaTj0z2jkRKPge2hBNf1xz8Ckb4eWzafv4p5
         l19V5pPPUNSUdnhUXxgEpqZ5BBdfp5Y+6lUDdTyxOxrefNay43gMKurPDyTdzU/hGPsW
         5CDQ2+gQlV0Agdlo2WLBFMZlNN4aWcoIcljMzMWeQpH0FRs2bIp0Yl6HLlWrEXdH0kLy
         agQe5qG3fyeVgpMzOQr+BUYa+FvSjW5G40AkaDiKeMcaHz1uQ0fBcwgN6LOv+rEDpoSU
         HY9LRi4W9/LDsxA6Y5iXUwS4Am5vzFUEAK3X+/TKLiztazYB8rzMxo7pGw67ZwQatxvc
         Fcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535123; x=1784139923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DlOq9cyGVjo1GSBmam8JHqIncEW7Ur5TJOCioZSLmxk=;
        b=n5lp9aHHkCy0/M42JTG3fdRRAFrBOkJOF0TGUsvNSlhO4Bl6AKuJULZvGGLTTniMZj
         6gLdBScPJIPCNti5QVM5yeRW4+BQt1H0H54h3HpgonikyzS2XMXs66OSidA1wSB1AECN
         D2fjysozKeMk9Z6RNeraF2bUyog0eoti48QDxxGkckA54sY8OCeBhUpXx/9g3qNxwd8m
         HnynpSdPTFRXhTzm7adhPUtep5F/KJ4H6iC/1hNjbLAXMWXsdj/QVPHSHTmMy5dRGPDN
         fu/2g1snWtTet27ZXRAlgbzRFHVterWSMAtbPuxB1/J2TzjZOXpaejX30LxoQqzuK02p
         ikdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS4l1OQgVcUHSZ7qjUnxHb9kH9EfK3JsN4/EE5M9GnKdhlCEYR1S7FMN/2F+fSiASmbT2PxBY2Az8s@vger.kernel.org
X-Gm-Message-State: AOJu0Yzajp0xtIfOwU38dxeRE4DZ4ZGdZiUCt/V+Aaf4l5p4WGw5dAQE
	9EsA/i/PFyVevgp1dbUEMfde95Zw64CRz68qxoFOpSwfrlQC+UOUYkyVXlIBJWjeSyVCA3eUfx+
	MfSpmPzJKHM3zy0vt0K5UkqB5Mzlduf6AP++lM2VjFFUCe/lzBV7ooS8VSxnjS/Om
X-Gm-Gg: AfdE7cnuD+xZzfzCZ+UmnJFj0COTP5GQw4ko97UZFvAOm+9tf0b8g2DMXwNdoIZK3tx
	pYx8G+WA+4AuHlBzBp6eB2MJops/knhxYOi1L4G+aKKei2g3NzfNiaFH33zlaywfYAUmfi5gwH+
	IKAzLkm39mh+Kq18Din1PbT1oQDdbS7zz01Wy8Ou/3k4lvW6o6odnbxHSTae+c7I1qQ75xA3aHr
	ltJ7qiMMqlVi9cyt6zWmMxtOJ5ocUZqhFtGkr6tdu0z2rxokjYg/9Yqc9dCNE4Pmzs6cW/UANVR
	dGQrqq4y5Hw2r9gOVZaDsRvh3K0wg02OZgnCe/nIZUfcQazNhzB3qGyWvYTR9qYjgCKO0smQv/w
	TmCLPwgDOSkOix1BZQLgk/zE3tnmLFwV31BU/TQUYuw==
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4360027637.9.1783535122736;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10e:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c0bcf49b71mr4359995637.9.1783535122275;
        Wed, 08 Jul 2026 11:25:22 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:21 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Date: Wed, 08 Jul 2026 23:55:04 +0530
Message-Id: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGWTmoC/32Qy2rDMBREf8VoXQVZT8ur/kfJQo+rWCSOEsk2L
 cH/XtlpaFfdXJgLc2aYByqQIxTUNw+UYYklpmsV9K1BbjDXE+Doq0aUUEkkEbgM8ZwNNrOPyaU
 MzuFOQIBAFOOKo2q8ZQjxc4d+HJ86w32u7On5/EXXpA3MqX6BTxWYb2O97nIumBLNwYcQmCX9I
 tDfXj9m0bYvs5+wV8JrxQWXXPaL3AzWFMAujWOc+sa14CxlOhjGhRRUG0apEEzo4FRnpQarfcc
 V2poPsUwpf+3rLO1e/b8hlhYTrACkFYF6Tbv3VMrhPpvLln6oBx3Xdf0G1Iiz23UBAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX106k6FGEZPvN
 Hc3VcM26IX/7IOC+1zPMivdEGxyYS3lKiarQT7HiokuzvdNwDhVB/9eN7OKjiIA80DO87yiI/gi
 c6kHYcSZN8+AS1hNnA6bvPoY5df8xzGUjlwv/3KcNNqRTqEFj9h4VqIsetuYbyD7LPRoeR4pIqV
 5MDspRAG2/y90ZuxuBZ+kweKkDhBrWaYqGZebCx4XgDh/g88Tmg+QzcCiDqTyIzicafIe34n2GB
 sSxoyFtTkIcnONGc/2tmUkj3WgJ7L33x/Kh7rIzad/bJnNWpYB1vyzTZFPsqWcGfc9Zw5RYLJIq
 rN1wy/Nzgqn9FuWvxS8Gn13eMYWWIdP+G1MGDXCkazXy1ZYF6j5Mnf+JyJpNbo89pEayULxbpBE
 ASmKcFcEPg3+45qeo7nhTHfP3jnpma6zpgq6ucfVP32Q98gQ6VeuMX+pO3rAq3hrAP9PcCBEZ95
 DUzL0PhJNZNOOErppLw==
X-Proofpoint-ORIG-GUID: xe1zDrl1CQ52ySj3k65SSkn_MIWzqMwo
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e9613 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tvEzqpDY3YWCjbqCEX0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX992roXhJH2/5
 5HMU+55bZjXdrNNu24f33KWdtbJ2iOG90aU7kXOHSLp25OnhgS5GrEHySapqVkMN0UhA8GPjTww
 YnqLA7xqfCRfsB+v+H3iZDPFUF5V++A=
X-Proofpoint-GUID: xe1zDrl1CQ52ySj3k65SSkn_MIWzqMwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080180

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
Resets support differs across Shikra variants based on Audio subsystem
enablement as follows:

- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC and AudioCoreCSR nodes

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  90 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  18 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 809 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 1002 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v6
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

