Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81D46EC80
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091359; cv=none; b=P6AcjV7XHp2LwcNLLba8zv7vLwNTC5F5jkgCQr8N2HnPrTHhLMXEUOpvJWZfLCWtAVbMveqAeGa97Era5OWsWvOc25FosEy8ScN7VUd1YObA316avOBcX0aJD29acZR8jTd6nw0UVdcwqeugmKdKvRr1BvfsPAk4znZoi7HHfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091359; c=relaxed/simple;
	bh=eMoSjmNOVvgyejsrcBsmcLIow8kxyD7VIv4m6GE39Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTbEjT2lMftwc6qOC+o97xX+X54tsWt0212nttajb+yG5dH0mOM40oizO6zgZ5BNek0dNkQgtkhDo0sH59Pdtjpgyi9VPuT2dCTTPFU6MYE8uowSCmbavix4jWaH7DGamnsaVa9GnnJTkr0uwsT84p5syJdxeZSWZ/h72V7RIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWV4uHQx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoNH3J7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWV4uHQx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoNH3J7A"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777oDqS3822026
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8ax2h+hOXntt3F9WVPVtPG1qx8N23/cvHp2pCApHeI=; b=XWV4uHQxljg1iNjc
	a8vKCfoOOHsug1fFPJ/l+cxW9TiPfV3KjkPeYhaLz0i+kC2Rt7o1U+oEnwQxi39m
	6CjcohTgR/m7sabREmRoiQBDcBvLy4BWkMTN0gv0DlO6U5A28P8boPxQQchUs0s3
	jBDUgmUk7ejO1Qq279udgrMt9BIx8F3HAqxcD9mP+u60p0Bt7HFiipaH68SMO7vo
	d4dpBZ5pLiW5EvdGAyHUTlpYovJ4HBf60WMNzQxu2pyFKaSB+lcjAh/XgUPcOD+J
	fXPmVfb4CTtLLt3ZePFLqWbKtfh+9oL5Fcn34ZjuC5hAniSWZc6R2H74Kr/cxqNj
	Bkp/4Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu25n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:29:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so1472580a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091354; x=1786696154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8ax2h+hOXntt3F9WVPVtPG1qx8N23/cvHp2pCApHeI=;
        b=QoNH3J7Ak+IstVqOmUjS0UtZ7e2Y/t+bGdar14QVL61nyrO302QDIwnDbNkEXw0TFn
         depVHW991W1CohN9OeF0KmuWzEU4WNpKGMJskWdFzplz2nQAHuEhhRucNqnn0cu3P42A
         QDq87ID5Wb6SAi3BURzpiuXDBmS+KkryN6oSXo75YHiXf6SQsiyEkzQFUtyu0vKxqREZ
         UqlQ76TaXfhnYR2haqsdY87xUElUY29oFxcGnzoCI3Ss4G2PlKZqg/dCP8E+lCzZ+rnE
         mqcl9ihTCEDhf3necXq0ttAudxEWYEeCKwkkLfARPyBNgE5/vLVUlyCzvyOd7WGrxhrm
         na3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091354; x=1786696154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8ax2h+hOXntt3F9WVPVtPG1qx8N23/cvHp2pCApHeI=;
        b=ppZla9lCOp0PO9wEd2pNpuzb1k5131XAIuGe78aLtqKeMouqwBAI/SG+xzKOYWIW0c
         dhTl2DXu7l8VO2fEb4nk8hUBQhAeonTbkFSZyI82e9yq6JVw046vHJE3Bw4NYoc3dT8p
         wpiPMfwjNaNzP6LhK77IOziRbLvaZ5Uoqgr7ASN7B7M9Sht17UBQlHFzQFzWGKiN14fi
         LECm/4gBOHmr3C+kTiG1EdlzDRhfXm5EFcX88ENYPkZpSPfxbAkSUsaPth/39M8PWGaY
         dqA28iDqGLGbs8w3LkmuRIkkge8F7rqBrH578G5SiQxetYmPr8GsQQUkalZ2YJJw4mRl
         1t/g==
X-Forwarded-Encrypted: i=1; AHgh+Rq+326g2rmoSGaphvpQ0Htk9oqHoGExFyTQ71ZKgm+q1HLy0Kn9iQ3nmUgCwheuTPjcWuIy+uDPd9UM@vger.kernel.org
X-Gm-Message-State: AOJu0YzON1apuwtVQ4k7mSIdKqdf+56meaViF/zLqxZ20MPNgpMv9l6V
	7CDd1LPBucLO/0vZFIIkzgKhQ/h8IVFezpq/PEE5Bd/26Rg7Euz05kKAk0Sk6/tfCiwcQRlrEdE
	wRm5hTsnzl2x1TjvXdnbGGjsUlw3V2vlsfo5wLqvXbQ7SWa4rgbeyMOMYvqnXpVhd
X-Gm-Gg: AR+sD13hPxjxQyxfsSZIySa8nPJ9gyoB2S0ZfUaYDakbFb7d3OKBoizXpUK9Ur1zF8g
	PJFduJ2zTELx5PNgqxHLvRhUnRtJmJruVsIV/NebIynuCQmvFKJ7yL5Wq1vM10f+aAXsmNuCj16
	/5nlvHoOaztXJjwkl3tznfRgs8bzMemllpgS1rBX7iyb+Vc77MB1ry2vz7UYkLFA3l/Ffbq1FKZ
	AuEamK1cGjT9VFgajudJ0LXOx9oGUsJo6ACXeo4SPAWumwvQ7lkhBuoTjrmTmp5/Bc/+57/cmgN
	VynmFHq+D5SWVgAnlX2HxZtwYLxvLt7Xeg5sWnM0c56WbLa7hy5i4+1osTOYUi2Khh1HUcToHtj
	603yAM7WbuZMoiwGKN0egaT0h1YYi56KZA3k=
X-Received: by 2002:a05:6a21:600b:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3cb9c25865emr16736695637.17.1786091353787;
        Fri, 07 Aug 2026 01:29:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:600b:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3cb9c25865emr16736613637.17.1786091353310;
        Fri, 07 Aug 2026 01:29:13 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:29:12 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:02 +0530
Subject: [PATCH 18/22] arm64: dts: qcom: sdm630: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-18-3996f67e33f9@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1892;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=eMoSjmNOVvgyejsrcBsmcLIow8kxyD7VIv4m6GE39Yg=;
 b=rpUiKrD2dMnYuykKvFDNV1bnSJ7yFI6klW+IWV6ikh8xMi3T7jyXxNI+6Tg/+aXg+PMkKxvjX
 VroqMvdvMplACvwQFDdbkBrXZcD12mNCspi7JmjvTyjnTNz86BrXB/b
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a75975b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: kyIoWmLLkap4Wc9ylrYdfueplYnE7rt6
X-Proofpoint-GUID: kyIoWmLLkap4Wc9ylrYdfueplYnE7rt6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXwL5+nxptrrbZ
 ACEOZyr7qCfpNl487Y/G/ZWslrj5qkImoxd7ViMbPTQaqKJPNf8tT0PS2mQi4bKXwLVleZWt94N
 ZXc56qKj/Q4m1lIhb09Ct61iVoROWxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX1ChLaNEf7lDy
 yi+0B1Azyti32Yeg6IJG106sCu4R6BIYYaLK2zqlRDoJbDXLcEG34iuVSBmiYcd7UKqHkGsUSkB
 1SOS3QcFKBjB6BxkcZVQoFpghbpSbBCIHUXO+uQGkCiMABBYRCrwY886pj3Exb4MpZC+ARi1Pd8
 Idg9o0SW91tFxENu8o/7+HdaHpULoQuFQ8+Or+eMQrMmicZby4xrjx34ZV6wF1DTq0rAI4QDL2B
 xdZugTIbvbnsKYYxRMQ9u/WHNlk4TPLctHTRe48nudi0OVUHG/u0qJ1P98dhq5OkX7TkexAmYsA
 jNS4KcbjNe1Lxr3PLfneyWqaNhP3evTYTcZXQffer6eh6++3BcqYI9Zalesq9EBdjLI2/gqQxyQ
 P84Daj7uw4yHLYr3OTJHRehCOhYFA4eecXZXEdeUc3NOvDL2bIgmDhzE0zR+/rZdUCFmdL8bGwB
 m6n3kxFQcbiHTtN2Teg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: f468ecf105de ("arm64: dts: qcom: sdm630: Add disabled Venus support")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a41ba0da380bb97cefd8861837d06848f5d0f584..a80ae33f2c45c054cfce5f51b8cbc93c587304bf 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -518,6 +518,17 @@ mdata_mem: mpss-metadata {
 			size = <0x0 0x4000>;
 			no-map;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x25800000>;
+		};
 	};
 
 	smem: smem {
@@ -2243,7 +2254,7 @@ venus: video-codec@cc00000 {
 				 <&mmss_smmu 0x42d>,
 				 <&mmss_smmu 0x411>,
 				 <&mmss_smmu 0x431>;
-			memory-region = <&venus_region>;
+			memory-region = <&venus_region>, <&venus_iova>;
 			power-domains = <&mmcc VENUS_GDSC>;
 			status = "disabled";
 

-- 
2.34.1

