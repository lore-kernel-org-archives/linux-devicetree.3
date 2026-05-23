Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C32D3EC7
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565249; cv=none; b=OkEoh24x8oUiXsh2UgIxOwAfrl6mui5ordmfzpXRDGBeJD5wgVr9YxTviueovPAXm7kcxj0lTn8kiAXgCpqV+lSgaaBg3BliHwLK3iXszIT8c97PH2Sq1GEJ7lKManZG+4N3I43zzKHiMZCVrpUT6zuKD5MSrv9ET5NeZsMKCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565249; c=relaxed/simple;
	bh=gCdtbYd19czep8B9qhxe1IDEN6hiuwOvIPYf2T1mEjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K9T/ad0zOpIZNIHSoo0oZYqW+vJ4xUTMHV5kEwXldLfDrSojlkhRX7rrKnyRtGCL2Nnk21NA9jxmuGvyD4gcdXSsDR1PoJsIyRsFp2COlLlBgA475Kvj4ijUIXCttklo2t/nroekw3gBd/FHbPYx4kkX0Uh89cxXwKyTePfrhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5sW90x7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5sW90x7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7CA1F00A3A;
	Sat, 23 May 2026 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779565247;
	bh=vQYJJI99vi/asrvc/dUOuBTndZ5EEQCHVxaF1s3lxvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5sW90x711ke498qxG0MVB/euoAFQxLys4oKt0HHwbgt7FklyHMuifaNoV+/u59Ao
	 hwbJg8/N5aTgp2uq8B9M84nlQRoT6bN5K6jxZEyHVW71X5loVMynGZtWK9sz8HZvAk
	 0s1WnfRk3rsw34nxsRUGDSVaeYFO6QTchvpbxT0p71gJ0uchHQ9wTV+gxEKGTx9aiY
	 wy4lGWxLwTJ5z5ousSSjU+HxW+62Pt0A7fzEgECEryYtCNPxKS+I1LQIMYZ1yanCtg
	 SYVPwdX6Hi7yA3/VXjJUFR0g8mZrVT0J6CIrJ4t8Fc4lYflSklqQv9mXQt223aZAcp
	 PvtLgIZ73PDdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 19:40:47 +0000
Message-Id: <20260523194047.AB7CA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding 18 items to `clock-output-names` in the example triggers a `=
dt_binding_check` schema validation error due to an un-updated top-level co=
nstraint in `renesas,cpg-clocks.yaml`.
--

commit aaa0ff6ae07f5974071a547fef4a5b41bc484428
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE6 =
example

This commit updates the R-Mobile APE6 clock node example to include
the "zt" and "ztr" clock-output-names entries. This aligns the example
with the expectations documented in a previous commit.

> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.ya=
ml
> index 2197c952e21df..b6ee8c8efd46d 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
> @@ -60,7 +60,7 @@ examples:
>              clock-output-names =3D "main", "pll0", "pll1", "pll2",
>                                    "pll2s", "pll2h", "z", "z2",
>                                    "i", "m3", "b", "m1", "m2",
> -                                  "zx", "zs", "hp";
> +                                  "zx", "zs", "hp", "ztr", "zt";

[Severity: Low]
Does adding these two items cause a schema validation failure during
dt_binding_check?

The top-level clock-output-names property in renesas,cpg-clocks.yaml has a
maxItems constraint of 17. Adding "ztr" and "zt" here brings the total
item count to 18.

While the underlying limit omission occurred in the earlier commit
2abdc3dcf978, modifying this example to 18 items will now directly
trigger the overarching validation limit error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523192622.5660=
5-1-marek.vasut+renesas@mailbox.org?part=3D1
