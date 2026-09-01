Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A447B40D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258529; cv=none; b=AnSinXWJmBdd9nJtX6bQWmG7cYb/98cklu0YzDDV0/dRZxn/eMI2gMkAuRkDfNw6I55CzKKlWxYuvL6eImsskuKJX/3uc7sAYfIrIHlOqQlOfK783I3wCYtW5yTjuxpFKMB2PNnEHouIMxAW/EY0zHys2uZ75Bs0bYhOk1UybI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258529; c=relaxed/simple;
	bh=g5ymiIKyPU9IJATjA+hHPEaVikeTbARumU/p5+o1FRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/n6Bq4JaSaf58epMVsT6Q2CpUER3bCUCT2r3eAyeSlj5B9nQLSjiqAeELQk70atEGUV5F5sEvPGxxJ7dtsCkVWq7RB9SMT5TZLnckLTcqlK0b10QZu1L5JnuXtkjxwEjIbVZ+riSDgeokN/2oiYiI6iyXVYH6I2dI8dMK4t2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsLhYlkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS3jkvEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsLhYlkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS3jkvEs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJUdE1641773
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=; b=dsLhYlkpBBYz0UaE
	oprbaLjcxl3H7HiFnghS2GMUJDmU7DZwHxFm7ona4IABPhJOem1CwASlpCdwsG11
	m5UNbe8M/0qHO5wQj81aP5S2k6wzonwCchBawaPi8URtvLN6DOO3YfNxgT4jW4Ma
	pOgt9RGRu089LP90dF1xoiqKVQlm2PI+GsrEsHBAycC2NY0usfEsWVbOwrP+RwIW
	rVgLF3bvX1fD6HJ+6E1cW7oR/VWXsJuqMsBVPRIiha55XjmVIRBWK5j1npFC4Lh1
	Ic5yvZlGCYYr6a5vvP1fHBT5c9hVfOJsavWvpwVMBumHOZ2lmLOY88XA5SPCInk2
	k3HZ1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t1x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:28:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93917f4ccb4so108882085a.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258526; x=1788863326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=;
        b=LS3jkvEsBTIyABPblV8FBpTao4pLvkbJ0R684sTG7n6d0BpvS+fz5cc0KkXpef6SHA
         haA691f1RJd1EYpsIYaZcYWhqy2l0ztrmrA2bEqzOClHRHyIABbteGnhpqVqvix0+Fad
         QKImpCaXx/LloVqpZEynCVH2Cpy8CGu1n0DKtj+8Egiv8TYgQwJUOkIc5WJmxHXKpyZe
         gdgUqGy7PT1WSnMHkz5bdCkS4qKxZJbBP/5di8j5rWRQ0hJz+6toJOcBmG/67NEtbSms
         8mz7PaWYiy0E9gjFHEmhHNSMKD7mgG87lLew4pnb3PIUxLkCrOaB3WSqdVLjN8OgETCQ
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258526; x=1788863326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAgkwUE3huAuFwYNoOJh9l147NjqwmOqulSugy1jxP0=;
        b=c1PiKnvJBL9aP/qpT5ebH+O2fuTyP1UfXTilXRgfdMdU769LrU5L/RRvqOIb3d2qyH
         2PDaw+CGn5lmDMJO2PVy+JE+LSbI6HA+XaF8SbqGSmKLJus0QwyAeANJmhz66oLmgd+r
         rYCHZjeqO777AC0Jue32HqZVpt0FNeT6uapATQxeAfEbe69yfWJw70jDHBM/gHQbRACI
         qXIepVbNeBGr5OfhD8vM+rX7v7r/jIJQhcVnbpyLpSaJHz8gaXHnJKM/p7a+Wr6ruS41
         mtAI+DkNw2ozJUFOO4iocRnxx1khn5X7GV7hYWSCPfJxD+e9zhMkV2jRj3vO9D4PJ87Y
         Yfrw==
X-Forwarded-Encrypted: i=1; AHgh+RqBFRTALLweYVfIkyiFQwH9iYsEPIulaS75R9V8Yul5LdPQmKjhxechux0DRUsRcOZTE1dRMLb5TDYs@vger.kernel.org
X-Gm-Message-State: AFuF++kQAjpRWa0NjAaEjVFq5sB2zGJeXXzFLlt/8turU/Hq1tdqOlLS
	U9azLjO19c1Co6W/RV46s7GyGHIaN2S2pKffIclzguIrkbDJNpR5fxZZ1dYN/qJE8ZdcH4pGiBW
	ZYBIOcoT1skScGRR3YfdvfiJ2r/TM6cHP49x+h2AJS8DVSOn8dLa5flk29OnLSl7d
X-Gm-Gg: AR+sD12T5Z5keEUgdDo+hhBcUnz7T3E/CNyhAX8hz+hLHHszmW/3Le80s28kJtslVZ+
	1Kz/aHKsC/eOGwpdK43oiuoqIAN0nzgFUyEuPLtBVIWzA+pE1LoHLXPTht5gXE5iWBEXsWoQkeQ
	vtVKMvnfawIn0zFm7D3ce+4Y5weWRlXjiz2cRo7PWKeqLfTlO3ZIuhcbadz4STQy/9NAOgQ+pYi
	FMF/Y2HmmjNdCqJKNtB0u9HSDKp+6PeWkHKdnIUSTPwv819y5j1vfyvK0Pd3XHgTIpO7MpStuzj
	f5hAfzy5MVaY1Ku/eCu0MPw5N5NAevKTrFTaYvgCm5bEGVhlzAajEfp6Fwa/aWdyGctFcSXcQC6
	k2KlGj8pK12WaYg==
X-Received: by 2002:a05:620a:5230:b0:939:c45:80ea with SMTP id af79cd13be357-939139456eemr3111272185a.29.1788258525641;
        Tue, 01 Sep 2026 03:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:5230:b0:939:c45:80ea with SMTP id af79cd13be357-939139456eemr3111267885a.29.1788258525265;
        Tue, 01 Sep 2026 03:28:45 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c192bbsm3875508f8f.0.2026.09.01.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:44 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:57 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a8de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eJG0Ch9LUBsamovDncMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX0Zxo4xhWxZYz
 GtML5GOR2Yxlv6qqawlzYXix27pRU7VdYWdC8fpQ/fQqhnquO7HSCp9uF/cjrj+6er8TUsix9EY
 z2PX3IyDdz8sshmaZgxv/WeXBXzQQbZz+FUqSqdCfacl3bhVz3K2/dNYBi6tgomttpa9NBU/zSR
 WLrqsxNOk0/sEGt8BzHS0eoixTO2baubsRYNJXID+7XdnhUmEcD9/JrzPUqUsdPEUcg8EH2f8v9
 /SkYu4G13SLswGk97Cr/t3Z22+CEHKlPI3NG0rxJubsNPE47LF/40tM+iHp+w1zt64TfhrA60kA
 Y1K8fpyBcaSqc89k/bwGhyRP8tj1Kr6Z0GM3uXAJGqMRuoXUJm5mUimvyvakTVIBs1S8h02lyTC
 /YFJ8JgajwieVOTDyCdCW5Vv6r6gQCafO8rrP2TBz6L+QNOqMkuWGMlVbjplumpNyjmJWB+z4O3
 a5ktLN2/cuw9Q2vlMnQ==
X-Proofpoint-ORIG-GUID: a-F5JG7BF6g7J1Gb8cFrGaUfiNlXBsA2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX1Sl4xyT6rJmL
 LM07tlv1JUVy+t3i1YbSaifNU+WnqCLsA7cu6KXc0XusKZ8qOHm7k+mucmbwv/mo3T0My26lx29
 sA6tRQ0yCJhudoJRHzGanC9fexNj7WM=
X-Proofpoint-GUID: a-F5JG7BF6g7J1Gb8cFrGaUfiNlXBsA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines.
The controller is registered as an auxiliary device by the TC9563 power
controller and accessed through the same i2c device.
Describe the controller as a "gpio" child node of the switch and use it
to control the PERST# reset lines of the two external downstream ports
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..8670c4243b10 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,11 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9563_gpio0: gpio {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +904,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563_gpio0 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +915,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563_gpio0 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

