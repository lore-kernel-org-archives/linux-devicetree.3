Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3235DA67
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426085; cv=none; b=T9gPr/1LYU2HKVEzgqeK0kCpYoFE3DzGV0K2pZUmiFI2oYASdyt1HGRZG6PEynUB6vArffaYTMmgJGf7BDvUgSxXB4uHXu7/2S0EJe1/VAUsJjP91r6/yBRL4/zjQOHgRRACiYWxtA3WGx6Z+ljbZ5b9vxmZQ1J8jiM5ZvCY5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426085; c=relaxed/simple;
	bh=k12JH1cD8UVOkSEsjO3ICiWD1mNBBlfoD/Xo02/1ufA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ujzV2hlAmSB9dXAhJ77LyduInClcJmV0RZWFa1UByoRGuduQi58EZ0EtXynqFoTkS5/+uwZhCxQ2kRX2MA8y0Jz0FRtkixt8556opb7UPkcgqVRUtKxkwiD/dZ2oMctmxzPPXErMbUOddiH/WN2dARfioKAylwIJ/7YHKsZQjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbl/F3H6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbl/F3H6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660D81F00A3A;
	Thu, 30 Jul 2026 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426083;
	bh=xGqIW1FyDsE3kxo0+X5YCf2Y8IddYb6sY+2B6V2tsP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbl/F3H6JpZA9OtU8DawLPud678uHB8huQIbulNNsfmK3LPeCf66qxBxnl0F0kore
	 86Pqt3FZdyQYBF8Wt38/ry6/WddfWiIun7klYXyOvqGuJLXKi3tQygtV4c9JI4lg2Z
	 JY0L54rYsYN8uivzgQZaJiF7BRKyhenTG3ozOZtsMgifCIhVEaZYQjUW6ZA5AUUEmY
	 XGyzqZWZ/9CW8Nu69cgxoWp9HDMnXyVUWZf6upl5SVC1Hfdrc7fue+glmpUgbl9LD6
	 4eLEaRTJFj7/RAH3ZWRpujNB/7hfISpX2XvzavJOcg6Vu4PGLnY6z5+NRjPreIHuCe
	 o7cjhkjpzhpLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/18] media: iris: Add framework support for
 AR50_LITE video core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-11-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-11-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:41:22 +0000
Message-Id: <20260730154123.660D81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failed power domain enables or already-active domains leak the PM =
runtime usage counter and inappropriately abort initialization due to impro=
per handling of `pm_runtime_get_sync()` return values.
--

--- Patch [11]: [PATCH v8 11/18] media: iris: Add framework support for AR5=
0_LITE video core ---
commit cfd8ed53c04ddb4ea2cea6f16627a62b8400f868
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add framework support for AR50_LITE video core

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers=
/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 0000000000000..e084a5b49f2e3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
[ ... ]
> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but since
iris_enable_power_domains() returns the raw value of pm_runtime_get_sync(),
does this incorrectly abort initialization if the domain is already active?

pm_runtime_get_sync() returns 1 when the device is already active. Treating
any non-zero return value as a failure causes this to return 1 and abort
the power-on sequence.

Also, if pm_runtime_get_sync() fails (returns < 0) or returns 1, the usage
counter is left incremented. Could this leak the PM runtime reference since
the error path doesn't call pm_runtime_put_noidle()? Using
pm_runtime_resume_and_get() instead of pm_runtime_get_sync() in the wrapper
would avoid both issues.

[ ... ]
> +static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this share the same
pm_runtime_get_sync() return value mismatch and reference leak as seen in
iris_vpu_ar50lt_power_on_controller() above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D11
