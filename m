Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760EF9D9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284215; cv=none; b=NR15S7hNcLQP9xaP78IChLS4e0ZDWhGu1UXHi1fL9v+Gb5vBYZvH7buVf02DNaLfPEYK4Q1Pakmfv2y0meAA0lW+2p7OGR0y5CqlFohrwjX4Xmakaw/EPTF4eGVCKu10bevHWY5Rb0uPIxw+TL9zj79p8p05H5jTLa/Vi/06tYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284215; c=relaxed/simple;
	bh=S7qdIZqUbZ1dWx1jdjxJtqFguzR+cwe+joDjIDt6oJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X40DpbfCTJMx9O0XmJSuvOyDiGyDfTmH6pNS37ArMu7Bww5RJvtvHq4AnYue841NGFKPQDpe7Wmo75NcTB8L5ltCMko6oK2J2kaPQAl2dSOKoQQ3pjnDLNwdqZzmd+rZOSR2dD6re2N/rBSAlfKX4mliomIve+ulyggMFGSI7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+LuKOm0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+LuKOm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B10FC2BCB0;
	Fri,  8 May 2026 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284215;
	bh=S7qdIZqUbZ1dWx1jdjxJtqFguzR+cwe+joDjIDt6oJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=B+LuKOm0iIRQxTyXxs0EEqKis/41Jkp7dkdNOGZGy7e5B999zl4VUgEWdXSXWqVjy
	 /6OckiL6+KoYGR5GiPHAmrU5Ss729oYUUPoRIUzqRtdE9JqyfZFK5HM7NNjO80WaJS
	 8JK5hL+WzldC8RQMwfB/Fx+EVZgM7n68BMK+9JLiOiY/Fobkuy6gRX6GNjUEapJrW/
	 rXxBBLgUqjIF28zGzgrZqiXAGkicdWfVMSAFrtX6083NoM0LmrgphW5gb0zpMStsAf
	 FS92TG3DDGWx3Qcge8FslGsSIn3MNjiw57f4isQ9LcChJuCEl+UkSAdDanTdRy3Oav
	 ypR0yjOdaRjIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: dds: Add AD9832/AD9835 binding
Reply-To: sashiko@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508233730.77834-1-dennylin0707@gmail.com>
References: <20260508233730.77834-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:50:14 +0000
Message-Id: <20260508235015.3B10FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing reference to standard SPI peripheral properties schema rest=
ricts valid SPI configurations.
--

commit 05158b905a98b93285ae76fe23056051bd698d9e
Author: Hungyu Lin <dennylin0707@gmail.com>

dt-bindings: iio: dds: Add AD9832/AD9835 binding

This commit adds device tree binding documentation for the AD9832 and
AD9835 SPI-controlled direct digital synthesizers.

> diff --git a/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml b/=
Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dvdd-supply
> +
> +unevaluatedProperties: false

Does this binding need a reference to the standard SPI peripheral properties
schema?

Since unevaluatedProperties is set to false without including a reference to
/schemas/spi/spi-peripheral-props.yaml#, standard SPI properties provided by
a board's device tree (such as spi-cpol, spi-cpha, spi-cs-high, or
spi-rx-delay-us) will be incorrectly rejected by dtbs_check.

Should this schema include an allOf block to inherit the common SPI
properties so that different board designs and controller requirements can
be correctly evaluated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508233730.7783=
4-1-dennylin0707@gmail.com?part=3D1
