Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982038;
	b=QZDGZj4fPfdCq8VAkYovDIz7/D5wOO+u1V83iyRfJbEeSPa9f8cH4at8z2dzlwn9F8zI
	 w7TbnQ6bjlh2ESa5e5aR9WCRVPT2e2MtcTFRO+UuEiBJcq+ww8xJAxoTETEh8xBtTqIEo
	 OCzYxoZK4fSXwNUNhtyhRv+a2rlngwaEXF56j6QrHT4UBsqbBChZAhjtF1CVvVwFqJoix
	 qG59MPCVsKL7QLc1N8/ZckS2Okpi9tb2RmOX1ExumKEZzLi+yLi3eLqZG4oNoe3VEfwpX
	 02u8P+BpKdSrOInbfnwBFzGwx8ojP5wtbdAFqEo4PLeffJDu+aEeR41JRWp4HwMY4mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
	b=dvr8Jj9BMIgtZVc9RUW/rpTIJ5AsfgEsarcFrLWgO/VR5dN6gf2xJ/lwm+745tQ6WLDL
	 Wn5w/1nvmgP4j0l/ooiJG07joQRW37XjIw7L5v46CFy6LY8/WI9BsaY84+m3meBKECiag
	 SOxXrqkph3k1LToApUHeiDNdaQ3IKg0khMEKGEkQ8ua/fcLbISVgZJjfChOs5G9/QQQwk
	 5hwdIuA74P7IJ88dIfGUXiBb2R6+6qWZTU9dWva6zMWWXL5BbdA+7HICQTT2uE9UYSlC4
	 9EvI00N9g39n3Miz/vjekabojL786uLmf4ex47XFfPSt+8wzPGlhEG75RH4eYQOT29g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuPoyeeQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4FSv+o4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B5606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuPoyeeQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4FSv+o4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI60ajW2447403
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=fuPoyeeQbFUvnxP3
	zI4UEVfhPyfSGZTSzFKnow3blQpAd4xh1qKQHGYFqgQdklOmoXA26w+6dhYLXX5h
	FQ1PXCsn5tfEwU5oFJgJstr3KacQB+CHSiYcGXMZVilROFdFLNdYUZ0O8hB7DY/q
	ktqdIPNmund+AEe0jDucDKqNKzOVDydJQdAN2QhkQeTlXBucnk4SqK0cMXRTbEWp
	uL856XCt4eu5j1j7BXVzzsAfpA4KJc5aLIZTtHJypHHNG3ym/6YoUCP65D9JHLMY
	/oKJgdi1kV8JrW0Mtf++ryag6mXmFzJbbEQWT2dlWzNFTbI+JlKaLB3cJLC3SdNf
	VrsYuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hg4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so475161a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982035; x=1795586835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=O4FSv+o4p0vLWe+NEOcSEYyuK10whXoav36AidHzul6xaGpjrY1DLjhxLRc9EdhKDD
         pjcD1Hq1aT/uJHNAQEC8eo8ykmPjatHpNto1FqAbW4Au2rH1cekKNzvg+LIh6U+u8cjb
         BDugu1fWRmTBjOHvWLf853mqMz0A5ZzpM9oUUwrQvolFNv6VeIWuAVyDmEE8Oxux9bYB
         WK5kfk2UrtsOBfgSAy3UFKNRhIUiZgpqBmwlpDHBME5/iURTnPuQRbKT08hor39ngpx2
         ZDJlwqU1ooHwvDhirxVtCgU4jtk2AKZtpfCFMJtjTJmbmxQnrQx1tA2tf3QCUAhzTARx
         WbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982035; x=1795586835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=DKARDSXYgDGJqj0knWAm3RmvPXFH2wGRcmSmBqxIXwRAVWAxgHRHeTTFxt5LVeT2B2
         2gVr7MkIuyU380FOrl0BCc2Fvkpum63WqDIWuIZhKoMas63WTZL/B1tepmOjSwidH/be
         HCHz2LWDxN45D+vQEWTkztibIb+faMUDimAGAqQlwLQFfjsIv6K4Wt3sxEBKCZoHwVRt
         QchgSHFqA4A/uFjPYH2jq5C4Bdwan0od8+yIeITJCfAlRiwOXCqpuA/VkH0KlSP+RTOi
         5a1kRqGO6WEf++VPKEYWAtOEqiTJS9GpgPzXEDDs6BbBisNDTbnDutxXkEBKQ6q8+Lvl
         LCLg==
X-Forwarded-Encrypted: i=1; AL+hErFS+8knLsqhPX05HvjD93hDPvYrLSemp73CFPmPcX1KJ9mbdg+hLTXly0LHt8fZ/e1XlCn4WwGxOsgP@vger.kernel.org
X-Gm-Message-State: APuU4Z8qQ+BhMmxUDQGD6LyMYOoawJSWw+M1gNrtOYGf8dqsJ1/kqZ7q
	/PB/Beswxad8rWzm1Y+xA90rWJkdJ/2tzCt+rxphmq9/jQbAI9VSnquL2y+qldiSpLFeXSxSzvJ
	wgErL2Jz8j2zBIA0qbS4Z+LbYkXHGSEAIKW+xDC2MrkVfTIGq/5SySCYwll40yxai
X-Gm-Gg: AZFdTZcd5UdZMkowFSXWmg2qdxwhPxYKidNXrzcUD7n2c1PRkUx+5qlPaS0Q72vIpoX
	JCHkDg0zxNl1aKaPTCvYb6VW8vQMQvvxHdoXs3sfcWFo1bd5w+EVa/42+O5xdDBEu1oBtSBwovV
	DIEFkx7pf8KBlHwMiRuwEqKwFnh8OcFQ/SWZo2uccXdLQifVovAG3piCUsBmdZqqcx/HbsNE5lm
	veskPXp2FerHTTl9llfGVMntQgkHOKU+nmmMF0DeeR3NTwtYhGmu72zgV4jaLIJPoC39vUh1iZh
	I9x1+via1r3i4aRNvDmnhfbOeJ9pU0Rg2pjYBOCrJTgv5jTgDosSjNFqSXz9BFZM/E7wLBj6nLJ
	SGfuAp6aw0Swg8E/OnfgVM1/nicWhaNl00sQtOeCAJgPbcphbzIqoEvXw4DhQO/CSAOGT28P+Od
	Utaxw=
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805338a91.63.1794982035303;
        Tue, 17 Nov 2026 22:07:15 -0800 (PST)
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805298a91.63.1794982034815;
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:19 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: Add CPU idle states
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
Message-Id: <20261118-b4-shikra_lpm_addition-v4-2-46ee87e22576@oss.qualcomm.com>
References: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
In-Reply-To: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ZnLGNV9oQobHeXgDfZngn36a5StIkhMbOX9ZnhpmU10=;
 b=Q7ulFEGoq6KIayZAONp4rB1P3oEmfSWPFce8+emz1nEuX6MYnJZxquYMrBYLymn8/H4lu7+YG
 mwB0LdYH8t3C9EYK8QtjgND7UJdDtJdtj3NzGx4x5VKK0nIUhreL/bt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: XTTwuBUFPsahjUkqSE9gVDnrxvAdE0bk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX8+G4Zamilmgw
 3wqK/yzSXLv/hl4fdgv7Ml0V4ftm78hodYyU6CIj3ZMAGRn330amUdPQVBWOU8en6nRNjNHN4V3
 C5yVzuIawCx+D535KVkFgQ3Oa8auT/4=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd4094 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oZC7bev9MFt5y4JAElUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXyPoW/YxBeFRg
 VgOtjE42XdYNVD3zTVHPJA5g5YSe3u5LdHOVU/FpOFGNApZoIW53NQ/DtcMmFQ3opujtVihMj3j
 7XIrE+GHWdGVngpwy1gqvYMDfJrGSMF4hFg792UZed9269mHpbTWsoiQpXUtb69asqeepyezBI6
 tVfl1hIMN7RKHLnwgBIBMk5Lo0AcQUBVYYFdOEfeQwy7hs0lR1ao2PAgmU7HgO0N6nmjwTrwLxi
 T5iesS5CflH3vQ3JpWYSbU/qNu5LwrKUox5t5ox2dZyaFwgWx1L/EvbaeoXbCf8vUO7Zdc1l/Ov
 uLbo7CNESmz6ijLWB7hogxRo5boDg/+0tQWZejs5sNvtiE/eKtg6rihLKd5bC2KK4cc8ghOrnBN
 CJdxeovl6tRTNfys7yvIcUqWGu+c1nCe9G7AaUDvMrZTELDqFDH6PhO1ef9mDtEKYZexDCd95eH
 evhwKgiQC08o5Iw2sog==
X-Proofpoint-ORIG-GUID: XTTwuBUFPsahjUkqSE9gVDnrxvAdE0bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Add idle states for the CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Remove #power-domain-cells from MPM device so that the driver follows the
cpu_pm notifications path to handle RPM notification. This avoids other
probe dependencies that arise due to MPM being a power domain provider.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 +++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..74be82ae50d16c7dcc7bc7af4deb28794efd47e8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

