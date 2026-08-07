Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E194244692
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091307; cv=none; b=nFOD/BlWZI+yTgSZTZGgeF5HwCo65SsQcbGyK4z3wZKNtXgrAvs1gSQE5j2TMUpdclfB4YKrH5S+lOEVLGIMO0jJkTguz7FCie61dmAX+TNGlh4UVQn89LxEYXJy1tUZJ5+Z89gvVlczXZcbVQp0oapyfG/Quck5Hvco1uiH6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091307; c=relaxed/simple;
	bh=a6BuNJZt2i4vf1ybJgJUwml5+yNh97/lXbbwEwUPv/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggdEg8h99d50pKfxoj6Op9J6ATC62MGi5kqxLcMofIapyduuU/ZqG+nRdwTXy74MSJ5fX+s3oNg32ctiG7N3/GtRE3TidDhM+yjZupqS+71uuDTOPExUXKuZoyxslMIfgmmA0lF8mLMgzIgQEZtZh+6VIAFOb1Dxuop66pL65F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mr1WhfwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM2oQ3sC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mr1WhfwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM2oQ3sC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67785IjH3477091
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3BIJM0ruukvgQH9z5G3rTscPeD3yOOEvqNfsUqStW0=; b=Mr1WhfwS78GwlcDR
	KmSGRX6MsXoyvbAsn3EQk87QkRAnEBbayJtQ5WbH5We2PrE2ANbZTj48Vo3Av8SV
	yc1us3Fto9H/JVkTDQWKmYUQQ0Q+/5ZwnMBtwOMWzuGl17Amg/OFkeoXlx4rRN8J
	MnDUnMpukl3KZiaoci/7hAAHg2MkZOEGzWP6Py4NvoT2eOU3J9WTO7E96y/pxSFK
	r5vf/o8zDumZVGMHhlmXHMqWevCbwUvhMkF0gifH97sjraVLV0Wsz29J6HieNIEM
	lRXvKeZkUWmS/5javTQAuOcRz1+bD9PLeyjQ9I9dcCU5drzUEiWn/79jEZPl+Y8E
	1+OLPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hb18v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:28:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1772058a91.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091304; x=1786696104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3BIJM0ruukvgQH9z5G3rTscPeD3yOOEvqNfsUqStW0=;
        b=WM2oQ3sCNoRqTnRF/5+4VFrrMn3AeITP0EMW3cU6yJhDpyEXosjfE7oqT7vLYAkWZ0
         FVTs40bebsqNRm3xpITh+00IvAPnVPJp2QwoxXKSoMhRJSne24w2RPPaP5AR6N0mK4Jg
         oigbtKJL8bagYLWmosx0FA6JovWB6IIHeHBY9qeYlXAGVFO+SHqEqtgsH4xrwSoo94hZ
         elOAM75IFhF05XzdsjHcpni1ORity2Z37Vo/mRz1MaVoXEHxD3NQvAj76hXkhWrkFtLI
         m5UIfylGoP6Mwmsc7WprxN/Ak2kQTmVSuULjCWxAeUA+yPLeJU0ku3yKe81/iaGVu3wz
         jMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091304; x=1786696104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3BIJM0ruukvgQH9z5G3rTscPeD3yOOEvqNfsUqStW0=;
        b=DDibmLDwLqnjfhdOLwQRW2k8L9M3N1P9DDC7Rv9E8AV+4yjiDBo/Y8j5zy9+XKJ0XE
         VvjnKcDIp7DPGBAW57Gloi3I5LpKY+dr0hVuypidscbea74OhGfBYhQHTxHHyqTVtXzG
         yEjvtvNIujAJYXsCEt6esrDvz9XMWmZkf0VagatNzebhLEytMbfaWKxtkf0HxpGsevN3
         MbIAbcOg/Ucx7V7w7hUfszY++EXHfiGn1TEbnzVBwDkGVuLkIPAT2hdgjaSvDBi4dNYs
         F25fjbcWR5JYJYlFgLSiFPH1sDL0AWYhHLx737Vg70Ret/egAJ0j1upjFfUceNa4YyIP
         Ethg==
X-Forwarded-Encrypted: i=1; AHgh+RphsVk1A5Lu4BsKGvXdPIl/Hla3aTOBjYvwCkJLjfd2nQn904WGcv2Lw51PW5SlGakGPjqpM8URbktd@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjcDS9G8I7f2ohDNYb9qreC+GA6DtbFrLnx9khRINPQFPnepx
	vMm77979QeGDiDMEp8DVGjT7bMAdU/2YgKaU2JU4AtyFJTayVZ5OVtmJMqsLztzEI9qyRVkY12r
	OCJzb6llyptxXRLaXC9RXQjb5x43+sCk12zJF2y73mlhPN+qAgthzzGZ9r3U6YQ6A
X-Gm-Gg: AR+sD10YSiOq5cwFj3VcOA37HYCp2deMnTQcX62Vq6TWeR+S5dhQX8CYEm5GKqptXj5
	NxIvCxK4TID7v/TI1WqdrFRLyV/3yiaYyTxU4PsFaTknu10yvzTO/QqKKA4heWqVDnxk0Ob5271
	MGjmdYVDMXl+JiWs1LBWXqVJbSZ0ur7jspSZ+DoRCgVnQr34o9bWd+Cof1BnK7K2GhwujRVPnHF
	eiWf5W0ZlU/VWSYxVetg3nvQbEpfZ+rJv7YPeTJMToTSz1K61YtpGPGWk0cVSClcGb3bZX54AM4
	YlXP7SeMum5OkrwZqwUFJQRJ3oKFzTxrcMpv4CSyq6u713TO5dXc1Fo9MVGkJAPxIYGUCYsQOKT
	AfZpqnAvILL4ZQBdGAQi3qCAoI0o50UvYdzQ=
X-Received: by 2002:a17:90b:3b89:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39083b030demr6642881a91.15.1786091303587;
        Fri, 07 Aug 2026 01:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39083b030demr6642833a91.15.1786091303003;
        Fri, 07 Aug 2026 01:28:23 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:22 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:58 +0530
Subject: [PATCH 14/22] arm64: dts: qcom: msm8916: Reserve low IOVA range
 for Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-14-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1872;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=a6BuNJZt2i4vf1ybJgJUwml5+yNh97/lXbbwEwUPv/A=;
 b=aH+yzag8fwrQgPNIEDeKPTGRTXqyC3ZTRbW5wW9chDW6a8an0T6Dqk6o48QalqAcUY1TgttFc
 nv1pb8Nqj4gBG3oYzkbQ3RbEjzqI6anUoqADJ2GlM6h2zWKc3/EyY2m
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: d6Qz5Mwc214pPrIlUXaD1GTDG5pfnxJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX40dsR93kowmN
 xMM1YHThD/4wV3JdcbH/PLufB+B94YpKeE65mgBKcLtJtkxfu4G05lJeoRMH6rCnDVZQf8qWlbk
 qldboVEqJDS0r2m+78Qd6v1Jf6lnWv8JkLyHJxOtBj/FqnSzh9hTjFBrnXbGfWmvgKX7aLh+CfR
 219hNWROLvSGTFQoEbEkGVoELzRWTdKISLDRoCjWRO8n0es0HPbaCqbR9SGzBtNL856ZWz8J/UX
 gJQ0EmT73GAcxFoL+BkMSsxVbR2DfocNe+mmMVzXx09QIC4EKjpZg6NpXgCtsdgpP4cbzz8LW3X
 fzR5x6ZfDI7VCRWdCIWk2MmXyA1FFQYQiloEhiKed/hsCZtqpI+O23hNju4YOkur29Evgh4rJW8
 9pqbwap/Rj3MiviiaUV10VW3KSqGPHk44Gr7FLNuWZ8qaXmVYN/xzHudXGqY7pWgHDDk5c3qFKi
 w0H7oAzXeIeICh2GRow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXyIPaiJzLdIZJ
 mVdzAyiGZ4Yt1IlHU7vkmRTH4JgjxO1+W+29/tINnl6TKNh13yK0yNYBlRoGKsbN00v9xI4NDYw
 mBFTJVEthMdDoU28VyEULFN2gj7bIHQ=
X-Proofpoint-ORIG-GUID: d6Qz5Mwc214pPrIlUXaD1GTDG5pfnxJz
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a759728 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
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

Fixes: 16bd6c8205ac ("arm64: dts: qcom: msm8916: Add Venus video codec support")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043894955fddc17f04ed859fede5aa9..b9f63d9f2c775da210e8552c530f4ce47341c53c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -114,6 +114,17 @@ mba_mem: mba {
 			no-map;
 			status = "disabled";
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
 
 	clocks {
@@ -1834,7 +1845,7 @@ venus: video-codec@1d00000 {
 				 <&gcc GCC_VENUS0_AXI_CLK>;
 			clock-names = "core", "iface", "bus";
 			iommus = <&apps_iommu 5>;
-			memory-region = <&venus_mem>;
+			memory-region = <&venus_mem>, <&venus_iova>;
 			status = "disabled";
 		};
 

-- 
2.34.1

