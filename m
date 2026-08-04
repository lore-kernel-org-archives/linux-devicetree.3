Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCB329BDAA
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843867; cv=none; b=kWz7dxRtMg8nrqhdgGVK2ZgAen1QbCHyHr3HWZHxPe8KuqLu7ZxF+7E0Gv2HMv7Sa8ATZELjnFdycGy+T12IeodNQyNjHYUs4yCsQaWNe9aoGftEwk4MsRQ/3eNA90D6sJjvcEIP4QLsKfskqjD9akDulnGmlKNUClBTkiZCRJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843867; c=relaxed/simple;
	bh=CgoJUC7Vk+GcE4ChY8fxsDZQgISjCZvs3Z3KUgAt0+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ltGAtP2dCYcxu2yIJm0xgD2IRTZF0zMjJE7t0RFbtaTUOgFCmSnA91L538nSezGDbVG/GeMpaYXOxWRFobhrEWiF1iuqeq3Pm3U7So6Sey9WSiXhyLYfNLnibtK0yRUAwzxAnAqOij5rA6JlR/5KgA8GTuGS/JRnhKCy3dlUTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXkWIrNJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXkWIrNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E591F000E9;
	Tue,  4 Aug 2026 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785843865;
	bh=WofccqT2qapL5ltjIKijxWgOKhvPjQtPJY+1WlPS7rs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QXkWIrNJEKBkOz6JI9qH5FZPya9ygWCeJk/ho9w+C4x+1p2Mcr9jApD8MAV3lFPZM
	 LmRhTyaFjdlyWW7ztG6hTo3DEFuAh+dkjYkDopGdf7b/neyZskXhRx0/g1V6AilTV/
	 bWW3DN+TpA0UyrHCQbnJe2fKkVdGnGha6u050AzTjZekDe4JczMnj1nqjhpQwUzpqt
	 OdC0VXRVTa97/d7h7yLPUcUo3Mb0HQquUB8APCeXpj/CHaSaNesGWIs2ddRv7TBpGB
	 zdIl7GagtIQUGCm8hct1arZIOm5QT3atuQF4kb9MNhRyEyUQBlyHygnEEpnTz5JB44
	 JfNFB4yTejyTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put
 cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804113338.261782-3-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-3-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:44:24 +0000
Message-Id: <20260804114425.37E591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `DEFINE_FREE(nvmem_cell_put, ...)` macro is missing from the `C=
ONFIG_NVMEM=3Dn` fallback block, causing compilation failures for drivers u=
sing it without NVMEM enabled.
--

--- Patch [2]: [PATCH v5 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put c=
leanup ---
commit 2ebca04f3e1ae39d3b1c1039e736c5e4b6555c85
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: add DEFINE_FREE for nvmem_cell_put cleanup

Add cleanup.h helper for nvmem_cell_put() to enable automatic resource
cleanup using __free(nvmem_cell_put) annotation.

> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consume=
r.h
> index 34c0e58dfa266..35a2ea8b8957b 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
[ ... ]
> @@ -54,6 +55,9 @@ struct nvmem_cell *nvmem_cell_get(struct device *dev, c=
onst char *id);
>  struct nvmem_cell *devm_nvmem_cell_get(struct device *dev, const char *i=
d);
>  void nvmem_cell_put(struct nvmem_cell *cell);
>  void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
> +
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)=
) nvmem_cell_put(_T))
> +

[Severity: Low]
Will this cause compilation failures for drivers using the cleanup when
CONFIG_NVMEM is disabled?

Since this macro is defined exclusively inside the #if IS_ENABLED(CONFIG_NV=
MEM)
block, it appears to be missing from the fallback #else block. Moving it
outside the #if / #else blocks would make it universally available and prev=
ent
build issues when drivers use __free(nvmem_cell_put) without NVMEM enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D2
