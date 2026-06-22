Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45838331F
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114837; cv=none; b=ndaJfKjNhQWqck9rKBkYXWXH1e21IoMCM/tkBdfFyUtniLY1J98BM1ddXEM4auWA+J2wNDEjKQyKsoYmn/M8dAqFE6EiwD8bqdBbu66FpYXPYjBzry1E1Js8K0+/BtcxtjYo6ufWbWIEex8giP2ZL2n+xqPjV4IE+d23yW1Ooe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114837; c=relaxed/simple;
	bh=t17gu4yMU3FuF4L51YWSp82BGqiZ9I6mOFZjfE5+VR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WVXpDGEez2zMQalK6hyMwn1MsB38+S4GILJjkzPMEz4KGJgvjxgKjMssVmPCJuOrR8votvYWH4Tz0Gbr36cGpH7nlw86IX4Qf+yknzlR+akHbFD4THniLbhFk2V4J5FZyxCgIF/MSStx7e4icn3vR7ezJBCv8TPcREoFKWXMoDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4DZkxUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4DZkxUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5241F000E9;
	Mon, 22 Jun 2026 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782114832;
	bh=ZEsFU/x3PzzbAkfC5cDRQrkFi2d1a/Tsug4d0KShVBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G4DZkxUUCOomfxyYAWxVIfOnVgFTNyZzfC1F1or8IXh0m2b8i6fvWeCSxV+mIdM2/
	 jrKfDZg1b/jjLIUyC5Dm5shBIWLiUpDPXwPSGSdBuPTpCyJQsnHIRfz6eMBCng3Mv1
	 JWra6tTMl1frP6AooP9TI1ooqv46ieeY4C3kaoR4OEkB7c6qT1MrSStZr8rmUZE06w
	 1qTYjk/RkrSnjLxaleHewL6oqBAS7A5z3N7KIo47Z1BMLIgbPv8OcFPAQ1hyc9Kdb7
	 UJuViGdp+pUd0Wuij8NMpag8uRSbqLTbODUhqTfJ/cXcl0vtRN59taTDS3xU8Xz6Rq
	 10SNT+KGVwqjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: add Axiado AX3000/AX3005
 SARADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-1-e57c7c7ae675@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-1-e57c7c7ae675@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 07:53:51 +0000
Message-Id: <20260622075351.CA5241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing IIO mailing list in MAINTAINERS entry.
--

commit 474cfbabb6190ddd4a26c0a176ce44e7335b5716
Author: Petar Stepanovic <pstepanovic@axiado.com>

dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC

This commit documents the compatible strings, register regions, clocks, and
other properties for the 10-bit SAR ADC controller on the Axiado AX3000
and AX3005 SoCs. It also adds a new entry to the MAINTAINERS file.

[ ... ]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d6db8cb608f3..963ac23a0a21e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4336,6 +4336,13 @@ S:	Orphan
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
> =20
> +AXIADO SARADC DRIVER
> +M:	Petar Stepanovic <pstepanovic@axiado.com>
> +M:	Akhila Kavi <akavi@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml

[Severity: Low]
Should this entry include the IIO subsystem mailing list?

Typically, IIO ADC drivers direct patches and discussions to the IIO
mailing list by including an "L: linux-iio@vger.kernel.org" entry in
their MAINTAINERS block.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-axiado-ax3=
000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com?part=3D1
