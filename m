Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270D35C1BC;
	Sun, 10 May 2026 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778398383; cv=none; b=Ts6Mk6kHNJ726NTi84KHjsNCJXNdFEXwAnXICdZlS1hCa22q6WPDhZSgjMfecdv23Q+uhrYhqFytM7E6VPXu/MhhFJHlgdn6zWthJU3Nyf6oUWxtqzKRn44svG/p84pIKP5nEMnva+S2hCT7BnrZs96Y9Z2VZGwHboh4xAz/YWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778398383; c=relaxed/simple;
	bh=C5SWgmyd3p/JbXe/hJzJcoVgQTuM5eiVn5t8MpCXkAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akRY921MHOT8CgPooNQkQ30lfWu+FZGXgGqfF1AAbXjPiDZEGIdol97uw5aII3Kk/t8jtpWt4QmVXryg4oFA0t0dvZRxMK4hseooyjzl4yUtpIZ9gS/AERs1HsDAnUqa6wFYsRW9Bh5tL72fvsW2hF7ljPUpbV48BxhwZMBZvH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeDmc2U3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeDmc2U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE93C2BCB8;
	Sun, 10 May 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778398382;
	bh=C5SWgmyd3p/JbXe/hJzJcoVgQTuM5eiVn5t8MpCXkAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeDmc2U313JxDmIy7pAMv8WvsQDMPnypLTpuLxlqXZbTJci7+8m5Tb6IunjOLRt1/
	 CSxjLqMyrCDEGVLanta3FLe77aH8DgZ0bjIWHm49SZoqX7C/moS3675Z2R5obt+QlX
	 PWGXnvAToiQ8ZT9mp7Vpt6WANglTtwI1AXdL882iSg2Rrgh1h2lsm4N12ZGjwhStil
	 w7Sa1jDGNJI/4jU3rOcnmxI2Ud50QyrZGcJBwvZ6OOTVPHz+aP5DIECN8SsXvBjFtq
	 u0r7SvzT3EONCMfCc3oOxeA2Dq/zhGx3191MfpFxsftfwBDx2EUDhbF5prmQP+AR8X
	 UswgkjZ+8riTA==
Date: Sun, 10 May 2026 13:02:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v4 00/16] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Message-ID: <agA0qhQakjlqvl2x@vaman>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <afd8xMS2hz208Lcl@vaman>
 <6960660.0VBMTVartN@phil>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6960660.0VBMTVartN@phil>


Hi Heiko,

On 03-05-26, 21:12, Heiko Stuebner wrote:
> Hi Vinod,
> 
> Am Sonntag, 3. Mai 2026, 18:50:12 Mitteleuropäische Sommerzeit schrieb Vinod Koul:
> > Hi Sebastian,
> > 
> > On 28-04-26, 18:13, Sebastian Reichel wrote:
> > > This series overhauls the Rockchip USBDP driver; apart from a
> > > a bunch of cleanups and small improvements the main goal is to
> > > get the driver ready for proper USB-C DP AltMode support.
> > > 
> > > Once this series has landed, it unblocks enabling proper USB-C
> > > DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
> > > for the Synopsys DesignWare DisplayPort controller.
> > > 
> > > Apart from this series, further changes are required on the
> > > DRM side. There are no compile-time dependencies between the
> > > DRM side and the PHY side, but the PHY side must be applied
> > > to avoid SErrors once runtime PM is added to the DisplayPort
> > > controller driver. Thus it would be really good to land this
> > > series in the next merge window.
> > 
> > Looks like sasiko has flagged 8 high warning, can you please check them
> 
> (1) as mentioned in a different patch thread, review should be happening
> on the lists. Tools regularly dump old results, so anyone looking at the
> mailinglist thread might now be able to follow along with what happened
> in 2 months or so.
> 
> Also other robot tools can reply on the lists just fine.

It was not available in past, have enabled email reply as that is best
way for us. It should happen going forward

> (2) if 1. is so hugely impossible, please at least provide some reference
> to what you mean. Not everybody knows all the hype-tools-of-the-week and
> simply searching for that mysterious "sasiko" [0] did not provide any
> meaningful results for me, despite some amazon or youtube links for some
> non-kernel uses of that term ;-)

I am surprised that the hype of the week seems to missing for you or
Sebastian as Sashiko has been, IMO covered quite well. Instead of a random
web search I would have looked at lwn [1], [2].

> So a link should be present at least please.

Agree, I have sent to people who I thought might not be aware. I guess
better to not assume. In any case here are the comments, which maybe
valid or maybe not. As usual with tools we should use our discretion
https://sashiko.dev/#/patchset/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22%40collabora.com

[1]: https://lwn.net/Articles/1063292/
[2]: https://lwn.net/Articles/1063303/

-- 
~Vinod
