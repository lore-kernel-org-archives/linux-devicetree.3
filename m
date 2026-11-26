Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701550;
	b=lc8brltZZuO0Z5Tgp74QgZJZBttbRHuagDBoLpChFwtQLOG/+zs7N7ESQJPuhXmkhkS5
	 AcM/iTZN9sJaFqiRMHQxrDCE8fNcnkebH5nzt8xr3G3tIp+O0fqy+2cT2KiwTIMj1Xc4r
	 ovuy3JCevYeQxTkaPu9lX+rggeQJMMynEBUb0ccayZE812i7KVSkMwLWHpdWW8kl+FeQa
	 6U7PF21pLU89KNgCj69LKbZNuulJ3zrrl8ewOsLdkQsCUQOZta57aoE3ZQYKHBTTLhx10
	 RSpn+TpAGF15qM37rz9vuFDbz9ayAs51++UyNSu81Q587De64yc5X6AdtkSuPAtHJHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701550;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BUnBxZ5TOpW1AE3y1XW0jFiWlj+sMinsf6/9xM46Lqc=;
	b=0mhyv67du+rf8gVeq6kCcMEpofLRLXsyOYQg+NDIyWIxh5ZJAmlJjbnIeP6ps9I1vGcW
	 aWDyk6PzZGtZbujmjgxRnsFSiqdtieKMBHw5yEZe6yYXrswEtLlBgOi3EFAocwNodKlvB
	 dog8khc/yYeIaRagz2WzvPfoLSTxw8pOoJbaWwg/xWOvw+bEAqWH5k6P035ZokIYfEkNC
	 o/KutyVf9UX5MNLgrMkCGXhfnDqx3UQYpAuHpleL9sosEdpuSjFRy/GI9dhPvgQYtKzOv
	 gSTnGKLkZQD6Md7DqNxEsmu7iQXQJsRoRBCPs36xpuoBYXiadtv/jaNopfyV6fJj7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1QHmQrE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F35606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1QHmQrE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B721F000CF;
	Thu, 26 Nov 2026 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701549;
	bh=BUnBxZ5TOpW1AE3y1XW0jFiWlj+sMinsf6/9xM46Lqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V1QHmQrEthigKZd/JGcLzshP5iEKCV5VRSuYtJR9YgalJ9D8sLKYqmLlPd2pZHaHB
	 KmT3jz1ThIPl4JRSC2s7QGIZCKhupJDlAHYcI64M/OsPHw7Gl0W7+Mse0UvGASZJdB
	 tn57Jk/HwVml0eXRIIpPba8hnBJCVK1Y58T65gVEPLQGzCPZCObr9zr2EGWTMd5Gyh
	 ETG5z9NeHkxcL3gcLsl56B+DAKMIhOqySCsvUZVF/rOKJfsnKWbdAER0xU5rRuqmy5
	 W+TkSNmSlDMwDACgOK2OJOWSOWS42vawvxOQYVlJ+X5VSYY78ZYtY20Cp1taHOmNmD
	 rJNLpMj/uo/Jg==
Message-ID: <sashiko-outbox-235666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: sm8450-hdk: Add display card
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126134508.320700-9-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
 <20261126134508.320700-9-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:59:09 +0000
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
- [High] arm64: dts: qcom: sm8450-hdk sound probe fails due to enabled
  HDMI DAI link
--

commit 2845e74d5b67d8963c4614b68345c54b82ab8dfb
Author: Vladimir Zapolskiy <vz@kernel.org>

arm64: dts: qcom: sm8450-hdk: Add display card overlay

This commit adds a devicetree overlay for the SM8450 HDK external display
card with a Novatek NT36672E DSI panel and disables the mutually exclusive
on-board Lontium LT9611UXC HDMI bridge.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso b/arch=
/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso
> new file mode 100644
> index 0000000000000..3fcaae7f2abc0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk-display-card.dtso
> @@ -0,0 +1,144 @@

[ ... ]

> +/* Disable HDMI bridge related nodes (mutually exclusive with the displa=
y card) */
> +
> +&i2c9 {
> +	status =3D "disabled";
> +};
> +
> +&lt9611_1v2 {
> +	status =3D "disabled";
> +};
> +
> +&lt9611_3v3 {
> +	status =3D "disabled";
> +};
> +
> +&lt9611_codec {
> +	status =3D "disabled";
> +};

[Severity: High]
Does disabling lt9611_codec without disabling the HDMI MI2S DAI link under
&sound break the sound card probe?

In arch/arm64/boot/dts/qcom/sm8450-hdk.dts, the prim-mi2s-dai-link child no=
de
of &sound remains enabled and references <&lt9611_codec 0>:

arch/arm64/boot/dts/qcom/sm8450-hdk.dts:
	prim-mi2s-dai-link {
		link-name =3D "HDMI Playback";
		...
		codec {
			sound-dai =3D <&lt9611_codec 0>;
		};

When qcom_snd_parse_of() iterates the available child nodes of &sound,
snd_soc_of_get_dai_link_codecs() fails with -EPROBE_DEFER because
lt9611_codec is disabled and never registers a codec component, preventing
the entire sound card from registering.  Like sm8550-hdk-display-card.dtso,
prim-mi2s-dai-link can be given a label in sm8450-hdk.dts and disabled in
this overlay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126134508.3207=
00-1-vz@kernel.org?part=3D8
