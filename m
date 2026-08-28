Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAC471432
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925968; cv=none; b=H7p+hZSUg3JkhqRVUt6G7zoqt62WBhtlElaIxIEoWfyCGG09Oj7EvZO2NAYfRapxDINR5tjGNOUZN7yWKbRvh0R1b7uO6cV+v5Drx5Lx6cyw5bJn/pN09xa2/zVLO61DNxmMRqn73tbsOxPSeJ2BzYDY9zirvI7lN2VzPEb6IaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925968; c=relaxed/simple;
	bh=1brovUppJvb6ttZNs7kwMEVpoh0akbg09pFKeVhGO2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bM3A5gFb7tfcCiEPImfVLPOIIXrOgmrXtmE2iQ4DJmrKw1m6EzxNQouoGmYV6+vf9n4L3cI25quLq2BYma5fM7RvFbFO+SxelW8ILZ2bC5GDKiyvGaY5idElzEF3Ahp8qjCGHsk+wJ+WnQC1JTRg4zzsXMX1NEJ1CugkF/LHkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwCD4dLo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AREJ0ZeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwCD4dLo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AREJ0ZeR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDklHc3280262
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=; b=VwCD4dLoAzD8N4dr
	LLUEvS2ahZRwbDsYPXkb8GI1OEVLwv1y8ArrGOd+5h0/FX22zw29Ck7jZMFy5LCV
	TRKniVInuRMhWTbUrH1epIu2notpicVY25m4JqBOmH3Z6Ro2X09ORiyFKHykj+X7
	bAfy/tM6bVMKAC8s8WyxlrRrfX1qm4/oFwnF0aP2iq00BMYvZgP7mcZuzfy/ji/Y
	UJMQNARJSm0nVp1IKICpIT9xk2+jH6W2QNm7EesVdeh3NibnHH3wT+LcqrWrmTSo
	ZYan83EWZD/Vz2VYf1mEhGqUPa7KLcE4DapI73IEDQwPI/omNCw9h6cjWYNgHs1B
	RDAoyw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1gnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-783b725c8c8so888448137.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925963; x=1788530763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=;
        b=AREJ0ZeRhBVKw48i3L9yl8RuZcTsd6UKi9dLtz8NEdoP6Ngq3QU8CwO02GHqnMKzXY
         ZTdw2/FUFf0gg3UbwhvMrmWDkwJleQvnOYp8VXBfgjTBKK3nY+xedXDLTeczbBDUbovg
         WtVizu1kblvvMDoqo4HHnsoEfhb8/kyLebmG586T4awGHte3Aele21TqAr5btjrYIWnE
         hHRD4mhUpTFDjWZwTWXG6AL5mEvR+C8CypLSGEh2wImp1CSb/VPLpRjPQEXrgBGsxiWn
         cxAJHeCWqyQGl1FiyAAQVB+18/gG3FyvWU2N6i13zrplSiN+psVFQV8fIYLPjftkdR51
         qBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925963; x=1788530763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=;
        b=Zx/8QtHIsX+tTzQnwfR6c8zxjbkGK/0ZOGx5X30UxuvNGJ7Gp6Z+evcAh9lxTpSe5S
         QN69cvepeWKMdbl2zx0fSaVNPYuxiMhNsCMb060kflx4vq9nQKOonHcczn8NiSKhtq04
         rNbYKI2SEuZu08FFfKkLUTw6AMbuFgX+yXkoTSYRjwpwg/Dv+1+NbWNMpQdGkvNtMRuB
         RYnB27TWDVwumlhFmmjdAchiNhoKGOiWCaAgwTlSK0qjjIKFXca6DAuYx4gOxjWlIlRj
         iRL6Wi1U4bFllUC8/sUU6j/Obgwt+DTpKTTQqm+PCRRRGiMt0hh6uPjY1QhfYXqd4dOo
         LD7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9SmzY6IN6m/mzbeEKd+DIFKdqgmqjPeqydL8Lajh69gjEjV5rPOKsIr3zsg+cr4ZFJyu031adnAj7@vger.kernel.org
X-Gm-Message-State: AFuF++lYdlgAWFxZ5N/4656yDkgpM3QWrrOhmvEV84tbNxjqhRAed3pR
	Pljn39W1rcfeyjvNOKtbvz5tnlsfC9KPFx7abWQ2aCmuC5ZEKQj3Z5RvrnkHEKrzYxmL0i8XlYg
	9kI0s1PK/sh8OGkWRaEhhhJ/pPQe3I83TC/PQqRQpvIJyk0AnhychTyUxze1Adifx
X-Gm-Gg: AR+sD10hgFg2YesDzAsERJtV48RPSbhEokc+1HRrmRXG7MiTly78VDkNiwIeQSfoGh2
	J9GZFhd/N3adoyUgpUAro/a7skBMnotapNGD5bNytEa8HBypYZ6v7YQFQALstipuTcnbXApCQdm
	YMU+8AP3dhbpJslhHuFPQWxdiB/OLu6vhnw886X3JUQfy1IHfkIEOJvIvT3fndVaaOFcm/BGhJC
	TUvenoaaI18EbTUEfTiJzieFg8OT5iejqhtEvG/if7hJAnl2Tr13JGgYdvJBX3BztXoobu7kLVU
	Hdoy+2Zvqm7bTQSJVf2stoPD4WmPJpwOQYm7IyxxAFxG2x6BEfZdD7k6/r5KKqyzY6JDDCOkFFV
	g97HCTfJq00hwSYpUasOK+MU=
X-Received: by 2002:a05:6102:14a0:b0:785:8f76:654d with SMTP id ada2fe7eead31-7859996dea3mr2555565137.13.1787925958200;
        Fri, 28 Aug 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a05:6102:14a0:b0:785:8f76:654d with SMTP id ada2fe7eead31-7859996dea3mr2555540137.13.1787925957739;
        Fri, 28 Aug 2026 07:05:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:09 +0200
Subject: [PATCH RFC/DO NOT MERGE 11/12] arm64: dts: qcom: eliza: Add HDMI
 display with HDMI PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-11-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3332;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1brovUppJvb6ttZNs7kwMEVpoh0akbg09pFKeVhGO2I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWh434bFUqmEnSRcqsBUTydZhsSgPv4+miDG
 XMlneJoAQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVoQAKCRDBN2bmhouD
 1wsCD/9Mr2Zz4eadLs8rLbHZ5HLoj8IHcYC6XeDJBJ1hq4JmXgA9jzZ+iJwEmqmCHO+hd3lbluM
 L1ufQWKSIRAP93y/MLCFtw77XbOtvmpCg6nKr1393bd6hMFwzpwJn4E8VlMojR7kl+PnXamsAsh
 pPuK6s6pnv/uY5yZfWO0gMCBdTuwXjpUbpYYnMhP88AgUFUykJ55+9Ba5DSZVAtmK7ZjetkAv61
 I/u2P1IbLdsIKgUUQiR1wbXa0phdVCUoVr8ziBhkOVT60LBNksyXoKjGZPr8EzQpAgU9LUhxJ3d
 TjiM3PLC6Ur1wPvN8ANHOxQtnDkCdY4He9djZ5266iTpV1ZrAHpqGNhbMWnsjXVuTBwv3QeKRXA
 hlppN+whNMClQuLSY12GNHRINbI1bSyh5gWk7bHKsO988VkutbnhSgOnGUTBpjTz1OC5bNaxFNs
 6pPhgIq8plNv3MOhsu6rpno+QcujtZ4y1k5oIFHp0kbkLK60F5WP5urqGNR0sUBD7XmqwmzlyJs
 eFQYX2MnjvFzese4jNfjZHcapT7f6R8OKRxGRH4kP9pOYIkCkzNQ/tQXxUC/gxdnBigh/riykcV
 O9mPclqIeHGQSjF7S2fHOvChM2pvK5j+L6J4aCQe+FpFYpo7edImd/Kub32vtHP1DtbIKgp6Eb+
 0RMxMekt3ocM8ZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXx9ZDac0Zx+PI
 eDuBdMG8W84VoL4TenX3317bldTNnmmPDRenW5we8a4d+a5T1mWTVdD+JfpGBb48bpISjBSiP6n
 h+XOkRy1hLiL254P5+KIXEFYJIo75l4=
X-Proofpoint-GUID: H9CWVlM1Gl8e6kIEOTdyZ3vjqfx-6j0F
X-Proofpoint-ORIG-GUID: H9CWVlM1Gl8e6kIEOTdyZ3vjqfx-6j0F
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195cb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BhlsTWrtbvULCAht3EwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX33tlvKHgJK35
 DncjeDILB/71FsJRCjOKfPDBylX3baVE7q+Cqpr936Gnk9sA5dvP+eYG83fESRdJ1PhktalG/J1
 XhZjyiyU/gmXDP94VVhNdcozNt/4EJXAmXRoVPi97SXdnIIw6l3jWaVmlNcLb/ZwULMYASU6gLw
 I2YnYsPRyGXc+CFz543/HTFo7u9KWPyVsTmdjYnr7gFYFPdpqZ7wmpbGtwRnnRJIq3p+ygAPEsx
 ND83BMrohIfLIzc4e3+hPDkp+8hx4qiCNcssx2e/5CRRzhZsXDvJse7reBkXVqF/QgzT8MqOVoS
 e6bivnxigNm7C5+tvL/uVDytRc3lNaUa+NIxynJm+zFO49730bNLb4m5L7dBPF2RuACIze9bOW1
 uDa50DIm7QiTSzHdUDe/u1prhcIC+5RzM3Em+3oOtjNlEFT2BpzW8vG2nOO2Yu8Hbt0kyIPvA7C
 NGd5NkSzE0CVV7E7SxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Add device nodes for HDMI (similar to previous one in MSM8998) and HDMI
PHY (new Synopsys-based block).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 94 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..27dd15766f51 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2570,7 +2570,14 @@ dpu_intf0_out: endpoint {
 							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
-					/* TODO: HDMI */
+
+					port@3 {
+						reg = <3>;
+
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss_hdmi_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2805,6 +2812,89 @@ mdss_dsi1_phy: phy@ae97000 {
 				status = "disabled";
 			};
 
+			mdss_hdmi: hdmi@aea0000 {
+				compatible = "qcom,eliza-hdmi-tx";
+				reg = <0x0 0x0aea0000 0x0 0x1000>,
+				      <0x0 0x0aee0000 0x0 0x1000>;
+				reg-names = "core_physical",
+					    "hdcp_physical";
+
+				interrupts-extended = <&mdss 8>;
+
+				clocks = <&dispcc DISP_CC_MDSS_HDMI_AHBM_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_APP_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_PCLK_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_INTF_CLK>,
+					 <&mdss_hdmi_phy>,
+					 <&dispcc DISP_CC_MDSS_HDMI_PCLK_CLK_SRC>;
+				clock-names = "iface",
+					      "core",
+					      "extp",
+					      "phy_iface",
+					      "pll",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_hdmi_opp_table>;
+
+				phys = <&mdss_hdmi_phy>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				#sound-dai-cells = <1>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_hdmi_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_hdmi_out: endpoint {
+						};
+					};
+				};
+
+				mdss_hdmi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-150000000 {
+						opp-hz = /bits/ 64 <150000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+				};
+			};
+
+			mdss_hdmi_phy: phy@aea1000 {
+				compatible = "qcom,eliza-hdmi-phy";
+				reg = <0x0 0x0aea1000 0x0 0x1000>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&tcsr TCSR_HDMI_CLKREF_EN>,
+					 <&bi_tcxo_div2>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				status = "disabled";
+			};
+
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
 				reg = <0x0 0x0af54000 0x0 0x200>,
@@ -2913,7 +3003,7 @@ dispcc: clock-controller@af00000 {
 				 <0>,
 				 <0>, /* dp3 */
 				 <0>,
-				 <0>; /* HDMI phy */
+				 <&mdss_hdmi_phy>; /* HDMI phy */
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>;

-- 
2.53.0

