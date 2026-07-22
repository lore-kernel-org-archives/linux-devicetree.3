Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3645346E7E;
	Wed, 22 Jul 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728937; cv=none; b=R9McZrfTApVqlyDoFysMS3Jz9/vT7FHYMotFlPMy7nk7kwm9Ryfu+9XXjnDWAu8yfUZffRMJBNeeIk3SPZ2ENlEVhmy2AihD2hld8E50qt6kFTuxAxeO+zvsAHuigrQ7xvQOfyh7LoNVWL522j1rlwnv1W1H2IUqV6u+2fEx4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728937; c=relaxed/simple;
	bh=snhwYAgWxTaV1Ph2JvqziVEzWeYJDvB/yLhlb632W7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8SBXeTf3SXU0ysGpEEkvypUW6/lwHEiBiP6rkR56/f2++kxFy1lwR9FeFPz1Vu4BzuInAKRho7BcVuylkGvGkOQxGg0UnaBmD0JrH190l1CYzLhRSCd0H2P96yb4VYnP49H8I2snN7rfNzSInaTcjBKGL3czcpvVpWE6mP6rDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwqDKz+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwqDKz+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7167E1F000E9;
	Wed, 22 Jul 2026 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784728935;
	bh=JstkcbGN97Sa0y2aXm/E1YtCpVxFTjJHzy0PKzGB+ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwqDKz+RsuGCglfCEubDxx66rueLRNzuEC48cPr3VQnPEDrI1mwmLXiYaKU7t/zI/
	 v4xbdcgaYCvPK622C55Cx/8sOj2nBPGbPWCwYo+LRBnO7yDEWPexDEADXPJFWJlFAt
	 fwqp5kdldqaG5kW/kP77+LJ6hT+7zoLijrU/0XOy8RnINZCavECXY/+vs3gWMNPOrS
	 7krjtyoFUtKN7cpPQ2nMzUzOjjfrRHgvoTtNmeODPCjFN+8BgpSoM6ZKzoi2cP9cXX
	 DCKXtCd3882ILcBwYMsnSLsG+S2TgQCZahVMlt8Hg+2f8lDQTASCv0S3VgulFBmkio
	 7dMW0HkBNIZJQ==
Date: Wed, 22 Jul 2026 09:02:14 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: mailbox: Don't require #mbox-cells to
 be 1
Message-ID: <20260722140214.GA548057-robh@kernel.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid>

On Tue, Jul 14, 2026 at 03:21:40PM -0700, Douglas Anderson wrote:
> Existing mailboxes have #mbox-cells and this makes sense if a mailbox
> only exposes one channel. Update the bindings to match.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I assume this is worth doing (?). As noted [1], mailbox bindings are
> already in the core schema, so what's here just provides extra context
> and descriptions.

We should update mbox-consumer.yaml and remove this file instead. 
There's only a couple of references to it.

We should either just add missing descriptions to mbox-consumer.yaml or 
change it to mbox.yaml and add #mbox-cells. The latter would only 
provide some completeness as we don't have any constraints 
on #mbox-cells (there's a global max of 8 already). 

Rob
