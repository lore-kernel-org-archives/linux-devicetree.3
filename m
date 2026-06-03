Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40829D270
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493448; cv=none; b=e6q2Ejdma3VvcncIyhZ9ZlWvqHvERxnBaN+yvskyQ/TH7FsShOBySoagYMMqU+rI0VBmlji/U9zuejieDSh2NvnAeXuajw/sK4alEULgq1wamNmtOBAq3MbDuh3iZWKezEwB2GJYsP3VrgstGGEihkJHGbm7IUnLMMeLh/F3y38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493448; c=relaxed/simple;
	bh=qI22sjUQH5m2nH3ahcf0Y6NJaScRRKCmxGewyd4n7JA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KI6p3tmeFSAQJlN0+bViLpmNYCYb4yCzH0Qm4MIDZOqHmFPK0Zs+CedxsgSoF+CWl6dzRB5J868B8eRAM6IAJHySoD8BckEKKeZ8CNhap3jXU7WFZHniGcrL5/bt4OTa6kjZDzCusGMv8gyc5jNsL5n5dEUcqEyXkhAmFzn0svM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJh8GMvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJh8GMvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C231F00893;
	Wed,  3 Jun 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493445;
	bh=Epmbwf7aLVA8tZT/3ChpI9BYpmvYlVd9Anbxx5WSqS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJh8GMvC8K36JHIxNz7VvYjextwlLTLwOx5I/TdOf76El2d5JDvjczyQKyP0KNJuD
	 pYaWThRzcMLEdgMRUC35QZIS98ztD5W2i6p6v5lxx57krsdUfQwph1KfFmzwpFQlHr
	 PGJfrzmQYJmG+XPIMW7yRBBj2fVqaPjVy2FunsCQ14+MgUnEh5XEJ6qMc+y2GcHf1L
	 G+KEu05olVHnYLJHICixyhuSZq2WdIJ2XDHxYmmwOUTvmaGs0wqsjnxB7nR3o+yTHH
	 DU/0QYlEqfhJbkegTyp6c512heRUdLz/yh+SSkP19ogkLRcCCd3+cN3bZY3R1cSmNa
	 TP5njBtv51wtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:30:45 +0000
Message-Id: <20260603133045.91C231F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The multi-paragraph 'description' property uses a plain scalar inst=
ead of a block scalar, which will cause a fatal YAML parsing error.
--

commit 06fc30400124edc9c117ec855478708d26e9b289
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

dt-bindings: thermal: Add Google GS101 TMU

This commit adds device tree bindings for the Thermal Management Unit (TMU)
found on the Google GS101 SoC. The hardware is managed in a hybrid fashion
shared between the Application Processor (AP) and the ACPM firmware.

> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-t=
op.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.ya=
ml
> new file mode 100644
> index 0000000000000..75560ebca48d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
[ ... ]
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
> +  based platforms (such as Google GS101 and Exynos850). It supports
> +  both direct register-level access and firmware-mediated management
> +  via the ACPM (Alive Clock and Power Manager) firmware.
> +
> +  On these platforms, the hardware is managed in a hybrid fashion. The

[Severity: Low]
Is this description block missing a block scalar indicator like '|' or '>'?

In YAML, plain scalars cannot contain empty lines. The empty line between t=
he
first and second paragraphs terminates the plain scalar. The YAML parser wi=
ll
then attempt to parse the next paragraph as a new dictionary key, leading t=
o a
syntax error during make dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-acpm-tmu-v=
8-0-0f1810a356e6@linaro.org?part=3D1
