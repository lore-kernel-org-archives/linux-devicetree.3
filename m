Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792911391;
	b=cGOo1hERdD+PIZpANtVCABVdnvHyQiPhP/uwHOabXfU2Pbtetw9s/3r7bCRDJgRFuaOt
	 7228Ncn3nv6An7jNUOJ5pTOODgahs8KBNuV7gEe3q08+saBDoW5SS1WUp3isBnWB5RPKr
	 X9P0HZXWNrNdwYuxKTp374uJWfFJIpN8D+2xBlfFkvkJHAo1sX1MIEjgNYj/g+w2FECIp
	 RQiSi5Rf1Y3fB0FsxBvToXqgSgxKXvVQ8JShaBGb09Cl05PMehgDIhu8pqGnnAuehPA5c
	 gW/nkwKi5AN17cKOPkcV5vOdIIRu1czJmKh5IaSDJNlYQ5k2juJI6IgjHA+vV1hXGVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792911391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0ezsd3nRAc1ZdSjbShWOpXeUqPu76DzysMbu8VG82ew=;
	b=nm8PEaWonEhydT3LunJiWNwMopyiQ9kxV+Y+rIQrvFbL8o29to2RYBeq/c+O7U3K4ETD
	 4hMdAYxp4aOk+ZHKZLCBvWBBR7W/uQdQwfST0YNdSOlA7tW/m944Y8sPzJrqwKU5YrVo7
	 tSVLx7DBFvgdiu+dxBFGqAk4PoX9wQWPm1GV2LWiO71++CDHLMwesiSPulpoT//g6Uiz1
	 3LoRHA8xuMwaFmLUKaszudC9hlAmMS4kbnQ//C6tWweSqZINH8pNbAq6KI5GsAYHk+rfR
	 fhDImq3Aldr0pHvPC9tPkBmQWh2nA+r8iQ4cGHucYcoW3Nxi1BDJWMW2aMxSnyGwaGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z84HQXUy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA43606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z84HQXUy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07B11F01825;
	Sun, 25 Oct 2026 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792911391;
	bh=0ezsd3nRAc1ZdSjbShWOpXeUqPu76DzysMbu8VG82ew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z84HQXUyKfjkbOnq+6kmxAtWsVbpgQUElAO8vBlc353DH+a2hYZv1McwdBq2Nr4rG
	 eRmbLkJTj7UwLRVO4g67shJ4QDzLS6ee0zRxnNyU/Z3i/fLIf0HEDlVdimoZfXHlra
	 lYxOrlF4xggclCsepWaF1HbzLiV+OmWylvCJhBdWdyONtuP36reYLGalr+hfXCPJGF
	 t/SYPTdUWaj71v1OtgqLDlzDR4q7sZI4cARflkz2wO+uMAPMDKzKmSHjiGHfEj9HKQ
	 4xk2lRaRH8JG4dInAw54ieE1c4bMUescS2cs+4Vv4I5uicjp1I8EB9WWUJAFfTDEmR
	 qeJzeU6Q8+9pg==
Message-ID: <sashiko-outbox-184104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 06:56:30 +0000
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
- [Low] dt-bindings: display: panel: ilitek,ili7807s: redundant backlight p=
roperty
--

commit dfbb23459fc3c8847cb20a8c363e813da0ef5bc0
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

dt-bindings: display: panel: ilitek,ili7807s: Allow backlight property

This commit adds the backlight property to the Ilitek ILI7807S DSI panel
devicetree binding schema.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili78=
07s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.=
yaml
> index ba8c5bbf8ffc4..46b941c18565d 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> @@ -23,6 +23,8 @@ properties:
>      maxItems: 1
>      description: DSI virtual channel
> =20
> +  backlight: true

[Severity: Low]
Is this declaration needed in
Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml?

This binding schema already references panel-common.yaml and uses
unevaluatedProperties: false:

allOf:
  - $ref: panel-common.yaml#
...
unevaluatedProperties: false

Because Documentation/devicetree/bindings/display/panel/panel-common.yaml
already defines the backlight property:

  backlight:
    $ref: /schemas/types.yaml#/definitions/phandle
    description:
      For panels whose backlight is controlled by an external backlight
      controller, this property contains a phandle that references the
      controller.

unevaluatedProperties: false automatically permits all properties defined in
panel-common.yaml without re-listing them under properties (just as
reset-gpios and port are used in this schema without being listed under
properties).

Commit 72cfe73347fac6 ("dt-bindings: display: panel: Drop redundant
properties") previously removed redundant backlight: true entries from panel
bindings that reference panel-common.yaml and use unevaluatedProperties:
false. Unless the intent was to add backlight to the required list, could
this change be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025-dlc_backli=
ght-v1-1-1d1c49c3e101@oss.qualcomm.com?part=3D1
