Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB830F543
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321436; cv=none; b=NVni0p7m+f1GRRxu3R7fmFFeeJpDN+AdGlbJRFRKhd2pHCIIwEXYF90flywJZ68zoGTUszQ+o49bkadaS1stNUBhFYAcTDykfijxfpCbOwFPlAhoe6NgZg+u+nvdutzjWbS05zCabOJ1S6r4tSf8tIRRoq8PYUDC1/EkGFJdHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321436; c=relaxed/simple;
	bh=8DKdeI7VpqmHqPyxsa1vzB7yfzHWTvEElPRnrq59Rw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlW1OpHZ0WiNfHYKXdDUAA8U3ybW/HUkOvRJj/uEgqbDlB5V9hJ9K6IX7N1YUrfKZc4aSvaHGwkppsyeQSsx5jQXuHcqYPxg15PBGPsd2ukrYgFiP7YdQUttxOEIcsu6I50+DsRbYtYNZaJa5bRarKFnFAGiUWzsGvE7+csAa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxQehkOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdm9cXUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxQehkOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdm9cXUb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Se23438091
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=; b=mxQehkOKFF+GzcHB
	yYxbv1kMhFfF73z26QLUN3Dcyj8P6DPlLT2Y9l5tDyRFEdGlpsXTVJdkB3cYQO3K
	O2FL+ptrOBtUwS2aR7Z9Uni72HyaqZ+CjIu9atD4JlrW1MCVCDiXRzJQLoxposPF
	vVBO5VyHtJUtGBEAnPP5nDgoO9mY9YyxcFltDT/FFeXJWr9FiuzaSa+aDiw1MORV
	2WGoDKLwVF1l/zExiII1R74+cZAhEjyq80Jf6fDk9KSexD19dwFGtdObb3Pshial
	b/YNWWvyXkui+N1ll0esTR1gKrxjteY9+wHKfaxfqgK4ZaHh9xGN6ow4OoTTBfed
	h0rV5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8n0ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:03:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so30766836d6.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321425; x=1783926225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=;
        b=bdm9cXUbDATFJMgzVgrRMg7w6e45qc0R1jGOKdKCh8DPZony4B817OB3oJ25ls4u9R
         Y7W/zz9iF67yf4Y0c+28Ry6YVCEr4+P1mJDsxtViIvRG/SMRIzKMSd9Y6bK62S7jlZee
         y0FP4i9x8VSh7/4yynbA+UXyAD91bbssSs3jwDjI/6sYJYRsYi9MMUIkR6HIbzScdq5w
         5kOfelysU2Nxn4cj0M8sLdSunpHTwez/w5LCKSSo894sWiStSWg5zzzxvWsuWLPLLd4E
         VkN2bA6usTdMEWb2ds7T7aJehWTv4/ZDGHKENxIEeqpzWZd928sblnXCrAMdg5IxI7WO
         0Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321425; x=1783926225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=;
        b=HKZmfKXCnZ3yb82pDt+oLK6tA1hWsZiaq0qW5MbVQzJI10omOy/qtp8wk5ysmQtMGJ
         C8jA4apRGBPMqfqdGVrkh/XWyZUgk8G64mwV+pG7om1iujwPkWdbtwZ1brbi3LZpckem
         udQ+Cy8ODov/XfZ9+XPISjoYHfQT/CAh7LRaXBCdq7ezSZY6XgyIO1uAldrqtZFgkfyP
         IsWZi830VXIWv4+XWP5j0+X5HIAuzNMcUKtGn3pYaEDsojSrSupzDKzVBIhnlZrf41MY
         FpmH6i4uajq9eJbdzvYwclaOz/7cDLmSMYXhB9Mu6S4lVXix5hCrKC17ZfgqyHnaJ9Mf
         B5/w==
X-Forwarded-Encrypted: i=1; AHgh+RqUa/waCgx5CZHJfyqbpb9Y1i0WJ7oi6+N5KYbQgGfp+k/sjK1t/sc+MKXVzyX0la3w3CgNedl7hg2H@vger.kernel.org
X-Gm-Message-State: AOJu0YybqLKxSkZH+t9E/Rnc6bIGw7uZm+rSkR97wV+WRVGJfGt0us2M
	cmi2tIpwwguaefAo7mLqL66GxIe9skOZjvLucoPspFnh2+DVvAc5Spd/i5fyosSrRIiCMjranWd
	RsKoWZAbaF3EYW6zWwgdQ0szTr9Bupi3uIG6SHBDbFhXFMtDum8iMhPM7l4cIsLyD
X-Gm-Gg: AfdE7cm3EVKJisBM+iaSFUMJ7WYHk03moliChO1sXd487TrCAdk8G6ZsZyufn/GYZSr
	p5ltUK2G4WdwMy/b2S5zqAGYSVxL4nMHZVckDz4PiEOgQ02qopBFxGMCf7hShX4T5AnwWwsvATC
	Zzv1UeqWHWoMlV52tkYeX6yvoRiEX3+amqO2MrD8iZLQGIYGE15tXLnrqh4NGktVRXdq0S1nNjp
	Hed/utWO3tNmp9CgMuekhc3TYI++c/xg4SrLbHb1bWIsO6Z8NRWyFuS/n5/1oKpWu5p3IS1bdrs
	OO1HbOPYfcAXmEu0iRJqCSD97M+lECrkeXvqouJiR7pWz14eIiv3bNZxrS/4W2IhA6fzw14G2JP
	SZrEKi1WzvXOntKJqMBz4+JDL/J5QmSheiVw=
X-Received: by 2002:a05:620a:1791:b0:92e:6bbf:9686 with SMTP id af79cd13be357-92e9a3447f2mr1169661685a.3.1783321425429;
        Mon, 06 Jul 2026 00:03:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:92e:6bbf:9686 with SMTP id af79cd13be357-92e9a3447f2mr1169658985a.3.1783321424926;
        Mon, 06 Jul 2026 00:03:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:28 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: Use lowercase hex for unit addresses
 and values
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8DKdeI7VpqmHqPyxsa1vzB7yfzHWTvEElPRnrq59Rw8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NG9YfGrUkFpvW8hkL4pjkgHHbFR4P3fv6wx
 eHUvbhNgyGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRgAKCRDBN2bmhouD
 13cUD/9gr3SBOdaLlfzXKjuoI/gXjtIxihYJykjUEQs0l21rgtkGZMDHECfrZ2rnbllSdNtSfUz
 BcuPgDNq3N/Tnes4ZW7GU2/EL1X2ghA2S5lNryai635sziWIT+/qw7V8xBb40n+4ypucAU2dlVh
 VFx7T4fCYYD1z7MkrT9MOWrvSXGlGyYZOlv8ewcCWAJWSTV8QDsT+jypGPePv9P68NgX/UfAE9O
 gf0GkWCy5wzGR2fWg3v+jrn3bRFm19gysE7bpt3j8otx7Y6NybvDLNtqm0jUrJqNH+eJGBm54Td
 W/Eib5YPyVaG34uUARKZqWcVj3ut4eLfg8rGYYnser/9UbJlvju1MCBb/7yRW6/9nYhUhUKcmyt
 FiOrLNHMYu3b51knqSHb17s6j1XHJVq2/AaVbe/buDur+LU/pI62KM+ACsZPJizYos0oscviZAC
 IjsPiiNr7ra23Lp3mF3q3h1bnI0gPFNR0LsB5DCUn/hn9gA1hsQN1Ky8ROCbtKs/jo+pqkqjNP5
 n5QstNX8BgbFiOwo7a1YPvxl1uVRT0ZH2XFEbEhDS8vqEtsi8/rKMeC+M3lYNZodf1A6aT+SIox
 mtcHbNSwo76xZWmLlAt2r5bdE+2w+o6XSjsBwyY+4fks+ykJ+chlXbUxxsDg45CE1GXqf2u3rFd
 A53LsaYnfsXNz+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX4pdb8J0SuOlj
 +u5nf86bW36xdEQBLu+wut5nhJi6rGNG/MtOU9ZKkOH/mFZlUoKBNGABdzma6jZjo5BAu9qxNG1
 zzT5O6gEvqaMcaTXPDuviebeV8WmwibrgyGKplj8eb5uRj+ElxLBtJLQ0YJ3LdbeBfM42TqvO2p
 g3+pWvkDWKQTejv3XaBZzCn1C0HrOKiLgA5aAborPyESVjXtCX1tIpgk1udzHub3BzwZkV/eqvP
 /ViX5fTfDYfVqfVEs81VnJVpxOBwM/2IUupH2YaLTpYoBnQe4yhVGCO3Ng5vlenCYSEIF2GUBti
 TU0f15XzzylH3wy81Qf2hoosDv45mQsZ2BZoy9r+bK93ZhGBBtVNyzXEVsbDPwEkU4IPeKkWmlC
 49N0B2N/dVe/Lm2JR9SUk0DBLZUsMnKdQWKQCA3mXwvXOjVoQ/ddb5C4RZgQ14n8rlh2YTIy8hm
 as2OGLwkr323KW9U7Kw==
X-Proofpoint-ORIG-GUID: 97Lxp3R4YjzaPne4E0kFGjxCE5NaNylW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX5CtdLBx3cKfM
 nprKmuMC7IOguXnK4GD3X5+Ml/fn3Cdq6bNLZSWySFL5Jn1s40nRuXDMFM8CxsHnFJQqmELeLfp
 AwCO4YlfChroLPujs8bWk41c0tRw0e0=
X-Proofpoint-GUID: 97Lxp3R4YjzaPne4E0kFGjxCE5NaNylW
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b5352 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Uzw07H2qs_X0hPCscOoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060069

DTS coding style prefers lowercase hex.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 4 ++--
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index adedcc6da1da..1a278503d340 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -591,7 +591,7 @@ saw1: power-manager@2099000 {
 
 		nss_common: syscon@3000000 {
 			compatible = "syscon";
-			reg = <0x03000000 0x0000FFFF>;
+			reg = <0x03000000 0x0000ffff>;
 		};
 
 		usb3_0: usb@100f8800 {
@@ -1241,7 +1241,7 @@ pcie@0 {
 
 		qsgmii_csr: syscon@1bb00000 {
 			compatible = "syscon";
-			reg = <0x1bb00000 0x000001FF>;
+			reg = <0x1bb00000 0x000001ff>;
 		};
 
 		lcc: clock-controller@28000000 {
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 0dd52cac0e2e..7206a33da279 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -15,7 +15,7 @@ / {
 
 	memory@48000000 {
 		device_type = "memory";
-		reg = <0x48000000 0x7F00000>;
+		reg = <0x48000000 0x7f00000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index b2dc0327dff8..9368fd6b8751 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -66,8 +66,8 @@ venus_mem: venus@97800000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp-mem@97D00000 {
-			reg = <0 0x97D00000 0 0x800000>;
+		cdsp_mem: cdsp-mem@97d00000 {
+			reg = <0 0x97d00000 0 0x800000>;
 			no-map;
 		};
 
@@ -81,8 +81,8 @@ slpi_mem: slpi@98700000 {
 			no-map;
 		};
 
-		spss_mem: spss@99B00000 {
-			reg = <0 0x99B00000 0 0x100000>;
+		spss_mem: spss@99b00000 {
+			reg = <0 0x99b00000 0 0x100000>;
 			no-map;
 		};
 

-- 
2.53.0

