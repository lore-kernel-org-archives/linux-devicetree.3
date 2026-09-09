Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590757F74A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963498; cv=none; b=U0fSYcEcSlmc+uOc9sVtm+O20/S4wfJ0VplMFJs0KMU9MDpT2tjrcCdspCM9G7VG9nN7fOP/6/Dazo2UC26RLivE6hAe9QXPmNBcF/IO2YqfBz4KFvG0YrMxC0ShfUxtQKidg+1BeqvT+D26t/usGKR31HqA7bXIxq68wfT/SCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963498; c=relaxed/simple;
	bh=7EmprsezlmEDs52Z6w36+46VbxhG5PHdPEEM5wCXDSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQ4ExfFJZtpWxQZyfJQyoaxRNrEyDcRTeI3vRS87ZI3K8k6xiglIt8QxeCljlhTvD+rS2Y3TWl17AJOJs7/CSfS5fBhd1GDX9IZc3FBekC9UgCYx9s7OvXz8RKLTRDP6Zew3s3xL7KpOunn/GmsdadaW9QY/hMFD9uUgFARtWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzJHkvnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTvar35o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzJHkvnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTvar35o"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIb972081194
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+mouk3zSih1qQWMJxOA0akTC4FwMrv0OguIIxTUmV4=; b=VzJHkvnQoExX7jHL
	m4cFJEdf4QoHNcFQox0y2U8mtvTblGN+XelkY90/FVVD0kzLnHDXMxQ4c0NNe4+x
	iAInoHkw55mGYFVUQXvbViZ4fAkbhL+tfo+hfqNQGuEiXlRaZJEflSBFzAZk4u8J
	i29kIieGEOrdepY1KgJgNbclstkxclCeXRSXQ5mhM9dBwRZO/I5y1SIgVD60EHi6
	AaFIYZUlZMfwyWQUPAiSb0SFjWyC4OZE+yoR2VDBz0hBfdELcXLgYqukpKDeOP3s
	Iibkc1RTalR3BEK0J5VOBO0YicmTqlDaHNn+nKBoVsWU0HIygRu0105SuIPzS0PV
	gypo0g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r09yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:18:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so3396113241.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963494; x=1789568294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+mouk3zSih1qQWMJxOA0akTC4FwMrv0OguIIxTUmV4=;
        b=WTvar35o8cxPahr/SvfhPJDhGKJ6G35qhX9gWutruPbpL792nJ1tQUoBrsqwqH+jji
         NwPjOrA3mbN96K/4l8YnsrNoP7tBEmcMi+Mv+Re9CsCpCtuHeLXcrWdl55JRDNM4AWYp
         87bJ3kdfxPTEg+/qqZnhmW6U9G6PnyTkUIOFA4JRuQ9d/mWp/l1pXUnp8DVY4VI6edmf
         kyCUfg1HeQcxUAZf2NmZpaoDxJmHsW1ZUHwn4LV3VsmO6IQpmpZmTS/4sUpNeB4ZELU9
         uV+koEV4Fc7qxd8LZosQotgTcMLBMPyOhuKHxWNGpWKPCRWwU/KqWzZInRn2RgNQN2ZH
         mMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963494; x=1789568294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+mouk3zSih1qQWMJxOA0akTC4FwMrv0OguIIxTUmV4=;
        b=Mp4vB6BumxDtSu6002jkB2Nb+bViVmZrufuex+P7L3wn0l8aEUyXfJfTtM+9xoeArL
         zRIUkFAWAKLRlOOge5+pT7Yut8iU8DqX5UdRVh/9NhxFHtRul81q01KgB9eaIN+/q/qx
         i11PwHleDmypQ01Lf3cC9OMIuwXS4jx94AFwybeFDAufzdc2fqG1fwYcJ2pJgS70SFYf
         fTb8159nox/IKwsphZzWOTt1AVhcgXKKBMc5bYeBt/SIQiibq+al+z+Qhl9lRFGWJt3T
         YNfTC9Vojb3F1a9893SENCvZxCt/fmNrifDu9YsU+SrysEcS1JyOYjOe3k1oj5GmPJk+
         SPMg==
X-Forwarded-Encrypted: i=1; AKwUvBzUn8mObhV9IH2E8I93/g6GMnYT44/t+jIdTCUwE/gbjND91FnNfx8273k6yaq/phiC8mgInwZa2TIq@vger.kernel.org
X-Gm-Message-State: AFuF++loYultFteHxtCcp5rd43zAmYHBbj9dKO9z0AGa/vLGmpXcM7ZX
	SAoIG+6sF0dEk8GESR7JtujRBo2M/GWDvrV0INziEWpEZ/XRfXOkwGCYLGmjr/GGpFtjIX6c1Tj
	jpmXqE9/9vXD7YrFI9uIkRmWw/Am5hnoJ9SUhr55NXjFePOCjbe4e83hOV2frhC4I
X-Gm-Gg: AYBFou2EIhiGQKmNyIS7XlsiyiwlBGEjvP0frVhMOgjI+QEuGG1ofz2RPCHCH/BLugn
	NhZzMHdB+RTd5maIdMk95mQnYGxxw2A8rwBmhOhR0rrx8AaTBVVUcRcDd/t6NQ7fxIFqmBNyYmY
	E4FJjE822IrQbgRl6+omaCpD2w5HrXL6kxCJhZ0afCkNv6vr43N5g7gyGmNMzg9zU7fj3f7kh9X
	2LL4YcFosVHmTSm6V18Ma/qQ3dz+IEfl8DYdr3+ZZApgtQcsyMUSpbEjnZejR6e/g5+6r5VZ0l8
	Jf+7djYajAnWnxUB6OwcGt3eZnxSkkTsyDHXCpdYzJ7s/3t1hNNW7IIH1i5CyeDqVTHWxi5N9y+
	QKYgy5izPDhqq7nsYXwVsgYw=
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr16661262137.7.1788963493845;
        Wed, 09 Sep 2026 07:18:13 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr16661226137.7.1788963493135;
        Wed, 09 Sep 2026 07:18:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:55 +0200
Subject: [PATCH 4/5] arm64: dts: fsd: Re-order nodes to match coding style
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-4-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=32636;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7EmprsezlmEDs52Z6w36+46VbxhG5PHdPEEM5wCXDSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqVBSrL6CpDyIJkcPmpFsS1cIWSqbeLhrvGD
 Onoy8CoGOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlQAKCRDBN2bmhouD
 17IID/4+S2tmaAh+g2RIGtTNmBqS0ZXV7QhwJo0T+n9XUMotCNp54NGCTgCczyhuMNshTE0U5P4
 NcUpxRW9oZLltThqS4slsNcLxa1Nbu1pC/VwxmEiCkkaAUYx7aotT0WYBW6GxVXu8t5D9nNtazo
 TEFktsPpWBWIlYdm/0Qr+aGrQJBqfr53FVlwp/x3C2yzEzWn3bl3YRwdTRekrqLhGcmePQIppci
 ZOlGLOht1ka/xoeursy4PXv/sHbdDIv4OOwQdkPObDrUpOnyh6GBdPxGMV2PmyJRkD81TUocgFm
 URs+XOJFBwGaqlbg4xRKkN5KpSh3OjzSrT+H9XXqE6XKNkmrvr+e34gedtO0QRdCwEbSPH2N/ff
 CAFdvXt4zeycXi4CA7wzpMQPXQra8guF6Bj5o/JaDJ8J43Nshho384Bksym0Jx+iRp2qiZGuvx+
 teI0yudqoGQM9VdjPsxtO/bVVP/oDR00k5WxHNUGHDf2+Yo6Ngj62pHJPo+B8pbb2yfj/3IwViQ
 cVYzcio88pSuv3W5dIrYgIV9NenSwL3Nb3TeSRirWhEy1CorhHazdTIO6kQuMt9B29x/fmT2t6x
 RhlQBIMmK4JHkkImwaEdM4DxKhe5annIorhbARZR276zk2aIEJwbESVS6lESvLPP3svxGDNGluB
 /+9Ckpyl5GuARyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa16aa7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9HsnxF4TNgs8G9E-vwwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX4wVfW+1vGbXs
 AsM6fqVnmecouqV9aVZRzH38nQsKTLI690hIz75sv3Q1wW0UUbYYjzAGcNTEL5tIt/nybN1kUBw
 rYcJS2Wvs+8aifpSahQeowMaWULOVYyyXiEASTANGclYsIF8duX2hewivaWusi9KGkFwmGaWW8y
 6qC3rrpk9KOrdBBZDkogTSJZVCQo1EEqeDxdiWzKG4GYzISU6p+FYuLDu9A4dO/2Q6I5NE+9flh
 pUZ6avpu6lHvxnIRqD+gJkW+4BHP3L50VBy2G1uPFRbKMaN8hwyJ6G2qUPZUAzwqy3JnfVGE7j/
 svwrVyMspufWQj9F+rBrd3uDcxo1KVqlQ01/3fFfWee1A0fiHnUbvuH4vPccdqmz9eJ6WDtQhqy
 LSL9xKAD7ILO3OE7tQWCrHyAbmMuEBY3+AQ2BjALhwyZ89k1n/qFeWCtWxdTIq7b1lf7LsNiW0c
 hw4eDZDxSz91bBWvH5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX1urWoZ1UCP0t
 suLC/puyZcQR1zYQKvGCXdVBL7sKAVoeFuQjEmLNhbGZKbMBGUWb6DO5DQ6ZBnLo6U8am9XmcwD
 R1909AWqx3uFbPd9RNoRY0beV4c3gbk=
X-Proofpoint-ORIG-GUID: w8VxakuyiN0r4wC09_HYF3gaA8DB8Npy
X-Proofpoint-GUID: w8VxakuyiN0r4wC09_HYF3gaA8DB8Npy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090160

Re-order several top-level and MMIO nodes to match coding style -
ordering by name or by unit address, as pointed out by dt-check-style,
e.g.:

  fsd.dtsi:981: [child-address-order] child node @10040000 out of address order
  fsd.dtsi:315: [child-name-order] child node 'arm-pmu' out of name order
  fsd.dtsi:348: [child-name-order] child node 'clock' out of name order

While moving chunks of code, also re-order a few properties (I2S, SPI
and CAN nodes) to fix:

  fsd.dtsi:661: [property-order] property 'clocks' out of canonical order (should sort before 'samsung,syscon-phandle')
  fsd.dtsi:936: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
  fsd.dtsi:936: [property-order] property 'pinctrl-names' out of canonical order (should sort before 'samsung,spi-src-clk')

Moving several nodes already creates unreviewable commit, thus
reshuffling the properties allows to skip changing the same line twice
without loss of readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |  16 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 798 ++++++++++++++---------------
 2 files changed, 407 insertions(+), 407 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
index 6f4658f57453..ab25433e9b32 100644
--- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
@@ -27,14 +27,6 @@ gpf1: gpf1-gpio-bank {
 		#interrupt-cells = <2>;
 	};
 
-	gpf6: gpf6-gpio-bank {
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
 	gpf4: gpf4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -51,6 +43,14 @@ gpf5: gpf5-gpio-bank {
 		#interrupt-cells = <2>;
 	};
 
+	gpf6: gpf6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	ufs_rst_n: ufs-rst-n-pins {
 		samsung,pins = "gpf5-0";
 		samsung,pin-function = <FSD_PIN_FUNC_2>;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index acbe93756a76..22b997880d65 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -34,6 +34,12 @@ aliases {
 		spi2 = &spi_2;
 	};
 
+	fin_pll: clock {
+		compatible = "fixed-clock";
+		clock-output-names = "fin_pll";
+		#clock-cells = <0>;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -312,7 +318,7 @@ cpu_sleep: cpu-sleep {
 		};
 	};
 
-	arm-pmu {
+	pmu {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
@@ -337,20 +343,6 @@ psci {
 		method = "smc";
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
-	};
-
-	fin_pll: clock {
-		compatible = "fixed-clock";
-		clock-output-names = "fin_pll";
-		#clock-cells = <0>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -370,14 +362,88 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x0 0x0 0x18000000>;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
 
-		gic: interrupt-controller@10400000 {
-			compatible = "arm,gic-v3";
-			#address-cells = <0>;
-			#interrupt-cells = <3>;
-			interrupt-controller;
-			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
-			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clock_imem: clock-controller@10010000 {
+			compatible = "tesla,fsd-clock-imem";
+			reg = <0x0 0x10010000 0x0 0x3000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
+			clock-names = "fin_pll",
+				      "dout_cmu_imem_tcuclk",
+				      "dout_cmu_imem_aclk",
+				      "dout_cmu_imem_dmaclk";
+		};
+
+		timer@10040000 {
+			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
+			reg = <0x0 0x10040000 0x0 0x800>;
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+		};
+
+		watchdog_0: watchdog@100a0000 {
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			reg = <0x0 0x100a0000 0x0 0x100>;
+			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fin_pll>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
+
+		watchdog_1: watchdog@100b0000 {
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			reg = <0x0 0x100b0000 0x0 0x100>;
+			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fin_pll>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
+
+		watchdog_2: watchdog@100c0000 {
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
+			reg = <0x0 0x100c0000 0x0 0x100>;
+			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fin_pll>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
+
+		mdma0: dma-controller@10100000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0x10100000 0x0 0x1000>;
+			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&clock_imem IMEM_DMA0_IPCLKPORT_ACLK>;
+			clock-names = "apb_pclk";
+			iommus = <&smmu_imem 0x800 0x0>;
+		};
+
+		mdma1: dma-controller@10110000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0x10110000 0x0 0x1000>;
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&clock_imem IMEM_DMA1_IPCLKPORT_ACLK>;
+			clock-names = "apb_pclk";
+			iommus = <&smmu_imem 0x801 0x0>;
 		};
 
 		smmu_imem: iommu@10200000 {
@@ -400,6 +466,34 @@ smmu_imem: iommu@10200000 {
 				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_3 */
 		};
 
+		gic: interrupt-controller@10400000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
+			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pmu_system_controller: system-controller@11400000 {
+			compatible = "tesla,fsd-pmu", "samsung,exynos7-pmu", "syscon";
+			reg = <0x0 0x11400000 0x0 0x5000>;
+		};
+
+		pinctrl_pmu: pinctrl@114f0000 {
+			compatible = "tesla,fsd-pinctrl";
+			reg = <0x0 0x114f0000 0x0 0x1000>;
+		};
+
+		clock_cmu: clock-controller@11c10000 {
+			compatible = "tesla,fsd-clock-cmu";
+			reg = <0x0 0x11c10000 0x0 0x3000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>;
+			clock-names = "fin_pll";
+		};
+
 		smmu_isp: iommu@12100000 {
 			compatible = "arm,mmu-500";
 			reg = <0x0 0x12100000 0x0 0x10000>;
@@ -428,60 +522,6 @@ smmu_isp: iommu@12100000 {
 				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_7 */
 		};
 
-		smmu_peric: iommu@14900000 {
-			compatible = "arm,mmu-500";
-			reg = <0x0 0x14900000 0x0 0x10000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <5>;
-			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
-				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
-				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
-				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
-				     /* Performance counter interrupts */
-				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>, /* for PERIC */
-				     /* Per context non-secure context interrupts, 0-1 interrupts */
-				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
-				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
-		};
-
-		smmu_fsys0: iommu@15450000 {
-			compatible = "arm,mmu-500";
-			reg = <0x0 0x15450000 0x0 0x10000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <5>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
-				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
-				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
-				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
-				     /* Performance counter interrupts */
-				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, /* for FSYS0   */
-				     /* Per context non-secure context interrupts, 0-1 interrupts */
-				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
-				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
-		};
-
-		clock_imem: clock-controller@10010000 {
-			compatible = "tesla,fsd-clock-imem";
-			reg = <0x0 0x10010000 0x0 0x3000>;
-			#clock-cells = <1>;
-			clocks = <&fin_pll>,
-				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
-				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
-				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
-			clock-names = "fin_pll",
-				      "dout_cmu_imem_tcuclk",
-				      "dout_cmu_imem_aclk",
-				      "dout_cmu_imem_dmaclk";
-		};
-
-		clock_cmu: clock-controller@11c10000 {
-			compatible = "tesla,fsd-clock-cmu";
-			reg = <0x0 0x11c10000 0x0 0x3000>;
-			#clock-cells = <1>;
-			clocks = <&fin_pll>;
-			clock-names = "fin_pll";
-		};
-
 		clock_csi: clock-controller@12610000 {
 			compatible = "tesla,fsd-clock-cam_csi";
 			reg = <0x0 0x12610000 0x0 0x3000>;
@@ -503,6 +543,15 @@ clock_mfc: clock-controller@12810000 {
 			clock-names = "fin_pll";
 		};
 
+		mfc: mfc@12880000 {
+			compatible = "tesla,fsd-mfc";
+			reg = <0x0 0x12880000 0x0 0x10000>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_mfc MFC_MFC_IPCLKPORT_ACLK>;
+			clock-names = "mfc";
+			memory-region = <&mfc_left>;
+		};
+
 		clock_peric: clock-controller@14010000 {
 			compatible = "tesla,fsd-clock-peric";
 			reg = <0x0 0x14010000 0x0 0x3000>;
@@ -526,80 +575,191 @@ sysreg_peric: system-controller@14030000 {
 			reg = <0x0 0x14030000 0x0 0x1000>;
 		};
 
-		clock_fsys0: clock-controller@15010000 {
-			compatible = "tesla,fsd-clock-fsys0";
-			reg = <0x0 0x15010000 0x0 0x3000>;
+		m_can0: can@14088000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x14088000 0x0 0x0200>,
+			      <0x0 0x14080000 0x0 0x8000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			pinctrl-0 = <&m_can0_bus>;
+			pinctrl-names = "default";
+			clocks = <&clock_peric PERIC_MCAN0_IPCLKPORT_PCLK>,
+				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
+			status = "disabled";
+		};
+
+		m_can1: can@14098000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x14098000 0x0 0x0200>,
+			      <0x0 0x14090000 0x0 0x8000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			pinctrl-0 = <&m_can1_bus>;
+			pinctrl-names = "default";
+			clocks = <&clock_peric PERIC_MCAN1_IPCLKPORT_PCLK>,
+				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
+			status = "disabled";
+		};
+
+		m_can2: can@140a8000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x140a8000 0x0 0x0200>,
+			      <0x0 0x140a0000 0x0 0x8000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			pinctrl-0 = <&m_can2_bus>;
+			pinctrl-names = "default";
+			clocks = <&clock_peric PERIC_MCAN2_IPCLKPORT_PCLK>,
+				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
+			status = "disabled";
+		};
+
+		m_can3: can@140b8000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x140b8000 0x0 0x0200>,
+			      <0x0 0x140b0000 0x0 0x8000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			pinctrl-0 = <&m_can3_bus>;
+			pinctrl-names = "default";
+			clocks = <&clock_peric PERIC_MCAN3_IPCLKPORT_PCLK>,
+				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
+			status = "disabled";
+		};
+
+		i2s_0: i2s@140e0000 {
+			compatible = "tesla,fsd-i2s";
+			reg = <0x0 0x140e0000 0x0 0x100>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
+			dma-names = "tx", "rx", "tx-sec";
 			#clock-cells = <1>;
-			clocks = <&fin_pll>,
-				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
-				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
-				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
-			clock-names = "fin_pll",
-				      "dout_cmu_pll_shared0_div6",
-				      "dout_cmu_fsys0_shared1div4",
-				      "dout_cmu_fsys0_shared0div4";
+			clocks = <&clock_peric PERIC_PCLK_TDM0>,
+				 <&clock_peric PERIC_HCLK_TDM0>,
+				 <&clock_peric PERIC_HCLK_TDM0>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			pinctrl-0 = <&i2s0_bus>;
+			pinctrl-names = "default";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
 		};
 
-		sysreg_fsys0: system-controller@15030000 {
-			compatible = "tesla,fsd-fsys0-sysreg", "syscon";
-			reg = <0x0 0x15030000 0x0 0x1000>;
-		};
-
-		clock_fsys1: clock-controller@16810000 {
-			compatible = "tesla,fsd-clock-fsys1";
-			reg = <0x0 0x16810000 0x0 0x3000>;
+		i2s_1: i2s@140f0000 {
+			compatible = "tesla,fsd-i2s";
+			reg = <0x0 0x140f0000 0x0 0x100>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 17>, <&pdma1 16>, <&pdma1 15>;
+			dma-names = "tx", "rx", "tx-sec";
 			#clock-cells = <1>;
-			clocks = <&fin_pll>,
-				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
-				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
-			clock-names = "fin_pll",
-				      "dout_cmu_fsys1_shared0div8",
-				      "dout_cmu_fsys1_shared0div4";
+			clocks = <&clock_peric PERIC_PCLK_TDM1>,
+				 <&clock_peric PERIC_HCLK_TDM1>,
+				 <&clock_peric PERIC_HCLK_TDM1>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			pinctrl-0 = <&i2s1_bus>;
+			pinctrl-names = "default";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
 		};
 
-		sysreg_fsys1: system-controller@16830000 {
-			compatible = "tesla,fsd-fsys1-sysreg", "syscon";
-			reg = <0x0 0x16830000 0x0 0x1000>;
+		pwm_0: pwm@14100000 {
+			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
+			reg = <0x0 0x14100000 0x0 0x100>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+			#pwm-cells = <3>;
+			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
+			clock-names = "timers";
+
+			status = "disabled";
 		};
 
-		mdma0: dma-controller@10100000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0x10100000 0x0 0x1000>;
-			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			clocks = <&clock_imem IMEM_DMA0_IPCLKPORT_ACLK>;
-			clock-names = "apb_pclk";
-			iommus = <&smmu_imem 0x800 0x0>;
+		pwm_1: pwm@14110000 {
+			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
+			reg = <0x0 0x14110000 0x0 0x100>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+			#pwm-cells = <3>;
+			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
+			clock-names = "timers";
+
+			status = "disabled";
 		};
 
-		mdma1: dma-controller@10110000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0x10110000 0x0 0x1000>;
-			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			clocks = <&clock_imem IMEM_DMA1_IPCLKPORT_ACLK>;
-			clock-names = "apb_pclk";
-			iommus = <&smmu_imem 0x801 0x0>;
+		spi_0: spi@14140000 {
+			compatible = "tesla,fsd-spi";
+			reg = <0x0 0x14140000 0x0 0x100>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 4>, <&pdma1 5>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock_peric PERIC_PCLK_SPI0>,
+				 <&clock_peric PERIC_SCLK_SPI0>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
+			num-cs = <1>;
+			samsung,spi-src-clk = <0>;
+
+			status = "disabled";
 		};
 
-		pdma0: dma-controller@14280000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0x14280000 0x0 0x1000>;
-			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			clocks = <&clock_peric PERIC_DMA0_IPCLKPORT_ACLK>;
-			clock-names = "apb_pclk";
-			iommus = <&smmu_peric 0x2 0x0>;
+		spi_1: spi@14150000 {
+			compatible = "tesla,fsd-spi";
+			reg = <0x0 0x14150000 0x0 0x100>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 6>, <&pdma1 7>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock_peric PERIC_PCLK_SPI1>,
+				 <&clock_peric PERIC_SCLK_SPI1>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
+			num-cs = <1>;
+			samsung,spi-src-clk = <0>;
+
+			status = "disabled";
 		};
 
-		pdma1: dma-controller@14290000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x0 0x14290000 0x0 0x1000>;
-			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			clocks = <&clock_peric PERIC_DMA1_IPCLKPORT_ACLK>;
-			clock-names = "apb_pclk";
-			iommus = <&smmu_peric 0x1 0x0>;
+		spi_2: spi@14160000 {
+			compatible = "tesla,fsd-spi";
+			reg = <0x0 0x14160000 0x0 0x100>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 8>, <&pdma1 9>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock_peric PERIC_PCLK_SPI2>,
+				 <&clock_peric PERIC_SCLK_SPI2>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-0 = <&spi2_bus>;
+			pinctrl-names = "default";
+			num-cs = <1>;
+			samsung,spi-src-clk = <0>;
+
+			status = "disabled";
 		};
 
 		serial_0: serial@14180000 {
@@ -630,58 +790,10 @@ serial_1: serial@14190000 {
 			status = "disabled";
 		};
 
-		pmu_system_controller: system-controller@11400000 {
-			compatible = "tesla,fsd-pmu", "samsung,exynos7-pmu", "syscon";
-			reg = <0x0 0x11400000 0x0 0x5000>;
-		};
-
-		watchdog_0: watchdog@100a0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
-			reg = <0x0 0x100a0000 0x0 0x100>;
-			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
-		};
-
-		watchdog_1: watchdog@100b0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
-			reg = <0x0 0x100b0000 0x0 0x100>;
-			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
-		};
-
-		watchdog_2: watchdog@100c0000 {
-			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
-			reg = <0x0 0x100c0000 0x0 0x100>;
-			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
-			clocks = <&fin_pll>;
-			clock-names = "watchdog";
-		};
-
-		pwm_0: pwm@14100000 {
-			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
-			reg = <0x0 0x14100000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
-			#pwm-cells = <3>;
-			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
-			clock-names = "timers";
-
-			status = "disabled";
-		};
-
-		pwm_1: pwm@14110000 {
-			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
-			reg = <0x0 0x14110000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
-			#pwm-cells = <3>;
-			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
-			clock-names = "timers";
-
-			status = "disabled";
+		pinctrl_peric: pinctrl@141f0000 {
+			compatible = "tesla,fsd-pinctrl";
+			reg = <0x0 0x141f0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		hsi2c_0: i2c@14200000 {
@@ -796,218 +908,24 @@ hsi2c_7: i2c@14270000 {
 			status = "disabled";
 		};
 
-		i2s_0: i2s@140e0000 {
-			compatible = "tesla,fsd-i2s";
-			reg = <0x0 0x140e0000 0x0 0x100>;
-			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
-			dma-names = "tx", "rx", "tx-sec";
-			#clock-cells = <1>;
-			clocks = <&clock_peric PERIC_PCLK_TDM0>,
-				 <&clock_peric PERIC_HCLK_TDM0>,
-				 <&clock_peric PERIC_HCLK_TDM0>;
-			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&i2s0_bus>;
-			#sound-dai-cells = <1>;
-
-			status = "disabled";
+		pdma0: dma-controller@14280000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0x14280000 0x0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&clock_peric PERIC_DMA0_IPCLKPORT_ACLK>;
+			clock-names = "apb_pclk";
+			iommus = <&smmu_peric 0x2 0x0>;
 		};
 
-		i2s_1: i2s@140f0000 {
-			compatible = "tesla,fsd-i2s";
-			reg = <0x0 0x140f0000 0x0 0x100>;
-			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 17>, <&pdma1 16>, <&pdma1 15>;
-			dma-names = "tx", "rx", "tx-sec";
-			#clock-cells = <1>;
-			clocks = <&clock_peric PERIC_PCLK_TDM1>,
-				 <&clock_peric PERIC_HCLK_TDM1>,
-				 <&clock_peric PERIC_HCLK_TDM1>;
-			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&i2s1_bus>;
-			#sound-dai-cells = <1>;
-
-			status = "disabled";
-		};
-
-		pinctrl_pmu: pinctrl@114f0000 {
-			compatible = "tesla,fsd-pinctrl";
-			reg = <0x0 0x114f0000 0x0 0x1000>;
-		};
-
-		pinctrl_peric: pinctrl@141f0000 {
-			compatible = "tesla,fsd-pinctrl";
-			reg = <0x0 0x141f0000 0x0 0x1000>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pinctrl_fsys0: pinctrl@15020000 {
-			compatible = "tesla,fsd-pinctrl";
-			reg = <0x0 0x15020000 0x0 0x1000>;
-			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		m_can0: can@14088000 {
-			compatible = "bosch,m_can";
-			reg = <0x0 0x14088000 0x0 0x0200>,
-			      <0x0 0x14080000 0x0 0x8000>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&m_can0_bus>;
-			clocks = <&clock_peric PERIC_MCAN0_IPCLKPORT_PCLK>,
-				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
-
-			status = "disabled";
-		};
-
-		m_can1: can@14098000 {
-			compatible = "bosch,m_can";
-			reg = <0x0 0x14098000 0x0 0x0200>,
-			      <0x0 0x14090000 0x0 0x8000>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&m_can1_bus>;
-			clocks = <&clock_peric PERIC_MCAN1_IPCLKPORT_PCLK>,
-				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
-
-			status = "disabled";
-		};
-
-		m_can2: can@140a8000 {
-			compatible = "bosch,m_can";
-			reg = <0x0 0x140a8000 0x0 0x0200>,
-			      <0x0 0x140a0000 0x0 0x8000>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&m_can2_bus>;
-			clocks = <&clock_peric PERIC_MCAN2_IPCLKPORT_PCLK>,
-				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
-
-			status = "disabled";
-		};
-
-		m_can3: can@140b8000 {
-			compatible = "bosch,m_can";
-			reg = <0x0 0x140b8000 0x0 0x0200>,
-			      <0x0 0x140b0000 0x0 0x8000>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			pinctrl-names = "default";
-			pinctrl-0 = <&m_can3_bus>;
-			clocks = <&clock_peric PERIC_MCAN3_IPCLKPORT_PCLK>,
-				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
-
-			status = "disabled";
-		};
-
-		spi_0: spi@14140000 {
-			compatible = "tesla,fsd-spi";
-			reg = <0x0 0x14140000 0x0 0x100>;
-			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 4>, <&pdma1 5>;
-			dma-names = "tx", "rx";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clock_peric PERIC_PCLK_SPI0>,
-				 <&clock_peric PERIC_SCLK_SPI0>;
-			clock-names = "spi", "spi_busclk0";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi0_bus>;
-			num-cs = <1>;
-
-			status = "disabled";
-		};
-
-		spi_1: spi@14150000 {
-			compatible = "tesla,fsd-spi";
-			reg = <0x0 0x14150000 0x0 0x100>;
-			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 6>, <&pdma1 7>;
-			dma-names = "tx", "rx";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clock_peric PERIC_PCLK_SPI1>,
-				 <&clock_peric PERIC_SCLK_SPI1>;
-			clock-names = "spi", "spi_busclk0";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi1_bus>;
-			num-cs = <1>;
-
-			status = "disabled";
-		};
-
-		spi_2: spi@14160000 {
-			compatible = "tesla,fsd-spi";
-			reg = <0x0 0x14160000 0x0 0x100>;
-			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 8>, <&pdma1 9>;
-			dma-names = "tx", "rx";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&clock_peric PERIC_PCLK_SPI2>,
-				 <&clock_peric PERIC_SCLK_SPI2>;
-			clock-names = "spi", "spi_busclk0";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi2_bus>;
-			num-cs = <1>;
-
-			status = "disabled";
-		};
-
-		timer@10040000 {
-			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
-			reg = <0x0 0x10040000 0x0 0x800>;
-			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
-			clock-names = "fin_pll", "mct";
-		};
-
-		mfc: mfc@12880000 {
-			compatible = "tesla,fsd-mfc";
-			reg = <0x0 0x12880000 0x0 0x10000>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "mfc";
-			clocks = <&clock_mfc MFC_MFC_IPCLKPORT_ACLK>;
-			memory-region = <&mfc_left>;
+		pdma1: dma-controller@14290000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0x14290000 0x0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&clock_peric PERIC_DMA1_IPCLKPORT_ACLK>;
+			clock-names = "apb_pclk";
+			iommus = <&smmu_peric 0x1 0x0>;
 		};
 
 		ethernet1: ethernet@14300000 {
@@ -1041,6 +959,47 @@ ethernet1: ethernet@14300000 {
 			status = "disabled";
 		};
 
+		smmu_peric: iommu@14900000 {
+			compatible = "arm,mmu-500";
+			reg = <0x0 0x14900000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <5>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
+				     /* Performance counter interrupts */
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>, /* for PERIC */
+				     /* Per context non-secure context interrupts, 0-1 interrupts */
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
+		};
+
+		clock_fsys0: clock-controller@15010000 {
+			compatible = "tesla,fsd-clock-fsys0";
+			reg = <0x0 0x15010000 0x0 0x3000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
+			clock-names = "fin_pll",
+				      "dout_cmu_pll_shared0_div6",
+				      "dout_cmu_fsys0_shared1div4",
+				      "dout_cmu_fsys0_shared0div4";
+		};
+
+		pinctrl_fsys0: pinctrl@15020000 {
+			compatible = "tesla,fsd-pinctrl";
+			reg = <0x0 0x15020000 0x0 0x1000>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		sysreg_fsys0: system-controller@15030000 {
+			compatible = "tesla,fsd-fsys0-sysreg", "syscon";
+			reg = <0x0 0x15030000 0x0 0x1000>;
+		};
+
 		ufs: ufs@15120000 {
 			compatible = "tesla,fsd-ufs";
 			reg = <0x0 0x15120000 0x0 0x200>,  /* 0: HCI standard */
@@ -1091,6 +1050,47 @@ ethernet0: ethernet@15300000 {
 
 			status = "disabled";
 		};
+
+		smmu_fsys0: iommu@15450000 {
+			compatible = "arm,mmu-500";
+			reg = <0x0 0x15450000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <5>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>, /* Global secure fault */
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>, /* Global non-secure fault */
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* Combined secure interrupt */
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>, /* Combined non-secure interrupt */
+				     /* Performance counter interrupts */
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, /* for FSYS0   */
+				     /* Per context non-secure context interrupts, 0-1 interrupts */
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>, /* for CONTEXT_0 */
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>; /* for CONTEXT_1 */
+		};
+
+		clock_fsys1: clock-controller@16810000 {
+			compatible = "tesla,fsd-clock-fsys1";
+			reg = <0x0 0x16810000 0x0 0x3000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
+			clock-names = "fin_pll",
+				      "dout_cmu_fsys1_shared0div8",
+				      "dout_cmu_fsys1_shared0div4";
+		};
+
+		sysreg_fsys1: system-controller@16830000 {
+			compatible = "tesla,fsd-fsys1-sysreg", "syscon";
+			reg = <0x0 0x16830000 0x0 0x1000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 

-- 
2.53.0

