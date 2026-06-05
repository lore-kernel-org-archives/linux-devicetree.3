Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255414D8D85
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659495; cv=none; b=ihDnpSfHOP28W5uaCijs1kRja7ANrJK8C1twz8YjKu93QgTLcoT1mrgEuhf/g/0e+Bl7Is9EKpyJjry9NEI5dSZ0ioVo+6035CVMk0LlZHk8K+eknc5LbpzVBjmMPGDWIzg+xZ//TN3WWOMBToh+JTn+ddlbfLGn1F8fSa+W6Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659495; c=relaxed/simple;
	bh=2ghoS6no9AaHRf7BNxhJ8BH+3mX/8y4443oHD+TL/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLf93obMwETYMs8eF9Z3vlFG5U8YtBbH0zsi06k32PMUaYd3UrN6V2o1NHYmsIQ2vdS/7AVj3rYPGemMQY4WJpk6KPZoRNORI/5kZQardK2j+5KwJt/EP9HkN2SU4K7E20+Ai9UFF2OrdIY+EhrRsudLi7Xmz8SXwZgEdKORyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QE4eRpYi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QE4eRpYi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D1351A0924;
	Fri,  5 Jun 2026 11:38:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F3845FED1;
	Fri,  5 Jun 2026 11:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AFA5106A2122;
	Fri,  5 Jun 2026 13:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780659487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fMdwehU3dvdlFcRAg/UEX6VsNEVgYxvT3ihO0867UDk=;
	b=QE4eRpYiT1i6Jt+O+rFdTnlxB4/HiPVHnYt+GdpVKisAKGB2J8+HgSPMzOYsXVGqp3Eqw0
	paliopc4KbDpciRnIlkhq41cumtfHs73vYKYwTJ2jOW1G/yLUmnZKPhZQUOmgIWZNoRr74
	6wEJxYmORZkjXARpig1kbIIx07NzNRJscIpnWkJuqcV/vFQ0jSS9TB1keuCiVwWq8utJ8O
	+htP0I5hWe4zaMLyUexsvg44TJ7gRckX00juEJpZdmAeqXq2hrH9at4qh7VVfuNIMXPYDY
	74IllUC3slK/KLvivnUkpSLDxhNzCDnHm8MrJOlq2ZcTS41TI2wzcStxRMGowg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add TI TMP119 support
Date: Fri, 05 Jun 2026 13:38:01 +0200
Message-ID: <18PCQgHDRMeFeQrJjHXSqQ@bootlin.com>
In-Reply-To: <20260605110802.74B701F00893@smtp.kernel.org>
References:
 <20260605-tmp119-v1-2-349f45f17d12@bootlin.com>
 <20260605110802.74B701F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParteYA6NtF9QaaxaqfKzKG7sw";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextParteYA6NtF9QaaxaqfKzKG7sw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/2] iio: temperature: tmp117: add TI TMP119 support
Date: Fri, 05 Jun 2026 13:38:01 +0200
Message-ID: <18PCQgHDRMeFeQrJjHXSqQ@bootlin.com>
In-Reply-To: <20260605110802.74B701F00893@smtp.kernel.org>
MIME-Version: 1.0

On Friday, 5 June 2026 13:08:02 CEST sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider: - [Medium] The IIO device name for the TMP119 sensor
...
> 
> And indio_dev->name is assigned from match_data->name later in
> 
> tmp117_probe():
>         indio_dev->name = match_data->name;
> 
> Does this break userspace applications or udev rules that rely on reading
> the correct sensor part name ("tmp119") from sysfs?

While unlikely that userspace applications would need to differentiate between 
these two sensors, it is preferable that the correct part name appears in 
sysfs. I'll fix this in version 2.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextParteYA6NtF9QaaxaqfKzKG7sw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmoitRkACgkQKCYAIARz
eA6LGw//a6T4jpcIFoIQXqRspnSKYDv49lNsWsan/6sAAAa6q/TNo9UwDbzpHnH0
/HqVgmtfjPgfR9FGZswQiFJ8gCRNNh+codapkgbyT1rr3jpuofGsTo9ECq9yTCCr
4PkRGF0jIrE55y1tyLmmlGmJvonY9UogN0SzHwgxeOQns2Dq8+OLqgtz7pdEjE1J
S8Ud9LJ38p/6fKt9UUJ9J2Py/s+RHqSV6axXKqm+7R3GSoo/+cPGL5SPTiGZdKUQ
HElq6vmtTzcxZoLxtwHeUw4z8FfknVeVqr+GETcYIJw2Rhhlp06Rd4RXOwgPgDkp
dZU27T2sHsDsQmI6gjjmhvvsXxKKztaWHqy3Ys0hJgs3Cue1V9eqQElKDQJkk+y2
oPeA81ip1XymFNy92Znup8r5vUpK4N42ztzxtx5Eq2mDkvUC6oQalpJ+63CxwZZL
CluxSNBSRTQs49pc9/ixlD9uJipGmCwDqaze6CPOGBQBnieg+kTQvXZdwv/N7sC5
kv0B/tgGir3vYXbVl6OgbRWrRWn2hMzkWq81WCarq6eVYPRO2c2pCEphb2CAmC+3
9sG9rlVh7wZbsYD45HprjyUfC1d7BLtMbcwRIFxS3QrFjeM3uqiE2RcmdKRXtDnI
UQHee/7RItbEFJdpbjmsIZNj588BlFaNWlyR/Ys/dnGLxQkiPmM=
=VSSn
-----END PGP SIGNATURE-----

--nextParteYA6NtF9QaaxaqfKzKG7sw--



