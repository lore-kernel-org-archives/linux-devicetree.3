Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B353DA7EC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941694; cv=none; b=UTsaBwSqfBuK26G9ZoMbA5BodiNGzs882ybaq2mlNuzFdqAwowEJbJO8YUefz+ZYZAZLo3LjO/UDOjsrdV/pXf7958ptvbySlmq/sN/J4rpeB+RpVDUv9ZBlwCrmoO9tK5fEG/IfjmdY8uvCVFCV2NkygeFRBIvL46byx04tsZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941694; c=relaxed/simple;
	bh=X3RYiQcx6eVjXIVo+7Erh0pgIRmY+RDme6R9PuyVPmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TMRNibJopob7J09TAhB+Mrotms/O2Z/m5T98mOGYbJlLAAEwtw0CJDC8TRjfpAEn2oeK8BUoo5lgSuT0C/wO7hcnXJo+IuMjiByPqzglMDul7IixxX63LNiysL/0WuH4du1CKBbXpin5uMfQbGKYMJWaPwElsw1xXlNqlYPfT28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfD8ZLh9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfD8ZLh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863CF1F00893;
	Mon,  8 Jun 2026 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941693;
	bh=PQkcxbn3eMUyjPwEaHRxAyeYWRA5L96rXkU8dvRqN3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfD8ZLh93L3MevoN3oCrFc8ockqusJM7NXeH1Oh0cmqQdixgdZ4KJb5TVMK0jDsUo
	 W/NxUODfgB5nbe862nNnMZeBxkZkfl3vw+aGHhspJGuQi5N0Mj9PO5IWuEm9MpCqIl
	 8CFjXMiZZDSrQGdlBmTswefyHUxZQGog30ZgRc5iTPxb3tDhxnQ0KEAh8mZasIu/Dv
	 cqrdLKPyZp4SQ6U5lJPVS3AmWFUH2zwjQQ3RxJhP7Wxtk8Y0gfilgA0TiM29L3Z3Cn
	 57Ej6NfG6nMJOq66N0ouv5jbRDecsxVBHwwReOnCLl/Uwnyspl2BXJz8v1cUI0UlCR
	 lfDFb9wlVpZbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608175418.1936892-3-tmaimon77@gmail.com>
References: <20260608175418.1936892-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 18:01:32 +0000
Message-Id: <20260608180132.863CF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The alias mapping convention for NPCM8XX was corrupted during the c=
onversion to YAML.
--

commit 04ac00da42e73e1f171a2c2d3fdb84bc4768096a
Author: Tomer Maimon <tmaimon77@gmail.com>

spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT schema

This commit converts the Nuvoton NPCM FIU binding to the DT schema format.

> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml =
b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
> new file mode 100644
> index 0000000000000..0f95def019105
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

[ ... ]

> +description: |
> +  NPCM FIU supports single, dual and quad communication interface.
> +
> +  The NPCM7XX supports three FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU3 supports four chip selects.
> +
> +  The NPCM8XX supports four FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU1 and FIU3 support four chip selects.
> +
> +  Alias convention:
> +    The '/aliases' node should define:
> +      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
> +      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fi=
u1;

[Severity: Low]
Does this new alias mapping for NPCM8xx correctly match the original text
binding?

The original text binding in nuvoton,npcm-fiu.txt mapped the aliases as:

In the NPCM8XX BMC:
        fiu0 represent fiu 0 controller
        fiu1 represent fiu 1 controller
        fiu2 represent fiu 3 controller
        fiu3 represent fiu x controller

The converted documentation maps fiu1 to fiu3, fiu2 to fiux, and fiu3 to
fiu1. Could you confirm if this change in the documentation was intentional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608175418.1936=
892-1-tmaimon77@gmail.com?part=3D2
