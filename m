Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078718DB37
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072803; cv=none; b=QmkxI+sW1siAC4UEP1HopJsIfYaSyX7pByoNwQU0L3kzRZ4aiXtSIFEU6MQ3NERnTTMXSbDOihFXBTQgeKfI+vCS5spHtxsRp2VDxeXExlO4xUjJh5BTlfg7/GLUTdPBGEzloCh2dgNxhDo+4z2tau5/lIE7MUfKPCPprEHFh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072803; c=relaxed/simple;
	bh=9xM1dWan0am3Xhs+rRzcoKb9gx69y+vZfq8Wk7LSxmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hNgAlCOj9Fdv3oRQ9Z4Fuq1kdcG24cnrU0bnwfdlpR0/LnqqdLtBS+4GGHgdb3TTQqvXJGey1eERQJKkQJZYU+aUmMarhZuU2/+84F2LxbhlwSlKEF3WLgyt75tMbr8VTVK7BVZOz//020CGKyrZrPHfY6oktYtvEMmeuiqoHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOmJCpJ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOmJCpJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECFEC2BCB0;
	Mon, 18 May 2026 02:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779072802;
	bh=9xM1dWan0am3Xhs+rRzcoKb9gx69y+vZfq8Wk7LSxmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JOmJCpJ5XaMQONxD7l6ceiczNFVpf+aZSXeqVOCd1ObZ+hBXXlsUzrif6tn+oyzwL
	 72GT2At9foHhLBrwZb2xCaFC9GsbLfltf4wK7u6Z8g6f6A1I5YzKBh9uQj9jS8VLQ6
	 xSQn0dfU2/nsJSxvq5eqn5GoaqUy0jmqEZhyrzNaOQ4XUDtWmJmvhYGjwqgvn26UQl
	 ocm2arQgcOTQbFByDfF8BsTRhFaXjmgIUsMDD6K147dVly4PWLVYY09RIMH2eU2upH
	 7DhMPv5UcC2eeR79bnShizO1h1haciJF5pI52O6DO+tKppVlNam979hwYYjHb7pKyO
	 BSv2PUZrQ3/Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518024704.118613-2-YLCHANG2@nuvoton.com>
References: <20260518024704.118613-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 02:53:22 +0000
Message-Id: <20260518025322.AECFEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Property name typo: schema defines `firmware-names` but example use=
s standard `firmware-name`.
--

commit 79af2c3efbc97d2f61f76b26b50c0f08ac0264e4
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60

This commit adds device tree bindings documentation for the Nuvoton NAU83G60
audio amplifier.

> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> new file mode 100644
> index 0000000000000..756b3e9c43215
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
[ ... ]
> +  firmware-names:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      Assign firmware filenames for left and right DSP cores.
[ ... ]
> +        codec@1a {
> +            #sound-dai-cells =3D <0>;
> +            compatible =3D "nuvoton,nau8360";
> +            reg =3D <0x1a>;
> +            nuvoton,dsp-bypass;
> +            nuvoton,pbtl-enable;
> +            nuvoton,dac-cur-enable;
> +            firmware-name =3D "NAU83G60.kcs.bin.l" , "NAU83G60.kcs.bin.r=
";

Will this pass the dt_binding_check validation?

The schema defines firmware-names in the properties block, but the example
uses firmware-name.

Since unevaluatedProperties is set to false, this mismatch will cause a
validation error when checking the example, or silently pass validation on
actual device trees without enforcing the minItems and maxItems constraints.

> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518024704.1186=
13-1-YLCHANG2@nuvoton.com?part=3D1
