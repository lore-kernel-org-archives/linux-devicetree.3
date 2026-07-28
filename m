Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A624746A5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785270386; cv=none; b=CWqotefKNMfttwyUEiFjVN0ZqhjvR07/bUGoptXfYhFoU28w/ky+ZRu6BdMGNt5tanTyTy0YxHOxfFV8n3jJYosNNvO97AIVDbsOaKon4P6cPwEiNQAcFM51Vc3Q0N0AedB+zHPnA8EofyVGZhiVyQaplze0iBBYYsm5CH/ntyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785270386; c=relaxed/simple;
	bh=cS221YnXroVv0jZ3/1YLHo3WMgLuvzzAtYgCsvHZLfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsj5WuFVqM4XN2EdvvX5NLymK0TLR/NNAk1sClEWS4EPOLA7vCLM0vk16vYw9VG3MpQzk2JYoknMYUy5GShpgQlVBoI+yKMq8I1S0jjTzwrcvzhCsKN6lBA4b627kG/GrhUjZGsl03vWGLhlYXn05W4DN0a5VFess8wihskMSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKtKg6Qn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKtKg6Qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5D81F000E9;
	Tue, 28 Jul 2026 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785270385;
	bh=GFXZAp1RLSILYA656ZQzJ0SeYZtnC7dm20ACjngJabw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKtKg6Qnzi5k3kBRW8TYeTcT/gJyxZaBszoU66KJ9do7f/HSDIX9seYe6zJk1hGyt
	 SYmdES31YdHga9nRRLhR3ldHRqFlS09DtypZiCL/LZxKt0EkwAN6y5t5h3on5+RP21
	 GgqhNTRS0LbfEn4vQ+MrUq0V2P7L6qCWSFBKmmlfoWTI3+rIizgNX9BUwRNBbrpzK6
	 3qvC4mR5U1Lo0F/q7LfQjgh6ggxFHACKx0GMRW6i4g6DuOYaGa/rGj1wlb3g4DXh6i
	 nt1SC9bnj0cLf7F76iKGcQdwx6Z3qSn+lrSxT9fL47BwgWBRD6K6lZOsy2eU5LImbV
	 WzeyCAzG4izMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/18] drm/bridge: synopsys: dw-dp: Protect
 sdp_reg_bank from concurrent access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-14-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-14-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 20:26:23 +0000
Message-Id: <20260728202624.AA5D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The atomic_disable path indiscriminately wipes the entire shared S=
DP bitmap, breaking the concurrent access model this patch aims to introduc=
e.
--

--- Patch [14]: [PATCH v7 14/18] drm/bridge: synopsys: dw-dp: Protect sdp_r=
eg_bank from concurrent access ---
commit 20478fb4c1990e713fd92f6e28d07f388653d106
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Protect sdp_reg_bank from concurrent access

This patch introduces a mutex to protect sdp_reg_bank from concurrent acces=
s,
preparing the driver for additional SDP users like audio support.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -1691,7 +1695,8 @@ static void dw_dp_bridge_atomic_enable(struct drm_b=
ridge *bridge,
>  		return;
>  	}
> =20
> -	set_bit(0, dp->sdp_reg_bank);
> +	scoped_guard(mutex, &dp->sdp_lock)
> +		set_bit(0, dp->sdp_reg_bank);

[Severity: High]
This isn't a bug introduced by this patch, but since the goal is to support
concurrent users, is it safe to unconditionally claim bit 0 here?

If video is disabled and a concurrent user like audio allocates an SDP, it
might be assigned bit 0. When video re-enables, unconditionally setting bit=
 0
could overwrite the other subsystem's reservation.

[ ... ]
> @@ -1735,7 +1740,8 @@ static void dw_dp_bridge_atomic_disable(struct drm_=
bridge *bridge,
> =20
>  	dw_dp_video_disable(dp);
>  	dw_dp_link_disable(dp);
> -	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
> +	scoped_guard(mutex, &dp->sdp_lock)
> +		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);

[Severity: High]
This is also a pre-existing issue, but will clearing the entire bitmap here
break the concurrent access model this patch aims to protect?

If audio or another subsystem holds an SDP reservation when video is disabl=
ed,
bitmap_zero() will incorrectly mark their bits as free. If a new user then
requests an SDP, it could be allocated the same bit, causing multiple
subsystems to write to the same hardware register bank concurrently.

Should dw_dp_bridge_atomic_disable() only clear the specific bits reserved =
by
the video path rather than zeroing out the entire shared state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D14
