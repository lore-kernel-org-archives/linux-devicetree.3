Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864734;
	b=rdmX5N/nLeZapGClLFFVY3Um1E09VHS9sPjFn5jAZJHVZ1Uo41LgV/5K8DEgIwMW88Ys
	 a4RROBbLg1C0K0ckfryyoLPqagpQ1ofdm24Nm9U2s1b2IuRI9UeEtwYrTkGa7zF+5KF+0
	 TKcfHtSbPb4/TbGgLE4BQwJw62/qSNMS125EuDPGwGaSy/sSySqtpoBXOLjH36pBwwViN
	 x9zbqvtk3/RxaEM1aGtnFPB4rfXuQ1YmZ9ppRtprzAY2yelq3PVVvLHJ7zyDLcSbDQjVi
	 tV9LjAW/nX8aPP03+ayNceC9Oc1oo1Mem1F80pjy2V8aHkgFsrrVU6CxLhRG1k8Ohww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cP9/6MVBfJFhlJJYQD4xQQKeIhWc29way61CNUTPkGU=;
	b=sExiyzkDHeFQxp2J14cONDtHKyUQE3e2s0vd+GFWcZdKa0TXSaUNaOdEhlys9YY72yQ+
	 dryyv2FfaTgRhwAijgRXmTsKlJovbyqY8lhiGRn9mfW7bXGeWttmgWN97AL8eTXh8VvBv
	 8jKAult0dHB/ve95FAYMLX+Fh8KXk4cZgWGJRcoV1Iw705TxjVn6pH1iQfadxEFA903ms
	 ItzpMYwII/MJTvBCkNQkdTTQAb2wHQxCSDMEhnBJwsLJODHbnemMw6ulTypHQGr2FHWKu
	 HEjBLMl5Z19/ilNhSOLk/DE1pCyDfBJRDF+LFEL8Onfk+JN4x0/NLkqIfLegTfBPxhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZP2JmoT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D81606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZP2JmoT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D6B1F000C4;
	Mon, 16 Nov 2026 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864733;
	bh=cP9/6MVBfJFhlJJYQD4xQQKeIhWc29way61CNUTPkGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZP2JmoTau7o8t0EdSIjlPXlf1zybUk6CYiQ7QFsrbl6LM1dAzIkfPOiB/NF9mzCf
	 crolL/hXw6RJJG55mWlbAmvYh/NltiqzdvKu+h5AlNshYOho3hbA4UwdmtqE18Qnzs
	 o3RfSUKxzWGo6C2MsQ2mqcfU7DlKEhZvciPiimsWg7/GJqU800MvNgunbrgNZdhBlk
	 2tmQqjPALMcDJRFPYiRq4AG1SBYjuamryXZG4+PmwInwZ6IQFL4A65RTiANjNQx6/c
	 0Iab0zdJFpX4+uhG0iJUbMsrmWj4Q+YjjuxTP+oJe+J2+ZVx+HvgsIncmPzyNq2jpN
	 IPMX+obIt0CuA==
Message-ID: <sashiko-outbox-217729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-halliday-cpufreq-v2-2-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
 <20261116-halliday-cpufreq-v2-2-e518cc055457@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:32:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] cpufreq: dt-platdev: undocumented DT compatible string
  qcom,halliday
--

commit 4e273fe3306a2bb3a253890da522236eca532a54
Author: Stanislav Aleksandrov <lightofmysoul@gmail.com>

cpufreq: dt-platdev: Add Halliday to blocklist

This commit adds "qcom,halliday" to the cpufreq-dt-platdev blocklist so
that the platform uses the qcom-cpufreq-hw driver instead.

> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufr=
eq-dt-platdev.c
> index bce4c87573a18..3d5709eaa08fe 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initco=
nst =3D {
>  	{ .compatible =3D "nvidia,tegra234", },
> =20
>  	{ .compatible =3D "qcom,apq8096", },
> +	{ .compatible =3D "qcom,halliday", },

[Severity: Low]
Should "qcom,halliday" be documented in
Documentation/devicetree/bindings/arm/qcom.yaml before adding it to
blocklist[]?

Commit "dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ
hardware" documents "qcom,halliday-cpufreq-epss", but the root SoC
compatible string "qcom,halliday" is not yet documented in the
Devicetree bindings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-c=
pufreq-v2-0-e518cc055457@gmail.com?part=3D2
