Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C44346A02
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314262; cv=none; b=a7MNBjahi0EnSL/WGybw9GozWjEZH0SaZUuGM8kpmJ8fBxK8HlDwXPj1SBjPSymyd/w5QLwq/fJAcpTYEgeG85yDwPzpADxvpRyfcEu/WPZpBsCtwQPvh3kkj/3m2rOjDPsEOf379YIAatl5ABYzGRF8fwgbRAzNcE3t64+Bo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314262; c=relaxed/simple;
	bh=3IodyGZnKFDzuvbdxVK4kJdIEEZdA2esA+7XyrcqlQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GLkRNKG19Dkp/qfNFR0N0Zz65+Mm1Zmrl8SJLVJvXDgjjxanYwxabbXXaZT7C0DJoVOkaTlvZH7vU6PntMIaKRUcmiKhL4T3aMA+cc3OV20fj2AunK0bzuyCx7M3VGqmOVqe3++9ddA6EMMo8ziEVENu9SXfeZySNIcsJnM4f5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1udvPhs6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1udvPhs6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7533E1A12EF;
	Wed, 29 Jul 2026 08:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32D1D603BD;
	Wed, 29 Jul 2026 08:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B4A311C14AEC;
	Wed, 29 Jul 2026 10:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3IodyGZnKFDzuvbdxVK4kJdIEEZdA2esA+7XyrcqlQc=;
	b=1udvPhs6aNcVxCQqVyU9adFATlbxxyUh3QjebezaE5ZaGB+JI6R4idpk7gkb6SGrOGVJkq
	0rHo91gMwyByUgLSGNnTapOMMylQxmuiR8+FfE60mwEm4+d6CzbBqYB7EtLRMbjNwM/TdN
	guYBfRWWKwrN/BpbLwgqZWDj74J2RPj5j9dmyHkWHTtsOgs6HYlaYScRb9m/o7RvOny9oh
	bpzq/0+dzEqgxVxaLRRvlJT/msfheh2c4DJq/ByvLVeYRkB0ldtDTpAXWlfKWXmUjwGn1d
	e59XAO/iBN5zl3pNeY9YeeufrKb7v172iP1AQz+4YBAIUlGXT3bgsAN8Uy/nAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v6 05/17] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
In-Reply-To: <20260723110219.3180747-6-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 23 Jul 2026 16:32:07 +0530")
References: <20260723110219.3180747-1-s-k6@ti.com>
	<20260723110219.3180747-6-s-k6@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:37:31 +0200
Message-ID: <87qzkmmbsk.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Santhosh,

On 23/07/2026 at 16:32:07 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Add an execute_tuning callback to struct spi_controller_mem_ops. The
> callback receives a mandatory read op template and an optional write op
> template. On success the controller sets op->max_freq in each provided
> template to the validated clock rate.
>
> Add the corresponding spi_mem_execute_tuning() wrapper that checks for
> callback availability and returns -EOPNOTSUPP when the controller has
> not implemented it, allowing callers to handle controllers that do not
> support tuning gracefully.
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Sashiko found two issues which I think are easy yet worth fixing:

- [High] spi_mem_execute_tuning() directly invokes the controller callback =
without acquiring the SPI bus locks or ensuring the controller is powered o=
n.
- [High] spi_mem_execute_tuning() does not check if the SPI device is using=
 a GPIO chip select before invoking the hardware tuning callback.

Can you please have a look?

Thanks,
Miqu=C3=A8l
