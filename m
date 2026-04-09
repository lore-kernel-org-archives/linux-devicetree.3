Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F93AD53F
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726451; cv=none; b=iB3RFgfkkGAIMGnf18m8Bd+LqhAqERRIAhW7TpAerKlahrFBXlJFfLROlYfCEmypuCq/187OI5Clq6dxwaiqHnqeM59ch4JSw6EOLHw7G59n2T4VN8SmbXF0ZmoAhMnGrJglP/wP/Y4DBYPLiL1L5X1aKb0hTkIDE7A92mFLeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726451; c=relaxed/simple;
	bh=Ap3/GSo5+I4TSHRW2SgDcYn5NyH9m4Gkcz3TgAL8Gtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Upo/UDBNMrTkXvzUY04x28fAvIxDjwweuIstbMYpMXsy4Ge+J7H3RUGFO1CIluZ7wZX8LTW4YOxaYCqkKHPrzdv1ndmP+KKmf+Ojqz7VEc+ls5rbNch0t3bLrhYFOXdaXPaYeXiPGG1oh9XxzixYcfryXMODFdX6Zi/NlevWkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+veXf/D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k1iRMmkF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+veXf/D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k1iRMmkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
	b=O+veXf/DWqeTczS0t3bLH105RyV02KiZnzo1Gt+QEBmEnFXQUqtNlGJV/TKGPBk598jKiI
	7QyjH3uG1tCQOtgFXR9JxLmsrccU5UCk+DGnDLbKYQkmO+c/mmYDVWLXqaB8u/EMd1TDSr
	cCCzMFcTFJMNXgSjk/yHtSw1781EDcI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ZZT0mrzbNNywJlvTQzt1lQ-1; Thu, 09 Apr 2026 05:20:42 -0400
X-MC-Unique: ZZT0mrzbNNywJlvTQzt1lQ-1
X-Mimecast-MFC-AGG-ID: ZZT0mrzbNNywJlvTQzt1lQ_1775726442
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b99add7f3so356759f8f.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726441; x=1776331241; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
        b=k1iRMmkFu2keiLuVyPVlEcxedTnq7sdrXEUSUH910eSJom5oGok6L1Dunh6wYdmCXO
         ElgP6MeUlX74SuDiHXIhaQH7bsvF6tvyjoRMgglfmqwXbqAwwnxe0rMmSmEZauJ9TFbM
         f9Js/oPHOSQ9IJo5Q/leFq8wTNLzZqA0advkJzj7r9801QqNt7GE4l83nsDGAswhc6D2
         bhRJrXLESy3Lflpspn5yDEExf5fZ3RJ2rJGCEq3zJ31geFjKi3CA9PGfyCuTUScSSJcx
         inEAvlJqB8ZkYHzGr/Ah1/YY3EtjOYXJJ5FbbPasD1/5mmg/YTVAtPoZXqYZJgFiLe/K
         GQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726441; x=1776331241;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
        b=hClyx3FP8FIDCdVGCUzLAdl5CGujUaDHH0ZI4wgm5qq1qkNqLp8n7bcZUZDMCK5miX
         sOPbPswNeL+WWzZnTavoFAyXQ73PpdPPQXci17MHyASLDox7G6t09TKaMhiX2qoqB83r
         emKjcpXgq62ZNMSejBxLHe8ttgTMJ6mThByr33+KzdS11vOB5CnFFAZYtx5S7qf5vu2Z
         jVuenrLkZd0ACD6ER/PVsEI2JuXPrBgkq3Z5RsIQsIRsOrtP8EqgKnxQwX3bKWm78ZPq
         lA2NZH/QDBj1HY8kvyo/YV0c/0VmwArYbi9Zm+rt+0M/rwhGMp0+lHmrQOBSdnGCAwxZ
         mCEg==
X-Forwarded-Encrypted: i=1; AJvYcCV5jzCBFPhE+rjg951csAEI4pZ+9y0U9v0I1wITzRhZU2+WZot4TdynMcPPhWnqY409c3wPYbzJUhox@vger.kernel.org
X-Gm-Message-State: AOJu0Yy715twDKnCQSvWFVGRTwqeRbLjpgeaPFhYbDnv4pjndBDqKdTx
	zfRZ6Lg360TKy+Zkdivh83y4hrN1vTAH7Wg9xNX0lBIdyGD2iiF31Y7vXC27kJGAr91m1OfXG8R
	CnpLD6nuchuUKX4cZ4aySSE+qpN1ou6FlOV83m7lIq4j0du2wXwd0aUf8n+z/M50=
X-Gm-Gg: AeBDievkaIiDIJMcjG9sIsc6l8SB8jRf/QAHScCs7CgWIk+xKOb1figCV2TYJpOA7Iw
	Btrmhzc5H9YW0FMhdc26G4uw9fRnhItSRY6/fdnSxMR5ym4HERwdvqfuqYLKrkiwk6uIw38V3vs
	msKN6sTKyTQ8dbmIRgIUVdt4/ek/5RlddWVIJ/6XFzlV9c92FZUwtM7lIwECmW5cHnQlf079qVi
	1RT5tjDWxz2eTo1QX9+QLh+5sMpRBBeQ1js0/ojLkKAY3id03QaHWjX9HQ5PiJ0kkcPiGm/8BTE
	F2r1ApRTP1sCNTBhITh/VW0KX9EoI9edDj9dqAZfecxzE3DGm4zexwLmukyqDBJwpiXLlyBAq1h
	A8XK/QKKT8xNPPgYhHIb0z4cnzy38S37jLOM7HxHO4ONroHk3VQ==
X-Received: by 2002:a05:6000:4014:b0:43c:a352:c366 with SMTP id ffacd0b85a97d-43d595c4f98mr4111478f8f.25.1775726441494;
        Thu, 09 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a05:6000:4014:b0:43c:a352:c366 with SMTP id ffacd0b85a97d-43d595c4f98mr4111430f8f.25.1775726441069;
        Thu, 09 Apr 2026 02:20:41 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm62963480f8f.29.2026.04.09.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:20:40 -0700 (PDT)
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
Subject: Re: [PATCH 09/19] drm/panel: himax-hx8394: simplify hx8394_enable()
In-Reply-To: <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:20:33 +0200
Message-ID: <873414jxr2.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Simplify hx8394_enable() function by using hx8394_disable() instead of
> open-coding it and mipi_dsi_msleep() instead of manual checks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

