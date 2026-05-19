Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CBF1917CD
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178639; cv=none; b=Q3dU0CbhHJO4AxxJjIK+m0DgrBOO2NjdnYhRuVIFLWjqXgpN0RoQN7G1VzGC25OhNqmOOtOR3tICTK8emCaZOpUsesE4S10GRojHW6BSYqOLgOHaTl7PA+D8MFhzwBdG6FMaFk+Ti4YiSImLVnyBpME6p8cRdxyl1XLkvkA+F5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178639; c=relaxed/simple;
	bh=+CkX3Ct25kkDaGBbufT0s6p2kSmiSqfV78wPFNx3uM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CR3h8JLlCelamboUEfnCV9XUbFaEYicYy7BcnmKYSAHo6VTnyrtNv9tAZHqAhkxfl4qlArhR0wUTVDeUssfzkuv3yD7xKoBxjUySrKYvxc1qCnUMqSzB2JfcvJQKkFQ4c8UzanhdtrVlXqhtAjXyADmNsEzaKQbK5T3p0N9uFrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT3SeN3u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT3SeN3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F790C2BCB3;
	Tue, 19 May 2026 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178639;
	bh=+CkX3Ct25kkDaGBbufT0s6p2kSmiSqfV78wPFNx3uM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HT3SeN3u+g0g/hInKILA/uADl6s140SIpSOtDer1RHyA6cj6jXrzWB85QcTTBU7BT
	 /0k/4x9yRq9Q35Tywl0CwlJwBmMjC4Ngd6CSHA37GvXdvi6/Bkr+Zx8oO3nP7qYxl0
	 vcim2gmYg6oewDrxgVpZSZt+LzW5MnrOHshUi3yni5uMTalBSPxOB8Ea4B1BVI6+LD
	 f2AgnMBui3a0u4qkIk5yTP22oDDy/Dkv9wGiTpKXA/o00Anl76WHGIIqEVCqnk/ORg
	 lMQvoM5Dgg5p4zXmEwhUJ4OuKq+dmTSUnJV5nCOKA9DTln1DrM2BErNohKb/il/u72
	 W3tsTbn3L2WdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use
 SCMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
References: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:17:17 +0000
Message-Id: <20260519081718.4F790C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds an include directive for `<dt-bindings/soc/renesas,r=
8a78000-mfis.h>`, but this header is not included in the commit and does no=
t exist in the repository.
--

commit 12e4bb3b81767937e835c191fd20007f6b57db69
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

arm64: renesas: r8a78000-ironhide: enable to use SCMI

This commit enables SCMI via MFIS-SCP and the STCM transport area to manage
clocks on the r8a78000-ironhide platform.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm=
64/boot/dts/renesas/r8a78000-ironhide.dts
> index a721734fbd5d0..86bbe5fbb118a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -6,6 +6,7 @@
>   */
> =20
>  /dts-v1/;
> +#include <dt-bindings/soc/renesas,r8a78000-mfis.h>

Is the dt-bindings/soc/renesas,r8a78000-mfis.h header missing from this
patch? The file doesn't seem to be included in the commit or currently
present in the repository, which causes a build failure during the C
preprocessing step.

[ ... ]

> @@ -20,6 +21,23 @@ chosen {
>  		stdout-path =3D "serial0:1843200n8";
>  	};
> =20
> +	firmware {
> +		scmi: scmi {
> +			compatible =3D "arm,scmi";
> +			mboxes =3D <&mfis_scp 2 MFIS_CHANNEL_TX>, <&mfis_scp 2 MFIS_CHANNEL_R=
X>;

Are MFIS_CHANNEL_TX and MFIS_CHANNEL_RX defined anywhere else? Without the
header file included above, these macros remain undefined.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519074702.3308=
-4-wsa+renesas@sang-engineering.com?part=3D2
