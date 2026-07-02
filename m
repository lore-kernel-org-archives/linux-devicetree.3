Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881D4A2E2E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985874; cv=none; b=EY2D6pf8jx3PwI1DfQXMH21nEg+YAEduhbPPQUoy//QRUTKC38ioM1aSQrb/Q98u4GZS1//UISpLrCrgU7sKxVM8qH5oRiUGOT2o3L9bf6lb4vG8TTKiYoDVKkIUY8gaSp2cUE/+obfaxZHM2oDs+6YRzmU3i9fjciAKMsX8X5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985874; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpNTOfv6ZiKbUxjvTnS/MNPY1ZFDzioCg85LMm9/CHm3BbzqNfhxbWL19avK3nK2/WkD+vo9sFte8cOULxgmg5qK+P79fQrZtM1NX87qWg+ZzZBAoa8/9zM4i+0HSULxPQLTRMGMjYix1TKYajAdY+jwur8hRv+XGmdWzOwreXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmdhPhnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he1YoIv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmdhPhnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="he1YoIv7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TtN93964256
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=BmdhPhnQusx/1XjK
	I5UvSa4b1T87XegwtC468GWx2FpAHaxBfJqgmSLY6XJbcmHLUP4Cxqm0ybfpl6jH
	fS5wWwOdh/YYqmiAxvo9Haeigt0wTk+H8xYuoZUTzAdjcygMDrK2V3m+ftA5BLnJ
	vmXGgq2/l3khI7h2QHpsIP5F7bz6pL6RTaNOiWN9t0vCMZFM+WcshMrKRJ7DdzqJ
	vuNy8K7n9orBQ8b3/vFXGLVM3abRb7Tf+PeRBMvUmCSDcCIKUSDp5XcWe6/OVhth
	JSJT6WhBFNtJzH5NyBv8FdKUMGrxqIURRcGu+BBM1FBfMgVIve0MCjxENggLuLY7
	igtOdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc0jeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so2491950b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985871; x=1783590671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=he1YoIv7EHv528NdSkvaVMbj8LNhLhKWoklwWr170cIVu5hjBNujvnMmfzVy8pKzRu
         Cp/324lnuzrNQk4BDlUuK5EQ2/ScIHpJAzXQAQNG6ZCyPqP8Kcy++1pLj5J/YjYCPRj7
         a0had4rPo+GrQocidLYkGunKYhEtPZ8qtQeRDLFnSSOIWlvFdekExJDqlvmlTpHZIef8
         HXBI3ZWzQ48N1gynIP5SKh3cs9sKVGnYyQHYXrDL1OSUGHRvjPCBKQYU3s1N6wrdve7J
         rqwBVANaTbGU2Oo79sifWhGtGeswE6uMZPdA9M88gt0e3Ot/kh2JpqpGalkb5hwPSgvp
         xeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985871; x=1783590671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=lyUNpSQUq3ePeeRCUTJDIXXZFcVzitt11c4VZDXIgswymjCZsUdN8xGIiVFQZUyHYH
         ZUEgZGviN4/4pdv8WCkDubdHJBSmssBazmkZ57GVls8p36movXvnhdhvluw7cyVQ39XT
         m4NTArrq1Deg5/c+McOm6PNTtATVgCoUzsiCSqVTLMVCNLC7KNCPgaA/v0mL/Q8QV9xC
         capAIq6nDvAxyeOC8vF9sJYjl3GYNDAKlFnBBeP9QmLlR7suSVDDS9jcx3IerqB2ERhq
         YTDJoUFVKBhifH/ys2nRjdjTmOvUCJZhcxqS+PCU3+KiOs860vtJRkoCeOLlMbh96XOe
         J5Ew==
X-Forwarded-Encrypted: i=1; AHgh+Roiq4M9YzzrrAttGyxFnp6jS4vCQuITjGtCbHOaNId81TsD8kLqlQiKXnlZoSW9KdUUoab38hpBkupt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2HYH/l1w7mrtrg5rd9cdug8GBUny+XdpN4QnaBmOikK6NAMyP
	71g1m6r8LCiZQezmOq2TRmj+58iljQWWwm7+yanPE/EUny4RookuV63i2BiKx6jlrEOGdDoOKoj
	nhZ3rYUa+N6Ee60mCG8NTSwueplJu/5vrN5MU21Pj6EKpWvxKFbHP5kV+oPC6p0VW
X-Gm-Gg: AfdE7cmnafy5r/FIQKp5ve3F7dxc5E72GRCGRobJQ17EhwB5OS536B+FDOsoJmft2uR
	ZijOfNPLsjO+qX4ivXCikodsS/272Lac+AxcXKpLyNNIMpn8mJ42xPnRZhorF62A0gmZX8OG+x5
	sidzoeBYG5ePad7MVxWRaozTiXxQang1KVviblCa3Zz9B6CTrfvuwh3NVvkDa3vqRLASyJwsjZo
	RZ9NzCFssIC1X7vtaDTSnC6GXSMy1OGjKY9R8eBKs3tiaqfsp8+DzPtA9oWxiaNII6ZJULoibvY
	QfdJ7ndrnCutyASPZ4eMtjvRgc53grxTL2qwvKiaqhdxJtAiMhcE41V/pcTLdPE8bWgszr6/cea
	r79f/LXJoyHafKdlm1Rf+9b9XZg==
X-Received: by 2002:a05:6a00:6ca7:b0:845:e0ee:29ec with SMTP id d2e1a72fcca58-847c096d0d7mr5173786b3a.35.1782985871157;
        Thu, 02 Jul 2026 02:51:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca7:b0:845:e0ee:29ec with SMTP id d2e1a72fcca58-847c096d0d7mr5173743b3a.35.1782985870246;
        Thu, 02 Jul 2026 02:51:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:45 +0530
Subject: [PATCH v5 03/11] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-3-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=t9FPDceZlfvNHbbzM0xKA4qbpZi1OETvyq/t2FF7ThWRzfT4PoB2mWMNrJFnS1zY6k5B14AHY
 AUua33tvB5sDpUPT/uzoDAfpTt1KKH9TkT8+23HepTkq37wyP5Cxw6s
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: s4OU1uaKQULLodWHAwjftwiLJ13Lpdek
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a463490 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX1C8U9RPwWbPu
 xl8lW3R37q8+BvFeXhYwbfCEUtXyh4NmlEVJNWW8VQkb0eBIIsaZ53wtE9/9vUJheBL7IPbKHD8
 IBh5+VuuUvSasPUlFkfsbjqQQSdCbu5rFkP8pZbQboEk+Ddx4MZmBCaHZJWm4AXrrQpcYEpWOGS
 kU5TiZ8uuBKsQ0/VgdWXKnJqt+Ju1k/YuuWDMN4CUHG7aeJU5oBFLskxkldNB526XFJkdiw887q
 ZJueHoS+rjB4e02UV1euqSxtq5k1XGc1zt76j2EJEIRhtAv5QwZ0b+V+PgCPOvw86PcgUmcagn1
 XHH7CQMf2g9Bj1yXxS8uk0iJgZio7a3dUNN59jGNOjZo4nVj9fgppBWlnVC+cVCC+x94K2NB8th
 bALQ+P7pdsARoUnDSDR/dkdNLL/sGpX8OnaBpVQkekLrE/r262or52zfhsM1WwNsMVkJ2rI0gGS
 9xVXmvmFYkW581LoiFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX6amGGe5l9CtX
 Gk60rXQ9oyM5vkarQlZhU1vBD/QQZcVrgPXJmmkM7udlPKte70jDnCY4rQfGlQTZsLEvJ+/U1oX
 /O+pCSeHDv6kq8tOPxwOY8QV9abaZuU=
X-Proofpoint-GUID: s4OU1uaKQULLodWHAwjftwiLJ13Lpdek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0fb55b9deb9..d66b97dea319 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

