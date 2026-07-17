Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20B3B811F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289649; cv=none; b=G/A9xxisPxlmii9uZ7+3j1UqDRCk2JbNqiKs2oEUAMljVnvJBBp9MQ3tYzx22TcpvogyBr9hNeB1X7+nzO6cE/oi6ViS4JWhwYgy2N+RmVd1S8q6ILO9qiwdsxv1mqU02w63mJMod93TBYjSz92FhtzvNZNNuas/nFd68TVBhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289649; c=relaxed/simple;
	bh=PHCYDPDC/pe/5OF/xePqvbVK3vbnVwyHaZzvQb8TJ0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ux6laxScBkgFXo/r7FXdNR+hQ+aStoI4bqvgVjnGWHC7AvYs0EXearUhmWJW4NtFzi7wl9PFBcL0FDcVY0jzKPJSwR/yCIKlZ0bemdaj0GH4xHrdwMlLAzML0PvwFEeVDaeRc5kp4voJFU7BMljqzfKZU0XVb12d4uQa6RH4k5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA+muxMG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA+muxMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823961F000E9;
	Fri, 17 Jul 2026 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784289647;
	bh=6OjQfTP33hkSylU6VMkvni+3HFCnjPx+AlTJM2kSMOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dA+muxMGtODJNMR7FnKgzkgYkxrbTL0uPbVaJ70PYtRjSsH8vltU6v0PLRz2oZ4uv
	 FglsNXti5FotO0mLH/g7kt79PbuhCmV8wlN8/TYSbxhudROasnGTb5b7HI3YjC0Otq
	 IPIpqSr6bu8UVmTq/aQv25re7BlgSZzGik5eAxDkr6229qwHGtbVt9ZNk6sCBUPOxb
	 BHXReC2dmv77L+rxlV19MRipPXjpLwJ44gEwL9o/JOBQ9omZq3exctgUYu6ZR22Nom
	 KSMNEwTTQRtBiOy1mThxQPgjU292xJa5k1LAkFbo3gQOv9Uo8vdbAOa41BWtUeFOQQ
	 RsAo4270gBh5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: display: sn65dsi83: Add output
 data-lanes property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717115002.308035-3-wojciech.dubowik@mt.com>
References: <20260717115002.308035-1-wojciech.dubowik@mt.com>
 <20260717115002.308035-3-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:00:46 +0000
Message-Id: <20260717120047.823961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redefining `endpoint` with `unevaluatedProperties: false` locall=
y masks properties evaluated by the sibling `$ref: '#/$defs/lvds-port'`, ca=
using valid TI-specific LVDS properties to be improperly rejected.
--

--- Patch [2]: [PATCH v5 2/3] dt-bindings: display: sn65dsi83: Add output d=
ata-lanes property ---
commit c64bd236e14a70bf7062c9fee49e33ef3475908b
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

dt-bindings: display: sn65dsi83: Add output data-lanes property

Add an optional output LVDS data lanes property with two allowed values
for standard and reversed layouts. The reversed layout informs the driver
that the reverse LVDS config option must be set for the respective output
channel.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8ebb..4000bf0b13709 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -86,10 +86,54 @@ properties:
>          description: Video port for LVDS Channel-A output (panel or brid=
ge).
>          $ref: '#/$defs/lvds-port'
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

[Severity: Medium]
Will this unevaluatedProperties constraint cause valid properties inherited
from the sibling '$ref: '#/$defs/lvds-port'' reference to be improperly
rejected?

Since unevaluatedProperties is scoped only to this inline schema, it cannot
see annotations from the lvds-port definition. If a device tree file defines
port@2 with both data-lanes and properties like ti,lvds-termination-ohms,
could this result in a validation failure when running make dtbs_check?

[ ... ]

>        port@3:
>          description: Video port for LVDS Channel-B output (panel or brid=
ge).
>          $ref: '#/$defs/lvds-port'
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

[Severity: Medium]
Similar to port@2 above, could this locally scoped unevaluatedProperties: f=
alse
block reject valid properties inherited from the lvds-port definition on
port@3?

> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717115002.3080=
35-1-wojciech.dubowik@mt.com?part=3D2
