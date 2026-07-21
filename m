Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B446F487
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655185; cv=none; b=rM9mfdyqJpk+zCAJs/LPtH80hs4JbWi08/pqnoiKBAcT5mxGwOf02NUTzavBrd6x+d9nuKyb9D1+yoKJQig6RmAjd9pSn2bFiUGQi7KuBISTLdod+8CdQyhEwbhGzxPWiYVflbG35SKxKhVgqUo1cN9meOVcLPM+c1KuvFmxFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655185; c=relaxed/simple;
	bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRIeQqBHMMyHwF+3ZbRl8QwUvRS7w1LoDULhdnXhD/pvnDB+m/hLrRk2beJ8PMUEqMrjf4DrHMoA6MKYaEV8sc6oTcIiUujRPsb8TUuoJ4kCn2ivGnMoI3fph2FVzSeTHi1n+87DirWf9kOnDGbmGEYzvkgfizUXyvt0ztv8e9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkRdE23T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEbgMoWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkRdE23T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEbgMoWJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2cQK2186836
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=; b=IkRdE23TQOcXoG15
	jG0wJeeEmaTQcZR8+i0e8J/GtIhHmMNyTx7vo4seJsTYc2mYzewkiY//SukcwkNc
	LEsEy6CBXmCyTUTEqxh0b/cJAT8qEGlOUN6/mwHmt71UeDlncuNlcpbSBHFTMndQ
	rp7yNmNr5Jt4Ylh0TAA+atxq0J2e56vjYLeAZiSRKfgPhLT7AcP9t24nDg99VGgW
	+s7DGLwFLQo5pE86sefyhkNZ/6r5aOnW3bTjsQ9qIpYASfAy/VMeot5ayLyWgURl
	cqJ5Eyxr6J4lOQ1MDixNqVd8R8SA0VBUmisBkPJzhL5Up4Ns//em3RSzZ+v1cMKc
	BMZHDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae9cn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso12814586a91.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655181; x=1785259981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=XEbgMoWJghFru3MiB68DxeR4YCw3KZNKaDl/AH8Q+lGiV6bYhYmzyhBYBEjlsLYAgj
         JJH/gHPr7th3zoLxe2ioPZ4ESuoNb/0a3NkCZLx3Qwf+N07kqM8UKfxnDb8iPedcHocL
         wOhMbCeJpIahMBYbXAag9iGDTXs63TQXofMk7Q3ZsqAAfHB17M34lO4BI/ZH0aI/Un5R
         6GUt81rg1rQHL//+IC3BG6xXov3Swy6XAXRPYdfX7hCGQpe5U3RJ0DYACZJtVP7Ip8ou
         Ccb6TtyM/M5hW/tOVnTZSTb0hi5whH11IZgTjiAID79xvNz2rQ6twLGptFruyBMk94Pa
         31SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655181; x=1785259981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=auKQNGoJIxxmXRj8I3EGRSPA8sc8MVn8S9ax8ugsZjWnHgjBVqyTteHxg/ztyOWqbE
         hvFB/fbr2NjJs/aXQ7Wvh+SkbdFp2pprn3haNhm/oYZ54DIE4AIFS2PS6TI6KvXoDf7V
         KzuQf4N/1ye/yXsGaA/hVNqpIlPJWvzGitjOVne/E7UL/Y4vY+T00n8/4EdZb+omVlQO
         NK1sjJYJppQbGb1CwlVlahMdWZpeis3dImb9STaH5sS+Xwd40eQXQwsU/F/OdkMtQoBL
         W/hoHtZbzb3iOCLOp1zPhjua2gv2e1hEx1xVh/rr41jjOvHSOQ6oijHyKWyUSc5GsDQZ
         DLzA==
X-Forwarded-Encrypted: i=1; AHgh+RrUsOGtnTeCvedMg4KJ6r33NiFiqIq//rltMl4Pxaw6mu8tp4JGvxIjSXjSSqHc96R7s6xEI7pFaZUk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05fj2tzuBckkqwfZ9ltR9X1xy9sinsEEIRNJEFP+O4Ofhog5b
	1Tr28GWD4gdjvXfq/CFnzLzJ4wSARA0sSFPWG7jYyPFvZisnl857XJMZnf0UBZjM+cDmq7BnXKX
	JZEvEKwyQtPUvTpKH7JeWWhAjHO+u3qySH7Js1SaeIZstGRnMnlpoaX6VEnO3jS0D
X-Gm-Gg: AR+sD10yZlA+noYSj8YEM3ccza+H8SAQ1EV2+zTggL4qwk1KEpf36BFXcy20FeWPvpK
	3h2yd2BcUStd0SB8C/IBkAg5VIwJi6SDe3Xq/B4Yg7EalzpM3YMeri8vcdYeSUjoX/wPKmSyCgI
	OETBFhp7mwZcIogFnmLBx36/280bwKl25RCbMC3Z1NvTLkTJFLxuVfvXJ3uHKiLxk/WlybBN5UT
	Z6cmkppIUKi7KqXgWvZSPyK/Y48cftLBbRIvTGapS2tc7vu36EEV6rTeg984yDX+muItKcKjUTY
	6NFFTmxGUwTqdF4I8BJigae/9MF3XYKxkgpuE/5Afs5BuIIs9ClkRl9faQL/JM4xBqOht3u7OXS
	N593J3gbAoGeEsYh5VZQ9JYoqCDw3gkk9PZw=
X-Received: by 2002:a05:6a21:b94:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3c3ad9d1b80mr21855440637.37.1784655180448;
        Tue, 21 Jul 2026 10:33:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:b94:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3c3ad9d1b80mr21855389637.37.1784655179824;
        Tue, 21 Jul 2026 10:32:59 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:32:59 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:26 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_vpu-v4-2-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=3402;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
 b=bTJIUa31mn8AnljqhwJmgRNvZcC1pokcAnhpq+raPaOA2DVTTBA3FKgift4SNg6px3+eOIay4
 aprNaBvNZ9VCbikVnc7uGyFpGf0k38THlWHpwvKL68LnbbqWwL9O8hN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: KO8T0j0Ly5yfOe5tHF51jmb8qoiBBS1N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX0i80Qjg2Sfgj
 O6Arpatgs7Mi+jH9Ulqi2Nil+qbUoHisMWYCxAbi0fMaCjKQ7RFtjxQvuiWXGnKcjJ1sB/cC6ef
 32vmLEiRR3kaAr2ztW7qQDgolbS1Okw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfXwcWC/FqZlqqW
 MjncF6r9gMweL+haG0no3tIFw2p+h0c+uV5xaXFz1yw2iIc/j41vIpa1zsU5CZWi5fvbab7t6GZ
 mYS4mBVriL3StIIv2OlUSTZOGL3hdnCjOVnI59RmQM8bzeB4jNAs0hb80TIZXzwWL6MPuIRnnjN
 fRJ18TelkYUhProKqD8KI1f84nFzTycyYwkFcWb2elullVL92olJardeCLmVUN1pXDqXsVwhl4P
 erIpreZVjjMjOZgZRPfQQATR1uwHZP8XloxssovJoHArvD0FxhfLwKj2yotjBjlKIA54+5Kixmo
 HkmXit2IeoebLtWTCxeHqiFNhwxLY4Pi/6WzNvOLzAfTtaAANn0a34u27B4Gj3yOBdKlh2ecE9s
 HXHpYoO3DvJX/nd6cVeC9a499DfOrL9kdNpAd1wYdeVwDeuXVBqufKSsfH9Z1qPy2TrapR6zeQm
 O55te65MyTZmBQg7i7A==
X-Proofpoint-GUID: KO8T0j0Ly5yfOe5tHF51jmb8qoiBBS1N
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fad4d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qMXWHOQDURcJ0nTM7qwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210185

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2a131ae601a7040142da16e39dbe2f8563ef43ee..8449af599cfc501bf17904c7533b0796948f8fb3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -314,6 +314,16 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 			reg = <0x0 0xb4702000 0x0 0x40000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocation above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -655,6 +665,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>, <&iris_iova>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

