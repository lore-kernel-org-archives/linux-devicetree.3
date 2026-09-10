Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7E4A0EF2
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047034; cv=none; b=iGHcD9iCFtW8dh1abUGqM6JUeL/Yv2AtLrnkj0nIWPswQFL+CvXGKLmpXkDJd+RPOCtOSgapP73Aw+J4MPfTG47xCIrYE9cU2zBg7T+BuDOnRv24MhtImEuRRj1hUGPljZSlyRBGgDqqnhLpmhtMLhZHevj8wFkMjM7RMh9nCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047034; c=relaxed/simple;
	bh=P/DAkwH5XdgfbdOhKaaM0ORG6Eeibg281YpoKLP8FLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igep2yhfjzP5DtveQ3hoanA6hwVwk4ngSKsZ9YHRMabWNMJdI+htGlJqRqP3y76bPsL8/TkdM5UFOzkXysUNsy2DXCAKcRpTINkAlDee/GBSIeEHWwpusx4nuhg5HJiFQi+Hm95vcL7F3EvLm/i2lhCd8o2KqyWU11A/XOHkdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yu/8cI38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHWoDXyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yu/8cI38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHWoDXyJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC8M1f870274
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=; b=Yu/8cI38UUlopytY
	FSSP4kbb+w2VxHCja1ae54nSEEm6L9Oq1qJpqA0iF+0hCDnj2gqaUKJabvFHqROe
	2I1vPyrcRejZAWJQqme8QyXzu6PJQqwaGqBgY7au3vU6+Q3NXQkE3ILPZlpqQYWv
	n/5aCklfQF9MKqTfwE64sfYV7gUBQi+1sWXxWnD/eVIUeGLAyQj06Fkc6HRME9V1
	v1mbyrhZNu6LZgsAVsJmIjeFwQmCY82qdGH2XqqBfk9zdnL39pHMT/L5dkM5EG+T
	bYvbcmGceAlSrL0Uy0yoXXuJc34GekSHGZWpQMR3Wgn0VE1ydj46cq0cgXCCWYNU
	qAcDJw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd40ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:31 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4fa572ba2so4904002a34.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047030; x=1789651830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=;
        b=DHWoDXyJpJHb8LQTre2sTETcGkwUTjRAV2Nu29kUK7PivVCVD73TLHhSee0EEOvC7y
         l0J6QEYaAwvn0GW+n1xATSt3kZlqhc7xklZY1dgsFy8Q4bfCxyqTP5WjgLrZCxH2GnCn
         NMCdbDvsPqNQOaXLif0W6dET/EUYabBjLk8U4KlWqprU7YhkZsUxnijIyX3EmDqerQLA
         InwCuxWq8aVWuFOqcoTp/pri9YY54kSuX+l43pOz71TN4n6Qgw4BzakaCtVBJCGqiDzN
         +nVaiqHKqR8K5tVZe4zAdMXvIbPYfRQF70VRp4ONtWlC1RUA1H6fb8x2Wo/lQFqlxlh0
         i1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047030; x=1789651830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=;
        b=I2hQNz65DszY1uIBKrisKgPODpgxh9nSAAZ8oZ4VFfNaJ2r3FmiYJyBdagpjQCEgdc
         G/vJlKRnoGFi/vfYaboVGUnLQ3LdREHxckGWipOnsv7Q9Pk0fq+8ou4UUMrHfltPoY8S
         Jyy11uKHHPk5lJGV8LMzJBX1L9Gnif/6eKRYhPvtZy6TD/pbjmg6FGwlCq2XutX5/oLu
         D6lK05ze97zH6sShbPj46RvUMhuvmYmXJqKwvurmDqInlXVmysrtkoBnpgCmBG5fR9fU
         2eMUQbTMXLhgj3aFZaVc22Y/8N2917RUzwJqqKGOrxnbQ+bF0Z7D2E7ImgXom8LZGjH/
         8yjg==
X-Forwarded-Encrypted: i=1; AKwUvBw5RMyDf4nEX0uNGKnJ+9yN8SZ3H7mtTrvneEEGhwm4jLvwvPnzSXrV1CZMJL48rge3zhjgvHRSm7zy@vger.kernel.org
X-Gm-Message-State: AFuF++nfWkQYkxuAvTGgrljJCYe99oYBK1Zg//lEnfD4YmPxGFmVgZKZ
	moZV/yvLI6a6eqYhim/xIa/lw/8/jKMzHcLwO1XHU8QkeWFl+u6NyeVkW7inUbM1ZqL3QTXepNE
	5QclTudFvXrcx1Tpr04ZzLQnW/6j2FHQgvoTgtDXwT5pc4yZHq954QHHNGPfQYBQx
X-Gm-Gg: AYBFou35YXJs6UB+qyjXuirtxbPLKzykbFwOvbJdN1EXuepcthvW7G5ZcL84B53bRFa
	RWgRRDz03dCfY88QyaJhMLk/HMeQaa9a0yPJ0oJr6r1SJJLOUjBPJDJACn7We9xlz1IXbY6XL5D
	sA4aQcM3hOuor8Nr3I2lRfkSbf2mf45MEyUgqvDoPXqw6YGlixCM4Q8AkuukC6i8yVvfNFaZWdm
	S1poXz3TpKkZKHaen7U0GaDLP4vE2m3iQHuVjJS5GggZiQ9awxJkIURbIz/6i8rNUnICQQe5rYr
	YNMV1GjS13StihUktkeCkDI6N/5MIz772ArC9OfRqF2wp8em6DlrknEvJnlWynA3VV9m6QiaIzI
	XW3pc7YAjbqzy+vbj2LXiiImqPeZ2hl/tgVc=
X-Received: by 2002:a05:6820:6ae7:b0:6b1:bb82:f7a3 with SMTP id 006d021491bc7-6b6fa7dfe82mr20900879eaf.5.1789047030156;
        Thu, 10 Sep 2026 06:30:30 -0700 (PDT)
X-Received: by 2002:a05:6820:6ae7:b0:6b1:bb82:f7a3 with SMTP id 006d021491bc7-6b6fa7dfe82mr20900847eaf.5.1789047029674;
        Thu, 10 Sep 2026 06:30:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:08 +0530
Subject: [PATCH 19/34] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-19-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4282;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=P/DAkwH5XdgfbdOhKaaM0ORG6Eeibg281YpoKLP8FLY=;
 b=GOgBt2lKTdgq+epLTU9e6Ckx01LRGskxu13sEb9k+BhYTgYDBnwyZog2DeqUY/gsJL0Qbu7FN
 8QmKjlCpiQTDWTavG81aW+DfWuIOND2TeTngwxzDli9jTTmlafziuCJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 70AsZc6SnWMx852d8Hi9cotuyD8mn68s
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2b0f7 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: 70AsZc6SnWMx852d8Hi9cotuyD8mn68s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX+E7bHYVOZ3EM
 gvaauazOtqy82ceUTPekUsWweiubFr4PaLQIviyzEDifSTaP1b3EovGxrG7yuBKvnV/AmeanUf6
 UmoAFL1ouWIPhBBx2wGyIDQnwjWwFbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxPhvrPIUmpp2
 HKGLsNWaJxtWjrbSfbbA13fxdivQXSDSTj9LtZnuEUjYI6pjPLAk7r6bhl4tlOSGYNca7VRSj+2
 e8xNQMPduwSrGm2WS41fuAqysb7nAcCWLwGryUIbLYgI+ZHXCC4d74MwBAthYnYr0sVSZBk8Prs
 oWMZ2jlEvjp355ZHrM8K35PsomeW6NpHK2y33KgwtWCSIAd9ZbYZNuqcWjXfQIr2Z6Tdz+sShhg
 +0E4gVoH5AIVZPZt9DTA70ItxuATo0Q+P0Cm8TrjWgYKJzcs+12bMJI/HM5j7YVjZFwDm68cDKj
 kWzIlL/jL//goFRrw/mo32tv7h0BRaB40Kx/PpxHzrgE95FEkSjigGpmw0ip8VcllfKMUE91ZPS
 Ol3ox9BPVman18j09jkwU4QQnkfJocMJTbzWVyF6nDIUy9sHywMtTAbsxSMrAd7hBYHLjhrBkm3
 HM6XMri6HmNbdaU3MOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts       | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..509fc4941a02 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -558,7 +558,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -579,6 +579,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 };
 
 &pmk8350_adc_tm {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 41d60c87f5bd..ed0b81710b9a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -541,7 +541,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -571,7 +571,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 };
 
 &pm7325_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..6527cf815b85 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -705,7 +705,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -736,7 +736,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pcie@0,0 {
 		compatible = "pci1179,0623";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..4ac2998a0a6a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -833,7 +833,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 4f2e0109f49b..141d263e6566 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -653,7 +653,7 @@ &ice {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -670,7 +670,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";

-- 
2.34.1

