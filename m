Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FC1C5D59;
	Thu,  6 Aug 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031822; cv=none; b=YIw7zJlqw3sAermEIVshP6kHxwo4KQQ8ZIAXP6TFANV8BkdsUVZ3LWNq8usEXDVMkcQ49oKE77WpADkOJ4shqPo6T31MxOzKGNcQoMfxFiuOXnGy7q4FF8OXfbWwjr0PZfFbfVcM6wnGXe5DzeZVSkfvMaJf1KDr09L0hfWSYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031822; c=relaxed/simple;
	bh=bFFnoiobBKVyuNZ+m4G7xjmeqhICpTklxvC92YBlj6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icGvxLOgV+EbRMHQ9hNSGo/6i62e+CpdWHskSN3f7BNk0e9Y3gcWUxZGAyeLIHMbkX68fxnJ00j1hVUEVKyuLV5U6r53hToexMvqh6BnFEWC1P/LHtb51YK4v1KBmYNT+wzhZJg378B8RdolYpk5xVD89mPlISW7CQlxugS4qX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM8CzvZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM8CzvZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372BF1F000E9;
	Thu,  6 Aug 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786031817;
	bh=pjRHKsliqvvLYwqfQ+GA2Px/s3f/hlLeRUQ/A/a3Vhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM8CzvZL1kM8bogCR4THoedGsE0LsrmHOW+9scLTFef8/T7iNfbQbqgwneQlJrmVb
	 zwDA/h8baSVPt2RNqX39wKuflTMuCV7OidrA01gdihp3LswRdZ7e+J5VEwE/nNb32j
	 B5uTIT+0mN7qqbN+Sg5xFSbj/4/5/UpX8PJQmbiID9wudtYkOuu71mfSYwjGdKy508
	 r3gSTDHRJgOkLV1tKT5/fE6Dy1EeShHego3b067oJpOC1sph9rk9odxLj2/cTaWJye
	 +PK4PYBpH9fbPU7d0IkzyCPiCRWtpDcphDgFnF1qfCmWTBVy7uwOMJXI+NIMpixzBY
	 6DZ7QBk91fWrw==
Date: Thu, 6 Aug 2026 21:26:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: jason98166@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Message-ID: <anSuxfeitSqmSHNr@vaman>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
 <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com>

On 03-08-26, 13:17, Michael Riesch wrote:

> > +      Two cells select the PHY type and the direction, so that the
> > +      transmitter (DSI) and the receiver (CSI) can be described as
> > +      independent consumers of the same PHY:
> > +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
> > +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
> 
> How is that Rockchip specific? As you state above this is either MIPI
> CSI or MIPI DSI, two perfectly standard protocols.
> 
> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

I think yes...

-- 
~Vinod
