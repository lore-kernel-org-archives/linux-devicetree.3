Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713789;
	b=VoAKkJIWJ1jhALsVRHp+xeohARtVXfAHHoH3m+KYeQk/cf17/u8BpgL/O02JtCFaolua
	 FFMz2Z4HfaAhrGXiFCAQr+kdYsYuYj50iqDCpV6Z2zzMtAE+IWpCyBQqw7RsT8KYxoKhA
	 KtfIgpBLqq+B77lQXSZrheHPWFZthYVv9YZ98dNRzzvox17jZQi+gTAJ+c/sbSfurjdXa
	 O0+moG8Mb1DfG6HqR5Lty07JN5L7Rs4hiKdo+96CRwiEOXio3+ITCxFwoEWZeW+fjvHHM
	 taH1X6vP6NI06YFDPcSmwrFRv706lf14PrbBYYdqyvDrcu63tfI7ZmLieaZsCr4r5SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713789;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dLkNPiv/xl+P6umWyR3G+hlZbr8X7kcPVrM7p4myao0=;
	b=POQd/lswOBPDZt7wc/P17S2L0hg4n3gDMVput1Mpo7+HhcJzpQuzlq9NaXpM/44GBQrs
	 4H87oZDXX+QfMAQLaOnhj/2GPdpctQ5RpzWQiTHcrKKzT0K02pk5BqDJOaoSxVHlCt4hQ
	 VZc/zsHZTzdYsXV7JrvSzTSmVG5YchqDGUj2NuW9u5ZNLRoNE/vATeD7zBW1EbzPe2H8/
	 /aX5m5B4s0+l09uI+dh5e3cQtm5UGOp98CrHW+zaoaKyWSgQRjN9Q/bxywk2SFiDWrAU9
	 j2QI9qZLPH2EslqRFGyaCEqdUsyg3icSBq+g/5PcP3z/eDwXhp3r5aXet+dzqz3jQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A6Fv5VIS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E92F606A326;
	Thu, 26 Nov 2026 17:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E92F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A6Fv5VIS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7861C2B;
	Thu, 26 Nov 2026 09:23:05 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91FDC3F632;
	Thu, 26 Nov 2026 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713787; bh=UW0HYlQy3YHqOrhT+H8MjwdGt+BCMyK7r7KTgbmojD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6Fv5VISVzg+Oz5+JGSGNdmUl7cufPYWJW2/p60njZlDwyLdfcAucKu3i5pxV4rDb
	 CZ8LD3C1SsKElpB2x4pUBQUPPLI4WQYqFV7fp2MHUkunbuLhlRCO8w300sK10CcmTY
	 wOXWtcKlEeZ5e1YNlelDHmD9us4YyLOpxwNhkYlE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: a733: add r_i2c1 pins
Date: Thu, 26 Nov 2026 17:22:52 +0000
Message-ID: <20261126172253.1097838-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126172253.1097838-1-andre.przywara@arm.com>
References: <20261126172253.1097838-1-andre.przywara@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa Cubie A7A board connects an external RTC chip to the R_I2C1
pins (S_TWI1 in the schematic).
Add the pinctrl subnode to the secondary GPIO controller, to allow using
those pins in a board .dts.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 8a258f16751e6..fe1abee701310 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -585,6 +585,13 @@ r_i2c0_pl_pins: r-i2c0-pl-pins {
 				function = "r_i2c0";
 				allwinner,pinmux = <2>;
 			};
+
+			/omit-if-no-ref/
+			r_i2c1_pl_pins: r-i2c1-pl-pins {
+				pins = "PL12", "PL13";
+				function = "r_i2c1";
+				allwinner,pinmux = <3>;
+			};
 		};
 
 		r_uart0: serial@7080000 {
-- 
2.43.0

