Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279446F4BA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935076; cv=none; b=QDoQFP94siPFLVI1oxAQ+GD3nNEM/z6d+9KO/mX2JI6YqMOuDkXIKb6o4c2E95QyYWKOQk5kGsFzKlA/FkFcksfthqryGJPEp0FnZA9zV6cscst+bAMFPAxSRS1xqeJAhutlwmo+WCaQNtUEqkKqQqMuoTfbfs62AJzqy+vCB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935076; c=relaxed/simple;
	bh=RJJFbW5ybnNDL8KR5O9TvlZ2R2UUph6U2JVYoWmJ0HM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHWMPV4ebKZ6ThYpF/mKp1/J2/kOWEK4V/Yth7r1n4Ad9JRGi0HbQu6iBpdLGMn2VE6M1MP/x10XgbA11wSECUritpj34bW3ZUwQiiMCYpvyLqGjEsvN5ES6D4CfG/D3Hewowtd7/1K2QLwmBiOrI4hQ14r/7HIQvNAbBNrxouY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbpbA5gw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbpbA5gw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE571F000E9;
	Wed,  5 Aug 2026 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935075;
	bh=OXoQR4B7CLwuvYPV1mL819CvZJ6Jgy430yWdp+i42ww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbpbA5gwPhsOhNGjuRNfcgesHKGD7CM+JgzkB8Ws2LMLUX1gtSmkQsZu2E088OgZO
	 XfV8yf2oZmiD8W1Wn7IcBNK7+z/Sw6ScYysqdSgnpgPhJo5/fay24Yf4T8jymg59Et
	 2YnThgQU8ZJlzTMLQmS7txmsIyJcTszS/ZHuLriz2cY++vIDZqOV7pz4rtnce+Ahr6
	 Hvi48PKKXnEtItb3BEpxYcaHXD0mEqUvD8nFxjzLKqxgFuVaeAZSdmwVaDKL2Y6qmI
	 VoMpRBa5f7USa31b2uqDE6kTzChtZf0ovc7FwZMvjF2JVUYy706mp06uA6Jdy8/686
	 C32JWxkUVDwIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 28/36] pinctrl: airoha: an7583: add support for
 npu_uart pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-29-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-29-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:04:33 +0000
Message-Id: <20260805130434.DCE571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a new `npu_uart` pin group to the `uart` function in=
 the pinctrl driver but fails to update the corresponding devicetree bindin=
gs (`airoha,an7583-pinctrl.yaml`), which will cause `dtbs_check` validation=
 to fail for device trees using this pin group.
--

--- Patch [28]: [PATCH v10 28/36] pinctrl: airoha: an7583: add support for =
npu_uart pinmux ---
commit 7fc23e1570287d709b03bd9508c42c7bac7231dd
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for npu_uart pinmux

This commit adds support for the uart pin function for the npu_uart pin gro=
up.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 44efccce78c55..dc88cbd8746bb 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
[ ... ]
> @@ -571,7 +572,7 @@ static const char *const sipo_groups[] =3D { "sipo", =
"sipo_rclk" };
>  static const char *const mdio_groups[] =3D { "mdio" };
>  static const char *const uart_groups[] =3D {
>  	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
> -	"uart4", "uart5"
> +	"uart4", "uart5", "npu_uart"
>  };

[Severity: Low]
Does this change also require an update to the device tree bindings?

The npu_uart group is added to the uart function here, but it appears to be
missing from the allowed enum items in
Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml:

          - if:
              properties:
                function:
                  const: uart
            then:
              properties:
                groups:
                  items:
                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
                           uart4, uart5]

Without adding npu_uart to this list, will dtbs_check validation fail for
device trees that attempt to use the newly added group?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D28
