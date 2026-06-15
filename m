Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF88413613
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543110; cv=none; b=V+A1nzWmXyZFK5W6dQ/20zJJzefO7u1L0GYRBC4dxc+sTGX5yH48gohRCl6G+IFbRaTKCrR4+vxUjOCafDHo9OibxQv8D7y/VKdfMfXtGesQGALT/aGfg1jfrx9tBEQjL7dsDZAQ076csSJLIKQfTTSVVm0JMgBZZERdtzGEqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543110; c=relaxed/simple;
	bh=SuulXaC8z3neLPACDhQwSsUP1sld7h6rK4BZhBpB6/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dtNrKQDiiwot6DSCm26TXXnXE1Wlg++uuRNaR+FdddvCJaWfaLMU9cGF9FSUI+TrA1Q0z1BXSz1Zh7op985ANnGIDdAdi+tvOZFOAVgaypqFA6URqvMSzSJu9lCvE3daB8Yr1rjSgTxRxWaQYZpN7irkAY1HmzaHO4Olkc2Qunk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6E9OQ3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6E9OQ3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852731F000E9;
	Mon, 15 Jun 2026 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543109;
	bh=QQdt/KtzwYikVQ/X4X58eYObjaOcK6smloZB1jZk2XQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h6E9OQ3+1fV5rWswW3OsMjkycd5lQHrRxWbcpc1xaQyvpUPNe8GQ152HuUW+T1qW1
	 ps0WPDtGkUb2ZuXwDg5lfJDor+ABoNnFi40XSNJI+sia/9FrR7/BgMMGEOsqAdzhGo
	 aMEvq8Wb/f0zFTDEP29RM3x3dldbQoZXsyUkg1heVAlqAc0uoiZXZcUi1Fb6o2A+1y
	 BNp5Io5wqjSen2jonkxG+/0RgRRYbS6q/T+YEj9yyTZiU1XEcJzswZmj8nyqw0/3NI
	 IJPr5FBIPsE4Ww9lQDGg4c+G4QrTuSTU/Idd33HA7hKdoLr8RFDfcgRv/NOgaQ26Op
	 HeXjNBT6HlSbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add
 missing power-domains property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-3-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-3-6b5752dd4747@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:05:09 +0000
Message-Id: <20260615170509.852731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <dt-bindings/power/qcom,rpmhpd.h>` in the device =
tree binding example causes `dt_binding_check` to fail with a syntax error.
--

commit cf54041a81ff607a5e2770b322af6489287fb22f
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property

This commit declares CX as a power domain of the GCC to allow votes
on the GDSCs to be propagated. It adds the power-domains property to
the binding and updates the example accordingly.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> index c7143e2abc80c..9c1504827cbff 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml

[ ... ]

> @@ -58,6 +63,7 @@ examples:
>                 <&ufs_mem_phy 1>,
>                 <&ufs_mem_phy 2>,
>                 <&usb_1_qmpphy>;
> +      power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this example need to include <dt-bindings/power/qcom,rpmhpd.h> for the
RPMHPD_CX macro to be resolved?

Without the header include in the YAML file, the macro remains unexpanded
during preprocessing. This can cause dtc to fail with a syntax error during
make dt_binding_check because it expects an integer cell value inside the
property array.

>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm8x=
50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org?part=3D3
