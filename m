Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CA3A48F4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079173; cv=none; b=KsOfY2B0JvT02bb0ei11vHzYGqaypydzPucb86NbJfsHLXHl/9JcFkvKyrcR7cb/sJsDTeKUpqqbj9wtt/ZuCdlhYZImCkCzTk4VVKqGQwLqsw4uJ3CsANfxbDx+jtoizVCXAsszXDuC4XEX3n77iBNrHRmTR8iKqmnRjsZBUa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079173; c=relaxed/simple;
	bh=7VWPbjsAj3atobvSe+7KvejJgMR926itbAPlgg6gfgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p9Vm+YPv99+hBs0YJDGWMpYgcGoFlizfrhmyid+Z0R2umlJDXce/UbSJaxUTqD1Hf/lB2vSxc3gYZ2qAoMcyWTrb4I9oyI0GaWsm5Q1nPFqlhW/tmjf1GTPfw2istsBi1s1GcFWCnRInQAmXtsXNYFyv8i1mcufkZJtlhJljag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIqMvWW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBysDmoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIqMvWW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBysDmoW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iRL3867243
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e
	1GCqIn3Q=; b=bIqMvWW7ZbelCa0elJDk09VqPtQNLo37EK6VW6JJeqhmi9PWfpK
	aDQmwp4E4hB351fvgZZEhizxTjX/eZmH43MyEQ2YeOrHJ6F2jMJY1UWNIW8Vz/ZC
	mrAwaDGTDurDjVMW1qXNdlWBTo2ULmr7ZXhGXKJ+NTemSsIrIYxWohnF1xOmnrCV
	ZA8/oFBmU9tKQklxBoS/dE497qYnd6KfuMz1xXPU3t7zxkr05BQZZKsvMB8Dm3NK
	83s97F6HfZtDQPn60D9museUOSSgkTbRhBpo3T42v/MTXRkNZAP4EPEBqDZJU6WM
	kA/FmjYWZdskzwxHz02d4MlV4HHK7wgm84g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8u67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:12:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2b64850easo17422095ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079170; x=1781683970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e1GCqIn3Q=;
        b=eBysDmoWT7gK18+bx8cQoQRzKVKFbyvt+SxRYfF0RM1LpZry84fEhQisPEdMvHgbjH
         Ly9Q36SKZ8BXE+oWVaJRI48Mbsq1beh1eLUw5wuUSWWsd3Fqo21PrSRj9xAA4hYkWWic
         w8Pj41bYGs1I/D91Yd+VVaXi0eUt8Jlk2XbWXBIxygKXKPCSTJOuU2hQy/WNnVNjR9Jd
         NiXX9XW8PDFjHCD3ZPlbmbklKhJMz5nrpuQKOTVGjAT2gf3IRbut/wQJXyz23MEmE539
         14i0wg7ZhWk4QBy2WfXMsN3ybbo95Nxoiwr4GejfpWQiW8PuO6x8hdHOtcc2j3rONVET
         czaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079170; x=1781683970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e1GCqIn3Q=;
        b=ocT6HUGAxsnrXO1T8djvvucliRe8il2i6f00k6vN6DtjDWYAUHk/5y+Kg9HfqYuSR+
         r/Fq3+008wIUVM4aO02NeRBBpx0QHmHBW4J393PXLbb0HsPz7rUgDH5il/cIoNPHDRMY
         P4V9X+HcAYCjQUM0ZxCekOOX4tjsvr5sF0ONhETm7kAqoOmlGAsWya9SsDCWeFZmCYY/
         PeEqcpj6x0DK3CbxNsX69w/hkpe66XaY6wx4L5Lqxl+gRWlMIUSUSfx4IxJvIGUuqNZn
         Fyp0Dhm5PsgrEc2A78/4HOkJux0sIaJLYexX4Tj1915M00/VhS0wAZ2m7Qu6eHpAe24W
         urNw==
X-Forwarded-Encrypted: i=1; AFNElJ8aQlieg5oSTEhT8J/AGy3ByXxcNZ+HV/5NPxikoBnyNx732Mw66s0fJMMgdRbG+5l1brVNE+bpYkFS@vger.kernel.org
X-Gm-Message-State: AOJu0YytlMAnxH8CNbrDLPvsQMafdfNsrxBS+9wK1E2ucylHpoTyugxt
	7J8gbHRjLGnYvRo2CLp+zWnsuvJMHsVRYEB9iMcmrAFDc70GEN74pyUThNW0rQx9emqru1QFVy0
	WMGIxmSTjtqrPcib0y3+zi81lAzUtXsOdxM868XlA0ygsr3E1nVjKVjJWs5plXBbJ
X-Gm-Gg: Acq92OHEFGfMWNmLOX4MCSIcX1CyPYKtp60MuCdkiBTbY2fbmsq3izOf+Dwus1i1+4j
	mr41XsigxvfsljlLq9QIxv9vLAulnkmGrANhakj3ZA6cbpYrHKKIZm5yS/UdMTu/J7a2wVJrQ0l
	uGVRALR+ytXpASkLkAIQHgXcYFa17JdIIEZX863fRiweYA2zoR3txXKNgisb8sVc/DXH3kQKkBB
	lhH7vH/zqnMl7PLM46CJMPBL6D3m/SnJt8lZ5G+uYWFAJg8qeBJlhXdZvb4PAhc9V2Mytp6KiNn
	JgFXWC58RKxfB6FWVO2p8V9DCNcbkaR/+oVf20+ubwal7iNU2pVp1b6eF5wdwKKzZcmXm5Q6f4z
	VYd86dzMIa3i2CwYveHhQrlVaFI9EbhU+0EZMAuHtp2vGf1PiOLYu7jLIktpHCIgA8ackPmksnO
	Z92zNOZLJklHZA6yYYXv/qSDh8t5eO/tvJBUydjyO2DTlm0+/CHq7lD+SoItagjg==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr268647955ad.0.1781079169937;
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr268647335ad.0.1781079169451;
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support tsens in ipq5210 & ipq9650
Date: Wed, 10 Jun 2026 13:42:39 +0530
Message-Id: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a291c83 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=O98__aPPj8GWcYWuEFUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: F7LN-ltx3CjggR5pVbtk0Mfz42YfAoxT
X-Proofpoint-ORIG-GUID: F7LN-ltx3CjggR5pVbtk0Mfz42YfAoxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX3ZAofLncZOhW
 vXKiDnkoQnFijIZ+rNMM31QDpCny1uJoYmQXGeGgygdOIxwz9ZIiz1jnRrqiMv70DfPddUvIPYj
 tkGM7qXwTpxyYJn/hQ2Uqa4ET5bZzY4UEnaCDjKtcaNaGF0E9KnMWwDdLDk7T7mjORV6tiquPXl
 XpICVyDTgU4XhnIgkZdLFqTqU45UlAnRZ/0JQD2IpiLqZBZHqaSYAS5xA/vBumtk1FcSBes/hOC
 C3WfNP/bR0Cl4HQjDEQGAIC7yOCdyxfesMB8dJOtE81O0DNegtUUmZOEHDgli1qZDZbyzoy9beW
 UEdCnEmG3wniolUZRpdn9cagBU9ot5hjUhzd+r65nZ7iuD5AwlBMUmZTWU+OyCJxWn9e6tugJSC
 s7KUHFiDRLWmSmEdr+TAk/mBKIDODhqYMfPpGC/UDQsTKmVtbig9uGZ10i1wE+xe6xuHxrmtRDX
 fVk2kGQjW5ZyEvhotmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

v2: Combine bindings and driver patches
    Use fallback for ipq5210 and dropped the driver changes

v1: bindings - https://lore.kernel.org/linux-arm-msm/20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com/
    driver - https://lore.kernel.org/linux-arm-msm/20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
  thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 drivers/thermal/qcom/tsens-v2.c                          | 8 ++++++++
 drivers/thermal/qcom/tsens.c                             | 3 +++
 drivers/thermal/qcom/tsens.h                             | 2 +-
 4 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1

