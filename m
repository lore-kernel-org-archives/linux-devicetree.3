Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8933A48CA
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122161; cv=none; b=bqh/VwgDn1AYCpv/2bh/fJ6hs6tUWHEGCGfSeYisTq0TlSbNvDbc51WtUGAApYjLMiBV4onxXLOIiW46pfT3LbfspPzoxLf/iJzQ45TUG9zi7vgBNHRfOTeJYYOvP6LVDsh19p5f+NCypRG0LRo6hbWMyRDIcqsaRXk2I7n64ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122161; c=relaxed/simple;
	bh=8BETki/jQ5baBxbQcFwkgeSsOIXzQof1N3Fqfu96PVI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTLFiNZAqeOjXCZ08O3Wjtumv+jw1CiURF51yFZ80RXffkrdqhnPrdUoJZkxsoYDKy8FAdehe0gI8xqYw7yzJNWEjAMykdqkCb+k+GcdJtm2MTuZATGtLvojYIIoe01yIvWj8FK0WgZooW2q4g/DXLDPgrrK/oIv5OWjojCKZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zuu8hF4n; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zuu8hF4n"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4633193af19so2877126f8f.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782122154; x=1782726954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0E0JBlSRaUIEWVL2hII2Z9BSAc+EUsy9g19G1CKGLw=;
        b=Zuu8hF4nPp9nD2umAtReOwK9izswYY0MJIN6LZNNZcT+zXe49MtUUcNNAMHOPvP0Ty
         nUQmZqKS3LFIZei0V0G1Xcp4JIVuyZjmRBTEfnVK/CHOwhDIFld3qqrKzOegiaxqgapj
         SA5xFEPzXSqFV1vROPsqm+SgD6aD9l96DDFoR03lZoL9I9wtZGCEO4ekl8EuonHVv6ne
         So4+RsqLDKtX3dzJQou6Ayam5IxxNJA5FljormrbPKjxeOEP14QtQnq/lI8+rL/PXsAb
         Y1qRHjPKc/h5YSrBo+3XJmbASLDyBuijtulJ3zeEcKk+yUPSo2flaK+e5C9VxgUKWJdp
         iJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122154; x=1782726954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0E0JBlSRaUIEWVL2hII2Z9BSAc+EUsy9g19G1CKGLw=;
        b=XxQgj0LkFedPYX3b0EzsVT/02LwWn2Icwl0vX099vggNLh0/lKOhOUM04gfXPIjlB+
         XPUo8NDLlvV7iPJaEYoqF/akJuTjTkFDU44PXfJjCEJy7tiDu284Gz+hj4UJQonY1XXH
         qj4ldOPAAqZN+zScaSf2Ihm6cQOJhzje3Dj2BOgUho8NVylLJvfhs5MxhGdsPwVHlvAB
         hBaLq/ju3b+rPGcSFGpvBT1XM0krjrGYhVpCuBPLOBuKSwpguXNkeh27gtlPIty/18MR
         YIxuaMWiTeXK46UGevuizeTSx7XWXJpGY9NCboqfuVZ/m6iqNvJ+MDr3Z4BLu4zVqFqP
         uwTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+p/R93jIn0i0uAGE3/3OANEjIPXGLO6ce0o+p86QrATix956wdrRM2LmE/EI9vK0YFgr2eCgOtj3a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vNsRJiq3aGcpnATAxDFxj87oRCoZq77tT5PmxEsZXliteN2H
	RVf9TwQ6o474yyj0mFqHiZbdIuiXN8k1Thgbd2wde2Dk95/e1AX9ogow
X-Gm-Gg: AfdE7cl3kicXUjdIvMx6iDS7PjmO3PTSYWhXE9W1IKYOUTETCPhQGbR6jKpwyQQeBpb
	XvErJ4lVArNfd/F4NgnUYJHK08x7Y/8xjsk8NIdpjMfq1f3V+xBPCKlOnonWDwiqJnx8PtSRPkT
	MwPc4HoPHwgEW7rQBxNdGP/sB4F5nerpz/MXFtuYYdExwU4zselWeY7mUauJf20hQKomI5CNeXN
	6uCX0Ny9FDC7YNd0CrIxWAjc1f28J7zbPSa6rcam3kuQZK3KR3EnCujT2DY3MLR8U7LviToadrw
	sHpcYbirXI5zZK5CIeh6+nWTvhMUXZV05AO7CkRnhOjCund5oLyrJ3iw47xnT5A0a2XWmBs0VmV
	UXVQgf9tzHByOuUvx26ga46Ak3IuEPdIT/hZlp+J22x450ptducG5Q15+Eq6PnhA94WW9rtGa1s
	0GZDtYDjcH5LTsEkczXbe5LMDquD/ycjo5WO0ol4RFw1KHLPTKsE9CzqKBnLXdjUOLKnKcF7ukW
	1N72qU32VOd4iYWL9ojC5NCjs/59aih/w3UkIu/ZZzEO1Bqi1iKYQBD7Rg+rkOu71Cea9k3kIqo
	X5Yc67l4q2uBANo8ODC+/cJxpQHeE83pvZ2kNhcPvwO6XSW7ukgCiuY=
X-Received: by 2002:a05:600c:6288:b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-492490a7778mr137140915e9.19.1782122154243;
        Mon, 22 Jun 2026 02:55:54 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15535sm313817465e9.3.2026.06.22.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:55:53 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:55:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260622115554.000036a9@gmail.com>
In-Reply-To: <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
	<20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Jun 2026 00:47:28 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
> +	info->clk_rate = clk_get_rate(info->clk);
> +	if (!info->clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "invalid clock rate\n");
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (ret < 0)
> +		return dev_err_probe(dev, info->vref_uV,
> +				     "failed to get vref voltage\n");

Sashiko raised an issue that I've missed on previous reads - why
are you using info->vref_uV in dev_err_probe()? The info struct
is not zeroed out on initialization, which means that dev_err_probe
will return a different value each time when read_voltage() fails.
It was designed to accept the retval from whatever function we're
checking. 

-- 
Kind regards

CJD
