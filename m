Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB230C174
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728442; cv=none; b=WFgAutkzG5wrLUPudlJ4XD2AZGMyuwfu8ad6bb9vCYyA+lU8rmivG3npyPZBJgG/a8EIeUhOAUcQ+vjDv6nxqOtRWgCf+jwalKcQkQH4qG89YQJ/WkvAYeScS38hIHY468tpxY8Pd0gdOQsUlneDDAbTvK5iyFn5pa7zAdy8m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728442; c=relaxed/simple;
	bh=zrfUf64VVBgVsSdbMAnZmLL3+pzYqNaK4FWykZoU2GQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owY9EFmm5c1jgezdIcsiVaFe6+a3l6fjqlUXxxEymwB5GrvhXCSe8Ls/qJ+42YBP7iNlmoNouFhYixLzb5FophXqg0X7Wu7+HNFPAjY1jdO6ug3Y5/4V+hwltrRSxjHmqz/1xFYgHZ0PluXUD76UdEVn8u0WYYgDOZBh+19p5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYxSjnBv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYxSjnBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132D01F000E9;
	Wed, 22 Jul 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784728441;
	bh=7Q6mUCfhwfAcNesi7GUe/ruL9qYDvUNdQ/OgMwqTwec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYxSjnBvbiyvPaAbK0PAGCUk9EQCri3Si8CbYrnpnXVCtOAeXS7yZrrGqtpq4cGTb
	 YtSjE1aws0jRDdYIFLzD/oBq0Df4F8mfXOjdsMk2AUi2+RE5T0syp2+BWHqOj45e9q
	 zvu8GxI8sFu2bC/Dk11+ObGeSKLYjhURm9cHL6zRzJ8YGWQZilVXnvuh+hJeOphtOC
	 okqwBzaE+HiXBvULJR69JX+KKUSiKsbTICmyy/YFjwd6UnLshHXdUU5v+TIka7gYSy
	 9HgXAtZq/kKpwFMYchUWiLXEafeg5VtO+BSmAAKg9kFoWYwP1Zm7DTlfyoYCBfx3ee
	 IfTkIqyhfB9Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
References: <20260722-phy-qcom-qmp-usb-8255-v3-0-e789070b48f7@kernel.org>
 <20260722-phy-qcom-qmp-usb-8255-v3-1-e789070b48f7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 13:54:00 +0000
Message-Id: <20260722135401.132D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema uses `unevaluatedProperties: false` without referencing =
any external schema via `$ref`.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: phy: Add sa8255p USB PHY ---
commit 7b3aaeb1e0d8c8cd82e7d6b2d97dc88cb763da87
Author: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date:   Wed Jul 22 13:45:44 2026 +0000

dt-bindings: phy: Add sa8255p USB PHY

This commit introduces a new devicetree binding for the Qualcomm QMP Super
Speed (SS) UNI PHY on the SA8255P platform. The hardware abstracts resources
like clocks and interconnects through firmware via the SCMI power protocol.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-=
uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-=
uni-phy.yaml
> new file mode 100644
> index 0000000000000..d274d500fc9c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy=
.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - power-domains
> +  - power-domain-names
> +
> +unevaluatedProperties: false

[Severity: Low]
Since this schema does not reference any external schemas via $ref, should
this be additionalProperties: false instead of unevaluatedProperties: false?

> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-phy-qcom-q=
mp-usb-8255-v3-0-e789070b48f7@kernel.org?part=3D1
