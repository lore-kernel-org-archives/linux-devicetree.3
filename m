Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873361;
	b=EKW6rpFoFIa7KK3mPhpvqmCRLx6Oz/B+Y2fPY8mHPxRut81RVL58qCVuJxKAf0luRinS
	 A5pEJOiEQxXrpxdSYyl+sPCjI9VIpP3LmSJ8W0ZL+ZC9VcOw3ZIj830HnOODh5MtI3vn3
	 IsuM/SXnxoe/IlEYtO2SaqRliUAxOz9kscxbNVkvIeWCbJ10qahgROwioj89KCRnNLBTz
	 CJCMMwVcb2FMKSIJn2vAveZKPWMS3BBW7t6XqnhrgPCCWrlwboXGr98fUyPzF4AzIA0BU
	 6e4taE+LR0VFjZ2xWOvzJ+jnSG6NTjRGN8dXu9mWjJffB4teNsfwSW7PhDgr+e3z+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
	b=A96FmcljNXGIIbeMZ2eutfiVIjZjEf6ij9in7Epf4GvcxsaOlK1SJapstaih4J1nU4zX
	 526CRD/P/azQ7nAQjA0Le/eKlUcbzf11e4K7bnFESID7TJBOfxd5vOFK89AC77IZ66PT9
	 hjaSv0RBQ/JuLMs3eA/IFyBJQEkQSJjl/jT7O56aZjhaLT8qFw591VTdA33q2ooNE/s0c
	 2dZQUsrkI8p8mou4mGnxuhImr+LhmR5iqX5xRtFA9Etcg8TEcyU9vXrUO9d3c9PJ9Nw0Y
	 ECXGFQhX0zNRNuzMmIPU/7hwtmZNKKVDMW6PsBcvUSZUmZEuWtf/ytRG8QDrpfm/UCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WqIcS2ud;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375260A262F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B375260A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WqIcS2ud
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so957679fac.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873359; x=1793478159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=WqIcS2udx/nWAIpBgI4vxk7+jeyYJyEKEUUbPHZMbidORpLmfX20J8MT5vR9cEYmT4
         eYotdEVxMHfsys/m8CK42JgjE5ZWjOIsOAaPlUyF3I2oX886MgwO9gBIUo6bfkL8GU+Q
         OJtQOwReWnUrS8H1JAOn6P9Pi2KLROVObWXr4er0eZ63hJmEhTjnkR/0V9EDOXAChfJ9
         Akq2ncoTCcS34x4OYOQB8ram7ZRRBO6PhTB7x0jeGl2U/evir3RLVFr+ZnrZ75gzMmSr
         dflm3u/d5s2sNKmJwzIcY5mS4EHWb1XkGpPp5qKURt35r3ULutEwG1h3VpxyZsAqtepz
         d4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873359; x=1793478159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=FxvtQ6kBvZwttolOtl69ha++4TjaIO6T63zUQEuxXX5fBIcDIAclskdqTZ7HTM/a4X
         Fcia5HOljdhjFFxOG01JQZ+iuRmdW7UrjjNzCXNrsadfrNWAad4Yy9Y4OkaNa/5Nwtr8
         mxNS1YQh2UvFlewQf6tHAjnSw0tWUfxOQGxeaMpVUrE/HZHbv4qytoePO4Iy3E+oNDOc
         tHp73hacXrM3uw5fso/lZkXoNT7h9sGsH2TwZjj9sOuqtjfPhYyYF/1z4nW2VEfFYyxd
         lLQw89skeRj6sMKtQIZivOg+LFTCW5V/Kz/3EBjNwzk6DXlAgDnVaQDbfzFPxxi1yOJ3
         YStQ==
X-Forwarded-Encrypted: i=1; AKwUvByYy9z8Jqin9SdJiYzVZ4L+IR58tLPcPEAPo0aHx7EOPDVcTCViF09EyLhSCK4VtOWYi8JMuOIukLfQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJCzaUerT+Ay7yfcbaLOP+15OqVSyLzoWofamGST8+naKqPAMji
	eSyMjZ8WDKYNFRwdOI5xBfUaJ+Qr7io6dDWIniDhPxB65LNZL6XUsiyomhGnu1Ji
X-Gm-Gg: AYBFou3uz8lOKX9Z9J5zn3P8LR8i1jyzap+knrJp4LljID6ZAzHYQ8ByiizY7Q4e3iq
	vWbYuMpnxOhaNV8siN8EE+0Ii4jg6w5iyCB6675igt/xDhlqr6wc0k/yZx3fs6PQnDTmGyvNhWA
	Ta1EVnw31H+5JX217n9kvRYtSlpKQNeyvKVkKWDWN3eSb3Bb3YtsqAuKLvHMF9NN/FwM8Ter8Qr
	j4dCOm4evL/8VXlh03NW04yE+4ADUn2m/KoArHMgPvhAMSoUUJ3g6BeA1aC/7rULXG5D9ptbtGi
	FTq0HqK6eyrvmxK17vh9BmaNRLX6O8EwFgZBuLCF3K33Aft23kLRmE1Bd4IFFxyL/vM+1kN8vqX
	kVUI+oguSxalsJzI0IFkRpZNsbUyk9C1j2NFixKkAvUduSaSNOGbsKd/g2E8ShziI012V7Rw5F/
	57u9gKA9Btt5ylgQB1gR88eNM7ffUZLdBRXoRvJ8sMsg3hh1thGCQeM2Nluu6FlBWRGVXZCZEYm
	L2HCqVGKZToYKOSqMuFMIFHMoFZLD1hlHlPrhcWvjqteKcWsHfrZZAWv7mM+X5BzLs+i6LBdxrg
	yiEbO4oJSA26dJoVcT8Kz7aZLE57187iJCi+raFt1MYB3Rq/lYBp3Kx+NOEgzVxcwFeiSmhoCf5
	Mo95G5UwA+2N22VDVClK5wDuS4aNVsnHYHZ8ZmwN7bOdYqbsolf8Xl2/SxXGnlkh0QtIDK3tnEx
	S3RsbMpXr2VkhaqaUGk29srloS
X-Received: by 2002:a05:6808:3099:b0:4c4:8ace:cce8 with SMTP id 5614622812f47-55bfff7e006mr2363837b6e.8.1792873359652;
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:26 -0600
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: describe the UART
 integration and FIFO size
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-4-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the H616 UART integration and describe its 256-byte transmit and
receive FIFOs on each of the six controllers. The specific compatible
selects the register layout and receive-trigger mapping, while fifo-size
provides the capacity that the component parameter register cannot report.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..a80f26ee0970 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,11 +538,12 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			dmas = <&dma 14>, <&dma 14>;
 			dma-names = "tx", "rx";
@@ -551,11 +552,12 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			dmas = <&dma 15>, <&dma 15>;
 			dma-names = "tx", "rx";
@@ -564,11 +566,12 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			dmas = <&dma 16>, <&dma 16>;
 			dma-names = "tx", "rx";
@@ -577,11 +580,12 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			dmas = <&dma 17>, <&dma 17>;
 			dma-names = "tx", "rx";
@@ -590,11 +594,12 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			dmas = <&dma 18>, <&dma 18>;
 			dma-names = "tx", "rx";
@@ -603,11 +608,12 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART5>;
 			dmas = <&dma 19>, <&dma 19>;
 			dma-names = "tx", "rx";

-- 
2.53.0

