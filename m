Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155E3AE197
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139468; cv=none; b=NOEPsZ/riupe822zWPLe3DAL7RYOEIgBJRotE5PJSbIpLuDe4NJMxINtXbx6fNpCfCn5TciKziFXssVuuHyB09uO39NKSNHOMqTZ2JkiRwUvTO1dN2npHrjtzo1Lu+srRRmXx6arB9tXHbg8YNIjeP6bRZ9lDcNBQT6T1FoZjwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139468; c=relaxed/simple;
	bh=BbCFN9X3tVFmL9714apIwjxHJmOBA2GOaZvupJhdb+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fP8R+ie2tXq260tnuRn6iFgxwrGXAF7wo0qayG1yUaD01HfC+tSAPSfcx3P7FJW/MGGGZhVhpYPqYAmJvohuSGCJyF/E7H5dW9eyf5HaiO7Yb9lfHj/xb21zqVsz0RC8jftdtWOkD+BvnNWsTd8VxEtaxFyIhPVV5ReVrRrMlnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlozX66v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlozX66v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0459C1F000E9;
	Mon, 27 Jul 2026 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139467;
	bh=PWF73KX/iHyYFyMelBtdHrEheoarQWpcRddXVu5ppe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AlozX66vXsykWQ2BKU8jtx8YPCfsb1U3ONj21gLNhc/1PhSQMyZpS5EYGQSVvexad
	 NCjf3U+/6zr63CZaj5Hnvfbn5wMJ4tWNdBEVnnIXtJvHNpr4SVl2G70z260xLOC6Hh
	 62CKveku3pBEbqR8t+pg55rXduGVdVgUrfNIdRIka5C9nc6zxDW6WEPtOdsAKgz+pv
	 pv68LIux5F0RguPf4cwlMDkCyhTE7OYNEpVz4wsCkSJYnhP7lM8t3E9Du58/1fz7zW
	 MpaSuITDGKzeOvFIC6pBv4R3TSV6gWZfFTyrVJV3/bSBNqcE3Pka0wvAK5cAI6CvSr
	 Nqv07An7+UoTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/34] pinctrl: airoha: move common definitions to
 the separate header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-20-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-20-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:04:26 +0000
Message-Id: <20260727080427.0459C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit states its intent to move GPIO related register addresse=
s to `airoha-common.h`, but it only copied them, failing to delete the orig=
inal macro definitions from `pinctrl-airoha.c`.
--

--- Patch [19]: [PATCH v7 19/34] pinctrl: airoha: move common definitions t=
o the separate header ---
commit e0116c883a65c06680c853edf3abcd0498eff60d
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: move common definitions to the separate header

Let's move the SoC independent definitions and declarations of structures
required for Airoha SoC-specific pinctrl drivers to a common header. Later
we'll have several SoC-specific drivers, so this step is necessary.

Also move GPIO related register addresses. It's not changed across en7523/
an7581/an7583 chips and will be used by common gpio code.

> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> new file mode 100644
> index 0000000000000..40d7e515c09eb
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/airoha-common.h
[ ... ]
> +/* GPIOs */
> +#define REG_GPIO_CTRL				0x0000
> +#define REG_GPIO_DATA				0x0004
> +#define REG_GPIO_INT				0x0008
> +#define REG_GPIO_INT_EDGE			0x000c
> +#define REG_GPIO_INT_LEVEL			0x0010
> +#define REG_GPIO_OE				0x0014
> +#define REG_GPIO_CTRL1				0x0020
> +#define REG_GPIO_CTRL2				0x0060
> +#define REG_GPIO_CTRL3				0x0064

[ ... ]

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6d4b282c21eaf..7cbedb370c977 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -230,6 +190,8 @@
>  #define REG_GPIO_INT_LEVEL			0x0010
>  #define REG_GPIO_OE				0x0014
>  #define REG_GPIO_CTRL1				0x0020
> +#define REG_GPIO_CTRL2				0x0060
> +#define REG_GPIO_CTRL3				0x0064

[Severity: Low]
The commit message mentions moving the GPIO related register addresses to
airoha-common.h, but the original definitions were left in pinctrl-airoha.c.
Could these duplicate definitions be removed from pinctrl-airoha.c to
complete the move as stated in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D19
