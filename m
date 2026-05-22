Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA96384CF0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479705; cv=none; b=ArrUwnJ0+ULLsWjCU7iDQmC1RJHZM4TvJI3fLqHuPZI1NBA9S/U7m9yM9gn6elvpx3Mc1tsCj0yxtvI/578cJa1TbqpMWio5ykws4hP7cUrpj/hR4Ar9RXIZQh42OQLtghFAgT8JUVD1ZgEvudgeKLLF0yqxTwCKMBqU/PBQI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479705; c=relaxed/simple;
	bh=uiEHm22FbGo94IPUkmTFOLlbT34Ehyli4I6vfG318IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0IcX24QjnHFLF/Df8FyEQr5JUVGHk0V+X/4WmjfBTz92jw6EMmz2KvW5VYf0wmbcGeGPyroM0WTC55NxQ0PWhCy8vT2ZyUePQaxFd8lX8Mf7jQSEsnIoi+TtcDiazWbs1F3t1oOaxECgVk3FRTJAoKnLt9dwAQdYVNdaHg44Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2KZdCBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jriXHxbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2KZdCBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jriXHxbB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGan251733031
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfKIGLYCw3J
	XGi/ljAprY1bO3flLnLiGTw4KC11KZE0=; b=T2KZdCBhhkzSGLu49pJPIKoSt99
	wGHG5Htp2qklA7QDXf1uvtHMPhYjk5RJDZ/R44Pfq2V5V05zNyrYC41qosjXqF9u
	WTRG20qpY+sWYp0Jc62/ar7OWtwcHSyL9KDL3ILgBdzyJCXtHpgGn68KI93JH/rh
	b7r6c6OAsVVzijSBSuiYCB7dQhF9mFMyd5/BLSAriu6vK0h8ax5/16AH2fvLI/fJ
	yVRpt1pkcClTJpcl8FgrhmaIZ7lxs9aLaM5GJgbb4RGFQlHntZ9CY0ZQ3B8BFDyR
	GPULG/O5JU9alyu/iilbl4zu5GXou4ZOvFj/adD8PFTJAGLVJWPq+jjORLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8pjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso181880345ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479702; x=1780084502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfKIGLYCw3JXGi/ljAprY1bO3flLnLiGTw4KC11KZE0=;
        b=jriXHxbB4Yiz79NO/BkTfupC8ynTmaeNFOMslquy7w4GzPHUNVsm8PMrp05+gw68t7
         I0Su/YKHSGK3oWCw2GN2OZNjR29UJf+/ZD7EPKzaStK2+RLJy4QBcmih33XSAYXDlieZ
         sx/etR2q5e4arDD2/ubutfGShfFZN2PsQ3afcYlMTHuyF+l2v3IMQoavAhKpennd84vc
         vMfbxxzNjPDJFzjCPB/gzJUrlInsz1HqYrR8TO5CFpOOoe6OuejjPcJWTG3HLbhIo5EJ
         wyu8P8I+DdO1I9A5pGCPRMjGXuz1FGuLovMA1KIG87uB2yE8hzJ/12lsXV9/+7JO952z
         6XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479702; x=1780084502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfKIGLYCw3JXGi/ljAprY1bO3flLnLiGTw4KC11KZE0=;
        b=aIsimWZ1Ek9/YZM7s5ADxCoEMsjQSwtKlcGS2V3NtUoHBvWSctGarHFKLLUUcmrkUl
         pVF/3+809VL9hXWT2DayrGMlcSE5sfaAi9waNMg+b1uCiRFcu+BEn/ebIrtB40JzNZTI
         g12JnBIQOyT58vmek/H7su3sdL+48SbqjPQLcmwoK5YlMM/IAaqt+1A6aqc8I7ZAffVC
         hW21rdWZUDX3p/xqI55SuGC870bQSYPZ0Ww2OmMj3uUHTS/XiqNdYZpdQknrzVieVvrN
         +B1fQNtcW2Sjs98Zrt/hTMt07NqX++j0EUL9eidtFVpoQwYZzaKPkR6cMI2AUdcCavKb
         NGnA==
X-Forwarded-Encrypted: i=1; AFNElJ96uCu3OT6dMlVBBnLoKxb8ipIe+/4E9cqI9QgeWRKFwT7kRdL6l2r0Cripp22cBCMmOKWgNFqGOmHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWK4MpLkyYYoBV+5aqc24MKIJ0GPBhExFpDVqOpDm8nVekvui
	EEqXG53Ig24fCJ+eZdbiGMqlL1/l+vRWP4GPq7frbO4htSzQiZjuGVQ+DCcxF6ZaCr2k3vO6lpt
	oI2QPGjrZmSyzxDQZDIP/s4o90LkWw8+wH1dDe3Q1+RyBaid0Mu0re8mIbBJrsWiD
X-Gm-Gg: Acq92OFwDoGjK+Uy4feG5tvD2VH3InLijMElk13ZGrrZEoRFy/V2N59d5ekXLIuOVgQ
	mpt4MrsApUjt6Vjw667/ZmqvDvV7Pg97uLbvK7PWliRLCkeWezvVoHSHYM09jXTSm2vj3vjImIh
	7wQtJZz4d9fl6tqOxbPqqXhzTYEZsXcmOnwhUea/dO+tu2vYQWbtlboNZp7hMhLoSEm4tWRl9ps
	lPp536kSU2Zp410hxWf2JfnybQVnNAxfKztzJx2x/w9letsp7pKi85HsC1lc7DTDUOK3am80Hgu
	XFojtAGOqywxBAnJ4CF0vHr4PWaBjeMLGp+oPwH9dTW2DOdUid4Msh8gaf/ArEwDrkbGAjelH1r
	zLU0rBbvEfU2ggGG4Cyp3ZnkxDRw1dBtrhFPPyNAGawsB24ZJhdflfWvj324=
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr51754145ad.39.1779479702277;
        Fri, 22 May 2026 12:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr51753925ad.39.1779479701778;
        Fri, 22 May 2026 12:55:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 15/18] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:06 +0530
Message-ID: <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX41+cz0hUGLL/
 qSptbP7S1ietwiTMHzQSggD2wLb++YEucyX8QyxprI+MyqxxvJwJDYyBBg11g9w7MdHKl6CoufL
 e2PIwZFfSXY5Q4YjS6n/IiBb4icrWskzd+L8J/2/xz6TNAhm5nyilUY0BSOC/j+UM57U/6lPsN9
 s/644jIWyw8OPPkqvKsIVHh/U2RU56WsIklK964w51svBr+lNMnXlqtIpa82SY/l059LSi4c4WX
 sHlpU7NUAdoa3b1nGg5XtVHyEHihgBLuezQZaMli4o2TlGPgPWMohfC3EOpGQ35ad+oPD3YeLOk
 JINa6gGxzdE48l3BXmGU5XMwn25iAjfBXXYqXRBxfw9HhRBhqJT8zV4QLHC/z4Y087QyjuW4iH0
 kzKdpCCgNdoFbNAPFY24vnZnMkOMJYFjmp1EbSFG6lQ/JKDZY3LrfBg+qZtKlyzJkiyUP0JRZOo
 LcVb9Wjcc0REngl8J/Q==
X-Proofpoint-GUID: Ph0n4cPkD-z2Gty38uQ5OAPMvzuUR7ch
X-Proofpoint-ORIG-GUID: Ph0n4cPkD-z2Gty38uQ5OAPMvzuUR7ch
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a10b497 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VytTfPOW3k6kkw8Luf8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..06892ba22875 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -363,6 +363,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm6350", "qcom,scm";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -2808,6 +2809,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0

