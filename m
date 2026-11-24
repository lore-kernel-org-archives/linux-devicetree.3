Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513204;
	b=zEB0mYssZ3Z9WmQVlh0+H3UNyo4IbLiEBeO6udK4Y6IJ3+N1e5QWNPeugxc/7HQqiTzo
	 WgfQKFh242pygW5/oMenBZ92+h1JFGzfgJMGhaB5XAJj3M4ngM+7gHmnObjKKoYsdAp+n
	 0QiMh6mNiDV2vek5BNtJgNWE7MB/lktJXTOtyEDUcVf+bvFhhop/XYUQWEBqQn8scdGOx
	 kGbyyg8+olwTb71PRmO1H+c+ZjCHnyCKDikaQLDig5JQpn+Q4/mc+nNY0CvWGi2tBexmg
	 +HucMcUJ8+sXFXkcmZsRPToGvq1MF4VxOGCdMKGy4FESJ/G1usyZ+0I70z+HlHBeKtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AqxFGhauGqFuuyRATgsU9pr9YQNZUaQiI17Gms+Sm9k=;
	b=csrW5Y5wdA3GBqG+xfPDCYXu3R0PjBr4AaxB69EK85gvzVP4spslNMgCCBtqUrKm597f
	 kpnF+klCW3AqFWYtqwZdqKiRyn1FAHHfAhsbfrv3qqMlFsnlc9TJaJB0diD71JkH9/EUN
	 zNShC2soDQGeXLwWNXmzRs3WqouOI8lwGPrfSqMKX6lp32x/P+R/w1zbj7I4cnjdPqLhg
	 Q5MHVyL07dB51q+hRzBGLaTGQc4QT8xQz/XGrOrGQSFQcK6m3gjqB6vMT35hPjhZnulNq
	 RTcRfK/iiILmUXHoE6zftnqReVqFhPNXPQEikzo2pXfagYkCHQiza3wylAr6x/LPRnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emQtP23l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZQJ5b1J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70171606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70171606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emQtP23l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZQJ5b1J
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8WYUU2209288
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AqxFGhauGqFuuyRATgsU9pr9YQNZUaQiI17Gms+Sm9k=; b=emQtP23l4rnWzoVF
	SWxRkS3KnU+IOqO2n/ihh74CyfkEoaNCHfD04JOg4iy/c3zcT7AOwXI1MOUN4B/9
	Y6UrbOei+sGPO3iHeeLGyeg5mRy4M1VDVYTz+Uf6ot/ENwLWplseGaJYkbuMvOS1
	M9foheSRO9Dwo4K9bYl0P1o+j9cqOI7b6MlMOz5Yq0JzMIin+RFqsEbXdgsoLM7T
	S/zeIuxEcfS72wbEo7YKk26I+L5Yp8Qm7rkDqfGAoa+JI8kCqhu0zV/5Ymt6VaL3
	fMOSsr6qYwDNW+eRYXzgvH7O8rDuoD76slq1Z4e1MuOAk1KM4CiwLkjTSUAVU4hh
	RR9rzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy120db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:40:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so4657138b3a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513199; x=1796117999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqxFGhauGqFuuyRATgsU9pr9YQNZUaQiI17Gms+Sm9k=;
        b=bZQJ5b1J15Voeh7FZ5bADMTRwWhuNFkyW7nzuScN4m2v/pNFLKZuYKBvHWSO/qDyTA
         Y81A1mqUPWmYfSENcSzTmhIhloVmwmAuQdq5e7gp2wdYUED5rkKBBFmj7CbPES4TPl3/
         Yva4XjmUvAl0hPCvrDUSCcM06yPM9w0begDUkduGkpTfx51huJgNoIwwLkhmCHXh2OO5
         D92Vb+asM8UjbJTIkyvDXsK4OHU4KB+P8wFZBllkknerxKTv4TqNBxCKFDnZov8kU73Z
         zW2GQsWRu/PPanV1ezWH3qcIviiFB90DsI8ZvDenOosFXn8i517XNl4CX+aWDF1OxXdB
         2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513199; x=1796117999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqxFGhauGqFuuyRATgsU9pr9YQNZUaQiI17Gms+Sm9k=;
        b=yLTzRN8/NFHhvN8kkMC/Hgj9dX/NREEfnw/ToQO5Tae6kV/5yjg8oSipDzMNcOa1kA
         +FWxLPBr2NkFNd2eFFKQwpdxaWDUe6P4XpPsTndHAbYeNwIVix2HOmAivgx4m7yuKm5u
         ij1/x+o3a/HOmIKV1ZaWMk7mPmwYIp68tfSL85jN02QtvNYSuaNgWT/DkthcEK5ZOhdD
         Q2tBaK+/6BHP1i8KGrZCKu5qOeNwYV8Ancou0hxtmvmuqNbWSKAkwtEsn2jwltLb9mwh
         u58sapXpVFekaBmzULB5LUlWVgVv5vA2TPfAe1KjTwXxqNc2VSG+Pi70crMU/RHV7SCR
         1QrQ==
X-Forwarded-Encrypted: i=1; AL+hErGMyW3t4ra1L+I7Qp/Ri1KAj3pw4bwVad6aRECoDRjZ6skRXPoBcnTI/Dc/E3ovW2Jxm2FTRk19cjc7@vger.kernel.org
X-Gm-Message-State: APuU4Z9R+MCjHt3ZVLVU9fXDUatrU2jXIk14ng+d5omVwDPGU+FitDWT
	QJjeLFgXqHt7fr1ijiPBRIFU97pRq01bcBOdfgeeia8qfiPCekMPrEn6ioReIe3tKy3czdf1rCV
	R4Ndm3AlifGFv82u87EG/1SM6XX14MxwQqGXBkXKL4XdxdK2yrETuDERMAR9IDzZwQrMbcCuyme
	k=
X-Gm-Gg: AZFdTZcJpG28LAiRiL+tR9dHzQ4tvLepaCZeyG+kRnqPWXToukNl24M12pd9y/msQn5
	P2hv1r0o3sv7UanmpjXWs819GsMVVKxpW+OB/jz1N4+yM7MQ1vk32rqRjvsoECAqJLrCOl5DlIa
	+AWMBhpyJw7kzsan3UlbMt7fFo4AViDccG18+D9Bftvs4fSHNqvBbgh/sx7BSMQ3ENNsP6vNlHs
	y4YH2sGh7LTFrQRptF6sLKGHOT9nk0xI1ih+QREiXMhPs1+p7vcbBKzF3LAGcIdfMdcCR6o6izw
	fRaTMjwm7SlvX2/Eq2ACI4DUMbmkIO0YJr1re58HnZy7k5mIG3y/U9JhAbWxYcDrpa4/Rx3bRDo
	XdqBcsn6vWd+YlY5V5h5Vn7dkVqs4fscOx+pD3WMOqcmyOOR3BEIsHfcO5i6Q8Oi8PhCD3Pi6Ll
	Os1HWHPm+t7CJP+qOqRQC+Z483Pr7okvEQPm1T
X-Received: by 2002:a05:6a00:a02:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8c87d022063mr13338187b3a.44.1795513198933;
        Tue, 24 Nov 2026 01:39:58 -0800 (PST)
X-Received: by 2002:a05:6a00:a02:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8c87d022063mr13338140b3a.44.1795513198067;
        Tue, 24 Nov 2026 01:39:58 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:39:31 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
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
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=43019;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=aJXbsbPZqzmfcaYQQ/CuUKxgZScpf3JCfddZIHC9VFo=;
 b=U8q6A+oc8KFzrQKAUvtGBwT2H+C+CWzmEisLrt6qYbjL7ZgyMQKPpOtPy2mfrDiYIyfigDuLm
 mxKUpAMPxxeCBoXaBToT5B3fMUnU0eZcqQFv3+tMwLWRG39JgJs1vOi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: jM9BussZLVsGMaQUEPhJqTR6xB-b999X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX5+qURQy7LzxT
 Z7WaccRMktlerezhTVMLP4Qg9YxS9ROSVkFnEbRkzYO7on12k4IcxOjHdyk/hwf6TkcjwNlgrIS
 EeO9HSrSxwrN+G9WBKTNopcXZ+Bt9N8=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b055b70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VB87f_fc3BoEAbQ529IA:9 a=Q34CTfw0nJs6sY9p:21
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXwKrhIiBFPWBw
 nGld78nhcGXgFOjGOBRBf7nsP5WOvWgMVg1G4CzRAbi9rgNOVvVgUh/YeqOw/IfE1juS0JflCoA
 wxx16oIPjLOrEL8A/U+2MfhF37PE7/xTuN5k16CTL7t5vGEW15WnlBC6CgZuX1RKF6gypcnMX0h
 y4EnHIHPTXBJnyHZ38vlPuxagFV4CXY3YEVEORJCogQtO7umhoGTnSxjz9m7qLCQ+ASAkfNR1ak
 tzpmiVMT0dQj3XsVv7/r+idvLAPHeWDAmtRHRb5+TdNNsoMJWoQ8LNkZjZP0TUntluisW6mCes2
 i8LVjGm1GalyFmzq1i1c19i20ow4/fPtOnoU2k+QrM5oaGWVogzzdxVEQJ1S5Fw7ui33lcZJAW9
 BmXfsKS8Hdk3y9rhN6qC+Fl0yxKETq3XfoQWUuRF5ILaSnT5UkjRHdM8ilUV8F6Mba500gweOdH
 +dg0Akqhe4IF/l3hg5g==
X-Proofpoint-GUID: jM9BussZLVsGMaQUEPhJqTR6xB-b999X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

Add DT nodes for the CoreSight debug and trace subsystem on the
Qualcomm Eliza SoC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2177 +++++++++++++++++++++++++++++++++++
 1 file changed, 2177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c0..7bf58daace9c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -33,6 +33,36 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	audio-etm0-0 {
+		compatible = "arm,coresight-dummy-source";
+		label = "audio_etm0_0";
+
+		arm,static-trace-id = <40>;
+
+		out-ports {
+			port {
+				audio_etm0_0_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in0>;
+				};
+			};
+		};
+	};
+
+	audio-etm0-1 {
+		compatible = "arm,coresight-dummy-source";
+		label = "audio_etm0_1";
+
+		arm,static-trace-id = <41>;
+
+		out-ports {
+			port {
+				audio_etm0_1_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in1>;
+				};
+			};
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -330,6 +360,123 @@ cluster_sleep_1: cluster-sleep-1 {
 		};
 	};
 
+	dummy-eud {
+		compatible = "arm,coresight-dummy-sink";
+		label = "eud";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&replicator_swao_out1>;
+				};
+			};
+		};
+	};
+
+	ete-0 {
+		compatible = "arm,embedded-trace-extension";
+		cpu = <&cpu0>;
+
+		out-ports {
+			port {
+				ete0_out: endpoint {
+					remote-endpoint = <&funnel_ete_in0>;
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
+				ete1_out: endpoint {
+					remote-endpoint = <&funnel_ete_in1>;
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
+				ete2_out: endpoint {
+					remote-endpoint = <&funnel_ete_in2>;
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
+				ete3_out: endpoint {
+					remote-endpoint = <&funnel_ete_in3>;
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
+				ete4_out: endpoint {
+					remote-endpoint = <&funnel_ete_in4>;
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
+				ete5_out: endpoint {
+					remote-endpoint = <&funnel_ete_in5>;
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
+				ete6_out: endpoint {
+					remote-endpoint = <&funnel_ete_in6>;
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
+				ete7_out: endpoint {
+					remote-endpoint = <&funnel_ete_in7>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-eliza", "qcom,scm";
@@ -339,6 +486,169 @@ scm: scm {
 		};
 	};
 
+	funnel-ete {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_ete_in0: endpoint {
+					remote-endpoint = <&ete0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_ete_in1: endpoint {
+					remote-endpoint = <&ete1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				funnel_ete_in2: endpoint {
+					remote-endpoint = <&ete2_out>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				funnel_ete_in3: endpoint {
+					remote-endpoint = <&ete3_out>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				funnel_ete_in4: endpoint {
+					remote-endpoint = <&ete4_out>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+
+				funnel_ete_in5: endpoint {
+					remote-endpoint = <&ete5_out>;
+				};
+			};
+
+			port@6 {
+				reg = <6>;
+
+				funnel_ete_in6: endpoint {
+					remote-endpoint = <&ete6_out>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+
+				funnel_ete_in7: endpoint {
+					remote-endpoint = <&ete7_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_ete_out: endpoint {
+					remote-endpoint = <&funnel_apss_in0>;
+				};
+			};
+		};
+	};
+
+	funnel-lpass-lpi-0 {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_lpass_lpi_0_in0: endpoint {
+					remote-endpoint = <&audio_etm0_0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_lpass_lpi_0_in1: endpoint {
+					remote-endpoint = <&audio_etm0_1_out>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+
+				funnel_lpass_lpi_0_in7: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_lpass_lpi_0_out: endpoint {
+					remote-endpoint = <&funnel_aoss_in5>;
+				};
+			};
+		};
+	};
+
+	funnel-lpass-lpi-1 {
+		compatible = "arm,coresight-static-funnel";
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				funnel_lpass_lpi_1_in0: endpoint {
+					remote-endpoint = <&lpass_stm_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				funnel_lpass_lpi_1_in1: endpoint {
+					remote-endpoint = <&tpdm_lpass_lpi_out>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				funnel_lpass_lpi_1_in4: endpoint {
+					remote-endpoint = <&tpdm_lpass_rscc_out>;
+				};
+			};
+		};
+
+		out-ports {
+			port {
+				funnel_lpass_lpi_1_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_0_in7>;
+				};
+			};
+		};
+	};
+
 	clk_virt: interconnect-0 {
 		compatible = "qcom,eliza-clk-virt";
 		#interconnect-cells = <2>;
@@ -351,12 +661,57 @@ mc_virt: interconnect-1 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	lpass-stm {
+		compatible = "arm,coresight-dummy-source";
+		label = "lpass_stm";
+
+		arm,static-trace-id = <25>;
+
+		out-ports {
+			port {
+				lpass_stm_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in0>;
+				};
+			};
+		};
+	};
+
 	memory@a0000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
 
+	modem-diag {
+		compatible = "arm,coresight-dummy-source";
+		label = "modem_diag";
+
+		arm,static-trace-id = <50>;
+
+		out-ports {
+			port {
+				modem_diag_out: endpoint {
+					remote-endpoint = <&funnel_modem_q6_in1>;
+				};
+			};
+		};
+	};
+
+	modem2-etm0 {
+		compatible = "arm,coresight-dummy-source";
+		label = "modem2_etm0";
+
+		arm,static-trace-id = <39>;
+
+		out-ports {
+			port {
+				modem2_etm0_out: endpoint {
+					remote-endpoint = <&funnel_modem_dl_in1>;
+				};
+			};
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -4142,6 +4497,1705 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,eliza-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&tmc_etr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&tmc_etr1_out>;
+					};
+				};
+			};
+		};
+
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x37280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel_in0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					tpda_qdss_in1: endpoint {
+						remote-endpoint = <&tpdm_spdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_qdss_out: endpoint {
+						remote-endpoint = <&funnel_in0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_spdm_out: endpoint {
+						remote-endpoint = <&tpda_qdss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
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
+					funnel_in0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_in0_in6: endpoint {
+						remote-endpoint = <&tpda_qdss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_in0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in7>;
+					};
+				};
+			};
+		};
+
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&replicator_swao_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_qdss_out: endpoint {
+						remote-endpoint = <&replicator_etr_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator_etr_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_etr_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_etr_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_etr_out1: endpoint {
+						remote-endpoint = <&tmc_etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr1_in: endpoint {
+						remote-endpoint = <&replicator_etr_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10800000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_modem_0_out: endpoint {
+						remote-endpoint = <&tpda_modem_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@10803000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10803000 0x0 0x1000>;
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
+					tpda_modem_in0: endpoint {
+						remote-endpoint = <&tpdm_modem_0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_modem_in1: endpoint {
+						remote-endpoint = <&tpdm_modem_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10804000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10804000 0x0 0x1000>;
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
+					funnel_modem_dl_in0: endpoint {
+						remote-endpoint = <&tpda_modem_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_modem_dl_in1: endpoint {
+						remote-endpoint = <&modem2_etm0_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_modem_dl_in3: endpoint {
+						remote-endpoint = <&funnel_modem_q6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_dl_out: endpoint {
+						remote-endpoint = <&tn_ag_in13>;
+					};
+				};
+			};
+		};
+
+		cti@1080b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1080b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_mss_qdsp6";
+		};
+
+		funnel@1080c000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x1080c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					funnel_modem_q6_in1: endpoint {
+						remote-endpoint = <&modem_diag_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_modem_q6_in3: endpoint {
+						remote-endpoint = <&tpda_modem_crm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_modem_q6_out: endpoint {
+						remote-endpoint = <&funnel_modem_dl_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@1080e000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x1080e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tpda_modem_crm_in0: endpoint {
+						remote-endpoint = <&tpdm_modem_rscc_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_modem_crm_out: endpoint {
+						remote-endpoint = <&funnel_modem_q6_in3>;
+					};
+				};
+			};
+		};
+
+		tpda@10823000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10823000 0x0 0x1000>;
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
+					tpda_dlct_in0: endpoint {
+						remote-endpoint = <&funnel_video_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					tpda_dlct_in5: endpoint {
+						remote-endpoint = <&rep_wpss_out0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_dlct_in6: endpoint {
+						remote-endpoint = <&rep_wpss_out1>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					tpda_dlct_in15: endpoint {
+						remote-endpoint = <&funnel_gfx_dl_out0>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tpda_dlct_in17: endpoint {
+						remote-endpoint = <&funnel_cdsp_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_dlct_out: endpoint {
+						remote-endpoint = <&funnel_dlct_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10824000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10824000 0x0 0x1000>;
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
+					funnel_dlct_in0: endpoint {
+						remote-endpoint = <&tpda_dlct_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					funnel_dlct_in4: endpoint {
+						remote-endpoint = <&rep_wpss_out2>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_dlct_out0: endpoint {
+						remote-endpoint = <&tn_ag_in44>;
+					};
+				};
+			};
+		};
+
+		tpdm@1082c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1082c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_gcc_out: endpoint {
+						remote-endpoint = <&tn_ag_in17>;
+					};
+				};
+			};
+		};
+
+		tpdm@10830000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10830000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_video";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_video_out: endpoint {
+						remote-endpoint = <&funnel_video_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10832000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10832000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_video_in0: endpoint {
+						remote-endpoint = <&tpdm_video_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_video_out: endpoint {
+						remote-endpoint = <&tpda_dlct_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10841000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10841000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_prng";
+
+			out-ports {
+				port {
+					tpdm_prng_out: endpoint {
+						remote-endpoint = <&tn_ag_in18>;
+					};
+				};
+			};
+		};
+
+		tpdm_wpss_dsb: tpdm@10880000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10880000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_wpss_dsb";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_wpss_dsb_out: endpoint {
+						remote-endpoint = <&funnel_wpss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm_wpss_cmb: tpdm@10881000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10881000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_wpss_cmb";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_wpss_cmb_out: endpoint {
+						remote-endpoint = <&funnel_wpss_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10883000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10883000 0x0 0x1000>;
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
+					funnel_wpss_in0: endpoint {
+						remote-endpoint = <&tpdm_wpss_dsb_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					funnel_wpss_in1: endpoint {
+						remote-endpoint = <&tpdm_wpss_cmb_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					funnel_wpss_in2: endpoint {
+						remote-endpoint = <&wpss_etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_wpss_out: endpoint {
+						remote-endpoint = <&rep_wpss_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@10900000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10900000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_gfx";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_gfx_out: endpoint {
+						remote-endpoint = <&funnel_gfx_dl_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10902000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10902000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_gfx_dl_in0: endpoint {
+						remote-endpoint = <&tpdm_gfx_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_gfx_dl_out0: endpoint {
+						remote-endpoint = <&tpda_dlct_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@10980000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10980000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_cdsp_out: endpoint {
+						remote-endpoint = <&funnel_cdsp_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@10983000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10983000 0x0 0x1000>;
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
+					funnel_cdsp_in0: endpoint {
+						remote-endpoint = <&tpdm_cdsp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_cdsp_out0: endpoint {
+						remote-endpoint = <&tpda_dlct_in17>;
+					};
+				};
+			};
+		};
+
+		cti@1098b000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x1098b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_cdsp_qdsp";
+		};
+
+		tn@109a0000 {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x109a0000 0x0 0x3080>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			arm,primecell-periphid = <0x000f0c00>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@c {
+					reg = <0xc>;
+
+					tn_ag_in12: endpoint {
+						remote-endpoint = <&funnel_tmess_out>;
+					};
+				};
+
+				port@d {
+					reg = <0xd>;
+
+					tn_ag_in13: endpoint {
+						remote-endpoint = <&funnel_modem_dl_out>;
+					};
+				};
+
+				port@11 {
+					reg = <0x11>;
+
+					tn_ag_in17: endpoint {
+						remote-endpoint = <&tpdm_gcc_out>;
+					};
+				};
+
+				port@12 {
+					reg = <0x12>;
+
+					tn_ag_in18: endpoint {
+						remote-endpoint = <&tpdm_prng_out>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					tn_ag_in25: endpoint {
+						remote-endpoint = <&tpdm_mm_dsb_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					tn_ag_in27: endpoint {
+						remote-endpoint = <&tpdm_south_dsb_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					tn_ag_in28: endpoint {
+						remote-endpoint = <&tpdm_ipcc_cmb_out>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					tn_ag_in29: endpoint {
+						remote-endpoint = <&tpdm_center_dsb_out>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&funnel_apss_out>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					tn_ag_in34: endpoint {
+						remote-endpoint = <&tpdm_center_cmb_out>;
+					};
+				};
+
+				port@25 {
+					reg = <0x25>;
+
+					tn_ag_in37: endpoint {
+						remote-endpoint = <&tpdm_south_cmb_out>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					tn_ag_in44: endpoint {
+						remote-endpoint = <&funnel_dlct_out0>;
+					};
+				};
+
+				port@4a {
+					reg = <0x4a>;
+
+					tn_ag_in74: endpoint {
+						remote-endpoint = <&tn_ddr_out>;
+					};
+				};
+
+				port@61 {
+					reg = <0x61>;
+
+					tn_ag_in97: endpoint {
+						remote-endpoint = <&tn_soccp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel_in0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_mm_dsb";
+
+			out-ports {
+				port {
+					tpdm_mm_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in25>;
+					};
+				};
+			};
+		};
+
+		tpdm@109a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
+
+			out-ports {
+				port {
+					tpdm_south_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@109aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_center_dsb";
+
+			out-ports {
+				port {
+					tpdm_center_dsb_out: endpoint {
+						remote-endpoint = <&tn_ag_in29>;
+					};
+				};
+			};
+		};
+
+		tpdm@109ab000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb";
+
+			out-ports {
+				port {
+					tpdm_ipcc_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in28>;
+					};
+				};
+			};
+		};
+
+		tpdm@109ac000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109ac000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_center_cmb";
+
+			out-ports {
+				port {
+					tpdm_center_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in34>;
+					};
+				};
+			};
+		};
+
+		tpdm@109af000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x109af000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_south_cmb";
+
+			out-ports {
+				port {
+					tpdm_south_cmb_out: endpoint {
+						remote-endpoint = <&tn_ag_in37>;
+					};
+				};
+			};
+		};
+
+		funnel@10b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10b04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@3 {
+					reg = <3>;
+
+					funnel_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_ddr_lpicc_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					funnel_aoss_in5: endpoint {
+						remote-endpoint = <&funnel_lpass_lpi_0_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel_aoss_in6: endpoint {
+						remote-endpoint = <&tpda_aoss_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel_aoss_in7: endpoint {
+						remote-endpoint = <&funnel_in0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_aoss_out: endpoint {
+						remote-endpoint = <&tmc_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10b05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etf_in: endpoint {
+						remote-endpoint = <&funnel_aoss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_swao_in>;
+					};
+				};
+			};
+		};
+
+		replicator@10b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10b06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,replicator-loses-context;
+
+			in-ports {
+				port {
+					replicator_swao_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_swao_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@10b08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10b08000 0x0 0x1000>;
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
+					tpda_aoss_in0: endpoint {
+						remote-endpoint = <&tpdm_swao_prio0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_aoss_in1: endpoint {
+						remote-endpoint = <&tpdm_swao_prio1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_aoss_in2: endpoint {
+						remote-endpoint = <&tpdm_swao_prio2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					tpda_aoss_in3: endpoint {
+						remote-endpoint = <&tpdm_swao_prio3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					tpda_aoss_in4: endpoint {
+						remote-endpoint = <&tpdm_swao_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_aoss_out: endpoint {
+						remote-endpoint = <&funnel_aoss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio0";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio0_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio1";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio1_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio2";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio2_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio3";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_swao_prio3_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@10b0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10b0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_swao_out: endpoint {
+						remote-endpoint = <&tpda_aoss_in4>;
+					};
+				};
+			};
+		};
+
+		itnoc@10ba0000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x10ba0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				port {
+					tn_soccp_in0: endpoint {
+						remote-endpoint = <&tpdm_soccp_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_soccp_out: endpoint {
+						remote-endpoint = <&tn_ag_in97>;
+					};
+				};
+			};
+		};
+
+		tpdm@10ba4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10ba4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_soccp";
+
+			out-ports {
+				port {
+					tpdm_soccp_out: endpoint {
+						remote-endpoint = <&tn_soccp_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@10cc1000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10cc1000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tmess_1";
+
+			qcom,dsb-element-bits = <64>;
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_tmess_1_out: endpoint {
+						remote-endpoint = <&tpda_tmess_in2>;
+					};
+				};
+			};
+		};
+
+		tpda@10cc4000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10cc4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					tpda_tmess_in2: endpoint {
+						remote-endpoint = <&tpdm_tmess_1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_tmess_out: endpoint {
+						remote-endpoint = <&funnel_tmess_in>;
+					};
+				};
+			};
+		};
+
+		funnel@10cc5000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10cc5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					funnel_tmess_in: endpoint {
+						remote-endpoint = <&tpda_tmess_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_tmess_out: endpoint {
+						remote-endpoint = <&tn_ag_in12>;
+					};
+				};
+			};
+		};
+
+		itnoc@10d00000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x10d00000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					tn_ddr_in7: endpoint {
+						remote-endpoint = <&tpdm_ddr_llcc0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tn_ddr_in8: endpoint {
+						remote-endpoint = <&tpdm_ddr_llcc2_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					tn_ddr_in11: endpoint {
+						remote-endpoint = <&tpdm_ddr_ch02_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ddr_out: endpoint {
+						remote-endpoint = <&tn_ag_in74>;
+					};
+				};
+			};
+		};
+
+		tpdm@10d06000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10d06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_ch02";
+
+			out-ports {
+				port {
+					tpdm_ddr_ch02_out: endpoint {
+						remote-endpoint = <&tn_ddr_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@10f82000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10f82000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_llcc0";
+
+			out-ports {
+				port {
+					tpdm_ddr_llcc0_out: endpoint {
+						remote-endpoint = <&tn_ddr_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@10f83000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x10f83000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr_llcc2";
+
+			out-ports {
+				port {
+					tpdm_ddr_llcc2_out: endpoint {
+						remote-endpoint = <&tn_ddr_in8>;
+					};
+				};
+			};
+		};
+
+		funnel@13810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13810000 0x0 0x1000>;
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
+					funnel_apss_in0: endpoint {
+						remote-endpoint = <&funnel_ete_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					funnel_apss_in3: endpoint {
+						remote-endpoint = <&tpda_apss_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_apss_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		tpdm@13860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x13860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_int_cmb0";
+
+			qcom,cmb-element-bits = <64>;
+
+			out-ports {
+				port {
+					tpdm_int_cmb0_out: endpoint {
+						remote-endpoint = <&tpda_apss_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@13862000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x13862000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_int_dsb";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_int_dsb_out: endpoint {
+						remote-endpoint = <&tpda_apss_in8>;
+					};
+				};
+			};
+		};
+
+		tpda@13864000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x13864000 0x0 0x1000>;
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
+					tpda_apss_in0: endpoint {
+						remote-endpoint = <&tpdm_llm_silver_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tpda_apss_in1: endpoint {
+						remote-endpoint = <&tpdm_llm_gold_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tpda_apss_in2: endpoint {
+						remote-endpoint = <&tpdm_llm_ext_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					tpda_apss_in6: endpoint {
+						remote-endpoint = <&tpdm_int_cmb0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tpda_apss_in8: endpoint {
+						remote-endpoint = <&tpdm_int_dsb_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tpda_apss_out: endpoint {
+						remote-endpoint = <&funnel_apss_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@138a0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_silver_out: endpoint {
+						remote-endpoint = <&tpda_apss_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@138b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
+
+			qcom,cmb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_gold_out: endpoint {
+						remote-endpoint = <&tpda_apss_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@138c0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x138c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_llm_ext";
+
+			qcom,dsb-element-bits = <32>;
+
+			out-ports {
+				port {
+					tpdm_llm_ext_out: endpoint {
+						remote-endpoint = <&tpda_apss_in2>;
+					};
+				};
+			};
+		};
+
 		sram@14680000 {
 			compatible = "qcom,eliza-imem", "mmio-sram";
 			reg = <0x0 0x14680000 0x0 0x2c000>;
@@ -5430,4 +7484,127 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	tpdm-ddr-lpicc {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_ddr_lpicc";
+
+		out-ports {
+			port {
+				tpdm_ddr_lpicc_out: endpoint {
+					remote-endpoint = <&funnel_aoss_in3>;
+				};
+			};
+		};
+	};
+
+	tpdm-lpass-lpi {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_lpass_lpi";
+
+		out-ports {
+			port {
+				tpdm_lpass_lpi_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-lpass-rscc {
+		compatible = "arm,coresight-dummy-source";
+		label = "tpdm_lpass_rscc";
+
+		out-ports {
+			port {
+				tpdm_lpass_rscc_out: endpoint {
+					remote-endpoint = <&funnel_lpass_lpi_1_in4>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem-rscc {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_rscc";
+
+		out-ports {
+			port {
+				tpdm_modem_rscc_out: endpoint {
+					remote-endpoint = <&tpda_modem_crm_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-modem1 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
+
+		out-ports {
+			port {
+				tpdm_modem_1_out: endpoint {
+					remote-endpoint = <&tpda_modem_in1>;
+				};
+			};
+		};
+	};
+
+	wpss_etm0: wpss-etm0 {
+		compatible = "arm,coresight-dummy-source";
+		label = "wpss_etm0";
+		arm,static-trace-id = <44>;
+
+		out-ports {
+			port {
+				wpss_etm0_out: endpoint {
+					remote-endpoint = <&funnel_wpss_in2>;
+				};
+			};
+		};
+	};
+
+	wpss-replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		in-ports {
+			port {
+				rep_wpss_in: endpoint {
+					remote-endpoint = <&funnel_wpss_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				rep_wpss_out0: endpoint {
+					remote-endpoint = <&tpda_dlct_in5>;
+					filter-source = <&tpdm_wpss_dsb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				rep_wpss_out1: endpoint {
+					remote-endpoint = <&tpda_dlct_in6>;
+					filter-source = <&tpdm_wpss_cmb>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				rep_wpss_out2: endpoint {
+					remote-endpoint = <&funnel_dlct_in4>;
+					filter-source = <&wpss_etm0>;
+				};
+			};
+		};
+	};
 };

-- 
2.34.1

