Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668A3E022B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496263; cv=none; b=YqeOygIba8Qqloik59gOYjNYUqBHfdOMzXAXWpSZ0ZwToE42VY2inHaQx2GLVU3NWM4n9TiK04oo17whb9CisFk0cFzqgeCvR0bk1qrTxd8tPILzuf8hYjerEVdFek6OYZ9IjUdMT8/Cq0eebFjpJbRO901HFlJtKhPGon48RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496263; c=relaxed/simple;
	bh=9gHCQV0T5VCcBQUb3C8BtfqNrbZuEtNtrAiBRv4Iov4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rC/R4wtiSp9VcEB+n5mvhfF89VQkQXqII5DVDvtuEYs18S7HCSfp0j7OyKzuL4YM20MMrMbsbQyuInSVfMOd2s9N3BZBBxIZxRloHzuVKlJIZQiS7HkdxT67acs5lrG5j25IaGmen4Xs8iTAkfVexVhEAwDRCIuB3MEhMfZ7fks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brO7LuMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brO7LuMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F029C1F000E9;
	Wed,  8 Jul 2026 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496243;
	bh=bjcIGL5rubnbWxGIVL9f7wVleS/B3gXTu/rLVKJC/CA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=brO7LuMMXc/1hlw41DW8qVfVoCJHIqESA/mlM/mDUGjKb87gAIFBQqfFEi9h18Myg
	 Fsou2GD1ZyfXUNK1zIVIcUt40Fn+oZ95ycBMW3nrxObA4RMoq8ibtnp6oJS42FbzHk
	 p8hYsBsTc6VfaHjdTpw3EO/2/hOONBXHc46kX/84QO6IhyZJbqFolnezLoafvUujQ/
	 y04KzSccYQI3ZRhlCRbx6NFta6OzAAaCE6Pt/mYA7XfCYqVpllMleRQTzZATUG2igH
	 nbnChY8mdVwdHm8LuP8C905OywdAFTdZclflU4uxJIfVn3ICFxytYFPfL2wmLDH0p4
	 wBd166cZq8Vjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
 <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:37:22 +0000
Message-Id: <20260708073722.F029C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The regex pattern for `mio_clk` in `clock-names` contains a logi=
c error that fails to correctly constrain the index to 00-77.
- [Low] The example in `xlnx,versal-clk.yaml` fails schema validation becau=
se it wraps a `versal-clk` clock controller in a `zynqmp-firmware` node.
--

--- Patch [3]: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to i=
ts own schema ---
commit 718990212b2e54a25ccb16a23d741b1b1a896e2d
Author: Michal Simek <michal.simek@amd.com>

dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema

The ZynqMP clock controller binding shares only #clock-cells with the
Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
Also remove "(Optional clock)" from clock description because it is visible
from schema itself.

> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index b1623c2ab0f69..12d060c39bfc4 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
[ ... ]
>  examples:
>    - |
>      firmware {
>        zynqmp_firmware: zynqmp-firmware {
>          compatible =3D "xlnx,zynqmp-firmware";
>          method =3D "smc";
>          versal_clk: clock-controller {
>            #clock-cells =3D <1>;
>            compatible =3D "xlnx,versal-clk";

[Severity: Low]
Will this example now fail make dt_binding_check validation?

Because xlnx,zynqmp-firmware.yaml is modified in this patch to add an allOf
rule requiring the clock-controller child of zynqmp-firmware to use
compatible =3D "xlnx,zynqmp-clk", this xlnx,versal-clk node inside a
zynqmp-firmware example seems like it will trigger a schema validation erro=
r.

>            clocks =3D <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>;
>            clock-names =3D "pss_ref_clk", "video_clk", "pss_alt_ref_clk";
>          };
>        };
>      };
[ ... ]
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> new file mode 100644
> index 0000000000000..c64550471581c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
[ ... ]
> +  clock-names:
> +    minItems: 5
> +    items:
> +      - const: pss_ref_clk
> +      - const: video_clk
> +      - const: pss_alt_ref_clk
> +      - const: aux_ref_clk
> +      - const: gt_crx_ref_clk
> +      - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"

[Severity: Medium]
Does this pattern correctly constrain the clock index to 00-77?

By combining the + quantifier with .*, this regex allows strings like
"mio_clk100" to validate, since the "10" matches the capturing group and the
remaining "0" matches ".*". Could this be corrected to avoid permitting out=
 of
bounds values?

> +      - pattern: "gem[0-3]+_emio_clk.*$"
> +      - pattern: "swdt[0-1]+_ext_clk.*$"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783495122.gi=
t.michal.simek@amd.com?part=3D3
