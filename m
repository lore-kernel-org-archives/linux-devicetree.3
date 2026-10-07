Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D784657E0
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399842; cv=none; b=qFvE8gaxXqix/lDS1lr9iyANb6+AaiD/qqmRWiDFBZg/twPlVN2d/1AHl7TGGTW0JRkJsXo/VcBXlOlI9S2DzbVDqFV/AAMpF5D0O76i8eboBkCt68iOrCfS/Kq1FBB1zrNyGe6nV1eB4Hffl+Voo3cO1bS6ow+sMu+vhw9JQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399842; c=relaxed/simple;
	bh=puKhUibDN4oi+DxP4V+YSbgUuVgeyYVpzlGvOCG3iyI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Tz1H8YsGInlk7FUsw2etnKbi9uxR3ZbQkr3UEChHQXHttp6EXkVdzwAoB56/mgdnzncSwUBn/+6AWrq4Au8pg4aMVncEDHHiyh5ikSIGZFLDInP0N8Vp/aZIJ4ZPC94VlYsGW8Mj0Jg1ln6NsVRX9ICzeDuUfK7OdY+0jjsSBC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuNilGqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuNilGqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B50F1F000FF;
	Wed,  7 Oct 2026 19:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791399840;
	bh=0oVbSnFsYtB5zdPmmDfey6V4KohObH3xwS7nBlaRWG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NuNilGqSjRS+sxaRUspj6uysygQPAa+1wWYp91uWt9Aywb+oM5CcE/P/Q+bzWXV8H
	 7gYBE5GNe4WLQzLhR+mGBO0J3jEraCXGplJ/ogife9nm+UZ7lDnjc3rFb1Smta0Rd3
	 2AtJYpieqrVBEqTB/tFL0+yQN+LhKsIDxnPEru8sGXOrbQPuCvdMu1dbeYlKhpuoqM
	 S7bdGaTPGGcI1+86tbM5YVuUwQrW3rGliMiGrLBLWUivDzwd7PIdg3uO2tTcE53Fqk
	 nUaK+rpALaaL6DMMbPZNEPiWJXw7ihjMECCwNr1Jci+zPEyUV869+FaqU5qQtQ35Tz
	 1zgZvxhOHK9QQ==
Message-ID: <sashiko-outbox-163304@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] kbuild: Support directory targets for building
 DTBs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
 <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 19:03:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kbuild: unconditional need-dtbslist=3D1 causes unnecessary dtb com=
pilation and dtbs-list files during standard builds
--

commit 645916678e1f6dbf830062f35ddde56a42d6b0df
Author: Rob Herring (Arm) <robh@kernel.org>

kbuild: Support directory targets for building DTBs

This commit modifies the Kbuild system to allow directory targets for
building all device tree binaries (DTBs) within a directory. It updates
both dtbs and single-build targets to use directory rules.

> diff --git a/Makefile b/Makefile
> index c307ee9293bcd..75d290c2b7d88 100644
> --- a/Makefile
> +++ b/Makefile
[ ... ]
> @@ -2234,7 +2234,7 @@ prepare: outputmakefile
>  # Error messages still appears in the original language
>  PHONY +=3D $(build-dir)
>  $(build-dir): $(single-build-prep)
> -	$(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1 need-modorder=3D1 $(single-g=
oals)
> +	$(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1 need-modorder=3D1 need-dtbsl=
ist=3D1 $(single-goals)

[Severity: High]
Does adding need-dtbslist=3D1 unconditionally to the $(build-dir) recipe
cause unnecessary dtb compilation and empty dtbs-list file generation
during standard builds?

Because standard KBUILD_VMLINUX_OBJS targets (like built-in.a) depend
on '.' (which evaluates to $(build-dir)), 'make vmlinux' evaluates this
rule to recurse into the source tree. This exports need-dtbslist=3D1 into
MAKEFLAGS, which is then inherited by all Kbuild sub-makes.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index c4e4663902844..c7ec2a2a308ef 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -23,7 +23,9 @@ dtb-y           :=3D $(addprefix $(obj)/, $(dtb-y))
>  multi-dtb-y     :=3D $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y      :=3D $(addprefix $(obj)/, $(real-dtb-y))
> =20
> +ifdef need-dtbslist
>  always-y        +=3D $(dtb-y)
> +endif
>  targets         +=3D $(real-dtb-y)

Because need-dtbslist=3D1 is globally inherited, it now unconditionally
appends all device trees to always-y in every visited directory.

Additionally, it triggers the generation of dtbs-list files across the
tree via existing code further down in scripts/Makefile.dtbs:

scripts/Makefile.dtbs:
    ifdef need-dtbslist
    subdir-dtbslist :=3D $(addsuffix /dtbs-list, $(subdir-ym))
    dtb-y           +=3D $(subdir-dtbslist)
    always-y        +=3D $(obj)/dtbs-list
    endif

Could this unconditionally traverse arch/$(SRCARCH)/boot/dts/ and
compile all device trees, regressing build times, while cluttering
unrelated directories (like fs/ or mm/) with empty dtbs-list files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-dtb-dirs-v=
3-v3-0-b3ab32b64fa6@kernel.org?part=3D2
