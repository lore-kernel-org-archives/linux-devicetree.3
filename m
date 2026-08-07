Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2646C4B0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091193; cv=none; b=lm7z1sqizJnVtqrCOGxIwwxmNHOOVMBwZTcUnoMHJUtDcpD58YGv4vv13ZuSH46/lAmONJd2pUgN2akohofjS210FepsNe3WlNJLyh1JH4kw5E39Lp6vtDTIfFJhGkyTOFaoH2TWRwtb5zAXLZNz28wMtC+NUUa7PFG7BRMpJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091193; c=relaxed/simple;
	bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPGMqH+mdVAUsIzleNJnsvNnDHSBpDeVfgBgvehLVz1pvsn2djGZyk8MA14QmoYpDrvETZGos/NwgSCElLaHPl/MnxEA/p4YKSljSmER3CldUGBg9rWC769VrFhVbyV8dWMyfL0jsrc/RWvg1MmnEcX5zz2MtBaARDDkf+jZ6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDJd/eH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cV0iugKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDJd/eH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cV0iugKw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777jwOQ4063179
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=; b=PDJd/eH7F0gki3zf
	3qX4R2W/Z06K6LplI6Lj4dfsd/npfJX+0LgMhi67iLr9eLBmXIHaXdtNWJ6tGcHe
	keVNSAOocVSArcE4U2s0HjPgU4OLKkU8ZiFNPqdfu4fj8PwBAiQr2RNMKb1KIJAW
	+rkedsE9JsbTNFE0hTEHsSzAd4w2v3m9HOeqyWVgHwfLCk7YcS6KK46ucl29a5Jj
	vn3neUth4YYk748EzZcOVvISn+yQllKTT6n38ghxGJ5SX8/f+KLnvchZuC3wqkUp
	jy9Ax9/RBW8jhd/CEoNwM8m5gdthBw39kmWKsAQGeRiyBQd6ZLUy9uB6jxektR6s
	rpY47A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hawu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:26:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4015142a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091191; x=1786695991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=cV0iugKwwlnOhIrz0mpJ3Y5XeST3Q2jgu8vdXTNDt384fxKzu6DGeKKkQRu8SRiAU3
         UlljCMymM6AjdsxU6S8ByfWlGWDdPtszg7LfOmrAJcF1gQtmqO63bg75ZRMnirLd/Eay
         s9zW9astAaqmwJnGQgM+hwh1imuPDZTCLt83I11QK87KoXtwv+0kVk+uYVNE+mMPko33
         ROzasXpShS4wDpBn6pAqXMkp+6MftZjbLZI372PvakQ82yfpDmozgOjmPOfDqzHgpgFU
         Icd3JAZ8+vBriDHWBJII+ceRo3eSQLcFoqS4Jo3UQcaX4sxI3Ytg0K4GY+a0x4pzXr4t
         RRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091191; x=1786695991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=nJwKPDoeQT2L15DfuBQ/7l/5oZBgHERAEQdl2hAuInxqS0JpEJbf8iFllxo3DOssD/
         SfOPo+va1ZzwBGkNuZusv48AmfXT8PBTdjh2P7/lmkTi8kDarapmrMIflIOiOTFyWizx
         2agaXwFLLbKnAattZDLQqZ6cqCAoWS2G1BPd/6iRPY86nE8T4NWTZ8iYrDReUaCSCITu
         f19d5uiMTbjU3pep4G8Nk3DLUm2VUbJEgaV+Uk2UMzY9qN2jUN0RGqPS4YDOPhsb4wf5
         tJ3TaqLObTIu22D0bfjsbW+BO3KH7r1iDvDPAB/R8DC88LEwp8rTcOiwwjYz3yNQnALk
         700A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+7cbBw4/eUYtsTkc6ii+kacRf/Ae94uTQZg6JP+br4ZxqtWSjHOn73sWY5xqwW4iLBVKiKWdM96Oz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5cCyc4kcm6JVYcgUzU7dT3BwSP37K7aYt0DKbfBJlkysBM4I
	cKcTdZtLWba5QRO3r03o65ZY+liqHx384PgLeMHKJsqu6UPJEyvgaK8CDIbA1UdITPVOA43dWDr
	gzFDfx8bnLw0AwxMgnOQEOOSR6X+ESiWKMirEnuDZv7TX4QJZumXBIG0jUiQOZTu/+twDSe1f
X-Gm-Gg: AR+sD11IwLqtD8dMGIrs4SnQdHZRyX5Q+UiNoMMC5qOyA4zHfwrs9DPDuBAwHdboUuj
	nwTrdU+2922K37DcUKtlW/Ol4VM1fyyUxeDd1sY2Vk0x/M8FcFy0WcVJKDFvZu9EtZFJvu/ryjy
	8+Q3J8lq9+HVTqrJNzqIkfzLD9ytScuZsBiIGO9z+4Xp1cRgdzFPLPCbNqJEeES/e7CoilTUQhY
	HprK6lqbIAZzdwSwWtDKqeor1/bkqDc0laHrc09auzMWt6+4ydWtUAiPZrrfK55s/BKe74XpADJ
	UqEsPJpLh8IsKIvo7ECwEDY/pnQM5ja3cGu51bLv9FRdaNmS7cQxveAdT16zb8/MnnsHpkLvqNc
	sODo1jvi9rIzgBelCsetvkcKzl5UnhrsiYOE=
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403367637.13.1786091190537;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403288637.13.1786091190097;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:29 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:49 +0530
Subject: [PATCH 05/22] arm64: dts: qcom: lemans: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-5-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1934;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
 b=nlhEf9NlcAAHsMhV8gipliTwfBY+PUK9FEDOlMy9KhfsAoyYLeWc1J0uhItzpqcotydC/Mw0u
 jx1MioKYMpcCtUXFjWvbS+mcmeRgtYZEfZ9wAUajYAl17i5NYREvD9t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7596b7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: WHIUL3ouTYKKz09zq9X-5_rmzPsuv6Hd
X-Proofpoint-ORIG-GUID: WHIUL3ouTYKKz09zq9X-5_rmzPsuv6Hd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX506rukG3eSmT
 o/J00t4ZsAElw9as0f2BA6UYsxWCU1ONcTIkfcGPMqNwR4jOpozVZh1VHz2J03cfzTVkgXxScer
 f7ls0idqLMEPnbd1XokVVK1hUHTNGOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX7Ug5fPVSKGZL
 TWgHrKXvdGenawSEu6GKMHAXVABEsKXum3+sOq2QQa+D86qI62ynJeGtAzjXKxpUFWB12h0yx1E
 s6tyvt9oikQhCBPDKM+x1FZAcYMs+Q5Hy6wxfFT5b1udPuoqR/kN/aQligyMl9nQY/7iJEJ0F+W
 hhmFQPAhBzYaP0E+Yvts9dr1ofuqImGwgPjxZQ+Sph2iRJLnulit++YsZtVBPkPU1xWKWC9cUVm
 I/O+7hukktYEonym6IEx2DLl4lRbB1dOmyjQPOwdVc2w3bHcnlcM+/MERJ0TCTV9SqUniKyxRtU
 LRiyaBQjpvnT/8ajkoATXBH+9iJS4WQeEBhBxU28d9EjllBtl9JOUvKyDQzqxJ9gbRzmQRQGGIi
 OA+MotfnOh+5D0kRyHsKMNPY5unaq/J4gBE2BO7oU+wi8BHnJxwVjAzt75akPrv4qtBF8wjHVkT
 DxuWF0lZV1b3+RiNVdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..da0326fe244850f92e080e648722b4aa0037da7b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -862,6 +862,17 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
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
 
 	smp2p-adsp {
@@ -4957,7 +4968,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";

-- 
2.34.1

