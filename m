Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC802512DE
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993126; cv=none; b=QtJsq24n7xtaRricfQhQQzUL/2dMWbXVir4xMA8vAVLpmHncJ78Qz66JwE8/lnUzVp5+w9IR+6jb58BHNjBiznIfel+6PT6Yc6IbbkX9RwqP9f2jq5vkB1N7tNWcHNpuQSlteeQMy54CFmYVlMMf05V515VZYEfzUJVu5W8tm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993126; c=relaxed/simple;
	bh=CFC2SqI9+MqQMjueX1b2fywabLpUYeNmZdnUVse4tAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IpWN6567PcREPJSSuUjzf/1HaD2cywu/AnLZ+vqEMe+vNtrjiGo/ZPx5sD7NJanWiGoDuwFZOL0Tf48xQZQILFixBEsUUddpFsqpXb7ZHlbaJ690b+JZgQa508lCgvmxjE5y9adLXxxc+Ydy+VSlAEuoSfVfNqgwVAcDvbLKKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jjax+rvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jjax+rvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E671F000E9;
	Thu, 28 May 2026 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779993125;
	bh=yyjZM1c2m8E9PmRbZb1gSyqldmWnt49a4TaL8OgS9zU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jjax+rvtENiyfOW5eVDFldF+GVsUi5mYhEeTZCIwevav+s3crZLMVqojA0SjY91oJ
	 S14R+BYkCm0DhPdk9hhkkN2/JV+lo4I1+blVJQNkUCcqZG+t+CyB60C/R71b/2jFUT
	 xO5jPs/5e3oTA7ncVMyppFMl886MDTKqR9I/edb0yFLunHgJtdEGPsgaFu/TkKBVxy
	 8gcFpaYoHUUXX/jfdwMesobn7C4xvZ/IakEEEV3TZsiy/tGWMbfpqSKByCJ8cIr2ex
	 c47zdSnieqYkMM2zBKkgBwdCvZp4tujEJD1I5mkqaptECozYZ3/i2nMJXPFEmDFaMd
	 oL6OeJb+B2vRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: mediatek: common: permit to provide
 dedicated regmap for irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528174840.28644-4-ansuelsmth@gmail.com>
References: <20260528174840.28644-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:32:05 +0000
Message-Id: <20260528183205.65E671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Architectural Anti-Pattern: Adding a dynamically allocated per-dev=
ice pointer to a global static hardware description structure.
--

commit b0a6d4d7d0d69f71dca69402decc8e6c50ee4811
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: mediatek: common: permit to provide dedicated regmap for irq

This commit adds an extra entry in the irq_data struct to allow using a
specific regmap if defined. If it is not defined, the global AFE regmap is
used as a fallback.

> diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediate=
k/common/mtk-base-afe.h
> --- a/sound/soc/mediatek/common/mtk-base-afe.h
> +++ b/sound/soc/mediatek/common/mtk-base-afe.h
[ ... ]
> @@ -87,6 +87,8 @@ struct mtk_base_irq_data {
>  	int irq_clr_reg;
>  	int irq_clr_shift;
>  	int irq_status_shift;
> +
> +	struct regmap *regmap;

[Severity: High]
Does this change violate the Linux device model by adding a dynamically
allocated per-device pointer to a global static hardware description
structure?

If a devm-managed regmap is assigned to this global static array during
device probe, and the driver is unbound via sysfs, the devm framework will
free the regmap. This would leave a dangling pointer in the global irq_data
array.

Could this lead to a use-after-free if an interrupt handler directly access=
es
this global array to retrieve the regmap during teardown, or if multiple
device instances exist?

Would it be safer to place the instance-specific regmap pointer in
struct mtk_base_afe_irq instead, which is properly dynamically allocated per
device instance during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528174840.2864=
4-1-ansuelsmth@gmail.com?part=3D3
