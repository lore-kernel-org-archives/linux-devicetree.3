Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E692F549C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696154; cv=none; b=gp4fXYfslCDQaWPKZj2kvMiFCbHJUS8g3Hd3Msfehm2BVqEuNc/P3iWgiZJA/FFT4ijvjL0bEkOqpfZ5QEZ38eiYt1bqm/HbxYTIfg5rOxxqt5p4v8X1yRjqL0EVsWTP0c7MsO1FfMXmr9k2SKOUF7uevVaKUJ98YasGZcyjOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696154; c=relaxed/simple;
	bh=Kw5wMeNbO8/UUuz+7qrbV6xoky8svRoD4n47XEKHaYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fMBSm0G6n0qy8aJNdQyGYOm46tko8G7LeCAM8xXwXNl5DMEO0f7+axx6kkK2vu/kOs+OZ41UjK45WcuereNThreyGXZ2RbWvqfGfeT8EbqCindsk8tMvZQlqEWl+d4asMDHCe/hK2hn0Eo8OVrwaq9DudWhaSBEqno452sz7j9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXyVnAs9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXyVnAs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FAC1F0155D;
	Fri, 10 Jul 2026 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696151;
	bh=fEDWKdw57vOm4IS925rw19f0NqFqBiBXqEjojnZkM0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YXyVnAs91Z9bHFVlkhIQLoKKu2V8fm4MDQW18KoPxoZRh1QbQefHpE8Od28Pq2xp0
	 RNs7iO3BPDS2VIjsxB5QS4ZMykVrGYYQUMGpz/MIz3sAw55G8TmjLy+DNPi+epwh2V
	 hQ/nG4qiPoKKTESmK+lg/R1FsDTdSG1xcpOl8b3p0A2mMDuU/hS4m0mifz4EMsmLH5
	 jrmOlfpQgk0PjwkYhDAmSwRPUO/ANtYNbCgfv9seRz9g82IgkjGILhdvDZG2/B7yYv
	 QBMTShIEjLrMsRXK843dAcjZcnsIjgSCe3hOoI/7GU68hck7gQ2bvmt2lz2BgiVk/h
	 5F5HJ51H/Hwvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/18] clk: mediatek: Add MT8189 dvfsrc clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-15-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-15-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:10 +0000
Message-Id: <20260710150910.B0FAC1F0155D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free in `__mtk_clk_simple_probe` error path due to missi=
ng `of_clk_del_provider()`.
--

--- Patch [15]: [PATCH v2 15/18] clk: mediatek: Add MT8189 dvfsrc clock sup=
port ---
commit 5ea7dacd6f8e27b2d8c56bae31053477a67a2318
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 dvfsrc clock support
   =20
This patch adds support for the MT8189 dvfsrc clock controller. This contro=
ller
provides clock gate control for DRAM DVFS.

> diff --git a/drivers/clk/mediatek/clk-mt8189-dvfsrc.c b/drivers/clk/media=
tek/clk-mt8189-dvfsrc.c
> new file mode 100644
> index 0000000000000..37b81dc0b8824
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-dvfsrc.c

[ ... ]

> +static struct platform_driver clk_mt8189_dvfsrc_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This is a pre-existing issue, but does the error path in
__mtk_clk_simple_probe() leave a dangling pointer?

When mtk_clk_simple_probe() is called, it wraps __mtk_clk_simple_probe(). If
the clock provider is successfully added, but resetting the controller fail=
s:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
...
	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
	if (r)
		goto unregister_clks;

	platform_set_drvdata(pdev, clk_data);

	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
	}
...

It jumps to unregister_clks which eventually frees the clk_data:

unregister_clks:
...
free_data:
	mtk_free_clk_data(clk_data);
...
}

Since of_clk_del_provider() is never called in this error path, doesn't this
leave a freed clk_data pointer in the global of_clk_providers list, leading
to a use-after-free on the next clock lookup?

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-dvfsrc",
> +		.of_match_table =3D of_match_clk_mt8189_dvfsrc,
> +	},
> +};
> +module_platform_driver(clk_mt8189_dvfsrc_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D15
