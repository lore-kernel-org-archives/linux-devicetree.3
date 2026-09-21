Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6F48EC66
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033779; cv=none; b=eBcAc6TsA47h2X61as+tTUxkecGzFQkyzKP18Qd7rWHTy/WP7tTrAf2XCD8vox1HDLH5w+Zuq05xPbmHrJHLwiQE4VhN7gq7LPaLJxN3/Rppp3VTryYGk1i/yttQC4602bzF5A4LAI2T8Yomuh0Batyxcv3AHfcSt69jEYuYATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033779; c=relaxed/simple;
	bh=10/vAPo64ndpTAxsEk1XqQnJDp6S3HHXvltZl5aU0jc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hCuZK1yIZuhaTJSrZE9FXhq2batam5X0VTjUgEpjKMV8TQoZ/G2I1IcVBkFyhht4OxkCK9vsSq8mjiYE5fVDsDh4GQpgK8+WHpf615laWFmUjrHiXQsdkxZHughmOprijlsfykx/CLGA4vBOtv7WsYRxenlCoHOXohSECFc8nFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnZdveGq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnZdveGq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DDC1F000FF;
	Mon, 21 Sep 2026 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033770;
	bh=M9Nqa5cKFa8ULmKzjVCgZ4iIf7nIZgHx5rBflgE8Pg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnZdveGqyd11AYYHQp8zaCnvFNUPkHXov1O04pUCxRUvNNs4Mrbe9IlQN2a3qBjNc
	 pQbeaTN/Ct6Ylj0eN08U23DLoYamuUxhkdQX4wpgZHdcoLTXEUauHV9UT4V8Uc1BQK
	 36O1g6dgabepxofLWCjEMmPYwptoyj7g3bFcdvae3qwrYHCSLzccW/xpPPuIaQ3auR
	 lpx8IzsYM9u0L0yvb00Nl/Z28Jd3Ak9TesbEdu/zj4fSNqfaLB/0UqTWJFvj3lsXVt
	 /qi+9SpdSF6ZypLG8okX9xJd5O5JQ69IePk1M2GDRtc3DQW7ToX+iRCuXKQDx9QQOA
	 FUAbNA5xATNSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: Add dedicated CM32181 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921232752.3136129-1-robh@kernel.org>
References: <20260921232752.3136129-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:36:09 +0000
Message-Id: <20260921233609.C4DDC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incorrect use of unevaluatedProperties
--

commit 8c1995822038b741ca98711a9ec628a88e937b63
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: iio: Add dedicated CM32181 schema

This commit adds a dedicated Capella CM32181 ambient light sensor schema.
It moves the device out of trivial-devices to properly document its optional
vdd-supply and interrupt properties.

> diff --git a/Documentation/devicetree/bindings/iio/light/capella,cm32181.=
yaml b/Documentation/devicetree/bindings/iio/light/capella,cm32181.yaml
> new file mode 100644
> index 0000000000000..63212e3ec96ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/capella,cm32181.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

[Severity: Low]
Does this schema violate the DT authoring guidelines by using
unevaluatedProperties here?=20

Since the schema for capella,cm32181 does not reference any external base
schemas (there is no $ref keyword present), should this use
additionalProperties: false instead?=20

Using unevaluatedProperties without any referenced base schemas is less
efficient and diverges from the standard subsystem conventions for standalo=
ne
bindings.

> +
> +examples:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232752.3136=
129-1-robh@kernel.org?part=3D1
