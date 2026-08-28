Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EA279907
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909207; cv=none; b=olwNzOmEFcPXqWq0fx4nBQump51lHG+s5QroSdECP27VHzodnJHQzYKOKJ6HGTxeY2REi44qI66MWYGegkGMYbj6AILyshVZegTTCtWjLwQSMX82tpQF1c2w4X57GfZIZXLQS/SqNnV6vEtYAx+gu8oWr8pumHvaocytpAMYnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909207; c=relaxed/simple;
	bh=3+cbvUubQHEPinhmoF7QfBqnivN+P4lE2sO0SoxYetM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCpmECchZSciBQQpqXuR3acMuWVLfhHImBmon1XOSVl1H1MiHdADv7UTfG4iaNMvb+7s8iEJdRvOTesCJ99zdYklzpWM/xPR+faBclB9aU71u1dniGM6fo2gWUVxU+byIGaiVcIUwILGiTANddxzIDOxN67AYka8XWHPwBvriFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPvRo2jx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPvRo2jx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5288B1F000E9;
	Fri, 28 Aug 2026 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909205;
	bh=iABURzloi7NDfg+lWw3fhSrd6k8GU9KZ1nxi8/kDamc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPvRo2jxR1Ckgl4VR8OI5fwRfTEKFBoIDVqepajmJR9DhD8RemiQwV4x17llLsyXE
	 ulowMI4ni4vbhfH41uVkfqcYISPcUzCJUvpOGyLlxP/GDiytJAm486bQOhj+Z2d0ZI
	 /e+rYi2LW2PvKyCMcv8H/KfGBcAe8sX8amIxlDWebTJDQfb2QC9upSX1bZz/vg2hGy
	 95mUYIBxwuc4o5FgkQ3ezG8HyGeiMPY9GTO0g9J+E0WVlwsqsnI/p1OLaYCLpxk+wN
	 vB6sHgt+QmJkECvYVAwyztdk3dwXdeNnKmadIpjw5sSgfXQt9UPyM3T6kiCtEPPSCy
	 dyAa9UjA4qiPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-t603x-spmi-v8-2-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
 <20260828-t603x-spmi-v8-2-708d4d12e0fd@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:26:44 +0000
Message-Id: <20260828092645.5288B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unsafe Data / Silenced Error: The driver returns success (0) when =
extra data is left in the RX FIFO, feeding potentially corrupted or stale d=
ata to the client.
--

commit bd81188aa73e785d093e758b80b16d3e34cda43c
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state
   =20
Check for data before reading the body of a reply, and check for
end of data afterwards.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 376cf682c43e0..15721cb41d5c8 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -86,6 +101,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl=
, u8 opc, u8 sid,
>  		}
>  	}
> =20
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> +		spmi->prev_fail =3D true;
> +	}
> +
>  	return 0;
>  }

[Severity: High]
When extra data is detected in the RX FIFO, spmi_read_cmd() logs a warning
and marks spmi->prev_fail =3D true, but continues to return 0 (success).

Does returning success here risk feeding corrupted or out-of-sync data (such
as stale data left by the bootloader) back to the caller instead of returni=
ng
an error code like -EIO?

[ ... ]

> @@ -115,6 +140,11 @@ static int spmi_write_cmd(struct spmi_controller *ct=
rl, u8 opc, u8 sid,
>  	/* Discard */
>  	readl(spmi->regs + SPMI_RSP_REG);
> =20
> +	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
> +		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> +		spmi->prev_fail =3D true;
> +	}
> +
>  	return 0;
>  }

[Severity: High]
Similarly to spmi_read_cmd(), spmi_write_cmd() detects that the FIFO is out
of sync but returns 0.

Should this also return an error code like -EIO to properly signal the
synchronization failure to the caller?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-t603x-spmi=
-v8-0-708d4d12e0fd@chaosmail.tech?part=3D2
