Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD833C182
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959362; cv=none; b=QLGMa11zxFjPtLRDRY+e5H2mhuWGvugMbt/oWwqUeILn3Km9D5XzPNZ5bfk/q/R6ICAmC3X7r0pNFf2RcZRK9cFC5bS7BaMByYUbl61M5RQ9kOmCznYlIyLR2Oq1Sb+xJdJXyOblvpdwyABmNC+cjJNY6qadO2x4AL/ZPYWf0IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959362; c=relaxed/simple;
	bh=bLBJJ8I72oyqkeYpYpo3256N+dT0edptuGdgw4G0GHk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YuLcquWL1Ms04wd4aipZKwMbar1R4C9iv6Wx51GlDJ5oQWlDCUVH4exEmQwLp+ZrNwo8tRxuBCIyZ0hn9z4T/FrRCEKWe0rsfjgfKZBX5Z4ubwec9zT1w6yHzqHqBgThB2DAo/v59oE16tTbcGuTjiEbn0Tv6eRuPUnNTsP8hls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meg+i2ha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meg+i2ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695FA1F000E9;
	Mon, 13 Jul 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959352;
	bh=V1TjLkS+6QW8UdC1X0uyNY0ZggZwLDw4bG2y2SXcvnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=meg+i2haaOclTKSzs4AOVY1a8vbWAMUAs/rbTnkNupGiKbrKVG8lAX+Ep6Z/QnSAe
	 pURE1UI3qCcMPEpmnwJ9S6xrGU1egK3CAb9TdQTO9iDTILv76T6bQRUGUOcYkm7iZE
	 S7U08rKx8n1iEgpPRm8ybXnkuOlYCRuGlX7aNepmPcK4p4MkcuoydrGhcDj3kpNyfR
	 VHCpZpd4buTynJvjZGHwINITg21vfLekEDONLYMpu8jMupcrF531PIQAJVx0df/+D1
	 ZX5BxfeK8Sb+RYvEGOy223GDCkCATnsj+oY+l+97KV1oJSzbNMFiP13zfUn+SZB5cF
	 9Vqb8a29u3tKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/11] clk: realtek: Introduce a common probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713155630.3054636-5-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 16:15:51 +0000
Message-Id: <20260713161552.695FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Failure to check for error pointers in the `clk_hw_onecell_data` a=
rray leads to a potential kernel panic when registering clocks.
--

--- Patch [4]: [PATCH v10 04/11] clk: realtek: Introduce a common probe() -=
--
commit 2ca4c07d930b1b3a9fa36b5d566c53f338efd00d
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce a common probe()

This commit adds rtk_clk_probe() to set up the shared regmap, register clock
hardware, and add the clock provider. It also creates an auxiliary device f=
or
reset controllers if the #reset-cells property is present in the device tre=
e.

> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/c=
lk-rtk-common.c
> new file mode 100644
> index 0000000000000..cea7d94313daa
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
[ ... ]
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_des=
c *desc)
> +{
[ ... ]
> +	for (i =3D 0; i < desc->clk_data->num; i++) {
> +		struct clk_hw *hw =3D desc->clk_data->hws[i];
> +
> +		if (!hw)
> +			continue;
> +
> +		ret =3D devm_clk_hw_register(dev, hw);

[Severity: High]
If a clock array populates unused slots with an error pointer like
ERR_PTR(-ENOENT) (which is a standard practice so of_clk_hw_onecell_get
propagates the error to consumers), will devm_clk_hw_register() try to
dereference it here since we only check for NULL?

Should this condition be updated to handle error pointers as well, perhaps
by using IS_ERR_OR_NULL(hw)?

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713155630.3054=
636-1-eleanor.lin@realtek.com?part=3D4
