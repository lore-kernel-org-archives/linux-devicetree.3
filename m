Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361F3B7765
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044949; cv=none; b=lM4aFGA+QxiKmUihv+gJw8Q95E2XB2ok2UQeMFKPq9Fz8UnXLpFYH/QRgsjO930UAdO771vb8WkxSXhC5Cl/ye3tlxezUQBkrhRUGN0ScFcxatgFH/I4O/M88nFJ2B9gci2qeWleiRvaHVqb77GsBUNlgoP7TdD6pi1sNKXqtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044949; c=relaxed/simple;
	bh=kHfh8Bd0TXE6+iqzOd5n1bM9UyaikajVoye4hYI4Qhk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lILRRU31CirjTrs31WaLhvGzJLwT01gW8MAD9OettSuOu78Fdq1wiJ99wzsveOpWBIHxuvbJ8zyirW5FG6Yo5tDjZrranNfqDM58ehsyoBTwtwTr6eEEFUeUEb1Rus43Ui4wnd+5H8MF+fdCWtgQhPVdCmSEp5eeOpML8j98sJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3JQ1AH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3JQ1AH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FEB1F00893;
	Fri, 29 May 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780044946;
	bh=P/LK6vz+6f42B5HloMoS7LuPzBi7POXABVweBT3ZkVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3JQ1AH6M5ZVlTMACmZYxrJPO2PCzn+z/CKmUfsDOer0JxPnSxIIbS/QxszcQbxE4
	 UUir1UH3ACtrH4+CV4LJ0TVJdP78pmqUnZgN0CE41f46ifu1JgTnuWhxzN8V+pUxnv
	 XX/HaplQasnvuiR6kyyH7zj5MZGm6Q1+lVS8KhzlhGDAfSjdH8zwJ8nLOsrAwMR80V
	 caiRsDZgRXM8d95bPIZ35Iuc/y86krKoGlbtkCqV+hATawHIraz4CyAyF1dK3koSqr
	 72JnynAt8S3sFl/w67lReteHIUo/ZIES84o9UNvbPLoD9YA+atM0NA6VurJXgaeLCy
	 6yjZfv06hQzeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: purwa: Override Iris clocks
 and operating points
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-enable_iris_on_purwa-v8-4-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-4-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 08:55:44 +0000
Message-Id: <20260529085546.24FEB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree references an undefined macro `VIDEO_CC_MVS0_BSE_CL=
K`, which will cause a build failure.
--

commit b94ef34ae2cd7814137efba66c178dd0760ea44d
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: purwa: Override Iris clocks and operating points

This commit modifies the device tree for the Purwa platform to override the
Iris clocks and operating points. It provides a new OPP table specific to t=
he
X1P42100 platform to ensure correct performance levels.

> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qc=
om/purwa.dtsi
> index 9ab4f26b35f29..b842ce5e7262e 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi

[ ... ]

> @@ -157,6 +158,55 @@ &gpucc {
>  	compatible =3D "qcom,x1p42100-gpucc";
>  };
> =20
> +&iris {
> +	compatible =3D "qcom,x1p42100-iris";
> +
> +	clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;

[Severity: Low]
Is VIDEO_CC_MVS0_BSE_CLK defined anywhere in the kernel?=20

It appears this macro might be missing from the clock dt-bindings headers,=
=20
which would cause the C preprocessor to leave it unexpanded as a string=20
literal. Does this cause a dtc syntax error and break the device tree build?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-enable_iri=
s_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com?part=3D4
