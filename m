Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9ED3112AD
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713697; cv=none; b=V0OOXvIEgDwagCD1m8FjNrY7E61RJ2KgBn3774somUDqMVVCsoEuUTi5omRWuG7YRoFV87PbdaruoOOO7UNChb3AxTgsJq74DZTA4XQZjXhBWRt1/tamV6pSUeiRvv1jVcRNJN1cPWZA7nhRy1XIhxSlGHsBZV6+FA19kqhoYL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713697; c=relaxed/simple;
	bh=vsR4UbnCI9AGZDnX38TlL40KFTg9AVrmRGfDTPvz2/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YilYVCFWF8vk7RbLLkJ2cs6WqSqQ6x89T0CHQ5xDyUxnMFvYeRxlmVeXN0LtB6lwSq25uDZA9d0atsFCSIJWQeYmsjyXbfsFejTXxflOYPHKjdjtfgh/O2ufdbE4h8/7tCAwosj/NlFtp2AHNgJjUq450wYq5SkL8Xuj8jv3jFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJVgJwfi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJVgJwfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF31A1F000E9;
	Mon, 25 May 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779713695;
	bh=pZHyJhIzowN9JQ+wjodL1pcq9SPVb2WzACuS54STROE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lJVgJwfiIwgLJqHhamveNjHmHXTpTcPRhsbCVlHQItSWTurocr/Om7xVQmmE/LATz
	 tXa4l5ZDGNfCFpjidCmT0k8GDH/teYolSX/Hm9JMQT61/3Ly/uG9Dq4fcQIQ+ISbt6
	 ZW+ijsTny2A4aCOlFw+kptS6nzupjN/Ar4t3lvh+F0BOn0f5wQcDAVYq4w1DGro2UT
	 6HXiefyA3GnQaVmDBxiaXxUZL7jR5wtOpIVQqui1y8hF2IuNeTiL57cF4foDP6COFu
	 ik8vTFJll+VRjjMjyune7yzjz7tKssZP7XWlvb3kDI+a3JKgehfVvsuDRlMTQqNJ4+
	 TT2X/a9fealtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:54:54 +0000
Message-Id: <20260525125455.AF31A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `samsung,acpm-ipc` property is missing from the `required` l=
ist despite being functionally mandatory for device operation.
--

commit f4129715b1366153f8c291ba713ab0836fdf5768
Author: Tudor Ambarus <tudor.ambarus@linaro.org>

dt-bindings: thermal: Add Google GS101 TMU

Document the Thermal Management Unit found on the Google GS101 SoC.
This hardware uses a hybrid control model where the Application Processor
delegates high-level functional tasks to the ACPM firmware via IPC.

> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-t=
op.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.ya=
ml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml

[ ... ]

> +  samsung,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the ACPM IPC node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - "#thermal-sensor-cells"

[Severity: Medium]
Since the commit message and binding description indicate that the
Application Processor relies entirely on the ACPM firmware for all
functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
required list?

Without it, incomplete device tree nodes might silently pass schema
validation.

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-acpm-tmu-v=
5-0-85fde739752e@linaro.org?part=3D1
