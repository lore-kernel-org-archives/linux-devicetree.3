Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571416;
	b=McN3d90CPranMMt+TT96J4BH9Ap5szt+TThom9wLKgeSw7uLkvmZbzfP/TAMiAoB09D/
	 AT3nWSBotao8D67imy3pFpR7o7czv05BW/ZNbJPMimTlwZ/AEBL74yiIXEv8KB5egDvWG
	 s3ipV+aMa73aBDJfG0OIZa48JAnoip9cFEncFwT6JILlY+PPJJV+7KYBoGEhtPnJvdyKI
	 mFZiYDklRGUSrx8Dt0RBq5cOCOFfPbF3LcF8aTQzfChHeqhubkupkXlkcaahwtDNwrrrY
	 cEgyGVxEKlhFbZMaH0Ves4w6Bload1w/vF03O4WE3JZo+hU2M9N8mwvgWVeDtiv9dHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571416;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=++gxowZjuidnt8oawi1XPPb3EzRSU9Uup7gItuTW2fc=;
	b=kw7/pgkLrbO4bdE2bgsPpJ7f57Q5ONDsQF2O/93hMDStYNNpUd/tAix60x571AIBjdqk
	 H3TLqIPrW6LCt9PksGQdAq2gaGcUBeQKJ/hj0MWnirf/oq6GwhQ1ftzoJhDbdVU6FpXJ0
	 xO+wwDeLe+gk532q5IXR/y12WkvcMPRPXOwsOI+wwtNyIOBHgZTRnKem2m7xZQGVJvhjC
	 cZgsBc80CpZZ6y3SdgyVPh10g1F1graiCrywWS+hqZDRKeW++4hOtj7iWd1mrE8+Ejq+L
	 vX0oQY1ZJd7HdjbQ5HGpRZzFmFDnyi6qGuWb3N91pcKGc9byaOMYFm0lccCqnhZ4Yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BUPR2I1t;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DB06072B28
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94DB06072B28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BUPR2I1t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=++gxowZjuidnt8oawi1XPPb3EzRSU9Uup7gItuTW2fc=; b=BUPR2I1tPRmcXg9xsEVZwH8Hi7
	hbDjQv5SgSwbtW/cfk25tdoCUxocfXzXx3s52kTMQlq6f/nzGbuNncYS4hxlh4TO51q4yqTQ4gq9w
	MF4RqAGqE1zMoMVEdQD8Sp+xnmOb+IhsaITigBEyCds6VITmSpB67SRGGeyuS1TZOvuvt6r4gzIn9
	bomBFeSDmQhk985WXVvkmKhgzalVMmc8AsMRTgdIhmbDtjfTUr4BvwzFYqSo+T/4osCDYKa8OGvw+
	EZasLkABz3gfT8EmzN4PKBwdTKDXhuaD9oumlfmYTl4xCA50xyzpHvV7oRRhgAy7/6SQPlbWzPZZ8
	iTKM3LpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and improvements
Date: Sun,  1 Nov 2026 23:16:31 +0100
Message-ID: <179357139329.4108484.8181627010588735275.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Wed, 14 Oct 2026 18:33:00 +0200, Joachim Eastwood wrote:
> This patch series contains a few fixes and miscellaneous improvements
> for the NanoPi 6 series of boards.
> 
> Patch 1 fixes the voltage range on the SDMMC regulator.
> Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
> Patch 3 adds an IIO HWMON device to monitor the input voltage.
> Patch 4 moves a regulator that only exist R6 boards to the correct dtsi.
> Patch 5-9 renames DT names to match the schematics signals/nets.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max voltage
      commit: bfec6462f52d507ed3e33a8c4adede1145ad9385
[2/9] arm64: dts: rockchip: rk3588s-nanopi: enable mmc-hs400 and add supplies
      commit: f49fd1a383e8434b4aac9bd3da54e494b5f1008b
[3/9] arm64: dts: rockchip: rk3588s-nanopi: add voltage iio-hwmon device
      commit: d57c7cf4dfcdb3ae16a57d9040d1feb0f405def9
[4/9] arm64: dts: rockchip: rk3588s-nanopi: move vcc_3v3_s0 to nanopi-r6
      commit: 40701510a5d315f0db6d2d854b9a7642f331f89f
[5/9] arm64: dts: rockchip: rk3588s-nanopi: rename sd power pin
      commit: 71b4ea97eced8d4f3f348bccae1bb407a3e65eee
[6/9] arm64: dts: rockchip: rk3588s-nanopi: rename usb host power pin
      commit: e50bd653adc33c17a85a464d289477fa81bbfaac
[7/9] arm64: dts: rockchip: rk3588s-nanopi: rename gmac1 reset pin
      commit: a86f4448a3f8edb73b07ab473169e7327cba7294
[8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power pin
      commit: 4793b1de2ea0390e0b5698a15e877476a8a9cee8
[9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power rail
      commit: cf63be594dfbf99c159135cb04c60e7f4f574d00

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
