Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612E388392
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369306; cv=none; b=LMQCq/Bmu7k0yojFNW7xZ82W9lG4qfXy/vX1Jo7ktFyLAeqz83eFe339a5Oqr1cpBZIr5YBo9sszIA2b4FvN04W/TsOTek+5Eo1ef0G0aa6+WrLWDkyO9DGdkZSQNW+0V1VKiqVAHFsPSLkBPzGyKCaymUL5B4ekoAt5zpPln/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369306; c=relaxed/simple;
	bh=aLFrDhmumA6bdgDpKeoGcUNeQ/sPpRUO4qa49r+x2pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HdqA8oaELXIeegmPsT45gewrnio3CwsPVlw24ynv0MNZBn+0zJqC9rIDosn7NHsId0FLFpxIHTzAsdtKdqAlAqqMKbFHvJ54/UsKz8KYTq4IHrrBEBwlJeTZx6RVfSa0zQDK2rWQ7mVIBFHdMBNavvVldclbpovNvz3wbe/WevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBdtgnJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6ipARrk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBdtgnJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6ipARrk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jU4D237694
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=; b=EBdtgnJ0e2YLtR+A
	wW0TWAmNL4JuDeOhN94AA50R/RQdxMSHsHztk+z3alp6YGFpLXHKJg1ZB0m2razX
	PAK3n3qlSffKkjYk9xZ6dZxs7djqcxK2A8MVjRCzzruFp7Q1XINtWEXpbwBRMh7W
	EmH2J8t2PfxN36HKzfINxGy3LcrKP3GlcPvgFCCjpgauyDHoxcdYQ3yXzhxgim6N
	mn0Dpwf5/myHcvuZpC6xnwqT8VAZRypYBrviBzekmuFnSP3fiPdmkfQC76FrFjk5
	S5Y7wzsFM4bUl7UDVhIctL58pMSYA0dK0o5gA/rcNmvrz9De9zaQrAyA8tgfS3wN
	aVVYQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnet1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4467276a12.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369303; x=1789974103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=;
        b=j6ipARrkSDxbzGu4kqqLXyviFBCO+LlHVOY3CkUVobSQv6Iy+E5GywQ4JN1I8lvJNW
         jhFRSH40XwAiq/fhDnt5gVphWjp9ImCNOYgVvUhN7C7lItLWxevn7niHRgWNIbVRxO4o
         YntKiluqVhQQUFer9up5vUO8Zr1sBW0H0ehbfpD97awsp9P5Ppvu4YesZ/uDb1oKM0MU
         GPMQMZbtUC0mjyO8J35OhIzlPFm6g34EJdvxAJuFj5mswWg5JMB/dysKkKq/JFwHJIHD
         Yc5FB/Ip9+D6SuMSAOq3hHGvAhyS5WwtDmVvriJbf/6jCVbQVMCsYE8oX8h4SGp+g869
         t+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369303; x=1789974103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Fn9S60UlMUhD8iVGlXcZ6ydU8S4n2iB2RgezkqcK1g=;
        b=et0xAoA30CwaEVbYh8Ik440/PrcFCUwg79/5z6ySOHEptRDO+3FrMHZAX6BtIA34E/
         Esg5nEb+2WqSbAtYnxyVtzrFbb/244wXIuy7YgkTftcVd0SPPlMXbRlmLaG8ebTFk5mx
         AI0b9xaxbWJ1zLX8XB/Nw7/LPnOioVrlR04O9i0PAbiRjiA0ffIs/ow6fIDV5r71fzV8
         suyLivEjGN1hLzGrlQqq62cJWi+kXVyFSnlUAsGC48/BTko/yTR/7Pu7GlQ50BcJtTQi
         AfgkX6VeDcCHM+q3Wy2EycaD9s1wJuow+I6dItfUV5gjwna04QDABNFDlMKzjESJEdEk
         jcnQ==
X-Forwarded-Encrypted: i=1; AKwUvBywO+cvsCUbvF+IOrmEMgd8p5DtYASrJcU6zkXJLtL2vavkNqooegX7V8e4ZUytOpN9EFsT0oULkc7s@vger.kernel.org
X-Gm-Message-State: AFuF++nEp32EZfCVEABfyDCoJqKpZjoOTGTcvZeVBCJ5LHGTYoLarTuf
	PcOGad0MDiaVABBveaWuprlMFonrBYRj6jymj9RMByKdrF3jd+3DstgpWp1wNtqC1D6TLLbyqMs
	RbgdpZVVBFz4KD7DrTU0QL6pkfAopwNsxAP3foYtFv6sDH4j/MgQh/LIvdmQsrsd/
X-Gm-Gg: AYBFou3z63ryPXWtIsRp7NeNdrtc1TL7ZKiwwc06jw4H6yG15aWQ2RVYPWqNCEDwZ6R
	pp1z62AZm1P0O0t+XGKV3l6M3R8k34uPizG9wztytNNcim++fnGgEId4RCd3aTupJcT8FQo4GZJ
	XEjLdX2blDKuaRy8vSpDRVlrV/TIXKDccKyk4QbZ8Q74QrAKdILwtiv5rLZH3MbTMnlIqpa5XMc
	M7YGg0cXloE2UJAgKSoOmHvnJyxmIFGJqNi7O2f6OAwt8B2zB6YhVwP+hldEVSbl4stLd89c2IK
	wMppmws+1scHTR5HlpSA6kJZFf5slB0DsHuDVeeBMmTaGiRPK7CvctWh6R4VcoIA7UU8Cxjla2J
	NT28k2VAdr/2NXB6eWGhMxM8YEDBh
X-Received: by 2002:a05:6300:6698:b0:3da:b089:dba0 with SMTP id adf61e73a8af0-3db404b87a1mr2970848637.1.1789369298172;
        Mon, 14 Sep 2026 00:01:38 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3da:b089:dba0 with SMTP id adf61e73a8af0-3db404b87a1mr2970722637.1.1789369297623;
        Mon, 14 Sep 2026 00:01:37 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:37 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:54 +0530
Subject: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2457;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=aLFrDhmumA6bdgDpKeoGcUNeQ/sPpRUO4qa49r+x2pE=;
 b=+/4IHXgpQTemZ996rJoLS03+/negzmdl+Gz0yiItbayNpcvREAymA5UUJnTdIwfgXjREhpwTd
 3LlpY9OSQIgB3DmoAvsr3KJTGqSe/DTtHsqIBtyi52UQgGgO4oEN6Bq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: l_hqNgKtt_yPXBPlgkID5SDk5eLvT8gW
X-Proofpoint-ORIG-GUID: l_hqNgKtt_yPXBPlgkID5SDk5eLvT8gW
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa79bd8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yc1NNpEMZLjfPbhxpboA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzJ3ZDlA4hbOi
 e9Og5RgoUb2XEXh2WEEGgLmmSHV9dmkJqxGEvDcF0zkKIOppOK5Lyr90Y+kSYSXWNubVGySi1VY
 xmH6Cd5Y5VokTsK3qCVuj/qGJXFHVcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9jZ6oi4+m8Fu
 72uf963tX5/wRiMZMcPC8p5QsVwhL5AOR/KB5SLV1YEnk48/i3gd2k3otIP7+/lJPwGxPE4mGxS
 immIFcznSnd6/N2umBqeXa3FSl5C5rJZVpTiLsfWDBNW/T7lBz3Fo12vnxd91UJmZ+f9qwiVj8s
 U+NSMfuYSPs1aD3ap7Jrb//qRTm5vR99jrKFHMRWBJ42HHKACXw6eyeAt+Rb6zmVb3G0CzbpcLd
 wzEKPyKDtV8QlCKwRPkQR6kC5++/KRMlVb6PrTYU+y4sSY8+r3EMIv4p4mWqA384YwGEjf6WN8z
 TDvcuX0e4ZrceGD4QVoASriDlAAPX5KAdMdgexZZCfWozAe0Skfnnw/PnwfMeEpto1eLD7Jsn//
 hN8/LxyCzAJXi0Pci3gY1lHzWszRTZ2Gqr6eycJrjUZ91lzLXysMPaRqZcAKbkHAGnE9fqR79jP
 fRRDiktR469XKNI4gkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..2b48b58b1bb1 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -309,7 +309,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <602>;
 				exit-latency-us = <961>;
@@ -319,7 +319,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -331,6 +331,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			silver_cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2552>;
 				exit-latency-us = <2848>;
@@ -339,14 +340,16 @@ silver_cluster_sleep: cluster-sleep-0 {
 
 			gold_cluster_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
 				min-residency-us = <6118>;
 			};
 
-			system_sleep: domain-sleep {
+			cluster_sleep_apss_rsc_pc: domain-sleep {
 				compatible = "domain-idle-state";
+				idle-state-name = "rsc-pc";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
@@ -720,7 +723,7 @@ cluster_pd1: power-domain-cluster1 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&system_sleep>;
+			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
 	};
 

-- 
2.43.0

