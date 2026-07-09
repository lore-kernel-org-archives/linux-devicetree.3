Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CF24BD03
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631905; cv=none; b=Oq7AKG3vRM3uezC6EkvIrWqIpIuoiJNhEYAKFHyXAwCJwR+TV8hp/w96flmsEMuAGfVbMPuETWHH35oArtvRP03/vrAqxd8bfVKQ4fTP4wP47g74JbYnYjwI5KifDctDfbcPAzsPfWII0GoZsW4uAi+f9cyTvkVyJdIRxC2t6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631905; c=relaxed/simple;
	bh=sAL2wUvgs0KO1n1MWcZ+2yOrvD4gP1uAoK6SxR18nnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pJGhSRCC2GTc+6ksdAtHAFmcgC8ey1YVaPoV0313iGBR+WKXUXbX8jWC8IDfkFMbZjka94ags5Wl0AY5qL6T951LpN31phhio0dpvAWnixg+foQdP6Tz/9SishqtTxZO0z95SqJxAsb4jiBvMw1F3fqFSpCZwdDhxCm7y46F7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOhhsz42; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOhhsz42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653DB1F000E9;
	Thu,  9 Jul 2026 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631903;
	bh=WVJrLuuyq+agnSqRjeZUvtH2daJEgtTw4zWHU4SBZJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOhhsz428ymakFw5CgomjcTAuFo8Fqprz8+3j36oq1EaqOZLf3S3KBG/hGDMeKrEB
	 BIICdv2FJrL2+15SpiafPFAC6oyS/bdckJDtC8N+EIHLvPAp3XmhH4JqxAoELIM0oV
	 gjUn4EJYWQFq0Dx60iRb1/vl09t5jarmzbY91wqtelHhM56VHJer/sWgrLv+ohZ2zO
	 HxtWPiiA5ANQGRwt0l2X0jGFUikus7otna/kwFeGUpHYeBo8JkooqTT+Ru0n2sR6k4
	 j19yP4nqeobImXKyFQI1VGXfDbCwUAP+4wYi8XtGXkKvxsayJ//V9PHTAc/gHeqJfy
	 ynY0BZeqYH+9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] serial: 8250: map UAPI port type to internal enum
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709205656.319531-4-ansuelsmth@gmail.com>
References: <20260709205656.319531-1-ansuelsmth@gmail.com>
 <20260709205656.319531-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:18:22 +0000
Message-Id: <20260709211823.653DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new documentation guidelines encourage a split-brain ID regist=
ry that will cause integer collisions between internal 8250 port types and =
global UAPI port types.
--

--- Patch [3]: [PATCH 3/4] serial: 8250: map UAPI port type to internal enu=
m ---
commit d2ffed5bdc0925967ba25a551f7c1657761a9cab
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: map UAPI port type to internal enum

This commit maps the UAPI port types to an internal enum in the 8250 driver.
It creates a dedicated enum in 8250.h with all current UAPI values and docu=
ments
how new indexes should be defined. It also renames definitions in 8250_port=
.c
with a new UART_ prefix.

> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/825=
0.h
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -73,6 +73,128 @@ struct serial8250_config {
>  	unsigned int	flags;
>  };
> =20
> +/*
> + * The uart_config[] array index is referenced and defined from index
> + * in uapi/linux/serial.h and uapi/linux/serial_core.h.
> + *
> + * This was old practice and for anything that doesn't need to support
> + * userspace, new type should be limited and added only HERE.
> + *
> + * Any UART port that requires userspace support, should define the
> + * dedicated index in the UAPI header and reference it when added
> + * to this enum table.
> + */
> +enum uart_port_type {

[Severity: High]
Does this new documentation encourage a split-brain ID registry that could
cause integer collisions between internal 8250 port types and global UAPI
port types?

If a developer follows this documentation and defines a new internal port t=
ype
at the end of enum uart_port_type (e.g., getting value 124), what happens if
another subsystem concurrently adds a port to <uapi/linux/serial_core.h> th=
at
also receives value 124?

Since the port->type field is a globally shared namespace across all serial
drivers, driver-local enum values that are not offset into a disjoint range
might collide with new UAPI additions. This could manifest as compile-time
errors when the uart_config[] array is populated, or runtime ABI
misidentification by userspace tools if setserial treats an internal 8250
port as a completely different architecture's port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709205656.3195=
31-1-ansuelsmth@gmail.com?part=3D3
