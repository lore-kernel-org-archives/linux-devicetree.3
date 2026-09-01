Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3C3382F7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 21:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299509; cv=none; b=c8xpt0xgjrbae3tAabO3Zli8iBP7e8jOfyo2jOa8ut+Es5KuSC0D/szoG8a4UuTrwV3XiFGlqDEfSJ//X11Bk3Ve6apKg3vGCNTiHkGo8OItKMYO5S/33kNvxvW87qGsa6hCAi7bFJC1sa8aKPqIbTgRGQNriMIRp3HJA7gHH8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299509; c=relaxed/simple;
	bh=4eOYclOCYzAK6byIfEBii+HZsdRLnzb+1LwndPjnfjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=szNfhqh5hFqtg7nTwOJ2swrNdP97ovLSzyx2E8fx/diQaiL/VegiSM6Ea7CziqIIbtsp6ehiyfITR38zQfJyoijr+U3pM8iW9koo4UdW+cq/Wa8t/f/vuw0hsylJmGFVIFqLzLdQwl+DKLuikxnUJqF//pkgTgtKQHIG4fGGqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXfRKycK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXfRKycK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B78F1F000E9;
	Tue,  1 Sep 2026 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299504;
	bh=b2srLRaOEajEJaRiOg/l1h8wimnhBwVQpHXsDoekFLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OXfRKycKgEdDGfiFZmDpGxpS1YOuO0xG8Wa5hmV+yC0OtfnCrPHf5QIBrwPPrvLgf
	 i3Q03wJeJ716QHcIBsY5U7WwU4mdUMWjPbo4IMu7gMAha9rJU9+CbMq6JcKbkeFLJ9
	 +98TbMDBO9OeVQf/1Ii6g8bp6IfP46gE1bW0i7I0JVSAFafiu59IABpAfmVbHUVHPE
	 YYFfxFKdTP3fU0IJAQu3d1SOFO+kf22lQ1h2PPPytgE9qbNXw4qQsjW/FRUs0sK5FS
	 fzUWUikMB9ONu1AVYKDvrhxG+1BskzQRPFQaq/flW/1wbFCd0/U0de/kuVVi81jTkx
	 2Cf4s49PwSj3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: omap: Add BeagleBone Black RevD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Nelson" <robertcnelson@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-1-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
 <20260901-v7-3-rc1-beaglebone-black-revd-v1-1-f521950b777a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:51:44 +0000
Message-Id: <20260901215144.8B78F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `beagle,am335x-bone-black-revd` compatible string is pla=
ced in a 2-item constraint block, structurally preventing the use of standa=
rd BeagleBone fallback strings.
--

commit 17e0af4d26654f2aa0193ef1f9c56643b10d76e4
Author: Robert Nelson <robertcnelson@gmail.com>

dt-bindings: omap: Add BeagleBone Black RevD

This commit adds the compatible string for the BeagleBone Black RevD to
the TI OMAP device tree binding schema.

> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,6 +104,7 @@ properties:
>        - description: TI AM33 based platform
>          items:
>            - enum:
> +              - beagle,am335x-bone-black-revd

[Severity: Medium]
Does placing this compatible string in this specific block prevent the use
of standard BeagleBone fallback strings?

Because this block under properties.compatible.oneOf is configured for exac=
tly
two items, it restricts the compatible property to just this new string and
ti,am33xx. This structurally prohibits including standard BeagleBone fallba=
ck
strings, such as ti,am335x-bone-black and ti,am335x-bone.

Attempting to define a standard 3-item or 4-item compatible string hierarchy
for the RevD board in the device tree might fail dt_binding_check. Could th=
is
cause ecosystem interoperability issues if it forces the omission of fallba=
cks
needed for U-Boot quirks and userspace board identification?

>                - compulab,cm-t335
>                - moxa,uc-8100-me-t
>                - novatech,am335x-lxm

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-v7-3-rc1-b=
eaglebone-black-revd-v1-0-f521950b777a@gmail.com?part=3D1
