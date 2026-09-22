Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274F51812E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073367; cv=none; b=u53s0xxYtkfnf7pl8bQu6hsVPdhKy+9ebfK8EZoaeXvnsHNOkdT4x79FFKTEYa3K3bpvixKuE7zpO/ZdZZNKl1i+UpT0ihuoXUVwEk8AHjxGedqN8QxeSrba58ooPpVQDPqobfLpSr6EJa+L1/trNkJhv0eOYX2daHS1/+tkhnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073367; c=relaxed/simple;
	bh=zSi9YiVu9JgfZkE53jRMFtXpt/O8U4opnTppTkE6Ewg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuTZ+lAEo8DJg7qQxstAHuSzd5R9ULauYu1g6upupBUG5wpPfScEaWSlI8QNLPee9KGSomUe06KTlv9gG5TjpymYo6EYaOQ4iZoyHMmCWqfiCYuqxd/VB2Pj6GBjMVif7SPgQbIgR4MEriBJEVYZ1AkFb0mtv3uhYeazYFDyTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msCDNnBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Urtm95/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msCDNnBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Urtm95/z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MA35ha801440
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oekZfJz0He5+cv1c3s4QpqZ6kH+Fm6fqrARvnG5wBU4=; b=msCDNnBSbzh3aYB5
	TDsg+pfHdPEU+MwxBunfm9dbjTqI7yJU/dR7Kemj3umH/HktP5irx/Yt4dH0W2KV
	xaJDrCQxfcrapD2Ap4Mb5TZxY9PjU4cn20uknRMXQjFIGhli2OSytPqZkh8WTsNh
	Do62stC2VVNBaU+pCLeNTbGD5Xl36SSNRXPBmLgMFK2hdFWAXFhzushk797vBb3O
	h+Yzx3C0c3t458fmK34CVOYhxxU9z4nklnJZjPSd09dADcjUlqX9BnK7Un7nAOZ+
	gy5iS0s0UKF9sTVgWf1NLrfZi5vMcJt0dHt/jvxlS4kdqmJgCHRMkswN3WwJ3BXZ
	QFgNNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4r49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:35:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so4933899a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073357; x=1790678157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oekZfJz0He5+cv1c3s4QpqZ6kH+Fm6fqrARvnG5wBU4=;
        b=Urtm95/zzK2JNBjRyM85A7taMGcNIt0RoOU/UmuTKnzlTXdPXXTg2eqd3IPoeXOYoj
         y5HspwWTcMSh2Xt9/8FpcoftuBl0Bulj/3Z6uAdeC7q3GwMweFI3qU5Ev7B7rJSLiH9m
         xYEM3SJzLuTmURDAWEAnxT+7LAE50HdPiEs+KxQ9QzaoB21aB8v0y1X8DJSGCrLTi8Cb
         ZSgkITWaj1oS54GGt+zlTYVeivhpRF7tU4rXu/LqU4cf1cjIAM9An3sGQvD6eb2uRdIz
         rQSwCNn/DdYozZRKLn1aHUtVlWnA7wfRjYgEIOqD9UURyfXPS07jEiGpdS8gHAUCrCPf
         /mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073357; x=1790678157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oekZfJz0He5+cv1c3s4QpqZ6kH+Fm6fqrARvnG5wBU4=;
        b=cpnprn96cvw4T/r/Nm63GQ4W0k50LDPUxxRmHOEJVpPARvDkgCRJvipO0cK9boF5B1
         DdHmqU2n4JiJs0+at2g6p96tICWwJxOnPyt90OJatPr2P15+pJoUVo3dkfxaudU+PiRm
         ddS4IAhOreLwtB2vB2qG2Fzx0VB4PkvebjHYE4Jf87fl5uAAOZXJ2qSHSdxjS9+0T12D
         YcmtYNmnbYdA9G27ZG5oEkyFPF39pTWwXnhOuOG08lWhpGTherKEgYpVjnvWi1WKuIws
         ebci+rJXq+xu7DG6sYO7HBYn5i+lxdbhiRcQfo16icThRpnvSM6HXpcckS2Cwp7kkML0
         6EQg==
X-Forwarded-Encrypted: i=1; AKwUvBx5yivCzrwEMt7ikbOeA2B4WxtC/AhJSGjpfxERWYFF9Kh7F55bn4pvGiR9aJQrBaTXoQ1BgiB/UKpE@vger.kernel.org
X-Gm-Message-State: AFuF++lDXuzkXrjQfsdzgGaNA6OJxq5Dl9OKgq3CQxGfgXCam0fam+qp
	1Yx/TqFCLOXdltc//47Yu+604Ja42eAsyMp5SXhzfOUadBArgJsx3ZnQZiXs9JRDCfqQvEzzQ7/
	QfgfaYkyVDC5YMPO2YZzUvs1TyXSreAi4jeacWn9c66soKrVjOEmq3dtq1detLCIAG2ah1Ct8N9
	8=
X-Gm-Gg: AYBFou3mvd48xm4GMOTwQdPSuwT7874f/dpF0qZCEpaedYXfODQd8PrHpDayDV6Sgqd
	mP8RquWxcET2L3GvnmQWiyodNpE1ylbABaWXKd7wJbB84w4xjSZkoetxXaj/p5pcNZAJ7MKiouM
	xMOOIjvwiBKEQiD0Gb2NDGy5M0ehd8J2yFG08XlqYg6PURqC0sZ3Q4wmxwgsBolcICJVsumYktl
	hbM5Ept+pVrJa1puNjUa4K8NNN5RnW1MSndar/rt05kuPhBNq8qOwxuQR218JBPZdWDRJYgYJ/c
	H8pb0nGdPF1HbacE2Obephn5p+GBnXejwELkwnLK74YRHkb9oUo+4JwH6PjYYE9XuHl6MqBiO7P
	tbuqnR01eLKQ9YZLkAzQQz5p9L6qbLPu3+fmu2yH5mCUOZVlB06L+mqx8u9/Nr/E=
X-Received: by 2002:a17:90b:55ce:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a0730aabedmr769842a91.9.1790073357298;
        Tue, 22 Sep 2026 03:35:57 -0700 (PDT)
X-Received: by 2002:a17:90b:55ce:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a0730aabedmr769822a91.9.1790073356811;
        Tue, 22 Sep 2026 03:35:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699aa221sm3670692a91.9.2026.09.22.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:35:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:35:23 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073340; l=12570;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=zSi9YiVu9JgfZkE53jRMFtXpt/O8U4opnTppTkE6Ewg=;
 b=HgBxJtFHjcUIL1dyYHRG0s7ru0iL3tSPD/4xXhntBxXeN7BgEx0Y3TS1jCNGxrINGJT2EyLwn
 5zQ4GEIxGykBb7SmC2lpnwP1GUF+e6dgRb/Hikl9Pyt33ojWGYF4ho9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfXyfheaDmSlRz7
 o+jEbp2c/WFXQqXBhDL0WJ0n7V/mINaUu5uzLgi3oinw6mGX6EgphidwrpvAyNlmyw250PQ/57q
 gKokn+dTyQ9ojbeB/MozrEBXTzycm6HpRrO5uZVatke3axonQWYcEoGy9zpUbDB2CQ9vaLCcYZL
 VmMwA29ZkBkxWRl/jkg+w7ZMO/kRPXspu9TEgciRna7a2mriqWQmLK9ecM/52SxdT8oG0c7X6F0
 MCntcsQiE6zIVso+uss5SEzKL9LbZF6X5EvIV5YrQ0IHZ19aXyLI8PJLHaNXHSXqlvjvicwzWeC
 UQBwtCMKrXfG+43oJ39pHZ1ZuF6pWxPNJRF7+FPTP/bqoYW/evRsio3BvjW0IqLBIazwfEXkmgy
 oB4COdHVeRFsca5KxHA5dozqBxih3KiF4D9ljpbaet79e9UEuedl9c2yqGkhoy/n+xY0qFVsoQL
 nXhSawVQHhB5i19aA5A==
X-Proofpoint-GUID: Yg0icJ7bi-viiUAfPC3fRjY2FWFfys7w
X-Proofpoint-ORIG-GUID: Yg0icJ7bi-viiUAfPC3fRjY2FWFfys7w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfXwE2i1MBY2g6J
 OEVuNE+z+zGKM6dh3MuBkwkGktwjOTL6F7EDGkwDLN1ycwakuu3vQ0YovHHoML56ubkTh0KQtd9
 RDFo+DEb/qxxn3eck8kQa2JZZH6swtg=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab25a0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OUbgBpunvq_OnP_L4kAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220152

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
index 131fd2a16c54..d9313de53ee5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
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
@@ -5292,6 +5396,14 @@ tn_ag_in37: endpoint {
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
@@ -5577,6 +5689,43 @@ tpdm_ipa_out: endpoint {
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
@@ -5970,6 +6119,424 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		funnel@1d021000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1d021000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
+			power-domains = <&cluster_pd>;
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
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.34.1

