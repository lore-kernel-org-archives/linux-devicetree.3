Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E536D51D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714775; cv=none; b=UgsoThzTxHrEmtkEgjirud6xIkjlMgmf0v6aQg5Pa4AxDGLCYqXsNJXOSGyivEJYj/Z+ki0XZv/msz7HHwFERDfeOZkQuQ2qZKq+SV8ZzEXknPnWOMIXrc3ezDkXPmg+c/NUKcuxW9Bez/tUpFpSO6mIu7iGYSsL94DCToLbp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714775; c=relaxed/simple;
	bh=ImzY33nyS55h/z4JuXquHYMH1FHZGEUdMk6S2oFy62c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8de3p9sBdmYNw/zXiOXozAjwAXtWTYgSQcnxfLm7beMoDE3NHsg4Rexd0DCjOYUEGvjuuonSMxbLbniZ9dP2v7nFjZd/tDZLXsFJXb0ZsjavzkJf0uBBirGxORR8OmuMZpX2sHES5nO7AaID64fTvfI5F3rRBTaIDbwIveKDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0pRZOFI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0pRZOFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0182CC19425;
	Wed, 13 May 2026 23:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714775;
	bh=ImzY33nyS55h/z4JuXquHYMH1FHZGEUdMk6S2oFy62c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t0pRZOFIAHmGTmQlOyKltF1haV3F7KLxnCfP24J5vBG/t/9v0UKv5iZlvPNfGPiEU
	 Ej9U21gioX17/8TAZaQFGeBXON9yXDEH09cHxD1MqfRXEflzd7uHSO5BCKRUXQhgSw
	 rWycL/MSQ/R89UETxamv95BjNHlbei47XLflEUo8UpGmsu9JeccJgRDVPNrv/d2MRH
	 axYBWSHJAFozmoXX+90nJEMccVnzpTMzV5uO0rONrtpVbyaV3koupemtErn5FvTBnf
	 WNklN8pPK93lXSmfWb/ZaHsjEUG0L6Ea3mdLekG3VC2E4hriVTtS15AGQ5lTgDiIfh
	 wS4Ort+xcSKvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/bridge: lt9211: Add
 drive-strength-microamp property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Boerge Struempfel" <bstruempfel@data-modul.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512164609.3390700-2-bstruempfel@data-modul.com>
References: <20260512164609.3390700-2-bstruempfel@data-modul.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:26:14 +0000
Message-Id: <20260513232615.0182CC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The values proposed for `drive-strength-microamp` are incorrect by=
 two orders of magnitude, exposing an internal reference current rather tha=
n the actual pad output current and violating standard DT unit semantics.
--

commit 97454d8731d851d94cc1fb58faf0cb4d4b8ca94c
Author: Boerge Struempfel <bstruempfel@data-modul.com>

dt-bindings: display/bridge: lt9211: Add drive-strength-microamp property

This commit adds the drive-strength-microamp property to allow configuring
the LT9211 LVDS TX output driver current. It supports 16 discrete levels
ranging from 12 to 36 microamps, and sets a default of 25 microamps.

> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.=
yaml
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
[ ... ]
> @@ -31,6 +31,13 @@ properties:
>    vccio-supply:
>      description: Regulator for 1.8V IO power.
> =20
> +  drive-strength-microamp:
> +    description:
> +      LVDS TX output driver current. Sixteen discrete levels are support=
ed,
> +      corresponding to the following nominal values in microamps.
> +    enum: [12, 14, 16, 17, 19, 20, 22, 23, 25, 27, 28, 30, 31, 33, 34, 3=
6]

Are these values exposing an internal reference current rather than the act=
ual
pad output current?

A subsequent commit in the series mentions that the hardware supports discr=
ete
current levels starting at 12.5 microamps with a step of 1.5625 microamps.

However, standard LVDS signaling typically requires a drive current of arou=
nd
3.5 mA (3500 microamps) to produce the required 350 mV voltage swing across
a standard 100-ohm termination. A 25 microamp drive current would only
produce a 2.5 mV swing, which appears too small for an LVDS link.

Since drive-strength-microamp is a standard property, using it to expose an
internal reference scale might permanently hardcode incorrect physical units
into the device tree ABI.

Should the enum instead reflect the actual multiplied pad output current,
which might be closer to the range of 1250 to 3600 microamps?

> +    default: 25
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512164609.3390=
700-1-bstruempfel@data-modul.com?part=3D1
