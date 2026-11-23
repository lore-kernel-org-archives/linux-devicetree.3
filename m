Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448159;
	b=CrNfzzocUGudbU/g1gKwcBrOLYFHBJ6qnx7bW5SqKtKwpoqjrurqg75ELeZ+QljPz/in
	 bW4jodTsRRv/d77OThKMZOf590ALQbLTK+Nmc1oRGG1CnW3dsacgfP5rEvffc7j//y0Qz
	 09T/+Ei8YAvCKw2fJnUFy9kyymIieBMSRxFORehzBzgEQCg3za6ISmd4r+ZvjU/JC39G0
	 fSvJm3AODMXqScu9m7MRc6J8/AmJtdhGUXdcCNiKxX31PJwKAiTkansEx1ik3IQ2Lvodu
	 /+fPLAVq8X081rjJRly36KL5L/crRqTykLylGXu6RS5FGW2GPbtDw9eB5zQkuOVj6pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
	b=mceSVw/x7JBrvbDQz4Ff2swgTh6eMizHl2mk8MTk8oYfTNwdw1dN85VVFBC5pwLkUwIt
	 DtcemCM6VU5MaKQykmrbX3X4RvMLIDaDErbMX9Op+ELpwCdeNalc06g04ma2rL2ZrDo07
	 82cqeBN4o0NuxgVVIjbtlvNiLIE/pX6zwuzo5c33M7xNWBg4PDALhbz0XrFHDH5SqxAQW
	 OKRMgrSCmG2cbdq3paNXunJg69FpbDCYC56SlV083O8/7U3BrPUAUo78ZfzAUVTCp/xGV
	 xGMNE0U8mgvPEYbT+FkSNCZ83U66wdg0+HQzWxbAxtxA48Dr7K0tt3hlJgnSrCeqwYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="v6+m/aL2";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E6606A688
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7E6606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=v6+m/aL2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso25587905e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795448157; x=1796052957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=v6+m/aL2/WbufFh0dUa0DVlunwQsl+tRHhNYaTNB4WDOs7VqAZ5RndLklBbQ8vwVyS
         QTO6jHYjuvcDRmbp5efUt/7MqgJboT6V2OIu+s1s2kHe/oJBSFacjvDQiHOFI/4iBMni
         3CD5Jbdp2y0Z2qhGr/KdN8GhCpTEW45LH5oZot6Tmrf2QBxbIMUmtExUNzqKb1FfZGgR
         +W/5SOGjs1S6qQAefI99NSQk8m0HVmxwDvyCT1nF/KrrrIwfR6ceR+9LZqhG4RaYAxMR
         DKeEuTP2sHBUTzf7N8gt7cx3WksxRrAKAEek5x6lvGrcksAmQGCIjh4D9/YFwAItgdVX
         /cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448157; x=1796052957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Bm8YhjZ0v5Wgz4QHj1tEV+DcKGiAEMpJ+IjKH6ZCa4=;
        b=WStzjjp3LUymUtVLUFqvbHdIX6Jwypn/pr6Xes2ycjItqNSh323p/LpNSBqL4ylKRg
         CILVdohkkt24eWUncyq2qRxerafi4rlus4EfJrrX83Eia9pWAXU4nLKDRYf7dDF9VpMO
         mCb5SwPRXtqz/5zviuX5C+k+lwIu8ipTuOnI+wQRO24OOk93u7lI7nAj63SKSjCInodu
         rX02y3W7spFdTzVsHMsJWfHktZPv9fMHAzSdIbiwkdKYWZqIKTajfrnAQwQVewLjBh+g
         oRBjsS+PwaZduG+0b9h6PfTRaQpqCo6nzi2lypep1j8NQIKZU0uBJYpnG9AKo8E3A1HS
         pYyQ==
X-Forwarded-Encrypted: i=1; AL+hErHDCTmgyJKJmRla79erh6T8XY1+tKE3xZPxjzzVc7p1qr3BI58qJjojvg5kbkevkyMdc1q4tTTvWHjf@vger.kernel.org
X-Gm-Message-State: APuU4Z9YnYAzQsIP/lJtR9mHkFGGwcJkb86oF8AXi/V8+ySimdVO17Cs
	nZocwOTPHj7lGp/Nec8ko6lC1be9idqpD/3KmbMWU8HLXqgKIRsep2Qq/0VpCvfiiX4=
X-Gm-Gg: AZFdTZcC+FO9wDHQXnAVDqxKnopNax9O0Yo/fH8AGdyeXhfGt/gDZX3fjeW2nSFES08
	JoId951t8WGWrIh2rYWNQ+NJfykSnTuSEMxcLEoRBxn9PDv3A3hrR+i48kiYUXlEJEA73qty6J3
	uFMrZNP0aYLVlcJV5MJx1+VVBxCJ++USrLAECuFdILEt2ZxlvTD5nI/41jF7qtf4xpfuZmzIwsy
	0fEbNyPBnFzJARAsobmxwcZ8vk7Q7Zxzb894BVt94eMo8fD9QhGv5IIIetZXzX0AEBJzgZqfsbt
	zTx1LTEvSfxu2B7dEUxEBASPrRbvWRNTq3LZd3GqdrXhwhSnjVnquqHrEptuL8QIngtIsQKKdut
	BLY7kS6C4+elTQK2iyENoXVYTbe9rFYwVy6BR8FI5VlzD2/sG4n+jzQcDzL+7dK1DzCr/hRNhtH
	m1GXquFImCrvtMiSrCkHYmxW9oinpjM5Vui7pM9369iKlGbi1+fyddGxumjytEvMKj7Bi5+dgoY
	7GFyyuiVUR/FhnibZ3scmYQ9oubXFgcmWMgPrQXnmsmK5fpV8fsX9j2w5bk9NHZoCST0ixvRX4E
	/Tv1lXyDKQVsNNGbVzlKLKvNR6q7YQ9/elhWP+8PMe3WBjbMchQs1xXi8Qbcz2PIqyN0ms2G3Fw
	svHrS4PTYQQ==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb887c33f7mr242774325e9.4.1795448157034;
        Mon, 23 Nov 2026 07:35:57 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm305917455e9.9.2026.11.23.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:56 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 23 Nov 2026 19:35:39 +0400
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
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
Message-Id: <20261123-rk3576-otp-cpuid-mac-v3-5-40c756dcf36f@flipper.net>
References: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
In-Reply-To: <20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=B51uTVva+acdeOakuNpTV/eDMYtXnyGK/UsKvNUIWqE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzxHq13EuasOKLxxHXhLcnC+Kr38/Iz1W+Eq/Fdidbd
 sMRptS7HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1oADDf1dB2d9yu7fbyiT9XO70gFkwc/vXlRfMBOtfnVWdOWMOhxjD/9IKLdX
 z4vqJtRflKjxyGLqVW3NEFnEfzwhIPPrvVNJ7dgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs, so that
the addresses can be derived from the device tree alone, whatever the
bootloader. Boards which store a MAC address of their own can override
the reference with a cell of their choosing.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6f9fd73d24d6..1f9441394a8c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,7 +2321,9 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
+					#nvmem-cell-cells = <1>;
 				};
 				cpub_leakage: cpub-leakage@1e {
 					reg = <0x1e 0x1>;

-- 
2.56.0

