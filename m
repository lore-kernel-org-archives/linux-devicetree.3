Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE604A2046
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641106; cv=none; b=QaMy+9AeSqSvarU/niKEYxT2MdO0i80kQ6QW/ERRxYgg0GLw7IIDZQBR/zB4PJ9Mm+vZKDvCtZZWs/FRhzyld3qWsvRK2PuPFpBkbZBJlhcdjVzZqn7AZoPam9t4XL5eS2sWeQWJcrog5/6tr2iELUvLr/9aLNDZF/dgeoDupZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641106; c=relaxed/simple;
	bh=nKduFl9ZJXhBa9pNRDmt/jbOnVpKwbjnYA6GXOT5cgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUSwcdmTWaV0o3vYifFsWFKmuQhKE2EcOc0twlxHdR/mRGbalpppS4kSHAuMIt6PuUB+gDYcY+3PXWxlaNDU7guXihiWrZauRTnfp4hga/JxowqfsklC7eqIVkUm3z3cV9XgM5u+Wvi7/GrW79yAcABODpZPUl1D4dPvEemnPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=mT0XoDki; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="mT0XoDki"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 6921221CA0;
	Thu, 17 Sep 2026 12:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789641096;
	bh=nKduFl9ZJXhBa9pNRDmt/jbOnVpKwbjnYA6GXOT5cgs=; h=From:To:Subject;
	b=mT0XoDkiQUI6id+q8ZAvCNA4rwzkHKqjVccL/Gi8bXWPidIPLJtbDbjsVE9R1mtAH
	 Hmp9iv0j8aWnAc+Z6Gbpm/bpSm9PfUYGx9BEe/iTxC+BGfwSE0+/jCnOc2pAIp1yEZ
	 TaxHcst9iqUxUOCftU1bIQ5XVaM0BA8CEOOXfr3pSuy11GoE3LMQty7l0J6Y9QyCEj
	 +YHLULcJpqYaBxuoM/0HuhLpCKiu3CHd6HymawUWa3FYzlaSaLv/tzKyZudc+ONKg7
	 kE9HZ+4ITJxhvE9a6vxaPaq0qvKtrhHIT/YjQTCQUG8IJGf3u/geVWZW5z8ueygv24
	 /EurbbzJKUTmA==
Date: Thu, 17 Sep 2026 12:31:32 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: sashiko-reviews@lists.linux.dev
Cc: Francesco Dolcini <francesco@dolcini.it>, robh@kernel.org,
	imx@lists.linux.dev, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add Toradex OSM iMX95
Message-ID: <20260917103132.GA72106@francesco-nb>
References: <20260917102011.69071-1-francesco@dolcini.it>
 <20260917102011.69071-3-francesco@dolcini.it>
 <20260917102836.C2BB31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917102836.C2BB31F00893@smtp.kernel.org>

On Thu, Sep 17, 2026 at 10:28:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: incorrect ALSA sound card name due to copy-paste error

This is correct. The audio sound card on the OSM dev board is the verdin-wm8904.


