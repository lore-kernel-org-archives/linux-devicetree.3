Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CC3B1B3
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988093; cv=none; b=pcw20f/vPrNlSqo9LmrlyJRI94kGJiqKyNaCRllfn2k23IOD6wJXAsU3ZWWLsGPYPs8UbFW3QuUtiAyM58S7cqOAkpzT5m/QCL57qPCfjToUmsxExQcyQeyFq1U5O4LYiQoM6QHpFK7Zih7h1lSeYPzkdb+Vyy4zI5iwY46Yi68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988093; c=relaxed/simple;
	bh=BhNTtvUX7pE9FfUvDh6yD86ADVx/RhbrKUmXjqmXvM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFOxKsLWho9c6Q4x8W3NuxvLnguR21afKLDGuaYWQEOG4fhMoCnP0sWLhVIVi93gU3zUxgy4SMZ+U9O535MTm5TZqvg/5NblYokV4Y2FzJEBjSupQPFQfclmCyZ+UylP+PfHhfvxn1va9u+KqUdyMt/WJ4UpYqg45evb25Rwtro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1keLMmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1keLMmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BBC1F000E9;
	Sat, 25 Jul 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988092;
	bh=UGcr4x0Fq0locbohvFO1AEPGX5a/LfEGubQaxAFvdHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1keLMmvEiGrp2VbwyDsJd32rIMEdSb/yncL8jSDO5lOadrn6L53dOdLyF5i1MOZq
	 C65lXbw+Nt0uCvekqdt6m5f12ObwPtvDXlM24jb/XK23/jGJfxyBESBEpc04K+p4hw
	 s/w/eWFASzVTG+pFXnfMpOCFCV6VVGUfeuwG0Snlo9vJhCRXnDXYAD7Bf5xQpC2S1t
	 mupIyYpjhUcnjgsrPOgiAb9Xh9M8aX0czxKm71sJ/9Q5OzkmBYe5YXARCVKKPyP5SD
	 ITvFJz0oY4mGcE/QEJE8BnfWfekwPEoBPeXzafpTB4S4MMohIQnv8fPjJ/BlbAHgGg
	 OCjta586cA55Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] spmi: apple: lock around FIFOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-5-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-5-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 14:01:31 +0000
Message-Id: <20260725140132.40BBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using an interruptible mutex for a fast hardware bus lock introduc=
es unexpected I/O failures.
--

--- Patch [5]: [PATCH 5/7] spmi: apple: lock around FIFOs ---
commit c446ad8ec5411cb7c1e85b2172699c9fc3a53edd
Author: Alba Mendez <me@alba.sh>

spmi: apple: lock around FIFOs

The driver was missing locking around register interactions.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index d69d16665ce85..d8509f027df69 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -73,6 +75,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	ret =3D mutex_lock_interruptible(&spmi->fifo_lock);
> +	if (ret)
> +		return ret;

[Severity: High]
Can using an interruptible lock here cause unexpected I/O failures?

If an SPMI read or write blocks on this lock while another transaction is=20
ongoing, and the blocking process receives a signal, the lock acquisition=20
fails and returns -EINTR.

Higher-level frameworks like regulators or PMIC subsystems generally do not=
=20
expect or retry hardware bus operations failing with -EINTR. This could=20
cause critical operations, such as CPU voltage changes during cpufreq scali=
ng,=20
to fail randomly if a signal is pending.

Would it be safer to use a standard uninterruptible mutex_lock() to seriali=
ze=20
this fast hardware bus I/O and prevent these systemic side effects?

> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	while (i < len) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D5
