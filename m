Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915522;
	b=kdRf/sezPp89xJWszob+mr7cQegmICkkLVvW7hss4XGOiS/FVj+ViLxfSCagrE++TtHB
	 MSpKvDRGZPhY3RSjk3I9zRQchJG/KrOHTL7fVjshQG7gmyAr4DuyJx07c3Uq7oe3PvHGE
	 /92ktQ0IXsOKMpKUYArCNIyWuOtBGELlQeBBaC7M2bjExWDvD29EtWERvdy4jFZz7jtH/
	 z8ytVtrBIL+4tqtkqH2GH3rulV3xk3t5h1n06hlPJ6qe1EeplllCOCz16dn15AbDKFU4u
	 Utv7EkJIhz/Eql4mTvQmvwrKkesNSrp/xZYeEcTFhiM5E/5EHDjwbFnf6/Eztlkiu8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
	b=cZesikzJKgwdtM1PtT9xYwPpfY0tt4xU3ib4Kp4sF7VUi4ywUeAbfdWVNCjG+6bc1pu4
	 ft8O0u6eejs6+FOp781yws8X8eCiWPzbUflF0NRih1WGHIFOr8xRq0UdzyG+he5gSy+Jv
	 Q8fryTj7S7rG0GOfctbPEhB2xCzOcgC8Zc9S2fOQZQ4qx/PBMHtqeXWkxq6YLsMjhE8Px
	 OKyxg7+Q8EdjJJEOvtjjwxnfdU4BxpwP3G3SPQkiYztVhbO8qlBrWQyGeiKfn74zAd3+X
	 OQz88podvtugfeo79hq8R1whx9Ci1lJdEwKQWjYiirYBiE8CvQAkGLnj5fzbArQrojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9ffBXLw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12193606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12193606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9ffBXLw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8XNLV3624139
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRT
	W9cIpfZo=; b=TvKapnRnBm+Q2P+N44+Ns1WvXwN1Ob8vW3mebXZxLXqpwLbo+S5
	fTWeRMmTdRJLIEYY8CqBB/5FxeYQcDc6Zx1cXp4zYrgjZM6KR3wDfT2pen1NihuA
	/VubIkhW92t1DjOT9PqgSozn7eV/jmaJML78BKOuES7oZFHcF+3V+JdJ3BwNkToW
	EM2D2dxYT/wx72qTK3bsZ+UgjQ6poaDcsys6tZGN6c0OWQcv8mHzNUB8Hcc+LTtF
	dixJuXFi0t6LB4ybHf3ioQuGtm0I7ZpYkHB5bUKA0mJ2OuwWbB3XVJRilv1HkAcy
	Gxpn631FrGm2wngerzOItOp2pn/nUptHyxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rekcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2538352a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915521; x=1795520321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=X9ffBXLwWd70zDa1Ey3k3J+qLVeOlTalEElNl5AOrj3wQY95vSVjIs4FV6RGS9/pfH
         NTpc5acC/ErZsijh108aoRBRRobz0Z1AXDoCKId7h1FLOxw0HQtQ/5gluR78In4IxRAz
         4EiUmE2F2KLvV+ftNn/VvkP8HiuXJztP+AT9wP3NdUYUq/PXq3j28LWOaid5TqV8gbkf
         lgnI4aW4NWjVQfuLlpDhIHAeW9OSAv2/Kmoi/xMeYF0A3BR+1Ps+nhVZS8qEHhi0CE7b
         hBRhGt6UhP6DQycPO8BYP+kz7UTUXGLF7trtoaVK5uGXSATPkvnJKCBLlCQ+5PhsUZac
         KTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915521; x=1795520321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=edhNkKb6/Zkcqz8Q7Dg/G0EufIAtJuhP7jWn6xPvO4AQIcg/lgZqCEGX2cd35h9/Yc
         Ngw0wFBAmcqNjEb6zgW12QGbQQ98i33nNxybk3Qtoft75w4wDV0+XcqYwZ4F6D6YRW0/
         oHXDR5MCUjdMwoHTUZYOqCYmK1OgZbfnheUi5DnI+6g7LEkIaqNmnCLUxHOSv47eDlHY
         3xbwi2xAaiTcgTazBrcaH2/m9QGRewROEK6g2hIwwTAN5EYLm+FujcgsDLX5O71ET6fV
         vDFksqBQ0JK+IM3SeVnN49/509554Qz9mFSWk7JLN0CCEXnP2eceT2zaLy049qdPnrCO
         q6Bw==
X-Forwarded-Encrypted: i=1; AL+hErGx4ZjK3yGEBS4k/uJC2ZBIkzs5WrGBmzSJnIT6rt9iIRUSeBYNlKHf0j7phXl2At70YEeQrPXMY+xH@vger.kernel.org
X-Gm-Message-State: APuU4Z+RgK6H93v5QG5QdgsLQKbeFxkdLk2w28QauHOOeZPqfQOV7Gpn
	fT+GMgWtrMNjI+efrtgARQkAF62hrl6dkA3vu+YAUQzvZMIDzEGPiF5mTdF8IXN2e31wMoKv21+
	zXc2dLkebl8fLQN0cnFwly1TQDGCwULhJ2n0E1JO0RW1ZUX9KCqjNswREslTi/+m9
X-Gm-Gg: AYBFou3m8kcCplcSnoBYZH5M7P9qBq4+e5gxZAWRS+hk6tuIgNkSinolihkS2Qfv27T
	mR2ZLNKlaRiY0OOE5qjscNWUX1IsN4Sfpw5WHNtWMyHPYHxVQnqscF1I0d2euFqLavpkCo+py7s
	KCG6CZYYcosDOp2yGSftVMgNZcc69znT8yz8DU0hGa9e+qWtU0lqIS7Ma6udxCxVfzbCXs5q8sw
	cJytwJyGCLnxTnf7NR/GdqCYA6ae94uKXYXhd6B0uIu9BmUtW83EvDvcLf6xyArfBeKiVGc26Bv
	7ufdS7bO3pzOzkpz/sLtD2z4ROgrm2NtoPkmgte1wLjO7Y/QIhlA+hDk72DpGnyGoJdeOZtrhJ4
	c+rU8AwIr563RXjtjE9EFiruow0jLqXloP0JCzD4cIkWwBqAYoNI3DiNcMUiEr4paprtTTzpjJf
	mVQTc=
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849402637.60.1794915520548;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849361637.60.1794915520037;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm5886985a12.8.2026.11.17.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:38:39 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, 26rote@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: glymur: Add mode-switch to the USB controllers
Date: Tue, 17 Nov 2026 17:08:34 +0530
Message-ID: <20261117113834.925310-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX2ow9jXJ2Droi
 ccizjXucvGm8IIC/5f/EXausa120LuPiyLyYG4jRALLvbEynUwq+Qt3UqxF0Gm2A7vtZW2FjV5m
 WsTLS/5asW0gHIShjcOCwZlThiRNbYc=
X-Proofpoint-ORIG-GUID: F-XZdISRbI8X1QkbBKtnm_vo34ZNwsCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX6haLr7SETcjI
 if/moc6bgXJ8b2Kq/4x43Pg4D7FJKgmO5cSEtFD/Fg0QJLiLalulp6E5YthK/ASS1VdLKwcpHfL
 Ipc/Z7Ojt/T0AwLQmiLJd/4977/yN2Rf7xcyZRonFJN9vddZt1S+PRWuCG+Xhfcc05sKqOyPNMP
 5aydGzFjTD8dfDjcGtPDptFm2fnEkVhogeVf6F0F2NpVBKP51jGn4Mq7B3teopaQMmsb0znwk3Q
 LImsi2E2aAanMToBlK5acpJ/5eFnCZ0TuQ+JgAXsLCX9eFn714i3lZ3FjFRnM06f/+ZDjPzkwCK
 x3WHhzESW/nFZJM3xaXXwUVvA7vfz3kWkM05SDzGQQr60U1XxFk/S4SQszt6BmRRStWVBmPISWb
 45KLyUh/WRZsAuheyC/IsthOZEUEXZFr5jnX/6ZAXSkgE36f2RJ3JmXuZ/dFUmBK2G99HjVWuGC
 X5jSlkwch/Fpwwiy2mw==
X-Proofpoint-GUID: F-XZdISRbI8X1QkbBKtnm_vo34ZNwsCh
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc3cc1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-rp_c-N0KskbNC3IIIMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controllers as well, so that
they get the Type-C mode, move to the UTMI clock first and keep their
USB 2.0 ports working.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
Depends on Joonhoe Kim's dwc3 mode-switch series, which adds the
mode-switch binding and registers the controller as a Type-C mux in
dwc3-qcom. Without it, pmic_glink_altmode defers its probe
indefinitely:
https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..e9469bb7a832 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4998,6 +4998,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5088,6 +5089,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5178,6 +5180,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

