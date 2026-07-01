Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471A41B351
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901712; cv=none; b=JaS/YMlrYgDLhVkPmT7m04STwAc6a18LBYTgW+BRiaPHUeNJ1qzM/W/wHWThUGCvgeeyJa+bmMoZrYdFcd7NWHQnF/+NESIVzETeCuuYcJbQHSSJvZxeu9DXNVhIyTkfuhS1LTxyd3DLF6y/beGQIyR70fKA5qbnsUxdkEU2fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901712; c=relaxed/simple;
	bh=p6/rbiH0yy8V/Ev7NvyttLP2qzs43HvqjCcMSAmF2eE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YLuDNG3tso3SdaTk6RB296fCNT3KrbbQbJyOVlGugqpGC3YGGgfMwfSz8P3SL6MHPfZd80Gy9W5JUi8vAYQn1h73hD24cEmbkF9x/JD7KgqCJqjbFXWI9CeARZOtQJHRgpYgUNfOvczkAc+pTlg87fuhD6kO3pd9/ASJuV/B+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URoN3Afv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j//Evr2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URoN3Afv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j//Evr2u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WDr744296
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vkf6H4xF+/bBNFoTzQu+NM
	XiBTVIE05hAp23yXjsnuc=; b=URoN3AfvJwnKPPU4sFjL+i0VJ7YFm2V5Y4sWWj
	jVItoJ0EnTjXB//W4P+Zq10f1NX3YaKKn4djzRVEz/HFy6b5GZBxdYPxhlk0JKK9
	ckSfHIKn+nbjq2LDZ9ge9k1jhKSSxY6ICsQ32FqR6YySm4rDaOcJa5q9OhF9GIl9
	cARjW7fKW7xn0iInY9az4BmLwXWg5D/h3CWjR9nlKCKgE+LalbfzZg7BitdBadDQ
	opYgZ9UUAmY8kE89UxRfU9JeArQFOvYRUaHjNAEXSNp3mxFScgUeygctUEqOsuCe
	2QMvcbjfV1xY9cMMESGEOYOvucxpvyu5yjJnMZqIvZCf6ngg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgyks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:28:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9127e316so547390a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901707; x=1783506507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkf6H4xF+/bBNFoTzQu+NMXiBTVIE05hAp23yXjsnuc=;
        b=j//Evr2ugMh/y0qn0ai17z8DjTQoMyK9o+HxdVs9JkHD/9MfJlAjRr9vvb+qafFQPr
         vbo281QL+9dBgJp8oAcY1C4ZDkaHT7DptUfnwLL4iHfEJS8Hz+T8U2V0dnNMhvG/jVIj
         BMEhg2ZZ+a5SIv8pejDr78EOiClnOgL4W9aSKkPXN7o6tnrMJlH5Qear1xsMow6Q132R
         oxUrsKDtdw9w5w7igIXkrLinRxAx+WY3B5GIkcai6gK6TJLqRWQWsBPOqc5/CaJ4YPUp
         H2NShKpjQM99B1DXZH9edDk2XLJoqfX4d/5mUwEgeMm0rbLpM7RRrgm+RemmRfJH6hjq
         ZS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901707; x=1783506507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkf6H4xF+/bBNFoTzQu+NMXiBTVIE05hAp23yXjsnuc=;
        b=TT1CoRMZQ6JR/FgKB8JmQv0actYM1TOKvfZoE8zBOb4dZbBzR56XNt++sQ9cz5fQq3
         xK0If1Z/ZTJNTjz4zIV4r8/9zmDTkzrk2AxMYMyqEaRf09AhELKDiZFVa3MQWsdKlTFa
         KhYRRp0mhn+rJdv63lHHTaAb0HucMGSbd6ZtJBgaf/BFsm1xnm/n1S7nPjJfUYH2CTxW
         oxidqvLHYO3L1pxlSiWQIOVP7ly2+m1S/pKTut7hpSwtm1zt7rj4rTG07iRnqMN+3+JE
         WnRChbhaXBt6ASEBH0jdU9HfW/KwlVs775dHAxznk4ZpPEVHmedT4I8SEtj/XW0FXpmz
         e5Fg==
X-Forwarded-Encrypted: i=1; AHgh+RogbFDN9ypd3V+BCU5TOnr+KSFtyeUZ+JT/5Kq7SX/zMmv1QlK27x3SFtJyPFrFNoMyWl8p6Us14X6S@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlkv/FBNhQWdqVmOeEstE5WxO0PISU7MOP9eU+TjzTRiry+2ws
	H4Y0Y4McFeHz9tA+IKsPSICv4YdatothEADDZPzDDCyT0TgEPAtwzzl18xoAkQbfOLyPb4zRHgv
	bY36gWMPMznP2ArEz1p3JrrRavBfLexH9ylvEn+mzAxZwltDjbI0aJTW/PglxTAg=
X-Gm-Gg: AfdE7ckk75osuXt96VObNNWu77G4MAv/xwN3RNl67imDjq1vOm19AMv8u+7vDgAzH09
	pfasiMn7OGWSmQ/6Yuk/FTtq+WexKmLE9ii11lqImS6bRlDWva+4pchkbSBrMC1tPvHEBz3eUWO
	9/bVURLNPXFLeLPe8DlOiWKH0/YWxS2oe4kF2D6zFvORTundDyYB1r0ZVLVkcHRV5O2pk7jl8Od
	Pq9ceMzqj927Zp43CKdTpIxZ7NHtiMvOb4vPM2PIzWsC+AuQ/3C87zOoq4bvuRn9dD3hFwKlTej
	E95tJrzH5Grwhyty3XFJTRd/hGfInN0tqxlA125JEW2z4Q8rQBkAqGQbUA5RXnzxg/xJXWD3j79
	9cXYtZQ8IX0nJyYIOfgdnpUIqz3PwS48j0OCiG5OJ
X-Received: by 2002:a17:90b:3c4f:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-380aa1c973bmr1005973a91.19.1782901706731;
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4f:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-380aa1c973bmr1005944a91.19.1782901706279;
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:26 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v2 0/3] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Wed, 01 Jul 2026 15:58:02 +0530
Message-Id: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLrRGoC/32NQQ6CMBREr0K69pO2UkRX3sMQU9oPNBGK/dJoS
 O9u5QBuJnmTzJuNEQaHxC7FxgJGR87PGeShYGbU84DgbGYmuay5khy0tfdlqoRUELuVIOAAZ2U
 a1ZhaY3VkebkE7N17t97azKOjlw+f/SSKX/vfFwVw6GsrlD3ZrsPm6onK56ofxk9TmYO1KaUvz
 pI00b0AAAA=
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=1329;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=p6/rbiH0yy8V/Ev7NvyttLP2qzs43HvqjCcMSAmF2eE=;
 b=W/leEBvfrtoOeu68dfF32o4P5IKBubHrLO/qJuo96qLQlQo8taKmoJF2Klf3n/8UCd+jEfC5w
 Rw8yhqhaK1wAGijDHnTYVKz8n3XzkuWi5Eaa+brqlT05TL0Q7thxVgc
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 4ZsSTtGDOJeLDX-cLYgV9f9WkIs39WAU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfXzToCPFVam47J
 4LZ7ar9pXYSnQ00pSOUpubfz7DZiaIWJGT0I6/JdgTpBKkfxqfaQscPIWEenwCSyEyJHhrh8V4w
 eayUcr/TTuCgVUxuyRElnqY9YyNQgNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX5ed23pAv98/6
 aSxovbT0a6aQVGNLjR7K/fK/D5EmNjvY2aN44Dtxcp5N1zPlFSqnI2HA0lsZaEMjZ0WGYB07LG1
 y27XxH14bUmcvgqA6Qs7zIqkUMBANBKbt/Va1LaXY1dIJfA5KlozdG+xEnjDlzZjAyVEkGTFlxO
 psU2L5Ho9K3Spanw0zDC/4XuSvNOPIiX4Mx0bXIUSpcJ/ZmqS4a0Q/FXaDx094y7L+vqzE8Yive
 zfvQP22HwGZobkiHrGViGZMyla1owDQElzjy1X58vLJqqP13p6HazaW7j/Tf27S75b4HcvRRH1u
 DV9pmo0B/yLZp0rz2R9gyPiTO6KwFexlPUGgjm0D+KZTH/0jw6uYVvSY2MaPm1A0pLBgH/Fhzsv
 pc6ZvP2KoNODZ+V9pDMct7/CSMnqhu1QIbzkSTZ7GAfKR73Ja/DBlX3YE3aGKADKkUMTkfUQJ8g
 +lVJfOuWUUjN5gLAjLg==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44ebcb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R4MlLg9bFeQ77G5B0twA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 4ZsSTtGDOJeLDX-cLYgV9f9WkIs39WAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
- Fix the registers name and unit-address as per Konrad's suggestions.
- Use microvolt instead of microamp for qrb2210.
- Link to v1: https://lore.kernel.org/r/20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com

---
Rakesh Kota (3):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
      arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |   4 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   4 +-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 5 files changed, 138 insertions(+), 24 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

