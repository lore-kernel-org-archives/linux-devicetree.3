Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932163FAE1D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368857; cv=none; b=qDQLfBUwT0WwiYDF7CBLH1l6RJiVXTBEkotfdmjXceyCUPiqpF7qP/ayGGqLLi8soxsRdQwxNP459pomaE6mkICyHADY58as97XtAGkyJ8RF5YwqA8LhURwrQNVlfX3UzP9VVBbmdD9Tb1YAYynBqi2yKeZHQRcL+lxSBhGKKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368857; c=relaxed/simple;
	bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVNzfZLF0yllmU9913UmvY+MiY4C8HF0RLwi9oFFshYsgK+9T/5hOhBK1mK0H4b+SMELZ1CRCxr/xGy/bjt3xyXCOCbmaLf++ylcgXAvLxUjG8kb9nV0mNpgy0bJkmOjxmdWT4epgcfgOZK27xUr4Lc/LUYQbOjOxzztEruBnGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTWJna6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEi5iRGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTWJna6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEi5iRGJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99lC83451365
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=; b=eTWJna6NLmUE+AZa
	JEIelb/mejCH+13l5ImCrae/nlLhA4Ds3HBslJy4AHylDz56SMsEz3sutYPi0qDX
	6oR7flLeGUSbYitmmvXKE0+RL8JiRKj+EDo549eCOhtqeC6s9Befi+QiuBsnCMNX
	QNqVK2lLk48JSJXXFAWC6XkXlJi98iSdZLexCH+IEER8ZLE4lwJAEGoVLcuEn+c3
	6XU4xVV1fUKpkQeMiXo8ZG49yYyBOuSdjf0oCHtIa6lcrXU7HNmGnizfoCcTc1ai
	mkXz6z0UnpPQ9WCZaAZLo9kdvmmE/zxgF3zmxH1bLlDrzvk3G9LI4qdZtvUvmpaP
	qswV3Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso15013064a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368853; x=1779973653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=iEi5iRGJ42NwyY+QP8NjD3BqSwoQVNYtz4S3GV5FeQph6y3oQgnk9/FkYutq3z6/mv
         uNl1ddd0rkN3GAOVGtmE4gTDd5ul+zMYHNZdVk6VrQLhb/UKlaWA2fqkKXUgRK4Y3i6m
         I7fzcyI+iWoBxL2PpzEYSrkOQkHRDQSz7bjfl7Fye5yLRb9wFCp5UuAW788D9qUQzq2a
         MrH7pQ+J5QWY/ruY8ISlHA6Geozx64YyNZEERkJhI4zDkLHOZ629k2cVNeNhNiyx+Pmq
         w0Ckro+hF/j8eJxhlDm6c7Hu2K1W6QaLsa8DGDS6Md1/rVL1uGxWTjmNbIujO/YeRQmm
         7NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368853; x=1779973653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnE1TvLNkzojCPada+n2m2yx14XKliJ8cTA60AIgsqE=;
        b=JSuSFfII/17R8F+F0kovpgN468onqkSAfh3IzU4fe2olN7L9rrbjz4RsaV8IQ7Rn2v
         5hcrjNSBaAi0MetOhPIfkKSkX9gcd3cFDZdeCtq+FceSSH9+qoJVQVCoTZLqzDHV8QTq
         ppjdvSnQNNHTx5geQx7GJq8Lk//Q8XODTJm27/chYRo89/3B19s0gHq7o/tkGJZ3UbEg
         xRQIFXFUXFuzM6G6H4kjGLPkch3qdaZ8TvXzbea+IDCcXgmypns/J3H8XnFpZjo1q0Gj
         XbvS4dKlcRA/QSxao1DXBVo/bHM5jq+cctOTzDxbYqzCA1hUq2Q9pHvMJX5yDwUlS8sd
         sC2g==
X-Forwarded-Encrypted: i=1; AFNElJ+JPeg6qqtfKfWyh7pO9oVg8eZdnEU34QM8Zh6rgtuNhu29I5XCmAcExbNwki/1EnovZ2BJBJwAhOeK@vger.kernel.org
X-Gm-Message-State: AOJu0YxpzaryPxhjRSuHd7RpqG9n7DYyzBrCmS8SGkqQrZIePjU1lsko
	wyneRvlBWkjQtR0PnxA7dSPoTczqI2SwqZ8CGoYUWxmwzyePhsU4HnvUZIWHgp5Y5uA+tX/RVd0
	9YtjFshj70ydnqC+qNIIoJZk8xAb+PeavOtGhk0pZ0dScr86cqkLheF9YUszfVdwN
X-Gm-Gg: Acq92OEhGGL138KWynZoAfoTqK10OfJ6xQciacFIIkMWxZduSXA0V/qbx8L3p+JhXZo
	btT7RKFPpibZUsLwVNd/kJnugQgZwXnZvonu14Tev+5+ECY37iMWGbWF+u+9f3/1n6siibg0oLz
	2PdKHDC1HFXuWUkolQe04edJsFVKWiVwHRwxAXxggde6EViNj9Yd6aYbGhRcQSllXnjCG3M0qQ8
	f7tPuFKeDad0yd5rm1Ay77pdHFcyN4SAzq5EJUW4aGXBJ4Hk/K0q2unShHIdS9deKsjRfPXJmha
	rpvgLut6CzRuxZ+Hyr3hPF9MlgIYIZkr851wHhpzud8gOIDzQnLI6VpP2a7sTjuaqAGJ8C81lIe
	Nfyw3RCUjGqKE5eZQ8EiWhlaLHy3rrj1vhfJJh+eY7TVNPaoa8itIgEvh
X-Received: by 2002:a05:6a20:3d19:b0:3b0:98f3:b120 with SMTP id adf61e73a8af0-3b3087326bamr3506726637.22.1779368853316;
        Thu, 21 May 2026 06:07:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d19:b0:3b0:98f3:b120 with SMTP id adf61e73a8af0-3b3087326bamr3506669637.22.1779368852897;
        Thu, 21 May 2026 06:07:32 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:42 +0530
Subject: [PATCH 09/18] arm64: dts: qcom: sm8550: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-9-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=4508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kHfEKHzK5YZNeEUlQiJCSZQWWRkBf85mjselEiAzb4Q=;
 b=k6adMTJy4CttCPiQ6b4972+Jh5QQtwZvSLmdjNiYV2XgiBaCwzTlqM5PXtpbmGZno3hCwAiPl
 FOjZZYgnWokBIqcnT1/8Gc/qDJhSgJ5qr/ys1e5L35dsxJDV4xwjDFQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: RzroazZFQ0sQPBvnb7SdFbvv79qfYnF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX6oR14NrZBZpS
 T4MF+MZxiHdxupzC/idIDbqT5U+8Qb8gxJ8ZuWTQb2ba08EPoaXKy53jXkdJnsidhmjlyF1GZKj
 Rpm7Orf1jBw9/HA7spwpEO+hYZDx668SBhXvd8rJ0xl/oy7js5O+Ypz7y+ipDjkQNE/7hoFn+CX
 qLiL7OwXkUHpcsfYRgkm3+OL2pRDHJr0owqnuMkd2M6On+4JdRg23OLEvq0RBqa6qtINpbWQ+2z
 eRgSxLqhoIlZhVIlNQsnP91THTf+Tcf33Q/aT0MYiX62ZCQMKAQPABWk5aer94+aRoQSl6BDeVc
 jOkypz1djE/2oY+L8zp1n6IaftRbLs5mo9sDuQ4LDYt00gt+7M3MWvJY3J36NrHsq44Y+C3GF+e
 HQQz3r3hbq5JgSqdHnwzKzGvct1RA0DHteOPgJ5rNolNRl4bLB6OxLMCX67A4v/Ups48UsVgScW
 xe9wMl0aBMhVUzOYLSg==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f0396 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RzroazZFQ0sQPBvnb7SdFbvv79qfYnF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ebb643203b..5eb4626c6129 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -336,7 +336,7 @@ &mdss_dsi0_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -349,7 +349,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..4709eb34521d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,7 +1003,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1037,7 +1037,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5769be83cfbd..7703ebfc1b67 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,7 +739,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
@@ -756,7 +756,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..5ce81ac3ab4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,7 +903,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..cf4e4e9d9e26 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,7 +510,7 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 0e6ed6fce614..d23fe714bd27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,7 +584,7 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

