Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5F18872A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747794; cv=none; b=TSIiN3W/MZ59iloMQUlD3pKBVjPYY6ylNOSJZG8GYhmiJ6U+wUSJHK2Fc048c5zfRZTF/i5CO7LfeXkcQNJWMPmp/7dczfe7twWnyuRKZhw6lA/Asxc4yYaHy7LUmXJZ+OvuFfdWLP8v6X0/eePvAy6arZ4HvPYvhcwa0UKfi9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747794; c=relaxed/simple;
	bh=h3KiWKjoQts53bFp25H5a3kUh7odz1pORPCaexyV5Eg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vl145pqOTV4+wWROwedK0li8wZsjO7i2P+fhiMH5X5ZV8oISbqPQMxl63/Sm0sPS90FoQ9rjJvMGKwWAvracOcaklCvcRZJo+p9QG06lOMsW1+H9akiqhEB0ya+eVJ5BTGcPdbfsj31SksJdGP4i/5JNADSUchVJsYugAKfr2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5ZTZh0b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5ZTZh0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E3EC2BCC6;
	Thu, 14 May 2026 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778747793;
	bh=h3KiWKjoQts53bFp25H5a3kUh7odz1pORPCaexyV5Eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H5ZTZh0brvRrO6np+4qPw3tt40MLfJJR7B5LUDFgy5DdPkNq74jYZwEJgHE7CN7/J
	 xKs3cawveY9JrSHfxnvdZS/Ps26t4BOiLZdEraeYkOHpg5kZpvV2IXSaKhaamKd3dN
	 r3Vs7PGF+vhvy62obtC0dC8xQNVO4RFxb5YWfaFRC0mUt4BGxWYN7qwq8MRrNQFcTI
	 n1tDofVoz1Dr2sH6Me4BfPlBlZVAixu38m6hDPVpk2tXuHDP6AwKEhRsIt6HwQpaqx
	 6qHcK1EsfklS3h+jmJM9Bt3jkP2eALhasP/4cv8g3EqJxeMKVOgnPDF8m/2337in2Z
	 82wIqf6fFhn1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/16] drm/tidss: Add support for DPIENABLE bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-beagley-ai-display-v2-10-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-10-9e9bcefde6bc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:36:32 +0000
Message-Id: <20260514083633.60E3EC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing DPIENABLE immediately in dispc_vp_disable() before the cu=
rrent frame finishes can cause pipeline stalls and framedone timeouts.
--

commit a9d868fee075a198f505bcb29c9c76b018bdefa8
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Add support for DPIENABLE bit

This commit adds support for the VP_CONTROL.DPIENABLE bit to manage the
DPI block state, specifically to provide power savings on AM62L SoCs when
it is not in use. It enables the bit in dispc_vp_enable() and disables it
in dispc_vp_disable() and dispc_vp_init().

> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/=
tidss_dispc.c
> index 92cba069ed6c2..82e0b3184cc4c 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c

[ ... ]

> @@ -1222,6 +1229,11 @@ void dispc_vp_disable(struct dispc_device *dispc, =
u32 hw_videoport)
>  {
>  	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
>  		       DISPC_VP_CONTROL_ENABLE_MASK);
> +
> +	if (dispc->feat->has_vp_control_dpienable &&
> +	    dispc->vp_data[hw_videoport].dpi_output)
> +		VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 0,
> +			       DISPC_VP_CONTROL_DPIENABLE_MASK);
>  }
> =20
>  void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)

Could clearing DISPC_VP_CONTROL_DPIENABLE_MASK immediately cause a pipeline
stall and framedone timeout?

In this function, DISPC_VP_CONTROL_ENABLE_MASK is cleared to signal the
video port to stop at the end of the current frame. The caller,
tidss_crtc_atomic_disable(), then waits for the framedone completion event
after this function returns.

If DISPC_VP_CONTROL_DPIENABLE_MASK takes effect immediately instead of
waiting for the end of the frame, could it abruptly shut down the DPI
output block while the VP is still actively scanning out?

If so, this sudden shutdown might stall the pipeline, preventing the
framedone interrupt from firing and causing a timeout.

Should the DPI block be disabled later in dispc_vp_unprepare(), which
executes safely after the hardware has signaled framedone, similar to how
OLDI is handled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-beagley-ai=
-display-v2-0-9e9bcefde6bc@ideasonboard.com?part=3D10
