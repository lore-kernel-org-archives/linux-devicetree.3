Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577A481657
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255514; cv=none; b=H+HsG6fA04fJRxDRqlXszPUj8HaqGw888WJ71KT9/SE3cpp95+NSV2zRQUGEOpwSdHa/dUU/H/rRG+I9m3/pz03H0fmff/9JLKuWsIIiLKZmJVtT9fE6LxxoiM+YRPqV5b6yWPZa+keb72F1HlBSRcdOIx0O9Vqk/RyHUjT1kQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255514; c=relaxed/simple;
	bh=1TSXneoOU1Yt/tUGyZxYUZ+hB0ehAvjQVuOKhXr/ZFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/WsLFxchczheQBUx67Y7CAYQEZcV6NUrmpWuB2mmRVvS4OhqIoPOIOGzl3N4s+d0tygK7Xn02ts9uP2IcyqQQVqytwy1DPpubaqTfkwEhQEzV1is3uIPdQebi7CGTnsN6r/HMyXd1DkVh8TUnXdADO04w9PTl7nOyJLucvPrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-786c3d55c99so573154137.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255511; x=1790860311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FyztXa1+P8ok6tdKKVDIJtTBDV2aFviJNLJni/q+qo=;
        b=1aTJCs5EnpHOxx4V7B10M/VRpENLCm4TK4trwnFTZJkBroDkvA/kfVRhiRmWr749bg
         71OQvX3eyySbpbzpqUAcGD5wVMmprS4/uDiQ5hLwGcMdEXjktSWsyEWvg0V/nMsox8ay
         Fug15ZuNguyz8BOc1kyfO5jM4FOVxaE55Sl3eGgThSV8wZwDX6y5L2+iE4Ox5As4/1BL
         DoDwQ+IwtjfwE7n8wGoG5XGHWgeldGJPwLkgdS6wjE2g1GRfZ/L1X8iMqqe42hnKP4yu
         vQYf9lSSkyIN96yAaYGx0vI3KDQa5UfSft/R6sBGJQxgTVl5uFBqEmdtR93GKDTj2IUy
         8CYA==
X-Forwarded-Encrypted: i=1; AKwUvBzlFVsagfDUCZnXJlGpBkBMYL5eQ5+X4o9q2ZGSVkqOpEUH7aq9kkEJ2mzyG/BsrcUHi33sQRc3OL3U@vger.kernel.org
X-Gm-Message-State: AFuF++lTkMtMgQbQvEiyPxjYRNWTK3CEVYzTAR2N65Mw8L6wypmEONXg
	KzGsaNHYIemRb7DTlHv9pJtQriEqrDMmclpC8jMY9vLfgdlaRHXIepK693ZAAvTM
X-Gm-Gg: AYBFou370N9JP6haCp8hmc5D+EN7ympHG/1BWzMNk+vXrdCET0LY7Yunz8+ypyUcIO4
	FcYHRLradzlwy0RkPkyZh/Cnzf9UfoMgunj9ynTAM6J5QQ4cS3XNMgmOp3ISMmMdbApsMIqaMKp
	mq47sFffDT6PK+dA7bPYNp8Y7tnX/1m9bgqfuvjcwAo1hHrk8VSbkYl/luaK12PI8QxUZ2WBslz
	6WhqqckCw470Y67tYuCTNb0D6CvNlAB+XprrcYlMosUU7o8bYSANVeOU6JFSmPVtYT4PHrEfY+u
	VNRubW/JzDP6j1lp/kbH+3rlmtiNlLQnYIFpDXHFw/OmJDaA6ffllCEd8HZciiTPWHXqQaccxl7
	ilOxMuIjovPxQw5vFuXF2rvuipdbhATvFSMMZsbDkIHM9lzYSVH+S6wEvYmIe9NqTTT4t9iyc1K
	jqZCnsmomaavt+vPfw45LlexBc5JMSv1fTsoOZfq6IbcwSxX+Y47EI6+5AGaF2mSfUxUpB369kw
	n3GnMN3UAMaqaDzJlfST6GJj5xydYgE0w80hEcA
X-Received: by 2002:a05:6102:3f47:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7af1cfa46e2mr907440137.7.1790255511447;
        Thu, 24 Sep 2026 06:11:51 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7affeb271efsm508782137.11.2026.09.24.06.11.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:11:51 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso801850e0c.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzi02TgWUe9am2cVVFKJqtggFtJ9lJ3ymQY/ijENi6vEd/xOK8miyS7fiPMRYktQTIYNYx7OD78pJvd@vger.kernel.org
X-Received: by 2002:a05:6102:a19a:10b0:78a:4dff:7b3e with SMTP id
 ada2fe7eead31-7af1d0a179emr770655137.15.1790255510966; Thu, 24 Sep 2026
 06:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924052741.130658-1-biju.das.jz@bp.renesas.com> <20260924052741.130658-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260924052741.130658-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 15:11:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4dgpQ9R7StQaz9C=iA9+obiioyU7jgOkkTM4Tz9XoyQ@mail.gmail.com>
X-Gm-Features: AclHuK9Buv8gyRA5u_mR1kAGkw730VchazHFf46HOsFhnVFa58qOMppMCJ7zadw
Message-ID: <CAMuHMdV4dgpQ9R7StQaz9C=iA9+obiioyU7jgOkkTM4Tz9XoyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 07:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the RZ/G3L (R9A08G046) SoC support.
>
> RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
> and 2 CANFD channels on RZ/G3S. RZ/G3L has 288 buffers in total
> compared to 192 buffers in RZ/G3S.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description
>  * Dropped RZ/G3S fallback as there are lot of differences.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
