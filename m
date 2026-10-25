Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899443;
	b=x/9yuTzNVreKizcANp1b6hJaTwbPwO3qOmCW28OdyjWqPjzGLUoNEXDw04pP6Dhz3rBH
	 kLA6upvwVL4Sihkq52DiYkjaAUfsWKNXrcRpCzDFeu/FGwuQJzQ5W6udmI2bc2EjoszmD
	 uPZKG3QQOm4cvQYCptZDkVwcvnvAfq+gbuAi7AHGe31KMzBYZDzChlnge/P0YaBTBGD70
	 obef3GZVocFTD8UbGWBnEDy2uWmop1CbEOqPJEjV/sFhC26eqOhp7bFt1hXnpGJVObYy4
	 eaS/VDYlLWhJ1tD9QVCnQy8CPS0PqBII5wECy+AqecDZ25+llV1gC3R9LzbJPLYXqaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DNrd9zf1g0/1vsLw/Gwfafp9ltT5ubtSaLG4hUj3UHM=;
	b=OCgXWFR+5qmia0nRJutuEYgqRzQByOtu2aJ5nEisfjwrh5D6bcnmZhxQMnb+uK0GIYCX
	 qBEsMVieRe1EFK2w/f80V+Q3jha/xS+ISceKe6p9skBLiXzOrNwUeRSnkcL6wIiYm0JzG
	 hvAiELLv2XYhtqROI9ew2gOhgRhwYvFeSh8/P93GKWqoVa5XLInNGL2R0qiZZj3SdozHv
	 vxsp+/h2s04gbQadTi2NbuKoIZG7X3XzGtJnuKucFZiDfDigtIimQyanm8mzwTG7mZjWN
	 hiaVlV9VjHeI3CZ7p0KikJJ6y6nAGlI1dYUso+on9wZBXuQHV3cXlqseCaAuh4hQ9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJygGthz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FDE606A31E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJygGthz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0103E1F01825;
	Sun, 25 Oct 2026 03:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792899442;
	bh=DNrd9zf1g0/1vsLw/Gwfafp9ltT5ubtSaLG4hUj3UHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJygGthzhS24It1g9cfKgQQUKCsjn5F8Wq+M90rVwkJMzbLvhNZ4dHZFCNKX6Ip/n
	 kPhQGvvtNyPa+VX78GkvpQqxSa6s79me7Y3PrrQ6Z9g1HTRjwh2aqpuZB3pMKRfdMt
	 tLdCVHEVxAskIfgi+B/KYBMEnLKKLAXUhEu2ZKeoYiB/6wzYg6u83AxGfCLqYNyGrs
	 gR50/TekZZT164GkwtzJu4fcHVllOSdsBuDp/daMv5+ZPjvyg7G+4rxVv646sH/KAx
	 moD39uMFYUTcjJFqybmx5BaxDZSWInBlBFcidlkUyn2mR/3mqYYUqAAVNz82wLFzv9
	 3zQLyKpL4/ikA==
Message-ID: <sashiko-outbox-184021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 10/14] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261024-kaanapali-camss-v22-10-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-10-7da3ea49c8a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 03:37:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: qcom: camss: uninitialized hw_version check in tpg_reset()
--

commit 0810eafd7af8a3c90956a80a5132187e634531e5
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This patch adds support for TPG hardware version 2.4.0 on Kaanapali, using
the TPG_CTRL_CMD register for test-enable and reset, routing TPG output
through the CSID 1080 CSI2 TPG mux, and wiring up the TPG resources for
Kaanapali.

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..cabbb2638cf38 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)

[ ... ]

>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);
> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

[Severity: Medium]
Is tpg->hw_version initialized when tpg_reset() is called for the first
time?

In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
reset() before calling hw_version():

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	if (on) {
		...
		tpg->res->hw_ops->reset(tpg);

		tpg->res->hw_ops->hw_version(tpg);
	}
}

Since tpg->hw_version is only populated in tpg_hw_version() and starts at 0
from the initial devm_kcalloc() in camss_probe(), won't the first power-on
of a v2.4.0 TPG evaluate 0 < TPG_HW_VER_2_4_0 as true and still write 0 to
TPG_CTRL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-kaanapali-=
camss-v22-0-7da3ea49c8a1@oss.qualcomm.com?part=3D10
