Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A732BCF45;
	Tue, 28 Apr 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777338014; cv=none; b=q1u6ZTFLH1rw0F0a4GNXdmMoOp3GxKmq7TAY2NvXpIvox8LQul40jz319nGiHHv1TIy7WukjnztejjR3uQ7nciQVIbRqAPUfAKeppdh4gxe4bTVWNS+1XmlVjb957p96RjPcQLN/2nytY8vE7OEoy3MDEfq2E/NVhJw7xdzI2UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777338014; c=relaxed/simple;
	bh=I4aOUPG1lU7Q0XDs0qm48wsu9VmWIGYR+72MeJCB/pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEuDyLgbsJWDobsydqfKCKzxurmlD/19qFqlmqMylpZqhR7lkXgeBmLGcs7RnGDBDjDUC2TQXEoEtL73BK+xy+E2uTwhsPb19A7hwh2fM53P/0H/Q0AkMltq6OCzZrdAZ3UDMBCZLEGP1GlCun3/Uhaa5Eg1nEaVoUFK64nHpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbNv//pz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbNv//pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED57C19425;
	Tue, 28 Apr 2026 01:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777338013;
	bh=I4aOUPG1lU7Q0XDs0qm48wsu9VmWIGYR+72MeJCB/pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbNv//pzZGWQ4Cie0Si2prJUR7jeK6BO1QZfBdYfnPs9nAcbfIPJnB0IPOiLr6pxr
	 jmgBFzqcpYTYEKhWyprZ4uvpkA6k37KU9aKIthXXjqMdOxGh/TfqXIPnjIAG8UuYJW
	 ukLzGR7qLgWEB04ZxpbyqyL3GrD5pWDW79RKMGV2hjRJHCM+qKT3yujQhzNWgGBYtS
	 O3hMDmw6T7Rphz35UtwaFkyu3sg5GhKePTIx4OYO9BDkD+dIG/AvfdvbVS2JP/a5H6
	 eUHoS2fxgxjChOJdB8+UdTTCkgy+r9hqMZVhNEEXHgLp/kprcbqF8bLHJUW4IOLlNo
	 Y8nZWR0vxWBMw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9D98A1AC583F; Tue, 28 Apr 2026 02:00:10 +0100 (BST)
Date: Tue, 28 Apr 2026 10:00:10 +0900
From: Mark Brown <broonie@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios
 property
Message-ID: <afAGmqGtHpVXzyKr@sirena.co.uk>
References: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2zrSDJYCYMRGO6XP"
Content-Disposition: inline
In-Reply-To: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
X-Cookie: Victory uber allies!


--2zrSDJYCYMRGO6XP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 02:54:43PM +0300, Alexander Shiyan wrote:

> -  vsel-gpios:
> -    description: Voltage Select. When this pin is LOW, VOUT is set by the
> -      VSEL0 register. When this pin is HIGH, VOUT is set by the VSEL1 register.
> -    maxItems: 1

In addition to Conor's concerns have you checked for existing usage?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--2zrSDJYCYMRGO6XP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwBpkACgkQJNaLcl1U
h9CCbwf/afmjDjEauou8tx40cwNPsDwgNSU/ys5LlPO4/xvk0YU6lhbQ3HAUDeo4
k0YLDtI7xZT1pyNGGTYh1S9TuX2YBDvZC8vdmRN2TD+cgX4a5/p6rYTZ3UQISg7T
gxX/Hbgwouif3frMNKLCjnrpsu/njTpvWHhSnr44iGzmaGDL0GiggmIGQGeb2/KL
XtbCHHc3HmLsxKUz18VA+jOqgmqQ+olRk1QAkzj5jTzizwuS4LWnuZai7Q3W5065
5Rh2N1Eh5QrYAv5ci+NUaAFPwm3C1zh8ZxVSVEkV1IU7vhsk6PvnQA+M7ZSA5o9P
xSYlxLnI9z3Pkyh2fSeF8tmBGZQ+yw==
=m2yK
-----END PGP SIGNATURE-----

--2zrSDJYCYMRGO6XP--
