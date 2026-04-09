Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63833A70E
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726849; cv=none; b=pJy30/rjB3xj+JDr8eVQd2b/0OQ3JjZGwCVKIt4FSef8DnZYoTuK6OGz169W/l9MCZqO80Yjlu6RVoyqzq+LcdtcbaaATWOCk4JEu2xdSXxdU78c/+q/77AvCoShBdK9UAvhtbNnHjtybjluvDZTx0NGOGOU1QnA90mnh1GFMx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726849; c=relaxed/simple;
	bh=mm62eN4k+B8PwcvEaxPRD5TXrCmDeIaV9KBROnbn2d4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I7O41zi2jPNPV+R1/u0EIjty0RyfwVzBYkp4HnqFJFYa2GmVvisDy91EMfBTZT39Y2BnE7VFwI/V80oiToScj6mp4e730+HjKtybwCZSuRtQaMSRVao8spIazdIqokdjBWMvczlkcw61cGgUXqBVfVsogMht7OWg4j+G0qOD2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aQocI6Kh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T2EloI4F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aQocI6Kh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T2EloI4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
	b=aQocI6KhvyRLOxngPJWRoI9NLQQ5Fb9p4pob30otWJ6xk1q/bsC0eP89j1nsmK6LJv9X5n
	Jc2fA5KQyQahfXDptMpQ4ySGeKcB/YzorWhNYAnRX+TgXWC74ryniJlG9tcjJf06YbRRiq
	l1K2jNiMovmcs4ON9Ni+AWGSgHji6QM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-kGMhS3ASOButVntQL2U9Eg-1; Thu, 09 Apr 2026 05:27:24 -0400
X-MC-Unique: kGMhS3ASOButVntQL2U9Eg-1
X-Mimecast-MFC-AGG-ID: kGMhS3ASOButVntQL2U9Eg_1775726843
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d022974acso552791f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726843; x=1776331643; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
        b=T2EloI4FMl3+O1FEowIs1gyyAqJFE4ql3xpiaFhc2ovvS8GIONpibCJLWL+BfMgYRC
         ruqcaGjarsVK18HfZIxn0o2sQBjddsnCvQ2pfpfVkskmn4zV4e2wUhg2wPh0Kziqkmza
         gSkDzLebj9hhd2Ok/u7aRakHEIJmJV+bey9TGFrBshYXdwaOkydsaW6Rydq4NFhLsHC6
         ZwrFWgorfi35azCVpcPAytp9ObPvGH5CpkTi/usoamKTXxrDHVtev+nYGXewCt6w302X
         hNEs+U8oz8Lvj+rKtLcpbrpoiLOLFEX4CUyNr/wm23fYllFD8iilbzAcMA1ogDUEjvCV
         fnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726843; x=1776331643;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
        b=HupoD8sjoezQPeBXRNITuzN2eXHGtl1oFFxy6KSyATix1DSHztpCCCdYhTbAl7vjW3
         4EisCoVzqt45b7pwJt77oRn7EM+DsSAJsPJIMRcjKUbk/CZiQ/Xw/86ctumXx484uuiE
         OLShrFrkustyC6zwBh6zjh2XpYHel8I/419gC145QKYhRNIkCTtUklMzulFVPTR4UeQD
         GD7dZ3dIFShiTTKjjsw8gP6TaGNteGKdtembYH4cRlj4uByxckIT5rTy0ynpFAEQ10kc
         /qkF4J59ewo4y/NFpZ/skJLRKg4ehVliFT2uP0ailpXc9lAUd9g8FkJHhbx3satK/qkY
         v00g==
X-Forwarded-Encrypted: i=1; AJvYcCU+26O2vr4MTxxC8cFYEFgvGYFdnAeiwhSFpli0SgNUGBJtXwyq+pCsahUqwElJLcZn64OFY1tyerbB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6LElErpFeYwzPjLbbciaYtWqDmhgYwkq5ZHOgwfhcWBmBDps
	ftdQf6d3ob3OGBrDHNJg/JKJCZpKSyt11sIQwWiICqoNvETNEmhe19pb61Bz1vl6+6kcXv/vjH3
	nqz6HM/Q2L1JbboJmjV7wkO4kGM9Gc3p+hgcwC5V+i3zH/rK3npNQWuVkGQ9IAXM=
X-Gm-Gg: AeBDies0+s/vfhfOGWD2K/rYjxOjbw/usa8XrWmbO/KdQaeMQn6mtkZuSjRzYTaE8cr
	FeztDJs825pFPYMLHjpWIkG3Ha/UCSngF0Ovq3Nmwo4gyXF6oxZy+4aJLJQLvRlrNHep7n/t+WU
	dG+4epEH0v+SH8h1gkpkVyePtx5jY253S1NmUIi9lrfapyVZnH0XP970sVyyTvC5k+B4iNBHoXY
	8Ad2lGl29tz0Fsu2r31I6gb6rndKJ7zahk8IQcTN4rUALusyV2JtXiVPNAXizrITYqzKn1JsWd0
	i21EkcZgGpZgmpwnXUCdS37S9Ggj1zLlLqMie0szbDPSesD8rOGZ+rTuQrZdUdufpqHzn2ohiGZ
	3jikkht5eH4oTBYwJXc1ucTDKxLPtLPPyhxDfl0PoUxuki6KZwg==
X-Received: by 2002:a05:600c:c056:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-488998ef198mr233647995e9.26.1775726843306;
        Thu, 09 Apr 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c056:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-488998ef198mr233647625e9.26.1775726842874;
        Thu, 09 Apr 2026 02:27:22 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd1bb76dsm65282105e9.8.2026.04.09.02.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:27:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI
 panels
In-Reply-To: <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:27:21 +0200
Message-ID: <87zf3ciiva.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

