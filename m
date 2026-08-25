Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF93A38BF75
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679909; cv=none; b=ardv9DQvWW4fo3opXkuUPplSNp92T9ifhLIr5S7ySgxF7/We6fUDCF1gThCbI9V1EqpJDHpOOXw02sldDybDOpifXdSLMbKU9EmN+UcTqXYl6HHN5kZf8lyWv4MJFCM8L8BBY5UAnRzy24ncoYuDZpiX1ls5dRWwEzTQK4n3/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679909; c=relaxed/simple;
	bh=J/WYUUZfMiquUBq9n9FCk0uUBc2kGOv25gRbsIcAWcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cu1CKEN7Bv5twqiMIMkz7sPptE2UHptKb7yUF9doninJ+mT9nUOOPbV49IO/7F6Igj2NG7cpNb1u03LgUgzMNbB6SXIxkgtWOYm/NMQKrxS4lvdEl7f9D6NvKYwkjcugHVYrpHx11Bnxt7ocp+0/z0nXmt74o5kW/CHp13VRujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku+WnARp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku+WnARp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3254E1F000E9;
	Tue, 25 Aug 2026 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679907;
	bh=Ch8tKm3ivGyNnGQqoyFVpoUisE2HbrZZi42HTNnay4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ku+WnARpJ/Kkcx6EvvHlalek+iLQ5Sx5e3GfCYyp2yiyMG29OIHHGW52FIz0y2Kf7
	 f+KZ/cRpdr3X8XYRxM/zu6xcQu0WjLJ1Zt0A+JekLh60xhXWgV8EM4AW9dEaWFcGi2
	 4M7xBtr0u1lc++JFJlURbop/BYQW8FSoDpzb2uZwOksZhciRE7pYH4yVOiMBC3dNwn
	 VSP4PH794ruTwlkANZ0QJP2qVGi0jvt3ootxd0b8qBPwWs3dsfJhs7u+39bSX0waVI
	 sTv1S0YhogI59aCqvBv7wrOw0ZXutmEvukqeVwWJTTXSNki9aVF4SMDVNWLfDoa0Tj
	 mwVcus2E73mlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 18/18] mtd: spi-nor: run controller optimization
 before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>, conor+dt@kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, robh@kernel.org
In-Reply-To: <20260825171737.776052-19-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-19-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:45:06 +0000
Message-Id: <20260825174507.3254E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The validated tuning frequency (`nor->max_read_op.max_freq`) is in=
discriminately applied to all read operations constructed via `spi_nor_spim=
em_get_read_op()`. This incorrectly forces low-speed alternative read comma=
nds (such as OTP reads) to execute at the high-speed PHY-calibrated frequen=
cy.
--

commit 6decf5586ab8fae3319b12bc93ad82202b53b090
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spi-nor: run controller optimization before dirmap creation

This commit runs controller optimization before creating dirmaps so the
validated frequency is available at dirmap construction time. It stores the
configured read op template and propagates the calibrated rate into regular
read ops. Optimization failure is non-fatal.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b683c077a233d..2efcdc7f637fb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -216,6 +216,9 @@ static struct spi_mem_op spi_nor_spimem_get_read_op(s=
truct spi_nor *nor)
>  	if (spi_nor_protocol_is_dtr(nor->read_proto))
>  		op.dummy.nbytes *=3D 2;
> =20
> +	/* Propagate the validated frequency; zero before tuning. */
> +	op.max_freq =3D nor->max_read_op.max_freq;
> +

[Severity: High]
Does applying the tuned frequency to all read operations cause issues for
lower-speed commands?

When reading the OTP area via the MTD API, spi_nor_otp_read_secr() in
drivers/mtd/spi-nor/otp.c temporarily changes the opcode and sets the
protocol to 1-1-1, then calls spi_nor_read_data():

drivers/mtd/spi-nor/otp.c:spi_nor_otp_read_secr() {
    ...
    nor->read_opcode =3D SPINOR_OP_RSECR;
    nor->read_proto =3D SNOR_PROTO_1_1_1;

    ret =3D spi_nor_read_data(nor, addr, len, buf);
    ...
}

Because spi_nor_spimem_get_read_op() unconditionally sets op.max_freq to the
high-speed PHY-calibrated frequency, will this force the 1-1-1 OTP read to
execute at an inappropriately high clock speed and potentially fail or
return corrupted data?

>  	return op;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D18
