Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACF4963A4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809565; cv=none; b=qzJoYvw9B6LIyZHH9cArjAjn2MU6ZGq1Qz5Cl3icHCmXrFK9vW3TVUUqYrUXeq5J0ggKt8Fjk/fCwqqvLbX7/huCzK+FwbsrfL4PQFSPwbhoVW+0+IXXbbwgTe4Y2eU10+IXelfXXavuqkjTzsoEth8H0mfPoUjyzoklXOKSpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809565; c=relaxed/simple;
	bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CetJ4TP56mptWRRMZZwAJoyFc82xZBx1Jo6lxdjaiu/JjCQG24jHBLMg9MVHYaRymrH3yfGK1/Oj7/cK+4WIV6lp3dn0hJrFjJz5f0Say+nt7pXbUvCCUnD6M7XOOthMnZjAboGncdQWqLqzU/LnoXTGKnPKzGpJOn2KlMY/foc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqNqiJjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTQrN7eU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNqiJjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTQrN7eU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qW6Y3390464
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=; b=mqNqiJjZonsfiGmO
	N2xVpAR8osDUem6FdHBM4/GiYUuPmbxTdq6Fy18211lJej7paqf5tsmrSI0Yi3Ot
	g51sMxUUIwdJ8aEbmdRUms0RAB/dhHfZNX4OI5VfXFE8GjAwcqrmfS1DwhV7dsKJ
	RmAoSD2+ivMdQjQj6qRIW/ldJVYVbhOxsbhIAoOAJ+cRVvh+0bpRCd4q7c9yrL4P
	xOaAHAk41YZXfSt/ExMSvzxfX3FT+1Y/0kOPHg8ebFiMA9O+s7G9FP2Ffart18+w
	n4F+GVsOvqcuU9HTsZ3Ch6M546Q+E617GWKUsg+bPBrd7R9gQkLQDAWWvBCn7Hct
	EeMi0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ksa9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so11673661cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809562; x=1785414362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=hTQrN7eUlbd2G9ktFVEfFOUWO2zf/A13QJN4dO4sEJqmfEjgytwO0HpYimb5MSEVVe
         j69qWkdiyRT4ggz5KaZnl2JqG4iZpL2m3jpClTZKT35SbDVpN5uZaLSciOq+6kQutjqG
         U2bNZ+HAt8nhwzePlT9Ss30QKfclIT6N0Rx4nXPahr7G1bZ/pjHRy87W/tTnyY5f2/K5
         0NfSgIuK7tz47t+DPop4aCDZ9xNM/kFOWHQPiVt1lzir+pW0/CtWuQT9A+vRjs/kJF52
         RQBvJc2kY3x5Vlwo7UnZzxwwJm83T3FYW7ToSBg1B6ggvps/E8KB8gY6rBQ4dhP8tqbo
         mwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809562; x=1785414362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TA8e9C1CpVZggYts/oGX6GakTmtk0RCSwjXNhQPFiak=;
        b=X0daetk9pT8BoxiMGh9P6/Y2K0LYGUJj6rtCGP3lFQk0UdMopI2CSFRnaPV3fYw1F+
         x4GL+Y73yYtrSb3/3EBSTybD3mm43MxSymaRUaYjUtj+TdYaAEAnxQ9ixSD20kxLu2ja
         NMaOdCPDy0j2shmgpVZOs4LHcC5jf8fi61rXtf2o4THSHXksewibpjBoi+rUGMc6pEeS
         3ZMpBfBNv4ASDXhWEMHVchzlvE3qgnZ9yk+PBUAw2s1YcHdqSrzCbp/f6gNSlkPaQhWm
         EYo2eqzcvKPtDmn/CrWfVFZWAxByGkEl2//GacEbWELf5wvHFDb+qggnAkk65ZZwqRLy
         g1pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0GXpThuiJJlncGRmsNjqwQULWbtOJD1yMuchY3wjbSUoyToUfx0m8iVUqNRoDfKBENead2dFTkyiy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4rIrgecEyC5NbM+YdPR2oW2EVR6djjeU0sqIWs84SE1cuy53
	atfM4JNokubV/Id6tJ0PmUQ4pXPh5OlYgKLCV+04NFChuc7YnnxUwz7pr1k3RAHfkeoNwMSMz74
	IqYP7wlOjJqYtN4jYwoYhUxvsQpmKHqrimH7zRiG68mHlv9HGlAu7B6jZrK/O4YMm
X-Gm-Gg: AR+sD12V5y4ty+taILoCQ+8SBB7CMB0fKI0gGrWCQe4A528fdA1ZHoagvTjVZLRfic0
	dtZKOy2hhd/q0hAjz6ttCfoz0ojn/3d2QK7f757tNhrCKuZUCdtF4NtSTY/LkollTWD8u+EXSxi
	68UGSFRc+surKkuIgqFKpWWx2S8gMR+S2Pho8rmITR80GFuZbq2Cq6b/IMsu14LJA2AWLgcyUQ7
	Bgv9wsuYd2FG/ASpUa6Euy4637C1OKgpmclTHanfu+BVhgO2dYQKYeFhmL8sFMeIB+oXvAdIMaM
	iVma0i8Mexxsmu3mGOrqDUImzY/GCUq/6qu9vwnQeZhtRvYJoM66/FTAj+9VN9KBolS3HQAIldJ
	bqoi3ZAK/
X-Received: by 2002:a05:622a:1b22:b0:527:809c:f9cf with SMTP id d75a77b69052e-5283de0a9b7mr23363011cf.21.1784809562407;
        Thu, 23 Jul 2026 05:26:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1b22:b0:527:809c:f9cf with SMTP id d75a77b69052e-5283de0a9b7mr23362661cf.21.1784809561715;
        Thu, 23 Jul 2026 05:26:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:26:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:25:50 +0300
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-1-93e17e687384@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RuKd6I+SEIvl++KtfhProHr7kAtMUq89Gwuo4zio25s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghSCib5sF1WeQwY6Y/Hg+yOgU9XgulybYd4w
 MD/xlHv8BmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIUgAKCRAbX0TJAJUV
 VmB9D/4h+Zn7a+zxPgpjhqawZXegajf4cSdZ82p+8HXJNBBubh1GB62C6xD6C3G3oMWzdMx+Bm1
 KDk+ZrfcWaxwZVQGgig4m5bUMFoR0qmeIkyZH5dQkVOOfP18isNaCXRXNAqlMrwsS4wUEVvcCa1
 edL8LJER7Kqb06J30BHedrP6LLGA+/97k9HRs6Pms+pf/G4URgTAasZuEs0jJPHGddWhCnPWuaj
 e82YcjmEq5x7ubWoii8RjRelwukEOULDe2hcYyEwa3qx7rBRLoJ3BqruWzv4+WdmO0g5SRTICZ5
 p9WVKxL8HiH3UtCpo68sEbdKEOfP2zHHW+cPWDnWyY7tLVd4gsWCg7Xh7k/rQUz/g2Z5dufMw8Y
 VSkYttdOCfv6WZTcH8QvAd8Q697kf2WzOJa3hIegNPdoFgT3kDrrvHq/HINg3V6ufFn+kU9cF1o
 v6Jo6codVCwRgDvEttWi6CEPMfboOhZygkFLUVIMAukTzoP/PBR4EM2wLfUhxXgkoKXXV6i5V7M
 /OpMjdfv76T7mgpn6aUHq6YJ9y7ZPQBn85JjpIdabtHGXG3qnxR+J4YthSA65tCzF3o27pW3ap/
 5+Ef9Gn0+XhlMJDgWFwwmXDRT3nE/WpgQDpvC8pcQQ0mtTEA7B5rSp3DfUPCNt8E1QBgKp4I7Kn
 qRSG/0OlFtyMnpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: _Z3RKgSRRGPddzb7f6qjJ0mofbWRq-g4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfXzDNEqAw5hzbQ
 90et4eaKuXCXdlu5nCQneRncwcirWZiS+MCUpvcbId9zFMBw4n323ws8tlJHJvt/WISw1L/OngR
 nljYJ/dM7q1zT31M/MsF9VHALgqpBnM=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a62085b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _Z3RKgSRRGPddzb7f6qjJ0mofbWRq-g4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfXxiV1bUUsDbE8
 2Xc/cUqu4WRycCDF9ehimMnnzo2PQDbvC4FFG78lkSduIf/lHlkRB6lhlN12JkcOz2IKaUkNJcQ
 8tmSb1JnPpI44YrW0IsB0pZ+3B08xUtaVlK14F6Aap/ifem2ZgBm6ZqnOHsetiBhxIUUQyghPUd
 eBPs3NHwBXXMF0qP6sU6jLMwQu1xJx6qHnCk3Udheag/Pdg429WJzBYQA3VPYsaF+C8utCOBjuS
 PlfXcwSa3wMASXVfnWGbBebyP0qGZxRsEXijdJ9jxKc4XHrH8SOvrudPek9lfdadu/Fy9bZhVvj
 6F7UsMbsaqaJXXH7OANqLlfN/eJ31rXrNB2xvUsXp99Fds+HRbNP3XTtIyY9UhFO7x0I6eLuT4x
 tTAdEvRQUeoobKEMmZSY1OYaPLPYUOsXE8pxl/o84rIMECXDWi3OjsLfyLrFTPuAkHuZRWX1GBr
 0aJ5zTUhM7Y7VHpHk3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230122

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..e38a1d94fbe2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

