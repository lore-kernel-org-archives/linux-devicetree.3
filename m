Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EAE4BCAC6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193116; cv=none; b=NZ9SCYHJNoD+M4ObdaF3m57FslG6DhND+BSLM1MFE3zRYLES5WZ+qXBHg5hL4vu+wDKcRXybHPKjOfB0VKkA1eOEokbNKclcCka6CrzriMTTJLz4MlZS1fdkolv7rhj6ssKWhFF1tblY5qiKOZjjYD1LxZt5ZzhoJg8RXc6hb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193116; c=relaxed/simple;
	bh=H/XyPIM0AfK+0zqzs8YXXyKQyyplXLq930vUAX6HVkw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a71Kgr5h6Xl9y9nRUa2kcm+Z9v/RhZ8L7tCfxRaiCvNVJG38Uv1doRlk5EF4BxMYDr+L8N7LZuLb6CvltU4xXoh9u/R7SLDvcDHFGs2XHZ+wl9BaJz2QS5TYPOxPqqtHQSyIit+yo24x/jzz8PkNhmiayz9xdcqV7751EmY7lnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2Zx7wnR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2Zx7wnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49990C2BCB3;
	Tue, 19 May 2026 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193116;
	bh=H/XyPIM0AfK+0zqzs8YXXyKQyyplXLq930vUAX6HVkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=u2Zx7wnR1TmglBE/e6xBIp02SBJqcc/UYakKF9W1544+2gARmjE9OTG23hTbyRXXt
	 CV80csmljsciK2ub0WMyz0vbAwY+O+j3/VRuv4X9AckySgGnS9pBA8uB9qzR8IeS6B
	 +kB9QQaF/9HzZfjBZJcjAk7gxFrQjVnNiTSH91foX9/fxSXhLtarMZ7W/ENQ3idde6
	 gewAoSwdkCnFsk4U8uQjbfAckDVfSN2SWiWIAsPD0GNtdD9Ju6oXU+p1yu/y9Nr10R
	 Mko6HNgg6t2oBqj6KuMsCTxRPK4V2CytN2JWsiQmGXtUyoTO2N1BhBpLSm3EoLgM04
	 Th5PHC2TLBUSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-sc2730-regulators-v3-1-5bf0e02507e3@abscue.de>
References: <20260519-sc2730-regulators-v3-1-5bf0e02507e3@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:18:35 +0000
Message-Id: <20260519121836.49990C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The YAML binding schema requires the `compatible` property but com=
pletely omits the `properties:` block to define it.
--

commit 965b6e885b7ba5fbecce0029c11926bf606c2f72
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

regulator: dt-bindings: Add Unisoc SC2730 PMIC

Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
PMIC, used e.g. with the UMS512 and UMS9230 SoCs.

> diff --git a/Documentation/devicetree/bindings/regulator/sprd,sc2730-regu=
lator.yaml b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regula=
tor.yaml
> new file mode 100644
> index 0000000000000..5b91c7b7f3ee3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.y=
aml

[ ... ]

> +  "^ldo-vddrf(1v25|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

Is there a missing properties block to define the compatible property?

The schema requires compatible and specifies additionalProperties: false.

Under schema validation rules, additionalProperties: false forbids any
properties not explicitly listed in properties or patternProperties. Because
compatible is not defined and does not match the regexes in
patternProperties, any device tree node containing the required compatible
string will be rejected as having a forbidden additional property.

Could this create a regression where the compatible property is required
but forbidden, preventing any device tree node from passing validation
against this schema?

> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-sc2730-reg=
ulators-v3-0-5bf0e02507e3@abscue.de?part=3D1
