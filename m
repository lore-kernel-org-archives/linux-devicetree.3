Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084946;
	b=y6dkP1SXB0+QkViZhx0GBO4hntW124YiwX37a5UJJHkob6m+ucB6ujQuFZOZdPUYEwyj
	 lEGA+R4m64zHPU/ERjW4rC8i82MSbxpOx3flWMOrjzkx+xoxlPsvfmZOTzw8Q2CTsDCYy
	 3LAbNidkiCb/59pATpwicXLBP/rp/3bkCIVaIE5G19r1qxoQBio03jUEFgdALqMwSnHAM
	 217e2jwsvaUBfMZ0tfz8bkijEuyJxH6cMakg7BUiIZM6lf02GLAujhYx1qky9jFIJa9ZQ
	 nZ3yFrBO7ZGxQSJdE46n8fdiB0qmr+rgwY/SFFxKW7xpakD+g/hdMd4nEkA2eSh353g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084946;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=m3BRLG4pswPomjtgFpj5F2ZQh9CiTK8l3dn7ZhnWJlk=;
	b=WB3zB1HAF8wHfQgtpD7CBiw0UzrK++DdWK7jffTLHDdvzNQcaejef8M8orckeTMFPy7m
	 xcB/Eijt1gSJVIXc/Igyc4wUb8P7Ff/lNeU0rHCKp59VRr05Sea7dXRjNfBFNAE+lpMdh
	 rCSUmykDyvvSPNYnvmyfvz7oiXLZPkJJjlEVmmKnCaf5Yzolg7rGTz54VOSC+jVg247rx
	 wehFFoJDl4fa8FvGG6GtUVq29Taba5j6LkFOJvXI65jUAYDcnQLrxMjkDKC5m/aE1P88Q
	 VIO2/gjIlHP2Uqk6+lZ5cDc1szpLY48cggR6I5LGHWMKeFIbxXtAoSvfLW8FSh6Eiyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ur17vZhb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB454606A33D
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB454606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ur17vZhb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 601ADC4CBF3;
	Thu, 19 Nov 2026 10:42:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AD5160237;
	Thu, 19 Nov 2026 10:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8243011BC0D95;
	Thu, 19 Nov 2026 11:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795084942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m3BRLG4pswPomjtgFpj5F2ZQh9CiTK8l3dn7ZhnWJlk=;
	b=Ur17vZhbjIDLKoNHyghc2iKvn4KUB2Q9sx/KRxek6oeo3q3a/Wj8TR90z4P67iy7leRj4r
	D+57mK7XeBszRAMIs0qVzaq+R0Yhikk1Y0kJ0vA6ql27lobcnj160Ncui1BadaKgoNs5wS
	BMNx22szMIrbcl/rfSb6YoElLMnDX7bwy3J7wBwvzdzoG/J7t9LvoxrgOPPo3lNnXOJdvJ
	WhcYKnDYO9fuvo1+KjLn/X0Wv3R+VOHk1qFUY40FBp2VH4E+uDkG74BdGE0QmY7jt0OWl+
	tQtmZw/glFdrygoQzNO1MRTCiexRaiUbeJltUEVy4G3doNmf6AmDaJAwdH34SA==
Date: Thu, 19 Nov 2026 11:42:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 4/4] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20261119114218.0a044688@bootlin.com>
In-Reply-To: <20261119091245.2c6c6528@bootlin.com>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
	<20261109140916.90625-5-herve.codina@bootlin.com>
	<sashiko-outbox-205130@kernel.org>
	<20261119091245.2c6c6528@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Thu, 19 Nov 2026 09:12:45 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> On Mon, 09 Nov 2026 14:50:21 +0000
> sashiko-bot@kernel.org wrote:
> 
...

> > commit 7ba99d9ea04b1e1a29eebc1e1525489b300fe107
> > Author: Herve Codina <herve.codina@bootlin.com>
> > 
> > bus: simple-pm-bus: Populate child nodes at probe
> > 
> > This commit updates simple_pm_bus_probe() to populate child devices for
> > transparent bus matches (such as simple-bus, simple-mfd, isa, and
> > arm,amba-bus) during probe, and skips runtime PM calls in
> > simple_pm_bus_depopulate() when runtime PM is not enabled.
> > 
> > [Severity: Low]
> > In the commit message, this patch fixes the probe behavior for bus-only
> > devices where returning 0 without populating children caused
> > device_links_driver_bound() to create wrong fw_devlinks. Should the commit
> > message include a Fixes tag for 98e96cf80045 ("drivers: bus: simple-pm-bus:
> > Add support for probing simple bus only devices")?  
> 
> The commit 98e96cf80045 didn't introduce the issue nor change the behavior.
> The problem is there from the beginning. For fw_devlink child devices should
> be populated by at parent (bus) probe(). bus-only devices such as simple-bus
> can populate devices recursively skipping the parent bus probe() step.
> I don't see an obvious commit to point for a Fixes tag and so I don't plan
> to add a Fixes tag on the next iteration.

Actually found a commit for Fixes tag:
  628b8ca3e915 ("bus: simple-pm-bus: Remove child devices when the bus is unbound")

Will add the Fixes tag with this one in the next iteration.

Best regards,
Hervé
