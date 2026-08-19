Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCF44399F7;
	Wed, 19 Aug 2026 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134975; cv=none; b=n316bU9qv0dDCxRSf+LdsLKAvmqYiauSa7lcE8riU/E9rOWUCqYwek5stGum2miIC3cJrGpAd7j+QPc9nFM3GeXPR+zzhlw3JhZy3ioOi/r9cOQ45M1aoRK1ZcHcsjZwWWi7rhFtJbqF8WIUEMSocvxW7E6Oo21wBoM07ZGLhM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134975; c=relaxed/simple;
	bh=qswngR+bt1wZ8LIrJ+6Nd9rVo4yTmr151FpdjCpCXBo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctG7iGka+32Xf3BXiM+Occ8UA08y/3LSJ6u+46FP6/lBjpPSnDvuFi4ZOwdb1C0oyq6d66Me9+sXhGj1/IT9weRe3JDGPSe7C8vVqXB5mH7D+pwNbm9w9ZCLjCAmCtCldhZa7O9fbqm6CpH/9c4W6QvZl5JGsmLnQnqIK4YYAzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WDlCooeX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WDlCooeX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D74C81A1738;
	Wed, 19 Aug 2026 10:22:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A45C45FF42;
	Wed, 19 Aug 2026 10:22:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE52C11C755FA;
	Wed, 19 Aug 2026 12:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787134969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DH+x2fSMMkxbiHDIjQuZSYuuXLnO6KYd/5dM3xPG2+8=;
	b=WDlCooeXpaIHY18BA3sQHUjXh0gyVLGnSKvwxJf/DeJIb9B2M1SLseHEAnL+H15rRSfU5E
	gDu+E34QMnIDeBgUpCAw3XNJPF2kClTo6pefvJ2I47qtTod4AylvLzjqtHtDZsHffarn3z
	/r0xXv/T+lww9sPrbJux9Ebe0PEI+2hl/qhTYeDA8RYRLK0g6byR7S4pJNNg8HjTE9udIo
	OKWkN8fNqAUqG2DjWysmr9ooTdsQfs70lAFb9nP0Et0O8GgbafS0VcDF6HTUo0LpoycZf9
	5OafITrmiX4BdWx4y7kYVs6A7MVUHGqS6CLiUuYnrP3b4arV6lkXevRI1axpbQ==
Date: Wed, 19 Aug 2026 12:22:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: bhelgaas@google.com, robh@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: of: make a flags argument optional
Message-ID: <20260819122247.6ccfc7ff@bootlin.com>
In-Reply-To: <20260812172247.276554-4-elder@riscstar.com>
References: <20260812172247.276554-1-elder@riscstar.com>
	<20260812172247.276554-4-elder@riscstar.com>
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

Hi Alex,

On Wed, 12 Aug 2026 12:22:46 -0500
Alex Elder <elder@riscstar.com> wrote:

> The address of a u32 object is passed to of_pci_get_addr_flags() so
> it can be filled with the computed flags value.
> 
> Allow a null pointer to be passed, so that the validity of the
> resource's flags can be checked without filling in the flags value.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/pci/of_property.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Ok but nothing in the series call of_pci_get_addr_flags() with a NULL flags
argument.

Is this modification really needed in this series?

Best regards
Hervé

