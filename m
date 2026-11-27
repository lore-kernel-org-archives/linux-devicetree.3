Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754309;
	b=A9o+yfl47qLPKffQXmEOBXPqMaXUOoRshRNdfvhA/wAxgianIhos7NF3wvogFt0Zb9YN
	 Qu2kOaxByaxbSC0Bq+VdMdFc2vUEVIjte/yOD8mxu6a237Nc4IK59HK3mnx2wPiTYHZgm
	 J+lMA9J0pjnbrvlCiLSUxIDfUmqb67vlrwpTxeGgSM5tlFACROB4vdJcjBR8jR0uJa06Q
	 dccebJC9w+UpBxi+0SbDuO+IZGiot4Ip0K2T+aC63dDyiUkhC7KDPBKJ1cGyjVhp5RD3P
	 7dtKF1htAttuZ/rx5FFYOkCYO1GPB3WAGuItgg0C8HhR4k6+6pXdlzx/qAM4EE6eDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
	b=GjBIQzVS3yMVayTgCVY1ocxxtSTs/ZkgTBaaCvWewfX+RSI1EYvzX+v4cLKJvZovHb+t
	 VnmDzP/5GcDO+faHWVCAO+bv77T7O3jNt3XDfdKpeSCwv0p6/Cgxch9ENxf4BXBrxoqMl
	 EnjiaAxrewOoaxQtNxOXWmTtahS5Mt0vumzo0MgybQ4rChxllp91RlvQpzTzQcozpmQIq
	 An++UpsATVqcRLQetGIidoHjKfXLQflWaQLe84E8Edl62EWNkK6Zn/9eaLBZAZK25yJdB
	 LlVh/Tmzg3SGNpiltjXTXVCFuHmuEFcRpWF4vbvX5g0tIVjM/dnLM7KQzAcUGUAMGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BeVG/ZNf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SVbGKkx5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5769F606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5769F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BeVG/ZNf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SVbGKkx5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwEVe161491
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=; b=BeVG/ZNfoK/FlaOr
	o8T2/X2bit9wZ3zmalRueOpHesMY3t4vQ11pJwVUxaB8O2UOuFNVKg5h1BBDvB4r
	zDSotAEMg5xqrCoTy6F6HDsIelflgrHbMR7/AUDmRGothZ4CZ4ECbeNjNXQXVc0J
	hJ4qnij/CqsjJMkNXT+UdCkLwMcZ+uyKX0ipc/JEGlm8Jx9Eg0KYsJLP+hmUwuus
	nnB8vNl29gHJ7PKQmInyURKMqjCsSS2ok4IsuSp/d5ys8UEXnJDS0F8UROgupKNl
	q9CGlXsoIhCJIuRFlHHpQUyc7vkMu1IFoo0vdV6yMwr5FffR3ImBGlaGfxiCmpkO
	beB8XA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7gbe09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so3807618a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754307; x=1796359107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=SVbGKkx5CNBY6VJeah28h4fkCT//gz8bt+d+xCUA0CfUOe9UMrCRuHNhLERHCUZnO1
         ewYnH/nNjhoMYClQHrfO9ehJsiX79TdG1JCidaFjFpOtMYB00KdEV4+KjKrrM/RH6A32
         2sAoD+/Hu7/R8FJmo0uH3pNgE1H3KajOLR8DgE+LuNP60PkS5eE/uIop8n7SsXZ5FqG9
         KzUltKwCaDpbbefcr55zQpDjSCCvLNWmONBJKZ2LnG7WfEwY6d/YZtUkvHhET4+aoNLy
         Tu6rAfcpdfkmIToAzGXnLQiYQBLAHp1tLYdkwTgdlnOJa7cEoaB2sg0nQk0BiNUZP8MD
         1y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754307; x=1796359107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TY5qpw6Cyiwu1zQZiUs1s2rwROyuOGsmNwQ21EqSvA=;
        b=QQ694+6F0GBAKn+uHotljlz/DAJsu48ZU07u9mQtzEI7jBtLSDd0Sb3ztfhYtkX7ES
         V5aOA0M/rOqA0Ccrya+eIHuruW7qUstRhhzBix4xXGbX2ft8tTpsTR7Ry4uuKY2A+Pnw
         o1J52RTxl1cJd5qrnuyoY2puOIg2GPDDblw7OCWLzjWp2YYw5yOsUPdx2OtolB2kY/SW
         fLRzqnHS7UPPZ0DU14VKEmYXt1SotDSpXax/yS/fdrDe1tiUnX/rneF7TfZx1ked5Ze8
         D6paJrscl3nFV0jcESRyU8Fa6Oeml6cizc/XXEqo7QaTA9UA1t65qp9luPNcnONeclmL
         vzhA==
X-Forwarded-Encrypted: i=1; AL+hErH4Oa3jL2usWxaoZwkUkA2iCwgDPENIwIU4GNFTWTla9hsnpwJxs9jfQ/3K1Wx/RpOSQ8WR36XpmI6n@vger.kernel.org
X-Gm-Message-State: APuU4Z/+ATAfEIAWQF/vrDnqx89swk3fymrqJSi+WeGqlH9PuyvZ60w0
	fBTfAqutVqIq7ehKJbKTGk9Gab6Fv1+rRgDP7Qs0i1cZfwSEh59a46X23/PIxVE6oAdo2RU9dM+
	dUxiHGc5hEZ14bM13MaHiJ84MMXAzefCpXazT706E73YUIeVLPSnNZZORwNJWKv0NCFTr8jYpVE
	k=
X-Gm-Gg: AZFdTZcI4wZgzKsBMr3RcAeuVP/pJm/WU9mmKX8JPZOEeQUExRr/VMXQ1e4Mc4kRwfN
	Wyuo65d1oQlPSsgqHvabgd927d+xydL3X8YoWfZnJGi8XX332TtllW8gn/KKAgh1GafNaV3SPsX
	TtCuFpm06evNoF/nyU7dkKPopgn+Np1eRI4J0aZtgbzMXEYmPNwMfVsPq5p0eM4WSIOG0TFAzJ3
	QmGWYVSUMXPh84iKUSR04eMB6vkQ0kTyt1QE8eEkmFsD4FNzad2pYQqYfsF2eYuETGhVY8eHWo2
	PCQKPn7MFRDJnWhF3XTb981kTlUVs9WJHVCrvuZVNIUAVk37QV5qq28Zy5HUM6NIBwZwLy4XPGe
	PZxn/trrR/GYNNJOVlRFUKGDeg/2SMHGo2PAEAga8ZzryDyoRJ/cD6kr7NJaGtmYezs68O+MtLo
	Xy4Q2KkW8Dg61dCX79obZi7CdiWWcljSC02MU=
X-Received: by 2002:a17:90b:5350:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b41c8fe153mr21030943a91.23.1795754306930;
        Thu, 26 Nov 2026 20:38:26 -0800 (PST)
X-Received: by 2002:a17:90b:5350:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b41c8fe153mr21030912a91.23.1795754306360;
        Thu, 26 Nov 2026 20:38:26 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm38823918a91.5.2026.11.26.20.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:37:36 +0800
Subject: [PATCH v3 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes
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
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-3-0037736dfbc1@qti.qualcomm.com>
References: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
In-Reply-To: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795754292; l=12581;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6dNHUawBWHNmdzEFROq4a+8fb7b6pspVeO7KwlQmtW8=;
 b=FR/eSvFp3KS6uXutcx4B4kGGhHYv9n5XvOvDUCm/lpyfo0JOPrr9SAzGUdpMOdScg0mbIDScM
 Y9gwmxvetEwCl24e9Nxj9aJNMDcuVfNEVbrOaFBU8Htk0aw/xm33ANA
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: MMKG3pRn1C0k0bzt__oSju-2U9C9foia
X-Proofpoint-GUID: MMKG3pRn1C0k0bzt__oSju-2U9C9foia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfXw4TU6pk6b/mJ
 BHeWgvYakLK4GSUfYjjNbQYCG6hCQpisMWhnZyXwYuhLBQBWWZRqOpbiXf7HIklAaeG6o79P3lN
 OMaguybcrNDLe+WFV80VxgLzfiUq+9CvNOvBIMZaKg66S8A5b6/MxFub8aQozSYrqL0ki/kNjZa
 CFyT9ox8msIVqEhzHJ74EwL8y96O/N49q7qpeDC6MUJnL9AKYW22Eb4H+t4E5QoeZ2PAbsfRJbd
 e2+UEt3r7+b2B8c2hfkH3CLXF1keI/j/7JiA71bRti2/nvP6Lt1uHWv2f2kCHCO6lesF0BmIkso
 GLQkuRsrOKA8VW+OhIQABW9UErjHoPQIztYgoO/XjiawPSRKRYa24FiJNLOs/0x6kBqTG1Sdwfp
 3NlLQKz5HEirVIusWmxqOmNbbYNX2ufqViE7ApkpNQzaqq2D8Ivqv1pD3Y4TVSbUVBJYWcmBHII
 bnC4tKxV8cbPVTryZFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX4arQ3O2INQLY
 +dLjGCFesdVJOPBYMYo/Oqv5SXC3hL9mvu7cKEJW2lCaSyjf6woeN5KYijkx56mrRq2eWRup8Bq
 82Q4iWtj421Qz6c7sphz5e7+xibvat8=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b090944 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fu4ftQ_iHlGAbQNs3gsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270018

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

