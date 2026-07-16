Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D682388378
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181324; cv=none; b=KNF4Rx0qSMlfiiv3YRjlVY4a2D708+bxiEtMw5qfBIV+DjGB6XO7eiU/dXUhbqaFbDCDhKq1VvlaJ9YB2m55Iqhb5L98mneBdK/e0fYPmNn+IoCmRTm3s5tXtzrqFy9R/4ceYppFlgGGh/lPlSW3XTfWkv9s7x8c7XNmZ2um09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181324; c=relaxed/simple;
	bh=PncJSMdZfMHDBKMVRRVDfV2r/SfHWp8nQ/6Kw2Ksz1w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=grGg3JNnwp6kVlobQvDPAqv5nIDaB2YVYWQ3qpsZp92u7I6CZPkFM5j2AdSkKXx9nR9E/r1kuf9M3LQahlyU+LSGPjUw0eYlsR9EHMVDjI5I7V9wZtVXA79bF13AgUYVceaxcwLP5rw3doAu1btvC2xS6XT00MjLZP7LUKwIDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeS39Sn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORrFAQsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeS39Sn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORrFAQsa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wo031754472
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DvNnJu3tyYiCsufVw6dXC1
	UJWElGK3jKtWuRgPIWk+A=; b=eeS39Sn7n2HppPRl4csqcHLtb7CNBFZme1NUDV
	k/HaHkXxDyDmn2djJoQDRi5pS9iSGRA8UMlu/gDw+/fYvEoo8WxEY/dgo1h+4DVH
	fMxGs/Bd0noI98oTDGdqqDtzEz0l1ITS8voJKuUDgnmiMgn5qlCcAm8jP/Mt7Nkl
	wxU6kIlpXHDROnsmn+jAk1q/5NbmaZ5jJQxT3pg8HZvnA5LT3wdabYJDxgQvcWRk
	y30aetkTWqhUOCD5AKL1pCqPo7NiBzeKTUcdw4Znusv1y8vvyqITxsoAXznWn1RO
	4kcZvS2ibmIfIYZgKPKe6MtllAPFtyBjOub99dIDWT0v79jA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe855c6jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:55:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso10997962a12.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181322; x=1784786122; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvNnJu3tyYiCsufVw6dXC1UJWElGK3jKtWuRgPIWk+A=;
        b=ORrFAQsah89HnCuit+k6kNHDWOhfKICDyeOWbfckPxST1xBwX4zRp/rcVyTVKbbJ61
         +bushANAH3voGKWvc1Ii/Hjakpmkegx8190/nMUgNIqJDXBdrJTYfvpaVXu/L+eiU2+Z
         JJYr3YHp3MypWfwdozSLJ6rxUGfyuofinuE94/2PJjy+6FZ/hjpXH0/l0eLuUV8Hn0Fp
         niRXw4w6etAURDkfBfEMWqH9Y2VOSrgsjL6VOswQso3qE/WI0LhxSvpK7yLoF0S+yqPh
         dsa+1jbKA1WRVlpHAZPnActS198BcLrZek06XLGRFNMjpitQqkD5AwKLFYoANs0qFpsH
         TNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181322; x=1784786122;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvNnJu3tyYiCsufVw6dXC1UJWElGK3jKtWuRgPIWk+A=;
        b=rj42mU7lSRbL/DrN+YFCrRJ/YPAH8cYpSGuTXG74vzJo7cq/xGZthcyYGh+9sT6kHF
         5NvA85Uj+kqdtfezaiMd/CfkQspMpPgQdBRtLvPqmO8t8TNstM1Tp/D/QXUcBBr7z1ki
         UDVnNFzRCk1UYuV2MrqJlWUK4KPiE+KJDFEIPM38Xobpff1+URsUV/e+4OPWdYPWy9nL
         Kp1//DQ3xfVVYYyv2ZrHtBQjUDY8vE6PDDmPZifjeMRN5LzaCp7OiMuHs0cACY5WQ3Yu
         F0Cn1ojXPzqi5Ip/8BBUE+/b/k+UfythiKGkQTVKwyCm2XvL5Vk8mQXbD6lnZTBz+oxS
         tTcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3lEQqpQ2bmDP8ItvN4EvezofjPZKZ1zhMOzUHii7DG9wmK2pu5DpRpY5fmIKmbNDaFn8yxATr9C/Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2P5hvpa7RV/2z2NIvcqwDAofUqEOVA4zU+ZcLo621wgQLwOf
	TXOYK4DYwYfgQVtlNMtw4nKbJiYcoGEyIYjEJ8P5NdgJx8KXoQnodtTKJNKupOC0Lm1p1RNPMto
	gBayIDAfDpovfKJtIXXLvDk5GUb+RI/7oAuMGgnaDYjKGpFnJU4TeQ4ZuypHoqKD6
X-Gm-Gg: AfdE7clLPbGjxD5YKnU+ZDXEn2CS4Wiyhi0qHYXiCzroqc3bnAPyA1m21w+5y8pYWyW
	83KVwtbSEf0nOrEogo+1cZGd0Sy1d9fpP/Pc7k3eeF80QIS0vRNaO24Ckhl2yKsLTwpnooYj+RA
	qWwL3x5WBkPRPk+01z16D2oFdHgvW9XnKDdKM2DLSV25D0gjQYmQoMkuWTttBfBqcq3MbBHQvVM
	wnd9WRWFegprLemBa8JEEsuzvcQEzcgw1kIMS++Jo3+YXF390B1YMT+uLKgYd7j394JbIwi8/bv
	bWQi4qaouDWg1TD5dwUYYzYcgNHFBk3IUgHdM1f32KC5tCXygp/Jkh+3aevENFa+6jRn7kwkky8
	prMZlIJCtv/AxnOdr80GwQMnhqgiqu4vT74DGYEhDfv1snBUepOjRq1AGPXHTrOJju3Rb2gELhr
	rNf0C60l/a8GQ=
X-Received: by 2002:a05:6a21:4ccb:b0:3c0:9c1a:8938 with SMTP id adf61e73a8af0-3c34d8b396cmr12085152637.64.1784181321598;
        Wed, 15 Jul 2026 22:55:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3c0:9c1a:8938 with SMTP id adf61e73a8af0-3c34d8b396cmr12085120637.64.1784181321169;
        Wed, 15 Jul 2026 22:55:21 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:20 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Date: Thu, 16 Jul 2026 11:25:11 +0530
Message-Id: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD9yWGoC/1WNQQrDIBQFryJ/XUGt0eBVSghGf1sXMY2aEAi5e
 6Xpol3O4zGzQ8YUMIMhOyRcQw5TrMAvBNzTxgfS4CuDYEIxzRWdF+t7XzJVg3VMttKx1kG9vxL
 ew/ZR3bqTE85LNZZzhMFmpG4ax1AMibgV+rU28Jsz5C9G0QmtmivXgkuzcuiO4w3NWdDstwAAA
 A==
X-Change-ID: 20260716-quad_dts-6bac0484c08c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4aouLGwCekPAa9pUCRr2E9xIQ0S8643U
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a58724a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9rZjSWdz6Z3QmuJy7WoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXxvA5BafM5JoK
 4yrH3l5mOU8MGWiYQ2j9cwGRyc49XdKK8IzmJpqKnXFB7JoAn8sCP0Jf+5GOUXYTd/5QdHvxD1v
 v1wjb3AmP54BgAjEIQUwfHSdiMyIE+ufrwR/QX6bHDqsS7aFvhz9lA02qgO+1TjmxVqF7PW/0xT
 F9pvKccN/TTBHM2w9ZO2cy8SvXzqidyHa7MFFQE9y4yn/0rMAQ5KJgamUQMigkYDZ85P9kh2Yzf
 TFWipSjmjv/PHK495c0bvDs4puhFWKQOxNG+F+sMJEv/isiLpPxb0QYbakf/IB+f50emNIRaY97
 9b/7uo49lnkYICwYygbeYQF0/nN7A5+BxLo8zmTuFQ2DgsuSNmiFPCgT97XBvN0IIkTCVGwchlk
 azIL79+j08NHMO+yORyGUeSf6EGa5mYO3Q0scPVjhreQIpbizyWBarWxBB5BzK1o8AuRfADKodI
 vOl4l0fj8ebWDx6d7yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX1qAfzJki3A7y
 HYCyxIHP7DO+cirx54jbvdQZqeWxJ6icPyDrm3Tc97ONC7oIdRbvj5lne78Czm7S/HKQGylPTTj
 o3pTmKQ5740IT1gV+MtmUfUCXsxl/3o=
X-Proofpoint-ORIG-GUID: 4aouLGwCekPAa9pUCRr2E9xIQ0S8643U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160058

Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
between the QPIC SPI-NAND controller and the attached SPI-NAND device.
However, the corresponding device trees do not currently describe the
bus width capabilities of the flash device, causing transfers to fall
back to the default single-bit (x1) mode.

This series enables quad SPI operation on supported IPQ reference
design platforms by adding spi-rx-bus-width and spi-tx-bus-width
properties to the SPI-NAND device nodes.

The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND

 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
change-id: 20260716-quad_dts-6bac0484c08c
prerequisite-change-id: 20260716-quad-ec2765317214:v1
prerequisite-patch-id: 912ede01168ddf0476ba69ab0db786186073f817
prerequisite-patch-id: cdb88acd348e7dc5136fa9b94cc06dcafb0f478d
prerequisite-patch-id: 932ca3dc3893df6de25928b24c7c24550907088d

Best regards,
-- 
Md Sadre Alam <md.alam@oss.qualcomm.com>

