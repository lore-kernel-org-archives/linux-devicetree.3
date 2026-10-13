Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1152B1F9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915743; cv=none; b=hp5t9ZTTe+cBDhD1pgFgI2SAFjcShN/k2GT/zc5HGrrWHoo0sYMhCqxLHHe9kVRT6Mu8gWMdRWDG84UsamMHuo3rlbT8lj6Wf4T5F3DXWQHYDCthLBFk5gXNGpbjwagvAKge8Ov7kSdSlUEEmDILQ5R+JB1JpCj31BFwglX4q7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915743; c=relaxed/simple;
	bh=1JOQZUk4K7MVoN/GsVK2HqOuIoqnFt5w+Lp/npF7L5A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y705WxCUpnYY6slUZP13mawL+/1xjb4G1eSRl6I1J8xOyCVzPTfOLNy0bMZJQNCiFyJWgOTTtPEhnX0KXoT4XJy6Upn7lv4K1mdDqQwZ9DStVtBf3bxkkpzrqS5eSxEcBLpJ15BT0pH+Qk31TrtcPJzzB0V9atR3LmjVoVCZxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePEf9tXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePEf9tXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119F11F000FF;
	Tue, 13 Oct 2026 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915741;
	bh=jRPt37T8kNYY9hLojd3sBwjx7W3fm2zyUiZGF9jiwns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePEf9tXYtF608br6kLIC8I+XdK4MgyAveMu4IE/vFyp0mUEetgWwGOps99nYtB8PC
	 ac9Wk3Ug+Kk5Ch2lv4EftRBaSQ7wnfnopRa19HCDMQBvKUtnhESd8r3mQdncgIN+Ov
	 PNDcTqvZIF9JBkZh3IJtEo20uJLx89/OEb2D8DcZXXOi9uVS9bmJGl9q6bIzATdJv8
	 nBf7+cOHMTtLui17MF9J7tFHpRwFDhg90DHYmrO2DPGrgZqKJ7z6Z3xQAcTd7pwP+A
	 cOwan3EhWyS/PlkEQWeEU+2JLXZWAKK8cDEN4BgMM2n9mQ6wdar8eRs/1+jxspsDkv
	 X5rvASEuobAPw==
Message-ID: <sashiko-outbox-170322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: ti,lp872x: Deprecate
 ti,dvs-gpio and ti,update-config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013181417.492252-2-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
 <20261013181417.492252-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:22:20 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: regulator: ti,lp872x: Deprecated ti,update-config rema=
ins in example
--

commit 308202c795df4f41c7d2f8aff005747332d2dc21
Author: Svyatoslav Ryhel <clamor95@gmail.com>

regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and ti,update-conf=
ig

This commit marks ti,dvs-gpio and ti,update-config as deprecated in favor of
using dvs-gpios and the presence of ti,general-config as a trigger to updat=
e.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml b=
/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
> index 8e74dbb3ae303..8216f1e3125d4 100644
> --- a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
> +++ b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
> @@ -47,10 +47,12 @@ properties:
> =20
>    ti,update-config:
>      type: boolean
> +    deprecated: true
>      description: define it when LP872X_GENERAL_CFG register should be set

[Severity: Low]
Does this deprecated property need to be removed from the example block in =
this
binding?

Documentation/devicetree/bindings/regulator/ti,lp872x.yaml:examples
    examples:
      - |
        #include <dt-bindings/gpio/gpio.h>
   =20
        i2c {
            ...
            pmic@7a {
                compatible =3D "ti,lp8725";
                reg =3D <0x7a>;
   =20
                /* Enable BUCK1,2, no DVS, normal LDO mode, timestep is 256=
usec */
                ti,general-config =3D /bits/ 8 <0xdd>;
                ti,update-config;

Leaving deprecated properties in the example might encourage developers to
copy deprecated code into new device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013181417.4922=
52-1-clamor95@gmail.com?part=3D1
