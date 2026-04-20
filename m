Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A3355F3E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697488; cv=none; b=fJaeOTpxXv4mL+T8/nyrU0ZE741vgco6KyySaKi7jPZYAY0/GvHghggkI61UlHwIxbmgUGR/3GgK/ZSIrgBo60s4EvIQd0VNBf/DyfypkkFNALU9U9nUdaRA6Njo59H7nR1Y1OK4bc+nE1YrksdoEsxKLrszWnGSHuFwWBSp+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697488; c=relaxed/simple;
	bh=CGGUqvrC4Mx7H1pijC+v58+uUoJkY+676HFn916kDFg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i78mDRrkHHWMPuGhoN/UfKTKQD+tNbmbKq6pC104R3XbUozhJeSTq1sa1wxH0L//vmp6qESz3LyCwBDpMZzpA62Qz8wEvGMZ7teG0fkLYKuBYa4GI9tpBnovdw+Vkqh39MZVZH5sQ8iNQswUeCClnMmmA8tec2KlRi6GHjyiJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JisXhC4l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JisXhC4l"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba388bc0a9dso559844766b.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776697485; x=1777302285; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=JisXhC4lZ6ZSjAH+iEmxdlUhboxpUgSJZYo3bxEaOc4gUIa6i2hw36OMA5GDstpEUa
         3R9jrqCCV10kHjwLXMssP4um2jPj5XLzDBV8JuU3DXafgu9YRIa5ANfNMzQ5KS0xMUd5
         xhASGd8P4QcnI3ukBKSMc5oqrow6Fifnod9G3KvHlOAdsT0+vK4HADOhZN/8Jklc2kLZ
         HdrVpk5+Jc9s9upNkweMrcRA6Ot16UQhRlwfl9gkRk+5wUxHQwz1ThQdWsYX4wLw5ldJ
         xJYq4tTw4w8ac9ppJ+Na/EKcs9eH+c1s2Mf6QMcrF7AgvLIhJl1kBxukvMIOkZRTzJtZ
         Xvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776697485; x=1777302285;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=XToi81v883nqEX+wEhQXmPycGyrRhIdNyh92mbUHf1lilsfE5Ry77oWdxyxQYg3Tfb
         2i4AqzAcLUXzBnGmzxSD0m2jBJa6VmKMjy12ruwUmPJLeVNdtL1JSCIW701Xv8l5THI7
         YzXHHBvIcOuRouCIqxWOsDvspJctw5cPJLapkT8gdBE4JnhZoxOXfqFySifMxxaTGLLc
         v5I8wYKtG/DFj7WnMs3KvpeXGcY1IgGsTD2T1KyMN3ijgAW86n9QUeUz0FXcC7TB5lyk
         RrFW/GT2LW5P/s4OEh7KZX2ICDjJmIowV5y+l1cU8haKB3Fw0wbTpbAyRc+sl2BdRg0i
         NVPw==
X-Forwarded-Encrypted: i=1; AFNElJ/RI+fJWXGbzx1lKC/UZXgGbshJymCvq8YVXOGIJnzpQtKw0ej1WUoNUEj4BFHzLE1XGSFRWqxwiriy@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz0m0Oa1W5Sc6sd5A8SHgfT2W9OAor3n4f31myurntXGoVuOj
	ziKNV20jnSs2xooB5I6cY0GR/DpzaPQuehtozGkuPw6a8GzI+pZn9tF80goM9pjdziI=
X-Gm-Gg: AeBDievFyHneT8DQNSnN93oNm5e/8tTfCaUNngx7yWJQOTKdd7GCwj02hy+orY+0AVq
	fhf09Z/hV5WQZgZVy0s8NlnM2xsy27xGTbveGw/KP+WJLaCkFpV2Ny0mlVVjTvIH0jjLwV+utWC
	f5Az96gd0yGBLurfJFxLhsuPpk97tbiOadgIFoVJPfUTgZfyMQcT600lgofDzOPwETROHv97yAT
	saiRS1u8paaOTi3PBCS+CXpl5t1F/1xbt9ghXv6NmM5vc27fUUWM5Ju26pabyoDgWBu9iAxpzId
	W+QJvuP1akyTR4RIDInp91FxAIKyFiDPm5J62vJashPTdWiWpQKhYRghai+xJte4lZgmrZkqUZc
	+x9JpHrOj4uxvyCYpqHnEfWeaM7HxqSPH8MIfPlfZvJr1OZ0l8vaWoIFjAZZcUTquDpCZuq/S9u
	MJKnsMFCBXqIQzBZhs2gJya6uQSaGCy1pDVgvzkkvTNaG6VXYnvwjN/Xrf3TuAMpYz2Fc2Fx3It
	iQWM25S8AkXQUWhOKgT/ddy
X-Received: by 2002:a17:906:6a13:b0:ba7:9eae:18a9 with SMTP id a640c23a62f3a-ba79eae1ab8mr235029466b.17.1776697484784;
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4550468d6sm358274166b.52.2026.04.20.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:04:43 +0100
Message-Id: <DHY2P02B6E6H.J79TDOADC4BS@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
In-Reply-To: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>

On Wed Mar 25, 2026 at 12:26 AM GMT, Alexey Klimov wrote:
> Without poweroff node Exynos850-based board continue to draw current
> (around ~60 mA with my test setup) after poweroff. Kernel also reports
> different lockup problems and RCU stalls warnings continuosly after
> last kernel messages about hardware being switched off.
> Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
> register that actually switches the SoC off.
>
> Add poweroff node that implements this.
>
> With this change the current draw after power off is in range of few
> milliampers and lockup messages are no more.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++

Any feedback on this?

BR,
Alexey

