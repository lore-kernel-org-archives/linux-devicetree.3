Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AFC4314A4;
	Tue,  7 Jul 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440236; cv=none; b=D40ji24XCf6bBmwysv3qSkHHP7oX71HM6nBw19keZs7Yp7JIhi17a31Y01xf9QJUOL+kG6YeW0ArIFCDF3tSbeVvYZR2ZDWGbDfAeoZBmZ5lcHZwJmDInxx5JqwG8ZwFAvyPnIKtZWNiWWRWooL4U+h4B3gcIhM/7sP7ICBtvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440236; c=relaxed/simple;
	bh=NPipGy9Lj0MVUNU2Z4ZRCKxuiH483jCxlUTMGCmfGdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSU6k/nqozYys7ktPRT28PWR3U4hC26+ndSWUsuTylHZKNUQ1zvl5Wy705AGHEn9PWPHW8G5wwfU+AaB58IKvfvmiS7r0o5Gl07P84opokrw6PxrBK28U4k6S1QyMgTWkFbMiNgXMORcAQ554Vz/PwBxlOl9UA6JZ1yNVFG1uPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFw4Yemr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFw4Yemr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EC71F000E9;
	Tue,  7 Jul 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440235;
	bh=VzanBIl/P1H1nynYPysN7FmIsOykUSWG68SMsrzYXo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFw4YemrE7yinlV44MlFnSxAJEvDkYWSz39aqURr3Pw93VpYqhat+Zr3Fpv/t1XRl
	 Cnki21bX11ijKnpEjr180jxDHaGknJ/t5H2omZrMqA51fBpuI9h44YxYtYTbiGfcYP
	 8r6+QswzKmaJ0KWKltlwKhpAJzsf/5lXVFSPNoQu/MLi8Fxwa4XbQNfz+4lLIu0vng
	 HoilOj7ZAWXnH3xLtbDPE30xpbCXl8/4LmXkEDiyFlK5OzXXDi6RvB+PI8a0vdBckb
	 KBBLdy0Pkj2F8Uzl5aweyNouhoO5IF8rHU0efLtDMSIQu7IkpTZHsW7uYoONDeYC0G
	 y4QAJvEKVFz2A==
Date: Tue, 7 Jul 2026 11:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260707160354.GB3176120-robh@kernel.org>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>

On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> 
> On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > This series adds initial device tree support for the Vicharak Axon
> > single-board computer, which is based on the Rockchip RK3588 SoC.
> > 
> > The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> > use cases. It ships with:
> > 
> >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> >   - RK806 PMIC providing all SoC power domains
> >   - eMMC 5.1 (on-board) and microSD slot
> >   - Gigabit Ethernet via RGMII (RTL8211F)
> >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> >   - SATA 3.0
> >   - USB 2.0 host ports (EHCI/OHCI)
> >   - NXP PCA9554 I/O expander for status LEDs
> >   - Haoyu HYM8563 RTC
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
>       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> [2/2] arm64: dts: rockchip: add Vicharak Axon board
>       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1

Both have issues and should be dropped.

Rob
