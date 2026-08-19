Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE28471277
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140174; cv=none; b=rjn6axHcw0rsDh0QvGiq7Rt+Z1kSvFBep6LMCAUKg1u8h7cK1a6CdB3517j18+xEMxIXNucbJzCy4RiujQgPQTXO40DAb+vHx4pbzdZjcnFoyftOsRfML9oQYUQz1zGBY5Yv/u8huTizZiJH41Pg7GeMqE3gDhv5GQdrVrX4w+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140174; c=relaxed/simple;
	bh=mp3beoxhkbk+gFXqCOWIqKRytXNDHA1lmaulcHtmZoU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G51gi96x4q5h3UVG+H1Xhmsj7fm7ddUcd6FCRImfEY1ke5suD6Y5YP4y6kxbfhasrL3Grf9qwcGTi8MV8lWvVfV0iLl3Vm3SNi3SlmbXXAP03GbdTUPNWiBC310Vy4xknGXN3FegbNE5nE2DhrsatcqIFxoNMujsPBgzBhEUt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qw/Bfitb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qw/Bfitb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE98B1A1728;
	Wed, 19 Aug 2026 11:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ABC15FF42;
	Wed, 19 Aug 2026 11:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C01CA11C70046;
	Wed, 19 Aug 2026 13:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787140165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0QTNUqsJAjiCWHHvRsXRGxssHN6W4IznQ3AoR+9+su4=;
	b=qw/BfitbWJs6GoXkR20T1/E+5954ph5WoPE4nHSoBVDSzfjgKOD5LfczViUBB2KZ/aR+fH
	+GDktVM6klgwWiTMb5sLCRpsKs4ieBtHn6P86Enu+ri/0OmEsrZSbdUyT1UaYKge8K2O5v
	WYBGkDTmDt3ESmO4o6jZFq6iWT6OB2pZOb0JeI3pmAFOG4ZsAia/seR+ckbqvAHnj4+/mC
	PQos82BeBUas2k1XezMm7Z6qmHM9c5KleXFeHBfpAIuL+f+3sz70heE0oExOmxCvL5wAR/
	vyn9Lk2ThN3ZtFE/WDSdJ14XRpXsRr0AZwX2Dq3srhied0bAbsE18RiEcLcrcw==
Date: Wed, 19 Aug 2026 13:49:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] of: teach overlay code to keep /aliases in sync
Message-ID: <20260819134923.0a67838b@bootlin.com>
In-Reply-To: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Abdurrahman,

On Tue, 21 Jul 2026 14:36:31 -0700
Abdurrahman Hussain <abdurrahman@nexthop.ai> wrote:

> /aliases entries added by a device-tree overlay are stored in the live
> tree but never enter the global aliases_lookup list that of_alias_scan()
> builds at boot. As a result, of_alias_get_id() returns -ENODEV for
> aliases declared inside overlays, and any driver that relies on
> alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
> pinned id and falls back to auto-assignment.
> 
> The gap has been public since 2015 [1] and reproduces trivially: apply
> an overlay that declares e.g. `i2c99 = &foo;`, ask
> of_alias_get_id(foo, "i2c") -> -ENODEV. Bootlin's ELCE 2025 talk on
> PCI DT overlays [2] enumerates "i2c muxes" as one of the subsystems
> broken by dynamic overlays; alias pinning is the underlying cause.

Are you sure aliases were mentioned in the talk and were the cause of issues?

I've got an issue with i2c muxes but it is not related to aliases.

What made you think about aliases issue?

The issue I have is related to fw_devlink consumer/supplier relationship and
I have sent a fix [0] with nothing related to aliases.

[0] https://lore.kernel.org/all/20260630103010.413688-1-herve.codina@bootlin.com/

Best regards,
Hervé
