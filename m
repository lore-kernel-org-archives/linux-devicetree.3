Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094035;
	b=Uj/OAT2oJ8L+EFPAt8OoUKvSKaBZD1hdOD48CWnrmm6x8YjXemCc/5JS5AMZTZ2Uft1n
	 p3UiN6ZJ/++/Dx1d8eguBoW7BCTJ/mKDLblq+fkTIoXG5SKLj/KplebWFslPgKnDKMl7/
	 RPSW9594sehxjU5B1PxE5f8IC//0c/2IdsQTkzd4Exjmi8lgwaDwdJ4QjF+NIxBipuPzs
	 t/2VXoblONiWn1T8VAtR4GJbptQVo8cDD2yr1ikIFESmppnx5gmvkTClblBOPOCkplrBB
	 9tGXkl0+4FiMP2eImnMF5JW8FVCL9ko5mNhb4V5+eqzrEbOKaNmpeKWgbkJuCC7H3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t8lJTrYbIPBxLSenYJdFhqxUXJOgngReFHzSdXuoRzw=;
	b=YB7N6ImXe96rSy60DxTTITDHar7XtsFRzxSf6fDJ6e23IRjY2Yssn/Tjn5u461DbosTv
	 9SB4wWboUHo/V/EGSJYDPRrh7YblijwoyylrdpkLMVUIQSVtEwcLLQB0LeVNGG7ufVrR9
	 W+UQs29bO+xA2doiZFh0O8OGYOsfAsIlGEefDXioLoN7ZILR9zPeaUysHjH7sR4uLn7Nf
	 1laj6yVCsp2/eMcBrkYWWoruaVFkHgFAn59bJSCZ6OCfHD3X6/6SR8SXzzPCOSu4ehBSO
	 WcWZy1Gw314jTpUpNWh0ACZvIiZ+t37pzsWX2DfoZFolo2McAZcB284+X57XBqqvj5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUohSZPz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41928606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUohSZPz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD9F1F000C4;
	Thu, 19 Nov 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094034;
	bh=t8lJTrYbIPBxLSenYJdFhqxUXJOgngReFHzSdXuoRzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUohSZPzB2L28GJJD1cTNx1xtNxv1HZ4AxfVfh/PVDfFZZZqNlqRohuhwCURswWTN
	 6yzpqxlgDVWGukBvykViThYoZBn1EixJDqhjlnj6n0zi5FfFBAjra34rtcmKb7OXoT
	 ypvvE1mZe7i2vmWWmLsbaNxsjgQ8BQwOXyZDKXl/40J/92UJS5IcRb+q3XDgKdLLAa
	 DB6HBkWJA1FwitS6EqstcqxVkHeHTVN1aYjABiOwskABi/QTlY0Jt7gcKJV7FyUkQk
	 Vuf14otvkJGfDOmiFzB64ncAg77t/93qTH5q8LC4CWxm/ALJ9CI9ds5PvhG+11FM9W
	 5YT/FvN7IUgPA==
Message-ID: <sashiko-outbox-223156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use
 its clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
 <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:13:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] PM / devfreq: rockchip-dfi: missing kernel-doc short description
--

commit 24f7e34d7d4ec9010ccc0577ac36a0764e1b939d
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

PM / devfreq: rockchip-dfi: make RK3588 use its clocks

This commit adds optional bulk clock support to struct rockchip_dfi_variant
and populates the per-channel DDRMON clocks for RK3588.

> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index 2b9d9b26b11a4..c51d7eeec3946 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
> =20
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function

[Severity: Low]
Should this kernel-doc header line include a "- short description" after
"struct rockchip_dfi_variant"?  Without it, building with W=3D2 emits a
kernel-doc "missing initial short description on line" warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-rockchip-d=
fi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com?part=
=3D8
