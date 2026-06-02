Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D739E9AC
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434910; cv=none; b=OQzRpFUNOuDKFWbYjVg61PENGDdEqwNf+IynOJRDHKe0Dc2fN0vPvlLkRP+SfFoqe+lG4mdvs/Ys97UIuVN0dBUWvd2on/r17aiemW67T80XEfqBoo4RnNDLF7XUQb7WLIQDTT9bOXfOn/0ziohfJ1HmaBKOXDzlkmggkoeBem4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434910; c=relaxed/simple;
	bh=5QtRKEvEZ5Bf60CrCxskUNN1/J6Px2RBNt5WAwEJX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ife80SUwHqh6pipsii0TN0qoHUrh0knk76e3BMYDQDEJasB3bKQ9nd4KYcIDAE2h+MK8QOj8duRXsSdW5P+7HiB/yg5Fp7rcfE/hEtM7peAXDUvW7AJ0u/JOKKIc4l3g5GnYeYPvB1R7c6bExGSBHeYHXKoGXz3SavU9f4E0444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FBFaxcJR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FBFaxcJR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/iJeZb9oNPWz3PyEi83V5EoFNXaEIzYjGsqFLKQ9BMM=; b=FBFaxcJRQmwkFbEq2g6TCrkt+E
	p3gRcoQCeZdbKItWHJdn/9zi7Zl2u+d+28iAqh99y2HqkfjIYp5icBfHADdq/F4RKMiiuvdC2KKeL
	FFRiH1eyDyc7ziDYO2hHwc/ISSwoxIYddMz8H0x6HhSta23TYaqNltGfi863P2/7kq5WmE5nXHyiI
	dPDTNt7jn4VXeihPcKhFKB1LSKi4ng/KZgdTk7WCknNAyaZPMw1iyGcPUeIFf6IAMSFn+cKFwF53b
	2P5zEmnEHRQBqnR2c2nBT34fbw2YSLhi4TUb2XrNFXeZ3qWydMq62Pm6FPToLhYPv8788wjjIywGH
	fYP38jog==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Tobias Schramm <t.schramm@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro
Date: Tue,  2 Jun 2026 23:14:57 +0200
Message-ID: <178043489362.713702.703857469309199514.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519094439.7918-1-hugo@whynothugo.nl>
References: <20260519094439.7918-1-hugo@whynothugo.nl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 May 2026 11:44:39 +0200, Hugo Osvaldo Barrera wrote:
> The vcc_sdio regulator supports 1.8V to 3.4V output range according to
> its datasheet.
> 
> The current DT incorrectly limits the max voltage to 3.0V. This limit
> causes issues issues downstream with u-boot, which refuses to apply the
> out-of range value, and falls back to the minimum in that range: 1.8V.
> This is insufficient to power the SD card, so driver initialisation
> fails and booting from it does not work.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix vcc_sdio regulator max voltage on Pinebook Pro
      commit: 8545eda00fdf3d7e17933ce0f706d005b1bad42d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
