Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF2C3655CE
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779474986; cv=none; b=Em0xqCmfhBdV0oMOK7oQ4dDHUlps81SM0YDfqrjCYuMACKIujO+bBW+UptXqa7QwmZorG5Cyx/Z/Kbw243chu4r/E4rTHWLsOOlIdCVy6hnTV5NoPySe//a70NT2lAeOqtBCnhlrfZF2zSOQVyIzI1vm0bHO+mSM+rVIji83DYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779474986; c=relaxed/simple;
	bh=00XWa3BX3XdTM38CesqF17bSkX+kDH7t6CWa4dSpoJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kcgWg9rl98kKUQ5lMyeZ0/MxOD7CvhXpGUFzqqC2CJWAvzQ6fnzGp+Puctz/Me6e3IDFitCA0HUKYYarr3CBaoJHRbf+LS/+IvE9HNgIj+aLAumAYkaPTgfFUt1RQXwyY72JFiKAWKOqHdNe3c3SgZaJ5ZcWbgha2Eei2aSH0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9hmd/ji; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9hmd/ji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E1F1F000E9;
	Fri, 22 May 2026 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779474984;
	bh=iN1X9SH7uYtro4RMfpp4ce5+2qMpLlBP+ilcCIcUiG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9hmd/jiRiH1UzUFkNC5h9kNfrduwlQplUdfgGQPG9YrgcE3XVTuaWpBeF3NhGwyu
	 PxjTyN6w1nqGfJrl+kQsTv0eMxoCXMVf8enTIp9OLaN/O+zrIygUrOobxYgVQefQbO
	 BIS4wD0alUujifW0wqEMNGFxOs2s0dm6Y2qxO3S3VOuP6GKarY2DFtQ53vp3ZCB4Ky
	 P/ikKmRcfXH8uv4zSOJeeuB1XtkTqs5PDl6ykgr+ckirFn596J9TabUlgcR6ThPJjC
	 XPH9ZEKOXtKR3jFCjO/BWnUMoY6wGGi7G/tCBuwZ73xpXv69e3l+rKV1foxD6CBBsU
	 t2tb/SlNBdoAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: wire style checker into
 dt_binding_check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <93923232b32423d33dc3b6632165ccc9571dea8f.1779472837.git.daniel@makrotopia.org>
References: <93923232b32423d33dc3b6632165ccc9571dea8f.1779472837.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 18:36:23 +0000
Message-Id: <20260522183624.97E1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The style checker's exit code is silently swallowed by the `jobserv=
er-exec` wrapper, causing the Make target to falsely cache failed runs as s=
uccessful.
--

commit d2626a1d6568000139a4bc557d46c27f248fcea9
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: wire style checker into dt_binding_check

This commit adds the dt-check-style tool to the dt_binding_check_one target
to enforce relaxed style checks on the device tree bindings. It uses
scripts/jobserver-exec to constrain the worker count based on the GNU make
jobserver.

> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/d=
evicetree/bindings/Makefile
> index 7b668f7fd4007..00149e8242611 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile

[ ... ]

> @@ -46,6 +46,18 @@ quiet_cmd_chk_bindings =3D CHKDT   $(src)
>  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
>  			  && touch $@ || true
> =20
> +DT_CHK_STYLE =3D $(srctree)/scripts/dtc/dt-check-style
> +
> +# Feed the file list to the checker via @argfile in a single Python
> +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> +# claims slots from the GNU make jobserver and exposes the count via
> +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> +quiet_cmd_chk_style =3D STYLE   $(src)
> +      cmd_chk_style =3D f=3D$$(mktemp) && $(find_cmd) > $$f && \
> +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f \
> +		      && touch $@ || true; rm -f $$f

[Severity: Low]
Does this wrapper silently swallow the style checker's exit code?

The main() function in scripts/jobserver-exec does not appear to pass the
subprocess exit code returned by jobserver.run() to sys.exit(). Because the
script always implicitly exits with status 0, the && touch $@ command
will execute unconditionally even if the style checker detects violations a=
nd
exits with a non-zero code.

This will erroneously create the .dt-style.checked stamp file, caching the
failed check as successful and hiding warnings on subsequent runs until the
files are modified again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779472837.gi=
t.daniel@makrotopia.org?part=3D2
