Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40A1DFFB;
	Mon,  3 Aug 2026 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785794770; cv=none; b=rLtliQVQzkV6ss7h6Agci8lACf+PwWnwyGDcwVjtw2rAk/lNrnlBIMsDZ3Ja5wFmbVMsxhJYmXbI3m3vQ4yt83zHIfqTRrWkL0ZGsYEVhk7QQmRsjY6evkA43Rb5zWQzJ3Dh0iBKUuWwnZRX8WXkgKwkxcgAY33dwRtlxUZT05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785794770; c=relaxed/simple;
	bh=+tWvhCxamNHHepMqdA4f3GmxUpmlmmhfeBeuCH+uhp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6xAgLREb1QX06X4CsT6BgTpvJuv47Etz/fKGHZCQ+8XurSLHYTGazBInkPKOeSweNXp764OmyNglMUB3ENGxmG6F+gJqgn2njOdnqYUf9CWHr7AWFRi4uXNHaniUtprqMBsKA3x70urzcrfjMLyYC/3/QhPJijw3t4lIBTSujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWAOFVo7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWAOFVo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493B31F000E9;
	Mon,  3 Aug 2026 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785794769;
	bh=GNpVB9TiMkfqXYfMtZWD/jFPAnlL0UPTTQuPL7Bvh0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWAOFVo7lYy0zATMl+5Rh86b16GBP0ICp2fkxpnR255ptR6bWgWZLIQ1cKVrj9WKy
	 ii5F4RQNnkmm4OcPwy81WMEgTJVfVBc6UmHiXRUBwNsgTar5kRkor2DtxZd8jjnH9S
	 cLKpUuPoRk/q8xAa3zqwfIWjkkHJVK568RrX/jauACPqpWZepNKudIAg8ulGfEB695
	 jZBdyam4+yzgF7uo/q2pMUUXTu8mEZhfHbPELnkFyNtUxlQ9rDbKrJUO+zDrfXM7dI
	 gvveCZv9swKBGKik1Vd+RwmqVBL/aCCes2R5Vg06kDq4hMs3+RKITt6lgd/vEJoude
	 /PcfNLSK3WTlA==
Date: Mon, 3 Aug 2026 17:06:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: goledhruva@gmail.com, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, simona.toaca@nxp.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, daniel.baluta@gmail.com,
	Tony Lindgren <tony@atomide.com>, m-chawdhry@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] regulator: dt-bindings: ti,pbias-omap: Convert to DT
 schema
Message-ID: <178579476822.707411.7827997651939877398.robh@kernel.org>
References: <20260729-ti-pbias-omap-v3-1-20fcc0bdc890@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-ti-pbias-omap-v3-1-20fcc0bdc890@gmail.com>


On Wed, 29 Jul 2026 12:37:55 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments PBIAS internal regulator from text to DT
> schema. Since all in tree DT uses SoC specific compatible along with
> "ti,pbias-omap" Convert compatible property to require the two-string
> form.
> Add child regulator nodes as property as they are fixed and node
> name is matched by driver.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v3:
> - Fixed typo in subject
> - Removed unnecessary full stop
> - Added explaination for compatible changes
> - Removed exact matching of regulator-name as only node name is matched
> - Added additionalProperties instead of unevaluated as binding doesnt
>   $ref anything
> - Dropped unused lables
> - Link to v2: https://lore.kernel.org/r/20260722-ti-pbias-omap-v2-1-e26fbd476e6e@gmail.com
> 
> Changes in v2:
> - remove top level $ref: regulator.yaml#
> - update schema to support OMAP3 SoCs to have both MMC and
>   SIM PBIAS regulators
> - Link to v1: https://lore.kernel.org/r/20260717-ti-pbias-omap-v1-1-527848131801@gmail.com
> ---
>  .../bindings/regulator/pbias-regulator.txt         |  32 -----
>  .../bindings/regulator/ti,pbias-omap.yaml          | 137 +++++++++++++++++++++
>  2 files changed, 137 insertions(+), 32 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

