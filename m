Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383542;
	b=R89QQbKn9EuGz489zV07nHEVxZ9q9DDJvRpJAxHqOUWlutRfe4C1uSlnl0geoxKSeC+b
	 XKQBNEQANImtpUmbIYwjEZ3vmKqgPIATlJnlEqT0htpluj3zNE2gttnEtLwmeqmwN4SnK
	 fJKOGxzP88LLf5ttMk13GA4FrcbWVtXKmVvlUVaADodrkN2u6UipI7SBz/wsvpdy2Br+D
	 6RWBYWsboPqQOjAh1SXNgGvGZtJfBaJzuOkvYliQdBon1vfsaNYiQQzo+qBJV5bgrPP16
	 2/td19StAw6xufy32q159bDqwNNOnrbTyAvB/HCog81Pkud2oikbnkd5lFARhjVduDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
	b=O+m51q6QBtmwoT7bQXBYrbqcBl/zP7aeM0df45mHT1M/oQbJXIm/GB34FKbuwSSbkIoa
	 N+QvfXFHctMFdthhDzi/4a7eAK6VDHLwTVxmHQ9VQmOiW42QkTTgq/32EFm3FsmEGF7kP
	 y0LudRghahQWw8pTO2AXIqaMwKYWDEwrtFV1OGW3GsvE/eUX0BFnv/irQ6Glg6tLMGhLk
	 add2pI3taBdkjYRipYoIi201/719W1KEFD6cktz/5z7AHRRstPyJhmaarUrswS3eh9xBU
	 HDB9I8cvN3LhQGftd35rMa5A0e1IuxcTL0TYSsPbWnd2SM3xH72EFz/leYNj76wX10A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT0BuTVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjWXhBbD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3360A2614
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F3360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT0BuTVy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjWXhBbD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KepJ864271
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEFqOh0M05w
	zKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=; b=mT0BuTVy4WWHfQjSRTF2fMOfqMf
	ATYK3Rsi+JumQpF9rPC146zjB3snKw6WWBWMExp7U+2r+F9CCaG1Tn0/VH74yI25
	m4EEz7Pk4Vn7taem/rX3uJlY0DDOhn0Y+jr2/4GlmebZKk91uPS9j/NIOLMYi6vo
	Nc1MDQA+1qye8cZTRgb9mx1ULgdmpoLQsNT3PJO7aVVH2iQ9uXZ47OuVGIxpIL0R
	5h28aaXFfj9Yhew4N02ILRuWolWUt3iPhWY2E23q8gTIt9qyfOHywAgUuckOP3NX
	u1/SPFl9HJe99Eus4UX2uM4qVIApPKCTLkGjRV+occRW9J6GIYESG9bz9Iw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh454-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4627684eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383540; x=1794988340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
        b=KjWXhBbD9zgCZBHGTHbnyBVLX/zDirfpsKn5P7OAnN6Ug+LHaGjcRbegtlFBb5lyfq
         a4EFLQKFbHu7K7b0Z64+4baFiIifBTMe46kh8bOPijW1tc9RoHITtZ+S9bdvZygZn26I
         SpErQ2YN8s8eC7a5dqJu+tWnryLyQ4D09ya0IYiIY8sNLVss69Z36YK50KBzzsCAZADl
         MFLop4P7hnkssS83B/i1Ac75GYAKy09Tj0kH+gwjsWScgFhO7c6vdBwpMjH6cj9XucjT
         /gNl6glppGz9sWbnENB4BfR8xyJhayFjVH4F82F8LD5Sz8tlatfevms8QbV87K9Nj8ej
         6TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383540; x=1794988340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEFqOh0M05wzKjp9Y/Se6tBM5Fn4hx4zrs5F4eHMNfA=;
        b=Wq1YHXUQxcEbsDlkuG+ruNUsbM0nvuwzNzY+o9yAcH0oTgPj2Jv/HzW+3n+hKCfKax
         UAApk9xtlC3i9eb3ZzY/WYpUSbLU0kK8Uc7M13WYK+xLcSWbqJaImt40URn001h6KKZu
         kWjCZo8nWbbxmagfdFRsEypalAZDWm2xB35lKWQCMj51YswG80dWnBSIkV2Wmjw/jAYu
         SVLSQY5YjTDOcZkWV+UP1VJwhWwJeevXYidQcTgPLPZaQrhZMNZ/OEF6y49EPuDKSJzT
         LRZZGFLFrXEc12kREA8OmxpPxOXg0ZxH1NiownJ/6d8+lHxkMYl0m90DsaFi622bT3s6
         t2ZA==
X-Forwarded-Encrypted: i=1; AL+hErFEV6QWxYClX6NVWswcBCGzCX5j4EKQxvS/dpTk+YP8En8m8oi8sWh2dJWq7SV0bZNa9Gc3LiwACL20@vger.kernel.org
X-Gm-Message-State: APuU4Z9/shQGjwPmnN9bQHCU1PFmA9brPUXdCn20gIBSfZAs3tS3YaAM
	GAxjCDPp2/PrcPVIrgdEQU5ybyw95h23uWymhhHsp9VSkN7CVUIXniC62jhvKuv4GZDmb7eAUDo
	3VF593DRUqhyQtH7OQZoA7YeKmjiIBQI0A74C1SkQu/zqaJG6hJBqI4meNhTHcd+6
X-Gm-Gg: AYBFou2DmOjuwtF5o2XUEFvc5p8NwxG6eyJ2FTJsS2cPlIuBb4Ed3IXbWMT2Kn1Le3m
	3PLsMNk9xWaHpOc4ckqlyJiqJrJhDqGbyFUMLoSQUL+0HwP4Vsfw+XM1ehBjZmQAXHJozs1n0rX
	BYzdOKiLdzQ0pOEB++eulcFgr6KDt2UjjGvK5FFStsNUhuHW7B5bJlRZtupyrDMMdot+6/VqXKl
	WEPqIq1yv8I2JpSlssgksPT/fJGC2/MYuR4sizXY09+k2z8HI7zGQ5x3MjxUL8W/qEU/OEWK6A7
	mrZJ8MwIFIfOLKo/IIoH7noTV4PrmE4LI8i+Eb0HVUPLKCYBq6ACd+lssmd1Za8xkjsFETR7ISF
	e65dTTsLAFKY5jv+zQp8aS2e5IucE091/7k1Hf9yIqGLnhRcVdTLg8j1pi+Tphe4kDrDZOzKGf5
	2PkGZXORfoBLLOhlWKi1i2+YxtFcsommQr
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr2300245eec.1.1794383540186;
        Tue, 10 Nov 2026 23:52:20 -0800 (PST)
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr2300214eec.1.1794383539509;
        Tue, 10 Nov 2026 23:52:19 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:19 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Wed, 11 Nov 2026 15:51:39 +0800
Message-ID: <20261111075141.3710366-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX5Ch8BP/PqYwX
 Hj5Obf/7MRIMx/XGhWLZBjE2P4V2PKYyOTavNDO0lDNrpv2BQB2975IJKCkNTn+OeBPDZnQXEAD
 Njo+BJpbKyvWEsdzWb8Gg3gGl5YauhM=
X-Proofpoint-ORIG-GUID: cebhCaNk_zuiKsg1Pe5YopdjeVOnvROL
X-Proofpoint-GUID: cebhCaNk_zuiKsg1Pe5YopdjeVOnvROL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX89UyWPv4t7rB
 F4qJkBVukr3jxpRYdkD+tRZkC8QXKb6QhNG1sOLbqVU47mRBzZMnTlUOwtU9lfOQBlWTLXj21fc
 g88fUSu7BbP1cmsYEp92c5z7UwVsu/EgrxZennKoRxPiettU44XJFKeHc4vBrpjsqd2k3T5NeG0
 Ms9bqgpIPE3d6VU+w+ttudG9w9yQ6Mgw7Vfl0iz2fnPdgRvgQU6ii3gEulb84EfDS88raYxuWtz
 gXD9JqoJ5AXKS6ByMvbca0V84ytISwZRVAS3XdF4cerONkxpif6KecAcGsdgG0KpHOorEHZkXzb
 AhiogBi5MdQVmGoT83gpe6xVZqmYT1gh22MaYoqs8aF20Z72oOlF/o2HlLhtsnuA0t/xmVI45O7
 AQl21RNtUCEYSMVuK1i95JGjLwJm0LfBbuau3OePQS4/mgZZkHJxQ5rjnKJCYTuogcQGXF9NCLd
 EwDc9N/5l0a0F+acOHA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af41eb4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index a9adbbd75878..3f764069bf1b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -583,6 +585,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

