Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C13A9DA1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036525; cv=none; b=lTQM7Fts2Twrfz4au8ZYzaTWgjX2EJUn841a6vxqaxnhz6T5i7yDXsAr9SIAyQvgnJLfivTyjmNnI0VFaxPH0YF/YKz7WrWWFTIjvCIpz3u/H7BbKei0LOSxMyWN4AMs+4TqfRrk1sjhExLkecs5ZH9rWzK4pCklRPw/OoMX34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036525; c=relaxed/simple;
	bh=uZUDlgBi+Vmn/iPz+FCi9vif9Cs7FPFeUX20RDvjsVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DQLOqPLQWuj+dVlkzD14bAPZF5NgK0gSmJ1UymWRHCgWlZWNZ6UL1EQy+mc6au8DNDvyNFXp61c+KETvQUXwQGzApwVP3yvbTLQ+NW1uyrew79p//wY0wf+YCtFitMAP+C/p/ac9V+X2tOPtQs+5MISGY16jOQmu/osxuFIW+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fO9m4rLW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fO9m4rLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959FA1F00893;
	Fri, 29 May 2026 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780036524;
	bh=ubnU7xYxVX8RAznrRZjDCvdABaKKm3D04onPEtK75iU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fO9m4rLWbMqfUPYu0P1jFNxwoNms5WzIbi6VUb2YzSJz5LzdwI1fdVrh4xX3vOvr3
	 qeWrbdLccRhnYgubZIomCQT7gQUaWKfLHHmYCY5ZKwUq4En+oiy2wISzSsQ1EglqhQ
	 KqbFjc4kzhQ2U7Z3m9MW4dEHXpnn5HANGjwiUqGEOFbytHiyOIMcHmxpXNrgjINNsH
	 n2q1+o5voD3aDsVXtu5lgPGwo5h04dr2dmgDLaO4JBkAFMgC1fFUKm69100Eavmikt
	 EvoTf3+IWNBardaUkSttBiKinSFNqIqVy0YV+42JqiQzO9ofh4IFr6HvZp4ovhtQqD
	 Dv3Fdx9MvBliw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add Ilitek ILI9488
 panel controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Reznichenko" <igor@reznichenko.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529062836.203990-2-igor@reznichenko.net>
References: <20260529062836.203990-2-igor@reznichenko.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 06:35:23 +0000
Message-Id: <20260529063523.959FA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between the hardware model name in the commit message and =
the defined compatible string. The commit message specifies the panel model=
 as 'E35GH-I-MW800-CB'. However, the compatible string is defined as 'focus=
lcds,e35gh-i-mw800cb', omitting the hyphen before 'cb'.
--

commit 77323add8dc7854fc38182a5936a43c1c36a096a
Author: Igor Reznichenko <igor@reznichenko.net>

dt-bindings: display: panel: Add Ilitek ILI9488 panel controller

This commit adds device tree bindings for the Ilitek ILI9488 panel
controller used in the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. It also
adds the focuslcds vendor prefix.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili94=
88.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.ya=
ml
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - focuslcds,e35gh-i-mw800cb

[Severity: Low]
This isn't a bug, but should this compatible string include a hyphen before
the cb?

The commit message specifies the panel model as E35GH-I-MW800-CB, but the
compatible string is defined as focuslcds,e35gh-i-mw800cb without the final
hyphen.

> +      - const: ilitek,ili9488
> +
> +  reg:
> +    maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529062836.2039=
90-1-igor@reznichenko.net?part=3D1
