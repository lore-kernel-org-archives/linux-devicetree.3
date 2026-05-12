Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592B3655CE
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619573; cv=none; b=ET2lrvJnSeBRZqy/D9HaWOrnbBgHQBJ64uZtftm3qTNg+xeo+n/FoOwnTAYRupW+jnwbOwHQeZEluroFOp/4KgUtAsGTlWyOEbwVoCuqKdZW2mL8ot51umpzrexRR1L0iUU2iTubhvPaR94o6XjTBXdoM3jO+Hyj5GnYmAFRO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619573; c=relaxed/simple;
	bh=EApFr1YAW1gOXINN332n4VXpwKCf8B4ghTMKJotQB3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sss5RRugJfzaTllqtyPDS4UeDQyNejAkZTs5hu/ohgbxnWjtP3kTMrUcDWivDzAxGaGkbt6LTDTcXUfCOod6xxWDQPhC84sdX8tOBGw9MRvS7/wFQJgJcUS9d2UuAdZszEykdeVW+ITGOiu6XQSKnXCF7bi7zHNaVy4P6bYwLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlmiHu/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlmiHu/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B7EC2BCB0;
	Tue, 12 May 2026 20:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778619573;
	bh=EApFr1YAW1gOXINN332n4VXpwKCf8B4ghTMKJotQB3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FlmiHu/eZFqeJ3WuQi0JvyTadkJUCZmOFoDx2vM/zd9DFdpJ7oSTxPJ2RfRCAVz5Z
	 dwyKapCWRxQsOkOa/NedVjOwhJM6oIByYPcynUcAuxhPLR0yWxM9K8Qg0Oep4ArTH0
	 Bw65Ncz7+bDBTb7WJ7u3rd5FqljdpT9c1Eztd1u5qLb2Yx6R63zDgwfDQiIi3X5wT5
	 bLUUuqOdT3xfBlEFB4B+4eEFE58WVgRVMzJ0Qd0UsVIpFiArrNLOA8t+avCATkV+1P
	 iXFDzb9klPXsQ69WWw7SQmf91Lw+rnQ2v6rA0NmInPwNrlyH8ggkeQ7kDH10WzbSQ4
	 G5/AHhG3zEpfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add i2c-shared-gpio
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511162528.84508-2-markus.stockhausen@gmx.de>
References: <20260511162528.84508-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 20:59:32 +0000
Message-Id: <20260512205932.E5B7EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `minimum` and `maximum` constraints on the child node's `reg=
` property are structurally invalid and will be silently ignored during sch=
ema validation.
- [Medium] The compatible string in the commit message does not match the a=
ctual code implementation.
--

commit 5af80521617a83464e505c8a8c5b9d9829717a38
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: i2c: Add i2c-shared-gpio

This commit documents the driver for bitbanged GPIO I2C buses with shared
SCL lines.

> dt-bindings: i2c: Add i2c-shared-gpio

This isn't a bug, but the commit subject and description refer to the
binding as i2c-shared-gpio, whereas the actual compatible string and file
name introduced in the patch use i2c-gpio-shared.

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio-shared.yaml b=
/Documentation/devicetree/bindings/i2c/i2c-gpio-shared.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio-shared.yaml
[ ... ]
> +    properties:
> +      reg:
> +        items:
> +          - minimum: 0
> +            maximum: 31

Will these minimum and maximum constraints be silently ignored during schema
validation?

Because dt-schema decodes standard properties like reg internally as a matr=
ix
(an array of arrays), applying JSON Schema numeric constraints inside an it=
ems
list evaluates them against an array instance instead of a numeric integer.
Since JSON Schema ignores numeric constraints on non-numeric types,
out-of-bounds reg values might silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511162528.8450=
8-1-markus.stockhausen@gmx.de?part=3D1
