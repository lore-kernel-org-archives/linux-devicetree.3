Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B1386422
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754015; cv=none; b=XIQ4LKE8a6Jmk+2hKAAdKGR24Wbaj18gyysxcmtM5uza2vXkp2Ch7VyA7Jrzfhg7q7KnDFXeJhfTfYX5xr2biuQ/Wrug5lnl3cFm6YEoGhYJd+wcBW9vgx6YxNIOyJjiKWTLP9n0cXhpco+Av7rrA81PDyRLwLNvEHAZanUqi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754015; c=relaxed/simple;
	bh=XCvaMn/BiBzti0wPpaL73Jx30FbdaxydfZr55+KLm90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGhpmcIQvVk//u6ob9uJAYZ+ExY+ml50/N+e5K81YpRRSgY0BcwwU2mjZ49FlQWlN8VX4OUxCDEarvFPXpPs6P8Pa4SvPdgc7MdgholkNYlKCJ1qIDG9LM4XIPUzml9xThj9hyCSyxtF7vsmJGEtBtTJ1dNihfPY9f50TjiV/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWCBUlW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps6F/7Yl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWCBUlW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps6F/7Yl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AVxJp3882692
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=; b=HWCBUlW0Cov2Zv1j
	ZXRbLlKOTArDrX/qpmTZXAlBxJyK5kaSJA7UZjJIn08jeTsWGVpeQsI2JDg2OsFo
	RaJGH6dH4h3Y5o3zd0LWYsd4EFuakldzDxIMcR/+3pP+7EWFpAkuKoSDH+8Lhh4i
	A6L4iZWis4QMr0lzUWGaDlQrnNRnb+K9Qy9ETG4XGNuKZ4fH7m+b6QNh7ZsftaHf
	i3Aakahw+m5JHoJP/ZNfUaeZ/DDGi/tr9jg3jcehNiAHVtlgTc6gbjuxqy0E7FsU
	mC5wu8z+yzyjyeh6uPhO9l11zLyRgaD1YgInQNILG+7M3/KMY8qATSDOCusaDWij
	7yhlYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkh4ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:46:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso1585707a91.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754012; x=1786358812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=;
        b=Ps6F/7Ylyd/OlFOnDU13cCOEXu5qKc3SvcHu1T1hAcESnTDe4FaqSLxx7eOmML6j/q
         ktzJYZmj7UuU4BYMl4N62lcWp0pjkXiYL9YdvrcHbOlNDvEy6PMUzPgHN3/3siB3bik2
         vCnfLkRF4f3AdEbD+Kpzqx7fsNu7bEddo+2KUhBZh/nbkwcexLx9F9KejkePyhE1DQc0
         KCahFjiro4QW2aLie6eV1mhwK/1bvuGMRz05et3M98y7bWhCLXDV6b/Mm+cjwhuYIMyE
         sciAPZy0SCmQl4NgK8JwZtZp5HJk0tapGa1S1jO15bJGTsNR25Iv0dDWI8BFbvf//x6V
         jBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754012; x=1786358812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMassRYYwmWKjJ9TG9ty96NoXco+IZPC6jouhE5M+mc=;
        b=hofJypuid5HYDz2zyGiVC7xV3VwUt0+a4XGLPIrUOIlTxd9rbvpw0iEeWMe7EaSW8r
         eQaeGx47nPoEU2efKEH3p3riNcoDK/kRTmZSQZEysmh/PCuVRa1YAubp+rmllMjbHenM
         t9Gk6CpbjcNEethZ8M09CL7hmxP1ulFKdzbkVsPnQQNl5B2JJE6x4ltZ1ZYpFsKnJZ2F
         ZuCP0KRm7fkH1lSAZ9sYp6XHLtEyYsHN1uT4El0oQbb0tq0/H+yFJB88JHYnDt70uDHT
         cEsjaF/xEQmm2SJfls1RUn1HQlAeZrtIJQ85WhBHaRyl9S1M+uyjCT0UWvTsi1JoV1B0
         dUEg==
X-Forwarded-Encrypted: i=1; AHgh+RowormgEe0eDX4NNLwKr4QI7bLXhZqnBVLKyXFvf3t5m1gwhJxtuY6XlbVAGirW3bg9FNXpTzdBbWsa@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjsbIPpXfyAqoTnQpARtzc9iKKJQdZYzeBRe1I8Gc36gBTv9n
	41buuEHx+pIJ1SZTwgUgdpnSHySWtTyyGxVVm6yycesghqnPKgTl/5i4aNi29G1Az09ovSThFuA
	Re1Mbqw21y78XaN3Dao0HE35tH5LGqCBfOwp/6Pia9oYGQ3o0KbHP5oQJqVaA8fMn
X-Gm-Gg: AR+sD12SgNvN5VjLhfMkfAP4uwTV/Vy8ux+OETXD4gPIZ9ltRdljhBvV1KDeVTES0G9
	LXvZKxh1093tOQkHe1OxjgKLXZ5gPhq9u/8+X79PaP+GwsDNLuSg7cCpSwcyjB1CO8cNgBqZVBO
	b8vy0ShJCzhLgH831waki9rTiK5+MHHNlBQyfM2K2KfsHzJmUXqffjCj5eAoYnZcAeusjqhIk1B
	ni8ltUeYPliLz8pahv88HAdjUQSk7oe7L+OKw8H5v+4F0jfWDoBw76HzgbggZJTGjyGBnb4tgZQ
	7p3+z8mlorfyLgEEF4NU3/oNTUfWTrVLHhIM2dIU2AbpvV0S9fg0ERue289olW2IhhdT7fHyyEB
	OEVyDl35j6bkEb9zKsa7nDtpstawJLlv4KeC+ZxheXhwaLjid/I4rkuR/HDdJuQtOiabP1kwbm4
	iikWzQRUz1vJpXcEBqjbmqZAwMndbibQ==
X-Received: by 2002:a17:90b:2e8b:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-38fbc42584dmr8325744a91.10.1785754011860;
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8b:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-38fbc42584dmr8325730a91.10.1785754011453;
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:11 +0530
Subject: [PATCH v14 5/9] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-5-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nxUKeAQ7RkRWQ3dltVz2iUfBkTypQbYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX4hQX/7ygy+rU
 MPv+6wWz9uGoXlfH2xQz8RbJGabWpYF7OeELbVWsnJ95B2i05oYp5mnjyLFtW4L7YxtZD2w1Z80
 NSUUs97+lUXU3H36EE+lIQqjDDf8DX0rVLrFyNyXDnRHWZLZWiTlfOC/JBqhpHpJQ6hjUU4JYbH
 YuCJkONdO8ZwayW3/zSnpTctlq5LevfhLIBtF4JHjvIIeSM8eJ7ZhiLyQH1IRS4lRe/comjMyvE
 kcdw6I/zqtafDYQdw1n0M4Beq7cUExkv3U3klvPI7i/hvc6K6lxwjO7f+sTamB+5NmsvaXGJuYq
 wxQKw0GP6vXZr42aTsVU/3POuG10QRaZwaMuUsJ14hIzUokIqldHCO/MraT6CfAdMkOY0AJ0FSD
 SkNC4cYHXnOvTqjG0VdyB4XNQfQw8/wQO4RFHxpyRnY7AcRLek00mApuKCaIqBQHmiHee5GOgGC
 XcHNlQPZYyw/4ZNIB1Q==
X-Proofpoint-ORIG-GUID: nxUKeAQ7RkRWQ3dltVz2iUfBkTypQbYj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX6r8jVWXvxNTb
 ZVEGr1Hxleu/HO8y0qu9MkH2nxWBgkr+4qiOTeOUxWit6mwPlki23+W2qW/iiVh38rVCMdGau1v
 b0copJUc31G7qg2xjz4Aj7xSDPIRYXg=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70719c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..ff4187fb7fba 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -159,6 +159,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -656,6 +685,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,

-- 
2.34.1

