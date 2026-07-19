Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFE1377544;
	Sun, 19 Jul 2026 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784443016; cv=none; b=LDIY/pt8tzlhnkYesXUjE5t07NwD15xqtIiqVBriR9KXQfydsg8qkmOkwsQ9HogRFAmhpeddhqPzidQN6jgg/QHz6vHJuYuMND9lfs5j0bGibfp4lmkpSUj2/vNPbk6wCL92fpHbQ9OWyj8butWijXNX3qD3OeHApSlC9KRkz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784443016; c=relaxed/simple;
	bh=tldwZ4EXRHah6EyQ6swYsR//bbm1uj49wsgBDQgwpPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6vSY6vIH7y9gHJ1D4fuEZZ7dfGNX/b1z0nqBovHeTA624n9cntDZYu+rWHMeiycf52Q2k2Pv6owgrjtE13Z2BJXulsRlPsNw9kbgTnpBlQMm9l1pWKYyHOPmE7reI2O3cOnzeHEqgSJ+C5cKsp5Kkgn9NB5W73y9MV7yT+s08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqhCDR36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqhCDR36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D657C1F000E9;
	Sun, 19 Jul 2026 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784443014;
	bh=+PjcEzkWWzz3QTNuwTMEVCktYabiHfk1iyhikVnYDPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqhCDR36DJ+lRfFFv15fPgL6OcbahMRqsrkzZTq9QpNDuXamK1Pswa41udbRNJrgq
	 t1FbHZnQukGPwEFFesnPsiKCKiEny/92DvepEYH/IMiKeBmsJ13huR70TXDKvXRibi
	 IUpAC3f+irjQVXT4r7SWII6j5SyAwWBJb8dWeLd+fn4K2IPBrvFYloinlsyJ1KLY1m
	 YSi+FMvDKqKzuCPmObcdpdhy94RM445vPDVoDkCnvgXQN2XGHIeIyVGwxFhx48e7kM
	 vVDdKub3A8Njs0UKCKot2DI020pooJcquGmgOH7OQrSL8Em5Hf1xfkEhc86q5mCs1x
	 FWYAEm0BXkbzg==
Date: Sun, 19 Jul 2026 08:36:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mohit.dsor@oss.qualcomm.com
Cc: Sunyun Yang <syyang@lontium.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <20260719-sparkling-musical-lionfish-bb9d80@quoll>
References: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
 <20260716-lt9611c-v7-v7-1-7553a14735fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260716-lt9611c-v7-v7-1-7553a14735fc@oss.qualcomm.com>

On Thu, Jul 16, 2026 at 05:01:09PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
>=20
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4

So you need "if:then:" block disallowing port@1.

> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
>=20
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml        | 8 ++=
++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.=
yaml
> index 429a06057ae8..e0821a63d9d7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
> =20
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> =20
>  description: |
> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> +  The LT9611=E3=80=81LT9611UXC=E3=80=81LT9611C=E3=80=81LT9611EX and LT96=
11UXD

These are some odd characters here. I guess this was in earlier versions
as well...

Best regards,
Krzysztof

