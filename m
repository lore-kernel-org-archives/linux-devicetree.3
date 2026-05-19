Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7113264D4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175682; cv=none; b=Vr4OAyIWjGbrHXycdv4mJX1yR5WYrPLaWWRU6VMUZ8SNF62T6l7oFK7LlOIdmWrKYP2biAYQtiqFXURrqy0XaFpjFOsGCErRxB9gCAe4JVZANOWZp1vDbeJf3Ptt2R1FWaXH8bju9N7ztSkPujhbEpRrFt0lJt48H74UOg9dpiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175682; c=relaxed/simple;
	bh=iGs4Q6ubYQuLUeQyEpsnAuxWxIlZmP+yS2M/cMIK7wo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5bczlXaJ0xv8knHpTyzW9gG2LZBsmykMsMUxsVM5lu92xtqySIU5SdZK+rl7sLWkgSNInF9L6anN8n78B3hldWM8Req2D0FXjkOt/IACbf0wqxH1cOYIrgdgxqdVWsEKz5saKLiKNWeX6O42fVvgouFHlPgi890JxAjQIAZMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYInHngK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYInHngK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ED1C2BCB3;
	Tue, 19 May 2026 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175682;
	bh=iGs4Q6ubYQuLUeQyEpsnAuxWxIlZmP+yS2M/cMIK7wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AYInHngKhs1CmMIz0diIXcxEKEFwQIbYDsukT2VWgBaZUQMoLD0Ni0FGuqPZiolsh
	 aNDN1oCOhts+eYxBlvc2uGE8rXC41Xr1Vxoun2UgKd8m0XyoI2i3JAZK2cS80Xj9Bc
	 C8qoTm5MqQWLV5zk8Ghbia3i2QBDVwzIXVNGDEENr9HF6kUhqD3ylTrG1yZXaB+kNk
	 R81aW/0wqGZdzU2UdtoGatF1h283HuO+n3CDKDYFVrtOyltEgRQj3zClhgi70jr24j
	 68ButioPnv7e3XGzYUQan/E24NmZ8rvSYqTlmRNq8L7kP/THUGHENdQs/f+2XTtwil
	 Y3lNaPBpK6nFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: qcom: Document SA8797P Ride
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:28:01 +0000
Message-Id: <20260519072801.C2ED1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect placement of the new compatible block for `qcom,sa8797p` =
and `qcom,nord` in `arm/qcom.yaml`, breaking established logical grouping a=
nd sorting.
--

commit df8b4ac62d150d2753b5c52e4cf175018b410061
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: arm: qcom: Document SA8797P Ride board

This commit documents the SA8797P Ride board, which is based on the Qualcomm
SA8797P SoC, an automotive variant of Nord. It adds the new compatible stri=
ngs
to the arm/qcom.yaml device tree bindings file.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index af266d584fae6..ab25323c35811 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
[ ... ]
> @@ -303,6 +303,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
> =20
> +      - items:
> +          - enum:
> +              - qcom,sa8797p-ride
> +          - const: qcom,sa8797p
> +          - const: qcom,nord
> +

This isn't a bug, but should this compatible block be grouped with the
other Snapdragon Automotive series SoCs?

The bindings generally maintain a logical grouping of devices by SoC family.
Could this be placed alongside similar automotive entries like sa8155p,
sa8540p, and sa8775p instead of here between the legacy mobile and networki=
ng
devices?

>        - items:
>            - enum:
>                - 8dev,jalapeno

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519063505.8833=
79-1-shengchao.guo@oss.qualcomm.com?part=3D7
