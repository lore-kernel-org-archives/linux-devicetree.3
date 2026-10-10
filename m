Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011EA364EB0
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669865; cv=pass; b=q4aNFbFavweqHvRq7UUfFsl5szP1shMeCbGr456jMcQsaKPrjDhMiMtYlN0apngfAR2Xg05gtilc094YF1PRLSSV6iwjHxTxVPW++OG/VtlYZKEzm5zD7s/JDr4+XVOcJ/Xi+HPmLgwdS/13rV7wea05Y5WxJCxgwmqGSxIILOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669865; c=relaxed/simple;
	bh=BYcObbLCaSgU0tk4reE6Oh6GJ9XtFYK/QOHixm1CUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRMTGCaRgwQMi0lWlh0W/swZI5KRW7HC+/TmL9hFdyIlWTBGuqz2wZhrkfcfWWFJcfmIxBfsvSnvFk8WWWDvY9LTvvmobyOVvaGwWYkHApPFpNKdu/Hw1+n3OgaConTiQs4KJqVZA4zGFK49lW8HgUsjjcPY3dl1JPQKJo1DXrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=p1O8tu+j; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p1O8tu+j"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677ad9083feso480493d50.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669863; cv=none;
        d=google.com; s=arc-20260327;
        b=b2V2/wB9X2gOasu2QYe9BHXWboaxP4RFSo4sETd20QYg6FtICB5hNJLS7y1Bqe9snm
         sAIWWFGyfk663I0ikc+kpudPWE6s7t0gWr+bF2JUGY+JjCaozGq3EvKVzFrhcHGImMDd
         YYWW10wihPpMzwVOE/cRXXghKbJGw3jHXh2RaxlFThVh70twu5+SuzwRaIbdq83wWS9u
         YLjxoM2G3tPBb8dy4dh43ooq1tJT7TzdrbufmUWAjtItpWUoMdSLk9BfpyQwUYdMx8ta
         lq6fecAdHsv3LYBP0ryYTtFydpPf2ys9hwqGv/wBefDwnWtmDjJxUzLhj2I2vB7yixqJ
         nWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        fh=wzzWoqfA/KzLIxr3+B26Toh921+zArrd7X5/LdxboWk=;
        b=Cofkm2DHCOWY9eFWL4X09qSoIHmjZ8lLPqNkqTfHOcAC3nNjYL5UkrYZTPCXHtumR0
         1OC3XNjPr+sV8tORvotLVr3ycwwKbbdP4n6XvPRBvh1teHsH4ANLO+R01cBXBnV236D+
         Scmzmhxx2ZCh+dz+zhtPxz2hWF8H3OBOvI+YJ506ToVYZgdDMcwVD1HaMI9wfd5zmyfX
         ZB946fMNZqGLa8GwWurvJqemk7NvxnqQvxaTISHvItov6U698fArE/bDwy6+dpVDaYEe
         ovdmmxd9WaE4uDsx/w65mA4vOqHuvr0hOBjanl3XfyLZ37Hqn6rM/JYMXTDDwoAO6yBH
         aN/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791669863; x=1792274663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=p1O8tu+jIHXloojYJcntAerl/63gaJIulBPFm0UByRTVmqXvIAJ8HJtZgddJxFBqIi
         nF5h4mp6dj23uHnsVS36bQjBHKmd63qWW0gad61dzh2TTLSF2ZVGYBUlum3SX3qlgcMk
         SnSFMCyFDXFX+gE2H8Nwej9Va8ZAbGQZticmu7pDJjmsi5cdyGj7HoXT0rtsP3Nx6J92
         ftCPAwnl7vex6uvBvtHwF0VJZaXZghBmode6VuLHv+jgzvB2m0/jCci3hL3LV3tv01Gu
         z2BoKqS1TvFdVFs9zBc4ZLPtlFWwOOAJtqAMFDzc/XkFz+zDHS9S71BOrl8I7dCwR0jP
         Lk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669863; x=1792274663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD84KsrwDgkTBQQV+472E0SUuRjtbi5qncXpaLstElo=;
        b=IHM4rIlrSlLQ0O7zYWgXZwukVAbawp/mcdTVfKXan2Fxza3KGlbwSPkRGx4gBh2YL2
         Fl+W10CCA5rEf4vQ5FlzqUIqI954gR3c6nZnrdbR/luGHIhYYkX0pYUad/0Fh/Rl2LNt
         yokKlIE9Yk5Tya9aj1u7Hun37iy4wXUvFkh4DfkO+1uYb2rb0acHX8YvAWclGSNwwGpD
         AN50R3jEsWqvPwIpbphqhSpSmWkeEe3MG6A8/3KjzjGqDII9yEpPlZZM08ffUBerQPKI
         M9QxG5/KuOuzXsLRlP4lsnL04MWMOfVuEmLpQzVakzsYGGTuqhNyev3HNqYl9xT3XDhQ
         0Qng==
X-Forwarded-Encrypted: i=1; AKwUvBwbO7tOOnJdUvkMN0hXMH0/uHuxtgj4dFmkhikYvmYibaVka+hessEtD9+KWeT++u59HdMua+ssXO8i@vger.kernel.org
X-Gm-Message-State: AFq9FYK01DPuoQx26pKCqPrXoBTlhDxPhQoBQ8A85Fy1mdd3nx8/qpyo
	R5A7WpAkwi2hoeCJy0BNcil9DcCM+HLKQq2eKcXpMzIGKIwIJv040gnJ8XTsNpfhIoRL1WIAX4y
	lYBP/tUgu2zHfoWHgXU0zdsYNoELfSSw=
X-Gm-Gg: AYBFou1A5iP0XD3Eomn4Ovhk1mUFaKhnvXDNsq/p9xHC/kdmpRkQTyClw9zpBfYumcC
	5zzPbowzBaQ8SWck1TCtoNF+ks6yy1FrzdLTXinhoMxGzZhmDjiF+8tPLaHcVKDD9LFc4wJWhCf
	bNCCVdkIjlcwow7KZKS4dimZkH7Q2yX5w9JomeG3G5OxHmSBQugY8XQwfSchE20p8XwGnjDC9Fg
	dOLBE/7UC49z714IQNfGYM6SdrezPdlMQsFjeghMyk2VO6mDfTYGebGquT9WYWAa98yg5Yy57iW
	Z5bF09Ph1VAOKRbikPig6SLgym6v8MW/RWtLzqIkWtxeewDs3ybodYt8+bS2EWmGKYmgluNvvrf
	lZtdBPobO7ZWs2w==
X-Received: by 2002:a05:690e:1407:b0:679:24b6:fb2f with SMTP id
 956f58d0204a3-6793678c7e0mr2255529d50.12.1791669862784; Sat, 10 Oct 2026
 15:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
In-Reply-To: <20261010105900.247342-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:04:12 +0200
X-Gm-Features: AclHuK9eVPsrLu_8xG98kzx45q0ow1wl_zWO8WFmOGBNd_k8l5MABlydeHwbbRI
Message-ID: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas and Conor,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +          - enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +          - const: snps,dwmac-3.70a
> +          - const: snps,dwmac
> +      - items:
> +          - enum:
> +              - amlogic,meson6-dwmac
> +              - amlogic,meson8m2-dwmac
Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
In case it helps I can submit a patch to change the Meson8m2 .dtsi to
use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
we could move it here too.
That leaves only Meson6 with a single fallback compatible. I don't
have any Meson6 boards, so it'll have to stay that way.


Best regards,
Martin
