Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749040;
	b=SNW25t8tHeazqKKGp4CCUWiS6s0w/JetC/JC+auIuY88MLBK4wxRtMBiDhq46Y1FpbUI
	 KfrYkQh3MZdoY7NJyIU8eHd/hCoqAPWdcvjFdPOVYoO97rAGFyex7GXAWTrhS+yHiCqYx
	 yOklea3nI22T8QctHUiWdJs/oYg2Q/RpvU3nWvMcTGNreNBbKdkOlXhlQk9l7KwCy4nMN
	 +s5uggOGoBCu0hBvXgI1xKp2bVxuOh3TIsQ5IkyWtVpCwZPqwbGJcoBgHrSt+7C9iHKqU
	 MhNuGpMkLfAmrytt8ugnLTKVc/fzLaTSwPn6ttmc55Ypt6oBJJ2WozOkTYheIeTFhrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
	b=BjxoBgelVmdcOSXF3REGh/zngyL7U7ks3RBpHODYPvkpaftek0xo3dN+jaS032tP6cjC
	 6lJ/dLxUq5MO5Cq9/1tdv2u6VMwB4UGD3EMEOSesRtjhMAlr0NDJWMIYrkiHfr2UbfBVU
	 uQ42mbIoRa2NBxXvcrqsVaLEsPiFiKREMH5V0pJK5txoLyHoNK0Fwx28JqWpty2v8rfm4
	 VxAbIF2FjKXjd5iBkNBdA9gmuPHyxCjTx9T7R1O6hZMcexjiRacxx4wbaQ34YGGTm9jXu
	 m527fnisFXgzP30AdmwEUf0Pw4MXa1Pl/f1oJKvBEFHubWS8CxPe7Lq6Xtp6AWjI3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyemlNmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5nV7Op3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6842E606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6842E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyemlNmY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5nV7Op3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvul8360802
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=; b=OyemlNmYS1xXa63r
	DQVLTu+iUnsxfPVq9lH+OWZVOxsYJ5CqAvlQuPv5V7fQOnQ5bWcaWcQcIMEtoP6U
	ceGCRSWUePpw14g+Wi5CyAEsvirH5OWYo9qXIOP+bXoarY7Ujq+CPnwXON+ZR4ag
	jsbMO0YP+Qejam/o6NN4kehNL8Wauxtv4A9x/RmTZ9YcjxPFmZZYfLy9mcVaEi9/
	aCaovGHBwd9YDYsEGCzzvXHz6fVEmITqFSfxlf8TFDDfOkj+GT6iAMrOxngIe8wt
	caMNJye8KKutksvjeis7ciZaGotgPr7gFWEZo2H9Lrw9gT9HMwoAAGSzeaimbFGa
	Q1WpYQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rkp97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:10:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so6098513b3a.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795749038; x=1796353838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=V5nV7Op3GyunTwiBHKHWp2Hn/AhuKjx4+vZbXtr0FB9PlqsvNQlF617OjH1GAuidaj
         e5GHnc2s3VFpTUUXRW1vBuUOlVgqHxft/uOmQ4I4gVAjakwSITRS08GLnOqYXwSS0+yk
         TDGNYBrps82ufFztRorY1iOqxsgE8BBuxx+vBl29ew+3dsSQ2fSKJG2mwMYPzZTzsFt4
         239k8fFF6ifk9nId8+/mimzmfDAmRB3MklNSHKv0Os+YwRDYFpz+H/++OmEjrGLhcPvC
         aCaLYbrJbtxpPuBgcWJu4WR5CVwNWUS1ftpHOp7aghFsblC6/oSRf60wMa80KoH7vRtU
         csbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749038; x=1796353838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=jEJnZTjNbEfoHtj5YyX+e+d/0nVHGoSh5nL5+0ejI+BIieHqHXxVz5o9iET91J0o6a
         kLCr5jvo2brta7kDv1CL1DJ+jTk3w7elcT9qD/MaiuKat2vIH5hOGrUeusBNdheJ9NUR
         AWW6jAnX1fCqzGiyswSa6hb1wsgDkpaYKWi15HKh2oDZXpD/NkQd7YBzs69sL3nZ0Jdt
         zif0VrlTvibTVReOH9aXR7je3HfPPzYA7cNn0q13c1fryegrF7FUmu88z94tPnEuhWi6
         sJXESdYr4Q5bOStMKqCUe0Wi7dYFxYxIZlOn2T7lTn0NlUAxdzbmVqBHe04xs8vynEHp
         poHA==
X-Forwarded-Encrypted: i=1; AL+hErFnSTBnAXww2UGsMOF41cVYdU2pIrU/mtXKm5ST0GGNmR4j90B/96kxhCCAdxzoTgr9h6mt9Hf27uSJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+wdbY9RtkZZa7D9DfAgSKKkStuOuAah50kXuQO4DHNor6zU/uc
	C9ZlckNn2WT6d1mGMS5eUg6VnL3aM8sQ+qpu49ues1yPv2N7KhCR1VVCB3k3M9I1c7qtoWhCRGM
	m8nYyeF/Ixas16Y0Fas9vEhEpVaS5hPLDw2uauDYOzz/DZk7e8IpZ4EuZG4d6rAmM
X-Gm-Gg: AZFdTZdQr3sQp+upPz9k98rBjtrw+7VwKwpPAtJp+qq7nVJc2GL+s8DFr2A/EheIfSX
	ClnxFtZLrPFsFaSxQzC/kvfguN5dNg492fI8yh2+y2EFY0kGdsNHlF5zUSQ2omUfl+bfrWRGtP3
	zE82camC2aO2cB5w4QGUDHdmYGkHQbs05vMq4ru2GUPkqLP80hxvlj3hBJmwxl/VnJrmFgS5cwl
	W+6u4ypluIFH66+cdgryqREADDDRjFTllLbuDzaA+QaPN2ghFLbO1K3XOEzMOq2rHEiPANo9BIA
	oDc6EjgFpgMQ18xaD5GU5wB/rnaKkoHmlajE+R61zEVH239acQ6fyQlxI4p1CKeSfqopgY7x7vP
	7HyjYS0C1oEQfEXa1fm1fHi+uAKMGcHAjYftwbt44Gu/zT4bz4GfcOTfz+8lEcrnb5cDLyk4EZM
	/p0x0Tm7pUuPyUBtnkWxdAComYHjlF7Z3vA8s=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr21204706b3a.1.1795749037873;
        Thu, 26 Nov 2026 19:10:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr21204668b3a.1.1795749037352;
        Thu, 26 Nov 2026 19:10:37 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm12157354b3a.36.2026.11.26.19.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:10:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:10:10 +0800
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes
 for APSS debug block
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-3-42d47474a67a@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749022; l=12581;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6dNHUawBWHNmdzEFROq4a+8fb7b6pspVeO7KwlQmtW8=;
 b=65FJDxdc93dVlN/BIHj89a8vnmYnZcFnby7m/hwPkM8kkcxu9ZflnI8VNr9TIPoU2ZMsx7tXY
 HkgIbyRwTCVAMSL8jsFNWcetVSuxm3vtikOYxb9E8LuAvX+IITrboUm
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfX5wgp7dxH8lSu
 cAzXtBSTclkTAijIdF7spSzCQIYfDXBvc5zcoe1zyfP5OcZo2hbt0Y8Xx7o08H+XOOagfkeSh1j
 zC47LptnC4+yp4N/eQ3KtPkwGGc/IzhxeUwLZvGLur78vFa2hHXcTVnqppPBf6JrayLhbECIyTw
 cEDb4lKEv4WiCN44jTjyGn2O3OmEpEn+2G3HVVX5jwvDSbP5fAs4aP9NRVsYw+HCj+6oMMoqUR+
 BfrEKMBrrBcqkP3QnFzuaA0y/UsTgxVSEOzPjYpF1yONswKuNtZXx7mtytT6EpRRdovYtUrEKQt
 rdli0isO0YbksRfRmA4AlFYfR+Ii2/N6YNJ8LxpAv6JNv/ick0g+PaMxiHq7nWnlrysJJder4+F
 AYxKT/ntCvNDie+lQGS7GKcYP6eq6w0F3nsN7QG/6kB2YS83bVac0dCgSuW5FE1a1wrbpqna0Nc
 t6y8Py1Srgr+xu5zl4g==
X-Proofpoint-GUID: c48ot2FbmtmKnys7bfYjIQ35h1YhPGuS
X-Proofpoint-ORIG-GUID: c48ot2FbmtmKnys7bfYjIQ35h1YhPGuS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMiBTYWx0ZWRfXyzZpkB/LIQWg
 yuquMe9zIH8JhPqR33KGqCvr6KlFDeAhzMFErF9QUmf20nIOlsB5GO0ttmIY/uZDulfe6TFz6ZU
 rWK39pK7Ja4t3zQd6vuuSZgdzxmN0eU=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08f4ae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fu4ftQ_iHlGAbQNs3gsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270012

The APSS debug block is built with CoreSight devices like ETE,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the cluster_pd domain to
each of these nodes, so their power state is tied to the CPU cluster
domain and the runtime PM core can power the domain on before the
devices are accessed and let it be powered off otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
 1 file changed, 567 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..874dcc6a6704 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -219,6 +219,110 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	ete-0 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&ncc0_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-1 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu1>;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&ncc0_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-2 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu2>;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&ncc0_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-3 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu3>;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&ncc0_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-4 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu4>;
+
+		out-ports {
+			port {
+				etm4_out: endpoint {
+					remote-endpoint = <&ncc0_4_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-5 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu5>;
+
+		out-ports {
+			port {
+				etm5_out: endpoint {
+					remote-endpoint = <&ncc0_5_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-6 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu6>;
+
+		out-ports {
+			port {
+				etm6_out: endpoint {
+					remote-endpoint = <&ncc1_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	ete-7 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu7>;
+
+		out-ports {
+			port {
+				etm7_out: endpoint {
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-kaanapali", "qcom,scm";
@@ -5593,6 +5697,14 @@ tn_ag_in37: endpoint {
 						remote-endpoint = <&tpdm_ipcc_cmb3_out>;
 					};
 				};
+
+				port@36 {
+					reg = <0x36>;
+
+					tn_ag_in54: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
 			};
 
 			out-ports {
@@ -5878,6 +5990,43 @@ tpdm_ipa_out: endpoint {
 			};
 		};
 
+		funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in54>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,kaanapali-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x1000>;
@@ -6271,6 +6420,424 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		funnel@1d021000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d021000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1d029000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d029000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@1d081000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d081000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					ncc0_1_funnel_in4: endpoint {
+						remote-endpoint = <&ncc0_4_rep_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					ncc0_1_funnel_in5: endpoint {
+						remote-endpoint = <&ncc0_5_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d090000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d090000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0d0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_4_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_4_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		replicator@1d0e0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d0e0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster0_pd>;
+
+			in-ports {
+				port {
+					ncc0_5_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_5_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		funnel@1d121000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d121000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1d129000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1d129000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@1d181000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d181000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@1d190000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d190000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1d1a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1d1a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster1_pd>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
 		efuse@221c8000 {
 			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
 			reg = <0x0 0x221c8000 0x0 0x1000>;

-- 
2.34.1

