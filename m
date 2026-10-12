Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F95399CF5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823718; cv=none; b=E6K2fnCLYsnZLNcxe0L3ExQW9AjIM6XyVHy+Ll4ggDkcwPUT4lhsZvu3iRg/I+wB2zz4mz8UZPRJ6MfwQRYlcDLjN/Jig7xs9jGlkXphMRqRf7peWy5XDKnH938VCod2vqqu6RNwPZFb0Kc0d2/1Z3KSduoK6DVs1q1QelobbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823718; c=relaxed/simple;
	bh=0mcho/0NHv4AZRaC2wCxa3vJoP7I6swT/Ctuq1MnCLA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Koeg0HU2tB6sPABOpqEzIneCJUKgg/HHlfRwS5JjxbmJDWZ9vhAuXtjQxVlEq3EbYsy5zxLHw0iKeaRIDH0jsJVGHNWtzPEOs0LUJlFfuFSw4OWnkhvcXxI7MaUd1ZXQyKDe6V9KYH+d2/Wrzb5P/qc4HhngIlF7ftojwfYhFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYzaSAMw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYzaSAMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982931F0089B;
	Mon, 12 Oct 2026 16:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791823716;
	bh=AJqjCy7uhcThfOODZM+MrXLrVwfWe+HQdgrcyhjtrKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYzaSAMwb6M26vTh2YIkePm9YyeUsR+up8FdtfysGJHAV+krEe4zUTUYQIj15yFM9
	 prmC/taV2heklhhoT+sgvO2BlP0z15kUcLVqM1aSMBVkvNiAstw7cremU0/rVGycjj
	 hiShOqGXjygOxsVdFoxjdu76Ab21fFpQAbnVPnV95Y1ck7h1Rg99AJmMVMNQtYaP8Q
	 gEsLMuGzYok6OQGlVb0wU+qOa0uGRB1EEgDLuPOlRAb/HZ8TPOtnvXaMv8p4o3Mg/X
	 MhKAW5LWavUEUSYlOB3y8m0iQg2fFvp3tnIOSPI7y2Vw7IggyFil99x/VOv0JoZB/S
	 fADivaYXuJ95Q==
Message-ID: <sashiko-outbox-168431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012164354.3872326-2-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 16:48:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: syscon missing hardware-specific compatible in example
- [Low] dt-bindings: incorrect node name 'reset' instead of 'reset-controll=
er'
--

commit 86eb967be387fadac7b22aba279d8ed01983af26
Author: Alex Elder <elder@riscstar.com>

dt-bindings: reset: introduce toshiba,tc9564-reset.yaml

This commit defines the binding for the reset controller functionality pres=
ent
in the Toshiba TC9564 SoC. It includes a new YAML schema, a header file for
the reset IDs, and updates the MAINTAINERS file.

> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset=
.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/reset/toshiba,tc9564.h>
> +
> +    syscon@0 {
> +        compatible =3D "syscon", "simple-mfd";

[Severity: Low]
Does this example fail dt_binding_check validation? The core syscon.yaml
schema typically requires a hardware-specific compatible string to precede
generic fallbacks like "syscon" and "simple-mfd".

> +        reg =3D <0x0 0x2000>;
> +
> +        reset {

[Severity: Low]
Should this node be named "reset-controller" instead of "reset"? The core
reset.yaml schema enforces the ^reset-controller(@.*)?$ naming convention
for nodes providing resets (identified by the #reset-cells property).

> +            compatible =3D "toshiba,tc9564-reset";
> +            #reset-cells =3D <1>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012164354.3872=
326-1-elder@riscstar.com?part=3D1
