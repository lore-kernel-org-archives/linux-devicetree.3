Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661534;
	b=yISdManKauLU0/vzosgy2IZzx9Vytm4QioIRAI+hcrxib1Dj680DwCL2kvKq2SIYVtAO
	 rQ6DgN3+n8J5T39bkg92kQHz0B4Aqsn4agVrvuH3V+L2Ej4jqQNAqakTAGQj6OeKW/AlX
	 RAH7BT3Qp0icpImjE0L8Rf3Aqk8cbLbnVnaOnQB2xtbvFcdJhAOirK9w/Jkurk0Dnm6FR
	 haOu/ACsXZcW9y1V62ZWPEi+Sf1Hki9VywbSCs4niYBPXlw7y2y5q0HQQNp2Pz+gPgifs
	 gglLYs4rLQ7xiXUDc3rIaoz4FVYBupJqKu8i4HiUIxKU108VZd1g9cN1LDJImQlAAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661534;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EKu4ocfRU2fuMVC9PMJ7fjW+znvME5alGI9jKLiaUlA=;
	b=k+rIRZGc4INSXlWcRJWGNDT1kyQ00VkZm9gAjZ07z1lXg35bcCVI4NdsQW5/zSF/YxxZ
	 nE1geP6605j2ZlExIan/kx+egPSuOLNJH56BmQcmOGYBu6jBNJJHaSbALzF5adNQyqVkp
	 CIsQziyGyJIGrjJgQycP+h5/t7Rc/9aRNmQ12T9mmqFWRX04bC9gpQNBlFcRyktew5IBm
	 tpgkwqhoCNGsxozVXGStGtI3cNIfJLpQi8HlaQhLua6dqm8y9qhrhym6v77boOX3JSKq6
	 GQ6n9Zncf0bGrOMGizAcj0BMZyy3GvgayHpc0S//AN7S/th2jIn7h+CdJ2Z+NgEBmaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iS/v90zt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF4606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iS/v90zt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833041F000C1;
	Thu, 22 Oct 2026 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661533;
	bh=EKu4ocfRU2fuMVC9PMJ7fjW+znvME5alGI9jKLiaUlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iS/v90zttKmmGdUYZXunTOEFECbSJPb+4eb/EuOkmudymu5mt1d8LVsgYfTgovsmo
	 shxVJAv62Q5lpQjG47zL+m+9iYvWebql2Bs6eClE78ImCUwcZbhVXVEefVmtfNQHKa
	 f2Uub3N49rbStPobMOCK2J4aOjbnugxo9VA58DRVZZF6bOBEnHqBYxbUCi4eO8hRjl
	 HMoAudKnzAnhbfdFZqpOaYjXOW87M5UHysEhrAiVvhKlBGUwTeYOokIJSjlTwjFpAZ
	 hSIrt55Lh0ARTgA51K6ReJxqcAFEpqslsGcTJpTehUhM9DJ54hkhQ9oCygrDJFXEhw
	 6gF6iPLYaN8cQ==
Message-ID: <sashiko-outbox-181264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for
 HDMI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-2-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-2-aa1030a75e46@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 09:32:13 +0000
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
- [Medium] arm64: dts: qcom: sm8550-hdk: active HDMI DAI link breaks displa=
y-card audio
--

commit c6bfa3ecf122e125408eec9949d0c3f7b965b70b
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI

This commit adds I2S and audio MCLK pinctrl states to sm8550.dtsi and
configures the PRIMARY_MI2S_RX backend DAI and HDMI playback DAI link on
sm8550-hdk.dts to output audio via the LT9611UXC DSI-to-HDMI bridge.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index e75e3b878e89e..6c09816983a23 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -278,6 +278,22 @@ platform {
>  				sound-dai =3D <&q6apm>;
>  			};
>  		};
> +
> +		prim-mi2s-dai-link {
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

[Severity: Medium]
Will leaving prim-mi2s-dai-link enabled when the display card overlay is
applied prevent the sound card from probing on sm8550-hdk-display-card.dtb
and sm8550-hdk-display-card-rear-camera-card.dtb?

In arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso, the LT9611UXC
bridge is disabled because DSI0 is routed to the display card panel instead:

    &lt9611_codec {
            status =3D "disabled";
    };

When the sound card probes via sc8280xp_platform_probe() ->
qcom_snd_parse_of() in sound/soc/qcom/common.c, it iterates over all
available child nodes of /sound and resolves each codec phandle:

    qcom_snd_parse_of()
      for_each_available_child_of_node_scoped(dev->of_node, np)
        snd_soc_of_get_dai_link_codecs()
          snd_soc_of_get_dlc()
            snd_soc_get_dlc()

In sound/soc/soc-core.c:snd_soc_get_dlc(), the lookup checks registered
components without checking whether args->np is disabled in DT:

    int snd_soc_get_dlc(const struct of_phandle_args *args,
                        struct snd_soc_dai_link_component *dlc)
    {
            struct snd_soc_component *pos;
            int ret =3D -EPROBE_DEFER;
            guard(mutex)(&client_mutex);

            for_each_component(pos) {
                    struct device_node *component_of_node =3D
                            snd_soc_component_to_node(pos);

                    if (component_of_node !=3D args->np || !pos->num_dai)
                            continue;

Because lt9611_codec is disabled by the overlay, its component is never
registered, causing snd_soc_get_dlc() and qcom_snd_parse_of() to return
-EPROBE_DEFER indefinitely and breaking all board audio when the display
card overlay is used.

Should prim-mi2s-dai-link be given a label in sm8550-hdk.dts and disabled
in sm8550-hdk-display-card.dtso alongside lt9611_codec?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-topic-sm8x=
50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org?part=3D2
