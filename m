Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDA419FBE
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239697; cv=none; b=H7FJMtBZvZYCbDXib+rpf02/4vj4PKxCsxF3jnke5mGYgWZdWVTwjsau1ko9nBTeydUEGDZcYveV2cTBLv2AeCfWPeaPTFehAR4aq4fSTAPEO7/IqncTtue9D/XfXEdz/bc56W5IABohp3e+QMm74t1PHkOPRNntZz1iTLXnZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239697; c=relaxed/simple;
	bh=1+9vSdxBpNU2da41VuanKznCxlLI+8WK0L7532IDNcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dgBy124pfr/tmrjhqek0e2mG52GWRgMDrSTGshlPIOrb9p9LyNApIQS61oF9vBhMs1APi7pQ9kt1vfHp56a4YtGjgHPlazImcfbxDo7tCQSx17deHA9ADEfluheEKuQK904OimzqNOKh/Rp5evEQT/6u9en9zJz1CANEym48DHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnvL20Tl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnvL20Tl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4251F000FF;
	Mon,  5 Oct 2026 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791239695;
	bh=gn0FL5ZPjwLh7qD7CkmwVASN4tP1FtRymFcvk5TOkZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnvL20TlgSVoaIMUEExV4ZgcfRROnJFlgz6VEdiOLKOn0rdgOZMh03FWypBdm2gg8
	 VQig/VlRa6+K7DGHNXkdgvrkhagkosUPJZNDNJBTSqcA51nIyJpDmYDJ1ve0A/F/CP
	 3LeK8O1xWl0JbQTl1JL/iAqMfKSoKHK0MaAjlj1Ve+ezUwdcTgkl3iRUxRS0/SZeyD
	 WvaZUV2oXTzNXCjMpL9I5i/oKR7pbWFI0n5ORdoTps0KdjKTVU9N0LEIxy9eh35zXl
	 dMnD0eJnT5IxbLf+BrMSj7T7eBA59Mhys/hRJrEsX+T99vEUVa9IJ2Sx6D35UKiScL
	 LnxfY/hm9hrPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add GL.iNet GL-E750 MCU battery
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Serv Pol" <servpol@tuta.io>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-gl-e750-mcu-v1-2-499d2e31f786@tuta.io>
References: <20261005-gl-e750-mcu-v1-0-499d2e31f786@tuta.io>
 <20261005-gl-e750-mcu-v1-2-499d2e31f786@tuta.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 22:34:54 +0000
Message-Id: <20261005223455.4C4251F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gl-e750-mcu: unconditional buffer clearing drops async UART events
- [High] gl-e750-mcu: newline-less status replies block async JSON parsing
--

commit df0b44f7ad4b4bbb857745d8458ec2b575186c6f
Author: Serv Pol <servpol@tuta.io>

power: supply: Add GL.iNet GL-E750 MCU battery driver

This patch adds a power supply driver for the GL.iNet GL-E750 travel router=
's
status microcontroller. It polls the battery status via JSON over UART every
30 seconds, and shuts the system down cleanly if a shut_down JSON event is
received from the MCU.

> diff --git a/drivers/power/supply/gl-e750-mcu.c b/drivers/power/supply/gl=
-e750-mcu.c
> index 0000000000000..0799e41d58a9a 100644
> --- /dev/null
> +++ b/drivers/power/supply/gl-e750-mcu.c

[ ... ]

> +static size_t mcu_receive_buf(struct serdev_device *serdev, const u8 *da=
ta,
> +			      size_t count)
> +{

[ ... ]

> +		/* JSON events from the MCU come without a line ending */
> +		if (c =3D=3D '}' && mcu->rx_line[0] =3D=3D '{' &&
> +		    strncmp(mcu->rx_line, "{OK}", 4)) {

[Severity: High]
Does this logic correctly handle asynchronous events appended to a pending
status reply?

If the MCU replies to a status request without a newline, the reply stays in
rx_line until the 1.5s timeout. If an asynchronous JSON event (like
{"shut_down": "1"}) arrives during this window, it is appended to rx_line.

The fast-path JSON parser in mcu_receive_buf() will ignore the new event
because strncmp(mcu->rx_line, "{OK}", 4) evaluates to 0 (the buffer still
starts with the pending status reply).

> +			mcu->rx_line[mcu->rx_len] =3D '\0';
> +			mcu_handle_line(mcu, mcu->rx_line);
> +			mcu->rx_len =3D 0;
> +		}
> +	}
> +	spin_unlock_irqrestore(&mcu->lock, flags);
> +
> +	return count;
> +}

[ ... ]

> +static void mcu_poll_work(struct work_struct *work)
> +{

[ ... ]

> +	spin_lock_irqsave(&mcu->lock, flags);
> +	mcu->rx_len =3D 0;

[Severity: High]
Could this unconditional buffer clearing drop asynchronous UART events?

If the MCU is actively transmitting an asynchronous event (e.g., flipping t=
he
power switch) when this 30-second poll triggers, the partially received mes=
sage
currently in rx_line is discarded here. This can lead to an abrupt hard pow=
er
cut instead of a clean system shutdown.

> +	reinit_completion(&mcu->reply);
> +	spin_unlock_irqrestore(&mcu->lock, flags);
> +
> +	ret =3D serdev_device_write(mcu->serdev, mcu_status_req,
> +				  sizeof(mcu_status_req) - 1, timeout);
> +	if (ret < 0) {
> +		dev_warn_ratelimited(&mcu->serdev->dev, "write failed: %d\n", ret);
> +	} else if (!wait_for_completion_timeout(&mcu->reply, timeout)) {
> +		/* the reply may also come without a line ending */
> +		spin_lock_irqsave(&mcu->lock, flags);
> +		mcu->rx_line[mcu->rx_len] =3D '\0';
> +		if (!(mcu->rx_len > 4 && !strncmp(mcu->rx_line, "{OK}", 4) &&
> +		      mcu_parse_status(mcu, mcu->rx_line)))

[Severity: High]
Will this parse the combined buffer correctly?

When the 1.5s timeout subsequently triggers, mcu_parse_status() attempts to
parse the concatenated string. The parsing fails because the final numeric =
field
(cycles) is concatenated with the JSON event (e.g., 10{"shut_down": "1"}), =
which
fails strict string-to-integer conversion (kstrtoint()). Both messages are =
then
lost.

> +			dev_dbg(&mcu->serdev->dev, "no status reply\n");
> +		mcu->rx_len =3D 0;

[Severity: High]
Similarly, does clearing the buffer here truncate asynchronous events that =
were
just being received when the timeout expires?

Like the pre-emptive clear at the start of mcu_poll_work(), clearing rx_len
here on timeout risks discarding partially received asynchronous messages. =
Both
issues can result in missing the critical "shut_down" signal.

> +		spin_unlock_irqrestore(&mcu->lock, flags);
> +	}
> +
> +	schedule_delayed_work(&mcu->poll_work,
> +			      msecs_to_jiffies(MCU_POLL_INTERVAL_MS));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-gl-e750-mc=
u-v1-0-499d2e31f786@tuta.io?part=3D2
