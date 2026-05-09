Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1378CA4E
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359568; cv=none; b=Yn2WWw3B4rvoWBwfDAOouKx52ci5lsBJYyA+Aqs24XlGFLUczq7qz+ooBTOFQjZkUIdlYvG5WN1JIq7K50K0wk1kW0pyPpJcObRVzk0QJNFpzHB3xwg4NY0357sCBAtw5R8PNaH0/8qnWeOb2rGxiptageqKiKUwIKSYkExhJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359568; c=relaxed/simple;
	bh=jItWHos1Hn5XBO11RWjVC8/ok3UcnMAuxALvgTpQQnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JlFiKKjW20RIppspUsbewAWdFGJ/11BIahhyjDLmgnEpgqVycZ6Lm4/B4siEY5Vp07GJsE+H1obDujElGmkRAqsvaQxrIbWXvdFYcfDxYsgPfxGVU5pUz/U+yNVQG1QQqvuWtVwA0rH+LenNfjKqqq/kdYo93CDcOMbpPdFOHo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NESeQLXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NESeQLXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05915C2BCB2;
	Sat,  9 May 2026 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778359568;
	bh=jItWHos1Hn5XBO11RWjVC8/ok3UcnMAuxALvgTpQQnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NESeQLXYgsWX65Ea42v+BuCymkwdtgk0E5YJsIqQmbVBNFcTYktXUVbFK9YWi7hUM
	 QSe9uq8sWN9Lnwr6RJ6wdNTB8oiy148GKbpOP3VOY95zmCpz9j+S0u2xihcB9bcO0B
	 OGi3rBch8BOuaZJxNECAk+Emaqy048+OIj6Ok+Z2aiEbA3ZYG239oaBqhC8mr1Rv+b
	 rKVvQPTuIPoO63Aegd1PC7EFRTXaJHEv8h2uhKDY5gTdQFcRUzqlRXsrHmFS1Ln/0Q
	 5i5IfrVg3sTZL2T1+9Wmj6u8s+/YSuJ7twtU97Q0TRNzrGXyEojLJ0hkszsHZDzNZV
	 xfVVBgcBdZ6cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
Reply-To: sashiko@lists.linux.dev
To: "Aaron Kling via B4 Relay" <devnull+webgeek1234.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509-icna35xx-v1-1-688d3d4e10f9@gmail.com>
References: <20260509-icna35xx-v1-1-688d3d4e10f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:46:07 +0000
Message-Id: <20260509204608.05915C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `ayntec` vendor prefix used in the new compatible strings is mi=
ssing from the device tree vendor prefix registry.
--

commit 2a0dec37c2745490f796112b94d143b7a694cd12
Author: Aaron Kling <webgeek1234@gmail.com>

dt-bindings: display: panel: Add Chipone ICNA 35xx OLED driver bindings

The Chipone ICNA35xx series of DDICs are high refresh, low power
MIPI-DSI drivers for OLED panels used by Ayn Odin and Thor devices.

> diff --git a/Documentation/devicetree/bindings/display/panel/chipone,icna=
35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna35x=
x.yaml
> new file mode 100644
> index 0000000000000..3c497a4010173
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.ya=
ml
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: ayntec,odin2portal-panel

Is the ayntec vendor prefix documented in the device tree vendor prefix
registry?

It appears this prefix is missing from
Documentation/devicetree/bindings/vendor-prefixes.yaml. Although the prefix
was previously used in another binding without being documented, adding the=
se
new compatible strings introduces new dt_binding_check validation warnings =
for
this newly added schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-icna35xx-v=
1-0-688d3d4e10f9@gmail.com?part=3D1
