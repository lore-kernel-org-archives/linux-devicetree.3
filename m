Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E43B059C
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018975; cv=none; b=LwqAMIlNPxocaCtuZVQuS4R40nAzARky8nW970TSqcg0yZ18C62+EjuOkFQpFW1XYMLjAf8TopOfeNABEUVWBOGbBj5rqTOsQNmBDhW70348C5vXzxN4DBDgaHuFA/CC0bPuuFhIeJUxkPDL9vLHFrYivh8dmOHCl5ppAeZMidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018975; c=relaxed/simple;
	bh=RKiFmFAqNb364rTab/GwTpm3QZ2ra0NFuUG5txUl5Qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LJaGrkiojkzJT1fb5KlypbKLagYk01LP7graq+bT2891V+fJHX6mS5tjuLxOwisFgznWxi56fJcQUgQS629dSNj1UjuIWi89aOWKbyCa3lZ/aArLIwdJkKPUKfBPQ7uxExoo4tSVWCGIF9trg2AV9GLhBIp/3GV7CEgvWG2KRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh1KJ6sJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh1KJ6sJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9351F0089B;
	Sat,  3 Oct 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791018971;
	bh=LjdzR+JUGch7p+yVtKFpJqSe1Fq30t86V+flAs36tgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh1KJ6sJIpplVfebVb4iceV4iWybHSNFJgOzBNZHyPXbwX4gu0mFCWAqaeQ1EXYAC
	 XEAez8snJINNPORHJ0MH5NcmTT7AfIGaz+ppDNOcysv3hLeLR9qXEpCr3V/FEavBXh
	 4z5uCTLX+SUQNU5CI0pSqLprDE0ZyY9l9FD3BVfOU3crjoIOp4nB3qOltfWuMX7Xzj
	 bz4m4vMonGyinejMr1tc5nmjKABBNaiM55e0dYw86EDrb08pr4lwL3GXSHhLe24R2O
	 wBwMy1N0jcgGiUTRHewbmV+/N3fmGSGFAPlL/S2Pu8Np7tR33gOMqCMppZITNOI6G5
	 NcTtuIatNNU7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 08/11] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261003-kaanapali-camss-v18-8-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-8-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 09:16:10 +0000
Message-Id: <20261003091610.BC9351F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: camss: uninitialized hw_version used in tpg_reset()
--

commit df88e7d7afd82d4d282e25499832401b80cc7ee6
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID 1080 RX via the CSI2 TPG mux.

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..770a9e5d5ba5f 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)

[ ... ]

>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	/*
> +	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
> +	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CM=
D.
> +	 */
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)

[Severity: Medium]
Does this newly added check incorrectly evaluate to true on the first power
cycle due to tpg->hw_version being uninitialized?

Looking at tpg_set_power() in camss-tpg.c, the reset callback is invoked
before hw_version is populated:

tpg_set_power() {
    ...
    tpg->res->hw_ops->reset(tpg);
    tpg->res->hw_ops->hw_version(tpg);
    ...
}

Since tpg->hw_version is 0 during the first power cycle, this condition
will evaluate to true even for v2.4.0+ hardware. This executes the legacy
fallback reset writel(0, tpg->base + TPG_CTRL), which this patch explicitly
intended to avoid for newer hardware.

Can this unintended write prior to TPG_CTRL_CMD_HW_RESET cause issues on
v2.4.0 hardware?

> +		writel(0, tpg->base + TPG_CTRL);
> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-kaanapali-=
camss-v18-0-87ba4ebe0db1@oss.qualcomm.com?part=3D8
