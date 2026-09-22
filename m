Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026204519A6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112866; cv=none; b=PD6ApEewlA93GidvAsSHamMtZTtBu8A3DEzq2CKmfGWWwmQMLh9uQ05Hud1ZtnvJgAFkD0hL2+5Yw5nRDMWOz0bAD186ijwpr1J07h2BugAqWEszhlCn09LMaG/aoK0fLGd5AKGt4mjNs1sA9SJfjalSfH3fpGCtGQdsdAnc0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112866; c=relaxed/simple;
	bh=KbkFGY7FQXopXiA5Fqo+Yf9ug8rgrH+/IPvc16nqThA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RMn48ufUyXSomQbQccOGN5ii84EccWcCjvcHPJZDD7WVrtHaRDL9BHzDiebD4L5Sq0kw+OYy5ruVEbCgBLuP3pPV5yfzZM+XgtcQNfhXSMI/vj2AYYmeTRgiT3DIZiU0oAI0rk7/BFRVfWiVxMGgAAFAgOQ/kH5Yfa6HC54SaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8U+EejF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8U+EejF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DC11F000FF;
	Tue, 22 Sep 2026 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112853;
	bh=lGN3TnMbNO9qF7y1mWtY66X5Pc7QZZWyUhTBfGpEeAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J8U+EejFvxSyoiLxh7osCdCMtVq/7gZ65463NvqIyRCm0tZmlqiekKFhIX4PErUf6
	 xVY4TpgdUhnhlVEqMPGHN/VdKBST4pWQh+TmA0KiixroLu4LkT/C9v5L04s5TEuKBP
	 9j+K1fh63AgCpYsZ1s0sF+Afh+UpASpQOQ1iWw08NaMgXYRjE0OZHHbFw2D1KpqwLJ
	 UsYaQIJ4DDgOATdZZ51YAeivSs4dJEyGzPg9iBGSPgZWypfawNJHCs4sYCzldRQFPd
	 /Tz3vuGRotIjZDmIIqan3gaXWR9bPEojeRdj5LFr3VbeqHh1Ymos7b4e48ZB60+61D
	 z/axFJgTOtVug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Fix TAS2563 address constraints
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922212122.1116270-1-robh@kernel.org>
References: <20260922212122.1116270-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 21:34:12 +0000
Message-Id: <20260922213412.D6DC11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: ti,tas2781: silent schema failure from scalar const=
 on compatible
--

commit c73c1b75f173e00cf5a4898fb3f42699d6a9f494
Author: Rob Herring (Arm) <robh@kernel.org>

ASoC: dt-bindings: Fix TAS2563 address constraints

This commit modifies the conditional block for the TAS2781 device to apply
the register range only when the compatible string is exactly ti,tas2781.
This is intended to prevent the TAS2781 single-address rule from incorrectly
applying to TAS2563 nodes.

> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Do=
cumentation/devicetree/bindings/sound/ti,tas2781.yaml
> index aa5a317b5a361..50c7792b24f81 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -219,9 +219,7 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            enum:
> -              - ti,tas2781
> +          const: ti,tas2781

[Severity: Medium]
Will this scalar const constraint on the compatible property cause the sche=
ma
validation to silently fail?

Looking at the allOf.if.properties.compatible evaluation, the compatible
property is always parsed and evaluated as a string array (e.g.,
["ti,tas2781"]). Because JSON Schema const performs strict equality
validation, checking a string array against a scalar string will evaluate
to false for all nodes.

Consequently, it looks like the then block enforcing the reg constraints
will never be applied when checking device tree nodes. Should this use
contains: const: ti,tas2781 instead to correctly match elements within
the array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922212122.1116=
270-1-robh@kernel.org?part=3D1
