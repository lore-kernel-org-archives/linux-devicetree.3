Received: from mail-lr2-f25.google.com (mail-lr2-f25.google.com [74.125.230.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2C3AB28C
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579049; cv=pass; b=Sk9k7WDU4u3O5WOBmH3GkGWgMyD1vQTdWTvh6w6z59JrRGsoy3maP2lh16xE1tFfZsTyMqeasusXxjpsOlDehxt98Gz35pu96QhmtlmX89RUT/h/et+ObowykFtTIdTJN4LeYmY4WGiuG4L6vOTASocuIWC1qTrG/CP7YNcQbug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579049; c=relaxed/simple;
	bh=QcQk7d4pb6MSovoeWWdDkkdL6cfWPIu5znyjI13+lN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOmak3661TU7LP2z2OszBnecJcrJKPIPQs75z1+q51W5fIm703of3qF2qwqeH40QB3uLJlALnaQt3Ni799cT/rkaaoUI7vpL9homKPo/9z5F0DpIsMi1bI9QcUok/DhjoawVs4d0rwskoKtnPDdxj3zQzHk3t3o295de9yNa23k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6waf6Sw; arc=pass smtp.client-ip=74.125.230.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6waf6Sw"
Received: by mail-lr2-f25.google.com with SMTP id 38308e7fff4ca-3a65aa0342fso12251001fa.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 00:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790579045; cv=none;
        d=google.com; s=arc-20260327;
        b=p5BNWMC6zoOj8w2J48GdB0+irYs07/6CrQ4dtQKyeULRge7oz5hYWWCB0fXdm++0yD
         dX3qSRTGXTZhSP4XYPtRvExKPIH8jfCwr+aGD6PKuCtQJ2mJ95jQrTwZ+PQSHm9rS1Co
         FfQCN81SEGQb2JmLaFH1aWN4H3N3z2rPvvx92mNo4wwIHi7cM4mQjo4DW6PJWXwgrB9l
         vCdpmS2ePYM8PyqZxgSSlLUz9z55o9Qt86QM57dizby6+UQnJYWscDtgJjjS7DidVm1s
         ua4do17phB7TEFp0RAc8n4cIgvLU15mP4qahC/GiBEa2R7/HWjetXxqWm+oDb2Ikn3lY
         RM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QcQk7d4pb6MSovoeWWdDkkdL6cfWPIu5znyjI13+lN4=;
        fh=iIqrxrmM25ESIn96IXCXpwiDwxi9Zz+gaFoJsk71WrM=;
        b=jcHOS0xTbg6Mrk90DdFRgiu6AXoMfSSnlH4M1oKtdKt40NRjKALDpJBHyWBmtjsTtR
         yfflLuhNfH41XuURVAZ2ixPrtwyVWqiBiFUDg10xYjXtQyXiHGeVNpkqxzQ6Pkq8Je+f
         qNuLpdY+dqjH31INuvae1/msMekptPok9/2Z+nPwwkR5RslZ9+ZAZpd5tZ0mJ5JDjNiZ
         +SbJvwbYHwIbg5p7wnSFOhpCUnVdys9xs1aAACuH6HeaLKF3aFIjuRoFxFYng/q+gLzb
         KZ8mJWEZ4OhoqHZ0lAWkLk5cSHdo+ViVJzvqflDtBQCg3Y9zHWcuxGzUoHKvFGW0UEqF
         S1xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790579045; x=1791183845; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcQk7d4pb6MSovoeWWdDkkdL6cfWPIu5znyjI13+lN4=;
        b=p6waf6SwAt4Z0Ly/cQd+jaClvPmkiLdXuaGMwZfkAPHopwCsSOcy8sJAjogk/FXi8L
         te+yjtYgfR8a61g0xzOVLxyO8d9jzzPNmTaGTCJj3iddDQJH20eChb8o0kjHB70jT9Qd
         Ngnl9qZujH/gMHpsbx17dn+fWa0A36O/ctgw63K/7LOhsA3/FIsHXWUMhXLC6uiML1Fq
         RX5LWByy7UL7a7iFLY0XkgUTU4YDx1AiU41NGOVUI773lqmM1cUdNnrP/ecuLyCWl/1d
         OobmonXcwl8ffGK7Q+vLctRxZGAC9GPLHM4wztE3wYNAyR12JYED9liQyamGxEn4ohp7
         V0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579045; x=1791183845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QcQk7d4pb6MSovoeWWdDkkdL6cfWPIu5znyjI13+lN4=;
        b=dhSkk/F0hF6l+RfblQBkvZNhMVI/Iblr8Sn8jHTjNWTaspBssU3WbFgP5YTd6zWCod
         VoqSdtM6meqhJ5uflquc5yfJDqrb5p2bx54pC7Q0P3ihCshKlIG3YryWSHoJCuyrOcPQ
         l7GnC0oRPrsDflRVl2J9ybocDeWnul7rHyB31EEpLBVXuP5wsezcjI/7XV/g68Tgx9bg
         9NtuoslhzkgjhoQ85wSjiYwDQvD71oY4G36BXGwQAMIgSvnX8XLPsjv6UoJlWYGed1AT
         rTXObQA1D3Y3gNjGW5i7zDt/5fzgNPuGvUl/SCTu1OQRD1nGTidwFOajQRw1LJbPdzto
         JZOA==
X-Forwarded-Encrypted: i=1; AKwUvByd7ETXJXgwIRD7vWpUkYWpK01h3Oykezp0Xz+M2tHTrfRuVP2LcbBdCS4+U1kK3WJ+51bmlaN4BRzl@vger.kernel.org
X-Gm-Message-State: AFq9FYIhjfp2iqIPpt3KH4g+aLMJI9aD20uLM8lopBFZCRMmQiBvgkOD
	2tbWhvV9nXUHOeJ5CjsavnUfwYKex3axJiYkhgK5FsoxAcrkA3jXXl+219CU1q8Wer+uOUBvKI0
	xrmwHZbv4UnVlsvxr98ljXff3UI+rPK0=
X-Gm-Gg: AYBFou3S+j70as8BTsJSsvPtSOdNsDIhGLf9xwQJF6xG917m6txPNPBxYS3a6NuJNdF
	8wHtEibOlolg7ARf/LdaLZ8bhn41HTho3VIkqHvOhkS8IEoJu1BgezV/S1z2IQtdW7v7aETdRjA
	QCQKMSuNL0ADpYpyA3bxJjhokHyg0ecUryx3bNSqfVk0oCFPtCpf2coomUPis2Krp6ZTCaX9SaP
	KddMuj/i08KID0cOdPk6veybXcdr4E+Mfv2QSpvohfJ+TvOqNDVSQnjEyvoP/g9eb+AyLeoYSMV
	5p/OhSbga8yAbxWKDkfGcVaWunrkkF/9Z/Gh1VcQtxNVSMtNYbtkfYFs+AgRPWspYQ1OrEz4iaz
	Ba4m/k4IHC+yNcLJGnVEqEoBpNWHk/skB0eWmMB1o5P8y28xPc900WMqShnpVMpbWyjns4Cm0ru
	M=
X-Received: by 2002:a05:651c:1543:b0:3a3:7682:499a with SMTP id
 38308e7fff4ca-3a63c0e17d4mr34085851fa.15.1790579045263; Mon, 28 Sep 2026
 00:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920193944.110983-1-kieweg.leander@gmail.com>
 <20260920193944.110983-2-kieweg.leander@gmail.com> <20260925-fabulous-wren-of-action-89d266@quoll>
In-Reply-To: <20260925-fabulous-wren-of-action-89d266@quoll>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Mon, 28 Sep 2026 09:03:53 +0200
X-Gm-Features: AclHuK8i6Zs-z628GgSRbUV6-Mg1x9Wm9seahXd_0HLR7cUtIg92sLhwtNyE8EA
Message-ID: <CAMwcS0hFC5U0T7WBURXd0tGLQE7yE+RdB14_-rFP2Y0fxv33ug@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: Add GlandaGPU binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

Thanks!

Best regards,
Leander
