Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58F21E098
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780182308; cv=none; b=fiwU+aP+FOOKDliGt6dkkTR4nV4bmrtcSOLAZsdOTZ3pqU3/hvxE7A3r3H6xB2Ih4ortMn5uWG3iR4R7cnRwX7Hps1EGcqZXgWjWEUcL+Dyfij9czGNkc4KPFveMBuW5ApVKZNSY76l7IGaYPJ287zvwstm1UpLIVqhjt298+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780182308; c=relaxed/simple;
	bh=XESmUQQafB26squpMGSlOrUA1+kc3WPQspPTOI4E0H8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NQHw2N9rlZHcGMu7rCHjK5Xez986vyep/hsLWF1Xj5dt6XAEHJIQ45AD+mc921L50jmqVHslWDwo9bIsmDDaFCuIxi7wJ+QIWC47qiJ3Df374GbR0C3CW48SJGd4hZSny5nJWDgByncKYtxH9ZujT5An3aihgw3oP2r7kpOxvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMEhud0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMEhud0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD331F00893;
	Sat, 30 May 2026 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780182307;
	bh=em+606+CmlzezCUIr1qma5OEYqDAeYiuX4VyBX47woY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cMEhud0GP3euL3674fSfflAnYQRX4q+hdLa5iZF09keUsgmN01JQ5Tx/vMORFWQU1
	 IHBMDgmHMsUSyTeH0qqoI+vEfM3H6e6d39QBELKibo3GTuVeSdEwKc/08EkwTaaBEW
	 f40jM6cWgAkVAf29cvCU3OF54vCv42PiYtY7h4rxIwbHvOChM0zrP5ukSQ5VZ1UI8F
	 Ci7v6Bx+RVNs3ytfArGgRcZqjpGDeqUjDxMDFeLrPlKXttONdAd1LZYprZSE8BTiON
	 SYy4IIC9z0DXVC6RTCTmytNz99W4AT14O+XcbNQBmzZVaYNg2W6LwrnAIAYTbJdXKm
	 XLesQNmYgddQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst via B4 Relay" <devnull+markus.probst.posteo.de@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, ojeda@kernel.org
In-Reply-To: <20260531-synology_microp_initial-v14-1-1377d425b24b@posteo.de>
References: <20260531-synology_microp_initial-v14-1-1377d425b24b@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 23:05:06 +0000
Message-Id: <20260530230506.CBD331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `synology,ds1221rpp-microp` is a typograph=
ical error for `synology,rs1221rpp-microp`.
--

commit 75e2ac8371810f3cce7ca7c6e847f04807d5bf10
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: embedded-controller: Add synology microp devices

This commit introduces device tree bindings for the Synology Microp
microcontrollers found on Synology NAS devices. These controllers manage
LEDs, fan speeds, power behavior, and other hardware features across various
NAS models.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/synolo=
gy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/synology,ds918p-microp.yaml
> new file mode 100644
> index 0000000000000..eb1c9d3fac074
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - synology,ds1221rpp-microp

[Severity: Medium]
This isn't a bug, but is this compatible string a typo for
synology,rs1221rpp-microp?

Synology uses "RS" (RackStation) for models with the "RP+" designation
(Redundant Power Plus). There is no DiskStation ("DS") model named DS1221RP=
+.
This string is also grouped with other RackStation models and correctly fal=
ls
back to synology,rs1221p-microp.

> +              - synology,rs822p-microp
> +              - synology,rs422p-microp
> +          - const: synology,rs1221p-microp

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-synology_m=
icrop_initial-v14-0-1377d425b24b@posteo.de?part=3D1
