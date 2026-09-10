Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978519CD0A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082230; cv=none; b=K9qD5QcJn3EyM3wZnx6c5NBoLN+HLX+zR32yGrjgK+tFTN+LGi66yifK4FZpbsClqWx93Rz6h33kDJ2lE1C64OwHoZIPXA4P+9bLcOQ/I9nL1vDscQWCbku2EKzv0NwnvtJI6dq2euUkDPtSHVYdqCMhUdOgmqk6BeOxMrV8NDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082230; c=relaxed/simple;
	bh=Zeq7+ocqQo+fqTVIrp6IWUcv70w/mUcUuk6iTuYKfPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aXHhjNdShnykibOQ3xwUAOR8f9RNJ50I7i7Rvvlvip1Ip93Iu60gesRW4PSkH8beBtZSW06pr/ENkS23/S5TZ5T14CiP+XEkzc/o/X5PacesyBY5PzsoA9/PIPmc5qJjojg8cXOkO4SQbbgB8qBeOMXnzb0LFjlH9mV+6DN43ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgO7SOW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM53GHKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgO7SOW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM53GHKn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTrDZ2127162
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GBDO4MTnE4z
	zdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=; b=WgO7SOW0bP5jqHCCJSm1Vop/Bsv
	iI2OzRx04+PNkUURd+keFkSz767SVg6nJCPEsTmCUk2ZiUekzRKiTBVmYTuQA/5Q
	+0N7Yrgus96wgZrC2AjaP+yLqCD4LO2mIzBI46OxnF1ggEdf2viuBb3LEKMIoQaz
	C2aDHS2Nci6cOevfbkjbbYe+6HnXxAGD6lsAFA1TZ5L7sE6+twTlsdZLskMxeiV2
	FUMXGpwGI/gjcrZkcBtVrR80kYxp4ybDr+R0xDfGFbDEj68mVA1XC8PB3BF+SLPb
	ZXMvLZZWHa/EiwGJKYayM9TNi3IZ56cIfXbjESOBxMahJX9lwI6h/94cpJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwafbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so436814a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082226; x=1789687026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=OM53GHKnVXI9x0m39Xpqa4oK/0kW2w4DqXjl7ZaQ9yo1b6fTxHH1LYxw9IJfRjKA0l
         yUcnNgjIXQGdss/UZTE8EupBBF7WNhgCHRd6CxrKT3w//Pg0f3CTFPGlsLRHzgPDeleW
         d0wsxT704TPq58eM6I8uV0uMmQ9DEY29bOZtDuci5NBRTsrGdSi5oqqIQhTAqn3xntH8
         K7IVi4kCY8cqcoFQGCXJUUk/tsuUTv2Rx+6XuGhfh5Il27dhLt+s4VbbT1fURqzJpQqX
         aMnPHXPPzuBYBsS8REkFwHJ8enBd/wRzB+XexvzMLlewDKQMy7PwmMQxB+4kqOcWqtWF
         MpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082226; x=1789687026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBDO4MTnE4zzdYneqlVVENoQc2OyNRG/GX2WC0P1ovY=;
        b=C9rBgYJ9AbSWvbYlNIsa0C/3Zdv9MvfGT6oVAfWrXiuAeSBw6nIf5L0cHRxIaz/UzM
         3S7XOlUC+N8ua+GfXUXAoSq4H15N+0HXKsQJMto6Tmt8A4QjyAwiobteT+EVCwLmeYrp
         LCWfPaBt+RqeKfzhoVFE5JcC7Mnjor70UiQALSEIb1aKEBhwrIgpG/VdHzJREWEYmjUS
         KSfme00HI0aq2AVNz2dC17vIbZXhi8GmbfUTm7a6VnTZ3xoF+OqfF8zUpHvrErWY43k3
         JdxLtB1MK6RteSwA2WX3S5j148Mbnk7l6Gp1i77sjWvgjOo0yO/3VMWiUabkA5on89fm
         jCpg==
X-Forwarded-Encrypted: i=1; AKwUvBxsDd4ZymYvLnW275xZBBGkIpso8tF+RgimyU4cheay1LE4OEUPTeQnuVT3j3u9O4irnAUjL/ZFwOce@vger.kernel.org
X-Gm-Message-State: AFuF++n1DwhZhpURDivFI9JHZBKT+nfyZtJxWUohCNGt649Bq6R2Bz58
	/+BU/k1ZqbqbtoM6+FTPQBwQ8jyXGV+TH7GLpC+XeAKmy4xnNwgxj0pL+PS3PUjdpzFUzD6jsxq
	8S5IXlU8V6pQyc8kan8xfAdIYPw5//z4v6qbbaVaJ/h7qVwLghkYcfK2lWwgDQToMOrUG8qLU
X-Gm-Gg: AYBFou27Zz/Qb3DubkefvbPHY3emqo03ApfpksFCLaUK4GCDxpAlrbwXCB/qLDbGe8h
	G/h5/X0zG3foEg1Y5JHHg8hdd4ON83w3or3Otfyxz1RPFFfW/m191H0Lmv55Eu5qheZpCkD950U
	536JUaXuSpEu7P+Ws4ZTPwag4jm2jsenOt4bklaMafbenl95Vgn29JyRzOWeFpuf/t8agC7S/Ls
	D5BcyXqOW/P2/sxO2bXgiMyS4LWP8TxUs3pRpvdo+YyWWQslHcuElVrYYMchInbz+XpnAhcnj5U
	Ndb7UWnNG8lnscHorFpkHg+CyhdmFfDSmYXmpZAgdpcQKxPdmqG05T4Nw4JE5+N9KdxITukfxmS
	RTSIv5p5lYEO4gLEkqTtiaDnEEoVaY+2uywXa
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942103a91.1.1789082226324;
        Thu, 10 Sep 2026 16:17:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1942028a91.1.1789082225910;
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:05 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v2 3/9] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Fri, 11 Sep 2026 04:46:36 +0530
Message-Id: <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa33a73 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SNQ4sQprfOKLKwPE6BEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX5ZLdoKp6XYX5
 Ed0w9jqBzRJx4xfElwydnWh48piAQmq6UhJZ3gwSoFZCdOLjNKZtljv6q/htoHdfLqQzIrcHhoW
 5yCIuX4LLCOQ/5D2G4jGLrG0wC49kkc=
X-Proofpoint-ORIG-GUID: MxOBLHvvRSth3l3aObR1IL5JxJJrNw22
X-Proofpoint-GUID: MxOBLHvvRSth3l3aObR1IL5JxJJrNw22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXzcGSVlRL2ibF
 5SIYlLcTQJBHQmnUVenMNxocOw7GDgFN1Ceva7VAkWa2Pk88Sy4KCQiB0cERo1n+QMzmZXivR2+
 NOFbvWGvI3UNjiGJIBavUUDD7YT2kHuFIPawx+asEXd4w7BA/Exjj+C/NB13YA/uTZDwfeWpKHC
 IQG8e3cVdoajqsa2igPJgDV+xEVGjKKRfKsooxH+Lpq0u4Uzr30I5IiCh8WGtm9y4tHIkLLTJiU
 +iyQ0opOQ11/r5Sydje3L/zGf+wi1D+swsPthaWbPtIGztMtbpZmXtPqQ6z0KrfQEeqtadfFSsY
 MHL9Qg9N5+vSdTIMdzIMp172jJV5GqaY0IoMe6Yt/luPshYK/aJUb7yzOczvT6VnToFVm+XfGiz
 cCv6BRyu2VQUNfNJi8BS36XErPcjPsSagTYUdqRpc5K3YTNj87OJ2ytrWvgWfGKqSu4wC6eiBGn
 cyA+b4yu2ibxtWN6SRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index b8a13462771a..52b71790becb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3486,6 +3487,40 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+			clock-names = "lpass_config",
+				      "lpass_core_axim",
+				      "aud_dma",
+				      "aud_dma_mem",
+				      "bus",
+				      "aif_if0_ibit",
+				      "aif_if1_ibit",
+				      "aif_if2_ibit",
+				      "aif_if3_ibit";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>;
-- 
2.34.1

