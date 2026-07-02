Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C992480340
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986528; cv=none; b=q1AVBSJHm5SlquZ+WRTcA5sLBxtvkhy06knEszINSelc8wRCtfHlGG0Lt1NWTmH7O7OpZlahQeMuAbjln3u74vnDV2kM6XusCa9V7pWlOzTqyi0vxEnH2KTS/flHKNkKfbExbC+Tk1z/XGctz448+H6L9dIuuTh7rDFpeqQwRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986528; c=relaxed/simple;
	bh=oHsT66r4irgiz4I5DzzQpBo3Nz+hVkDfm4ANgfDp1Xs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rjC8HbU0BCFAo/ZlxSVUaQksAvmOIBn2QYHwTtkEKgY7C+5CuFd19jPQpSDrGtdMlP14KE9UsZnfsHrU8pEQouHuIpHZ4jax6MTyrs53SCY9uo6rvM7kDgcf3twpIzK5nIFQ1tsmCDDg7EtF3rEAMZM58z9KVHh/XepygSZJ5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1ABDGro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1ABDGro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1931F000E9;
	Thu,  2 Jul 2026 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986527;
	bh=sSBYrb2wBa7cP7bYcdIEJ8iHAzSekDcyv0g6261Bp3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C1ABDGroO28HN3G18j9Lhu/Ut9xOLQ59Xf7cdDLbnn0VNPIh+qXrOhl1Wxw9Z83fc
	 0TJgEhwtfGdBz7/CkTF1K1kRHFDqdMvGzjXZzaDiKiNBN7PLyXD8GcYkDnLyLJ1zty
	 q28CbUQ0kIhVi398zZ6Oi6gYmEVBNmOHO216zF8jz4XWR/EfD5tL/gI0nGJYwbv3qa
	 nYS+8otVXHguUW8thgB90yXKGy1OfV497eQjD4rQvfViWci2uNB3NF3IveyftYcziu
	 NMbfBIwhkmKpFUrpOUz/15K9cNdq99eQkKvL+Q0YQ7HTJC+F+8gIuaLOPw7xteJbYm
	 iK8yo+NvyyMig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] arm64: dts: qcom: pmk8550: add VADC node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-1-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-1-8169953634ad@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:02:06 +0000
Message-Id: <20260702100206.DC1931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree header file `qcom-adc5-gen3.h` is missing from the p=
atch and the repository, causing a fatal build failure.
--

commit f729ded8a3dc9a334b27b383ee9e5744b3564db8
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: pmk8550: add VADC node

This commit adds the VADC node and the initial pmk8550 adc channels.

> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/=
qcom/pmk8550.dtsi
> index 3049eb6b46d7a..3a9d9f7c37426 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"

[Severity: Low]
Is the qcom-adc5-gen3.h header missing from this patch series? It doesn't
appear to be present in the repository, which causes a build failure when
the device tree compiler preprocessor tries to include it.

[ ... ]

> +		pmk8550_vadc: adc@9000 {
> +			compatible =3D "qcom,spmi-adc5-gen3";

[ ... ]

> +			channel@0 {
> +				reg =3D <ADC5_GEN3_REF_GND(0)>;

[Severity: Low]
Are the ADC5_GEN3_REF_GND and related parameterized macros expected to be
defined in the missing qcom-adc5-gen3.h header? Without the header, these
channel definitions won't compile.

> +				label =3D "pmk8550_offset_ref";
> +				qcom,pre-scaling =3D <1 1>;
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-topic-sm8x=
50-adc5-gen3-v5-0-8169953634ad@linaro.org?part=3D1
