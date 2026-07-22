Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCE33F5A3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711225; cv=none; b=q73I9Zla2ibEqlnrsrPqvXbo6GQGVOaz5CQWiFMKIcnO8Nk7pLgXAiUVLUCaGTbqlLMh/HqltaQNXoTJmMZ8XqZ6aNxZzxEi6PR+DXI5WDnJ2Cu23P5sdTQ9pBfEGVJ37e/k1v8euSgMdOytOtgVOKauMYNGGqAkljLGVk/Qf9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711225; c=relaxed/simple;
	bh=/2xqCWJgJQk0rzZICYHzi6kleX1vWxK5DrsuwzaKm/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iHU/aze5cK9WZYdERqd+ZYk5Gx+2MsDk9dRHz4FkN1XT1zPQJOiDdU7aUFZyMVNl46ZvxJF8qo1EKQ1040AjrayshyZz62zK3CcE3BQR+YIDEbCFcuwoTAhawg5lqJrh76maDxtQqzusiQOkxju817K7GS0UmYHOTEkXZQtTpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZK6mVwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZK6mVwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8891F000E9;
	Wed, 22 Jul 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784711223;
	bh=elxx0ing8jQOs1OHGRNkTyjCHnVG45gE4XvFiVxcQUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZK6mVwYKquoHNMx1qBcYL8Bs/4Q60iJa9oOpOZGJh4kSt5UFeg5FwcKq22Xs41BJ
	 TTg0pG2yvHii+ljKkI0g9AoHjzuZU/eqyJi/SQr0uhgq3gCN/1qJYJNKBDQMcli3cS
	 lkvv/xcy3XnO7O6AiaSoTGF4JTpI4GjMYHKDBsCEQECYNbv/oCgP5KikW4lUbo+n2E
	 rXN/9dOOC9+dDizkWcCjUkr9KlUvLlYPlI8h+83qGBle0qzQdP02CdVXesYuavr+i1
	 +OugFyaVS57Tv3MHwOVDk5rN7zHk2nHPdWz0l96EwE4iYZRUSUUCGQz55x6PbTfV/R
	 zfLjn+w/J41FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX
 queue scheduling to WRR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ovidiu Panait" <ovidiu.panait.rb@renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
 <20260722085353.136986-5-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:07:03 +0000
Message-Id: <20260722090703.8E8891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The WRR scheduling fix was omitted for the identical GBETH nodes i=
n `r9a09g087.dtsi`.
--

--- Patch [4]: [PATCH 4/5] arm64: dts: renesas: r9a09g077: Switch GBETH TX =
queue scheduling to WRR ---
commit 58eaafff34c22b66e461cfdd5d49874250e99a8c
Author: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to WRR

The GBETH ethernet nodes default to Strict Priority scheduling, which can
cause TX queue starvation and trigger spurious adapter resets under load.
This patch switches the TX scheduling policy to Weighted-Round-Robin (WRR)
for the r9a09g077 SoC to prevent these watchdog timeouts.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g077.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -642,36 +642,45 @@ queue7 {
> =20
>  			mtl_tx_setup0: tx-queues-config {
>  				snps,tx-queues-to-use =3D <8>;
> +				snps,tx-sched-wrr;
> =20
>  				queue0 {
> +					snps,weight =3D <0x10>;
>  					snps,dcb-algorithm;
>  				};

[Severity: High]
This is a pre-existing issue, but should the identical GBETH nodes in
arch/arm64/boot/dts/renesas/r9a09g087.dtsi also be updated?

Looking at mtl_tx_setup0, mtl_tx_setup1, and mtl_tx_setup2 in r9a09g087.dts=
i,
they appear to be missing the snps,tx-sched-wrr property and queue weights:

arch/arm64/boot/dts/renesas/r9a09g087.dtsi:mtl_tx_setup0 {
    snps,tx-queues-to-use =3D <8>;
    queue0 {
        snps,dcb-algorithm;
    };
}

Does the r9a09g087 SoC suffer from the same TX queue starvation and netdev
watchdog resets under sustained UDP TX load if these fallback properties are
omitted there as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722085353.1369=
86-1-ovidiu.panait.rb@renesas.com?part=3D4
