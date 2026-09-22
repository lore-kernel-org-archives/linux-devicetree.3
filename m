Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360773E8C78
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064824; cv=none; b=CYl9BY7egKotrRxRU+p/gvIAl5IDXeq/2iFy5oXHaautJUbswr1AQmhCKoLNIWnfg7jQ5eFb6GygHJhackP+CACRQNDMNkDm81p84olTQh7OJ84YhZjEmfmN5/EF2F8owY9SodspFCfgq1SUwI2QoLplqqCtGOO3rJkNeVmY/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064824; c=relaxed/simple;
	bh=KAo3wyIpDnfTx9jMJY3gXy5m0TMW6WPm2yb96FDCnYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KhlVQP1QOlG3oc3ly0F5aB41pATfssbK67LJwZpKoNBRvZbB+0uIcCXObMYhAjqLaVU+IYAiBtS4jfiLC77lc721MHsnJx1fBw9SQcafv5c7LM1q8Bh3Se7CAN96xg4JfZkcA1jTURxdk+2F7xBOIjSA9ooHfLW/2KEzEygoiG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGI3dduX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGI3dduX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEB71F000FF;
	Tue, 22 Sep 2026 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790064822;
	bh=IsQLe31enaQSDdOEVLf5cl0EaDhQPbtBswlUYDtTxMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGI3dduXqTNK8wA8zh9nd091h0w4GZzyXuewyvCbGcvSjfeANGoLE7E2hlpj+fUXB
	 aJ4ObKbrwesDGPlJVsk6kjBqca+jJAYiVOwBihj9XXdoHBYd8lGf6hiCoiMnt6QDVP
	 h54Lbe5lD25dLkbIufiyeyqpTGihrkc5ymysl69kPSKJ5OHYqL4HjPkNSnDnQs9aEx
	 0uIWCGxVTPapWfzABAYEFF62m+avz4YVsUw+CZ8BM4MFQlobtIVsKc8azNAKDiYRd3
	 oDhyXJtKPjU7fWlH7F9M6Nj+9gCXaS18XTA8j5VoLDoHOrq68BRQiKZD/pHpxK1Ui3
	 m0l7rg8z2zoCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 08:13:42 +0000
Message-Id: <20260922081342.9BEB71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: qcom: missing status disabled on incomplete bwmon nodes
--

commit 2b4a55863dba14f87c025537e56ccb0a5f410f20
Author: Pushpendra Singh <pussin@qti.qualcomm.com>

arm64: dts: qcom: nord: Add bwmon node for Nord

Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
frequency scaling.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..9925e770dfa46 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -1460,6 +1460,73 @@ uart13: serial@a98000 {
>  			};
>  		};
> =20
> +		bwmon_cluster2: pmu@1014400 {
> +			reg =3D <0x0 0x01014400 0x0 0x600>;
> +			interrupts =3D <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 =3D <&bwmon_cluster_opp_table>;
> +		};

[Severity: Low]
Should this bwmon_cluster2 node include a status =3D "disabled" property?

Because this base node in arch/arm64/boot/dts/qcom/nord.dtsi is introduced
without a compatible property, it is enabled by default. Any board including
nord.dtsi without fully configuring this node will instantiate an incomplete
platform device and trigger dtbs_check schema validation errors.

> +
> +		bwmon_cluster1: pmu@1015400 {
> +			reg =3D <0x0 0x01015400 0x0 0x600>;
> +			interrupts =3D <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 =3D <&bwmon_cluster_opp_table>;
> +		};

[Severity: Low]
Does this bwmon_cluster1 node also need to be disabled by default for the
same reason?

> +
> +		bwmon_cluster0: pmu@1016400 {
> +			reg =3D <0x0 0x01016400 0x0 0x600>;
> +			interrupts =3D <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			operating-points-v2 =3D <&bwmon_cluster_opp_table>;

[Severity: Low]
And similarly for this bwmon_cluster0 node, should it have status =3D "disa=
bled"
to prevent incomplete instantiation when the variant-specific compatible
string is missing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922080416.4842=
80-1-shengchao.guo@oss.qualcomm.com?part=3D1
