Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956892;
	b=sEJov8K6/6kMwMBiGIRnzF1ovNM+3N2xYjFVcy+qN1/oG8S6RvroEaRYlfL6mazrkniF
	 yNX1tWIdutfy9y56Hd6adnetSC74qz3t97mAJsaSC0gpfXEAO3MWqdeNGHWNg3St+YWvW
	 O9zWgdV8N6apJYSuayE9zDb4Qn2EL/apEeX5UXRUmJdMhXKXDm/vtg8TRgBrSezM97rnP
	 tKZioTqAuO0kvlKHBLbRhv868HlmVNCJMGNqG8FDRcl/Jy/JOiQPZvrtWVmNCXldGG5ir
	 djadvP1Wod9WlACYnETPcB0xGUO21+4OF6lHlMVQwyw0xO8thdPlguyvRC8RuA0HJhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
	b=emKFkZzbB0o09aTs6J3eSUdWoXtm21XxYFc8Chnj9ieXSGCnBZroPn//Yy+ciLoe/pGq
	 LSK7TeJA/v/23B0kH9kv+nKTR/miVeKp0VGp9GDKH3vaU0he2XHKtEFY36Kp720OEJhXI
	 imc/M9Wjg3OWZBloBLqSSpvmZQx86hUJoqFNvH51RZU+EMkwj2tn8KgcUQRlUTd/eKXJP
	 h9DA1uqWPqeH5dBIq7DvOqAQw0RkMWCPAfWBvIVCqCfpyAjuwpE1DnsIooP9AQDmjUvY5
	 wpyIMULHzwnXjyNAXc1NisFnu96O8J3y4/jdmgqUPjmbysEBs7tIOrpkVq7m6xljM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C1E606EE8D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C1E606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwuUv5yk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE0SiNMG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9oY2333820
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=; b=SwuUv5ykMMMlZMjy
	ydJlVb02szNBtZaEnxgImAGT74GgneXkq+HNRuow+LRIytTT76CwuzCvipHlWxZh
	qxxO9qfm9LVm9MC/jn6Nii4fwRtOUeUvjjQxKA8KZ0lFGPwedeIK1MM+RJvzAlFN
	NDNOvNFDEu9YTSaFpkvxkBGU6aQL/NUtUrgTwA9+Yf4wzUz4nCApqHftQefHG4v0
	AK1zCbyhlTs+l9p+Tr7tQBErR47fXCybAT4kZqX6no3vMGEvbk936SEHbfT81Usl
	NAhMgX1MC+16zxhM24Z0RjqiWM29KlhPYvmgLcHGfsh49N8gqbnpyN+jnmpv0KGB
	QFOUDQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a5ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso642911eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956891; x=1794561691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=kE0SiNMGN8/u+6FAL2pXtOSIkD2TqxfxNAeLXXqcc4CViKss/gJaB87fp70FtF9OqH
         4B1zZ6JzznI3mC+HttieLDi98lo+pyRc82AQJ3UBvItp2rk6eritG89r1eB/wNWANHXr
         +xPjp6HhWPYoNQJ2LVk4wDY6tUaPfifz/YDyyBz20y20eXSPzN1y0e/d3IiTVjsXVCrW
         ZhD6tgCYlIZ3MUBaNqV+crHqVMTjyxq7BPYgf4Vsmr08bTnb18bN3HrXAc2WDAW18My6
         jA9oVqcxmxRt1hyhFS3eOKc+zuu7vPpZ5x3zdMvsVEIk8JipDCTi5rqCkNw53/3P4Zg5
         DMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956891; x=1794561691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BuKvOdVHfG70wKPsTOfM/oNm6cma4tWvmEUhJO1T5k=;
        b=kCbbCk1G0cc07nKdNtadvukVCOFG02m9FB6UyOQ+M/+f6GQhR5c9Lx3wM2iOF0d9yV
         MjdrjCxQXdGaWkUb3sKP2ux5E5Mgh/TtYG4+ZT/E9+mPm6cItJLQfiKh43dFGqSWvH9Z
         TjEtiRa65gL2VqdrFGXVPDkxdu0S4A9DiDBHOymHw66muIMU1nLbzigmLg0ER0zq7Kdw
         RQnnEYeiAFFl/K8jWx17eKWSXGMLRCv3HnUDfIzKxBBu779nq0w0jrp+fQ1ao0b1O34x
         kDd9eSsLp5BY9N19NYS2DydbmgfObP93rXh4ySeMT/6TpOhaOv3My1+M8GoCj94HhbD5
         Qu8w==
X-Forwarded-Encrypted: i=1; AKwUvBwHkgOM71Q+1GbVs9ngQwvrt+WjfE3wuRU9+pkZrnuIERhM1QlrguobeR9yS13HVtxU/T6tuLpb//EK@vger.kernel.org
X-Gm-Message-State: APuU4Z+pYLOsuz5AbmBFkKE3uVyESClsd8nj75MQ9/VPdZE5ASW/0wzw
	57nc0pIBVfQHnfyyn+BqRONomxSMqiLTUMfr+3e6ITadCyBZ9VRwODelzdm5KH6SB3yOb1HYf18
	z/RS4v3j/vuXWAtnzTI9blcSunfq0xwGdDBzF5dI6Vd1L4sOCrIPC5oXA1UPQxU8+
X-Gm-Gg: AYBFou3FypTKtuEeUvEyaX7305K3efyeHxWmMaFKx8YGWZv2C2a/0GlRWNi64ONWLTX
	hHE0J9EL7Zbez6bX54ebwZG2S1mtP61BzU4QGt1GclOpxmeKq08mvBGmgiaKUhPpjgkKWkV6RcN
	YwEP6iArdJnihERlgKvVtS1b9bLMAFdwlVNVDF3cQjYXdEXat6oqubBGbAtVotToBxAlvVXzsWN
	93XVf3DIaRS16qCyDmjXTTWqGkh6mGCayHhCsTHyApdbNKApcZ14fuZUIDRnF4TtBd3qs2MXUzO
	w9x5MeQ3nZnggWZRXRZ9tFpsjYR2JpxOgIDN/axNlcEz4K97BDKZJ5Y9PadCfdNH4rYye9YmgeQ
	Kw3RiU5UT0yqzl0173RNLkbGDxapXcjFNdhd74whN7A3cKyBS7W/8dlaEvKHV+OkLcfv4jjVzsZ
	JZ9IXrjvdSW+jRsLwSvm8b+B7paochxX/4zmf7Tqp3FlMsySZXAvRsD/HhzIhxvxldBwDLjuLjl
	4hjVQ==
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526674eec.26.1793956890520;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
X-Received: by 2002:a05:7301:4d04:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36f764286e1mr2526649eec.26.1793956890009;
        Fri, 06 Nov 2026 01:21:30 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:54 +0530
Subject: [PATCH v8 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-5-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: pi8FzyA9_0L7iugTIBBkqVXtZjXyNwmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXyMm+6Cb0bOIe
 b17KHkZ5AH//VBBrNxYYSN/15hoP/boaaxIz2lXeOvUNv/79jMtDLI4cA+JkXOxDTJ1+HiUYckz
 2Rfb6tji7zCmtn3gGJcr/H9jyQNT30K99yysO+dy1EmVJSzwCjQ1tTaq7L4hDxHw8erZ399O68k
 T1vwTjnQ2POUng71AFRehHWwnErVvRhey7Og/pgUDgYQi3jOPeIg+/G6T1NERC5orukOgT2RqOQ
 RjicoA6qr287j74s78RwEklNgl17a+Ovfxp0CJyRcW1f32Hjfi9BgOBO/x/R9KP64XCMGb5xw+d
 jALhGCSMYJKbubf0J3APz47WqAsIhhhKWJy3x/uCVzzw2nUfeIdBKmZe/Afm6VM/pMiskf37HOr
 oh0uJ0KXmxqb8a5NRUvnVhwIibQGsU+w1Io0ycFNu5j7t8ZIKQtZtf+vciBbcGQZLK8yEwSe16S
 ODYpnxSj1Vz4Zc5GIpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8/TTEgccDvfH
 tMl+rO9l0CiRz3cJjfgFAAM3wcxSYL1f1uTMOy2hnrUkCQDJZlZi0vR2N1LfIt6lG5VyJ42M5nz
 b4v8zg89JnTSJ0bt6PkeDTpZ/EWAE1k=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9c1b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: pi8FzyA9_0L7iugTIBBkqVXtZjXyNwmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 81af32af4047..6dfc89903d2f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

