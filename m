Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD24EDCBB
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074457; cv=none; b=lAfPk9/B3BBLMe2iSO7a4MJx/KoeWym3kKm7av3F7D4A9TGM/Sb/2rbMiTVbIlHEwKCyum3CgvziynoqdtD+7Jry9346+caPq5lorqtPxZZBuo8MJGFrSrsmWem+2X2nPJp2XsZ8zUSSO9fWWHgvGxGP+VdfUE8G73IMjMvcX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074457; c=relaxed/simple;
	bh=QUDTAXE7gfzBY+KlF+iOAQ070EQjImYhvRFLM1PHsE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PdWHL0MBAicmVDRk9qEYgKKZhCat7nXTtxt0T3j+04Uw2bzd8UTy+6sRmQfNcxq1yotILmWdcERVq/RB9OXk3aUyLrpIgjlvs41EdpfFBrJHnyh3jfE1+J8WRwZoi7lqxgdDwtkE8Rql1EOrRnL/ZVteT77jYjNhGRFc92DQHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBqtuyak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBqtuyak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B651F000FF;
	Tue, 22 Sep 2026 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074449;
	bh=iStzlGp0VC2GlCcolkSJu1aZHn0Y8hQ5EQb/s/+AN7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBqtuyakeufAt9PESxiNPwlQ0X3EfD5OpvC33KAQkfIQ0lXi7rFZL23jt5bga4kGq
	 OKhpmbgAL2HKG3bB5yrb9SZ/VbzsuBMFCmozU8NOuTrr0y2jwchdvw7jdW2CctRqp3
	 S/GD/eEJunsh/ML+tDg2FdDW5jK04NxGeCWDaXiOscpTPRtiutyjIjUOY1vM+G66cg
	 V30Bvp7Y6aDZQTLFWLNVXyDpsn1NDUyubpl65S1whSV4XCav8WnrIjNrG52O9/ntat
	 LjyH42+vpUMoTYmBxBxGZIbhDuM72KZ5+3W2gVGerZlQS5ImG12tpMjYG/wMVQZdnj
	 6rZ6IYCie8HjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for
 APSS debug block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:54:08 +0000
Message-Id: <20260922105409.09B651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: empty port@2 in funnel@12080000 violates OF graph rules
--

commit 48f77584a29ad03f77385cb8599896371e32bbd1
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. This patch adds device tree nodes for
these devices to enable ETM trace, tying their power states to the CPU
cluster domains.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 4e35254cdd11a..370b6bba2594f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi

[ ... ]

> @@ -8433,6 +8645,678 @@ ddr_funnel1_out: endpoint {
>  			};
>  		};
> =20
> +		funnel@12080000 {
> +			compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg =3D <0x0 0x12080000 0x0 0x1000>;

[ ... ]

> +			in-ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;

[ ... ]

> +				port@2 {
> +					reg =3D <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint =3D <&ncc2_etf_out>;
> +					};
> +				};
> +			};

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qc=
om/purwa.dtsi
> index 4348dd3d1dc59..90069c8e1d400 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -8,7 +8,15 @@
> =20
>  #include <dt-bindings/clock/qcom,x1p42100-videocc.h>
> =20
> +/delete-node/ &apss_funnel_in2;

[Severity: Low]
Does this deletion violate the OF graph bindings? By deleting the
apss_funnel_in2 endpoint node here, its parent node port@2 in funnel@120800=
00
(defined in hamoa.dtsi) is left as an empty shell containing only reg =3D <=
2>.

OF graph rules require port nodes to have at least one endpoint child. Leav=
ing
an empty port triggers a dtc compilation warning (graph port node has no
endpoint children) during make dtbs_check.

Could we assign a label directly to port@2 in hamoa.dtsi so that the entire
port node can be deleted here in purwa.dtsi instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add-etm-de=
vices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com?part=
=3D1
