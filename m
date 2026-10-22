Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669792;
	b=kezbXJgLhNKX8l48q/KF227lr3hz6BwSHEkSVDZyZkFJJLuHIrwJEIvmMIrOJc4Slg2b
	 CeB/hDvBQLJd5MKoHXerhUMLGbsKslqAv7xa4zT8P6tezpWh0xMMhXIquDS3JIaZ2lumR
	 AH9hpDFddxs0EJkNHX1leIl65IP76A8fwCiPfAZajv6N10c6tDmla6caTVlel1qJ4Z0OY
	 /0m6jxSbJvaOCncH0CnGuvzm1qka0/s3VHS2xSIxFZlHzIHSM9PDkj3Pfq6pfedlr9yJo
	 ngMrDgOOMFdpCqpaOKvpJkV2NI6eymlTroZB4szJen0dBxWOsktnac3appk6wx6bZhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RNdCwcPug+RRGio5XnkfS1G/tH267wrWqaZ7IfGGqVU=;
	b=VStZHAHOrLXfvGziOPnfdtakZ6/b78brsIj5i1lFJjLPBYmkc5jRMvWEZfIH0yWNRTxY
	 /JZeTpi6HSlrrdI5chjytk2mD+Hz+zUQBvm7WHgH2pzvO1kCbpr/f/OV1v2T/rGmakA3N
	 KuYO3llMWeERz/PDhvBtY7aBzufbN5Znnpov0c8ESgcQ6xdiUaKc11kaiUkPprj3Qu+R9
	 HwyDcVCR3ulBLqsXUPEHq51phW0oJrxToz/Em1fYqVNEnTpfHPTrTVo8H5nJXUgxbeEsh
	 H1OHB2/Gg9eLg6EHulipuEkfHvKwyxtQF58KNWjn0HZeDmAsIk/IyVuPzXIZ5+ELh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F9h2p/uv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6E606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9h2p/uv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74E21F000C1;
	Thu, 22 Oct 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669792;
	bh=RNdCwcPug+RRGio5XnkfS1G/tH267wrWqaZ7IfGGqVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9h2p/uvXiepAhDF+Df0BSc4zAg6tGTa6PdZtoeyruR5IdsbIyc/Dx3S6VjmXXY/M
	 1K8R+ht7nakO2ApSgotnAM4uWbCwII9VnN10FTZbRZe9tgd2a9FBTWs2pEdeZFC/Oz
	 isAm/zNcZOmge9T0ojL2/O9gvl3pW9paWVG+vvXNnYXoWcDL//sQ6+nMfX1WtZVJdj
	 c9LUq9Ft/KijJeMCSpL4dZ9Ec6VEFCa9yqyWSysCMMI72cnyNoQRZljFbGgqmUgheS
	 ufMUBa1q6gNhMI6x9B/52RIWlmj6ZOnWS7FAc4dkCtrH0h/vLrLHgYbXiLEd6DYr5k
	 gOZFrwV8ANf+g==
Message-ID: <sashiko-outbox-181397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2
 port
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:49:51 +0000
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
- [Low] arm64: dts: qcom: sm8250-hdk: sd-ufs-cd-pins violates TLMM DT bindi=
ng schema
--

commit 0b99efa9e9916abab14b14dc1f0beae18f4f1e7f
Author: redstonee <1516235445@qq.com>

arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port

This patch adds the default pin configuration state for sdc2 in sm8250.dtsi
and enables the sdhc_2 controller along with its card-detect pin
configuration on the sm8250-hdk board.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index c1c673086df51..5975878ea0fd2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -398,6 +398,12 @@ &qupv3_id_1 {
> =20
>  &tlmm {
>  	gpio-reserved-ranges =3D <28 4>, <40 4>;
> +
> +	sd_ufs_cd_pins: sd-ufs-cd-pins {
> +		pins =3D "gpio77";
> +		function =3D "gpio";
> +		bias-pull-up;
> +	};
>  };

[Severity: Low]
Does naming this direct child node of &tlmm sd-ufs-cd-pins cause a dtbs_che=
ck
schema validation regression?

In Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml,
direct child pin configuration nodes under the tlmm controller must match
the "-state$" pattern (with "-pins$" only allowed for subnodes nested inside
a "-state" node):

  patternProperties:
    "-state$":
      oneOf:
        - $ref: "#/$defs/qcom-sm8250-tlmm-state"
        - patternProperties:
            "-pins$":
              $ref: "#/$defs/qcom-sm8250-tlmm-state"
          additionalProperties: false

Should this node be named with a -state suffix (for example,
sd-ufs-cd-state) to match the binding schema?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022113601.2320=
940-1-dc_redstone@outlook.com?part=3D1
