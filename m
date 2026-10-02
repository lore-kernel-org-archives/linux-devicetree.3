Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B04746AE
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932447; cv=none; b=BiXHOSjjFW5F7SCdK3US2xZZxngMMBlUQ81X6uVhhrg/Lqjk6+nn2nkG2Lxyrrv8jU3V/JV8qcJbzKXE9B7w+X7QydPqVn3GDjUdA7OvEj9yK7Ii8d5LN6PTuHLNwZLWM10696SwoSFqN7cfkQbjMHPousmEj/LJgk09EIiedLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932447; c=relaxed/simple;
	bh=YNk+jar+Jtg/BWbUoc2u8LKT+VuMmFo4F+QZgHpGoS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b/m9kHKO0j4rRF62QcTjEJtCICl6yzfpSSwvDfI7P1XCBSFV0YJs1NtqjTwqmHazYFA9wqUNU+fwsspX13YUVefBJn8DfOFP4PeGFdHVLmSrPzo98nPm6weHxGN0IgM1LIVdCEZ+eV5VOXfPCVc6GH/XhzzFOHDUverU0c1qLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jqan8cn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jqan8cn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7881F00893;
	Fri,  2 Oct 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932446;
	bh=yWgZUjUbipe+bAv/bGFp4JDbx1qmmDuHbh8ZsYgYjJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jqan8cn+FiYNjKiMAZROmKKokL6sqEY8y9dmmW2vcL4WbajP+4J07yfnj0o0YgMYl
	 Adk8S702fBBdJ+mS06nxN+w7w7VzuXdBxXaHZSR1tmi4F5fHnEmMd6rRvaDkmjZQ/Z
	 kB5wfKQydLdyakeDjiArxzpkQbnmLTgVfqJc24bxepiz0ULMJcwi1PRllilfEkFWtd
	 0ti2Xm3vkXlfvRwAoQ4HnN8s/FOUMf5TAOuOxnfaXArTt++F70/FkZqGIb54MsDNEq
	 j2uwKKxdI4bPAAuc/wPu8rxkIzFE0U3pPThGfkStFSyELuPM2gWpENlIhxo9ei4Pk2
	 muWQHcT3R+eNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add SDM632
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-sdm632-rpmpd-v3-5-95c47d0f26cf@mainlining.org>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-5-95c47d0f26cf@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:05 +0000
Message-Id: <20261002091405.CD7881F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: remoteproc: msm8953 device trees lack newly required =
mss-supply
--

commit 9361957c0df3f4f2db804dba4f7e53e9096f9d42
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add SDM632

This commit updates the dt-bindings for the MSM8916 MSS PIL to include
SDM632. It adjusts the schemas because SDM632 is similar to MSM8953 but
uses a power domain for the mss-supply instead of a regulator.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-ms=
s-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-=
pil.yaml
> index 4049157dd83d7..049191cad5f83 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.y=
aml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.y=
aml

[ ... ]

> @@ -287,6 +289,7 @@ allOf:
>                - qcom,msm8917-mss-pil
>                - qcom,msm8937-mss-pil
>                - qcom,msm8940-mss-pil
> +              - qcom,msm8953-mss-pil
>                - qcom,msm8974-mss-pil
>      then:
>        required:
>          - mss-supply

[Severity: High]
Does making mss-supply a required property for msm8953 break existing
device trees?

Looking at existing in-tree device trees for msm8953, such as
arch/arm64/boot/dts/qcom/msm8953.dtsi, the mpss node uses the compatible
string but does not provide an mss-supply property:

		mpss: remoteproc@4080000 {
			compatible =3D "qcom,msm8953-mss-pil";
			...
			power-domains =3D <&rpmpd MSM8953_VDDCX>,
					<&rpmpd MSM8953_VDDMX>;
			power-domain-names =3D "cx", "mx";

Earlier patches in this series removed the MSM8953_VDDMD power domain and
updated the driver to request an mss regulator, but the mss-supply
property was not actually added to the msm8953 device tree nodes.

Because the property is missing from the device tree nodes, merging this
series will cause schema validation to fail for all msm8953 boards.

Furthermore, at runtime, the qcom_q6v5_mss driver will silently receive a
dummy regulator for mss. Since the actual hardware regulator is never
enabled, will this cause the modem to silently fail to boot on msm8953
devices?

This issue does not appear to be resolved by any subsequent patches in the
series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-sdm632-rpm=
pd-v3-0-95c47d0f26cf@mainlining.org?part=3D5
