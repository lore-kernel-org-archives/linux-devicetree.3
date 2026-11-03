Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706218;
	b=Hc3hI3eYUkmaTKUiy6EiSdvA3EeIKu81SJNOT1sqLN3pJOlWvKDl/UHM0nGRjw3Q3eOp
	 tdPHGcsZJx6HVOQkF1ooCdpDjeCLDoditbd4opRf3lEp4wfL8WnOGKTf+4c16fbwuKxno
	 ADYjgtE/H9Me8LaVfnAzOXOkIcYnsrWJwv3DYuwDFBAK4uj9dIc2tZxFpKES6bscPvZ9K
	 zPbCoo7d/qK25N5HqW4WuUtRkVagCthuYtPqCNze3GpZHA6c0aj8zwVKtfMEfSVip7t5S
	 k9qF0PSi78n2h6Le0ssYkWyV26sxaeHLvqaVyCPdiIaWjqxStMKASpy7q7wR83TUL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706218;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ke2iiy+5bPFA2Qh7Wbg/X9FR3jHVJljstab3aXxJ3pk=;
	b=l0eI0L3ksOSdREXrxnmlJsGG8y7sEpKLa7tlb5mIEeh3VcTjJ66MSj51wDkbcEE2h8cU
	 rOLxZYOr5A6QWBQvVQSMv+8h3GyARn0oGYldWfr0PT1GfVMaIOtUvtqGIU2tn7RGViyRF
	 Ha2UjcHX1uKKxkue5zweE/H5FkvowpasGtx/2j+dj6r/SHFNPdr4dcFQs7o2/2dwcJEKi
	 L3cqhkswueMWQ/gYlYQ2PVd2TO2kN/DW/waY2iVTl3NIG6GVIpfg5UBn8QxANU8J/NNL8
	 P5fxMdaSD7Qfnu5m8jI94n1OACFO+f8JAnU3h9DKdX4BYLq5ClBUGqYI21t7ktPUn1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JjYBD9rD;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A7606A33C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794A7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JjYBD9rD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 26FCBC8F45C;
	Tue,  3 Nov 2026 11:44:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BD936046C;
	Tue,  3 Nov 2026 11:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C35103291E2;
	Tue,  3 Nov 2026 12:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793706209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ke2iiy+5bPFA2Qh7Wbg/X9FR3jHVJljstab3aXxJ3pk=;
	b=JjYBD9rD0vsN/BIRrCSyjvM0/rLF7ga7LoE78CJtvmkvkA3NI9ACU6hCK9+SA+iGlzm2rz
	uUGYJfvkH5Hd+zYkXRqJU2SmYGldH8R8uq49DCw/022mPwZKa2aMnZiU/qgMx95QMjMmOL
	47emcUh+0g8jJFFw7wFTMQu2Wz+j46egu1+W01OR8oSRf08if6LL3Yigrgv4hqZtoA6WuG
	PO7czrEGk5nmRibJMIvFudAIwYMDiVyge3qTAE6lLQd75nGpzV03JAzpDZ7K/fwlJIIomd
	s5MRy6aa3zOjxWePs4OmSm1Rdi60bdsFLg5gk0MGxyrtU4AaAunTtjeBuzy8Tg==
Date: Tue, 3 Nov 2026 12:43:23 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Angel J <iamanaws@httpd.dev>, linux-pci@vger.kernel.org,
 bhelgaas@google.com, robh@kernel.org, lizhi.hou@amd.com,
 andrea.porta@suse.com, florian.fainelli@broadcom.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v3] PCI: of_property: Omit bus properties without a
 subordinate bus
Message-ID: <20261103124323.0f8b1071@bootlin.com>
In-Reply-To: <20260918202045.GA1191948@bhelgaas>
References: <20260918195540.GA1187209@bhelgaas>
	<20260918202045.GA1191948@bhelgaas>
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

Hi Bjorn,

On Fri, 18 Sep 2026 15:20:45 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Fri, Sep 18, 2026 at 02:55:40PM -0500, Bjorn Helgaas wrote:
> > Author: Angel J <iamanaws@httpd.dev>
> > 
> > PCI: of_property: Omit bus properties without a subordinate bus
> > 
> > A bridge (a device with a Type 1 header) may not have a secondary bus
> > allocated (pdev->subordinate), e.g., if there are no available bus numbers
> > or the bridge secondary/subordinate bus numbers are not writable.
> > 
> > The dynamic OF helpers of_pci_prop_bus_range() and of_pci_prop_intr_map()
> > dereference pdev->subordinate without checking it.  When
> > CONFIG_PCI_DYNAMIC_OF_NODES is enabled, this can cause a NULL pointer
> > dereference and early boot hang.
> > 
> > Generate 'bus-range' and 'interrupt-map' properties only when a subordinate
> > bus exists.  Keep the node and its remaining properties for bridges without
> > one.
> > 
> > The problem was latent since 407d1a51921e ("PCI: Create device tree node
> > for bridge"), but wasn't reachable until 1f340724419e ("PCI: of: Create
> > device tree PCI host bridge node"), which appeared in v6.15.  Before
> > 1f340724419e, of_pci_make_dev_node() returned early because the parent OF
> > node was missing.
> > 
> > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > Signed-off-by: Angel J <iamanaws@httpd.dev>
> > [bhelgaas: move pdev->subordinate test to callees, commit log]
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: stable@vger.kernel.org	# v6.6+
> > Link: https://patch.msgid.link/20260912043106.10715-1-iamanaws@httpd.dev  
> 
> I put this on pci/for-linus, planning to be in v7.3, but I would love
> to have testing reports to make sure it still works as the v2 does.

I know it's too late to add a tag but well, just to mention my test somewhere:

It works for the LAN966x use case. Tested with v7.4-rc1.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
