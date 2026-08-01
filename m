Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8BD2E7373
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618299; cv=none; b=u9OCIPmnDLynwtyc8xJ4fOaDqPn9K4Fl468WZnzkx6bg9ZuLT7QDBU3Xg9Bbb4LnwJrY/Mr/hQyQyG5OypEvxlSiEmMytkR2jt+e1M7FhFrKVRyfze5g5pimzV3JNgiK3yN2nQE6RXoo9qCRecZwgYbbvZX7UAzi/qNhHPTmrOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618299; c=relaxed/simple;
	bh=3CurP6Q1yOQe9HokOz7eMUg0cch1/yisckTbAm0+V1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oG3KQpRBChC87cXeSoN3SAMVhMjS5EIrw0AwpDkyDqoGHNW0PWJyzKDXc+T626jmPcs1M2fCfC0IGHkFrefQBon/Mh3dPKEmxT9oGe1klLSYcZNxXuTubQf6UfSnyPN+jLFd/k6Td+Cdm/tCaAXwSuqlyb19nxKGWiOkNpo5vjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPqUZg56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvAyeTzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPqUZg56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvAyeTzQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671JZwKN4105626
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXC
	aC6SFm1M=; b=RPqUZg56g0t/tqd5ZFJ0XqMbV3cGp/sNHphkSRbSOAfhBo+6RMA
	7nQ1hfGFa3fx5UHoNIn3gl5l8GNL9u2PnR8O3ShJhbAXg//jYsk3yLERwZYL6elg
	3Xz8w850Ft2k0n/t31IKcRkjo4TfYkQ4t3B0eHwcB7eEHnfAxi3cQIKbBifoT2cL
	NXqO9lHsPsHaRXfXMH+6TiZhEgfY+Q7dNgr1NKPjnyE/hkHXL+o4tjBPGJ097tRm
	f+Ck3iotjW5cYgLspne6bsgbjhYJGzQDrKBJiuh/8Mf2Jyc5VZ/3t93T4nTI96z5
	RDHFNQlV5rlLC8QA+ayFZi1veaFM3aHDYng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51qxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:04:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so21988911cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618297; x=1786223097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXCaC6SFm1M=;
        b=bvAyeTzQZhGX5nV1RFeTbFpaQ531z1OW+YR9dtCwzrGxnVgpEwgeHQGDMdAKf5P4Hz
         KKd2VNgRtvJxV+mQdl4g6fIhh+pReSzQrHRt9IYiP0tmSKckjtwU2R9QzP4yaPcEhqC2
         8kUnoQQ122v49H7MkYj4VG3BipJC9/Bg+/JJWG1El9lU8AJNB0ah+urCl7KR9Ce4VSEy
         uPnwmKpUQu2UNOQZgxie9OawHKo+EMRuHDWZUs39jZqSZycBmPzVyfjxOWCk0KVcW4mz
         MYW/LtRmcJeRRSs+gZo1zsaZFxylMmWwmLemKcf4+hMIxZwwsTMs/6mJdRlCzarij9cx
         4tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618297; x=1786223097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjw0rPRNJ7YWCH2TCdmizIy/jPBX2dyQfXCaC6SFm1M=;
        b=XSlYTIObydGoS0g43M3MVCOydJ6iC/W5DRZDs6GslPoG7aoP0Rc5YNR5Jhs2OGy/Mm
         +jNP0eLhwmMs6v4s5nmsn/SPRguOnI0qyl0I6HdZNNwneAAlnh3oSxAo3xT+a8GsTE8o
         5isQxNAMUuFYl7ft2lS4GlfBuFPG67lIa9STWR5tP/xPdRRiAgC/TJ00Lv7b6IiTEHm0
         PbUIg5bJo/2AFcPR8tUwtfHP9wT+Za327ZUMckhxhlRjlHQk9115wIMbJBncG7JaQ2OU
         JrtSg9z28LipXVRMwGTEzEcapqXYIsM8zVFLcx4NPwwrF8tcHFNJsIPgTFfWUHryO3uj
         /gUw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9prYSXjd/C2txPSdjctMlbIYy0g3LrJb3TChDmovfjqIEwwH7Ubn577azFncvDdz7WMAAJpOI0HnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRvO28Q5tbbZTfJ5YTXO00HIT7pIBbR1EkCWGDljpd5BgppDy
	VXRN5pjtp9nkrZPA5yEvA2cOev0ytd9wKGC5+2eGs35u1XFjOZiIiOcvPeg8ZiGL7Yd+Z4tVK9B
	O9t907D7Ri8mcmkHfQtgziLJGBA/ov5/mM88nEQjOfRfJF/Kgtms4FVoMyZ6gn07S
X-Gm-Gg: AR+sD10Yxweh9sz8TP2fxdZSg/zPHKRd2xgpZLxOI+6shzj+B5cowQAm+SIfUfS9adu
	6d+llcfU6URTwvxGnrK7UlOkx8ulztTDTqlBsjz79Y+R7Aou/3NLvAJylT3ul5605JJMD2TTK6h
	45gXt3SIBRHZkRQG5zZDzQFiSB0KJgpCxOsw89X3xGklMqzcb8tFBSmFS6yYlK+iU+NFRMGR8OV
	RfIseDOQ2Eu1XP03PRK0oy0zRR6OoB1zYB1P/aWscyoD7s7SKUVjBTJ913FfntO/oOnB7oQ9oXy
	tqX4ZAv9YfAKfm+dzMJkXK+RF/BxESGcDD9Hvbqw5JFVrj7QQFL/ZLKwO57lqvQ64RsMv4VIovt
	aVN2NCuBg7C9YcHeM
X-Received: by 2002:a05:622a:4187:b0:52b:4c5a:5844 with SMTP id d75a77b69052e-52b567522a1mr94261611cf.20.1785618296883;
        Sat, 01 Aug 2026 14:04:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:52b:4c5a:5844 with SMTP id d75a77b69052e-52b567522a1mr94261201cf.20.1785618296403;
        Sat, 01 Aug 2026 14:04:56 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm18005029f8f.5.2026.08.01.14.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: allwinner: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:51 +0200
Message-ID: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3CurP6Q1yOQe9HokOz7eMUg0cch1/yisckTbAm0+V1k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9yyQd8ZqW3XnTVmyPTJ7r12+7L+wcBkQEii
 uvg4TXU6I2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fcgAKCRDBN2bmhouD
 15l7D/9EbP0TmISATgeXTLxkBY7vw+Fax3qcQGK4u4gwqqJ+9soxQH3aGwJ9O6Xy7a64Bugnyt8
 Cu1iJkfH3b4Il+T6F7NOGMJ5JwashOgyMBKUsc92z/jaL3WsrBxGPgwCgducJHeTq0+jjAWZB88
 DBszIku5RSmPWW/uUgRVULqC14vX4WsfqYrttdgjgfOne0uwNpD6kFcQ+D3vuVdz4T4fwGrB9kM
 Xx0n5avaK3EHb6w0Ion/+2ULnpo1ijQOORdASNbb6DJDwus3xcw8ZL/xUAqo2J/cOSbyDpthnvY
 Pg3HdULbAeUkuzM8OfD+ZCWMv0IgK++3wfxldop0+QLhQuOXJsaHoXByTFUlZMkb4eevXpb80NS
 CJDVVHA564/qBZgSkjgUIDNiwCk0v28AnmeIcq7igyV5gk37z+AZxIH7QRzKyDIR1nyt0TkJ2Fv
 CFi5uGun0m5g4bA3KsynU8tvEJ39XiyfWgBwCurOrJhCiLSs5exL5xx22/aF0Vl8ODTO69aA3sG
 +aJ+lBmNqkKjIJvi354kk36vPdllOljvihIqaBb2LUuanTS+5W8EoaLNXG0eRxTlysWif8zfC+D
 bnMr+VWYiY8PtaQO53hPxcalYe5vJux+fOFNUugpH5NUiEMfEIWHUkvPHoUtoJNecoaIfs6dqxh l/85RPFqbG8oWfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXyuccicvrDf6I
 ka3fwkDC6LTnLKcXnFOftNA+BVBGOfDpePYB89oplDzUBZl7wGygYV0cF8/SQ10XauSptBSUGN0
 wBOWaoYfYsAHevxz7FkxwHb6m4Pi4WE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX06iFKz7JVwRC
 VpecO+h7jmLB4vcsyxAgu96BRQzcodJaf5HDhmx/L2+miHaH925suFI382f6mBl3x52FIxx3TBK
 xoYdzPpsnLcupvk3xOcG4JYHteiBloICyqReTQXuWvY0SVvdIJCv70GSZyhGKFO/J02QmNMNd7X
 u19yDizTWah3pgrKZA/L1/TNOI5WY/QQfmc+KGwKbbTmtb8SkWZiejyBnEErU9TT1uj5t2DEiA3
 ilL+YAAjpj4AGqd+ZBhGiDqqqY6TpbLnjvAFcqUaZ4g3w2y/NGFlqet3T4rDkmPZngKSHCPUkdk
 uDVH5cRl3kRHh2I1CZcdDhsjP+510Enj1+w/Hoc2CsmLhXndw3pzcO0Q1GFDdKOWzqbdeff6aW7
 FbUGk56DerWgYF2/MOA0FA+8091wvZVzqL0E4SDAguHFblSZDUl0f7vXdSnWVerq2JGEkg51D/z
 wQfxhk+MybJlS+K2w9A==
X-Proofpoint-GUID: N_d2a74sQatis9M8sXxhRvkHTEmYot3s
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e5f79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=d0dntzSpW-aAEgfTmdkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: N_d2a74sQatis9M8sXxhRvkHTEmYot3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like double before bracket '{'
character, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts          | 2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts             | 4 ++--
 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
index ea7a59dcf8f9..f6d4babe6c1c 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts
@@ -179,7 +179,7 @@ &reg_usb2_vbus {
 };
 
 
-&uart0  {
+&uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
index 60e432a0ef1c..408d1f01412f 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts
@@ -78,7 +78,7 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
-&ehci0  {
+&ehci0 {
 	status = "okay";
 };
 
@@ -157,7 +157,7 @@ &mmc0 {
 	status = "okay";
 };
 
-&ohci0  {
+&ohci0 {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
index 544d60cfc32e..4879a437f415 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
@@ -42,7 +42,7 @@ reg_vcc_core: regulator-core {
 	};
 
 	/* USB0 MUX to switch connect to Card-Edge only after BootROM */
-	usb0_sec_mux: mux-controller{
+	usb0_sec_mux: mux-controller {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
 		mux-gpios = <&pio 3 9 GPIO_ACTIVE_HIGH>; /* PD9 */
-- 
2.53.0

