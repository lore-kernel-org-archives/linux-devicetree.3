Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38C4398E6
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012539; cv=none; b=FhpyT1uJSOL+LML69R00LYu2T41v5KLwYfkyAvmodkUd1kYphzP8dWxCptHKr7RdHrcVuItmMhMlDrXNhZJ4ZxkIKt4VdonFVuJ+DtUXpt8Ih7HKRl7Y31sVY/jmH05m59tuM5ZLxPXHHaFQrhjSja/UrTFXtUKk082gbMU14W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012539; c=relaxed/simple;
	bh=++Q2M83Mnhu61fSjZTwzDueu190ET4GBVWfrZXDO9Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMd01NLJKFVr0GV/kpJVSpPxdfLqcrRVSsMKbYVw+YfQZtL6rwG4p7J29oPZVG7ORU765EtI+XLm2RVI8QM6vNRueazaYqgXodI+dHjPPH01oWSRUJ8Cfb4/SDJSzw5yhHxf4WkeMVh2ZfRC2pzSJo2N+KKL9ItBIJUqyUP/AxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SutFMvm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQsUOx5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SutFMvm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQsUOx5q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nsJI2725100
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=; b=SutFMvm60EZqsydo
	YDncm5HHnN+nXuRkZND7R0GseUviTGRz+VZUJ7YwW0tt6Be4+uy3GEh5CESjXYoj
	zxzEt1g1nyrhmcxH4W0q7MKeFFG6898JIarDDf1Vo7UkrW3Psx6DBwKICam7Q0OI
	WRyELqh9xrCsI/6XOHWZzpH6N0E51QRsgvL8f+BtMVAA0sBHwAkfSRvJ1TfVd4h9
	iOMMPZvIGP2RyKI+zhMNFZ4wthIoLQFo+eXWjvcE80TQ4/BGeBclKXrAPgTEpSC1
	aOBLzfq0egfSyDILYiXWXlUjeedB8231RZrMPTqvHajQsfWWeHyWAsIimnOGkECH
	XF+Q4w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkr28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:35:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2298264a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012537; x=1786617337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=eQsUOx5qrEbtNioEeg02+xyFkkEhRiyKTr9bS+kKV5BwyW0JWcPiEj21txomUpp6Iy
         6gufpvChUVLmlLwDmMJq5b1Ltu/CJEfayyhCeXyAIXYa6W1LLQF2HqVUF175l3U1S79e
         pqFZd7KlWhmbbqZR0njHZAMFGhtih6InIBViRcQ2erzno4JTIVPECflSW7J00cLnLFNt
         17NiJqovSFZ+gW5+JQ0Bftd2n6V0o12S8WNKoS5Qq1SM/YwZEya4sXw1X0zPWNgjJvQE
         JwpffIzhQvpQldMOOq1965EB7TQdXd7W6lQnnuPPpF3GyF18ZjwNjgwVG9hv6chC6iSs
         NKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012537; x=1786617337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=o1umfPVKnfsOeDcD4ZHjPP5AcpYl/bGCyUcCluGHMZfcqwN2kNKxGmmAZGKBAs8D9b
         IMkPYvYRPCJu8Y5Fz+NP6aXe+OlJ2x0ngXPOHOUbDzdDOVPCIzgP360JIn8VBR3f43OF
         Tfgg8SRitMPUOtIED/gtNQkXe3gxELOeChDVKQ2/KAXxNkAVT/QOrf1wdzotYRYQfJ0V
         jPmwYxoqnwvDcAVFE0evYTKFJncsEbodnRexXVxzKBRwqXWxRiHJDf+uCSnQlncz5Tcj
         RoAw8DFJM0nACblElRINpTD93MYykGuKYwhtzaQLxdIY6ZkMjm+OLbZJAPJpLQJxF0Yq
         LaEg==
X-Forwarded-Encrypted: i=1; AHgh+RqEsXDVeb0zelUqfQdYCVFu0a9iQ4UPGBFxD6ULtb7ZxsSHhNT9qP5WUhLIsiCnEsQRu1qUZ+jUlAs/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8T2nIbWDV8NMiBPl254GAKqfYumachp8OtttuW4AGV8X1Im30
	Xx/XYcvG1GrAST4YpuUVnoVah/NmF7R1nOyPLUQOqZudPqQi/P/QGo9uJP2kXoLqK7weGZ7oyyy
	y01XbDY1bpUfo3Ije/ZSuLDJnh5RNp8IT7eOSXr4OCjikxaR0zL3zBcD5HV24fDyw
X-Gm-Gg: AR+sD10POzpUnaSF+SfjfW88hXD5kc2GRWaRP6NcNXcLJDJVLH96lGk2glknGWTfqd7
	G+5b3vsYbI/ZNlD+Bjq37c5Fj1zIoKvXtChZJfpEzA4IxT+pBiXCLVJN3Z+ufB7TAvGcQdLy3QQ
	7ewQh6ougBP3UDUtSQ32h93LXsNUqFT1+aONL4m/iPPOqbMCH/LXiy4EaWYpW7ZU/WjehchCgNo
	ZEugPj/9PaTr+GN3bBgQnDavuP3IGsGLmKDpt+eaNOUXtgiue2iT5cbiB6p+p6B5gZyaUNPCGLl
	LTW5/13sIrLKQHKRtO+F+nbR3hxKIFdkMX1lMDX+UaC07RsnviYLpGi2ULRVKuKemAPETSmzXEs
	Z6a8wve1BLPHXHbRXlcz6Rn1T
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219996b3a.38.1786012536993;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219901b3a.38.1786012536509;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:15 +0530
Subject: [PATCH v10 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-10-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a746379 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MvewfubiCEdZUln0E9EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ZwbHFyR5BZUp0ovzoEVS1dRUpcaFQz43
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXw1ZgGTMtyS+E
 hjtqvleSVX1ONe4wmfbNP5hwSc8YWjzUXd4+FAEdCD3ec6Pl89uvbvA8gVjdQX21UFXTtdzFNk4
 e3wEnB9n6zpfmIW0KNooK8Hj1EyjW2M=
X-Proofpoint-ORIG-GUID: ZwbHFyR5BZUp0ovzoEVS1dRUpcaFQz43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX4j49TBO8W8yX
 5zIJrAPpcq4Vo4zf9XCZGmgDkYhznsSIV+cPQK8rO84YZhaCRY442cEuHiOvi92KF+7cYi/89tQ
 7sdrscP04Scyn4UhY4ADcIYDI4j6f8yzE7nW0EXUKRT6fsCLofJrxfn6uC3g+1E6Gp3SLF4sQ56
 ok++2g+RgA0Or3QPMCCabVljbA8D6NVTenaYgq4e58s09U+mNpu+4MCw7yaNJdA13wV4X3o9jET
 Z7nZJf14aGt8U/VXU9TYQw45uFDTL0eQwVJU6EcXcZDe1n0hzYYg58xnZEYI3gARdmgXhoHyQ/E
 VryGc9b/JyVN2Iyw1mWcRFRKmXU9scsRtUKxlUyfPciBJYOD1bRXKWms/X6LT5nk4y/35tckwdy
 BSNZRnrmp89YKz9UiAgGR+CSbWq4/OiEWjVUIHXhpcDIZanuVN7qRAjMOh5mb2Ev7+QxLI+60Sl
 auAk4tQGmPCMcwGDmEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..94297e05677aeb5b684c5e7cf0cf677dc93180bf 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1787,6 +1791,23 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2893,6 +2914,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

