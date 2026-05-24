Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0273337BAB
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652246; cv=none; b=V5PL+xNIcgb47RDlhEydAfUfC4sXYwoNPZRIgjFVcUQEMYub1/XdUtfxjSmZKTDq/oATvjdgj+7RfQP4Rf8KKq52lYuMNXZ+TiuB4zxmZSQCni9jjnjiJJzIs+e0PqYfQ3zoBV072D8NrVFJRNQ0YP2bj16OyiY4GhIexfPO6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652246; c=relaxed/simple;
	bh=myXGbohZc8eS25QokdStbNan6AbEa0EEYXTBb4ty0eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzX7tMSsqOF1h5he4nTA0ulY+lqGoDvTyVPDPQ0/64MvZQM7z+m+xyH481G6NNhYvCj9nEVO/0vRkbn1GdRpJ5/MG5Hbb3czDvJ5eeMHc6rLnnp1C8hXZBq7VfSLWxH960c8ct7NG/jROdyyn/x/cKsFj3MwbgEj1Ryje78F7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUJsQEJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C404NPY4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUJsQEJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C404NPY4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJ7qo11508064
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=; b=YUJsQEJWZ2AqUZAA
	R6XhWPTPq4klgrnlVW/3DMZ8wt1EJB/6dCTw0x4CwH03o7lt0z+Hm0MYHdNcjZAr
	Dvf2d+hCx64jc/z4cFjfUXs/SF91Andd4fhoYBn+UJ32d/a6rqfZk4qGPlxddlZk
	hlQf2M8qpS6zD4azNSJ/yAS6GT0SFGHswxb8Trd6fvYiaCXH4T5SLTJWjdLUUOqd
	v4c6s4TwfhsYJdGngVn33YJrjJPdNgKmN0NFgIAQR4wRS2iez6v11mkNZJpiEHD9
	LvqPDbf7UFdRPzgzQbPCrlOf3p7kYr15ST28qKrBzYy+1roHh+nGMsa7eEjlAMYL
	Daf+dw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u4a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36629e48023so8365727a91.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652243; x=1780257043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=;
        b=C404NPY42RWYYmi+uuls/ZjXm5Vez02bXSrK50+hoALhVtM+MnqDXSMrB2vbfDvGHn
         X6y/ZNIzwJ/eo1iBwVXiL6ZkBJLNK2TM7Pu70bjESvnlRol4SH2Mwdp33TJ+fmTqOYDh
         9uKKGAqEp5PEWPVAuLxtEKWhgMw/svY6xidD3JNW06q9p3sE+ZfhZS584ZqYhlEtUcMi
         AM0fIYrCySYb0TPTyqMVzOIixmq/i+YKKDKD9RlBCXoPXEOuqy/fewCtQ0CSQhHApZYh
         lpz68o2gB7kBjB/5TCF+LRMJKvAk5d0KNb9CBEhvaqzFyceNJ3Krd08TtMoq4Q2JnZAU
         mZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652243; x=1780257043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOFM+2dGVt9R7ANGb/sbfRd2LQ9qIrMEUWcvtpHzlQw=;
        b=XD+6ORpFeVwPd5IssghilUcT3EPlwDqqJ5YwBx/+5lZBGvI+6JaZKPHbLKjvaMHjcm
         OQiQ4N+TlusumrAfYoqE+W7QCDjurjmfu0VpvgaHofcIFEbMf1MM98bwqwrqqx5BYDkI
         mWnZ1LO2oYRnvr5b3aCK9q6Mg5x0I6UB1t/MnSQMhrjpkPH+/NBgutwaM7PMlDP98sOH
         j+SLrNOKslsgUNrYf9vt0RtbEZnLWly2R5AQxcRc5T3HJLPyWw4U2PFRPG8KmAbC7Rh9
         ZcNSoEuNtjHlHX7ab0R8p5o7CPIRXuhG8f2MVe2Ii8/efuiaHjaxtiwURLjcgJ6emKlD
         FFQw==
X-Forwarded-Encrypted: i=1; AFNElJ8eqp/GFlUHFVsvxR6GBPSC6JIVClf+SS/6Qah9Aqs3gAnNMPluCYuD0VOzz1MMLOXNbRV2H8wgR1dH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs4NdRDqwVxacFjS/BWEFQlCgCV7f/dPvVuxtvGfdpXD+cS4Jy
	Ye3aatENbolOFg+s+sNn4/U8kng9arHqqbknho8NcRWhFb/k1XnoxT72U6PqXqLnd4oQDryXKwy
	KzLZaYkv/247IqhNElTeLfixidYxA1IJIuE8/FxVz/ObC9+9GDSECtv+sb9n8ZjZI
X-Gm-Gg: Acq92OEewklucyFzeJLnHAMxvZ0+iQKch+76kUdU82AGUV5KMBCSQj1Tvx6T6mY8LKF
	Yk6XzE2XbfRwXc3uefdf1qgodBROIH496PCd/dS7N23UxnWrRahPAItfNZBodgxIi2SS8esvx4v
	1o5j2j0m6LMYpmTEv/e0wLZp7dL9NUtd+KQHtlVYdOV3JXnNCaEUtvIIZVBjxu1+oEPYrvJ4T6Y
	vy27GLQAJYM3BQFe3UQg2YVnTFsoH+Lel2SfbLbx0J3H1SN8jMsiYS/hcSKqGIAa5E2X22qHnXM
	Ytw6pTaE+Gxtp4aBMR5TOFVSSsS3IWAVYAraPlLCc6suzO/Zb3pAIcv+Wy8YaqDzZVK+K4YMU4y
	tFlBbQ4DvJMxyxM1qOX47TbylSqnrQIELNb13QnYRWyEbt+o=
X-Received: by 2002:a17:90b:3f4f:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-36a67475eddmr11595859a91.11.1779652243378;
        Sun, 24 May 2026 12:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4f:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-36a67475eddmr11595838a91.11.1779652242807;
        Sun, 24 May 2026 12:50:42 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:18 +0530
Subject: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=3298;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6YTvlWrfOM9Uj7YIFxrI0dRea/7p3Vn/P2SEf4jl6Jc=;
 b=SXx+h3+DeUTd/cTjF5htX+HJ1y7t/RGA5O1q7a2cEmM+1xksj86jubrl+UsbvoPjQZZD3hd+m
 iFXBLLVFAqtAkBnzEuhU7mJYXT4CSSsh+opIugMRizh16ovhdizEU6U
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Gdbh5OYL67v0RjIjvuw3nS4VxuyxVxYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX7GO7011w3yJ5
 rDjCq2wpcS2bRq1IwSd/mMKvDtVzLLYRL2zo6PAg7drcJvFzz2BwyxPmeFifFgvuC67QqXYA/rQ
 U2iRyW6U1KCilk/jJLTd31vRL06ERYCe3RzowYHvxaoaFjz0iOW+kaXcTjrgQExVKajXXOKBaeY
 Zk500s+ZETV/OutF1vIsHiYUnhSgHZw50xxxLxBg3W9Ma4Z523IXhFXy3WF9PhnGZdXzAItZAru
 GeIb72x0yHXPVfZAA7AxDGIqeqF5SDL07XXstmupTZeMGUYv5RnBJ/a5u2KCKm24cHooioF+RLn
 Exfgl/7dpfMMsiosBv8rDxjOeBGobQV8X0yu9En9b7mQj5/Ug/FJ52JOul41tw+kTqgLI2atzA/
 V7qu5/QiSqTwPbiG+F9kgCZheU4UjctKFbO5w9sgnXU1mz5dk9rsatxs4M/1TwdL12WEnMk8nA/
 csmpFQCEcMc2j/yjBQw==
X-Proofpoint-GUID: Gdbh5OYL67v0RjIjvuw3nS4VxuyxVxYP
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a135694 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OP1gjdvSne2naBZ_9ZYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Yepuri Siddu <ysiddu@qti.qualcomm.com>

Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
supplies across CQM, CQS and IQS Shikra EVK boards.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
 4 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..259032bd20af 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
@@ -57,3 +58,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..142cc8da53ce 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
@@ -57,3 +58,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..9bf52030bcc5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -16,11 +16,20 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "bt_3p3_dummy";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +66,14 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_bt_3p3_dummy>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 124d0f05538d..73681bf0e3ea 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1753,6 +1753,13 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				pinctrl-names = "default";
 
 				status = "disabled";
+
+				bluetooth {
+					compatible = "qcom,wcn3988-bt";
+					enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+					max-speed = <3200000>;
+				};
+
 			};
 
 			i2c9: i2c@4aa4000 {

-- 
2.34.1

