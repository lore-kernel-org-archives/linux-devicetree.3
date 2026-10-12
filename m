Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3EF4AF9D7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824089; cv=none; b=jfA1Xjoms6GMlpRk3P/Z8wjIdEn1OShLPUju03TQQU+a2qqIuBpmonBQiox8bWr+jTFBLaCweeD3sULg5CRJ8HihwGOXdVN0dhUwixvpMCabagZ8SdV6Fx1O1NfWisqTFYJyxz/m4sAm9y/Yb1aS+vBGel3nwsBA5Q1rKYjtDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824089; c=relaxed/simple;
	bh=scSlpWBUXUrbo9Dmn/VtPOq5HD7rX6FUfQY4GchHG5Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EwRO8LUyC10L5YRIuUljgkzNXuxVY0kv+al8abfY0IXvuBQl0EG97DZt1vpHvN5uSLKSVX0Df461lPQSkxzmHMCuWfMv2/HjFDDllS55ocHuOXlmuPRPBCHtE9ghelxuec8hMxFp3FFZwnOp+eBdMiPfiYnU89MwgJvI3hKAVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmXZJRhD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmXZJRhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14AF1F0089C;
	Mon, 12 Oct 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791824086;
	bh=VyxASK6M2xE4JNgi3kaQ5DDPWhmzhHZEODXqDO+rV/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VmXZJRhDKI6cTJJBPac0g+pk5RrJgboe47sFaAN2Bela7CpQGGkzUjvqByb6OO2ZF
	 T70DvsaQ+TLOjad3d/XRx/rm6tGFsD0QbtqcXKhL1NR50qyBK/e4bW9CxFOO+4vcyD
	 66IKJ/jF5P4Hc0F7vPugRFI6fhuCUZJWIxamWYnfMr8xZj5ZnJDxxJInkXewzEkm/+
	 8SjCUigcvRoz4IrWZHjBJykDrqz0k3kmOW9ppduzMkNrinHmUFBse+v8VMES65rsuP
	 fvJ6ybbU07JzyVOjHpfbS++4u9XN+QI47PFCk9AQn0S7TwdjVE595gDbn3+U07tR6A
	 Qz9DSfjWJxUag==
Message-ID: <sashiko-outbox-168439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] reset: toshiba: introduce a TC9564 SoC reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012164354.3872326-3-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 16:54:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] reset: tc9564: hardware state initialized after reset controller r=
egistration
- [High] reset: tc9564: active consumers forcibly reset during driver remov=
al
--

commit 504236856b96e78b9064b4d58c3ef7ba166341e3
Author: Alex Elder <elder@riscstar.com>

reset: toshiba: introduce a TC9564 SoC reset driver

Defines a new platform driver that manages reset signals implemented by the
Toshiba TC9564 SoC. The state of the resets is controlled via MMIO to a
region managed by a system controller.

> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
> new file mode 100644
> index 0000000000000..0243c2e0efd54
> --- /dev/null
> +++ b/drivers/reset/reset-tc9564.c

[ ... ]

> +static int tc9564_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct tc9564_resets *resets;
> +
> +	if (!dev_of_node(dev))
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	resets =3D tc9564_reset_init(dev);
> +	if (IS_ERR(resets))
> +		return dev_err_probe(dev, PTR_ERR(resets),
> +				     "failed to initialize resets\n");
> +
> +	/* Force all resets to be initially asserted */
> +	tc9564_reset_assert_all(resets);

[Severity: High]
Does this cause a race condition with consumer drivers?

tc9564_reset_init() globally registers the reset controller via
devm_reset_controller_register(). Once registered, consumers can
immediately probe and deassert their reset lines.

If a consumer driver deasserts its reset right after registration,
will this subsequent call to tc9564_reset_assert_all() overwrite the
consumer's hardware state and unexpectedly yank running hardware back
into reset?

> +
> +	platform_set_drvdata(pdev, resets);
> +
> +	return 0;
> +}
> +
> +static void tc9564_reset_remove(struct platform_device *pdev)
> +{
> +	struct tc9564_resets *resets =3D platform_get_drvdata(pdev);
> +
> +	/* Leave all resets asserted when done */
> +	tc9564_reset_assert_all(resets);

[Severity: High]
Does this unexpectedly assert resets for active consumers?

Since the reset controller is registered using devm_reset_controller_regist=
er(),
the devres subsystem will unregister the controller only after this remove
callback completes.

This means the controller is still active and consumers might be actively
using their deasserted reset lines when tc9564_reset_assert_all() is called
here. Should the driver coordinate with consumers or unregister itself first
before forcing all lines into reset?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012164354.3872=
326-1-elder@riscstar.com?part=3D2
