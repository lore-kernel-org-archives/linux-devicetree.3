Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9E3E4C85
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544641; cv=none; b=rnnnQ2v9TNknW28oWCx3drb16liNYgZePDfkLUxbelp3OBOVPfUycQqNN5Cj+q0yXUsOoWwGGrDCqAVFTrxL0h2RRem0Co1FgLa175q8xNOnPLvYWgOftAjODTTfGGVmtWgOqiiEgq7ONo/Z0xPBZdyUHy6wO+0tn5VSVvc3Bgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544641; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5RfEMakoeLjRFKJ5seUn9eTqa9sSkdV7gM48ynfaZ/5Y1LusIWxQF0N1GSPIdOxdNddL0RIhB14n9mWBbknaOV6DlY+YMYkgx3zr80FTncyKzWIwU8hAxbRIUyF02o43jQK3V0bMirQzyhi8rmuQePGjzNr4+Tz2kfzlKlArF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1257ozP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBEsLkWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1257ozP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBEsLkWc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9wRuA2296213
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=L1257ozPH0mfcfcb
	i2O+W2nNr5Hhx4iKoJfYtg3iYZ7JzWfpY5BAxole7OuY9s1nn0ae7lvHD0tuPYrr
	wG8huGQ/Bghw28HszxwRTg80mqOH+gjT3MipdzJQ0NIOPEYV97p9TmlJIjjbBP0n
	QNWwcKwjEuuP0ObCGJEObGXG2YLV0hmktC9xSwoRN/qOED2zT2ochr2bDNnqVlHn
	AHBfG7oTdJPBrwrP2K8GF27MODHIRa1zec3MS6LxbOH2ZpFQC4EVv0BVRaxpstX3
	brmhEjFzeJ7RghMHLXP6kAbArSDYkD9dyq8UWSULBlp0GghibohuvexHSC9e1e+n
	TXgrOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyr5my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1158161a12.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544628; x=1785149428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=RBEsLkWcR07so4HttWIcTjBRFClGTeziBJrWo9ppo0iiookIyVgsF+d9aSGovwRMGW
         ub0BZTAmE78MnEb7pZP+e/MK4jQ6XitTLPEnifaCpjMZOjAXObAd4R6p4M2aWgxjpm17
         dzslZAhJozEskRtaCw4J0GIKbVc4xGmOYa/w4/K1rVnwDQEJrS3aNpRJ4y7JFSpMwq67
         rA8qjSts/5o3TFy9uAaYqcNgOgETQyMq/MFp3/kxseIjY4pDnNcWxwL/sJVUbUm9mYdj
         Y7A8eYwdaEO5SnnewYUBJkepOKPhF1ZVp5BRWYLjId6tpY5c7Xdv4HKapC4F/RuZegN9
         Vb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544628; x=1785149428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=YDSrzXIBjGXktLzVxIo7fOmo/badbT+ai++ZJ4rs5vS1kYkbj+6b5C3rj822he32bh
         956x72PN6ntRn6rrth2HUxgZwPizXo9Gha+nf2xWS8yGx1Y4L0JrX9jVpoQ/zfa+ycyw
         ZiDf4fogIJB5txRfVAnoJPD5hPaLQrWK2+hOt01vPEIZCVh55kbdPHfm8PKspPvB4RI/
         A8y0R2+gUxSnKR2G7VE0/Z60S6WT1zMtddzrBQ85Cy1vf/bNH+p2k53uCQ5np58XhicG
         ZcfG07UzUYVe4mifAGV4NUHF3BmJ4CcUruXmqd3RgSvoAHOMa0yYRq49VFxpecClfrH+
         85PA==
X-Forwarded-Encrypted: i=1; AHgh+RrpVmNugRa61cFxI+SFjKFGyyyZVhe/FlBK8P5exIOMXfbIwFH5nBhJ2xAjMwJBbENzzx9udohNcxli@vger.kernel.org
X-Gm-Message-State: AOJu0YygE9OgjSVnfn+8q/19ZRmym9JFNuMKmXhvspWK/7a8J5dCFnbh
	aPQ6Lzf6XoYmb+yK4d16JEkTJNm1eKx3ZZi2SAGJkdRg1R96Fi6DTy5cPWvhh8emlssAj53dSRY
	mla4QAm9zBRKiYrNpm6LDviPWHnH2zmbuFX/4n7x9SHaoFCQn+792UBm2S1tHV6nL
X-Gm-Gg: AfdE7clfPLv8yhqGsh50MXqIO7X5Zw9Q6shlngSPbodNpNNgBi0Sn5DL2DTRse+3PCJ
	Xb7oeIP/oOqIbGf6khz0oRSE5QE80d+3WYQsTsIORRhZCkipl7VbSAOECgiurPzbnSIKlCOrdUc
	fNpBNupZ0dhNlBA83jGg1yx/ZWa9mSMqzmydaPiNtMGC0oDYmoiAIYX2uyRBE8LsP8bVbxx4oN8
	s9NCrMwdrEECvkSckFj3g98PsGxv3GrQlzcgUH3DNh+RdX6E5yGHrCX8qpnL7s21W7q+NEL6PNG
	RUgvlWbSoq19k3msx1mEqgVShKVSQbRGqoFce51fvI5AvVL4LBQT7pfVgZ7YhJHi88BhBFXkZLe
	o8H+3caJb1F8ijKw=
X-Received: by 2002:a05:6a21:6b17:b0:3bf:c12c:2ecf with SMTP id adf61e73a8af0-3c3ada993b2mr12765711637.59.1784544628364;
        Mon, 20 Jul 2026 03:50:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3bf:c12c:2ecf with SMTP id adf61e73a8af0-3c3ada993b2mr12765676637.59.1784544627938;
        Mon, 20 Jul 2026 03:50:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:27 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:18 +0530
Subject: [PATCH v7 02/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-2-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=Q9H9pLf/05l54JnlLMphYehPBHYQCGivmk44SyaH7YIRKDjrxdBXLR1Al3xgZb3WlEVZ/10Uc
 cHaaOTz/bOkBz0aOVyTfncgciS3E1/+1NFxBwX3khoGWz47Wj9hXDIY
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX7VI8RIO4Ib5D
 GvVcjFDD7PASioobdcVnon0aKnkx4ILvwow18OpR30b+Wz1My9fnrvas7T3CRyyE++YGccxIN28
 4PrMTOMtr9tUBAwTzKIYOil8t/RVhZY=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5dfd75 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: BnSXZL32kmLt_SnxHxEEwrkrJC06RWe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX3hE3oPhpUg4z
 OXIkfnCB1YvXquBgFX9kyz/MVAj8t3ErBm6QYHwRoaLCy3ggd88ypQFiOwrlC3+7Z5ymzohYguJ
 9YQlC8ZXKBTgS5qQGNCXmS8aq5hvEI2pbHv5crLHL4VysgV14jumSP/tGoaqzOTuWnqXUhTHzkh
 WVOsFKRgyiofUwI2rdISvDJQ2RQ+QuDEKOGgTKnmsidMBER6NgmPf5PmglMGjUb4M/qh5JpLCl/
 P8axgSiA8wjrf+2ecBmTVWBJQ5OpWnzFwaeSzTISb1pdirBfflm4qplAUFNRlAAeuGO/pJ3VrLc
 8AoNhhJyZ3qvMlWXUiWATkIQBkBipNtO+FmxOlBXAgm+E3pGzAO65Dm90DaICnvnZr9qc3NruOk
 JEqQpXlJTiLWWEOdCXHvcJIj+1MRbvjKBVcAcknfrWZdpv2Lx98LroOtb7HeWCqBI+u8BXjEkRD
 U+Hku90qFRBSsPVC7LA==
X-Proofpoint-GUID: BnSXZL32kmLt_SnxHxEEwrkrJC06RWe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

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

