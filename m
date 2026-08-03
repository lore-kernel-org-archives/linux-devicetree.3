Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38057432BEE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782103; cv=none; b=DIGHdChMqzQcG4K3SYf9UQopPtidLrftde/Z6ip74J88BszzQnrxZcbM5kAElYX+gCkDaB9GburU28mggryNrN6kFdTu1aKf8AxESSlBjm/Pr0/IdLa92nSYyKwZAa4bhsKnjauSHDVspJN3CYOIap/zTP5LG+ZNKMXwGYusrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782103; c=relaxed/simple;
	bh=2t6N87H4kSgdwHTnjrfRZpa0YiXVpsEbZObrXhf/Re0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nay7cVQ76scsHmdUCHdg9hOTrtvY3Vk6RDBRR/QMFp7XA5jwKoB/1YaKSQG+mXbDG7StiFSrsgATJq5Yp+su/un28ac9evyJrXi0SYC5wU1BGbqqJUQs9GifJ/MIiuQhLLS2zRSNTrwwqFbkvLRPkyP7pJIeg7ggmnWgD3b1NHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIn7DATT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIn7DATT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044E41F00A3D;
	Mon,  3 Aug 2026 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785782101;
	bh=56dAQEl/uWsg2t/erpRYymTDZhcEWsarYH0GDBKSWtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZIn7DATTcAA5pLYQavX33/o47O7vxRkp8KXGugRlaI7emd0H8f7FaXtP5v3qdEony
	 xI2OOpc5+x/FtnksFzWWVgqt13how3VTlbN12SCLL7dYs7theiiEhWJASQlt7x6T1O
	 3ZXPSB6dJ6O8V6+XgOv2xSuhU5N/AFV5Sa5E2tMYbGKxdx/cQ3YgpHBZw5hYcyvPW2
	 Tv7k1YzQME0kJXyFlzz5we8ZhF9AaFqdemsvPZ50O+KUdB0U1CnWW0FwiJA7rl9cua
	 4RHW09NFYaeIjpUS6mOHqRqQNC6E0yTR6VsHYVdk0ls/ky+W3kDZgAO3LM0d7CR3fG
	 gHSgF2KeiA0jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/22] drm/bridge: synopsys: dw-dp: Free output_fmts
 when none are valid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-9-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-9-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:35:00 +0000
Message-Id: <20260803183501.044E41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DRM core's bridge bus format negotiation protocol contains a m=
emory leak when a driver returns an allocated format array but 0 valid form=
ats. This problem wasn't introduced by this patch, but this patch adds a dr=
iver-local workaround instead of fixing the core API.
--

--- Patch [9]: [PATCH v9 09/22] drm/bridge: synopsys: dw-dp: Free output_fm=
ts when none are valid ---
commit 91ba4a99e0fef78bbe1a7632011fef0a483a9e57
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Free output_fmts when none are valid

This commit modifies dw_dp_bridge_atomic_get_output_bus_fmts() to free
the allocated output_fmts array if the number of valid formats is 0,
avoiding a memory leak.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 22a244de08aa1..bde938b0d116d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1813,6 +1813,11 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmt=
s(struct drm_bridge *bridge,
>  		output_fmts[j++] =3D fmt->bus_format;
>  	}
> =20
> +	if (j =3D=3D 0) {
> +		kfree(output_fmts);
> +		output_fmts =3D NULL;
> +	}
> +

[Severity: High]
This isn't a bug introduced by this patch, but should this memory leak be
fixed in the DRM core instead of adding a driver-local workaround?

Looking at the DRM core's bridge bus format negotiation protocol in
drivers/gpu/drm/drm_bridge.c, the core leaks the array when a driver returns
an allocated format array but 0 valid formats:

drivers/gpu/drm/drm_bridge.c:drm_atomic_bridge_chain_select_bus_fmts() {
    ...
		out_bus_fmts =3D funcs->atomic_get_output_bus_fmts(last_bridge,
							last_bridge_state,
							crtc_state,
							conn_state,
							&num_out_bus_fmts);
		if (!num_out_bus_fmts)
			return -ENOTSUPP;
    ...
}

The core returns an error immediately without calling kfree(out_bus_fmts),
silently leaking the dynamically allocated array.

The same issue appears in select_bus_fmt_recursive() for
atomic_get_input_bus_fmts:

drivers/gpu/drm/drm_bridge.c:select_bus_fmt_recursive() {
    ...
	in_bus_fmts =3D cur_bridge->funcs->atomic_get_input_bus_fmts(cur_bridge,
							cur_state,
							crtc_state,
							conn_state,
							out_bus_fmt,
							&num_in_bus_fmts);
	if (!num_in_bus_fmts)
		return -ENOTSUPP;
    ...
}

Would it be better to fix the core API to handle freeing the array when
num_out_bus_fmts or num_in_bus_fmts is 0, rather than patching each
individual bridge driver?

>  	*num_output_fmts =3D j;
> =20
>  	return output_fmts;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D9
