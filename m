Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239850;
	b=sBoMjkaljHIPW/0VOwspZDfzhjC5PFhLVYFzcRGOu5N+q2U9c27IotUhkTQ4J8/VbMKm
	 yFfw7w76tYrN27XCH1k9W4LIXvZHQ89ghaFk9I4GPwUYgfCAx7/cKmLH2RjrAGPvP+YFe
	 2Vl4bk/lxzt/E/6e0ZGrOZjM4ndTRpa37pUu0iGSZtDTgfjda1ExUz9wOQlFyzDTqDxi+
	 0hD7apDGmADI4zxwZ81gjDsff2rXPLm00FZaZufYz0+Mk4ZSBs1d+JwCIv+/QyqNF0vVV
	 jfhhKoswDuFraHYWoVT1xOhRlSd/yN0bVovam6FZ8ypQ8ecSKmqwdhPKUr8GdeBY0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239850;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vyhGOSliEosQlaehHxjWzJjI4IhjzwFFTW82VFqj+wg=;
	b=i02KX9KzXv/Bv0a4Lx+PZiZr9Wj/Zvg3wnwz8pJ3h3Nnyx69Xgl/XdNTEqgVPndbeH7t
	 8C8ox7fJLHHmDgPTMUfZKYsHBfu9DmDZuKy7uwBVwKVO1EA36OKDvOD6XiNBMSRbtJG3t
	 6eLtuMj3QYcDo1MHYbGU91Ziho360oisRrx+aGKaNBwZ+7+PTtSRow+U5OBZ+ZIAPQMZv
	 k8XA6+vBqFgj9D4BW2piQu3qQzF6Q+OcgtSCAhLPxJ/Bo2vw1F39lSitlxKvsDh/TniyC
	 Vw6OGDjSFEDmtVu6fe9Ea/S257tP4tRpmOrLlTQQg/uyq5UlB607spoXWOEuwCuDBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l2/FblM3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0F606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2/FblM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DFA1F0089F;
	Mon,  9 Nov 2026 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239850;
	bh=vyhGOSliEosQlaehHxjWzJjI4IhjzwFFTW82VFqj+wg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2/FblM3nUawVAszo4cx+DcIHNkyIb6RqmS2VpGJp6xkrTQD3eF5SnuAvzGB2751U
	 DV6Qale+dL3g4mqVCtNU5xMJMVD3bkbQyMG3lOkCDv7tYh+oA0JPdnh11Z8QEh2iT4
	 K4IJ3XTg+DATxMklINs9WUXLA1ik3aL7BRuO+gRxDGGUVy6lUuBKyWP8sOJCTG6CrL
	 Qbr0TqMvMQ/tGnUGUIBbYHnS11k7+8T/P96sj9TeiNz8ItRuhmJpESWB7oxVFqdPbj
	 PpZyZMzzQjckcnsTyrLdg8KJ8Elc5NzWy2iDSqwnn6t6Dy1cOaqvUcnP0Dq4D53x1n
	 s/Aah5y16ksDQ==
Message-ID: <sashiko-outbox-205194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:57:29 +0000
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
- [Low] arm64: dts: qcom: mahua-crd: duplicate DisplayPort nodes instead
  of sharing
--

commit fbaa055483b5c2f8197fcdac2ccd42fd5ce8c9c7
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

arm64: dts: qcom: mahua-crd: Enable DisplayPort

This commit enables the mdss_dp0 and mdss_dp1 DisplayPort controllers and
defines the supported link frequencies on their output endpoints for the
Mahua CRD board.

> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts=
/qcom/mahua-crd.dts
> index 17e40f2a6259f..2605c0e70c88e 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> @@ -20,6 +20,22 @@ / {
>  	compatible =3D "qcom,mahua-crd", "qcom,mahua";
>  };
> =20
> +&mdss_dp0 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> +};
> +
> +&mdss_dp1 {
> +	status =3D "okay";
> +};
> +
> +&mdss_dp1_out {
> +	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> +};

[Severity: Low]
Could these mdss_dp0, mdss_dp0_out, mdss_dp1, and mdss_dp1_out nodes be
moved from arch/arm64/boot/dts/qcom/glymur-crd.dts into the shared
arch/arm64/boot/dts/qcom/glymur-crd.dtsi instead of duplicating them in
mahua-crd.dts?

Both glymur-crd.dts and mahua-crd.dts include glymur-crd.dtsi (and no
other board file does), where the shared mdss, mdss_dp3, and Type-C QMP
PHY nodes were placed by 711e6f11640f ("arm64: dts: qcom: glymur-crd: Move
common board nodes to shared DTSI").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-mahua-dp-v=
1-1-c1fdfb8eedb5@oss.qualcomm.com?part=3D1
