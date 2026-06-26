Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FCF37D124
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508425; cv=none; b=jV230/uw7XaCOaV0ghya3XLrziRgcTYQltqCd+ef5RNjBxWeQ2iMSzf6EkOL37FucOtinBdj+tj7p8I8s7NwAFRAXzuq1rkQU9QLvKrGFQLcww77fpe3Mh5sfilLgceCUULoyt/GHHQdr+5zGkZwpWwtfOwcZdBPSCu5aAQTulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508425; c=relaxed/simple;
	bh=4c8cQnJQqkF8XPX4FsusCOIujGS3If0RsYIrDipVHr8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BG4ezN/IXI5e69E92xbDn/qJEiVqvy3nABgoYWuJiGdBIsxXpnSuKM/FqgoJ4jmQreUcR0aNggi46uavFSlrJIjCMExDXDcIfVH8d44TJ684b5HFtqykaxn5TJ/xErkgwpyU2RLfCp9DEa2PE9a/KMehHb+4gKZZ1C0QPHfbCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ1EoEhN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ1EoEhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960D81F00A3D;
	Fri, 26 Jun 2026 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508424;
	bh=g9GbCtiqzx1giQMGE7ut17CFSso9a+Jr7vjSmvD4jvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQ1EoEhN5nGNAqkSV82exf9DR00iTCMbOAqdd/siLamxkazoTCEm4eAfOM5JhoFe9
	 S1O5kWwkWEGd4sq4ptb8Fjw5vmJTXpGop5TlnolgZhahdm7SQU1xBm60cooqL66/P5
	 mN09GmPcrhwsSlEIguRqoxe3RgSwXtzUKhyJ7ypne2G4FQzb41T/83e+W5Yvg0eoVg
	 NejjatdxuWK4PTxaFGoF7CwnTI6gBbY1AE+FHftey590le+EiC2wWfRFdn8PP82eMY
	 NyUO/T//kDyUmlf4FEPvHrApqFxGPisdFhqIetmgHN4tZwkOnrpTg2pf/8eDLwJZE6
	 rp3JAvPr9ClVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/29] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-1-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-1-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:13:43 +0000
Message-Id: <20260626211343.960D81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing mutual exclusion between `port` and `ports` in device tr=
ee schema
--

commit bef609fa8f96018c59387544e50ed1e5818faa7a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: phy: rockchip-usbdp: add improved ports scheme

This commit introduces a documented port scheme for the Rockchip USBDP PHY,
modeled after the Qualcomm QMP USB4-USB3-DP PHY controller binding. It adds
a top-level ports node with specific endpoints for USB, DisplayPort, and
SBU connections to properly support USB-C DP AltMode.

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yam=
l b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> @@ -114,6 +114,29 @@ properties:
>        A port node to link the PHY to a TypeC controller for the purpose =
of
>        handling orientation switching.
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

[Severity: Medium]
Should there be a mutual exclusion constraint between the newly added
ports property and the pre-existing port property?

If a device tree node defines both a top-level port and a ports node
simultaneously, it currently passes schema validation. However, standard
OF graph parsing functions like of_graph_get_next_endpoint() will silently
ignore the top-level port if a ports node is present, creating a shadowing
conflict.

Could this be prevented by adding a oneOf mutual exclusion constraint?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D1
