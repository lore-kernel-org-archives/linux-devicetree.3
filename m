Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8E349CDD
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707963; cv=none; b=UdoJWFvi4E/T3yJVFTF2Wb2neFuwXkpqMXJKe04Rx6XQzt5hATWJfvUqmoDyK6UWH3TQIscrC+TCDDhbhAkQHlB+wVOYvl7fgeV93IhPt5abwfqth+WfuQFlIaVhPkWpdalW9GTZc0Oixuqau3DYjWBcCzsPX7tTWtV8tBY85J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707963; c=relaxed/simple;
	bh=T4mvEjDBF32etTEH1Rm5AVcbmWA6alSBfMXsbB4Fcks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rP7vA+rxT1BS3EWaEmARlJ4lA5l9M31lkkhMhWIMUsDKYX7ESGISthBAC34ii8kWwNtAly6QEABT16YYcj+gn7ejGVC5jaxGvbZd6LBQqZkDlrE5UfVMR1n4CPuTEPo8JJrbw+BpaViB+2VmwMw2WVZDE4+2Wi0cXayWV1QreAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqMsENFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqMsENFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F771F000E9;
	Mon, 25 May 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779707960;
	bh=EyX1ZMr5bQ1yURG/3xfON+6RF9CsLcDCCbZL6+FeTe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqMsENFtuuXj2rx0m/H6aW82PpYTxyGalgvLG5GE2Mqnqbze/gv1qsuFql/EIaf4O
	 RcWo/lwfM/6crid/rnZnoMderCtzGRCvdZKF1lZKthiAADTrjyZVyPizZKuj3fptoN
	 cTn2v7iHT1wKFP8KECYlDaeIxf/yi6oVWDCe2vtp0PJ8Wyj/8B8hYnH1TFhFi1/xm8
	 sFka2Fpc0U7Syad37hyBD6AYBFv+dyJYdblZ0AZ7FTNCEpZw7WCMtcP2VCXlRgO6AV
	 vU8rQlxoDzbyo5lSn8N7qzo6PF+GD8B8aEpu8XKq/zZ9/yFRG5/8VAJxSOrRzSPXHx
	 TUOYENCZ69GTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:19:19 +0000
Message-Id: <20260525111920.15F771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Strict array ordering prevents the independent use of newly adde=
d optional clocks.
--

commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
Author: John Madieu <john.madieu.xa@bp.renesas.com>

dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family

This commit updates the clock bindings for the RZ/V2H family SoCs to include
the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
AUDIO_CLKA input is fed internally and thus does not require a binding entr=
y.

> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.ya=
ml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -26,16 +26,22 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 3
>      items:
>        - description: AUDIO_EXTAL clock input
>        - description: RTXIN clock input
>        - description: QEXTAL clock input
> +      - description: AUDIO_CLKB clock input
> +      - description: AUDIO_CLKC clock input
> =20
>    clock-names:
> +    minItems: 3
>      items:
>        - const: audio_extal
>        - const: rtxin
>        - const: qextal
> +      - const: audio_clkb
> +      - const: audio_clkc

[Severity: Medium]
Will this strict array ordering prevent the independent use of the newly
added optional clocks?

Because JSON schema validates arrays strictly by position based on the items
list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CL=
KB,
the device tree node would provide an array of 4 clocks where the 4th name
is audio_clkc.

When dt_binding_check evaluates this, won't it check the 4th element against
the schema's expectation of audio_clkb and fail, incorrectly rejecting a va=
lid
hardware configuration?

Should this use an anyOf block enumerating the valid permutations of option=
al
clocks to avoid forcing users to write incorrect device trees to pass
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110603.4018=
170-1-john.madieu.xa@bp.renesas.com?part=3D1
