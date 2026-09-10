Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A043812F1
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053931; cv=none; b=Tdux6lLSCWJc5V6ll5CO/5RFPQR0OvW/76ZHzgTOLm2DP5BqC5Hc94FKwVVoZ+BMsr+nfXzC8EwENSBpdet7Z0CVRG3DEFEY8cNJcMWaE2NU8VV+6ifbyXsqVCNskAx9AalE/tz5IZ3yDL8d0ke+n6GL0ftkQZFoZUE9gvsWO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053931; c=relaxed/simple;
	bh=ue2XwvaaY1BH6h4BrDRWdNVMFgA+Lt2DPWtE0/QcRy8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lUE7Pjt3od1sTP1QpnLYKrg7nhB4RZFOzj9sgehMOyZhu3SBLfsDukqgUcjumHS/Wqerf07i1cb9aoVDzn4qL28E/JnNPhz988t1rKp1vfDeOrmC8ZebRyT60RFTam2vKgaIK50Pw8UKHC9eLp/RtUcdPGWnifs9MZ6R05Q6GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5usHDjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5usHDjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68671F00893;
	Thu, 10 Sep 2026 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789053929;
	bh=k8oIduNzxtiP2psQ2O+uzIaC1ODw+uGNdc9SwAer/o8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5usHDjMKLdho5qG1iq5dZW04lKiMuLm0Wz3XFABqPwcVxLHfm7hfEWSDarqxwJS/
	 jnKebbX9b45h9SnlKsjxJSY0Z3OMwcZq7YLycPadzF1MCfj3qa33rLNK5VtzjzytJ3
	 yjCeh+9bP7tp4+9qxakJ+twfEP/WOfnFP3tw0hiN0qQ6FuHwxOaQBOk0Z5cCJrzTJP
	 jboC7b2IiKDMP7SsqC06w9bKun6gcpde16OH3GxI0PRaTlW+sHEDyPc7EIBMZlu8Q5
	 SZ3LjUYcARBUkKgwI0LjHecJFY2WXVsyk3XevcQ6Lb0zXmhXiMAVqQ30ptP3B1WgQp
	 2KmaRA4gHAPgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: st: add TAMP backup register in
 stm32mp251.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-5-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
 <20260910-upstream_tamp_nvram_dts_part-v1-5-e2bca58a65f4@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 15:25:28 +0000
Message-Id: <20260910152528.B68671F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Schema Violation: additionalProperties not allowed in syscon node
- [Low] Undocumented DT Binding: st,stm32mp25-tamp-nvram
--

commit d9b7574bfcac6134021b52991b2d481d5704a393
Author: Simeon Marijon <simeon.marijon@foss.st.com>

arm64: dts: st: add TAMP backup register in stm32mp251.dtsi
   =20
TAMP backup registers allow information sharing between different
software components/execution levels. They are described individually
as nvmem cells.

> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts=
/st/stm32mp251.dtsi
> index 9c63fdb5a885a..aa7ae8b6fd21c 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -2118,6 +2118,36 @@ rtc: rtc@46000000 {
>  			status =3D "disabled";
>  		};
> =20
> +		tamp: tamp@46010000 {
> +			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x46010000 0x400>;
> +			ranges;
> +
> +			nvram: nvram@46010100 {

[Severity: Low]
Does this configuration trigger warnings during dtbs_check?

The parent schema Documentation/devicetree/bindings/arm/stm32/st,stm32-sysc=
on.yaml
(which binds to st,stm32-tamp) strictly enforces additionalProperties: false
without defining #address-cells, #size-cells, ranges, or any child nodes.

> +				compatible =3D "st,stm32mp25-tamp-nvram";

[Severity: Low]
Is this compatible string missing its corresponding YAML binding document?

All new DT hardware bindings must be documented to avoid schema validation
warnings during dtbs_check.

> +				reg =3D <0x46010100 0x200>;
> +				nvmem-layout {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-upstream_t=
amp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com?part=3D5
