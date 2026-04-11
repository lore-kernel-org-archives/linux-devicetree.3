Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB32F851;
	Sat, 11 Apr 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775915911; cv=none; b=HN7BgQLkB6GD8cCXW9MFl+vd4CkjhqLr/iqUlt82MaQV6IYHIFleZnnbFFvH8w7bTpYIY7TfgABjwo4o0+TlU/O99vbvOlZKs/uCyEvvb4zS58AMhzraEATpaP60cQY7ftVnXvXnwJJFa1KAfM1vobTSYQluM+OYVr0rbNUY8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775915911; c=relaxed/simple;
	bh=XJVN1RE5cpLgCfJiaV7vU1X5RKb/6yX6+y+wQI0OJvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGjQLSAARXm8cuIlfFkV5gYEKG4JI7R91oS5l7CMLFeYz9QplOKU9S8sIxodrFgNBdl8h+krYoZtKm1i++QWwocIR/k7++k4Kclui6U/U6j64LhbVxzc3eUDlTZdd+nf/p04w6moDCYAt1n1/YZWtNDNKNiylx3EEajZqXoJBFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjc86yvN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjc86yvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A48EC4CEF7;
	Sat, 11 Apr 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775915910;
	bh=XJVN1RE5cpLgCfJiaV7vU1X5RKb/6yX6+y+wQI0OJvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjc86yvNDh3A5XDOg9evruqJgOKDxwQxWY/HLQJRQ/5R+p3HsUi8FF1Ns7W/IEDA4
	 Tw8Ld10WyHY3vYXoFJEIPeuWhy2k0mqQnGJx7uEKLaElvU+oCFMnDnZtQ4nRhKNKpR
	 Vbmt2NEjiGVJ9Lsng7/OU0uxyw5lIz8+ChH9CceQC9P6ez3ciEqFrosPSCgTJ/402p
	 q1uCTmbFct/ypcvsXhEM8B5b0RfVGm2MT/nF4erWDdrN1sDNeKXerYSvqYJPHZ0CvH
	 HkoFhK4bAKNa8V0fIeh4fQR3/M+ipohP1IfbSLnyRSANYFwq0cu7DKtaeNRrDUQq71
	 yCBTeODdAknkQ==
Date: Sat, 11 Apr 2026 15:58:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>, 
	Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board
 support
Message-ID: <20260411-practical-persimmon-foxhound-f5869d@quoll>
References: <20260411024743.195385-1-dennis@ausil.us>
 <20260411024743.195385-4-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411024743.195385-4-dennis@ausil.us>

On Fri, Apr 10, 2026 at 09:47:43PM -0500, dennis@ausil.us wrote:
> From: Dennis Gilmore <dennis@ausil.us>
> 
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> 
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven by a transparent LT8711UXD bridge that has firmware onboard and
>   needs no node defined.
> 
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-Pro.html
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../display/rockchip/rockchip,dw-dp.yaml      |   7 +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Didn't you already got this comment?

Best regards,
Krzysztof

