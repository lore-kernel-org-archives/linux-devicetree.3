Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385323A900B;
	Wed,  1 Apr 2026 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044583; cv=none; b=enj1CCo5LXyAZ4Opt9L63ltBQflwZgFkt4TvC0vHVdVUJBoyyze/cPfapaHBLCQHJx7d7J89akI3OKymgVItyz0j4QdX+CUuvtDSKe41ASGkoNf60wAkrVDFdakeFUeluLcGJ40mkGSwFVhiE2/Vze49iRaDfmFQEpWFKPuB8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044583; c=relaxed/simple;
	bh=j9Y5lagW9c6E0tLKDJu771yI3Xx/hWwk2CFYViM03sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyIh+x1/FG8MAXM+jB35pzZq9FaEiFKakfNM7Va/Vlgdx33xcU6v1QbKL+XO8kkx16222Ls8M+LyPRW6LTR28Lh8Wr0KtgGn6OQD4HlGkUe2ggwKNcXoLx1xwEORku6E+mcwnL8KD1VF8z7+9vetu3SyXq7xMpLt8uD522gpPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=P4ewEt+B; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="P4ewEt+B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+D4hABqFUbRdNjSEQsn4jZKGmlNzjCBJR8Je8rUoK/s=; b=P4ewEt+B/LuJEBDQdIFgnvUp5Y
	mCzEP9fzaPhVq0sBxjX70mUg02178W/mtNVjmKakPfdjvyiTUaAayYy9tzFXldc+Znodf6maAK4U2
	Zf2sHpvKSJE5UqqE5rW5r9tsF/aTMOVHq5RS9t2jqDLKkfxgEEdwbdLyxXpmEo6HbgPw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7uB3-00ELUx-GG; Wed, 01 Apr 2026 13:56:05 +0200
Date: Wed, 1 Apr 2026 13:56:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board
 support
Message-ID: <7c4791e9-6621-4afb-a166-55211b18fb08@lunn.ch>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-4-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401010707.2584962-4-dennis@ausil.us>

On Tue, Mar 31, 2026 at 08:07:07PM -0500, dennis@ausil.us wrote:
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

You said in patch 0/X that the Ethernet driver had just been
accepted. So i was expecting a node for it here?

	  Andrew
