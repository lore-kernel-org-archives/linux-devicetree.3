Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A323C1402
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285670; cv=none; b=QOLrkub+PiZ82g0OsxD2Z3st1tG26D5eY45ltyMXUPWpRTvJe6wOtLHF30tFktb7M+kzqA5ZTmjKT08azcpivkaundJftMWwcfhR8Pp+rBRQK+dEDoVB+6MlmlbUP5MViOL+fdm9LYcliYMSwDTtIlL9gDC3D+59CxZTlcslMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285670; c=relaxed/simple;
	bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC9jiU1R0RENwKgJPd2EDCja8NZJrsHINjIdqhDExfkSppawZd12qyu5rayixnw1uv+wIjlT+BpuDe4w5uBP7o4K46XMbuhq8JscDHA5WUh7nS6aRunzCrei2ao0uyQWi7gcfhIdjUSFK/FMx/KMZEm93BWtdKtWUU9U7Y2YEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a27c021b58so398984e87.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285664; x=1774890464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
        b=mZthpQOPnXXwFoJB08lZpQZpJNhaM9zJeShHdDXARh7riA54ourCvVleD0bGDBPphd
         2mXKkPOWu3AwwxZkBIAYeA3B9aL1iJ2D9maxZBI4jrcVmTrkravX5FDUPoQ/dqsh/SLT
         No61Y0OWL38TLjmnviiHTKeJ6BitTImJyehUAAzPc/Dk72rdQTZtwCqljgSNKMdda031
         5rD8sgkfOidkGgD33kgKK4nNTxr/nUUsJGtt/8Mk3nLr3NBOUIabwPk6smUB3ZmkGhb8
         hJR1p5Aj/h8ioHIZ8vYtk6ZfFAUwlYAnBF/GU/+9S73w/87xOiPMOwtl9BFoD/d1feM9
         8/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpC9gnBzkMrP0opbeoyonpIYF+qSCl48Wgq9vB4ndyfzTUrt5uMXqbz2PQ5oApSFs+gFZqR260Ii32@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Q6xNs+01rep3gGyQ6eCu+1U7cJT9ym7Kr0X+GiW6IwL1MP/G
	UMpuBz9uz+ZxUA46w7pqjbeNFW3Cs3sO+nJ0nXlIc8FUtTl1QUvbxb4dmhObJBft
X-Gm-Gg: ATEYQzzdJc7Nz7685m4+9eDpaO/hfUgjtOe2fPi/Owy2US/42+fD6gDdO5dzP5o2bDa
	UKkfNY4E9Bxwzegc7hcIQ3j9f8w80Ph5O2M6DjBRAP2ERcv5ZE3hgEOX/YcDQ6dqHmXzTOHgckK
	Gnp8eozeXtH5q1Jx1uXNGs4wM+7ljRLZ+QRkGLboYil462dnvYrr62HdyP0BzGCbdrpv5gYrM86
	dMWd+243ctawWMjM7a8vuY53GRXWpPAemBS5E4wmzh8IqmOFjWziPC7lXV6lG4htnHJbywDuDGj
	38ClPkHMgUio2TFHSawRmL3r7EWb/JTNHt58MH4+nUy7BDeXs5LWS48/v6PzolFQiuGVD3Q6QmG
	SuFZFRxusjcd3masMsogEwSgL8Q2iyVDlEk021OYJYPnRXP9q8HnHz7tLuGmF2xA6HUak2A4qCm
	LLNOK76J2N2MOnNhME4cBCmLUqqqO5iukIVwsFGbIFI2AdrR6HxTsH0wa/F+eXAI+JrQ==
X-Received: by 2002:a05:6512:31d5:b0:5a1:5762:4cfa with SMTP id 2adb3069b0e04-5a285b3fd17mr4383637e87.21.1774285663993;
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519f958sm2593394e87.19.2026.03.23.10.07.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a723b2b29so2905211fa.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4dvERE805sveWvRgW1fJUflXpvUYlDKpppHzh5+n3pHHYInExNz0z2MsfCouHp7otyd+1zD5TmPQW@vger.kernel.org
X-Received: by 2002:a2e:9bd2:0:b0:38b:f0f0:e3c0 with SMTP id
 38308e7fff4ca-38bf963ddd7mr33026081fa.9.1774285662722; Mon, 23 Mar 2026
 10:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-3-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:07:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
X-Gm-Features: AQROBzA5T8F1z2ogDDbAkrNKbAgfLdiandHWSkKdFT2S7GO1Ch51csLHtutzo-M
Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin configured to muxval 6
> (IRQ). The workaround is just more costly, but doesn't break otherwise,
> so this was probably never noticed by anyone.
> Experiments confirm that the H5, H6, H616 and A523 do not need this
> workaround, they show the GPIO line value with both muxval 0 and 6.
>
> Remove the unneeded quirk from those SoC's pinctrl driver description.
> This should have no obvious effect on the H5, H6, H616 (other than
> being more efficient), but the workaround is broken for the A523, so
> it fixes (one part of the) interrupt operation there.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>
