Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B644418F0;
	Wed,  3 Jun 2026 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780524981; cv=none; b=bUTID7nC4O5EztJQ+YotwVXHFI0fSIsFrCmCHMwoAgxAUwOtDjYa/JM4yvzyRWQz6LT305cDHktkWiqOU8wgL1+Ld32QvNRSF/n7fHZ4ZSaBhkvhnmUBQqTEy2wKoCZHPEso6j35MYkppF1qx2rjpWi8QO9TxidaypZ/1jl7AD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780524981; c=relaxed/simple;
	bh=d3VBeVdqUY/TUKC7Js/J2pgUgIrcVXMP25at5qwebDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7v1etbRaSnbcXVeQD2vwxFkq9birHCjJWhVrxt5IVLQ1gaB8jbPGfXoc9BnQFaH2JTsecgCS1t76wDT0zAhWD1CtQfXip2bKob7f0SlDPT+dCU/37966AuNjMz7ycPLqDfUQygFcYzk6lbN/+wVI+mfWw7jATzWXMCHYJRz1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd76xREX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd76xREX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4ED1F00893;
	Wed,  3 Jun 2026 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780524978;
	bh=X+HV04raXlvxJwxIdo7DIUM+tiAtWUkqR65/36k5Njk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fd76xREXnT+ksjsTuPtPn9nd59egPxF3p5jKiCXgHTv0+7+CsdkYRbraVUOiq9Imc
	 OXFLH6lFovOE+jn+4Aihz7upI+4NeiyeDfgV9M0UtFkC12E67BkSaxLAudNtyqPq82
	 jf4StGwesb7JX7OrBa+XCCmnKdfasAH8+0sBELtu4ODr42P2gjdffl5Qx+/G6N1fTw
	 /VfRm8M4hgoW5lwL9hcsQeSDnj5mvMBPLVlMshmNexAat1pKIOU4JYG/0hq9RsmoB5
	 +Hvn6j5HCM8D4uHEMwK9gZxTLfe0c2TWkKq+XztuuVS0dc4d0RM/F+EWJZ4nm0IjTH
	 4JfRpLFOiLDJA==
Date: Wed, 3 Jun 2026 17:16:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: saravanak@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] drivers/of: fdt: Make ibm,phandle logic only happen on
 pseries
Message-ID: <178052497493.2242893.1271485446472136670.robh@kernel.org>
References: <20260603151809.3256280-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603151809.3256280-1-daniel@thingy.jp>


On Thu, 04 Jun 2026 00:18:09 +0900, Daniel Palmer wrote:
> The "ibm,phandle" thing only seems to be needed on pseries
> machines but everyone gets it so they get a string and a little
> bit of useless code.
> 
> In __of_attach_node() the pseries specific part uses
> IS_ENABLED(CONFIG_PPC_PSERIES) so do that here too.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

