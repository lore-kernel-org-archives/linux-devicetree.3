Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661590;
	b=XJgmzN1Yhi/Ec3nvgz8meUAeQfciaJGSAOFoOoFCUr8DgOr0usZUvj2CYbY2vHMnDSyM
	 IBfGbE6AgwkcMJos1dXJAL7KtWOQbd1hIdaQ3YQK5xhWnAhtfcVRBP9Zt67iLE4+agCDj
	 jkLj1hLJ4nL9AgmUufAa+nOd2/7AXnryT39ADMnboE29XQXa88KHjA7rll6FGtwRMHsWh
	 dHGQv6UTQeFYjn4RfssdOrr9Mu431YXXNdmyv4n+9tV2RUfi44dXa2DzujTzKbzqiiYLJ
	 gUIRhECzdEwtL8GjbnmT25kjRHe3IOsIqOjAqb36TQlFX03cuMSw+TmzNGDXWK91sbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3iljEpLpT3zxEltEKD5hygKgFK4DuNubXO4oBwrbx1M=;
	b=RJZsI8ONsC6+vnnEFulF6+RMuwUDshcWmJDPUwKpXolE4d4qG+j7XYHL6FGmZWxLOgnG
	 2UebdSURjgP5M2/+ivA061QJG9rNDSRwVsOQ9/htNJ234MZMqpxErxILjAu1PHppzXWm7
	 DaOON1qCkPh7AH9lte3xAOgijOyi6KiMeWgZGX5/ijs83yKpV61J0qGMSb9gDj2yeFRBK
	 dVlqavX2JSc3fAXdjIgTYqWu8VFwh8OzAKmKWt7aptNwcOwf8POC9kJgwEKDrR5jlpbQy
	 212P4EjdnRoupYYpChx8iOrCfyAp6Tu+VGMxjZ4lWzNO/p9rcy+cIkf6mMXjjJgBOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aamZIrYF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B1606A328
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aamZIrYF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98AD1F000C5;
	Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661590;
	bh=3iljEpLpT3zxEltEKD5hygKgFK4DuNubXO4oBwrbx1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aamZIrYFyhrXMUTgX8qeCyadI461I1qJadMMrSWea29a/IMNzr+Mf3GtU9fiADxZB
	 i6wtUmRnp3oPcLAJVOlNK5x0Ex7G0mIHdsmBUo55a8twcaWWlluibXiEFYMBhIWz2N
	 Li13rkLqThD/blCOh7pXInM0MVcWAr7GzL/aHsexE6kWF6n/shNA/OP8LI+vHqfB58
	 AgPt8FMW7FU4AuufhYmZiuL+sppi4MuM/9DsxB2HfWWV+5dZZrarwl7Y19GbVlFBbe
	 JV4w+fheTSTs6Ge0ixbdgcYT9bEVIyzvafrqkK+WCXTSeU8eE5qc99M0iA2I9GsudN
	 ZysmBXhznDCFg==
Message-ID: <sashiko-outbox-181265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 09:33:09 +0000
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
- [High] arm64: dts: qcom: HDMI DAI link breaks sound probe with display-ca=
rd overlay
--

commit 1d7b2eb9f1841da26b5c6030ed7671341483661b
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

This commit adds the primary MI2S DAI link, Q6APM backend DAI clocks, and
TLMM pin configuration needed to route HDMI audio through the LT9611UXC DSI
bridge on the SM8650 HDK.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index 6cb0dc089b17a..eba989e6766bf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -218,6 +218,22 @@ platform {
>  				sound-dai =3D <&q6apm>;
>  			};
>  		};
> +
> +		pri-mi2s-dai-link {
> +			link-name =3D "HDMI Playback";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&lt9611_codec 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
>  	};

[Severity: High]
Does adding pri-mi2s-dai-link unconditionally here cause a sound card probe
regression when booting with the display-card overlay
(sm8650-hdk-display-card.dtb or
sm8650-hdk-display-card-rear-camera-card.dtb)?

In arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso, both &i2c6 and
&lt9611_codec are disabled because the DSI lanes are routed to the display
daughterboard instead of the HDMI bridge:

    &lt9611_codec {
            status =3D "disabled";
    };

When that overlay is applied, lt9611_codec never probes or registers its AS=
oC
component, but pri-mi2s-dai-link remains enabled under /sound.

During sound card probe in sc8280xp_platform_probe() -> qcom_snd_parse_of()
(sound/soc/qcom/common.c), for_each_available_child_of_node_scoped() iterat=
es
over every available child node of /sound and resolves the codec DAI via
snd_soc_of_get_dai_link_codecs() -> snd_soc_of_get_dlc() ->
snd_soc_get_dlc() (sound/soc/soc-core.c):

    if (codec) {
            ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
            if (ret < 0) {
                    dev_err_probe(dev, ret,
                                  "%s: codec dai not found\n", link->name);
                    return ret;
            }

Because neither of_parse_phandle_with_args() nor snd_soc_get_dlc() checks
of_device_is_available() on the target codec node, snd_soc_get_dlc() returns
-EPROBE_DEFER indefinitely when looking up &lt9611_codec, causing the entire
sound card probe to defer forever and breaking all audio on the board. (The
same issue also appears to affect prim-mi2s-dai-link in
arch/arm64/boot/dts/qcom/sm8550-hdk.dts with
arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso.)

Should pri-mi2s-dai-link be given a label so that
arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso can set its status to
"disabled" alongside &lt9611_codec?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-topic-sm8x=
50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org?part=3D3
