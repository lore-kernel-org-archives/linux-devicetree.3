Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73A936F8F1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152442; cv=none; b=NlI1Ow7YLR2b+Et2i2m6ks9RtkdUtp9JX8dFjQ/iQUEjurOHi9frM3ozPgImP09drAMKRJzmjKTc77qWQjf81NHrIBYIdTwg5orYPmxwEobt9hhb0y5ESNa6mbUfB1Ot30IQD8+EJrmjYsPanUkBwpOvfHQT794av2yT4WiRSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152442; c=relaxed/simple;
	bh=kOOwfego1m6iw+lI/qdnqzBar7T0aqeKgyxF7CizpXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sRXkSsAWTTA2y2aewf6tMyWbCHDe3rptKB5BQqTYyY3Xt90Tb3eHEFViPxK283hyl3q4nRfV53Qfs2uuqZw6lARlSEOxyJSkEpFwXiWR1OsFx+VrU0dK/EfdPMfC2NbXJKxa2AkijCuI7ug+44MCXlBq0yyvJCnzQmVnPbEmct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjj2tlpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjj2tlpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303811F000E9;
	Mon, 27 Jul 2026 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785152441;
	bh=zK/D/TYGway1fjEy4iU3jbMO05toVybUBqwajAX7OiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjj2tlpmB7dSrJvJ+JRJENM9i1g/5caKUpHPt6Zfi0QhrnhP7UhOzjiI87JNl02SD
	 qZEBdYvPK6z8GfhZ0ZNxgNUQu+iDVSfdtn7MgU4JELQLatXLbClHXz7u1q+3iKXDrR
	 IeIZcaHS8CrBP1iOPuWg2Jt66vhJj1QCtz2fuHvV0AePdlHyXMiG9aHriRxd1CFIRa
	 2HjXrRxKiMhlatgRFeXubkFse5mFB/CxtE6czGiIx5CvP8AxPDP4xSUc9mHOqdFFGi
	 CXbgvqQtq0+zVNfOTVIW1EOCHm6cqG92tYZ+2lBnSKWs+/Uq3BuxlYxp5J2BtdUJod
	 GWo1/mRpGeIAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: rcar-i2c: Document R-Car X5H
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260727113441.11193-5-wsa+renesas@sang-engineering.com>
References: <20260727113441.11193-4-wsa+renesas@sang-engineering.com>
 <20260727113441.11193-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 11:40:40 +0000
Message-Id: <20260727114041.303811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `renesas,rcar-gen5-i2c` compatible string is missing fro=
m the `allOf` conditional block that requires the `resets` property, result=
ing in a Device Tree schema validation bypass.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: i2c: rcar-i2c: Document R-Car X5H s=
upport ---
commit e3abab1fc2392666638c3324ed628bfe91397742
Author: Minh Le <minh.le.aj@renesas.com>

dt-bindings: i2c: rcar-i2c: Document R-Car X5H support

This commit adds documentation for the rcar-i2c on R8A78000 (X5H) SoCs.
It introduces the new Gen5 compatible strings.

> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml =
b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> index 6cc60c3f61cd6..46b4bd16c5937 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -56,6 +56,11 @@ properties:
>                - renesas,i2c-r8a779h0     # R-Car V4M
>            - const: renesas,rcar-gen4-i2c # R-Car Gen4
> =20
> +      - items:
> +          - enum:
> +              - renesas,i2c-r8a78000     # R-Car X5H
> +          - const: renesas,rcar-gen5-i2c # R-Car Gen5

[Severity: Medium]
Will this schema fully validate the new hardware configurations?=20

The new renesas,rcar-gen5-i2c string is defined here, but the allOf
conditional block for the resets property lower in the file only matches
Gen2, Gen3, and Gen4:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - renesas,rcar-gen2-i2c
              - renesas,rcar-gen3-i2c
              - renesas,rcar-gen4-i2c
    then:
      required:
        - resets

Should renesas,rcar-gen5-i2c be added to this enum list so that missing res=
et
configurations are still caught by dt_binding_check?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727113441.1119=
3-4-wsa+renesas@sang-engineering.com?part=3D1
