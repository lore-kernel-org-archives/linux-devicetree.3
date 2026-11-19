Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119121;
	b=vjfcaB1hCb9wbEoZuLgqu92yGnagwX6wTytuJvEYmcqCljKm4JtPc+feIlW8tM5WHRi/
	 h9OdjGzPOSzDteTD2jmyWb+Cbl+kzM7aKOhehjDHsJCLRgn42Ti/kVy4PbgRr0H6+ZS/4
	 kW2lmg/XQ2EOxrX67NDe9ORVzLGiCVBkxrZgjtduVlxdcSk9TSOklgZTc1TzfxPJCcv0Z
	 lLVbIF+MsWZHwMZ7EkM2KFvGnnX535/Gi0qAFiT61FU3nUUFouNGJvO6agVelGS7dzaBo
	 oop55vPgfCt9twv06+EtLlZop7tqG+DQ3x94udQFMudRe3ZvwyJe6P0SCH4nS4sawfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JRiXSzKdZEs95dB2xy83AEgzyg8HWiseFtrop6xYz5k=;
	b=lpj1k/iqUCqmNbahZGXzFkdRfbLgQselT9AEGAZGliDDnB3fPdH1tvSlnYvpZgkxjwE3
	 rkzJpdg1VDsDB0ul5OmdOclofNp36Mvbn9RAXjWZqgdc4TEO8WO1+y3UuRXzctOyeZsmZ
	 0BKZSGOsX7RPKDNuWP7QD4IqvQ8PnllsMz5ssrXZjSYbCdPhHN0IYVhY3XOX2MczxrCwK
	 k2tKweSqUUM/dJimGSTwToB+1qlvIIKxpIt+fFiTuiBOVMcP4ZWx4onyJ1Np5HkhgGFON
	 zdZ9ItERLCIO7hN7R13b3BQo2Eco/4/FuulvsPa8EIkPwE8SxJX1Z5doFyIbkY2SAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArqVKdJd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7260A2610;
	Thu, 19 Nov 2026 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArqVKdJd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721151F000C6;
	Thu, 19 Nov 2026 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119120;
	bh=JRiXSzKdZEs95dB2xy83AEgzyg8HWiseFtrop6xYz5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ArqVKdJdIwlCt6LuAiYalWgoC5nt+pwnUyqBNjjzPxY2S+39KWDXBCywNORfAhBHX
	 3qT9XSd+bwX96kE4oNk/PmUJ7/gvfz62zf4EGgtc42ZDdL9hPO3H20Oi32DVMQOKvn
	 5C64RPe33gSpl4cJn5UK6C2xTxutPUv4XdCcAN6QhlhEVvphWRHe3V9INFELigO0jF
	 CvgxEDH2yNtqlCIbhWQkp+VCdC9ZI+YIyp5/8jMxmMjVz8mNdCS9MBiyu0lG2Igz5o
	 b4x3ee86/EnfpyavYlf4TzEXpNAP0oyzMduAz4MgHbjDbw2Ay6DIzLF0chWrLzWL1o
	 FoCnpRqLg6ZeA==
Date: Thu, 19 Nov 2026 14:11:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] of: overlay: fix device_node leak when attaching node to
 changeset fails
Message-ID: <179511865293.69428.941600845556456809.robh@kernel.org>
References: <20261025180237.445403-1-mashikiselby@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025180237.445403-1-mashikiselby@gmail.com>


On Sun, 25 Oct 2026 20:02:37 +0200, Selby Mashiki wrote:
> In add_changeset_node(), when creating a new target child node via
> __of_node_dup(), tchild is initialized with a reference count of 1. If
> of_changeset_attach_node() subsequently fails, add_changeset_node()
> returns the error without calling of_node_put(tchild), leaking the
> allocated device_node.
> 
> Furthermore, because OF_OVERLAY is set on tchild before
> of_changeset_attach_node() is called, calling of_node_put(tchild) when
> tchild was never added to the changeset (and thus never had
> OF_OVERLAY_FREE_CSET set by __of_changeset_entry_destroy()) would cause
> of_node_release() to log a premature refcount zero error and skip
> freeing the node.
> 
> Move of_node_set_flag(tchild, OF_OVERLAY) after
> of_changeset_attach_node() succeeds and call of_node_put(tchild) on the
> failure path, matching of_changeset_create_node().
> 
> Fixes: 7c528e457d53 ("of: overlay: add missing of_node_put() after add new node to changeset")
> Fixes: 144552c78692 ("of: overlay: add tests to validate kfrees from overlay removal")

These don't look right to me, so I dropped them.

> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
> ---
>  drivers/of/overlay.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Applied, thanks!

