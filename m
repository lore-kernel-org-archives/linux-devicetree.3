Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE23BA22E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091258; cv=none; b=m5NtLjxW8Z9Ktl6fxOHm0TXzM2jBbpq+jefa8TAdPYxXhw872gEiqZyRXiFMmcfbBAniVcwIIqdzCKVmKLlfFLUgPnmuMiyDWbM4lfAAug/dASDFbJu/O+hYZEBojOgEnITPVi0qpmDIpFCAksrYgiYZ28YLDuWqpFAryIrlcS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091258; c=relaxed/simple;
	bh=0TG04ZRgKMRBQkdHc44evj+G+ofeKaR/uujdqn3UGAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ftza6v1v4Ijt02H4eYa60ieEU+tpeETRwTczj3ajtvlCWNW5vtTw/09L9nDmbrkEXV+MxAw85AlJuSqf510WZx9ZfLwFErfkwn794ynQYdWiYFzWjpLrM3dotfVkKIvJIMD2RDcVGlXMVOzmg5dzDjFn4Dk82d3p/RsfTpzc6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdRFjbyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dq5QTJlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdRFjbyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dq5QTJlB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777xMEc3564281
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=; b=ZdRFjbyoBCXM7kY0
	xoMX6pQTRB+Tl92TqYjw7rZlDmVs69+sZenO/Y2l8HiT2Rci7KvTfRacAROQZ2Wy
	KiazftIu+jpLBD9UWcGoXGiSrxKpqLx0YAXyvg8iydeXcnKao8ciwArtqGolmGzu
	S5/GLLGim5vlyw21cDHjFchJ9FAFEGRQE75twISdT1GfZKS4rbN3Ffp0GP3wfRFF
	CPKO0GIW5ZFZ2xGhNEloiEiNXJrZDdZra2TNXr8uklunt+8YSqQ5WXNCuwyWMz40
	p48AYWmQohAfMcwXPJA5R5lWAmG4bc6uuzuPVzJf9abRTy1sv+T7ZTRR4t31QYB8
	Lld1Aw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jtwn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:27:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4554970a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091255; x=1786696055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=;
        b=dq5QTJlB/0WFvd0ga/BU5DdaMIFn6hruvllGHGcwSjIbts1ueP6T6icZby/8pyKDLm
         0GKgvXsLWb9Y4MOMZphef+dYK565FEmBmCjlQC7dBAjb3skCBQwcM44mgzJpHDuaRpw/
         i1qpLq+n8ivoPgus4iUBRo77v9uPQEoUqkiFK22PlS5lHug3D2IFtI2SmuWt9tiH4UWn
         5O7QQnKDU1CXsPwNosOGo2KDHCQarXocS3khl6q9DzY380nU2LS15hNvQ6r8QL7txIOm
         5xzi/QnuUZlFeFg3MraWA5z1UiXXNuqvE8oeZ0n+kIpxHwI79nmiymOws4YMtymyAc1l
         9tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091255; x=1786696055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=;
        b=suviss6Aj+PjysuAiH0jL/l2dD34Pin8v5Kig1PgL4xbaFa6TSrOJDgD69NdoHjYM9
         WO4UqDM+DfxtlIPrW2Wm9ZhoeLN/RTu/IyrfdbJhriMsOfZ61MtFeVQljuZnxYKdjSpz
         SspS16cRYwoatErO0wAq/SmsC+WgYdYFW/hV6LjhorQSJEKWnVKgK+ls3Q+D1K9YYAn8
         /zZDhx+vlvgT4aJz/Ffi0vV4uc72aPz5DUBxBWrl6oCQgTgl4L8ECPzW/9BgzsxB2v0y
         Quhh0XwdJL8EK92VbM1kJMgM7yQTg+IRBTVJNTLcPK5PZOGqKBby9XAbjFNJdU+SiSPp
         swlw==
X-Forwarded-Encrypted: i=1; AHgh+RpJfRKyX9ZxAJ/5raOZVsjM2laiDJ4OPMSa7kTukr+J/zKEErYXQrjYzhSolv0btUfheGMjGb3xSofz@vger.kernel.org
X-Gm-Message-State: AOJu0YzS70CYcCpWkJbH4BcyFQaxRI3jW8ytS6ZynLctUImAHzqW/wl4
	c2XBmNRVyZRn6r27vm8AUBboIALLOcpW5MMpvAaVyr4wIfHrdfCLmSnGX6B6zfS7Lx4KLMC95ZS
	AGZ37Lde5Y9X9maR38gDRhP9TAPmFH8oB2CZLgvSDtAfCfRlbp6rBWJdj5lWYPxmU
X-Gm-Gg: AR+sD11NKYboR3FnSfO6j8GZFmdE/pA1X5LV5TiR2FJub0sN9nzirtE/Pqk2w80NP+C
	1fhCGyjYUkZPErSe+by0TUEiGdefo60BtkgU7Pupg05G9mRZ+yFwP4ZJRyLFgguHe1VKNURBCQY
	FzC1+Bu4K7mwtalHE592FkK3ltwqn2Qms9+74fZeOHJpmlxCPjj3ujHn7XXuCCpeZzx39GZ4+14
	BUnQIaKz5korcfIZFnQDyzKFm+ib8TcAgORHoDVSsrxbae+bnubXPOHMn9HhRFiBur6+uk1WPsd
	aiRKKVTCv4KbxKLT6s87xOtiu3zdQfxOR2Y0IqtE/bYbdmOf+10+19PpuK3A6Iu9oQtOqRJee85
	I2NdDLQSKZNfhrWZrejfFRo//7tofOLYRZSA=
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cb85df2790mr27438842637.13.1786091253110;
        Fri, 07 Aug 2026 01:27:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cb85df2790mr27438798637.13.1786091252681;
        Fri, 07 Aug 2026 01:27:32 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:32 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:54 +0530
Subject: [PATCH 10/22] arm64: dts: qcom: sm8650: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-10-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1927;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=0TG04ZRgKMRBQkdHc44evj+G+ofeKaR/uujdqn3UGAM=;
 b=mv/WEh9g+HIBWc2VWXta4wat7ppC+ripqriLmt+TH2wITfZTTCEmYJtivoRh4ZbxeFSl/pBgh
 Kn5GDLxjpyCDlpMB92zUCajtt1gmIwqv2xboV/e2o1Voco61NMOQIjv
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a7596f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX82rndflgTWar
 0VFgyCdRfrnwRpLHsn2Na4rP+pmExrd87ZBS13uhJboC3dZTg81nt71dvvRmAOP07WSbot1un1b
 tJl4AnQGcUQGa9WbW5AyrPVsxt1fggcq6jQuw5C0DsgWOiPdSacr9sIpmcHx8/glyoygsk+up1u
 T0RDkadBxdZ62swNHySgGOJaD+sFzzd6WOcCgnEnrdaSoeaaAAtvVD5cx1BIfBR95TLFBpT+w/O
 5gnPOqurjuk3bF3GXZ7BLJHAr+cKPr7GstdSIFE0ZakvJbscQ0eTruZTaRhNeFFRO/ItUrltcR6
 J7ds0rFjsThxhyIzYd6nw+RWRt8GOu6WaAZqwwxJfQAof/CRZ1HbAXBWCLfYhT8IG5wq9TSdurK
 vUV2kqgjiK+1Ae9phbcyFw+HJzgN4J/rWcWX4DB5IAYjPVQpyqr3eD0u5D8IlvT5RfoxRPezC8y
 6Nu59nD+0PLGdLbNWbg==
X-Proofpoint-GUID: NB35R8VRJhSicfHFTvSx8DKznidtUbS0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX1VOykJkiD5Qp
 N71Ofmqx38tunx1MBy0EqhYExDMEgS6i+Wd6QnR7rJTMrFAD6K2D/QIKimn+nMbl6tljXzrdkX/
 a4PGtbJtH3Ce38JyIkvU/KOg+Vj44xI=
X-Proofpoint-ORIG-GUID: NB35R8VRJhSicfHFTvSx8DKznidtUbS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d533f2ca42316cea6fb34997feb75..97bc56bb61caed0547fa377406f4dc3180bb22d2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1905,6 +1905,17 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
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
@@ -5266,7 +5277,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
 				 <&videocc VIDEO_CC_XO_CLK_ARES>,

-- 
2.34.1

