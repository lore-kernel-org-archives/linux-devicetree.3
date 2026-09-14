Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95083A1E69
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369245; cv=none; b=a4xuF6X1lmZ4cMy3sV/vzvnga41WH2OrQEIjOdAI8Hy6wfiTKevcJzNE8zkFbo4Ez1/eNyRovt+gUtNDwXoPwIxkhnzZQ/BO4xl7UxK3I098nSlj9Uyc8ea5Zggjt7nhBOYB6sR7cQwfbJ5VRv40XhuUS4AM8kYBwld90IIYcxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369245; c=relaxed/simple;
	bh=MTgJkEYd+4/nBcWAxrDM0prIOCEic/yoyIr3pNRSlPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEctCYkvlsAmCAQo2l0LZtmXKXNKMsEeiYNEPxTLiVoHTVDXuuJlu9pGIwjHE9TwEdEF0Bp8o/zAT1/V9ptn/QhroLNjsi1Uy4dR8DzXw2XG/RBkEbWNEK9MnYSdoiUxjWBHkghV1GGrkiSHBpUINKMXVknD/93vpp0xamCIf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plX5VO4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akgf8GZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plX5VO4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akgf8GZI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iYRC3127221
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79PxkEjm4QtRUcuKqZk7+9UAU8zOcDoMEFQZGxtWjCo=; b=plX5VO4LVvhQbtAb
	Qn49Ue6vSnamT1VgGLE1zHw5q61Ecyb8b03QXFgqU+cRzwZ5zslnThxdTtOn1MkA
	TCxoARP/yWWQVrp8/mvgnes7spxSFzvwNJEH/Zt+o8B0TlltQj7O3oY4cRkpwVdK
	rH5P8CExVJO/EWpQBtr84LTBE9FdnNMqNvtze5Q+arBIN6T4hud4Lb85z3z8kWwC
	QHCliPsQF81lBgN7uS2govIjVrPF6UL2BWxuL4kOkOL0V+RgXVrYcnqIkFZSdaIx
	rTQ0mMk78zUBOwjhsOgvCdxpgUpuRzpN67jjqscExmD6Ms39sc1Vtl+7Rc7JgJOb
	nlqtiA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n990-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a43fc3527so3971349b3a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369242; x=1789974042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79PxkEjm4QtRUcuKqZk7+9UAU8zOcDoMEFQZGxtWjCo=;
        b=akgf8GZIMIovt0gUNsZTiKWASnVJ9CN97eYhJu3h19zDaS7xrAZQQLbAb82YAOF6CJ
         5qFC24bgVYuWAl/oYXEAoqOoMEnSf22XmvvFOfmKxyREk8LhWMNye0rmul+i2CXmvWYT
         aYQYNo3vJLGKC2GDxiZ59ErG8j7bLf6ZlsJYt+lHFAXv0A/7YIRm3rmYWiTcDLu4ueFD
         oJfts1VSqvBCLRi2duRqoMJ3hJjZ6ZJDaVC104Euu3QccMR4sDLPz8zL2NgAh0WZnRY4
         evlBZe19siXEyq86o6leOEg+1siW+z4vkJlwTfikUIIHcU9J74Pov0Z+3jWoraQsZost
         QINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369242; x=1789974042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79PxkEjm4QtRUcuKqZk7+9UAU8zOcDoMEFQZGxtWjCo=;
        b=O5w/3W634c3ukufw5h4B8EAdAYWQJGT5z/CzyX4/dNb5jbqCchKXgkyrTduU86dvyR
         flHEy/kXW1S4F8Qekz24fRiFx5xy11VLTZ/W5r/TSAPwDJbUAs7yQZ6GOCrF0cUDwfSa
         Zc2NlF8wD8Sylwu9JYX48A5URDufshdNEoiBnCWfh8dSYc6RI1NmNePA/a2KagZEzS8c
         m7VGgEmBTQayEZsIwGKiDEKeLPOjrXLGjsdn4ItxvDaSiExUdD8XRjxVTe6CD9W0g29h
         2PlpAOv9q0+D8jA//7yAQbYk2UwUOsREAudBb4RsOuJCdTwZ48PchYZlW9iGYoZIZhhf
         zTGA==
X-Forwarded-Encrypted: i=1; AKwUvBw5OPaZNYfQVc7J3EJsofw/xryWMQdnqJpYaAMoy6KUe13u5KmuSGOQkO1CgmFjUR/FIvJci5PQIAMj@vger.kernel.org
X-Gm-Message-State: AFuF++kli37btoIerhzS0/yaGO9NmqXowA7D+yAIRP62uJiYaJsW6uZJ
	enNPQ5JC8PPkho2ZrqXnEvj5rmuwOCIs2XT0hwSoZcKb8etkm4svd5vJd3H0XcSjoUhSmtK18VB
	Xvxv+7hI/OXwqSK00/8RJ9mffxzdoeUaVv2NP64S9LknELlI8im2Lka2rw3hPccBD
X-Gm-Gg: AYBFou2BQf5zm8QIOGZbqU00+7nRd69XIxtf/lY+GLKY9y4fWc4eUnksCMkAcNsrolk
	E9A4ASWTGzZfb8pHZdelO068mieXJeHyAqKXQSds7dW2Nk91Qd5/8Q9ebJrdcRj5vDrRN2alUPQ
	+mB/VFynzkYNtSvEy7EkvcJsjr4VzaIpCNv5POl7xD9LLfzOh7e9sOfip2g44DYcE0UYB6M1X2S
	ItqNM1cLVBY4M23p3nFT4iKDiymNGSd/O6nH6i37Nh7ApTsjhXoSP+gRnruTVTb02MaIkbWV8mM
	6txeuVnt0/oJfIG/VHvNVfoK979EeSKEej8A33mW9clp19L5ScaRRZ0o/Z0Og5cuBC9fD5g7jl6
	nyVTOOyCzoidqXRj+CmHHusNGbKXJ
X-Received: by 2002:a05:6a21:9cc5:b0:3cc:dce8:1109 with SMTP id adf61e73a8af0-3db26cc319fmr6425003637.3.1789369241569;
        Mon, 14 Sep 2026 00:00:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:9cc5:b0:3cc:dce8:1109 with SMTP id adf61e73a8af0-3db26cc319fmr6424931637.3.1789369240968;
        Mon, 14 Sep 2026 00:00:40 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:43 +0530
Subject: [PATCH 11/31] arm64: dts: qcom: sm6375: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-11-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2263;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=MTgJkEYd+4/nBcWAxrDM0prIOCEic/yoyIr3pNRSlPA=;
 b=p3M2zVMPL2kGH72DXjavzD/WPEufERE4TfQ9FQUe5QZIgZC/wkGJV6dPT44h0nvjmSCfA3V0M
 DHEGhSqT+J1AZgTHdrfCrsF1g7Z45yWS2QR3dPLLoy38D2beIm+ry5J
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa79b9a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzJ1IqsmIm4ci
 h1wPVbqz5VW8fYdvUFivh2A2/87T4KTOPq7j3tqDMNGL6qsiBPZhaTS4y+1YyMCN1mJRbJdG62K
 YeVVXqd2cu8Q60ue5TH18vleItss3+A=
X-Proofpoint-GUID: Idj0bLLYmh1cCuS3Z5JT0koaWy5ojTYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxkufiRjRR25k
 tWe/6EwaS/8y429u87FpHIAcOJp0AiSVeiqF+LF8HSOB+/r+q3l8oUN1XYKUO57ycZz1iyYnYsh
 uBQX5p9hL3B28X09tcghGpvC/NvXijKRXumDZ7OTcqASt0dQK4TSHI10K3dP0t1pmHJttDaOMPv
 XckzhIYJ8xvb+10YEabdOm7iFy2tCsjRQ3tBvFzdvAAlZKTSW0q8PX/6HiGqc/aLrx94H1HVh6E
 /7HUmeQY2nxRmPnm/2aDgKfAO0Nsl+Xz9XjyfQTi53WRHy8uLAJs1ofQGa26kyRUWwlctBCIJWh
 y7Qmu9twlQsxF2F04eH4Umjdsebjxt5S6OOAgMaYaAmflEejrdiyOwGVuOFCdC3AAEa2H60DSAP
 APKKAjXJRJbIkRiYRd7DSjqmy94R7Vy4ISiMOmLa3f/3UtsO2R7cXd0sXs+E0/wJzqon+GbzT2Y
 xHafyzTobc9vtaSCCJA==
X-Proofpoint-ORIG-GUID: Idj0bLLYmh1cCuS3Z5JT0koaWy5ojTYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 71a228597093..c0b6ac0cdcbc 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -252,7 +252,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-power-collapse";
+				idle-state-name = "silver-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <549>;
 				exit-latency-us = <901>;
@@ -262,7 +262,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -272,7 +272,7 @@ little_cpu_sleep_1: cpu-sleep-0-1 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-power-collapse";
+				idle-state-name = "gold-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <523>;
 				exit-latency-us = <1244>;
@@ -282,7 +282,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <526>;
 				exit-latency-us = <1854>;
@@ -294,6 +294,7 @@ big_cpu_sleep_1: cpu-sleep-1-1 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;

-- 
2.43.0

