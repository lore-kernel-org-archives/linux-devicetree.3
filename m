Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE24363C53
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014274; cv=none; b=gJ332zhfynJ7JcLGzZ2xGHVSKQfNcgeKMGGjY2BwFI09mL7zQ/1TEiC0qsMf1yZscorWn/JRyT5P7v5MoYtEVpR3FXfblUR8iD5JODMzaqVGNr6gAN/PzJrCoFs5sye1ZATeQ8c/ov5ONcRTghL5whCbyigA8j/FTOay6unGliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014274; c=relaxed/simple;
	bh=tGXRNw1xX7Rl4+njFnZPL7WNnHxLlP0oZIJQ0NUrD6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gc20ZFUetRsUpHQKg9ERF4cii3sxvFdDh3/qKezwgPHr9fOtsDn2R/iMnqHf7OaqsI/gHGhigAlAEuunFxZfoPI28EMMzFtJ///5Rahk3s045fAo13vQ+OQ47OrKAW/09MXJ85dUe+GOUWLSijlOLsP4U1T4tT0aXeJT7zW+xvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsUXGVuA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsUXGVuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24CA1F000E9;
	Thu,  2 Jul 2026 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014273;
	bh=ZsNdJ0n4r3jOc1wdUGLe+K9RJc3vqjAxyN9NJde7uVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VsUXGVuAg7Z49TpSJ7NiZeJB3wBcmh/ro62BpIHD+hNlcUl9eEd7+mTU+33jaaxqu
	 X6eo9Z0QzWFgg5HV1lnI0tQnn1N0v20iqb2bG7VF/TYboLKmlFPy8nUCq2cmZo6a42
	 5/OyMKaO+CyxwBuYVEu1K/c3CdtYS3pAwoZBnbWD6xesfMsK+0T/Lr/UT+Nlprv91F
	 PkxrpSsQIG+EduWweWpG+8oH38MA4LxOuGP4AvXVJM9Qilmr8nJHxvvCEjFpsBjwFW
	 pJtZBzJjri7Pp6gcshrVrMXl0+iogp/Ux23deLhcFuxB5ihz6smzqC+MrOKW7v2I4D
	 1RGzy65Co+2rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: power: Add common power limit
 controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-1-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-1-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:44:32 +0000
Message-Id: <20260702174432.D24CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] YAML formatting disruption due to missing block scalar indicator in=
 description
--

commit 10d28ed72d993f07d4586a72f1c37a8d7f35d2eb
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

dt-bindings: power: Add common power limit controller schema

This commit adds a common device tree binding schema for power limit
controller devices. It defines the base properties and node naming pattern
for hardware blocks that enforce power consumption limits on SoC power doma=
ins.

> diff --git a/Documentation/devicetree/bindings/power/limits/power-limit-c=
ontroller.yaml b/Documentation/devicetree/bindings/power/limits/power-limit=
-controller.yaml
> new file mode 100644
> index 0000000000000..a00548fdc79e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/limits/power-limit-controll=
er.yaml
[ ... ]
> +maintainers:
> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +description:

[Severity: Low]
Should this description field include a block scalar indicator (like | or >=
)?=20

Without it, the YAML parser will treat the multi-paragraph text as a plain
scalar. This will fold the adjacent lines and the bulleted list below into a
single run-on sentence, which disrupts the formatting in the generated
documentation.

> +  Power limit controllers are hardware blocks that enforce power consump=
tion
> +  limits on SoC power domains to prevent thermal overload, maintain syst=
em
> +  stability, and comply with platform power budgets.
> +
> +  These controllers typically provide
> +    - Hardware-enforced power capping for one or more power domains
> +    - Configurable power limits (e.g., sustained, burst, peak)
> +    - Time window controls for power averaging
> +    - Energy or power monitoring and reporting capabilities
> +    - Power balancing algorithms across domains

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-qcom_spel_=
driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com?part=3D1
