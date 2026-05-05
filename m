Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205336215A;
	Tue,  5 May 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996489; cv=none; b=ELyE0D2qsw8Z3uuyIkQSrp7MbGtXGRpkzU1sg3eJ059TAwpZaqttYhHWbQ9vHzJV695M7BvkkwWgyKLmqbNFy7qQlmm7cShqp/DHhlhfJ7I0BhEGxIOxgnSudUoHYexCnXj7aMHywGAU7oaAYUUDiV15xibVMhQPIuvKADvWwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996489; c=relaxed/simple;
	bh=P6SRWiNsJJKPzOHupZ6B+PldPUa/tlznX5n+43KBw5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeGJIaJSoZAqSzSh27vRblJO52z+xRRLyoudgxvdM9oPUDcEGrUrpnjpCQEJSIUh3+15wIGxANDrk2dqx/aA8aFR59WZEO69ZetU1KNZBpf5e6eOE8AcDZQhu3/JFZFu1hOFavwFvpQnDgxI7s3GXB904oYj1DZIRdMTIxPlmmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUp3z0qy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUp3z0qy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE3DC2BCB4;
	Tue,  5 May 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777996489;
	bh=P6SRWiNsJJKPzOHupZ6B+PldPUa/tlznX5n+43KBw5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUp3z0qyR+A3/XJReUgF0Ci/eohQN7cEpBUMGdHD6uW5Hj01yySxN3k3arVuvGWGV
	 0y8rW7pN3rbBdKXtVF68DKWWUrH36NkzmaCgWzEw/TzcC04L/Q48vO++gNhIywb0lv
	 fGqX97mSXqkhd9qjcjnRNV9P4rk2XMGWIhSsNCsk00hgaEw7xtKKVdQcLlqLbAnPbp
	 6GaJC84wI1Dcqfy6hfXn5f8AruRWDCtKtLMrhC/Ao6gsc5cQkBD3fxZlYEv2N+EF4h
	 s0Qf2VJOGipLAs1Av/XlcSsSi3yYNWwtc6K/fwCq4mvzWHbspdGuStD33uD/ycPitV
	 GYFS5Y+r48pTw==
Date: Tue, 5 May 2026 10:54:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: drop tab characters from DTS examples
Message-ID: <177799648541.2995188.15815004166430967205.robh@kernel.org>
References: <cover.1777434096.git.daniel@makrotopia.org>
 <2044ee0cac191c7be8b6e989fc3c99b24aa4cc5e.1777434096.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2044ee0cac191c7be8b6e989fc3c99b24aa4cc5e.1777434096.git.daniel@makrotopia.org>


On Wed, 29 Apr 2026 04:48:56 +0100, Daniel Golle wrote:
> YAML literal block scalars cannot use tabs for indent.
> Replace tab separators (mostly between values and trailing /* ... */
> comments) with single spaces.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/i2c/opencores,i2c-ocores.yaml    |  8 ++---
>  .../bindings/iio/adc/st,spear600-adc.yaml     |  2 +-
>  .../devicetree/bindings/input/imx-keypad.yaml | 32 +++++++++----------
>  .../bindings/input/microchip,cap11xx.yaml     | 12 +++----
>  .../input/touchscreen/ti,ads7843.yaml         |  4 +--
>  .../devicetree/bindings/leds/leds-lp55xx.yaml |  2 +-
>  .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  2 +-
>  .../memory-controllers/nvidia,tegra20-mc.yaml |  4 +--
>  .../samsung,exynos5422-dmc.yaml               |  2 +-
>  .../bindings/pci/mediatek-pcie-mt7623.yaml    |  4 +--
>  .../bindings/pci/samsung,exynos-pcie.yaml     |  2 +-
>  .../bindings/sound/davinci-mcasp-audio.yaml   |  4 +--
>  .../bindings/sound/simple-card.yaml           |  6 ++--
>  .../devicetree/bindings/usb/ti,j721e-usb.yaml |  8 ++---
>  15 files changed, 47 insertions(+), 47 deletions(-)
> 

Applied, thanks!

