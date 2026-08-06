Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491ED347C6;
	Thu,  6 Aug 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019079; cv=none; b=i6/7vdC6P1Gg8pxmo2D280JR329F98mi74aR+GJEmElCKbe7KyNXn4NQv4La6LEvW3Lt+G/+UDsVSr9IEDjsekhmjg8gSmb1JlvSk4qgpUzT3rfyHhIZPDj7Ow1KOD+EDx4zIq0TZIJ3rOH9o1AL/ET23D96RFZF/wAgEjdIkus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019079; c=relaxed/simple;
	bh=bAhu8jcRGo2V+BH/fW3TUDPJrH1TRh51enHhhys7yo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0oLt7vM/9UlxWTUpIhjJklOAaoR2DxnaFQ6wdZXznDDFCQpnxME8t7MH4qVa+bQVXIlb8Bxii8IZ6SRBAsuAJMCq9Mct6F5ZCIr3d851nKqr/vypLPWUVULipxuthLSczUxYdvYrrzO+roW0RTr//33m0EFMxpvCYwPteUphG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnNqj02k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnNqj02k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8981F00A3A;
	Thu,  6 Aug 2026 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019077;
	bh=9rzab5dyBLJMBTo+zrGAVymob8Kz4AUzytsyKqua3g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnNqj02kW8yAutNbntTJT7zgNODw3cb002bCRgDg825bmvyoxo9NfrWpJlYoW0E56
	 KzZL/fKpbwe2Dw+EilTxlDf1QyXmzzyxtsupwbjD7C5+4rb0bw3cQ2LMF7oSAR01d5
	 Hxfhxz5FW7ypXF+5M3jLgzHLdbiGXLdGXKhg2ilETppm9ewEjuCaIS8/iCNgU3IF9C
	 WcXU6J1EbdR58b7keZKqxvKvRG3R+LSub1u9AczVxUKT/xI8291cYBoYCYhB8IZRFT
	 oH889NJcGoLuy0i1AFfuBmlJUivQuZcEQf93l8BxwYVVk/lzXX7hoXERLlCzj17rpR
	 5LTIeGVRTiXMg==
Date: Thu, 6 Aug 2026 13:24:33 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC
Message-ID: <20260806122433.GB2869284@google.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
 <20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
 <20260806120952.GA2869284@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806120952.GA2869284@google.com>

On Thu, 06 Aug 2026, Lee Jones wrote:

> /* Sashiko Automation: Issues Found (2 Findings) */
> 
> Please explain or fix these Sashiko reviews.

Also, please Cc: the MFD mailing list next time and you get these for free.

-- 
Lee Jones
