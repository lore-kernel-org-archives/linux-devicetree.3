Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB4341057
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397388; cv=none; b=fxNsE3UsW3Fw57pAYvqJMc1E/wOq7BJuyF4ZY+yC9KYvC0zobPlnij0nNtkamBHl9bVs59HG9NaGB+4mtxCaNPxqsyus/rd+hOJVPANQ8khTFJE6Dsx+Tl/41xOKAWQEa5P9EO/UREocJuB68GNB8sYLDLSX4lsYeV2p23ZeBs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397388; c=relaxed/simple;
	bh=bXPljUnxnnJz6PBNhPTuG6vYgQ5pp6aqidDHQfjQVuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nWhLrhjLP2PhzaE82ht+nMxnzPoMDXMrkKFE+vQM/fRNMPeeIArXdw/bekBbm2v2ejwcUpk6/GW6GQh7gPYY2Rc3W7dUjDiU6ETgfRSKhB9Y2gPreu/svRzPYAKwVrAbZzcPXSZkEYI/41SkiAMBH8wJ9d5rF6XeKzk8nuTA9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEL02Hp9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEL02Hp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C29A1F00A3A;
	Thu, 30 Jul 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785397385;
	bh=QzIYCGrZ9g9KqfqXJe7x3oETIIC0MRlwFQUQSa5Qjts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IEL02Hp9XcS6qwuujIoZoY2a4FzLF9je80YirBHOnxNTF7Cr06ac8S+5KTmZeJfi6
	 fXnMS1MhrXuJJnkNc3I/U3kWbi3PPbDe1oTeWYOvUbsdAyFGMBZ2ZXOL8gOIG9EXSV
	 O5QE20sCrfqJ03mr3uVtZyIFfrtv10G8IiFhQIKq3RBT+Pq4wrC4LJfFFlPFeG5ZEV
	 gjdUBi4ZbtiVux3N1vXmcPRZ46yrhrfeErNeGSzu/QLw8SBVMnuI1QUBp99YTT5F1W
	 /Lz6EfldKSEgPgbtvJYktkkhnuYV/iJeeMyFkOi51strX3RX+RFExNHXR5Xa/1DDjb
	 jxH1wNun5OuTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: Add Novatek NT72676 I2C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: nina_kuo@novatek.com.tw
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730072529.492398-2-nina_kuo@novatek.com.tw>
References: <20260730072529.492398-1-nina_kuo@novatek.com.tw>
 <20260730072529.492398-2-nina_kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 07:43:04 +0000
Message-Id: <20260730074305.6C29A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt_binding_check target will fail to compile the example due to=
 an unresolved phandle reference.
--

--- Patch [1]: [PATCH v4 1/3] dt-bindings: i2c: Add Novatek NT72676 I2C con=
troller ---
commit 232c18d6988d7363aafdb8a90285eb1bffed9745
Author: Ben Huang <Ben_Huang@novatek.com.tw>

dt-bindings: i2c: Add Novatek NT72676 I2C controller

Add Devicetree binding documentation for Novatek NT72676 I2C
controller.

> diff --git a/Documentation/devicetree/bindings/i2c/novatek,nt72676-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/novatek,nt72676-i2c.yaml
> new file mode 100644
> index 0000000000000..8e2595f882c44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/novatek,nt72676-i2c.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c@fd000000 {
> +      compatible =3D "novatek,nt72676-i2c";
> +      reg =3D <0xfd000000 0x100>;
> +      interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +      clock-frequency =3D <400000>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +    };
> +
> +    i2c@fc040a00 {
> +      compatible =3D "novatek,nt72676-stbc-i2c";
> +      reg =3D <0xfc040a00 0x40>;
> +      interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +      novatek,stbc-syscon =3D <&sysreg_system_controller>;
[Severity: Low]
Will dt_binding_check fail to compile the example here? It looks like the
label sysreg_system_controller is not defined anywhere in the example node
tree.=20

Should a dummy node with the sysreg_system_controller label be added to the
example so the compiler can resolve this phandle?

> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730072529.4923=
98-1-nina_kuo@novatek.com.tw?part=3D1
