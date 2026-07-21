Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B631427A04
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616857; cv=none; b=TeuJgx1UwtYDmk1YOsXMRkJW9bf1TsiHJs/2xR2/6NfBRFznkyW2QNGewRoQSL4zZ8bG7TcoJhZLLmvfj+IUqNSbaklIcIPITHyzYPC5jmjSvSgUn5CWCblg4yyBY+eaOaJyclWqCp+MNmSIUHwMUbEh+VIWwL54FHjtvIjZ42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616857; c=relaxed/simple;
	bh=EaczP8vHkcmD2CnZKKlr51IjBWJs8uYaLtHVfFy6Ht0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gjz8OeNt8YADWzTw+Z7LxeebwRCGuqQFT9hG+gOk2OZtnD799HyUJsRBc00c1idFK/b3dx6WPUs/53zfRHy7QHm5WT8aPZ+gBPa+QMLfmCzDzij/Q94JwzfcVMb0JAFHmWVTpK8uTAsioRgbTQIhtUwicxRqS2K1uRwzFzmO3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsbiyarU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsbiyarU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67001F000E9;
	Tue, 21 Jul 2026 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616856;
	bh=e9BvuIW/CU/AgFCRKhHvm8riXZ/ScehEjRSlzBhPlUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsbiyarU9oKKnNP9Ti6yxHUHVFl/lY3nQ5caE2GTBJJOcCXr9ww39HMm+EgK2XtAO
	 qn28KuaJhUYWsyF0v7XRoIPiTzGGj7hqYL/wdDMBoYCLecIbZ7GRkZkPeobepEbiQx
	 DpRM2IEB38UT+9AwHwYxUu44vYzQmXHsMI8tILECTslVoJI7/5HMzCntLlTjCOEnbT
	 KV7HhIXNd6xCy6x8dpinfFquOB7WUApXuhPmDPXMKSfEYmio/Hca+8bHYIrNN69Dij
	 HB1X2c/eP+M17WxrymSuy/XN1cwwomHOxVzH0pv17x9TgK2Pt2ZcZyR7L7+1QuQM8T
	 vLtXLhdlgaVmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on
 RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721064115.64809-4-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-4-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:54:15 +0000
Message-Id: <20260721065415.B67001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the DAPM widget =
for the HDMI RX capture source is incorrectly defined as an OUTPUT widget, =
breaking the DAPM graph for the capture path.
--

--- Patch [3]: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK=
3588 ---
commit e5a9a8ba89a4a45c730c1b44e28e899087346b1f
Author: Igor Paunovic <royalnet026@gmail.com>

arm64: dts: rockchip: add HDMI RX audio on RK3588

This commit exposes the HDMI RX controller's digital audio interfaces by
adding the #sound-dai-cells property. It also adds a shared
simple-audio-card routing the receiver I2S DAI to i2s7_8ch, mirroring
existing HDMI TX sound cards.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a2640014ee042..e0dce15643997 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi

[ ... ]

> @@ -23,6 +23,23 @@ simple-audio-card,cpu {
>  		};
>  	};
> =20
> +	hdmi_receiver_sound: hdmi-receiver-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "RK3588 HDMI-IN";
> +		simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> +		simple-audio-card,frame-master =3D <&hdmiin_codec>;
> +		status =3D "disabled";
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai =3D <&hdmi_receiver 0>;
> +		};

[Severity: High]
This isn't a bug introduced by this patch, but will this HDMI RX capture
path work correctly with DAPM given how the underlying codec is currently
defined?

Looking at the hdmi-codec driver used for this receiver:

sound/soc/codecs/hdmi-codec.c:hdmi_widgets[] {
    ...
    SND_SOC_DAPM_OUTPUT("RX"),
    ...
}

The DAPM widget for the HDMI RX capture source is incorrectly defined as an
OUTPUT (sink) instead of an INPUT (source).

When a capture stream starts, DAPM walks backward from the active CPU DAI
sink to find a source, but terminates at "RX" without finding an EP_SOURCE.
Does this prevent DAPM-managed components on the capture path (such as SoC
FIFOs, regulators, or clock supplies) from powering on, causing silent
failures during capture?

> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s7_8ch>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721064115.6480=
9-1-royalnet026@gmail.com?part=3D3
