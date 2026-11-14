Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658033;
	b=Znljuk65GyNJy6h+X1lI4mDasdAabE6zF2bLfG8zrAjbu7KxCXD8+AD6KFSwEaPpsYr1
	 alyBugGKpEk5it265ValXxq4Q2AjAPXjZDIUvgtTWiiAfROixh3vfPSONrLK3UYHYtEVo
	 /MXYY0DjTVWxNx01plTQ7R5ZmxbHGRRgLLEXUgtSjh6VNyQlMrWoDndwUp5+NvZpyXBKn
	 xFJwK/E6NZOXe5Z4ovLc745mIiF6RdaOXzBGoNqOyCB+9ol24vOhp+VvaqN/1qwvF2Dm5
	 2++QbDFDRaemea3hEHs8crFn3784Su9/C5ja0J8z6l0CVpa5cwFRUWwIVbyfoBW5ntg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658033;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=weDOTmg75K/HqTA6ws/VutEVqs5lbo7Fs+CjNB1vU4U=;
	b=FQJxF9p75PKc8sZWNf+BWBicB9J3swtFr+/SHVIlj0R/R0bnm/JdYktajxQmzD7GkAu5
	 q3XvK1C8CigxA/3Z8y3vH8ocwakXrj4Df/S5U/IGhqmKliZlz49BYRqGPH/GXat2X9gd6
	 ipNeHsJGi1jPw/LSlTig62Xk9IVH9cK9Kyu2twNslwgcey4aQm6dnVoKV0dgGCy2yIgFA
	 UkY1KWXdD0L9hl15jdG9DBrDz1tI+sEKpP/8ZBsb3Vfb33oOwg3PY1KpJlwmhr/3cDa/p
	 0fE1at3NZIIx4WRgBxB9rWFh9Acac3DrE8Wk+iujeQpH+06+zpRjF3/74aZOQ42RZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUQUMhpp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8F606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUQUMhpp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8DE1F000C4;
	Sat, 14 Nov 2026 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794658032;
	bh=weDOTmg75K/HqTA6ws/VutEVqs5lbo7Fs+CjNB1vU4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUQUMhppD6J6XtFmGdiEx+3N9Mx9WoBWc960Jv5QNqMvxt88wyYeSCaQdH6f0eTiW
	 aukM/aEvrny5/z/d3L/2M3NZlG57K/Se5amQhJTPWUo6IDt2BXRF62lGSvPA7uVSdh
	 BksT+r/zMywpD2C+Q4waqfmTScB7NvMx3LLdP5VspqpI3FHy4MMsjxdi0rbXuXuGP8
	 da0E+aneyeDvTbcCS7++wLP2tDmt0bn6ag49hUMJ5x8rX7TQc5OVWpG+VHyN+oWsKx
	 wzG9PU0SO1bCi9PeHtqbxpAedNzLIow2M0TDoFFWrhRhGq51qOZltLljYMyyPy4ZuW
	 vTUluOOMe6N4A==
Message-ID: <sashiko-outbox-214494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/23] media: qcom: camss: csid: Scale the clocks
 with the CSI-2 link rate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-9-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-9-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 12:07:11 +0000
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
- [High] media: qcom: camss: csid: sibling phy_rx branch clocks drop
  shared RCG rate
--

commit 08b369e2e076c38176db85510f92710a98c49c6c
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

This commit scales the CSID core and CSIPHY receive clocks across all
SoC generations based on the CSI-2 link frequency and votes for minimum
clock rates using clk_set_rate_range() and clk_drop_range().

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 51f20907ffde6..714cea6883a78 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c

[ ... ]

> @@ -532,72 +533,197 @@ const struct csid_format_info *csid_get_fmt_entry(=
const struct csid_format_info
>  	return &formats[0];
>  }
> =20

[ ... ]

> +		/*
> +		 * Vote for the rate as a minimum, as the clock may be shared
> +		 * with another CSID which needs it to run faster.
> +		 */
> +		ret =3D clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
> +		if (ret < 0) {
> +			dev_err(dev, "clk set rate range failed: %d\n", ret);
> +			return ret;
> +		}
>  	}
> =20
>  	return 0;
>  }
> =20
> +/*
> + * Drop the minimum rates the CSID votes for and take its clocks back to=
 their
> + * lowest level, or to the lowest level the other users of a shared cloc=
k need.
> + */
> +static void csid_release_clock_rates(struct csid_device *csid)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < csid->nclocks; i++) {
> +		struct camss_clock *clock =3D &csid->clock[i];
> +		long rate;
> +
> +		if (!clock->nfreqs || !csid_match_scaled_clock_name(clock))
> +			continue;
> +
> +		clk_drop_range(clock->clk);
> +
> +		/* Round first, so that the rate respects the other votes */
> +		rate =3D clk_round_rate(clock->clk, clock->freq[0]);
> +		if (rate > 0)
> +			clk_set_rate(clock->clk, rate);
> +	}
> +}

[Severity: High]
Can voting on clock->clk with clk_set_rate_range() fail to protect the
shared receive RCG when two CSIDs use different child branch clocks?

On SoCs such as SM8550, SM8750, Kaanapali, SA8775P, and SM6150, full and
lite CSIDs (or individual CSID instances) acquire separate phy_rx branch
clocks (for example "csiphy_rx" / cam_cc_csid_csiphy_rx_clk and
"vfe_lite_cphy_rx" / cam_cc_ife_lite_cphy_rx_clk) that set
CLK_SET_RATE_PARENT and share the single parent RCG
cam_cc_cphy_rx_clk_src:

drivers/media/platform/qcom/camss/camss.c:csid_res_8550[] =3D {
    ...
	/* CSID0 (full) */
	.clock =3D { "csid", "csiphy_rx" },
	.clock_rate =3D { { 400000000, 480000000 },
			{ 400000000, 480000000 } },
    ...
	/* CSID_LITE0 */
	.clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx" },
	.clock_rate =3D { { 400000000, 480000000 },
			{ 400000000, 480000000 } },
    ...
};

Because clk_set_rate_range() records the minimum rate on the child
branch clock's clk_core rather than on the shared parent RCG's clk_core,
rate calculations on one branch clock only inspect the rate boundaries of
that branch and its parent RCG, ignoring minimum rate votes held on
sibling branch clocks.  If CSID0 is streaming at 480 MHz and CSID_LITE0
either starts a slower stream or stops and runs
csid_release_clock_rates() to set clock->freq[0] (400 MHz), the clock
framework lowers cam_cc_cphy_rx_clk_src to 400 MHz and underclocks CSID0
mid-stream.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-suppor=
t-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com?part=3D9
