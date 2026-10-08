Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5A47B43A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450554; cv=none; b=mu7019PJUKTB/T0Qa7n/mBIMs8yzjaE4WR+VLG+0v+NB4MMF6l5JbFB5T/sA82T895vxiZ8sVRxsXCw2g37BZg7qzJoZcdeib87QjlRdpiaeVxoqLyoRnZCnJ4aiEwkuePlN+4yzdF0qsDMrgtb3SBe6X/JRdLNkwC1BBbLU9iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450554; c=relaxed/simple;
	bh=Ly3TeLFdue0nkwqbktN/L0nW5ns4gXpalsyVXZ44xqA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DDvLR8nQ32c2dPIlDZddxKZqcHFJqyngNLggVrmWIeN2kTMrvCJP6+RKrDl7hsxQJXmZ4mPdh7CdQmcJf3tOSElU/3Df51/VCXqN8k5Xd4j9rgpjsGjbYJeZOrpx+FpoChfnZ+Y4hKCYvGSlkaLsKkZDDwcBsKXyl0/W8J36xqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGG8gT+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGG8gT+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA6D1F00898;
	Thu,  8 Oct 2026 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450547;
	bh=F0+yjITfkOkEiw8z64En27UCDBCnE+aoOF30fEkR2gc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lGG8gT+g3eDoJ0yl3Ao6Gs/myvE7MsRpwYrTuJLfJJlRoYnze5UlYkWqIzB5I2vm0
	 ey+2iiPoKJGy+GkcXKA6XVHJxt9w4UXZgq1dgZGWOe/7PGsWYNmc0/UKB2XsG1g4fT
	 otwRSy1AOUtEwu9qHnduZvvR24a6/TVzqmE6RMKlLswfEwJvvH+m9KEEzWUox4esHd
	 iy6a/2d2RkYk0qGuUgimNOUAGqsvUpuHiVNMY5kZoljTfGs+WOArXzmSkKjTwv/dHX
	 OPKD7N5B7CL+rqqpAbzP4ZMFEwSsiMH4+0XeEcGHQoMbUZQRFtp7kQLiTmO2nnv0dR
	 Jw2Mi4mmRkr2g==
Message-ID: <sashiko-outbox-163895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] irqchip/al-fic: use %pOF and raise init log
 level
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008090058.38591-3-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
 <20261008090058.38591-3-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:09:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] irqchip/al-fic: format string mismatch for PTR_ERR() error code
--

commit 8125021c81e1add1a1eecad3b85a1e6e742d6f48
Author: Eliav Farber <farbere@amazon.com>

irqchip/al-fic: use %pOF and raise init log level

This commit updates the driver's log messages to use %pOF, identifying FIC
instances by their full devicetree paths rather than bare node names. It al=
so
fixes a grammar typo and raises the successful-initialization message log
level from debug to info.

> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 35581332b40e0..760bd08dcff4d 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c

[ ... ]

> @@ -258,9 +257,8 @@ static int __init al_fic_init_dt(struct device_node *=
node,
>  			       node->name,
>  			       parent_irq);
>  	if (IS_ERR(fic)) {
> -		pr_err("%s: fail to initialize irqchip (%lu)\n",
> -		       node->name,
> -		       PTR_ERR(fic));
> +		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
> +		       node, PTR_ERR(fic));

[Severity: Low]
Does this leave a format string mismatch for the PTR_ERR() return value?

Since PTR_ERR() returns a signed long error code, using the unsigned %lu fo=
rmat
specifier causes negative error codes to underflow and be displayed as mass=
ive
positive numbers (e.g., 18446744073709551594).

Would it be better to use %pe or %ld here so that the actual error value
remains legible if al_fic_wire_init() fails?

>  		ret =3D PTR_ERR(fic);
>  		goto err_irq_dispose;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090058.3859=
1-1-farbere@amazon.com?part=3D2
