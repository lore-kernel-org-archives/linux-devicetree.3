Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DA74119F0
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376556; cv=none; b=ENhC0l8qPoWe3HzORmqQ0s7OfKtGgg9ojhlMF9xR818HKMq7MXHh0pawcw6JntVpJ34pPPEPlE3oudAJ5lG/FUufqVut+hIk/pldsInPR55RwdV2kNYX+AYt9ld2kC+wL17PpjZOg3iMahUG/PytqRnSBv6npQjOWF0DR/VOUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376556; c=relaxed/simple;
	bh=vDDm9UNNeBZngu98OmnO9mFNj134tAZMEgio5MqFpBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9RcBEsM+rY4EOEhPiegYRVwsvolPAHMW1UCtH5tyNDUDHdJLZ1ViFQ/Jca9Gm70AN5rqQnx/DyPUn1Df4UxgTrrpZoqNaULDw/gp9JenbkPm11TfkyCuUz4QIp5tmrqhOi/7BpqXvV88DTpJSziUcg+JkpaWkOUIiQ6S19sOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akwxgGYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUHJpBdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akwxgGYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUHJpBdU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWK582592229
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=; b=akwxgGYiNPm5S6/R
	anwWFKN6u5wXh1RpndWx0GoZzEvRB9Q4YUuBSeCNqbSLlmREGasCbyNPAFBdnVj3
	OID1TpwEwliR9wN+DOJu4bEHENYrriebnfAzzn15Cn4ZFvA/m3CXwmxk2C3VUL9l
	ZMZwml/RTa+xuu4areXhKv2T2x+NbY0XErjsMYHSnPeR3mdCPveC2YmO5YvbJ6Uc
	xgf/Je96SLn/+j1YOTMFjoUfqhTRBxuLOpvckdPrDQp/x//F6ynUO4PWLSRR2EI3
	N85cahiSExYKnkN7dRtVVMgcqzXFxy1Vwcfj3dZb+hcnmeKahHgzgbq9r8mYQID0
	3KxkoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3ta9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso27948161cf.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376552; x=1786981352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=;
        b=gUHJpBdU9wvGU4Yp3qwuzzvGY72Kf5mNRn7pWgGH8+4oGP99hEQtDaCnUUpyvUFPNu
         igPAt9gsSQOVOVrYhN1SMZMwZGTGElocBN4MxOo3i5F0fofzD4bUjHrbzrPwAWBa16bS
         HnwGW3auX8Y6pzMI43r75INM+DhYwmdF2FhTEz/h65oaS+YySp5xLu2pFBz6TkfaR93X
         aOZisndKwKgXf88KD+88KfxuoA+RpVP5f4Cc3bfrQM8jYt4J0YDo9rZKYuaEdggWpJKu
         1UgWSmYgN1zyczlAk8QfIHznmnLlpkRmvW5h8zcl8o5CfAM/RRd+zB3/gmw21n1/asHv
         dIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376552; x=1786981352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKWiI1N+R0cjOLHZF/QZRa5LZDuo/wMrVcjfTjWK7o8=;
        b=QKQ7ot17tkg9BWB4mb6GdYVazEsUB3PHQNNxHAfHiFUlQ16Y65Gg5/nTcCgbliu8TO
         XWDIlevDTPy7rQ84sPIuQaIbOv+Db5mCIvCiSnUIL216kUCKtv2Un6Or4qtHcBdN3RmI
         xeiiEExaLsn3M55FgaCYFfodjd8hu1B7eEvo/NpHDI7TGWzTXH5hIL8p/1uEWpW6rA0b
         UWsaDX8TZDxhX21xNdKSZQp0QpYuRGsXiuoQSdnmK02+y6IZ7muF6GALN7xZuBeB5GV3
         xVkyWGtNc8+MlIgUAorzwnS7MRpijSgosxnVY+4VMVMaXaRru57Ug+tBoAulWp5LeUet
         AOtA==
X-Forwarded-Encrypted: i=1; AHgh+RovxSBV+CUHGmxgBvRqIDFzdSMU8jfuKDbH50qC7ud2ZDU8h4DSuh4m0TTHwTRseBWLqjmafOPuAgr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0m7ttebpNAbUcGZ8iMCWyXi+Iq+BXDyLM3xFuU3pl6d/pRBDc
	Qq/vHdtUil7jm+SAcxUC3HG5EX53xFVbUI+LoGRtc3n5yL013mteli+FkGeurIAjqKzqh3ZNfqb
	PIhk5tT2h05PWMy6pm3pgGMRV7lTqOYINqAuxfTVv9+2tTcBrs5v+fuinFvlV+E0w
X-Gm-Gg: AR+sD12TXV3f3XQnw5bXwTmJcdIiSxISA+WqHfs7TVL7CpYwFIFHmfrDQwhxZ0n47lI
	lvpT5GRnEW+nc+5yD/PcdRhm6fHUDCo78Qjx4UdEKSKpN5y5ic6ZZ/SrSZhQ4Wvwrjdxuec7XNF
	ewiF+cuQ14UBoE3N1lxI7RsAAKb9qSljKsrMAIZylIp0l9a2h11wLHIzMTAV2NYohwH1XZ+8Kw7
	4M711f6UOvFeAS0aYZyOelKUdmNFHptW7DxguxYoCgSd3CUt3hnN9MB3Cq26RMZ2x6gEvD7oLLC
	rKyK6fDlAFkhUoLvq9KC87TT2iSOXtrCzyypiTheFN9rGVQ6MoGX4LYOf2EvLeKZ9/Zx/Wz0v/B
	hoj/m/aPtDhWPgUUgIp6m9ceYFWdM/Qf3cmPFRcSR/owpS82+uKwb4acZKEGqPc1aEnfw3EK1Y0
	3vc4BG1hebalVS7A==
X-Received: by 2002:ac8:5cc5:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-52d1919e59dmr265069871cf.37.1786376552395;
        Mon, 10 Aug 2026 08:42:32 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-52d1919e59dmr265069211cf.37.1786376551886;
        Mon, 10 Aug 2026 08:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:14 +0300
Subject: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the HSIC
 host
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vDDm9UNNeBZngu98OmnO9mFNj134tAZMEgio5MqFpBQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blx0DxUsOgB3I8DaoFadt+iH/JjhX68Vl7069yvqQUu
 5qu1bqdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI2f3s/7OLY/ZetjCx/rFQ
 50HID9O4R5eSlr52Wb7Mjzs9J23y/jCD6xp2O7h3FXfMFb7+PbHfkmXKvmaFGzEN2T0tug8CZuT
 UWchwZxd8TLvSse6Tc6FYxtRZXklLFIOU/Nm4+W2SfjmGp7TGcPp5xByzcc2yKZ9w+vxO7XNuoT
 qry9YX3VkvvviGQ4PV8QPL+VgsTXlmvuhJOV5fHHB+t1t1kC2PQPMRoZffui/Wi0ULG5/7eeHN8
 gZ9juWri/RkO7+HZqWZuhSLLDys3zttx+tPZSZdvGkzhYKCBSJS1xYdXLZ9psj5BMFrpUJ5c9Km
 Mynsm/s/ZteSbGPVVx4avTuav0+5PvntR/EXJ4vqhFIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5OzrHN1nhLcwf69AE8MGkTsFleXT8F2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX8B3IWTduz/j0
 lWGSUC2Gpa1B6uDA5aQk7mwT/MH9+euLEeJ74QtAyX8WKz5jBFEbTlarpRduv/yiuxmeiXgkCzK
 4QUPUG5cZI1j6l9ZyM9hc/ppUCXlQicCU5WEKibZYnPzyA+S1jBO3R0F4Io7Qb6fAPkyXLwXajz
 PzB/Vp+gSsuMACj6No4NbBKEM31QHoBs1/OyFZYHoBl+LArEgR/ycuFbGjC39/R2/cGnwPcxVV0
 vEvymt/oWMNpjARY6ScD5EGss25nbDy5OgwK536Z9raPPSvatsASboQ6WB4yVWcBbiu3A9O/axl
 7ZDOnX4F5iPWPOaRinOnUpF9q/o/1T+MqtwUYxX3kRuDLEcXzL582z/Hp02l3Y30ERx74a4Q2Sm
 d733g2QMXZswcTftTfDxGJhA4q6100snABKxwg1Y1PrxweKUXmDurWazWrBqcr5Zi4g/X4bKn34
 7i4xtm8U3UJXep2z12w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX4c21E0GxgxWB
 fVgOnELluezdmDq3Uvq9pvzN+evoiSkVjfgk1pgIHfMwOkWH/uWnuKLMe8uQ3V6x7OCb4/HAc7A
 TyuC/Mn0X7c+HEHO9yQ0jCrB0bJwhZM=
X-Proofpoint-GUID: 5OzrHN1nhLcwf69AE8MGkTsFleXT8F2G
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79f169 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VFyZVMh9rlY2QtTs7IkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
controller undescribed the whole HSIC-attached part of the board is
dead.

Enable the HSIC controller. The USB4604 hub isn't controllable through
the I2C because of the board design issues, so reference it as a simple
USB device, describing the reset line.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 083fd8fa0aea..02183b37ddbe 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -158,6 +158,14 @@ &mdss {
 };
 
 &pm8941_gpios {
+	hsic_hub_rst_default: hsic-hub-rst-state {
+		pins = "gpio8";
+		function = "normal";
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+		power-source = <PM8941_GPIO_VPH>;
+	};
+
 	msm_keys_default: pm8941-gpio-keys-state {
 		pins = "gpio5", "gpio23";
 		function = "normal";
@@ -487,6 +495,25 @@ &usb_hs2_phy {
 	qcom,init-seq = /bits/ 8 <0x1 0x63>;
 };
 
+&usb_hsic {
+	pinctrl-0 = <&hsic_hub_rst_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* SMSC USB4604 hub, standalone mode (SMBus config not usable) */
+	hub@1 {
+		compatible = "usb424,4604";
+		reg = <1>;
+		clocks = <&rpmcc RPM_SMD_CXO_D1>;
+		reset-gpios = <&pm8941_gpios 8 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pm8941_s3>;
+	};
+};
+
 &usb3 {
 	dr_mode = "host";
 

-- 
2.47.3

