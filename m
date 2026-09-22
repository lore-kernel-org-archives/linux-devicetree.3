Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73505505CC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112649; cv=none; b=Lm8M+LdsKmSz0GZVl8DuT5zSX0493w+Xw8M/wk1rExpLPBU2JRWFBjmWM0mFa/j8OLeEJotHN+QKKSAagimqaqXXuTEP5VmEEeyh3ZSQ2gnYMT6n0BiZZ0kyk4Y7rxoSKCrm88xXuLaVIIg4LpyGCq+gDS+9xmJcNun6zCWMDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112649; c=relaxed/simple;
	bh=1kATYzyb9lXXvg20tzLBxSmA5JYjU053H4l8sw77ws0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUqiAkIaagOXFH0wnlX05bqS3qebwjE+v9PqbtWlboh72SHRm+PNN9Gz3jUg9MiFbNn3cbIZlmd2ut49ZkMcRo8i3bN1vr0CQC8nadmEejX4URGiFq/HmBJMUg7BuYbRi4/0y1arTiRt+zUc0eWK9cTf8V37dYBACIypRlYy7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mzl4yO+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mzl4yO+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C78D1F000FF;
	Tue, 22 Sep 2026 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112620;
	bh=yk9KVGsZHAoJrk/a1r7KtJoqBk6jSqcPPGzpDIZv9hU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mzl4yO+DITXxMfn04H2TaHWd9E4JJRcy9b1kMExUjOwaXGf910NveZLPFcENlunhW
	 fHL1k4F6VOB4WRMyC2Yr//ijpAU/Vb6HDOzendkKvWE1vPW193fXfsYhOiVAPxCH8O
	 PMph9wIWFu3elM2i+5aoOFPBC9w88NbbAGhHTRMTSo/svosiF82/jiarmh4FpeV3C2
	 KoNfeqpeaPfm0eKs3g5havmsic7T4rT+n42S3L1CR17tH3dkm1Sh/EpY9irqYaXwfm
	 uzZf7Z9e7vvRNnV/KSNFOeCD+nRJZ/6VdC6/UU89Pm5bM/PUOoARYqkb0Sl9Odl3Li
	 x7EWdJaSu/LWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: Add MAX20024 sd4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922212140.1118832-1-robh@kernel.org>
References: <20260922212140.1118832-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 21:30:19 +0000
Message-Id: <20260922213020.4C78D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] docs: missing MAX77663 in sd4 regulator documentation
--

commit 6ef52d57b8dafa6b7fbd7ddad9b91b83cd6fe092
Author: Rob Herring (Arm) <robh@kernel.org>

regulator: dt-bindings: Add MAX20024 sd4
   =20
Allow the MAX20024 extra sd4 regulator and its in-sd4 supply in the
MAX77620 regulator schema.

> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-r=
egulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-=
regulator.yaml
> index 7118c34961ba0..0f2901cab8afe 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulato=
r.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulato=
r.yaml
> @@ -10,17 +10,17 @@ maintainers:
>    - Svyatoslav Ryhel <clamor95@gmail.com>
> =20
>  description:
> -  Device has multiple DCDC(sd[0-3]) and LDOs(ldo[0-8]). The input supply
> -  of these regulators are defined under parent device node. Details of
> -  regulator properties are defined as child node under sub-node "regulat=
ors"
> -  which is child node of device node.
> +  Device has multiple DCDC (sd[0-3], plus sd4 on MAX20024) and LDOs

[Severity: Low]
Does this description omit MAX77663?

The driver code (drivers/regulator/max77620-regulator.c) defines sd4 for
max77663_regs_info, and maxim,max77663 is a supported compatible string that
utilizes this regulator schema via mfd/maxim,max77620.yaml. Omitting it from
the updated description string creates an inaccuracy regarding which hardwa=
re
variants support the sd4 regulator.

> +  (ldo[0-8]). The input supply of these regulators are defined under par=
ent
> +  device node. Details of regulator properties are defined as child node=
 under
> +  sub-node "regulators" which is child node of device node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922212140.1118=
832-1-robh@kernel.org?part=3D1
