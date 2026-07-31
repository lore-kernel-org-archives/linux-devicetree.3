Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4E3F23AF
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492587; cv=none; b=o9WWt1gh0yux4Xf/nD2OWTdE0isJFEdGEVOdAf4kECJdsgNqVK6eWl+/WrBBcfaAKI2aqQWP/GQFe4l78YlYwOMQ5EY26q2EOjoTnuu0p/QTE3U4U2WrqUCHl3SVoLO3M2gMyPA43rNPWYw30Rur6CxRGSA/cLLa6vyoda0IcPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492587; c=relaxed/simple;
	bh=s6JH97vRhP7SfNPQ1QBaeu0LPk/2iUqW0pq0PlAqk0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLSj7hVcfjb+eDSkHHObB/zRkHtcD43bqJVLO+JKpVjevNpvdxTlbA9n+uUT9r7z7z4EgXQXKeCdxI34WLmVP2dNQFvbzkoiW40Rw6VrszKyS4l2SOPdYXHBkvXouSMCZuxrUYBEQIZAcjenWJVKfbSShzWi3HS1Pj2RNPoBFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShnYp2p8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShnYp2p8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34741F000E9;
	Fri, 31 Jul 2026 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785492580;
	bh=+h4vk4ov2gavYZERcM3yUtnvVSVec9WFJ3KF8t7mQNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShnYp2p8s82qLavu3r3pa8sTlaIiInGl23Hz8YYJk6P1+qUvz29f8xIHzQkroCdqL
	 1JVDMXRY9JBPDgPT2w9k1yxkShlkU9Pq1C2nXVK8LJtGk2sYlfmKwkk9bGO4HpU0vE
	 GDYx9NMmh/3xFaCsPB013XNyq2UaKcOAmNYlrNU/cE60DwG6GRyujA1rrCXhE7tVyW
	 Q4NEqY9oJHyBzbs5Wr2c4K+qI1SqTkYG1edOsxKT/3ZWDdoj81jJdZ7RSfu4PMOAU8
	 2rMwf2AX4uKNBXdDsOpIOOKV4aXJQ/OfgFQ54IgWGdunHnmpmJd60p+kcsHXE8Zq8R
	 /Ypf3+IN3ayZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C
 PD controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-ucsi-itepd-v6-1-d25ae12b181f@ite.com.tw>
References: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
 <20260731-ucsi-itepd-v6-1-d25ae12b181f@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:09:39 +0000
Message-Id: <20260731100939.B34741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `#address-cells` and `#size-cells` properties are omitted from =
the `required` list, which allows structurally invalid device tree nodes wi=
th unit-addressed children to pass schema validation.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-=
C PD controllers ---
commit 71cd2c5efffec87b0126175a226c30906e7e82a5
Author: Amber Kao <amber.kao@ite.com.tw>

dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD controllers

This commit adds device tree bindings for the ITE IT8851 and IT8853 I2C-bas=
ed
USB Type-C Power Delivery controllers. It defines the required properties
and child nodes for handling one or two Type-C ports depending on the
hardware variant.

> diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Docu=
mentation/devicetree/bindings/usb/ite,it8851.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
[ ... ]
> +patternProperties:
> +  '^connector@[01]$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Low]
Should #address-cells and #size-cells be included in this required block?

Since this binding has unit-addressed child nodes (connector@0 and
connector@1), omitting these properties from the required list allows
structurally invalid device tree nodes to pass YAML schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ucsi-itepd=
-v6-0-d25ae12b181f@ite.com.tw?part=3D1
