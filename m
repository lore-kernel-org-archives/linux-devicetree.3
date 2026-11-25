Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639081;
	b=VrqkxDBQ5td/fPu1wJQ1GBQLSfNyyWl8pa70iwG1uwCNTJisv5DaImRGSEAYfiPT093P
	 P85RATje4ZfuiBvYN97B3IiiPBUmbxitUj0NNozfjricop7mpnq2vuzYakhVk9ZCPJ877
	 qAgcoxZlygw/v21AtdUUt3KHgC7dLbtlvcq3WzAVbg+oKuas/DaEmbwp9kvWESgY8Bals
	 nKBdJEW4BeD1PpaOCA8ZFBRQUXqmU+Op2OPa7XSk/2IhadSjxXMV3WEPITNyef33geR/k
	 pzVXX1CFCIRe+uZwDq5vYcXOiHbJqgdI0Cin+7MRF2uFL90En1o6Gm3s8ECqFh3PtjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639081;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=FFJHi0dR0AO+OEGY4MeKs6pRNpL3MVWLGWF8iylf3Yc=;
	b=mP5LB4C9ipc8pSo5mFfA1o6Z2mMTFtn5TgkAzrBJ5cMjB0CcEbr8OOdRvQKNwJRnxIqS
	 83MVh8I7NpiZwd5bM7YbufxxJxl7apXtg40NPzqYDYanCV70tC+TI+vwcK2zuzXtWj1lN
	 22nC7V1E/J4lwhXG50CdAwtaqQx6gN7qfHPkM4QhxO65Z3BpjLiVppzGDkShJ0qDIQIe6
	 O0b25hFoKz2ra+8tkvRubEUSWAKuM1CmIROpm7410P3i0kbI0StH9GBMrCRhhuL8gd+Os
	 VKeCBu3w+C8dne/UWc41RpMJ8dzMosVdhvPRJpOw0mWNBu5WRgpj12g75jscsULkRpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LYGMw0Qv;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C3D606A31E;
	Wed, 25 Nov 2026 20:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LYGMw0Qv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FFJHi0dR0AO+OEGY4MeKs6pRNpL3MVWLGWF8iylf3Yc=; b=LYGMw0QvymQY6YdmN62UkknNG+
	Z+Lx1xbk1xdhB9GBln5d+V3iP61i9cFgCMFolwNC+rZeDR7YPZgkxRsuJNrBA4TzXeQOGM1laPY75
	lTW1mhlH1CPhVOQI8S/8dQNBUusr/ThV/HAqxP6Fq9atMkvCeghkY5r+B/tmh+QueDocp1SJMTWXx
	LKB58IPgucu2wfPcQxDtzU3D83KuWKaqu83RZRkAlGLzvzMZvObkvGOQne6zSrXzcOAdrLeBh8foZ
	Am09wnn7SVUWi4R0ot8fFx+ZB8r3QhxGNDrge7sy6S7sc5SO65Qx27kk0y33glvAWrsxdiwgNJlIv
	hnVdJwDw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Midgy Balon <midgy971@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Freimut Diener <f.diener@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Freimut Diener <f.diener@pengutronix.de>
Subject:
 Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow post-init-providers for
 domains
Date: Wed, 25 Nov 2026 21:37:49 +0100
Message-ID: <oJj2NKd1Svmsn320H8YWrg@sntech.de>
In-Reply-To: <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
References:
 <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 25. November 2026, 11:33:57 Mitteleurop=C3=A4ische Normalzeit =
schrieb Freimut Diener:
> A Rockchip power domain can have a supply that is required when
> powering on the domain but is not required to initialize the power
> controller.
>=20
> Allow post-init-providers on power-domain child nodes to describe
> such dependencies.
>=20
> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

Interesting that this exists since 2024 and this will be the first
user it seems.

I've looked at the dtschema for it, and this looks really great for this.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  Documentation/devicetree/bindings/power/rockchip,power-controller.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-control=
ler.yaml
> index b41db576f95de..d2b512dd95f63 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> @@ -147,6 +147,9 @@ $defs:
>            A number of phandles to qos blocks which need to be saved and =
restored
>            while power domain switches state.
> =20
> +      post-init-providers:
> +        $ref: /schemas/post-init-providers.yaml#/properties/post-init-pr=
oviders
> +
>        "#power-domain-cells":
>          enum: [0, 1]
>          description:
>=20
>=20




