Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1A3A453F
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050929; cv=none; b=MnaN1Mhg3pfXOVBhAjf0oFihnqr0jNrjrqOYkk3wNUHxQai8XzWv7h7dDKVBWSVRZs7EtqJ+ebND+rzQMdLU5tGm23YSLZd3HLE/7KZnSM+xc823H6quNlW6Kk+PFhUi10MozeTl8QPx4kJI5wPmiG/g8n8FhKn4jSkr713yWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050929; c=relaxed/simple;
	bh=5u+n29nvuG/EQ8LRu/b1QHoR2FAqkplhaaMNP54yHEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H3YqqdW5evWOI9ET+v5x8D2b3xK83Y/7Yziq1WI5I3cfdppy8OULg/ZFvx46HOOEVCeQFE0Sq6IIanmQMrefaXMIuKdXAy1ssnVOPclDq3Gypu+a5oCmO/ip+90amVw5dXeHWcLITalN1TApRoTIRRWGkls7JIafjo8N15eOU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV616sN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV616sN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425661F0089B;
	Sat,  3 Oct 2026 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050927;
	bh=+rinxShJm+h2NPxt9TSsXkHuS29vXsn7A7+92ovP2WQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lV616sN/FZkuJq3HIQAB8oQ1/dpVdNiOilQ3FWPoIozm1s0wpem57Q7SFEhvb+Bmu
	 +wZTK4vDLJBZAA0orjRrRzwAHQxTkfzGCqmhKC0J/4j6Nc3ELbnZMjotaIAF/iMQkF
	 X6hFFZy6sdt8XpMiiWDeUcPKmME2jaVsPak1DKY02F903GzLnm5SHIIzxWqlq6JFOG
	 UfLZUZsTM2MJkMlon+ZPzrXzC3VBRCytWIlKJxTJpEhMLympu6sg1qEAxuXEI6ksY/
	 C4MukYcmcCp/H+KgqeyFt8lfMrqitN2FHD2kk41NozS9/lzZgyoqFmnEKHP2kwAZ+k
	 N0FzB7/QjnRHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 18:08:46 +0000
Message-Id: <20261003180847.425661F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: missing qcom,non-secure-domain in ADSP fastrpc node
--

commit 0239f40f83c2c0077ff48ea5393d0b2751dd608a
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add adsp
   =20
This commit adds the Audio DSP (ADSP) node along with the SMP2P nodes
used to communicate with it on the SDM670. The sleep state is also
included to prevent crashes related to sensor processing.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index 5c60ea36f04a1..038ef0f73ea94 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi

[ ... ]

> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells =3D <1>;
>  		};
> =20
> +		adsp_pas: remoteproc@62400000 {

[ ... ]

> +				fastrpc {
> +					compatible =3D "qcom,fastrpc";
> +					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
> +					label =3D "adsp";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;

[Severity: Medium]
Is the `qcom,non-secure-domain` property missing here?

During probe, the driver checks for `qcom,non-secure-domain`. When it is
missing, the driver defaults `secure_dsp` to true, creating a=20
`/dev/fastrpc-adsp-secure` device node instead of the standard=20
`/dev/fastrpc-adsp`.

Does this break standard userspace audio and sensor applications that expect
the non-secure device node for standard ADSP compute tasks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003175659.2353=
6-1-mailingradian@gmail.com?part=3D7
