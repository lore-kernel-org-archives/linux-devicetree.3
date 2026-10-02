Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65073A901F
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967352; cv=pass; b=HxIGm4fdNasN7e7MjdADCL2QMrqd7R7tZuBP8WkBuKZhjBuoXwBSzqxyCy/4Z0OpPGB3XuqO4ifQUNNQ7y1FAgiXbXFq1aJBIqI/IvN1LWG9A3h3sCChPK2MWle5NiZgJwUcfN88JPvv0kPCWnMY9nhwMbCpHnUEgz0U3BMe0Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967352; c=relaxed/simple;
	bh=OR38zRZFAFpy4mOZaFXDsm6BWL0amMVzyna9ToNEKKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVv8k+ANrPJhv/Tpl+knMZpaa1S3gBbUWQpPeDXjC5+8+qrlU2yd9DZ5Sn0b1kbfa3NM/oNvz5un/TZFrXnlGmAHJVjdLm3xlCQ0l+rIkytOmguMw+tFxDM3sdlcxGUh6R1KS6Q3H85fhU5DXqLFCVHHEPYTR0P345GpFXSyves=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixtdxi2e; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixtdxi2e"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso459140d50.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967350; cv=none;
        d=google.com; s=arc-20260327;
        b=VzveE6Mag2SyFwbUOxTgXMzxD88wWZYquKEipo3sWnj/r60V2J9XEVt5NnxomdMdu4
         FsrzmrVAcI+nCIZszT9m+Hx3TNLAIQ6hWO8uGvBYDS5BVYUJK4qIqsrhVXtIeW67+zqz
         OIduzi6dLmHlVyrjfPXvOzKwY0IYhEYTBgcLnCE+NwUOuFk5vBd3KB9TyK8Fo+rKovtJ
         BdQNS9jSO+/bmxh5NOPs9+taRmG35tur3zDpGPHp+7xSov1agU2Q20hDK3CEK+pYbb+H
         BprNUFnNXfpXVqatsHNApSrTy6KI9p7gTuuEioC0Cbvxv/Hh3w7TR7DNhZy15yyUuTJo
         kCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        fh=aLvq7k0qmO9fDmmDicLtWN13iflTucIsiEHimplTDL0=;
        b=egr0XSG7eaf8TKNSAg8+/PiHz4pwnEupTmchYuTwg+fGR7juphS5UMN1btQLwcJQmU
         ++xPQu/fA4eYB19d5SBptXb/Yfs9t7FWh6AurF/OP0h/A3tEKG8oHyoC25ygCI56SEkv
         KR7OUviJKdD2Jw4RRY0pblUeTHDFvMPywMWewco3Ji1a6mL42HO1D9LkWBt2LPq8hEXf
         FInMxjcwe7T9RCSRVzN+/AEWuKd2/ALNIrbZ5nQLxCFs8ib8JnDdXVSo0cJElzsJZi24
         ksDHD+kW7eXp1GBn5Fl+u0LHa2a2H1BvXRr0guje0P66l0b7F2gUttykcjZ5QkDA9u16
         DScw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967350; x=1791572150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=ixtdxi2epUtKkuXGhSUNb8u7gi3ElY1KdTNYlhK+kZJUHuWz1ZvjK34YDV6lujj/Up
         GSLFC0IAjjq4Ixdmv7MqjzUtqTK8oyDqJzOvg89I/oikJqNofFCRxql+FNBq1lhsUNfr
         Mx63HpGg0Hnnvy6xYrQPmImodN190UZSNgdMUu+EGiBAXkkLW511auUv0DD7tU6M6u16
         uinBUCCSShX9Gkz95Fvx78wvnLoVxtU3eT+GzXvOT6BeoOte2+CunvbWjSgteAMhe1US
         JnopbvRys2LTPbnL8H2ZeXp7OeRuTQSQihOV1IeiHnNFglSX2LX2xTNqu+WAgPxxh2cq
         Z3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967350; x=1791572150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=WaXwVNnvixLQiEhP0L1sECSxxKwz4ct+QYI0TvM+qbIfHoDCHh6hYR/aKJQfHPLg/a
         hcRYyBU9Gze1GA0ToQwPJ5HqjSSkok1vHD8qnaWkQvSkxotO1mDSEq/PXEUGzsUUGnWx
         mlkLEtH0I91sqTbVng26QWOU8HnzDCxk2H+wTx119qzVvRkPO9+CBPH4H4SjKMp2684G
         zEJZ4L6VVHLq9YOGa8yxBl0hfZaGHiiGkqsEkF0msLYSW03ssvaPGd20pljZJWD0OzmC
         dq/QSFSrQKjj7Lon0izMH7eb98XCjb/0/GzoB1ICHT6xqJUiXLHD1X4YZt99S+W54Hm6
         QTnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsOHLka3KhPgBGgH94K1eK+vOHLMGhOD/e0L0NT62a2uAnZKZyM6e/8+WBW9fDzdRsvE6SRvtd+QBG@vger.kernel.org
X-Gm-Message-State: AFq9FYKz62R/yptd7JU+xRkTk4vP7Vy67Ki019EQKzvs+ZfvCJWhzXp/
	KlkyxZterX33pkvVHaMR2Gp/0/sCUqyU/sFHP5sk8dlfymxLAUPq+FUlNDp455oXopWwXqhWufa
	VanHHb7fPwaHuefuOELF7Ot+tKESeV/Q=
X-Gm-Gg: AYBFou2DZlbuNfP+kE6bwxrXrfF9Eff1ph5xNH4yQX5Jm2sDVDE4VkMRkUjevtBjuIG
	G2EUvUzDi+/+HJaZJFdwRnVkPmmMO4w6IDkKX1130YaHNixxRA5C/M2K5HqFupgl3L/1HOed+UH
	dK14fD5Ab8VRh7HQl87zg8EfnKU0vog/MBgQNAa5QCraDpgf7GtPvm4rLPEzNx6RDD5GrOs1yIY
	sHlKkycnzhbUs1OI1rWpIWKwC/EA3ooKNginXj94QpvxlW3WxgWe67jsOPOy+DLFAbKvL55KIvX
	2Merxt2ZBlj4HnYGrMLJSGLNJ2Lv2yTXdTFaziAfl2TYbsoGWG2vunvn
X-Received: by 2002:a05:690e:1243:b0:677:b7e7:f68 with SMTP id
 956f58d0204a3-677b7e71be5mr813923d50.108.1790967349727; Fri, 02 Oct 2026
 11:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org> <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
In-Reply-To: <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 2 Oct 2026 20:54:00 +0200
X-Gm-Features: AclHuK9ruP21ynPDiadHS4oYScZ4A0eIuHPpImnDhttohXSuBO4BfsPMVhy9WRo
Message-ID: <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 18 sept 2026 a las 7:49, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
> [...]
> diff --git a/drivers/pmdomain/spacemit/pm_domains.c b/drivers/pmdomain/sp=
acemit/pm_domains.c
> new file mode 100644
> index 000000000000..d563e4e4e232
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/pm_domains.c
> [...]
> +static struct spacemit_pmu *gpmu;

Would it make sense to embed the 'struct spacemit_pmu' pointer directly int=
o
'struct spacemit_pm_domain'? Other generic Power Domain drivers (Rockchip,
QCOM, Renesas) use this pattern to keep domain callbacks self-contained and
ready for multi-instance SoCs

> [...]
> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> +{
> [...]
> + regmap_read(gpmu->regmap, APMU_POWER_STATUS_REG, &val);

Please check the return value of regmap_read()

> [...]
> + if (ret < 0) {
> + dev_err(&domain->dev, "power-off domain: %d, error\n", spd->pm_index);

Typo: should this say "power-on domain" since this is inside
spacemit_pd_power_on()?

> [...]
> +static bool spacemit_pm_get_state(struct spacemit_pmu *pmu,
> +  struct spacemit_pm_domain *pd)
> +{
> + const struct spacemit_pm_domain_param *p =3D pd->param;
> + u32 reg, bit;
> +
> + regmap_read(pmu->regmap, APMU_POWER_STATUS_REG, &reg);

Please check the return value here as well

> + bit =3D p->use_hw ? BIT(pd->param->bit_hw_pwr_stat) :
> +  BIT(pd->param->bit_pwr_stat);

Since 'p' is initialized to 'pd->param' above, you can use 'p->bit_hw_pwr_s=
tat'
and 'p->bit_pwr_stat' directly here
