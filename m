Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE346C4B0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091181; cv=none; b=rxa6spDDqkBhT0MzP1HnMxRzRWdRNckRvvX33eQZrNEumNuZX+Gr7sgVgFzog+FJIJsA2K5vq1hwQNyVn2DPmeRN27JweGsNWWMLNJ3xFRJuyVBp4DCse2y+9bHLzU4wAVp8TijrzvuxOHPpr5J0L5XM5yS6N/h5QzhTa+zKQW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091181; c=relaxed/simple;
	bh=7GZVCck40mAmasXY6IIt1kL9lo7NhO7orzOoUuPBEOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eb5bF8S08oLe2Ppws0O4nHnzbVENVgkY0daqOSkjCRZoEByLr3mXXZb/dIeoi6gnoqyy5yN9DO+cFZV9/RdNZs3lnkAnkAYp1JjTuxg6TLTnVwtbtl2jnGslcS+XzUx+5vXY8uZirOSOnQEgIj0tFAdSXJsUNO9BX2UrLWtKsv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxKR1Aq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzzrXh2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxKR1Aq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzzrXh2o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777tRQB4063449
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TakO/Tgd+FhPD+OAmfvwRyhlNZw59xqM17dbGLWCc5I=; b=oxKR1Aq4dfs1vbaS
	fIuNCBgf5uNap54a7pWfPGCvcDTQ2jPvER7F5FF3aKjyl0+l1E/FpiFzIuhR/JrI
	qM0I7FtP6MHnYNqjLB42uJ280hSUiUxpcpUr4ow0P2KiouU7VINTfPAltuslsorQ
	HdzN1e7aOT99tZHGuh8wPh6HS/cNr0P7q/o4LoXGo9TL8GLq6KeVET/+WgiCrMLo
	ZmcuFLQLJgEnow3W9Zu7mHdoV/e5foCclrXiBukcJili48gpUsUp6pFPno9pDHaI
	tp7hoGXkjmpFX/Z8fUARcFKHxvbdUigY536BgZ0qCh+WqTh7uDMuoAtheEcCusmm
	jGAn2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hawte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:26:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso4319453a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091178; x=1786695978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TakO/Tgd+FhPD+OAmfvwRyhlNZw59xqM17dbGLWCc5I=;
        b=CzzrXh2oofzr1BXGqvxTQgAotdgm/wYWWjL6AP7QxiR1ItLO5Kbr1AevPr4xRF+aPR
         rXLXh6hngBY9cm2nvEVf7Wzq+ws26KchbbCNk82APPIIvaMfOQy/u+zGa3tqBQ5zoJ3e
         wh1LaoGAmqF8ExDiIQq2tpAP+jTSzwq2ygIwSq/aVUkjwqhMGU1QkqFlFV89frFeQm3r
         uFlbOBpKLIoje1GAN5JYsz94vahj6OylUt9UuMC5zaXynpuZRYQkYocRO0NRqOhlvd/1
         g+j/wL+Cr0vUI8sjSKiEOEEMdwqGcM1ktap+0jQkjiXQo1M7b/BH+kI48zxxzP3XMdCC
         qr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091178; x=1786695978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TakO/Tgd+FhPD+OAmfvwRyhlNZw59xqM17dbGLWCc5I=;
        b=Erk0FaEZ80yzyNZn4rALLWoTUAYBJkyFdGPcqbFYdzXW0+EOxwtF/e19X/WG5TYsyM
         H7dd17rjnUKNhQKjfgnuHPy8CLYCzWV2v9opXfi+UqAtb/dcruhEuMIN9IZfdpUu1dku
         mzMKzz4QI4MrSwBIza2BS48SxWExiFkJ9PYhHXOAQbC59OUQe6kRmHdcVsBjR761bK0Z
         h0xrc1WuK9cjkE23+QttGgk8mmuFKkenVxhI+gkeKVOAQW2vA2aa5tt6zmfie3xguh7A
         Ws6UkK4cNTO3ZZyQjZDuIWItkRNJRoGSD/BHzxIZluQjoz5vg2BaBjZnEqjoOVp5V628
         rKJw==
X-Forwarded-Encrypted: i=1; AHgh+RpCmGH12Wyl4XVCbAcGWzXIlX+yVcjtPsnJPXdJqD/c9K7q5uLvv0Q0vvw9bHGRZfO4oDOAQEMmD1l6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZTfeimrHEPjJyXFLsEMfifzHHZoA280/fZK3g9qw3z7/WCmWS
	l88wIehrHyL67pF1CPi8UPLp79q9U7A9kDDB+qB4JiCySVQNKE+IzqCX6rWbDrFbOdZjZofcjkZ
	jvBaPvvEtNYPw/0DdVijCuoilU65qKl0TJjPovvsrZzY5Ea9S5gny+riqeVJfSjIl
X-Gm-Gg: AR+sD13LkzGPYdBrp3ltAOhv4t+ifZIepq2S9QoqSBkvGIDogKdYhs2HrgNx2fdjtXF
	n82OEC3kZiKsnwOlaSGteitLGFzWKkNGJhqwPicfYjh1+2t1wUQAaVSlfglIyMshqaKVJMdJgTy
	BOGItzLhG0YPTL47SfFPpZcSspsD/SgCUrYscm6e3B+FdatvsX2iJ0Z3w+PnxKjRinVOLCwDpxJ
	JInXHTIyKbeEKAZaU8g96NVT8YacdO16fmMvb6keKTsdYR+K0GHy1dQFDQf57SZLEBjLf+9uBnV
	A7Ee0rMqPYr01reQitslFC1VPEPJv4g0LFfYMa78FfMkG2fZVMNtOpO46RTAYxJvgvJtW8fMIku
	xQFrS0skkNoq0MkR2ldIT/E9+Ow3xyHgm2RQ=
X-Received: by 2002:a05:6a20:7fa8:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3cb85ded9c0mr23418887637.5.1786091177985;
        Fri, 07 Aug 2026 01:26:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa8:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3cb85ded9c0mr23418821637.5.1786091177445;
        Fri, 07 Aug 2026 01:26:17 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:16 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:48 +0530
Subject: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=2107;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=y4neOBhumiVhQMGRZ3cGfK29w/izA9kcGQfXlvZQmjs=;
 b=1cBem7Z5JSG2G9f+WHj/HYweF2Bv9cAIfephHSlpV8VOM19nJc4+mPIV8mcnuyYm11yjt3ykF
 /katKAb7D/rD6s5erB+tN/0Z2fCti1VKEW7YAVkhhECVjVw4pQr4oo5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7596aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RKaA520q8mD8wv_CYVYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: j0mRIQdur7uKnwox9Vhy3n0iHNnYzTxX
X-Proofpoint-ORIG-GUID: j0mRIQdur7uKnwox9Vhy3n0iHNnYzTxX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX+xZvlzfY/VXP
 LWDS1raPgXXnb7Icum7iP3ty21KWL27Nx77oRYY+k+FHSPm3996U1u5d/+xdHxMOUfzJKY7+4LR
 iO0hwjokYLb6LVbfqiGleI5h74fyiD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX6VOmV3HN6VkL
 W7tYbX/fhjxdb24ZnU4p1XmGB0zmir2R/w7TUp08ayLtLgRUGuRenNnTDk4lsi/ASxP0TTUo+k1
 5Wy8ikVS3C3BMquNhGeUQ+AI/NjBgHJOXMBP2kImGeYpgPJJlfPuV/uQlLj7ZxUG3nsiYtlHskg
 QJHupDL93NkBQQzdtLyLgKoZDMGa1V7OLTtFYJge9yzhL1lbNe7JMAEVKxDRjkr9QT57r6hpV3X
 ET0Sf3Qk1rdvDFrW5qYGKafMTkDBZISlopA+y3PxrkQUxF0rbSygZN7Oim5hRWPjjrNjYtunCXr
 qKtxoGxYypGdWiQ5Q0uS8Ni/iT/Qk+9IIfcn5o7qxkDECKJ0zU7VpYohJvKkQDdtECalhil/s6d
 qjP2XdDF8Ss+yNSF+PIQhU7wPR77mafedrHk/d2DhN8DLKNFO/bw2WmrzBxeAfZQpfP+smyi5eF
 /p8L52iJPwcfk+9k/hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

From: Daniel J Blueman <daniel@quora.org>

On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
into that range, from any other stream id would triggers unhandled SMMU
page faults that cause spontaneous device reboots. This is readily
reproduced with one or more browser tabs driving multiple concurrent
video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";

-- 
2.34.1

