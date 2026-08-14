Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550CA3C945A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717373; cv=none; b=gOwdHDZRHrjs/s/9E8xXzPEzOa/yUojzx5dAkdZm4hPULtmHTupmHacjh+LZLsF3akg9knw0oqQ6ccTuhIerWZw0CaBjC9IJsH5xmkASd9dXVCjOqzNJSrEPSImZW/l2rNd81QeoCgulgznJpJndR1S82itUzy4tiSt+Jqnen7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717373; c=relaxed/simple;
	bh=5v6E1c1bpUjv6tsevr8SUqv4GilTVaBJ1UqgDQojZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8Gq5Gfx+PJy6H3SoUd9icXiDWuUaIQWm9K+e7i+A+0VQ60r1I1lPvfBWOJwF/01HCgnVlJE1QGYHH9qRJu3ZK9MViEvJl+JlUCO6c9smoRbbKkjGBo+hcEMmC4VVkbtT+x5JNd5j3fNBad9Qpgw8ApvYfQYCDuGTTQmWtGxEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYfm/5TC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUe7vNlw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYfm/5TC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUe7vNlw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxnkd1101081
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=; b=oYfm/5TChw+Dmdkb
	17//r+GqHg1Joc/FTAevJW9FB+0P2hfE254+YuXrdtQhHWcV+uZRJ8ZU3M6jwmvz
	fTPEdnTsC3OVO7yS34PZswi/af+C6fIHIaAXdgbicaL0tMtr5bVBTH4ZLudumVWe
	Hh4oEvVeo4BW8+vs9pUxEg9Wlq9X9QnNqC+xkMcDf0cYK2n99kLWAxUk2W2e/njU
	7elhd1iG1jlHcDuAxpxdBmu+Uxm+cuP/68e1fS+1oxBBwI9/7DDWtfG+a8rkNeDF
	sLEFKbfynfv9gq8nE8qAxlT3fG6JD4GdqA9Rk6wHsAScsUaKi+vPwowpyitrTpDb
	X2uOuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42kuxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:22:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1806601a91.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717349; x=1787322149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=;
        b=fUe7vNlwYejosxpwMESr6NquxOYFQKPDYBYgtEr36VSSiwbb/SR6yNVgCMFs5vG2d9
         B1/R3yRBzZZ2ZTP8shlpVV4zz3gex07uZ4YmBih0Lkp3IacbYQ6Ww0d6HwKfjMYLNiMb
         YvhABFY8P+4kWMCjxF1ccwSeiBqLhv6x8MGYXPfcP/NNdJZ4DJ5co74UGyA6ektjIDQl
         jeKgXqEpASjkk5aQ1uVQ4eFe/pOLoRWFDNxiFGVivmguwCrLMXqovW5cJzeAon3Ff4p6
         4i1b+MsDECrkLIQFI6GaQCR6ypL/ZohGzwt48bzJvGIEvUgyFDyG3t9E3xNmYD/mT44w
         88qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717349; x=1787322149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBkqtOsAJvOsFOMYqdz9keOMghTLdXhNWXLS0vjntog=;
        b=LbTCCJX/xYIBhxlZpXBHadAOy0ZV+R0QPmFfTzenU42+PdHvvdGIKPF8MNCdnDyHCn
         uzNJTy5a7seELxt9PuoqkmgQHArwQyauAngCBOiqrv7j9VOlV85GcjAwSHFNogY7eQvu
         rAb6A3e90EYYBN+4N12jAWMUiCWjLoKulZH5nOAi5UegLYxH4EUcoKNsN4/JonDCXdHv
         yy6vpNsQM8o3wElM/sSCoPXYHd2vw6DQr3y+YKVAehi0KK44LO99Iiz6Id/D2LxLXsZw
         XACr+BC7NVmsuphui48fopvOQ/qCr+1WfhoaaHuMLT0mRyedSQEp3D9IUK4bqONzh9SY
         rjUw==
X-Forwarded-Encrypted: i=1; AHgh+RrlO4jk43MNB4dVhgGqOf2uGmRzTC01Z3wQvrCO1jGmLStUomLle06J1utMfLoAxMyxDbStaPCSTWKx@vger.kernel.org
X-Gm-Message-State: AOJu0YwtVHDIIqRRfJ54Oo1TS5juN4JCckLfuehyH2D7cbz/sB4oIwV9
	bZSzu5LskzlB/mTXpW2r1RxYX4wsAhqhNs2Jszc0t84SB8SY/YTcFUbn00Sskas8mkpxj0Jkx0V
	f/gDmhaHfVVcPDX55hI/N32VfRzW/SvVZLaLeH+vDPiDneVxW/kiaO0Qxx+RsCzzA
X-Gm-Gg: AR+sD13jzXpFxWp5TdMOaOYImfxEzBwHE9Vusv65ZAqXRaFLqeInqK9oVLBL2w9K21p
	15F1i52Qpb9Xa5WtG/lWc0kvS8EQvvFUL7LOIjuC1DiSx7ws4wWV9wAmo74ti/gHDxtwc88MQiI
	BgFJLNram+b+5FNNtiIF67v4qgymu3MYXrXaFDOPPgMG7tmewgRik92KcZE+YVNnSF9/F9jU7sM
	/Dr+C+6QNdpweNkDRDgiZ9672n7D/2wTiPC3qKcYDQO49GzEhEMjtGkV9NQ13UjEUq1vpcWHEc8
	p+x/6m70QrNRiWyKy7a4vhvf9IPlNiSbbvgcMGS16WW8wlOWpyQ9UtI2h2Pld5p9MOAZ7W03MVh
	xO+eloCG8mT0TuUOgPAuMrj13mVYRSkvrmNklwnl2vHQ=
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr7099618a91.17.1786717348347;
        Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr7099502a91.17.1786717347742;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:22:25 -0700
Subject: [PATCH v2 1/2] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-1-ff90d6605d61@oss.qualcomm.com>
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1659;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=5v6E1c1bpUjv6tsevr8SUqv4GilTVaBJ1UqgDQojZPc=;
 b=NTIDu3PxGlGclXFeGGp7FDU3jfos6GzWmtenh6zWKUtPSaGXshaA0f+ULMLGWGq2lqBhTr9ce
 1C8pJP5YKfBB75sV3fsc9ebv+JVgInKsL4Hpnhtigm34A4moTcXz/Ud
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7f24a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: m3cOxkOG2rRtc2th41lw0nl9IpDl2xUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX6mYWCCjzcK/D
 ckQ3AcRSSVYPIeBRQYCJ6+Ow+qs3EJvfwgvKgwKi5NLluBm5CymxAeqkLo6gh6Y4fX1Mn41sl3S
 mqwIv635oGwVYw4HMy8laMiVsWv/GDpAUg77OoX3xNytA4PoxGO+BO04Uj44JymgXYxrf6OMu2U
 rflWCl0aHZRh0IzEwyl5+/cnOlFjKedypgqLjnlsDxpT/lqvS1Y/dcrvxJ7faZRE2gPNvnJeBpw
 bzOGRR4IAAcJbUCPR/LZ5Q8rd5eFXQ24eqp8Vm3v0l1CW1CW3V0EfsmkNvOKsLEjXi4fqSvcyw2
 M1XSD95Qt1QbxBCEnda/ZIx4ZE2LYcNiXX9GUdezQDbo0+yI/oxP/awr50b0wws33YeIuzVCtP9
 IGo+3Yw3odenzyYNuSufaJs6Gwv2+ng6PQrhOxA8hldpEj6B7HPz6E4cQXACQ1daeBTk/y2emtA
 203BdDu41j5husijg5A==
X-Proofpoint-GUID: m3cOxkOG2rRtc2th41lw0nl9IpDl2xUE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX76cCpP5SLlf9
 KARLFNRbl6Kvrq/eGPvazmd8BAU47S+Ne2k63uB74YBXL3y7C+zc8Wdu9pHGSuHQdi6ksXQwqR8
 hI8M+cARjPbZNsklpZGbudgkSFiXieU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140109

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

The MDIO pin configuration is identical across all IPQ5018 RDP boards,
so add it to the shared SoC dtsi.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..cb3e1202b582 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -421,6 +423,22 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
 			uart1_pins: uart1-state {
 				pins = "gpio31", "gpio32", "gpio33", "gpio34";
 				function = "blsp1_uart1";

-- 
2.43.0

