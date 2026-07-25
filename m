Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6937F326
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967332; cv=none; b=a392h5/pMGouEMhhBLuaqYkNO9h0J7/hWXDmnqUlB/v3e1JLZ4fQKwD61BUNMx29pLXJNVbfuVodfwsuG45VJVVKBv/vhY6f5yWCkVwWUk6uIlQhqk4h7+YzcjUBO207SWx8VnokkxdfR2S6XUDkhsxQNb4RyL6KFZ4S4VZgrEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967332; c=relaxed/simple;
	bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ROvL8z0kpeUCiUKHKiJdjNQP7Lr1l7dRtRAvgS9FJVO8f45e3TGbrIZ/pSrHD8i6jfzTdL3vWcWEOGWGFhBJwLgaR1dNFPf+s0XJnLqZV+9HqCOCbXwc2+e+9E+djR2TdF0RaD4t3WOQycczPu0n+p5A7agexxmepNtuUNFgaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhEqJWWh; arc=none smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhEqJWWh"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c159467cca6so52461466b.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967329; x=1785572129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=AhEqJWWhM5S4ExAqgAlSWP4nplhbc9C5ajwXw+p6xQ3AnxDdqs7vg8IpQG19wW9ZNz
         WKIwu/cXWONBFE63Jyi1M3lh/HUKspqGq0R4W4CSXQnuJg5EfPsbdE9thRFIOkflSVOt
         xPd2b9ru/36cpG8MKj8StHbbJLbsahAWs43Y+QSIuZu37Tr1+21TJZWhBfbx6xAAASMt
         tRHj4ZSkPWGC3yUJxrVi1OMNviqLXoxXNBXB7BQv91//PigYDaHgSubZvpvPa2MXcenS
         bfNI7+f0FRk6Fsqi1DxVx6iSfpFQhFyM/UVVryrghYYISeW67LNRVt6I9LfdDgJGyL5B
         G63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967329; x=1785572129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=Ykn7bE3EEJU+t3+/MdENQzrtSr/nKNJvJk+fOTUdY0Wk8r3fOUyHGsyDRegTkQ6U49
         n4kaD4QiLG/YiFtUVwzl8bQNvL+FHGQYqCHr1aimIIuBC/fola63QIp/w5HwKro0KLGw
         DH2IH8y4CvvivOPoE3KpkPoR9JJmacKmyWy9YAPvdjxiFhFxYSVCJuz4/bw9BxH7/RU3
         51YTBe6yfZKIbavETFMJaQCtyB8wBku+1vNffBz8oYnJXSb+u6ObwDkeYRPTZoFOfMaO
         o6c5qnyP/PgEmrI6tLx9MICRbz/zpx08c/bKe4dVRGriJ3XUK/MPXH/M7umsOKbfXIAX
         hLog==
X-Forwarded-Encrypted: i=1; AHgh+RoOkJBQgU2pQWOPLeS5hbdSuEqUHEDpJBp+EEY9ddE4jxmqMmtvPmV/R2GgEakQySAwW5rhUKJgmtTj@vger.kernel.org
X-Gm-Message-State: AOJu0Yza6gsq/+5lDnU6cHl+INQAvPIGe/pmpVHlziVozaVQdhABPx7o
	aHU7/BZnEoNj+QDuerK6NvwZVEas/P8ne9AH16LH0009oIsxEvLjTlaP
X-Gm-Gg: AR+sD109oq5vf+CTGgGYVxAWWKZtkeTByhcSLNbK+TiS51+adIfeRSmn9MC6qEsmxwi
	h7toIUIAd7kjWiHOdW/l/qGhlzAXHJB3qNDZeD3p8djiUNkpJproKKiUNeJBJxczHNfEr6Rdyg7
	441h+3u8e2SyECaidwvLQPHt2ERjevL7kfBL1+4bbv+AvSR4i9YQ3qqgIeCOZFIMzIcrTkRyhDs
	8U2Dq4lY20cV46ygh7YwcwWdF7pptmcMaPEKA5kFCqAWlLouEa4TSYxxhzyeKs0dUI2AzCm8vtz
	6Afo3TJ64sIwjRFTA+EHWEuJG6nkWLWVV3ntIDAV/bBQGOoKenvRbVDnTBIlpECe7Yc7NbJO/yb
	0O8LvrUvX54ihtsV3VSj3cJ2ZtVd6TDibl3dQWqGVr2d5M3El+KaJ
X-Received: by 2002:a17:907:1caa:b0:c15:ccd6:79c5 with SMTP id a640c23a62f3a-c1f1eecc34bmr64140366b.33.1784961423771;
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
Received: from localhost ([2a0c:59c0:1::208f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm440790366b.43.2026.07.24.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Cody Kang <codykang.hk@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/17] drm/spacemit: add SpacemiT K3 display support
Date: Sat, 25 Jul 2026 02:36:26 -0400
Message-ID: <20260725063628.3499-1-codykang.hk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the duplicate posting. The patches are identical in both=0D
threads, this series and a resend series, see [1].=0D
=0D
Please use the resend [1] for furthing review comments:=0D
[1] https://lore.kernel.org/r/20260725-k3-display-v1-0-6de34d80e86c@gmail.c=
om=0D
=0D
A delivery failure on gmail side appeared to have lost the cover letter=0D
and eight of the patches from this thread. For about two hours I can=0D
only find 9 (4, 6, 7, 11, 13, 14, 15, 16, 17) of the 17 emails in the lore=
=0D
link. So I decided to resend the series with a different mail server.=0D
=0D
Sorry for the noise.=0D
=0D
Thanks,=0D
Cody=0D
