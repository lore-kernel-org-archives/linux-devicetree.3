Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF9B25783A;
	Fri,  3 Apr 2026 00:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177609; cv=none; b=gTaeatiH3uoHbdH7l92FcetH7+uLVWrOjSk6wVyc1/iG4s+Tkbua74uo94OCld2kH3K+K5EQrPVuYmpZY8+NfcrKCEPn5jSY47enbnAWJrxyPTSytB9uROa/RTPfGFsGO1lJHyHmRpVhpS3XO9EX0ZIHspPvU7V0j2N1LmWAgZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177609; c=relaxed/simple;
	bh=wlSvaR9gsWwy+Tjg77aQriQ0q5Yla3A3s5PZ9fma6WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmnc7ftFGiUuEPUTNXHV/X+Xr8oroancRRbv8ivaj2qYGqqherpJWGW2vDL2bhNlwkXfD3YjkJMODM7ZSn6CkaP6pyMOJm51MqdYd5qThUltAvj7O/wvuoVmfjpmJvq340ympLHJlmOc5whF7AQ8m6uNauQ3/AiIVgO6zDJWFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=K2xaUK9N; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="K2xaUK9N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=R/gbGmXT8G+ZNC4WOZV98syZMUVqLqbIohTb80/HY9c=; b=K2
	xaUK9NCidBxIhq4MBQyfiD9duhm5SufM2BFIUZeFRB8PBymzG9r0LIczZglK9WodAR/UyU9NhjAE7
	ECUtKxIYSvVH0BJamhsL+NI1lDOLZxft0hNk9bXUmKlXF4jThuCxs79Qcg/qelLkptQ0+iPIOgKqk
	X0It/l4/no9Dnk4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w8SmT-00Eaxu-P1; Fri, 03 Apr 2026 02:53:01 +0200
Date: Fri, 3 Apr 2026 02:53:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dennis Gilmore <dennis@ausil.us>
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
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
Message-ID: <b1ba2e70-4886-4d37-9c53-9045c3ad78df@lunn.ch>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-3-dennis@ausil.us>
 <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
 <CAABkxwvnv7i=xg53qu4JDapBs6ATaMGh9iXZfi+od=CCxRxQUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABkxwvnv7i=xg53qu4JDapBs6ATaMGh9iXZfi+od=CCxRxQUA@mail.gmail.com>

On Wed, Apr 01, 2026 at 08:27:30AM -0500, Dennis Gilmore wrote:
> Hi Andrew,
> 
> On Wed, Apr 1, 2026 at 6:52 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +&gmac1 {
> > > +     clock_in_out = "output";
> > > +     phy-handle = <&rgmii_phy1>;
> > > +     phy-mode = "rgmii-rxid";
> > > +     pinctrl-0 = <&gmac1_miim
> > > +                  &gmac1_tx_bus2
> > > +                  &gmac1_rx_bus2
> > > +                  &gmac1_rgmii_clk
> > > +                  &gmac1_rgmii_bus>;
> > > +     pinctrl-names = "default";
> > > +     tx_delay = <0x42>;
> >
> > phy-mode = "rgmii-rxid" means the PCB provides the 2ns delay for
> > TX. This is unlikely to be correct. Please try "rgmii-id" and delete
> > the tx_delay.
> 
> As I mentioned to you in v2 I do not have the affected hardware to
> test any changes. This patch is just moving the existing definition
> from the common dtsi to the two devices that  have gmac1 wired up. I
> am not comfortable making changes here that I can not verify if they
> work or not.

Yes, sorry.

Please add this to the commit message, so i don't make the same point
again.

	Andrew
