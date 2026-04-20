Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0A3939B3
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679215; cv=none; b=ENdRH4o38w5YRXQ3+8GPZ3Vuj08hv5af/prTelkA1siR0/vhHxIQBEeCMv013+UER6VIf6B5kZVBa23nRPuLFnj7e/T8MF1AgozObyZ7nhBg8jsKdrB4tjkDwhBnfG6u5vpV6LVVXufKsZ09itgKKf82wTgzokt37HmeU6T3W4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679215; c=relaxed/simple;
	bh=z+XFP8VU/s8RpK4cKc6S+33FrfDvNI9C1bAlc8BIEhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DBQCwRnm6DqMFu4R3lMD6Zc9BElpTrigOtXzXliGC9PYk7v6+SYVkg43FAwoBz8ujDXot0fQziuhCnSNv4pUXDiTiQyaoNpH0OvX2j41CQ1Sg48eWlsAIsIA+pTh3uct0HLrVBsobQmSQG/k3hLq2RIkBFb4peVja/vhTv3A9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvB/g/OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keZ7T/Kw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvB/g/OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keZ7T/Kw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79FRw1598277
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DV9tE1nTvXX5aKnH76eHZJ
	ssipCTp2o/CH4u2VTShK4=; b=XvB/g/OJF8KXzX9fk1mcF/WipujUMl6n2FhOxw
	qlr1sqHmy5dfYptcnmsmoXsvWdnmYffwY/e/CgFh+iztcQUbaofFrLPEZGA5bRg5
	iJalaPgIik2n99J5XUSgbWIn2vK0hVHDHnDBnEF7NziJizPOGytVILFQLwhJHGlD
	urUUNzjhg2JdseAvqgQTeCn/Lrecwe4N6UycAcnE/XBS1vGR6/YnY14cpgb+Qlzp
	kclbgReW1KE11jfVDRKObdk8lKAInlQa1j50YvQprEv1vfVRyALSGoMZohcmWS7r
	mBKK32jD6E9kcsWsebkRHUFMPcbp3d08zvVuoLu3iKKo/Vig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgngxfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:00:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so1496632a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679213; x=1777284013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DV9tE1nTvXX5aKnH76eHZJssipCTp2o/CH4u2VTShK4=;
        b=keZ7T/KwkBJp11oD7eSUr9jjq+nayifAbzHZB0j2Ro9Bxn1KUp17vCV8KzuZu/Gktp
         sR37J3xBrXfGTBLBwGxcfbvsmt7t05Yz3XSiA5urOE7vm09CP9lQHZT5sDaqE9i6yR/I
         GCbANzz4ryOIc5XCV20PUM8uc49IxP2bKWwrgukybLtM7hKN7ZVE1CIW3dXajNZ/qgaq
         MZ88TRoU44yQ/koWszRlJb95LjQIdZFK91VlvwOziTTSQIeRlaHTJ2ZcrlYTG0RF4pwf
         3i1+EnBoOag9cqb8+but3kvquFWLg/vd57+1Inc/J0tDz5nm3arBq4CLsByyJoEmMHov
         YPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679213; x=1777284013;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV9tE1nTvXX5aKnH76eHZJssipCTp2o/CH4u2VTShK4=;
        b=LipFHEZ+ueyu04LvkSdD0ScP4YCAwgj1gzk9vMk8VMwoZn+3riRG0+vggqiS59C6yz
         w0DigKnbI+dRcsUdv3awKXf8MpiqETV92J27FGP2EHJA3lWJKlB64DVH9Fq7JHycjDQS
         AT+0xQwcZCQ0JREqJ126gUF7rKOcCodbMy7FHvucxblkOqafynkuoniEcLsK76ZrABoq
         KfxA+L/48LVXXvT6DfEOmzfpUAH7MrfpPn/jaqjF9NtdmK0ydHhurF0YXN7edkNWTIOD
         awzcQEho3GLWUx8R3jVan46Oa/cP5KjIbuiU7OAMywXe1e4GPHKT9K6cqpROOtMbU9tD
         gNrg==
X-Forwarded-Encrypted: i=1; AFNElJ+Lls8UXlWAvBhHXFhqzf5oJD7d8EOKP5bh05bA0skvNCAPrCJ889XOS+IV6eAh9+5Y/0yf7AsSHYIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+kXYPQEoxwxgskq2r6QwWv9NbMTqIHEPQddsb7PRZGYAIKhJ
	AJeEAFTmz/vvwF1kP/dzkVieOLpvucehKclUqyQUD2TalgTjy2E8A24xZfDmAs8zsD5QfEhV/Ek
	NYa8hTjClwn0WfJLTWdkgc2abpgAj8K3g+EzSV3UlPUxZjTFoKu3NBYXExV98lRhH
X-Gm-Gg: AeBDiev1CmUyNu6IMQw7iN8pAjhwO4D6189Cm/sDhdDykvTqVEJlLdy/hK63u3Mlo4l
	juIL6FlS059K9hZfOQIyLWHvSHn/L6vKKIPoilG/wewzq4kRsV7pXuRpWecgSLM0ZyWhRpFk98f
	Mv4Luiue2yBz8BlVxfrRXF6IFtdjhAEUWrasYsozatPk60qIWZBwYLOq03gso4er47JxaQ63We/
	ymsTc4p7oMRZOu5JDbxcqegk29GKg+L0r9DDTm8Iqy5jxJvqhl6BW6EmJyrtb2I4/3hr8zMqMfh
	qnOJtCEtCJkoH3KETSF36+BxDtbdV9BcOLOK9gEQO8bHBWCw/3IJj+g0XkKOY4Zg+cs/LUx1lO1
	SZoR19RXwRMkv7f5WAmAK3+2a/aiHYVPvtc6OEWWjdmSvO3ctpqfTj8ZH0n0=
X-Received: by 2002:a05:6a00:440d:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-82f8c887013mr13085327b3a.14.1776679211428;
        Mon, 20 Apr 2026 03:00:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:440d:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-82f8c887013mr13085280b3a.14.1776679210920;
        Mon, 20 Apr 2026 03:00:10 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm12474403b3a.38.2026.04.20.03.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:00:10 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 15:30:02 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACH55WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3ez8lMzE7HiTbF0LS8PUNCMjI8NUkyQloPqCotS0zAqwWdGxtbU
 AyUoBnFsAAAA=
X-Change-ID: 20260417-kodiak_4k-891ef2221e4b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776679207; l=1221;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=z+XFP8VU/s8RpK4cKc6S+33FrfDvNI9C1bAlc8BIEhQ=;
 b=tXrj3i8MVneAK7B7ni5x/J4rOF5GzCr34PV8FqIyxy3xcKSTGWVb1Vg9WpdXq/QRcGdSWjVlq
 xcNjbEKAiz/D18C5UoBP8xQbi/mJ0CBNhvETtgPs8zXzsPY9OViEZM9
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: 1hvYZZVnHFpcMh6AdYglTFdAT4ozMSTV
X-Proofpoint-GUID: 1hvYZZVnHFpcMh6AdYglTFdAT4ozMSTV
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5f92d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oHh1IH6ihIS6pQ7lcwAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfX9omI8ST9vSWa
 /ngUwSNlV6qkz1OpNjmjbS0jOy/lCvLNppDGFGuJwseyXwGOm8HMvbs/b5s3fqARD4oJipTOsz/
 q/7xhTjKuiNeJhdAg22o+i5O57QgJK/gTZ3+jn5Uw7p6cmhb/cpSTsBnrIKYyxrmAwYQPv6L5rN
 kf1rsVicOWH0ZyHsD2aAWI8KiijMRxPE4gND+XzlmfBnUDSbBk9E3NpNlbC/BU/bDoAB28mdG1+
 8/l4mbhePjLYQWimRM1673+39O6hJcpScAOnm/MMzm6aQQafSzRMSL/U1/v0wjMITxnfryFKD6L
 ntLTZh7lhkzTK9Ar/6kOMG2SOzDc+kDrXlkcYrNSlfoq/mn0T/Jv/lxqriRDMt82o/mSkGeRdHA
 v07w6C7N62tlkcTaIfc0VrkHlx4vki7iB9pB20t1whdIoLCiXxTLD4/8FWvWocG5cfxOgYtRKLM
 yf8c45oOG6NfjDQN7BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200097

Add the mode-switch property to the QMP combo PHY so that mode-switch
events are routed to it, allowing the PHY to enter DisplayPort Alternate
Mode. Expand the DP data-lanes assignment from two to four lanes to make
use of the full link bandwidth available in this configuration.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..0c180e49816f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,7 +789,7 @@ &mdss_dp {
 };
 
 &mdss_dp_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
@@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p912>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260417-kodiak_4k-891ef2221e4b

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

