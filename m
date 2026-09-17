Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8874DD3A2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647954; cv=none; b=IsjSU5bukLtY/Hxeu3/l0Q6MBs9za7DLzyrlOHI7wa1v+qUpc/Y52ui3/xXhbeWkGu4Wb6BKmfBdewV5gDeXWvGoNNRCBq9xdAC7LM9lKlKyN35BvLZs6upOIOEFjNCpg91PanwJQ6GeM7BJ/KcpCaN1mZM3rrZRqtBeMK9FdG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647954; c=relaxed/simple;
	bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=db2UL4WQ35KQGm1tYW2367aUkagl5k1WEdZnFQYSb5yvkpLMNlSx4RDB5WdJ0HA7VnRMlNWP4GWaz6u7h0Mto/rC2CG+CUiMJuRMs9Oin2zI0GlsLdZt0kCDUiUyXwcojdxIvHupyF3r54k+xVNvUYAcslwGeWrd2gnNNUH8C0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAciQeVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWiUxRhR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAciQeVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWiUxRhR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZorN1862956
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=; b=KAciQeVu8j41vZIw
	QPVl+TNdgDPNJAH/v0hegAHZq+ntI1xhfqrQc72HCAoVDNWS6XRnuhQXyw2ia3Mj
	IF9SsJTbFk1tCeh4zHqoacyEwVJLyrra86Utz1O5wQT+yq8XkMq31PUq1sG1Bc/r
	v+nrb3U7h4mpZ5RS2idLjxEoGLgYx9/hqSlms925XLESi2qDxu0vQUUahRSNudDE
	hSuiU3/2ipdl948aZfwDRG7Ha+ScGYgR8zf2sgQ4dfKSxx3D0/dpmSZYGWhq1Bt9
	eNVt8cqZRAlAb2dwKDSTBILcbPbV/iTHoD6Ftc6hiE8ANcWnF/YXyAyeyg7U1Rgo
	A1rjMw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av65s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1481080a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647938; x=1790252738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=RWiUxRhRe6maoO/jUJ+yA64QHeSkq+S8+JueaRQmf+pzHm4PX3oPoifnbphRiy8AxR
         Z9RTMv67o/oRyGNQRZ02gPeL0RZgAzR2f/dXEgJl6MpJzejpsxpnndenoTDuO2PZABAx
         Ehh64cHqUCaEBtjVWUcKUPipYuWA1/2IH17hIH/RGcq5MkY1wY7jNzPeSISeUsa7KqyK
         UkLGwfhGAQ2yIjspy1IJmOqZxTtmwbvruomlAWf0HqU0RbpEPHrKqj81r3Ir9vs0RsTv
         dXMxYHm71OMoJQIaecxgqa3U0pUQthHVh3UX92jXDmFOW3NCepx7m1+89l63wlq/zMQR
         wMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647938; x=1790252738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=R2q4/xRzvIKphg1XSkOWPYq45vVr4QxlOSc1y3MbZko88LIplrhUCea94/a2ZsPGZo
         ust9XLQiem5ti5PPJGZUh3rNY8w+m54S6xDdWsZtXZ8/rCgLDQsy0L2T6lhFtg0PwbAf
         BtsiJ4VI+mjzSADkBhju7Dtv2FZGnozZSeEZPKFmrMxV38oyh1YODBrzdLbG5gRj7b4Q
         E3hFN6u3IzKTTS5QuAyTH9yh9i4YgSQN7C9u6jZXDcoyieqmWy4SHwWy6r47M3tgdGIh
         xdYxyknXDpWzcSbVHcppREXmIXEp6FsDZbVwh9qBg62z9cBdH1iJCsUqcV/DprJSWUk8
         drIw==
X-Forwarded-Encrypted: i=1; AKwUvBy6wsc5ZSCMm35MQnwjWHgBONOEbKrxii0GeffBzHtBQ8NQRJMRgB+fwWMF6qjWvMvT7buRgl0xdt1F@vger.kernel.org
X-Gm-Message-State: AFuF++kuvS263n00WcaOZ73I7cqTN+j+QjIwgzBKY25VngG6H/XTw9dZ
	DpAV8SAKgnEnGYHGDrBcSPs9VzjrqGysXubglUcCTZjGTF+T5NDQYj3zKEj2oaI+0MoCWDQHPcu
	DQq3pcsmZ61/mOF4yLG3r6GTCRtux1+JWhLehh3FRe3l18tjZfckAqFe05n8kMgsW
X-Gm-Gg: AYBFou2KM8DcowkLuWKTeLjZoWiKO5eKmZsk+RuI14I6owHsW1WQoW9mcMu+Kq/+tJm
	15hMDqRlLg5e6nelSaqqxfjmZNBaxNLpYvrB8x7nEpXq4nKepXv7pFC/+v21B7fHfcEz+yVO9Tf
	7zD6LbhjbNSWL5aWo9ILSbritwDuEKnPu07kn62OMpbOb/5lWv+MhQipoOGGJ1RT0skAFjeB3rM
	eRi8PMFEWwgZ27J39OpoIVv1ZR7PRy4fJm0qcb5WfQ1JMNfko8apDBJ2sJTJ4/mVeZ2TKATiVlu
	SIMw1Sh5MLWpYc3SqT6o3BuwHSMVvD3e1LUr25A7z5sTFO7XkHCxKgoZslHK7CNItE89rGOL9+d
	zP14hi3jlnVm4n0WInMRhYnM3LfY+DItF9AQ=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925784637.2.1789647938374;
        Thu, 17 Sep 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925725637.2.1789647937838;
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:15 +0530
Subject: [PATCH v2 01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini:
 Move PCIe phy and GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1791;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
 b=mWl0rflsNEp/u6JHJhQ0ExsUp87moBhvCU0vcey5i/b6cCsBtOYoRbgy+aBX9WlnpTXkSmUm5
 bZn6ALSCuzoDPI+pNhv6VdKf7cGUF47y9V8klZITJRI3dwqRWSivCHK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YG3HLQ4Jbkox5RHV3AB5Hn5tbUujz86j
X-Proofpoint-ORIG-GUID: YG3HLQ4Jbkox5RHV3AB5Hn5tbUujz86j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxOdRtvH6SzOf
 Slcpxyx49LUl7wAvUnKlpN319DXBmKKVRWb81vDXlMCByNYjZbsBF+rCaNlRQpLxdY0PLGxSdFy
 PgkkwKAIUVLpCKgEXPlWX7KW6POYUGJh48CEcZrks8ary0ibmglhaX8qQLFcqsxxUkZ1Qj7Z0nR
 RQGCarpz5U+MIPje8ilhJc+XFZxSHxij0rXybreaw8XiySnAiUlU+B9ZwmaUhORV4zfZPDlftfe
 V+3cyEBnoEBVB/zlBP5RCPnAORGWodvv9WFKkTgyTWaTqsiRJ37bcZF389JnqxTHmI8EgHekJOu
 vXXCM6g4lQw45H4H7nE0pcuwwIUyC9Bw4hSfzXr6BrNUedUhpoxLqv7d5yltWGmir7m7PyvZrTH
 ViH04d0EFGeptf/N03iudJmOIEzlPUH1Px4UOZ/q1Uyvx1/oyah7+3kjX8fIvuyaPQAGex7MQhY
 8HhFiEIZxIwDP01SDqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX6RNFDc2WVv3x
 5vYuebx6FZV6uLhQDIxjlMkJswb1aZkScduM7wIDUdHDtBoRnEaHosZovtrYM/6Xny2XaRJXC5/
 OrvVR6/lnP9leYAo1Bl6BMzQ0rGhF44=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdc43 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 141d263e6566..496b7583e4a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -652,9 +652,6 @@ &ice {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
@@ -668,10 +665,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -685,6 +684,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.34.1

