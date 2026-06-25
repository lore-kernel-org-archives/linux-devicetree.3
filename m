Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0E3446CE
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394742; cv=none; b=rXABUTzyA7Ut+lnmv1FRFy1Szeg+CrFWLMdES7AYkBrLdyYKYlLIkpy/xftVRho84mFyxNaiy0P+iysGtfYr8Xj4MgMg8dxgEKS8r2kQHRnTlCLL7VbwrXFrjHoPUX1150Gotnp3zUL8lhaQaWgGcHMerxeWWc5kNjMWdjkgvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394742; c=relaxed/simple;
	bh=eTNswUiqskVS9ZNGyce2IjWnK5IaVBDer1hYbbIQrQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QRn3CUsBA4RGCAAsDzFxE3NFL3SctoRET7joZ1xaZ4m+Nmdf9iSXqxZcbw1NfJJ6FvhywIGRIK9u5qPWw3WdkqAUdHj8+IGXCqKxeCiO+lvwi50f6cnxLvHl61npiTGVVxEQoimruokmRVKe1qY99qghbG+9LCBB7gkj1eaQm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwN2AVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L34IKRo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJwN2AVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L34IKRo/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jvQE1754106
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k3+UKD8JSRs
	WhGs85LxVpK6dP49viTBdudT0BOpZJbQ=; b=KJwN2AVGc7W7HJhTsUxDh9GudRA
	l4IDH/PPxmZ+ThxV9j7n12qe+W2zEsQwx/q0kPnefIcmXkiD0HXkLr7/FyaNnWYm
	tcVgj4L9gwhNiEpNQ+OQQQuVZcf58TQ/ij1HYpzrBX3UxfAmIU4JJDyzj8zWt2um
	J2H+R/FE5NB3997GD9cpORScBmFId8VqcvIn7da5ZGylLZ4TcPUm4ZIebjvhcUCp
	IRXZCtkYUg/xzkEt1YrvWlhr5M6syKjkxKK++Z7WSp2NfOtt0TKNtV2uZ/YfDLau
	f6Gu+Ya4bwzF4OO3kOgu0LrFlUvlv6eQIL85Z6PWa2KJkOXVw/6JxgGUNEw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q21dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:39:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-967973f71fcso392679241.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394739; x=1782999539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3+UKD8JSRsWhGs85LxVpK6dP49viTBdudT0BOpZJbQ=;
        b=L34IKRo/I80JekIaz490fanosRBUsrMFcrMx3FfdT8jwDw1NOJkIVbcAgjbCzlc4wy
         uhqQ+DrQJhMjUePLaj0RbCUJ8l6prPbrSDLtzJx7mKLUCWbDFcKVyQSiyOmioIf8AAQO
         XT3IyRzV5p2VLYY1i5AxQISTmqKdFifcDF/1c6JIDzAag+qB5Smh6yqXJcUOs6tfSkIZ
         1Kubt543KfRtj38RHncrsEDy+HZE1J9rtRvedDgAWHlREXnR9WzXy5FoM2TnaF8I0YO9
         x/dXF0mfjQZL8+E9AthtcjSTMRuiaBcfRzBuYbf1fPOWHK/Zn0BOaW0ZNaR30l0t16i6
         aMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394739; x=1782999539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3+UKD8JSRsWhGs85LxVpK6dP49viTBdudT0BOpZJbQ=;
        b=HZdrnsqEu3h3bt+BGA618HO2WWx487FYfDYe81tYfQKhwdsD3hLTF9DsgQx2Z3fBLQ
         5enBWry2KAl7UP5+sRD6QXfWVFcmqEKP1/SF29XVZDp1PWOWMvHGj12Vvq06ZdZmlETR
         nhnP+MCUUR0Ln80xMUWu46iE30I5b9HwziMCjCsNw6EwA3PKFIZMQCiHaIXa5f4VEx3d
         8JWr8TAgz1L/aVnYoKhkS3un9aSemJig80dpUjVpGKeB/dXWjGjDukl47lE3ubfn7NSc
         kcTPmd1xtTwLWqX8fcAzaDQL9X7cY7DVP5/9gFS8gc4rfboDiuF7WyyBH6zbbqUM1W6t
         oIqw==
X-Forwarded-Encrypted: i=1; AHgh+RrfVmlFitSUz4Ttl0EAlx+4W3bl1pHqvI4jRTSmnlSBaESRR67MrJi1lfv5WK4cPpkBdIBoWK/kO12I@vger.kernel.org
X-Gm-Message-State: AOJu0YxW119eNvp8a4K8xE23JDACfv/aaNAQPwZ/3e6ol68L40jPOn+u
	j0zPyLNKxa9fDAOgnElJL2GdyUbe1BvcR9OqIvytgMr442FxOnYWA0vS2TV50Oy14FjDDXiH8ma
	ogY7c5bH+qRHmxW+/Z9Qe97uB2T9KzC2d98dYTZgmViApk1M3bziFxjdgirT3mkr4
X-Gm-Gg: AfdE7clx1jF3WI06HVPLsKYNrB+UB69fS++zKizcaUMKEajo1ud1rhgZgG8kDS3JSUq
	/i+XX1fznvX5EHB2Ei/uSJEBDU5LULwYpi0iEzRKrFCwjKwP1Bw5tBEuHpwqp5Z6/6w4uufcKzH
	Hy7fD0OgRwbYYnuFsuFmFJeWqYwr0iq7k/6l238mGf3AtBU4ZcZIoMtYtDWxG9n7VzCr4DZd21p
	8KkFdvam2VocWcMp+vqcuHYp6zuccogG+9EaLkxxji7VaVtRQQ9Dw17g7aAauvmP56tMtUJTuUP
	oAx/SD6bw4BJX7CzsVu/o2OxA4aux72uxW8TytFmMMmclLoZVk8shnK/WE1XILCHGJ9jVGdoM+M
	VoNVyLhoQYG7pheJXerCLrWXRCEzCa7lR+ks=
X-Received: by 2002:a05:6102:4415:b0:71e:1c56:e792 with SMTP id ada2fe7eead31-73434045889mr999320137.8.1782394739322;
        Thu, 25 Jun 2026 06:38:59 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:71e:1c56:e792 with SMTP id ada2fe7eead31-73434045889mr999301137.8.1782394738853;
        Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Thu, 25 Jun 2026 16:38:27 +0300
Message-Id: <20260625133828.3221781-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: toE5xoeRYSBUXO9HFTkCp0sh0m6QWVpw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX7v/e5G2UB0fw
 MGN0bZmh8aB6iLaAS5V62t4MaANmS3Pjks0hUmlGeDxX8MspKQtWWIr96RKV41sY+IzGzCNnGqN
 efMzdthNCOfGCGGOjjTrvSLBp4MunPI=
X-Proofpoint-GUID: toE5xoeRYSBUXO9HFTkCp0sh0m6QWVpw
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d2f74 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5jZXXxe7YbI7BAy0yPoA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX4HdM1sfjZ8vo
 YQK1PBkM0Rrj1RTs8bOn8zzFtRt15C3PE8LbwFwHf4Re+aa4zL1wS6nW/aryU+rDZu2OLHNhzzE
 HHNEAgPxNKQlHsKn1lugN/3AIEUbPDRvGFyUJTmFxtEw56nh1h1Ofm5TddQcBI7xpRQnn9GrE6l
 NpgGgzA3z3m3yZ3O8PHFc2wipRG12ML5uWxnEbm5WcDmV8DOs6hQBC6xVUaI3RVT4xUwfu9P279
 KLqTlNrdkCLIKwhI8wgepXxiH4JMhzi+S1ADat317iwtruM1+UfjH5MKHsIY7eUzB00V8R7HceJ
 sAYOUy8r9YwPwT5IaQR4SRasE2ENnlwhIlzPps8quWwHhlKfywIFB9gR7QyXY3oreO/FKN+cJxr
 8Hn/Yj6U5pp5WL2l/Idp+rjW+tOdPoD3ag9UYHgr7ml4+h6l5yeL4VbUKBuqe0iVLO9p2kUv3iQ
 7CTa78Qz8ynI4yfICqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250117

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

The node wires the resources expected by the qcom,jpeg-encoder binding:
- reg: MMIO region at 0xac53000, size 0x1000
- interrupts: SPI 474, edge-triggered
- power-domains: TITAN_TOP_GDSC (camera top-level power domain)
- clocks: GCC HF/SF AXI clocks and CAM_CC core/AHB/CPAS/CAMNOC clocks
- iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
- interconnects: four ICC paths for AHB config and MNOC data traffic
- operating-points-v2: OPP table with performance levels mapped to JPEG
  clock frequencies

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..3d741179c916 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4469,6 +4469,71 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jenc";
+
+			reg = <0 0xac53000 0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus_hf",
+				      "bus_sf",
+				      "iface",
+				      "cpas",
+				      "axi",
+				      "core";
+
+			iommus = <&apps_smmu 0x2040 0x400>,
+				 <&apps_smmu 0x2440 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					opp-level = <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-level = <1>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-level = <2>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000-nom {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-level = <3>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

