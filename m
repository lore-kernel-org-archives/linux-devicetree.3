Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDABA3CBE8F
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226817; cv=none; b=MH1gEycL+EzdTW52Z49gjZQLJYomYbl5mqQNRNRbITJDgRHHpczCW7Shh85lFe7klPKuJUtVluqwVi7jom/byCutJO+PwrZLuedJ1fI8xCvMStNtHRvct8JnaWUE1q5YYebBZJ8Q0icL4zcFaPUCWhW/Ns3PsBHTdKTHpRFJl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226817; c=relaxed/simple;
	bh=E7tqSHioKeA6QYYAmzHLw6BemqrmUSKXwyxglWhjf5c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JVDcWHtki67r4GM+uilISicHY4yGWa3DeMqfP7nA5Qj9vfnPRhBQ/oT5XGNhCJ3SYn/+6nfd5WhhfyTZaGBSsw9Bk1SKMihvmIXUIkA4GelGcNAc+x5agQdG9ZLqGY839gjiUOVEO0IFplshQaVdFYSWdUjBtKl7BNSpu3oIG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJAX42kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJAX42kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA3D1F000C4;
	Sat, 17 Oct 2026 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792226815;
	bh=UDSWgbYXbnGUSCcFRMC9/MRfO1zFrV5OAysM1OoZ3HY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJAX42kI1wt6z7U+/2vk7ANPG7EaqoZg4M2/Gav2KtWx4DntN44vaZZKOXgmwghPv
	 e19RQk5WHmjBD5tNeoIddiyPFBDNLnfbKhxfdzLbuSCXt5kXw7v4zL0fC9BVQ6FeXo
	 7bugJ8GmMWGblbtKA3HL91c+tFd5PjTI1qVypruh/hRM0/chQWiVj/CCbzA1V6zGZw
	 CJNPlskQPxMgta04RMpj7+OusMey2M4ZOcqkS8GXUmoZXuvws6/uQ6whf8a7DbuMka
	 9LicUOJqKn6k1vwdYmqghSJqtIWtjqR6Y2FVlmxtfHSnh2ocZYEa1iZRnUJhu8xStz
	 CyeMkMX0x++EQ==
Message-ID: <sashiko-outbox-175408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: add Smartisan TD4362
Reply-To: sashiko-reviews@lists.linux.dev
To: tianshi12127 <tianshi12127@gmail.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017083531.766557-3-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017083531.766557-3-tianshi12127@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 08:46:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: panel: smartisan,td4362 uses PMIC lab/ibb =
supply names
--

commit 6d3f290b8760784bb6a0903d2ec93dcc896d4221
Author: Lu Chen <tianshi12127@gmail.com>

dt-bindings: display: panel: add Smartisan TD4362

This commit documents the devicetree binding for the Smartisan TD4362
1080x2242 command mode MIPI-DSI panel found in the Smartisan R1
smartphone.

> diff --git a/Documentation/devicetree/bindings/display/panel/smartisan,td=
4362.yaml b/Documentation/devicetree/bindings/display/panel/smartisan,td436=
2.yaml
> new file mode 100644
> index 0000000000000..a46bc2f530300
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/smartisan,td4362.ya=
ml
> @@ -0,0 +1,75 @@

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: smartisan,td4362
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +  lab-supply:
> +    description: Positive source voltage rail
> +
> +  ibb-supply:
> +    description: Negative source voltage rail

[Severity: Medium]
Should lab-supply and ibb-supply in properties, required, and examples be
named vsp-supply and vsn-supply instead?

In devicetree bindings, *-supply properties on a consumer node describe the
power rail inputs of the panel itself rather than the host PMIC regulator
blocks (Qualcomm LAB and IBB) that supply them.

As noted in the property descriptions (Positive source voltage rail and
Negative source voltage rail) and in other Synaptics TD43xx panel bindings
such as Documentation/devicetree/bindings/display/panel/boe,td4320.yaml,
sony,td4353-jdi.yaml, and synaptics,td4300-panel.yaml, the panel's positive
and negative source voltage inputs are vsp-supply and vsn-supply (wired as
vsp-supply =3D <&lab>; and vsn-supply =3D <&ibb>; in the board devicetree).

> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - lab-supply
> +  - ibb-supply
> +  - reset-gpios
> +  - port

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017083531.7665=
57-1-tianshi12127@gmail.com?part=3D2
