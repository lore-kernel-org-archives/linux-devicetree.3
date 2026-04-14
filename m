Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868282FFFB8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166589; cv=none; b=VP4D80fkhCqgGqrm+BSNOBHZHhToIcSFwUGaa1ILwiBe/4633hXvbFNZHaHAbUZqwpmQH6bU3cSfoBnsO9hOnbYP8eEtTjmFXH91UrDgLZTb2YNpkkm/1oa8ZrYWyIjy4y3JmDKEMd8BuF/KmMDgkCUp+D3iSmjDINyMc4qopkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166589; c=relaxed/simple;
	bh=gn+6ZNcFZc+TyxTdkl95xSQ9qtaT4u79ZWLKx+Wzhp8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZunDdGSvKstGR1Z+zCWnw7HRya3eHFDGqe2Sr6px5+ypdN1BBqz3XIL0twGEYVRiTkv3KqSBAI354nCY+GkDcHfVwksjjkWEkF1INya/BvNfEEj7M6CsbhQbNrl8L+R5ZHgbX84zVa5yLaKtzfOZ6xpHApetzCgXbgTm8J7lEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Owpc5NTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHyzqZBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owpc5NTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHyzqZBF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6s45B967268
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8jmRcq0pruvJpCQECdiQ8B
	ywqUUUuCbc4PHYxeN5G74=; b=Owpc5NTh3iMb+zGSDg3o3vlPHBMIymgaQ5mS/M
	8mN0N3P9bXw1Kg/UDT58QF0UH1MKrfJLF2hAX32zC25Plomf1tzLPL7kAg/oG4O3
	DdRSvXhlK69wYwJPp8ly4ZWjUr17RpS5NOamnjWPSwKbXbQHvVOO5tWTrqbnQgLO
	5rUfdeowrb73WWa+eGyKM7xdy34FW7Oagg9c3ioYJoJ1YyX7dIrWR//nIw+M/JN8
	vssjiFWLLa/nrqy5ZSrYi82ao3hs81pCB/zWPL7+JR0bqcmPdAkvJHDWlBO/1Gvp
	fsetF2fn0EI+Xe0p3TA5M8eKyaKB9MhZiZFxD0GLphXuOlwQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2ekv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7691378914so2511333a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166585; x=1776771385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jmRcq0pruvJpCQECdiQ8BywqUUUuCbc4PHYxeN5G74=;
        b=PHyzqZBFJfthU9/I6opin11Ag6qUy/gvKIlPB4GVi1Ijsz6LyFcDZ7OcwJ2832ixHu
         3yyDxy6ZRuyBOAg/oN07uC6uka3FLl6S9aJHBh/fwKaJpjBKvgOCm/AkBqKvSRwEJHaf
         hZKVSGMo48Lng5FMixZ9ljwioot60WygaA4WPRmmC77oy4QmBc2GX7DVQarF8kVx3Cy+
         0UAG8fe4XAU1F3/Zf3CUZd/v5CCInTmZVCt0OfyBQTSnXGuoAInFFYM8VPYtQL8s56hq
         t1hDcX5LN7sSJpDOI4AZyEwkB4O1KFOXXpFyDwvg+ejTbojFCLpzrfaPS68QCGl+bp4m
         I2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166585; x=1776771385;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jmRcq0pruvJpCQECdiQ8BywqUUUuCbc4PHYxeN5G74=;
        b=CNRiyJv+8JybMA32OZ8XmCyAE1MyLXkcNh+0EQiOCID+tj5bkq7k0ZI9aQ2sXewrq3
         4rypG2Apqw0Bk3Gt0kzU0w5Yzzfs2TxKHBO6fnp5rY0ucmjtFntR9+PT1g2rfqNIj9qm
         oFRfqTmkgN1YcRd6x40c6nbC7CZUpFBUV5XYA4sBCgO23akIfoG+2qR9Rpp2hNdzWQKx
         gldnX6Oxm9EwyJB09SINmxZK9lN1CuDjQWba2jHzmJLRunQwQ1TSh1zAlEQQTIEZuttu
         RHZx44lU8WyyJE6PAzdFLrSm9bUB++pNNJGiC2cpn8XU07vwJpA4Mbr1vPl4N7UgI8sj
         H7tg==
X-Forwarded-Encrypted: i=1; AFNElJ/teTgY8W+6KsGxvDDU+7IWI0e+cnsK00IAHbXJtSFl/2WTofWAEuxsQMcM1rZPYO3zM8vJgA2+yJh4@vger.kernel.org
X-Gm-Message-State: AOJu0YznV6YeYokqHmhi2vTwtb6op/ZPotODh3wH5goD82QGthpG/DfS
	WXzodKPfhNvDKee3B4/rbCfwQRcpjVzwnlFujDZSfE/6ZCGeiOpN/WrRV6AxEegDBnvKKKRqDah
	ZRhu69/2ikdCuPRbJ7naMsoslcYaa9SaKTQCHosuEeROqCDENLdjbOyskD40z2/iu
X-Gm-Gg: AeBDieuzquWyMVcXTPdYGDfXYnfkMel3CHh875zi3ObMqYVVhP8vCiv5N7IkALFaCk8
	QQtq3NQqCX4uhqZMmegZmhpxdP14nOvdMD+GqyBQGSCjLCOszBuZkyhw3tYq1m7QoOVTZBk2fwI
	ygXC4Q0/eVd/RjxluX8Yr9tBLrW5kTt/JdjjSZRNxXg4yrZF0mnw5GbtPgX+N/c7ohXagBHfRXy
	fHzCPw97ICY7k03o+MbwTjoPKdZ0izi5XbX4OC6+X/bM4WnuUCm+SAF3FtM6I4Jzienq7YHqIQ0
	IjW/cslDeNqzk2RyZP9I6UEnRxr/V1NUg/oOvA67k+ONYCBRP8yL9jUBkxqSP8Avedh6iLJTdFs
	KIZSoC51rwogE5pR9Ak4sE5Plnn17thNPYTr5efuRADLX+JUQYsRDaYLcHDY9f4HDvlHT4fYOM6
	uYP8j2fqIR
X-Received: by 2002:a05:6300:210f:b0:39b:bee4:294e with SMTP id adf61e73a8af0-39fe40a440bmr17952169637.58.1776166585430;
        Tue, 14 Apr 2026 04:36:25 -0700 (PDT)
X-Received: by 2002:a05:6300:210f:b0:39b:bee4:294e with SMTP id adf61e73a8af0-39fe40a440bmr17952128637.58.1776166584938;
        Tue, 14 Apr 2026 04:36:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:24 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to CoreSight
 devices
Date: Tue, 14 Apr 2026 19:35:58 +0800
Message-Id: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAm3mkC/4WNzQ6CMBCEX8Xs2SVtVQiefA/DoT8rbAJUu0g0h
 He3Eu9eJvkmmW8WEEpMAufdAolmFo5jBrPfge/s2BJyyAxGmVIdVY02BOytox6niD4mEm67CUP
 eekKnK2ucLdVBEWTHPdGNX5v/2mTuWKaY3tvdrL/tz6zVH/OsUWGotC2rUx2cN5coUjyetvdxG
 Ioc0Kzr+gGNnZMK0QAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166579; l=2029;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=gn+6ZNcFZc+TyxTdkl95xSQ9qtaT4u79ZWLKx+Wzhp8=;
 b=9lQCNxcOm+EqjA3J1BeJlpNUNPZhHEreNht49EM4pgxXydKj8N6UihqdtIa8AXDS3nkUhJn8T
 Auk1P3n2lCnCnNUedSaO3qWCW0kdTBH8tAIX6OSvwv3brfH43lRy/Ng
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX+Sa1WBqgLCxZ
 PnzanMd4pAxgOn9wrOKAblMxwgXlDllwgwxtJfYTu4MiV2Fz2Jq43c3vLKEq5dgbNkgpC2SDLAq
 ZHGK18o7+Rg6z6FGYhcOwaDl+Jwa5sSvgV9fXoagmMPi5W74ClUimyaX1gbijzU6OJPLANC3MjM
 wTrQKa+cgLWgcyQ9UZtcYfgV+iH3Co7qYLbCiJWkyn9FwXRRD1WBgUHkj3vNmrX2vvtOV+LUhp7
 aQdE2lCTZChl9RSlqEbe3T/+HNwdt8HYhsSUlaL6Wo6TZp1/JhTwkAI7Pqwb1ytSSmQSK1oJFBf
 wcagkw9nr4kqp/1iTshMCMLbxZegpmForb4gMKWx2/VufoIl8VdrhvuzpVeapbfLUvY5NsfCytj
 Ykzr4GWzDEhYULABoodcc2oAkwzf5eHcqDVqKRDSZLGSCDLzpImIa/W/HKbX0L4E/ZiEApGl7eG
 UyrLx4qfaGqgpBbItvw==
X-Proofpoint-ORIG-GUID: ISq6I2uN89FX9LOh3GjQvC1KP6-JKQtO
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de26ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l9IztEvcrmCM-arMvcYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ISq6I2uN89FX9LOh3GjQvC1KP6-JKQtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106

The CoreSight framework and userspace tools identify trace devices by
their base address, which is not human-readable. The label property
provides a stable, descriptive name for each TPDM and CTI device,
allowing tools to refer to devices by name rather than address.

This series adds label properties to TPDM and CTI nodes across seven
Qualcomm platforms:
lemans
talos
monaco
kodiak
kaanapali
sm8750
hamoa

With the change, we will have a sysfs node for each Coresight device:
root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
tpdm_spdm

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix the extra tab format issue in patch 6 (sm8750).
- Link to v1: https://lore.kernel.org/r/20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com

---
Jie Gan (7):
      arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      arm64: dts: qcom: talos: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
      arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      arm64: dts: qcom: hamoa: Add label properties to CoreSight devices

 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
 7 files changed, 206 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

