Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79E39E19C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046589; cv=none; b=c/FvcnjuBiP/npufvh/duVtgEQQVHHV7PwaAEa9CjxHfeLl9RhiItjBkDXu6anxjuMSfjQof6+B0BajYlNwGVPdM8PnWzccTp4Z4/Gac9VrAbGOWerzYRi1GDUKlQFY/M0gqKImjikQgjXpRoJLr5DE0XUrRPwnQJUMDG1sh/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046589; c=relaxed/simple;
	bh=4ZkQd5DiIIhD0iP7qgKaOwYrBqewdiXyq1XFysgGpsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZeHzYuEGKTmCLo1lP1puSo+KPgzwnxWLBT8NnsrrDI2maTNdOS7oNyrMc4q2UOKW9rdWRrpth23clhknkcG4s8P12yUuELNaLnCaqLbWzavwmGa92Q+6l6PRcST0ve8DSzMLBSxlVjlmO7h2laKcfWYePfFIylpcXHm+cPC31TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnVuSs4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEr2laq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnVuSs4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEr2laq8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Kww2165613
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BpB9XykWsB5pjLfCskY1De
	ilDEJV54PzXC3gjSOvobM=; b=LnVuSs4CnBWWSgIcG40wrK67FGWaLEMNjYvva8
	qPBdukGBFn1AXnj/D/lFcjAaIg8hW+wQhPFEjG9S+6WnFw/QkUdkKzamjyrmOK5k
	BEzHA81iEVetuMUMmQuZBnUZWlnPxe44ZBY7w8pcdrfNx07Y2sWDTn1uvJbEVJlw
	JrX/G7uPf2pCnUyikWZNLEIhqcKc+K7rhDG/KGLFR/W8Ih5xBH9X10X+fY711NGW
	CjSXP0Kq7M8U8cwIlSXTh2mfALkZGoRhgaHKJmyzSkzKqCuK+Mi19acLFTq3UtBe
	UfBuEfHLzEBrLfiaIvG5hDsBq0BkGdkKXOZbn6D8pUjlk19Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeswa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:09:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a0dc7f26cso5641554b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790046586; x=1790651386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BpB9XykWsB5pjLfCskY1DeilDEJV54PzXC3gjSOvobM=;
        b=BEr2laq8odzL4q8TMmruEKJNbUGzG0HPtXzK17aOxXIJKs9pcRBEBbg6wUT9yvQazf
         gweFuur7fthfwAS5upQiBUaDAi5xBiXl7tJbGWKtmxKLIZVJlG/MwZWczUFnyZorINon
         kUCr+opb2Yzi2dMk6AN1WDpiyTKS4FsojqW4rRv/GiaK8G1RaqMpgrQpg1nIYRYPrMZz
         PubScpFx5QicJCRPphhy1wTLztTOzGn2EO7dKBo4rqhJg/G4Baoo3zAhFyoFXu18tmrv
         /ig0ElNAdg3HoeUNYpDULg2L5IQGt/iTzdK8fjKCbGbW/PbNu1QSy6YQ6OZ6WSu+KqTP
         2xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046586; x=1790651386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BpB9XykWsB5pjLfCskY1DeilDEJV54PzXC3gjSOvobM=;
        b=jf2ERRxCTNRyicNn/T8wysDSYIWYgWBJOWqzyJQQoIJm4d0g/WyzsWcveHNw5GQIV1
         41MRSLBGVT0caZ/yS/cI643/IKf+Ec/HnqwWDhFK/qle1n5zJwBbY7xuPnGPJsqFIPFZ
         AvgO+/zLdDxrMBUb4c9a+ihZNGhMoX2hTgt2s7Dni2tqHmqwD65doecen1l0nTD75vtZ
         jozv6U/x7XenMP53hbCnZCg4XnpkHcupxFrvncmpEDgS9wzp+Igp7UqCgYCztwY5II2+
         qVIjFpgRBRE0huSyG6luuxzqqfRhVmZc7PHSXOO/4whnjQMW4sq3WYD0PVEixSFnDX+h
         nDww==
X-Forwarded-Encrypted: i=1; AKwUvBwECzeQ/uJ7hnwOJJQrHtNct6YmK7PW3QyQNyj/w+tZJmjGwcJ0tGeeq4h9IxmQYnKqIE+8qlDzFOd5@vger.kernel.org
X-Gm-Message-State: AFuF++ni4k3Q2NKvhvKzuYXd3wD8xWrL2usBkT+VStf5Lc/6rth9+vGQ
	OSX9RCR3IdsSwl1NH+8iKTX+hmD7BiMgqPtYlaACpScMxKHNvXONE1W5TkNuL3ncrYoA4B0a9gM
	/tamVv+Pcemq95JToIRQsPG2/neCV+2U59T+2VtmgL9+XQbPoBmeYUqFWHdYZZbLz
X-Gm-Gg: AYBFou1xwyRSdA+pIuvF7pKLfXTJcPVoWnbkMtw5KF1jJu2xG5wWbU5ccy//gthhX9x
	hkosQsOLifZV6B5aG9Lcf0fWyqlwdkt6O0DhWzFb2f+Qy00U3yGxlgLqcpck2ViWriryPBQ0gWm
	H3uZdtHeDlJ8GB40kMHGcZV5nYaQ1aTzLQyU0KfRfyPoaMG7/Q/SzLd5Iz1IPSLuVzEcNm0NDiR
	dPAWArL56SHP2Z17Lpnc+BcpIBgzflzl2boFje6VqtN8gcsCJZgufOpUWLkrC2O0yJxy5/c2WYy
	gGks23QPrFHVwrYmEnAPim0KyevyXTt/ns7GIQcy+CT9n0wKhoTZT639T7mmAgdHa9dSXoS90hn
	i93DJruif59EX9FtvQHghOmPREiAzYBLNxocDfy+jWkJ2loUNZOl5S5iA9ikYoQ==
X-Received: by 2002:a05:6a00:893:b0:874:706d:8571 with SMTP id d2e1a72fcca58-874deeff913mr16525763b3a.34.1790046586409;
        Mon, 21 Sep 2026 20:09:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:893:b0:874:706d:8571 with SMTP id d2e1a72fcca58-874deeff913mr16525741b3a.34.1790046585952;
        Mon, 21 Sep 2026 20:09:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8a87sm127187b3a.11.2026.09.21.20.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:09:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:09:31 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGvxsWoC/x2MQQrCQAwAv1JybqBGt7b9SvGwataG4m5JVISlf
 zd4HIaZCsYqbDA1FZQ/YlKyw6Ft4LbE/GCUuzNQR303EmGSL/LriZuWq0uzN2PJaIusGjHEnk4
 pDMfxHMAfm7IH//982fcfVbdc628AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790046582; l=4900;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4ZkQd5DiIIhD0iP7qgKaOwYrBqewdiXyq1XFysgGpsg=;
 b=5XoV3A8QTdDV9bDHnFyyz5SyhyvsLEqybRh3XplUgY12xmSkgUt3rEZRUGjIcgjofJBOAmfTN
 rolfhvX67iICenIYXoXP/xS0N5z/7HfUt1hzhr0p2ApLIb7iCo8he3D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Po4DvXHpfX89qW3mGgsQ8xdEUHKuBQvd
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1f17b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YyAnXQyPezYHqYzMlv0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Po4DvXHpfX89qW3mGgsQ8xdEUHKuBQvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0MiBTYWx0ZWRfX0+0LGeI//ngE
 OSqEZZ2hauTUbL3W+QNimFnT7rOCIq+Rn4sgPPPLKxrNMQmjiSN/yHmqbymSH5v2z1Fs1Kq+iJF
 nIFg47fFsRe1wN37wRHOY2Y6PB6mdGOEJukE1naN4x69qvAaSs+BiZ0H0XSnWrJ8tprbV4m27Nl
 ok/ifWKyjOjOzOgiQN9+QACvwBKDETxbM6cPd7xcSwOu49Wz1LzrBxbBOLrn/Yk9WuGIrsAft7e
 3OSgCAw/l2N3xFlAEpwJ7pRjyOID1wAEjEtALR8DjRYWi3mR/1ofkEcrDY8bipqVd8hd0vaHyuq
 qY5EbHKqXD4Vty7xL6u3esxtc+CPmmeZfda3mpS5a9Zgzyjm2BLsw3pUIxnQVcenFvY9phNVBCE
 wWuBsaP1bNTiNZralonjmAH+re822UDlejKiuBDAx1cFax0DpyLy5CwFIwks+l8ft5zYW9JXLdA
 oDW6ewzS5neksETyFzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0MiBTYWx0ZWRfX1c6SzmIZVG80
 yXQ2C+T390cGbu7dK0exegVJ36fWmZAnku9lQ/jJk1w1p/MjtrPtmsWVZZB7mwi6WwBiWC+OJCk
 KKyvuKs1e80onKRGyfJSjizJ3RSLlwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220042

The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
but do not implement self-hosted system-register trace access on
this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
so etm4_init_sysreg_access() correctly reports the access mechanism
as unavailable and the ETMv4 driver fails to probe with -EINVAL.

The CPU ETMs have a memory-mapped aperture, so switch each node to
the standard "arm,coresight-etm4x", "arm,primecell" compatible with
its MMIO reg range.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Signed-off-by: Jie Gan <jiegan@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 140 ++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..62bacf749241 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -164,74 +164,6 @@ eud_in: endpoint {
 		};
 	};
 
-	etm0 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu0>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm0_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in0>;
-				};
-			};
-		};
-	};
-
-	etm1 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu1>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm1_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in1>;
-				};
-			};
-		};
-	};
-
-	etm2 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu2>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm2_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in2>;
-				};
-			};
-		};
-	};
-
-	etm3 {
-		compatible = "arm,coresight-etm4x-sysreg";
-
-		clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
-		clock-names = "apb_pclk";
-		cpu = <&cpu3>;
-		qcom,skip-power-up;
-
-		out-ports {
-			port {
-				etm3_out: endpoint {
-					remote-endpoint = <&funnel_cpuss0_in3>;
-				};
-			};
-		};
-	};
-
 	firmware {
 		scm {
 			compatible = "qcom,scm-shikra", "qcom,scm";
@@ -3218,6 +3150,24 @@ cti@9020000 {
 			label = "cti_apss_pe0";
 		};
 
+		etm@9040000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09040000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in0>;
+					};
+				};
+			};
+		};
+
 		cti@90e0000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x090e0000 0x0 0x1000>;
@@ -3236,6 +3186,24 @@ cti@9120000 {
 			label = "cti_apss_pe1";
 		};
 
+		etm@9140000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09140000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in1>;
+					};
+				};
+			};
+		};
+
 		cti@9220000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09220000 0x0 0x1000>;
@@ -3245,6 +3213,24 @@ cti@9220000 {
 			label = "cti_apss_pe2";
 		};
 
+		etm@9240000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09240000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in2>;
+					};
+				};
+			};
+		};
+
 		cti@9320000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x0 0x09320000 0x0 0x1000>;
@@ -3254,6 +3240,24 @@ cti@9320000 {
 			label = "cti_apss_pe3";
 		};
 
+		etm@9340000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0x0 0x09340000 0x0 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&funnel_cpuss0_in3>;
+					};
+				};
+			};
+		};
+
 		funnel@9800000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x0 0x09800000 0x0 0x1000>;

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-fix-etm-probe-issue-on-shikra-5a624f583975

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

