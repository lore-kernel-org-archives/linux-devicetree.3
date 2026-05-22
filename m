Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C33B442B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447712; cv=none; b=PUr4YRtGr6gMKskzk+U6AR0gFTYSfaxi3mIh2aL5U6Cvb6UFNDDBvkGr0Fv+wBmpaqKcD1uBPwURNaX+m684l2BTYOHmX8LJTBLVJ/N4c1cNelccw1nW44eHrrUZyjKpzMYHHsgypg5veSlV0LRVjMFcbxEzNH6Di3jOUfnG4/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447712; c=relaxed/simple;
	bh=qokQuVFJseaa1OOzKMbOi3804xirSpuGNyIChjvs2iU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XgE2MElGxhgcejS8mJe16YjUxg+C6sK+LVvbw5P54TXHP8G3ZVChzZ+BDMDfQ86Cpv6gEaXWMjYVWP5hX2Lcvpv6tfyl2RqGg2YMwu6Xc2JQLDoXRZoKXVXZwYE48MkoH1h2KogxGf+9E1d+KWJBR5o+mO97BbYUCSuft05zUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QskE4/1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QskE4/1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542371F000E9;
	Fri, 22 May 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447711;
	bh=IxvUJmr6Y3b/8r1nB7w+kCrAjNArqKZ7DHvSrSujum0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QskE4/1YbIUlrlPev6Ba1nxvDYKQVkgWNv5aIPkEFr8pnDJLdqcIx1MXez/4qkCTx
	 c0peg105ejw7HA0XmkYRfqPmYqd9O4DziAYOHN132NoXTeH/RIM49Vg87tMYtRtrDj
	 TdYtDU9D9JQvO5Qjw1ICZP/Fs4IplM/qU84cEvkB9gPkooXNXvhSphkzFqGqinj+yU
	 q4l5iDJ5TZdc62MZmCBsPyFpfQsCCUWRAvI1DubbuAQD78FnZ6g46jn1bm4GPk4Z88
	 flcwA84UPstvsksApSe4fA5fgasTEQ1Sd6oBedFGwysz2g/NIMhiH4YGsuJlOvwe1V
	 +HCtF0xFv4hjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the
 eDP display
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgZGUgQnJldGFnbmUgdmlhIEI0IFJlbGF5?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-2-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-2-dd9d477407f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 11:01:50 +0000
Message-Id: <20260522110151.542371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The 'data-lanes' property is incorrectly placed directly within the=
 main '&mdss0_dp3' node.
- [Low] The commit silently removes the `&dispcc1` node block without menti=
oning it in the commit message.
--

commit 5312e63401d73e35f694eed3e8a7dcb4db6c95e5
Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>

arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
   =20
This commit adds the necessary regulator, pinctrl, and display controller=20
nodes to enable the eDP LCD display on the Surface Pro 9 5G.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f24f60dc73afe..476e17415da27 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
[ ... ]
> @@ -448,10 +463,6 @@ &dispcc0 {
>  	status =3D "okay";
>  };
> =20
> -&dispcc1 {
> -	status =3D "okay";
> -};
> -

[Severity: Low]
This isn't a bug, but is it intentional to silently remove the &dispcc1
node here?

The commit message focuses on enabling the eDP display and does not mention
removing this block.

>  &gpi_dma0 {
>  	status =3D "okay";
[ ... ]
> @@ -494,6 +505,42 @@ &mdss0_dp1_out {
>  	remote-endpoint =3D <&usb_1_qmpphy_dp_in>;
>  };
> =20
> +&mdss0_dp3 {
> +	compatible =3D "qcom,sc8280xp-edp";
> +	/delete-property/ #sound-dai-cells;
> +
> +	data-lanes =3D <0 1 2 3>;

[Severity: Low]
Should the data-lanes property be placed inside the controller's output
endpoint node (&mdss0_dp3_out) rather than here in the main &mdss0_dp3 node?

Placing data-lanes in the root controller node is deprecated in the
qcom,dp-controller Devicetree binding and will trigger dtbs_check
validation warnings.

> +
> +	status =3D "okay";
> +
> +	aux-bus {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-surface-sp=
9-5g-for-next-v2-0-dd9d477407f5@gmail.com?part=3D2
