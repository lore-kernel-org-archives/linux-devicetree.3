Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201367;
	b=Qv/r3mGuY8fd9iuqjJd11PDv4eGux7xs9hBWy4i3UmfAVc0EaFYIYw6f1q3qpRiUIs9V
	 zQGJxdCDwz0wy50u0xCdMBS1ja1ilPM8cX1SKBRhpNVT7Tfp0NJdtfrJs/7gtB2WgZz1d
	 v1Yiqw/HpnRZrtCjDBLGLS6cy0latzIh+QZuKdGHH+MlO76YwomfbnHYlPjke97YNp6YZ
	 aloAOMj3d3ZFqtEZDCo0Mhiihk/esCXXHwB2u7broZeFYV9+eYKZVbvVNH8kL0rMNnE0l
	 hMBt5N6A/mAeCM58wcCzlEFIxF4v8hpqoDDJE0U9e26WEQVKyYwLOaSRb3bGut337WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hgvCM9V7TaLd2jb0CYmQlKZURS/+sTIaKdo5XUJ8X48=;
	b=3QzhT+bs8ywBJz8j0kgWy5H5hF9H54flQhS9dWaQ6xgoV20hlUlXVoN8hIzP0n2p5R+U
	 sZJ7Uip1wlTAO7OM7lFaH0Xyb0jf/gsVSV80MV4k6A1Bb7mmHFFkroyoQ2yuSQ0KUltii
	 BFnOmHNkGV0I3oPsX11U2Pfa77rxPLe5lLeHU+BKa3U1SJhGCTwmb/knf4jrDUOOus9nS
	 POKOsDxKX5KTT9akaw8OIX9cbR+ww7g6vOY7Nbvyu/8cgP1R9deYVahiY/bLxoxW02zh9
	 nQFMMjBRpnQuPmjQ+DHOi9ZTGs+xRhtckN3w+veZpiQQlFl9iC/j3AjE4VC9UHBYrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTM4YCYk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03F606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTM4YCYk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E8D1F01825;
	Wed, 28 Oct 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201367;
	bh=hgvCM9V7TaLd2jb0CYmQlKZURS/+sTIaKdo5XUJ8X48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTM4YCYk4X24n86MrFtav6/bhaqv9qZMikQmZcrIxNVWsUnGf1j3KEcsDAFOiDRUj
	 oU2+6LU3zC8aUGgXcm+A8LIAxr3FUBXQnS4CYeygLf3CfqRieI33RCPGGeojNw3SWM
	 08d0SjqXYo2nk/W9mOsW8qmR0bzgf/9OgGOPCtVcTLazGIFAYUZfoKaFD7+VTvoe68
	 RPEAhIyHkFc3NIKBU8uruyLJzky//LSODAZ3uDbLqJdmsvZvj6Okw2xBODcWBkaiwn
	 Wuu2Y5e5fROjJlMGSkhsh+sh+avXFSJOWLW1YNorw+oxVGN+lwX3OSnotbWIjjTrCX
	 eg3j6c5vdVhMg==
Message-ID: <sashiko-outbox-188053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:29:26 +0000
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

commit f50ae6ce8455f618cec0228f4b565ad64a56769a
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This commit adds support for the v2.4.0 TPG hardware found on Kaanapali,
routing TPG output through the CSI2 TPG mux in CSID 1080 RX and handling
test-enable and reset via TPG_CTRL_CMD.

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
Is tpg->hw_version initialized when tpg_reset() runs for the first time?

In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
reset() before hw_version():

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	if (on) {
		...
		tpg->res->hw_ops->reset(tpg);

		tpg->res->hw_ops->hw_version(tpg);
	}
}

Since tpg_hw_version() in drivers/media/platform/qcom/camss/camss-tpg-gen1.c
is where tpg->hw_version is populated from the TPG_HW_VERSION register,
tpg->hw_version is still 0 on the initial power-on. Won't this cause
tpg_reset() to evaluate 0 < TPG_HW_VER_2_4_0 as true and write 0 to TPG_CTRL
even on v2.4.0 hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-kaanapali-=
camss-v23-0-95f250b18612@oss.qualcomm.com?part=3D11
