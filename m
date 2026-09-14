Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54ED3E63A4
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 22:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426700; cv=none; b=RGF4IKTjNzDkq/0GPo8DSUQOw1Ajck7GPudD4ZWM9C1f1YViRduK6cDd4y6JJO4qoKb8NPYowA/UbQrq18bTP0zTaGHOyAUx9G7Ik6Qzto63EXstn8AIxVhtEd3wBPVjAzUSXwJ5vIrOmWLdiwMPz26YTkVAeK+I72DkcjFG4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426700; c=relaxed/simple;
	bh=nJjI23XqZAt3gjmdhdRyLaqXkQItKL4BbAjdnyoo4EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKJN5hJhCVT0KlWo7WT3WGmTz0rxE4gfe8GQUCfIv1IO4u1RBdXPiR9PbaPcv/WcfdPYmEDMGF/gmsb59s3zX5peLadV0uskZDEmkH4QX/0eh4gJSxqVXmP3cyiJxYdpu+IOucxwaxLGP5wS1QPzYcm35EI3HGzSGapBaPx1oYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=t8mN7CS0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="t8mN7CS0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968551570;
	Mon, 14 Sep 2026 15:58:13 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D20D23F86F;
	Mon, 14 Sep 2026 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789426697; bh=nJjI23XqZAt3gjmdhdRyLaqXkQItKL4BbAjdnyoo4EQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t8mN7CS0M5PhL28wSIIYz3gA0JIpUmX55Tf27kKfYstglrK3kllufbJrsIll9YCBO
	 O5KEtkGOSSeeitVzJHYWtKp4K1iIDM/r3zjz6pkiDI9k4DQm/WqQfUjsnSaHc10r6F
	 5bj821ZLpzOAeY+tyGpuT4jQsPnIEwz7YtCHG/+8=
Date: Tue, 15 Sep 2026 00:53:39 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 conor+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for
 Teclast
Message-ID: <20260915005339.0eff1d63@ryzen.lan>
In-Reply-To: <20260914211139.48AA61F000FF@smtp.kernel.org>
References: <20260914210115.28151-1-andre.przywara@arm.com>
	<20260914210115.28151-2-andre.przywara@arm.com>
	<20260914211139.48AA61F000FF@smtp.kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 21:11:38 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The newly added vendor prefix `^teclast,.*` is inserted out of alphabetical order.

argh, of course, was kind of blind here, I guess.


> --
> 
> commit 5eadfadaf4aefd64a40c08bf27f4fc8d4fc5a0a6
> Author: Andre Przywara <andre.przywara@arm.com>
> 
> dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
> 
> This commit adds a new vendor prefix for Teclast to the device tree
> vendor-prefixes.yaml file. Teclast is a manufacturer of tablets, laptops,
> and mini PCs.
> 
> Link: https://www.teclast.com [1]
> 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index ba20029693734..6da733d465a31 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1722,6 +1722,8 @@ patternProperties:
> >      description: Thundercomm Technology Co., Ltd.
> >    "^thwc,.*":
> >      description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
> > +  "^teclast,.*":
> > +    description: Teclast
> 
> [Severity: Low]
> Is this newly added vendor prefix inserted out of alphabetical order?
> 
> In the patternProperties section of vendor-prefixes.yaml, there is a
> requirement to keep the list in alphabetical order. Alphabetically, the
> entry "^teclast,.*" should be placed after "^techwell,.*" and before
> "^teejet,.*", rather than after "^thwc,.*".
> 
> >    "^ti,.*":
> >      description: Texas Instruments
> >    "^tianma,.*":
> 

