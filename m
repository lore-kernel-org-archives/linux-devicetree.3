Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F58403B13
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542581; cv=none; b=BjnnXz8mRa5taq+VrfnsuLRXaupnZjMvjDiglI7gbqPFyLvjHVmXo/WmEc6UONpaS5wfmP6LMXHG+1d8NJO1Pne2JZeeYwy4ajj3hty/hlT086rPBA1sbQn3WV9elRFwSTbS8rtglhwFuIHRICtPGv31kRaDpz7ViS3saW+1jTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542581; c=relaxed/simple;
	bh=40fmoPcZVvhJRigsCb2z1NANECk++9ltSDzfOIXAmY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VEK6kstirYxsbYZqq/n60/KXlYsAUE8htdZ7cYta5olKs6I4G7bivfLJ+f4g/ARnUWFYLR3nV4S8FpvZTXtxZawo0fuwXkttk0XI+eXle+6yOWHdOVhPX03ABKkP7sY9YF0jVi2jLnENRqQpbUxDychJZbo4wU19P20AZ2adLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glQzl14O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glQzl14O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC8B1F000E9;
	Mon, 15 Jun 2026 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542579;
	bh=KLiA/UkOX7Z1rCYbJt6n7VeCh33ve9hYdqtm9vSO8AY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glQzl14Ox6Dv8J7lczYikQHc8KzsbbQmQFHewAaqtYZ/l2XiWp6x5HjCzMHKBkIa6
	 IllxZXEp5k1JfvgT8FAYcJ8twilFh7x2R0VJRK21y1X9zQe0bx4OestQ2tdoUiGfyL
	 fDVEMC8qRk0BpyP5yHX32Ibq51rVPXrI7Oy5i9nhOIumZd48IXzOSABS8xyR06s2yk
	 uaRzZGOugPI7/j+sQEQnk555OgMgdGcv3O2z0jutLW55xbK+U4mDMQGYL/X1oGWDAj
	 JkCwt20hSwzIv8bUecZ/nds7CHuS3h62zoKFZDobnRZCZYB8PDP8vIEVFwzfKJk3vC
	 CgtANAHsh3fRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-2-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-2-eeb6e9fa7581@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 16:56:05 +0000
Message-Id: <20260615165606.ABC8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The L1 data cache size for the Cortex-A520 cores (cpu0 and cpu1)=
 is incorrectly set to 64KB (`<65536>`) instead of 32KB (`<32768>`).
--

commit e69e8fc4f3866077641d02b02b7f11554b632507
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650: add CPU cache size properties

This commit adds L1, L2, and L3 cache size and line size properties to the
CPU and cache nodes in the sm8650 device tree. It splits the unified L1
cache properties into instruction and data cache sizes based on clidr_el1.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index e8e43ddc3032a..090a4739ebc1d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -75,6 +75,11 @@ cpu0: cpu@0 {
>  			compatible =3D "arm,cortex-a520";
>  			reg =3D <0 0>;
> =20
> +			i-cache-size =3D <65536>;
> +			i-cache-line-size =3D <64>;
> +			d-cache-size =3D <65536>;

[Severity: Medium]
Is the d-cache-size for the Cortex-A520 correct here?=20

According to the ARM Cortex-A520 Technical Reference Manual, the L1 data ca=
che
is strictly fixed at 32KB (<32768>), even though the instruction cache can =
be
configured to 32KB or 64KB.=20

This misrepresentation of the hardware topology could potentially lead to
suboptimal scheduling decisions or misguide userspace optimization algorith=
ms.

> +			d-cache-line-size =3D <64>;
> +
>  			clocks =3D <&cpufreq_hw 0>;

[ ... ]

> @@ -117,6 +126,11 @@ cpu1: cpu@100 {
>  			compatible =3D "arm,cortex-a520";
>  			reg =3D <0 0x100>;
> =20
> +			i-cache-size =3D <65536>;
> +			i-cache-line-size =3D <64>;
> +			d-cache-size =3D <65536>;

[Severity: Medium]
Does this node also need to be updated to <32768> for the 32KB fixed L1 data
cache on the Cortex-A520, similar to cpu0?

> +			d-cache-line-size =3D <64>;
> +
>  			clocks =3D <&cpufreq_hw 0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-topic-sm86=
50-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org?part=3D2
