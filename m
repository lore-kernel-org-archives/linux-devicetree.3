Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30D3383308
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479686; cv=none; b=cD79g7h2hGy0jshJZ4SKPmDCpAofePzKQ20dxue+ZiZcRW4XBi+GhHb7vRe7q+/yDk7VjvNKP9SunYCX/KhzN0W6X6RQBKmu34nA8cFiI+j9K0++0J4R75UHVfCkH4BXRvki18T0g/+1EUUFiOeeqTpmSc/vFetgEj6RzdeXXPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479686; c=relaxed/simple;
	bh=/xLph1CXP5xs0PW/hYyRqUhWSHPrZw5QMZAzBYEKBHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb+WqXZeRPgS7syO6rI5qbs4cXC4smyZOjss1HjCqig2KLt10FFMwXQBZuJ0QZH5IuZOaoqQQO45WLWOMVIc1gMpcw9nTW/+oJXuNBQN3IkzatgouIlBKlIZlrNr/sRcyoGuAr4PMEkBujPB/I2Pwt4F+GyEY5mR/ecOZE0+Ilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqpD/lEQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPlFWwJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqpD/lEQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPlFWwJ4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFe4Ze1816077
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VgYYdEDfmXm
	lKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=; b=VqpD/lEQPvFlMAIWKS/kABcoTPs
	KcM50F9lZZmx7AfLIS7IYS1IemLstb+eZdP2qStl6x2wZnjt93W6i9mvQYkqx+l3
	HhWj5yeD36ENdRLzi3a26GGS+dbma+hbUL5XxK3NdSQTKNkKDOP/2z8NRP3pTckU
	Sb1KCFoIT8+vMPEAQxam/GGDLWWLrxZNBcYlWmu4fecZkat+TDkiXxn2IO1Opib2
	ojqMxvx9FLF8btFb2ZOHek6Lzx1xAxbcVRXqNM6q8wABIiJv4Bkr8aLsN81dVAnj
	gtawVc9xOw7OZnlc/w5D9jTTH20yXRNYjZ/U+/d42QYsXo0LHmDVdOXfxdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm3maa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so72370515ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479683; x=1780084483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgYYdEDfmXmlKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=;
        b=SPlFWwJ4PygT72gB1o4juT2/rYMtA5IdHk93BpVkEqVEyuwK+vQyT292S2B9WsYdT9
         Y5UdKDFgVJse3dmJ8lYz0ciJW0EEZyq+3G+rZD98NeKQ8WMfK/slwzZZk4rkAY6PTv9N
         N4JZUKOigHJ1idw6Gx+utybfcMx3j08xo/AGxQZXNtRm7mXkNrvotzLnpACGpc0oVBMk
         K5qhs71Uy673YOkBKOBpYeqj19XDWh79W1RLxMF15eeki/nH0FqOJqogUjDeUrbf+uBX
         eFWW1YAH2Zd+SlJaw4Hd2LrvaIPOYLkSh/BxiR4KCvW0J8QitMZFR4XW7IEFdgCjmHKJ
         pafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479683; x=1780084483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgYYdEDfmXmlKmeQWTeO6mNissKEz7AQbEDA1qLtlKk=;
        b=ifLKT9MV8EUvyEdNv1IIuPgzpdUfHv0E8LzdSsv6oCV+Klrba6FTjFVY7lLnYQC4iw
         mSEKylCWvFioQKyPkWXfSNJXluk+b2ksfSKZk2nIzh4DiXtEz30riK+gwUggnKcd2m6H
         jKgybz9/J+R57YFvab7o+wM+Jjsbz6WyqPQm2Q42Oq4BCtrtZKjxO5+tmriUVJ0kqjUE
         iQAsd/JLmBKJqjpOvP6cnTam2dZ6TSIV8dv72S0njXSbqZqqfBteyQr164EYLmKhKZSy
         Ce2rvlcnEXf0r3AkUzzrENMvlkhxdHBnYhiM6gCLYR/sh9NvjzRNu73UAVmZN9s0QLSC
         G2Vg==
X-Forwarded-Encrypted: i=1; AFNElJ8ka12TrinDy4atCu/shwOCpszhBdiWzB4mLv647beTLBnq5prhfL+9Uy6RVu49conUdGkVkJu+gNfL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7v0kAtr8rluUWz1aFkqrzQZbGfVK8N3IY7vtsYuxaap16m7EN
	hywUQyreuknIGxyN39ojU7nhsDB7zhfgIb/vitJrr/56WPZeSOXca7c267CgX89h+FkemtGL9Po
	3LkWtoWXyRDty5Ce7sTacmq+g5r3ZmJf2rEoV7JMtKJs7jrSfwjrQtv0ZSdl8aCnu
X-Gm-Gg: Acq92OES098l08b1V9EtGuMg3OYC4fQn0MoY1sgreEuX3DHppH4dO//bu+WcjWfgvkX
	M9OGdWa+XJDvBNZ5FIJz/VLk9X/fs7fRvcXqU4sczDPDRkbif6rtwj5dNEMPwQi8KCthq0V4sOK
	cX+hJgOlwuPGtenKMnNW7biHTC4f15CHorc8Z6LN9ybOt0sfm2zy2SXCbku0p16d52YX6hIKvei
	k8pdGPRg51zqREuYBoN9vmvBEl7qhzIt/VEtlcUrNul9+4Ay3j28rkkB+8yBqzyts43nJQFBiiY
	/Ia8sypkFYCJDUSUOXBteWJ3tPOIjhTEddgwvyrnPkMxnXpCGOsfvTMh6DURKDhZXRxwjDBROmR
	luX9F75lOqBqc2MPmScJkSSddX6z4b1fcpgmJw24LSlgWnmib
X-Received: by 2002:a17:902:f705:b0:2be:3dbc:eee5 with SMTP id d9443c01a7336-2beb0365bbcmr56286905ad.2.1779479682510;
        Fri, 22 May 2026 12:54:42 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2be:3dbc:eee5 with SMTP id d9443c01a7336-2beb0365bbcmr56286595ad.2.1779479682054;
        Fri, 22 May 2026 12:54:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 10/18] arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:01 +0530
Message-ID: <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8sM6krUrQLyqWWTGwnkxVNy2ARBllZJH
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10b483 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX3ktv4+DWXnyh
 q6AgaQTXTwsnzeAzMNgZ2PegbPl1weavurlD/WM3FWnqD+LkCVSXn55TUcLzgJLmeFbGrd2xG39
 CpeRE2XzoXjza5D5VyGOwm+fTsLU6a0e9dVXL3Nufy7RtObzEpgN1l60rtvkeSR/9xK5jp7FvgY
 8wIlUjeeJfsFkElKBtvCCk54tBbfP6tCQNrYPQ4s+F3Dbs9bPB3ZLu8JsQ7vzJa7VC4OlcA2vS/
 v9gR9xrZhwICq+dz5cMssQlHL5+X3Uffa2of0NFPyp95jup+RhaVe1rq6ghCOcr5V0OXTCTs3X6
 rBmnuksGy8MsxQbhBaj6qkqZsJOHwerjzD7PQhKufIDpe/7Xeo49yyr1R2LwFsNdAIbHKmCCzSL
 1zlmHDWTuQLgYx2RLVwGG+dXOFnhu2eV7kixvr6Rh85R7twRcFWp4e6lArAsTI4iy6t8zI0OUw+
 y/5czl8lh30n1Z3/ZZw==
X-Proofpoint-GUID: 8sM6krUrQLyqWWTGwnkxVNy2ARBllZJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..27ef1de3edc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -391,6 +391,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5533,6 +5534,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0

