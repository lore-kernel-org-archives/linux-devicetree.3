Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3E3CEBA7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625747; cv=none; b=hFEF5ssziD1+itSsYyci3Zym9LXJUDin67cR8EuvcsTm4N/QSUzboQaggrGMzx+N4aoD61u2NacM3WnGcA3boC2+iq/LU2lvPN0raJJL8h0Dy1VJ+XygwXAcUXpmM+t0+xQHB/4kWxsujpQorUmG6q/r6BkhCzD5+X8Mee4G8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625747; c=relaxed/simple;
	bh=L9aLUOU19YeswBvE469xA/m4rOuau8LDsy6MuM4f0hA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n+78vur3Cdxt2QhjAMCADJmOsYPH1wosG1lxgMOAT5z8dtu7v6O5sVtulVgBgXNK0p2RmK8Ac4UHlprFRuA5RzkxN68zQvHhYpMTGuHanND/XpXxekg4IFq7Qem1OrguoegR3MOX0VsAb4iiKVXGEctjjqYWv2JAL9qQMqe/wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfFSiCAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfFSiCAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E31F000FF;
	Thu, 17 Sep 2026 06:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789625745;
	bh=Jdvyqe/rylteQhNwUkG4Prjr06J1gufsYLqP2y1WCyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CfFSiCAkMbPmkkpVgaRCmsH1E4w7Yrs7Xg1cMozVIizyiwWi2uBU+1PwcaIux4MlQ
	 LkuNAzGSgsR6SZxn2BqrMK9tIQ1MXgEdqPwJlRB0MX1eQvZkuzLX+XZp/h0ze7ayrx
	 Cgpvcs+PMBHbiEsK1s4PE418guFklzEWsRhO21rScU/MMa6Kk8dD87wm3lsg3E8ufL
	 YYqCmlkPDNIsVuYUGJSJQ8boNWiPcwX9Pkcpl+JeF88cNcuP6gUUcnvs68JiYfeMGC
	 pj0NTyTEK6zpJDb9UyswX+wGFXtBm18D/84xdzCobOsVbseJlfjiGnPk7HlGoV5aD+
	 Yg/ZMwa68dADw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: misc: add  xlnx,axi-fifo-mm-s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260917060948.14700-1-palaomer100@gmail.com>
References: <20260917060948.14700-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 06:15:45 +0000
Message-Id: <20260917061545.854E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: duplicate legacy text binding not removed
- [Low] dt-bindings: misc: xlnx,axi-fifo-mm-s node name contains underscores
--

commit 1e96a460ceedc5eaed86e4087bdc979b41dd1bd7
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: misc: add xlnx,axi-fifo-mm-s

Add Device Tree binding documentation for the Xilinx AXI FIFO Memory Mapped
Stream IP core. This commit covers compatible strings from version 4.1
through 4.3.

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644

[Severity: Low]
Is the original text binding at drivers/staging/axis-fifo/axis-fifo.txt
still needed?

Since this new YAML binding covers the same hardware in the core DT bindings
directory, should the old text binding in the staging directory be removed
in this patch to prevent documentation duplication?

> index 0000000000000..f53b353ccc2a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,228 @@

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - xlnx,axi-str-rxd-tdata-width
> +  - xlnx,axi-str-txd-tdata-width
> +  - xlnx,rx-fifo-depth
> +  - xlnx,tx-fifo-depth
> +  - xlnx,use-rx-data
> +  - xlnx,use-tx-data
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    axi_fifo_mm_s@43c00000 {

[Severity: Low]
Does this node name violate standard Device Tree naming conventions?

Using underscores typically triggers node_name_chars_strict warnings during
dt_binding_check validation. Should a generic name with hyphens, like
fifo@43c00000, be used instead?

> +        compatible =3D "xlnx,axi-fifo-mm-s-4.1";
> +        reg =3D <0x43c00000 0x10000>;
> +        interrupt-parent =3D <&intc>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917060948.1470=
0-1-palaomer100@gmail.com?part=3D1
