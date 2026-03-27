Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DE39B951;
	Fri, 27 Mar 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614197; cv=none; b=GQ/QL2ubNRBzOXGrFF05gmWUQDuYE15POTiRF5NOwiDdR7oul026q/2eqeMH8mvINWbnmJ9oWzm7qy1S3IUPyjB3YsGcjR9xnA7bxW4Eq//p758EDE3CI3wAwagOEfC7PlJWiKJ9+rPOsjEmcKpwBc7zqnZamymXGFeR+Avsqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614197; c=relaxed/simple;
	bh=CJoM41RIdomZjOQkOvqIBYQibew3VsvPpJ0ZrCY3KO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9TNXPLUXQ3JfEFKAI6Qxp/2LPTLOw/uwkx2LToNGjnUu8fDRtVRbQcpW7BuEAcjEr9uypywckvHWRss+x57PLMr18c6J4GP3Kd2prJ4P/U8SLBBaUlBXaqgX0H1I3RWtTwRt8aJzsM+PuM2dxBzSYRSC2Fg8NiQpeNjZWwrc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Bu8wuiHG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Bu8wuiHG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w1rdzzunSchyQ3T4E1DcyZcD1R+I0Ejy9cW//FTvuag=; b=Bu8wuiHGz+wXebcfkw0D4AyHSm
	5MpNsVItDtU8PvajKceX4scCsH0RX7JPSv6dZ7vXu5Nh2tl0NMcL4QodLfNkLIKZYMfNblzGv6grR
	J6gK46u6PPLOVI6Aa0eNk/GmKEsGqwAl5A3g6D1Nqb+VEuOLaU6QzR2LS/xXK6tG6uxU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w66DR-00DecS-5X; Fri, 27 Mar 2026 13:23:05 +0100
Date: Fri, 27 Mar 2026 13:23:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert
 armada-380-mpcore-soc-ctrl to DT Schema
Message-ID: <cfe455ed-990b-4097-a53c-641282071480@lunn.ch>
References: <20260327114653.593582-1-padmashreess2006@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327114653.593582-1-padmashreess2006@gmail.com>

On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> Convert armada-380-mpcore-soc-ctrl to DT schema

You have already been asked once to slow down. Please don't ignore
Reviewers/Maintainer comments.

Please don't post new versions of a patch within 24 hours. And 24
hours can be too fast, particularly at the weekend.

> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---

Here, under the --- you should indicate what changed since the last
version of the patch.

	Andrew
