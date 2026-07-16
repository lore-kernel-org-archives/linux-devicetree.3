Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2183642A164
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211909; cv=none; b=C9kxIgmEuiiaGpoDgjb1cR60qW4/6+et4d/0TTgnuKYro6Ad9koFeiu+RRWG7dmcjVO3fOMCroc8UFiQPBoeoiKlrJIxeh3BrscgXyySA7yafLxMFeKIr8mQYljsFp9wtpR1qIq2c3NLB9fgp3qyxUXYJb7gTq8ZQQQ7bzF3yIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211909; c=relaxed/simple;
	bh=x6GrlPAAjSvB6wPlc0sMHZ+kLuQ1ydttgH6bAmdxgp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XVK2YMqcnOVd2w3RtiDq4Pjs0Es96erEnSJk24vwua2/DJR8ZaFEraf7Ccf7PallUpCFpLcWDt8pP3nMMHOPyUvhwJHN6tITNAitd0/LgNOMDydZDQSxdhYnJZywzKiJEYy4wJRFhePamK2w7d1bXV89LLV8WuvJWOVCx4CXKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVEU+HPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GW7i6bY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVEU+HPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GW7i6bY/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJcpU2946542
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCm
	yTDJ+txE=; b=lVEU+HPL1b3fZGS9dbT+Bp2cXk7Jr9ES7mkl1Ix4tSzKuC5F+Xy
	U7+HmGA9tj6048aeScyIE1ZAtC1zg+th1eLtHT3+CRqXedXO+y+TMPNlq7qe5vVs
	gjXW/Vwp85CSfUThFpkt6M/LCjDUX8bPdrOBRHT87H4r59AjUesKJ9WKUCd3WR21
	tQw+j1Mayv9baAT0vRC1mYUvRJ4wyiG8hiHVt+00CGPIj+dh6WC9YFb/wPdGZvNX
	mwC3v1pXX2I6Tx2zKaxbjmpxIkpZoOvyhD5wYVMzpcrb+rcfigi325xlBA/xrTXV
	nOec5ypPuyaYUgy8r2XDTIOgWo6E99Wkk9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4waxe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8c689b5fso112513981cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211906; x=1784816706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCmyTDJ+txE=;
        b=GW7i6bY/AlqBMHXzvTTyq0ERWZu4PoFEliJYGEUVn4j4MQK28swHlalHSH6WhcSUvY
         R7VrjAVE+XiHRbyrwJZgXEMCj+7KSeWE5gl0D32e3T3H5Y+0Uwi1ZxDMXi3VRu1dnP8G
         8p/3D+0UJOMcaVvaeB9BwYa7LEhOUu/VAmwD/cqGAYp0ty3E96E/eh/T2vCNiGyuZDPh
         n9in8Qxw2uDJ5nqepkpbtT2OQnUaVKMFLqmVx5UijpSe487FuwfSACbPuYes7725N/0e
         v6g0Jod8wQ0yriB2Opowwix1TEzKZFpI9M2bfWKaAHNlT/nWg7YgWBdB2kUFZ761/1Ky
         PoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211906; x=1784816706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7n98tslCrUbFBB31yPG1s2bPvjAURhqrCmyTDJ+txE=;
        b=dTlXazvO/7ZvPtVJ47MVsJE+zlYQOgMASRS/kU4gUpvsO/er+MigedaY0ul9LB7fBR
         RhoyW3qeUp/iBe1SilGfJltRNRgyroFpf6zHZXY3CrdDCsQw4xzOWriSIDiE0smjx5lt
         txqByus0OFGHy3NxhNyRa7uRpxWAcYeCt1aqhfIj0ZB0t3zjhlHlaRp7+9nqNK0mFQWh
         XQWRI+4NRyDue3kD9p6Eq4AlzqqS8ZKv/onwNBjcZtTT6oj84Xq/5+RMlGiatTiwbKR5
         dThcsPBPy1dZBDXrq7mHlUZ2kHNQkCPnxIDR60JV+ttbtCKCjqsfwj5jxYLO1Ip0g+Gp
         zalg==
X-Forwarded-Encrypted: i=1; AHgh+RpS9phRr+v10P1gK76A+4y9WS829avw1Ad8g7tgrggi3bl8DlN6yl0KRTo4WwVBPW+y8M1CjFosh3hw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xs81x0T/8V3CEacghJG7kNGaeRc4R9u/JMokJgqlG8C+XSV7
	jV3/Yxc7oa3W2NKh0BxQtMqF8mOZGdIKhWZkitfMwSRNiJ3yY041Dc2gbqUqPVc6JW2BdSYvo7h
	fIUvAImFq8a72YhHOWU59wY95DciiUqcI9CAyhCJ6CYMqhQFX1MFZAMKdYz0R4cbY
X-Gm-Gg: AfdE7cn2/iFl4J2QRLmlTEQOMyPPPUxLtzWS8E4B/9HkzTPgfUQTCYCqcNtPHzgL24T
	uJuw5x/KceieNraiLI5LoclIRa3/WIdUlb7Z83XXDJj/A4yRcC6yTIixDMwIRCHGSQ9Wds0fGAn
	l5UW715tmwPbmHJQANcwnQR4sozaeIV6Yg/ONM5qQHY5C0dZI0Fxvvvuz82ko+wwNq0i6/B9UD2
	uBz0WxH2soFsPBt33Aj1mp9ra5qTVlOQ2S5DDI/lTp69fa+f9NPq1TYHqsoM0N+bmRSA7eSl5Hg
	YNmQKpoZ/f2Xq4P8sg7XmX6aGvaYtPbYAThRjce+eFGC9zobE1VbjqO3cfcGp3QsOn5s0XBvtGW
	A4G0/dlsMbrIDICsFASj/e0oUIsSzY0kVOZA=
X-Received: by 2002:ac8:58d2:0:b0:51c:7b11:41bb with SMTP id d75a77b69052e-51e425190a2mr113588211cf.87.1784211906291;
        Thu, 16 Jul 2026 07:25:06 -0700 (PDT)
X-Received: by 2002:ac8:58d2:0:b0:51c:7b11:41bb with SMTP id d75a77b69052e-51e425190a2mr113587581cf.87.1784211905498;
        Thu, 16 Jul 2026 07:25:05 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:04 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Thu, 16 Jul 2026 19:54:42 +0530
Message-Id: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58e9c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xIDHgNOF4S_h-97w1qzZVItHLqRKEf_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX3XMXDyz1Yhcx
 rhacSlF7G2flIFQ8vKGObm3iMfUvoJyzbKJZjGhQEKzFPHT9LtffpDGb0z518pVMQ3K6mWOSAAn
 vkAIeDCh0hDFVIN6Z7NlJT4RI9HO/+I=
X-Proofpoint-ORIG-GUID: xIDHgNOF4S_h-97w1qzZVItHLqRKEf_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX4Z0eKk+TuVgD
 bY6mKguZccfBFzdra1vR4wY2w7sLoB2SRq0ZlKsoElhH9af8zt0S4nSUiRTiSNGe5tN1ML5aVRG
 MPxP6kLN7OdO829dDR/8G8POe7Ncqry25WMU+INmu8EEJGHQwsH1YBurTp1wIn8G/xE3u/LqHXC
 RLSRU5MYNx5LySgaKDbCfwguk8JkdEa9D8QjnEe3tjFMv5J/MVCHHQ1wKKpQKw9ADdAgvtEs2n9
 fir9ngkj3+puv7ODTuf2Js06cLcdVoRFI63Yesm8jD3rXSEWGQYj/cZSGbercqkJXouj6kPrMZs
 0fv9K0kB6B1X1cASohFMbKsoYoC8byQBuUo2vyjon+Ptu3x9A+8Oi9q2avrrBpgIdtNqC20BKMk
 dhQDk2ERRKuKvr/YCqEciYIYdVHA1MRSG7tGliJtNPKQnP6FS5LReb9mXrr6uLpNXZC7r2WMGz8
 E9Ol2+89kHT+IR6D9HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

Respected Maintainers,

This is v4 of the Monaco SDHCI storage support series.

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 108 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

