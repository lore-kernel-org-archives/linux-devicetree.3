Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDE3890E3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043931; cv=none; b=CMwNJm4qdaGN2vgwoPDyjETTBXujSJB2vgE/Z4UFhKzHNSDLK0ep5CYxVYg1X3zw704n+ElTPQxakskVC8omnewi3srFLRccpQ2FULMj60z8t1Yf6uUrhIIkh9RRqCdQPcoyCm4BkanLil1TbOD22PrOeqH5Oym0OlxSdqduUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043931; c=relaxed/simple;
	bh=dEnljxo0cPfEBmMxWEU2YfmO6Q8TD6rHTlbi0qUFIBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoNIqrYt3j1gy+lQ99MySBc6BYptWFz98aNNsZ3sBAhwe6l0W2hd6eiyhg17xeAK6iUwKVC/cj2CFuhRw863FSRPiRlH7P+z2tdP8n71UzYjDEMYprb6u2b9LjVux9io8ccGr+Ij3gOKccErINrFMxdBaLhuKIA/T/u4KLj47h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvEGMl0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvEGMl0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658151F000E9;
	Tue, 18 Aug 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043929;
	bh=dEnljxo0cPfEBmMxWEU2YfmO6Q8TD6rHTlbi0qUFIBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvEGMl0iEuoU7p4cr7L3b2P1L5Oga5Jz0bPSjRk+B129D3GlF/EJOSQy8hsF8ceOG
	 3Zhcsd9yvDMlNQbhDM04tqbkyr7rtBcVy0bAz1vFmsKdLQUuWR083cbUh9MKq5zRIS
	 2dIu9TxTVVTeB6owTDMLeZ/PdeV+Spnx/QwixaQywUd3JNLfm+3iM/QzdHK+tQ9ZHX
	 bNjdXOmKL0yxMqgnOz9nJQFipsHowUBOLZeOxYzqoTH/dDQb0b/FpRqnEWDreP3vgi
	 5GpjM+jASM2mIvF3KDDdPswQPhb/r1sAXiAx5LmLCvfujTyT9ub7JlKSHdg4NG/rby
	 ukYvrQRtC2gWA==
Date: Tue, 18 Aug 2026 11:05:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
Message-ID: <20260818-idealistic-chivalrous-sawfish-08ddae@quoll>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>

On Sun, Aug 16, 2026 at 11:05:41AM -0300, Ma=C3=ADra Canal wrote:
> The BCM2835 PM block has exposed a reset line for the V3D block since
> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains

This is a reset provider driver, so not really relevant here. Driver
commit would be relevant if it was about consumer who implemented
undocumented ABI. I suggest to drop reference to driver and instead
describe the hardware.

> under a new binding."), which allows the GPU to be reset without
> power-cycling its domain. Document it so that the vc4 driver can use it to
> recover from a GPU hang.

Does every device have it? Cygnus as well?

Best regards,
Krzysztof

