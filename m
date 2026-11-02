Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616733;
	b=fCiCUEHQRP6npNqP2a1xOPnbBuadbfoCR/D+YasvKeRxdVa/U6BRzOzlwexVKSoMxv6O
	 nWTdPTMojidcHfed3KVYis48x2nQxpbbkFDEEF76+eUH2E4lcdzrl818z7WoCK0vW2JIr
	 zUT8o+yGvkAMFwXzM6tWE9CkRm6dB7z0vXR5woqdCtzYDFjEGenhzE0ZLR1r73DzG7fJz
	 Szk78zKsNryIKC2FZUeJ4xG8sA3AMwiRVhH2DViCmFVe90PbAgTZmcONWX7a+JyKmxKzB
	 JRZ01lSzcvqQ9fqgMwOroWyLyWAnm6uwI9jq/Ldqs9Uqc+PzBth3q1EgqCy3Zvc6BQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616733;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nhKWXCgb4p2e/VjQ5h3+rTqX8jqrTz/GdoO6ZmdZNvE=;
	b=07CI8xCqH2vWD/rfkrJbWkmCOVx0GC0Y+nayioXDukIho8V4AQzQishAvJS5tiHuEXlO
	 B7UXSrsCRsBZ9to7R8w2Qd10peiSGCa4yqyvmk5WrDtXOFbBH9SfURCG+ZSkio5oxKClG
	 jTpxP8fPeaQW6BDSASYB2SNIT6+nRlQnAozN45kBBSp09vi3UWLr6Qead6BUpdMAKmiNC
	 Wb//cC6ThAVh5Nipj6nWGUHggn8TiEwGPh0joEKP7Nds/sgGXHbuJfve5jY39lbw+Icte
	 I68ptvrprorg0FeRt2N3WOrQk7rGxxv7QJUiWt2DYxOOBiKRGvfbj8znAcvzLY8UlBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYbD6M5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D52606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYbD6M5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8FC1F000C1;
	Mon,  2 Nov 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616732;
	bh=nhKWXCgb4p2e/VjQ5h3+rTqX8jqrTz/GdoO6ZmdZNvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYbD6M5wUTWFPlJaLJniHgrOXDZSJCOSV3uFDwUy1CIc2328YXXDNDXLgtx6k8DUH
	 vUtOmiDTKOeRCfBAanNtXCq3KfJKHihe2M35lbUOKI+41ufKNICVOu4NV6/0cU6ucF
	 J/Zs12Pc08kUr5gbWmVxC2+nBjtCd0dpw5jCdijWZ0fNLpJ5y1uqmUkVKRgStNh5Q+
	 TsNcGt14lLlmxeSwbztpHk+gV9b8flCImRFTChKUP9aiqrdGxPaTkVTA4i8ifsDjJF
	 RJmxwMS5rIA6qB4JaUQgfePJ+itSO/0NXe6dYKKy5rqgu39YpraEyMN+OjgYxWLRin
	 NBkc1QxGg86lQ==
Message-ID: <sashiko-outbox-193294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:52:11 +0000
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

commit ea18d39e5144ca1e8d628aa5ab708e84983e10a3
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This commit adds support for TPG hardware version 2.4.0 on Kaanapali,
controlling test-enable and hardware reset via the TPG_CTRL_CMD register and
routing the TPG output into CSID 1080 RX through the CSI2 TPG mux.

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

[Severity: Medium]
As reported by Sashiko on v17 [1], is tpg->hw_version initialized when
tpg_reset() is called for the first time from tpg_set_power()?

In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
reset() before hw_version() populates tpg->hw_version from the
TPG_HW_VERSION register:

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	...
		tpg->res->hw_ops->reset(tpg);

		tpg->res->hw_ops->hw_version(tpg);
	...
}

On the first power-on after probe, tpg->hw_version is still 0, so
tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and tpg_reset() writes
0 to TPG_CTRL even on v2.4.0 hardware. Should tpg_set_power() call
hw_version(tpg) before reset(tpg), or should tpg_reset() read the version if
needed?

[1] https://lore.kernel.org/r/20260929061248.E035C1F000FF@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kaanapali-=
camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=3D11
