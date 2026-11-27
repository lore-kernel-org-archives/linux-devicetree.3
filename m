Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757000;
	b=CRCy8RXazXKBViEoH9O+jeEDbQn7o03QxYwcQMNBxnWkwONzYFJHIzWXqZsQC94c2d/5
	 8kA3Z92xjWsF8wk0RRkThTRn7JRE/dFlSI0NPL+QlcjQXFUdfLC6KZuukMcVrOkX/DqG5
	 K4UVwmg8+824hmhIQWZJaYThCK1huZaX4JCYUx3xDqHbBepeyl7ryH39ZdOxmNjC+0SeY
	 Y5vXcfz/a10j7b4oOL4yWj7uJAHlq6XjIm3YODIXFn8CuX6VsyyT2skzn1C28AxoGSfJp
	 wk53cTvEhkNEFfUi91AfwRdNRlOCQiZk0IiBURf+QCdTljWqDzJEpuEhthnylbJ3+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
	b=p9zyK+Oy1NHGracO8ANNVI3uiH5yyBdRI+lG0bsoN7f0R/t8P+SM0Jfzrw4lssif+QXs
	 5CjS0dsOz9XSE/yZqLZQTCB6c7PHBjM0CkB4kjCQjo8VIQhbizt7QFMOSdGLDHYymOO/+
	 o3AnHaZT2P+EIv1bSU1IK5I1lPksBgDGuI7Z1g1SJnXo0+xrKbXCEzMdXROdXNtMNUrzB
	 rCCMtHbMzWU1dxu+LVy1MMm4E6puZ1vr+UNAuTKEsKttr2iZyPrugxA9RMNf4QsgK5uLE
	 x35bIi9uLzKXayvTILGr2blzGQQsEdp7yxdQxV3FYeVQoPfHyNSrPKU4rD4MUPRKP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L+Zye8du;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFT6a0GP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0D606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L+Zye8du;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFT6a0GP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQMUQYi669879
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=; b=L+Zye8duvw8bv27E
	L9A+akWGT1ReSH2hGHPchwxauf4+zu+YVtofPy7G9368+neqxYvBSofzvXoCK3Hm
	RuY2vZ9PTYwPmV0W0XolUIg3mM5j8AJ3MTY+W216zefK2j1EZwdyu3P8lLfoLZ4C
	UmTnJTugUAErxRL42LgdZ/Pu/2d9XmLvJ/Oay1YNT0JIZvO2GeGdi9Ab5v7yxFw6
	fnaxnJ47b3GOJbMRWkwUlkUG0mTKBOSGUjjqRJsHJkBOA3MDxajIUS6FYvv4nS+P
	yEy7ufZ9yTHD8fnrly7IHOcfETI0QuoUL7PUMZOpB/ckwbRp6bk72oMW2t+XIV3M
	mA53ZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rm288-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:23:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08727641aso1583697a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756998; x=1796361798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
        b=gFT6a0GPg1/Cp2pioDStv24+4oNLp6KD62Iy9EOp49c1qSSal7cnadyUyD2Oet8E/V
         BQdHxsOmiqmqd6T8wpxsVtRqu4z6XRr3lFY9WcxJhDH7t65UGNJUQk2iTlg2UWu7VgWf
         UANLxnx0hhbrmv1l8rWxMoT8XSyQoO9s6Tl6FtPLQvRL2DQ0ufdyHpX6w9iTzmZYlTxQ
         V4QJkSZf6DBbYbSYDrNefbUmq6yIRe9U3TfgIihSGsrekLNu1PcpnNtj6ShDtRzVD/ya
         IfZpp+Fq7HY+5nLINPo2cDzuzI1COJlncEknKpetHSOL1/slV25YuS5qYt2a2ZCKpZfw
         YzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756998; x=1796361798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa5C98FmLG2wS02Qeyxqx60CWS6uvWaFbALzAgMC0B8=;
        b=LPqWc/1pBR3idrZXSasrYnaaS3rB6cnPNffIpB+3TeW5/uwo33qWTl6Tqfd9AQssNr
         X/FfSqI1bej3Q1e0ReqikOTTzDQedTut2dnDeefj07ckVUk+etgo04WWFlv+igYPQnAL
         DBp38IkPC1nQSCs7GOMrmzmfK+5VeodvI2R3QD2mf5vtzhItRU/rXP/fguXDxnUe66GK
         /jdC4dXlzUWffY3lzV5a5HkKdk2ic5AFJvgYFj4ee5lIArx/RZvDpTmAcvbNjralC5uW
         ljVxUJPexkVYlbf2KcOMZEogbFnB2IQQdllEts6VKIcQyjEtmcCp7RrsjCNEmwRghPah
         ymVA==
X-Forwarded-Encrypted: i=1; AL+hErEcSXvFlMCwl3/o+FVMayfxsy/ChO6b4E1g1/wrYyZcswoWHmf1ZIlb9H0d/CjiGftMkAyetq2M3YSh@vger.kernel.org
X-Gm-Message-State: APuU4Z8nUiQW/enlVyYWXl4KkFGpCTA59CW8X2NR8JArV8NfDJb8ih6X
	YK/AvB5lwRlEY1dw7IYNmH3VgOCjdheCoLCGeWPr3C2SdNOFABNu8wytNuUZFh28cya+y9zqbSx
	jqP1HngkkpWZ1IEfJmt/jSj6ke4wJAfcpho3s+7a/69YkpLXE2gEtVwH9Rhn4NuK2
X-Gm-Gg: AZFdTZdY2NqsDF5w7utL9vVdV6mNN5CoBGFMeI1WozGnDohAbtnX9Uvgg0/oJOx9PJa
	dUo82V9cR5Wo5OhbhnPCI98rIuexEkzfjBoM/IIPcNYOcp+gwtf4W6/6LOtRAIHVjAAnimrzDM8
	aV0yP9HiSoIdkKCh7GugL6W4f5fmFGy7Wrfr3Vgcd82mS2HCct77lCKQh7j/gSL8J4qkSmsz7ik
	JN7HxYQ2CTXMwo2q2fxtG7igWvdemvmX8175hfwAJd9U6zFoasAXzh/I3YXLdaqIkMz0gCFX1YP
	X3SeP4DiwTUH7nNZidmzHW6z2VIPxbi9z3dIojBE1kV3ECPnzY9s7JaZKXURYAxhrYTbXl8Y1c8
	g/i+bKvRKiG6IQQKgYSO3WS1tinOqOxfECVgrHbDQcxDdoaJcMKeDfWmcFVkpdHDb6JKHVE2PHE
	vXwIwDvm/yV3QIfSVrKwcIvYvW1IBH2nD5iZNc5K8dzFIwO5c7D56Gntu09M9DsYRUCftURMbPP
	rWZ7Juq3pQvi2yCZuvccYpM4Qvr
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr37266022a91.1.1795756998276;
        Thu, 26 Nov 2026 21:23:18 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr37265997a91.1.1795756997875;
        Thu, 26 Nov 2026 21:23:17 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:17 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:53:00 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: eliza-evk: Enable DisplayPort
 over USB Type-C
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
Message-Id: <20261127-eliza_evk_display-v2-1-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=2104;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=vsQAYbucchggiOG1eC6Cdcxm7QBFzJ+TIVy837iYiyM=;
 b=kRJFi4BFGR1//S7aPDcejgG++y1TSuhLsWYml0HIa2fh7LObxdmhGwG3PeCLrNR5L2PFovMJ1
 IyHXJNPZXahD4WYHxrBvJe90moUYqWZ+gVy/412hEbbY1rfszsTXIux
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX/l6l5o3lOY7P
 u53cFTH/pwQCGIWU/c8tnfrPsmYQpaPvXxYzRFBU5IgZfOGn8HGCzS5Uap6vBjbY0jEhFAgy22H
 AkmZCjWnvwjBhcrl83JmBx96vpa5zExXslYFhLIX08JQFohTkuiEfhSNPJqGj9y5okNwWvohOeQ
 XDQUfSUA78vBqna77wXMnlBsuX/QPJTjLpOOJd1i/ozndYixTJdQabzxrKbf4p/kiBi8xX3r96e
 RAdPIpSfIBais9QfXwrFAdtEgJkGZqqQui5jPpJjX5UvjTmAC2RH+gt1g1C8Dr9iwdT8HEv/v5d
 O3mU4k9O2sp8+aKsXGCPplgWui/mofhrsF/ri6rcvD0qm00+tLOvJxmQQODHZXuYwjdDCq5icod
 zPp/N88zpOqfLUHV2BM2tvL9q7oNW8k8r25/RYVEhC85qJaJOlrDKLeDu8NqBmJxw7PZ7GMP0Ql
 9P6x96bV/3lyTC/Kj9w==
X-Proofpoint-GUID: _u3yOookks2oqzGceeBNHvc7n7IUBnL0
X-Proofpoint-ORIG-GUID: _u3yOookks2oqzGceeBNHvc7n7IUBnL0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX/IPkmksXDoqM
 ECX3fW2ArzfvjM5wNKcD9KCzbIjetmGNx89DeXFGTHW5pwcFH60jIxECJuXBhyTzeiM3s0ANi7M
 qhZWerOt9DxwLMWuofiCEmyhGr67YLg=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0913c6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9mMaBN0c_Hc-0ybOVWYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270021

The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.

An onsemi FSUSB43L10X on the EVK board routes the DP AUX pair to the
connector. Model it as a gpio-sbu-mux, with enable on TLMM 177, select
on TLMM 178, and L17B as its supply.

Wire the pmic_glink SBU port to the mux and mark it as both a mode and
orientation switch, so AUX follows the cable orientation.

Tested with a DP sink on the Type-C port in both cable orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d..8c663ef6718d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+
+	sbu_mux: sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		vcc-supply = <&vreg_l17b>;
+
+		pinctrl-0 = <&sbu_mux_en_state>, <&sbu_mux_sel_state>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
 	};
@@ -491,4 +520,24 @@ m2_w_disable1: m2-w-disable1-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sbu_mux_en_state: sbu-mux-en-state {
+		pins = "gpio177";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sbu_mux_sel_state: sbu-mux-sel-state {
+		pins = "gpio178";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
 };

-- 
2.34.1

