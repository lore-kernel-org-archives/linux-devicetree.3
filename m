Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2E33D4E2;
	Thu, 30 Jul 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422006; cv=none; b=W5d33PhW31HeECKgm1kInEAiPzOiBhD8jX6dnZSEnzAzYtpjfGCsJo7/ju4TzlMP53Deiy/nj49c7xsejZZwHde0aCqMZDN/gajStpDRk/fDwGOtYDp72tS04UfFI0DyKYlHiJDmgwflSEjJHp1Etx3xHuyoknqn1ir2XYa9U9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422006; c=relaxed/simple;
	bh=WFgaMd8gJZDQqTxhn4+WkvrlEtBIC9KAlLECNlyVwWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRZkTuAwsPSMj/uVdFRL4ji2BgcVqeJ77KpIlO7XT2fbjOXvk4Gb8IcaB5gEO8QOo3SjGYXtJyQ2WOc/HwF0yVsrN+vv4WQOf2oPKMXtttzF2za1iFRavgEiDvLE/JageBFVfUXLpmU2TOSZSzcjSuCTCYzBQ5JoJgd3MxoF21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z9Oc/gM0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z9Oc/gM0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 691764E41005;
	Thu, 30 Jul 2026 14:33:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C02B602B8;
	Thu, 30 Jul 2026 14:33:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C59E11C15D06;
	Thu, 30 Jul 2026 16:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785421998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mfA+QB9rWd3etPgxphn/JIAS9tjAN+8oo8iyiuZepxw=;
	b=z9Oc/gM0gxr7ET4b9zJ9I5+4u06/ium0hAYYxNZOycRvAiobjn0Bc1jlsg6UGemiyy1gvx
	+VHgcnA0+9BTG4vZgHE47u3WkXXnsP+vwoyp+IVJ0xTCgb/P9sn5npjIRheLgiZcR1/fb0
	6L+BCFjQo4gvI+MZ5nwjdKoo9eR3lv9lUvsatG6388lJpxjo6LEHFKNCmU3cheWf4W9VmA
	xmALTUiGn2ttWIx6JaZ4vbHX39GV4ilf+R68H93iG/EhFC25s2xTHlCvlggh2U6JRZ7Xdg
	R0nMdKpr3NgWv+6GAFRB+ZAQZEwb7Pm/VwiaTR7NSjVXNk3Ste4jJULr1DYsLw==
Date: Thu, 30 Jul 2026 16:33:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 0/2] i3c: dw: Document optional core reset and drop
 redundant name
Message-ID: <178542198409.1790758.601925059498244846.b4-ty@b4>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 20 Jul 2026 13:05:08 +0530, Shubham Patil wrote:
> This series documents the optional core reset for the Synopsys
> DesignWare I3C master and updates the driver to match the binding.
> The DesignWare I3C master IP has a single core reset input. The
> binding never documented this reset, and the driver looked it up by
> the "core_rst" name even though a name is redundant for a single
> reset line.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: i3c: dw: Document missing optional core reset
      https://git.kernel.org/i3c/c/904473e58db7
[2/2] i3c: master: dw: Drop redundant core reset name
      https://git.kernel.org/i3c/c/283e91b86613

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
