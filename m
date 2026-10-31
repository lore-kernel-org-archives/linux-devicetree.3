Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456720;
	b=0m1FPMGBXksiNezrS2uDISo17CVfXCnUbm1Mg2UF/p2JupnBTSPXbfhVhkoEdegRvOgP
	 TC9TiHwL6pbEA/QM17h1+ANB0Y7cb2upYJFcuhBzIURpm36/PMZ+87eHIk5dVihsAldPB
	 1XJK18mkuBDelGp+mh9EhQTcLLzyR+6UC943s5wE3rXxp5f6+2gJBsfoPJwPtQeenZqVO
	 DrhKg5WMFGihTZwZhIeR/8kyHlDUOPbvCLlsE3cJXkXd4k682IiyU4xxJD9nRrAa5lKEU
	 lOeiTYrfX/9cCUMqY7yViqrRSR8/JkKnLFtr3rlr7dAminqhBwLN+GOEoQ4H4l1ALZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
	b=FcICWNShhUSOKmUJHumyQ7TcvrMOuM81S0LQTO1YZnr6ZWdzozHxxck5t3oaU4yxi1Un
	 EvpCx3SLMUWMpfrwa0twBRQdTU5y8vj+UXyASoq9q+UDb1PWXzjnA4ScTOOfkntbyUGr3
	 D7IowpNsvXdOAH29ptEARfmUYgz3Xzh7dM41pt6h5YLK57dYKKkDxpP66x4fr9FcxCu5U
	 2kDTYXMAZSoHQ5yLx/DH5NAQxS8MiYOw1HQ/YZVkA0T8yhgSeTUh+8xcXaYJCxKgLRPmg
	 eZZLABCCk5+wKpEhpP7xngCvY0r95042h/rivHxOJQ/EimGhJ8srqVIuY6GNXwUMJIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7EA606A323
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00XI589439
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MTyYKP8mHad
	FxUXAd7WDw023+DtOM+dMa5aDUPeX23w=; b=cQctlWWM+R0ZNR8c30zj3PtiggE
	LRH/8C6QkvJC381qRWRhVzuwnTEB9TC4pM+7eUHBJiMxIbaYJCmFo3ZVhRlQH28f
	BWcW+QLFxxSeLkU0DBkHP0TFXWawYWlBYW3adl6zfYMHTLr7p/VP3IclJv4vq/11
	YFZMve1XBx8/l9or/V6Sbv/gCs2AuTPx8/pkCOO7Dq07xH7+ZEYzv9/kiTtGiNko
	/mRMh+UB709DXMudDfEJjv9k+BxDoruxfME9tuCk6IRFeia1+AQiqf7s8ONjue40
	RuDb4hRUEGWwHqwsq6SK2zqNpMpSBXRUt2ObPpSP/jYWNRCQwpMie2vnctw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk13x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so7057094eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456718; x=1794061518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=I7rf7ITDC2rWfESHASUOQMFZIpCJ2g1khqyhhVNDE8PgcyAEDyRFQrdrAQxiQKDCE8
         /ZBxsb7hhDE5cwYzDmFiEPBdRrQ/oaSyJ2pFgC4D4qRz/IxxLbK/z13zaykuISTffXSE
         sh7LtiCPDVarxWlTkvPRrSpC4t+Z7OkF2YbTP24i1iGhrN6X1C9+LmEVDZbFG427xbqA
         /iUUxPuBH+BZp4YF8le+npwFJXqm/BoeQPvNzgc4fqRkmbAyhWdMrizcbLYLiKtmJOgp
         r6MNR9XWJVOpWEU2+odQ571wKXH2oICfScvTK0vAlcKm7XQZmPB3VClH3WOrj0s9lcPW
         SCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456718; x=1794061518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=awYIa2H/n+PIsyffpOfwYIleCuucnvfPx0jXBSqMdBEZ4kkVllTDYlGJrfaTwBM5YC
         fPIo28Eoy48eFPfivIqC0mwWHZuUXa2OfFKjoDkf4eYuU3FdxXKN9rDbroF4jhGmQpab
         llOCOCrKAATtJB3hhYAceScEL4Tl9xBAX88O3gSR6gmMmtzaY4sGz0RBeNtWpcTLsEBL
         WVwuIHEPehMxaqA2dHVizUaqS6QIjufiJkKWMpLmb8uUQKcJaatoMEb1PdCmgfjkSC+i
         Qfwc7dIJ0JcZZWprfZ3EEHmAoXayoOcVhYaucZtFsy4yYAa7A/xAZ3Pq+XiBnvvUxf+R
         OTDA==
X-Forwarded-Encrypted: i=1; AKwUvByHniSiWaAkQNFJEcSGkHWb/fUJUvKv5TWXWKGAkgzx/ObzHM//BSKcN6A1EOEMhJQhP8D1Lu7qou4b@vger.kernel.org
X-Gm-Message-State: AFq9FYJw026thdZO6QguyemambDaX7Yb2r/WVS819Ffby0o48rrqN3UP
	1qLsJfeUOHFnB9aBmBR1LVy3tAJLR89BPyfS5Rxm2TTLT9pjA5NBs8Td74CnSoUFz85KJn3JxyM
	psALAXQ5K7aHQBu+Rq4TV7t8DZz7BmrWoyTMbDyTPwH/Dbai+HDu2Nkhs4nd7z48Sq42XinNyyA
	s=
X-Gm-Gg: AYBFou0T+1XmuPut9FIT3bqWYqfHaWI/g6yPJ+fZP/y1Aw5/Kdw07VA9PYzUOLND3Yy
	kBWNOeVdPdWKKVbDWWolONYgYpECtmEae5958aRM8kkMeT8UydLgNCF0dQYmIS8YR9G+095Olcc
	+n2byT4aWLHUlwAv0rTDb2FQb6toW/JVo0IwMSvn3Zbo40zo3gNSkq8mx2bRVwFiio9EhDuVzth
	rK/ZcZcRb9odfCRcPdMJ4yY5i4Qt4IOFn7U81bljO3h1iDpN7rT6GWmqPjtYkwtyC2RD9yNmDOj
	+/fLX3idrsxuPulKsR0gyDdTItDUfkS1z8+TAW/fuD/JLgd4hW8F44ehhE7zLuT9dYu0JGZ3T2c
	1SV2tK7Nb2Eiv+ENzQun9t5heSTzytOTLM4Gp9apYB+0krbw52fqdKnmzZ1AlXkLg9pMA3ofj62
	VanypE41GCZudZNcps85aBwGt+4+mwKIX9
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876847eec.37.1793456718142;
        Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876797eec.37.1793456717409;
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:31 +0800
Message-ID: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2gj9l5FK2S3_SP7eE-7mwRHJh1mIkWGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXwGTalQFc+5DP
 5OThHbd+9H3zhJ88rLJ/X2PRbHtvwDOSvtQliNiu1cJTC/KpGCBpUhXcxurDqSAzmcBwIvLEwhx
 olq8idi3iHH+AjYX0FwjQz2y6uAcZxPu5j6txZBsGKqnDS6BlKU6xvMLsvISzRKz777wem/OkZF
 pRyYL4gvZTuI62ZIb7q12aRY8yglhp8sxNTyMr6dPDvkVGm7iWM6pXbwJ/vuro4ON4G1D4B12dd
 9J9QzzbbP7nMrqQZU+uRJ8IwCcybPWeznoM+oayHjzwJn79oKAo331evdDDrCYytyZkNyie4MrI
 bxuFu5IOpDgaWBtH2M4jCTP6Guto+KPxXsODjqLoI49jL+LEi44KqKN2on4CJX8s4b1XMC36Aje
 X0VtZzX3QVFdRppolzXN1iN/+FEDvyqiYQOLAYZqLhhYQPf0dGWOU7naxpBpIIBuWPH4YuxykcB
 b445EU6b30AV5PnXrGQ==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5fa4f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX8ITkY70O0VBi
 qrROqZMa/mZtW5aq4SRB8W+AzPjaFJjrL7RVE8vIfuk3wGtedjg0jKcChEIGZhzuR717UVObf0Z
 J3cNEpXMxFhsv2dpkSgppAp41xFo0Hs=
X-Proofpoint-ORIG-GUID: 2gj9l5FK2S3_SP7eE-7mwRHJh1mIkWGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

