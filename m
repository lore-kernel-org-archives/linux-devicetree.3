Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B453D9DC7
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365608; cv=pass; b=dDwpNke14AF3IekVBOz3HpniuNIu1GorgQw11FzntipbGin4D3iVQ/WYejkiSFBFbzOOPNkUxHqSUA4iNQsVQJVAdIvLdwMvEEvY2cDabfzxwYR9K6te/0U9UTqWcMq9iiT9/fbC8vgXqJWDisCGLU8HDgGo+k4+0P7A14lRHrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365608; c=relaxed/simple;
	bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fC6dScKhM9TvEnO3TG7yzhjSP/3/50CA0NMWH9IZjLBKnVXLX7A25jPiiCt++SclDEiAhU/LgaXD37C1/f5NflaDsLy54pwfg4QXs4HlYIpaG5FynQLHyiF8GTZaGEcOLx7rbg4m5xUlq72L3/xhssApovmkqspbPPluvtHUce8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+bu9765; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+bu9765"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f4acf7047so267107a12.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786365605; cv=none;
        d=google.com; s=arc-20260327;
        b=CbgUYJq2qI+/sw967DRtPIgNUhwihpG7nSS1AbhqowTxGrjqdFLG+a1f6dpG7n4W8g
         B1Tip76u8F4ws9aNSCioX6Jfmk7+/MzgbQsCO9LtQnTK37oT/zTlxZrIVF+fpHSILTYY
         EtajcuYpADrKpFLM2LqbAq6PUh/mVGRvfHMfsW5/S6Yq4tMzDQfAkzdHjNtezVKYHJUw
         RGfzFIL0C3UlNtcGI7l3P5Ze0EquVFBJDx5fkxWe1PwF9g26IxencfRnlGIuSKJy040k
         iTjjzVUYM/QIqaNPac0PpWDcEEViLEvFmUQ0C6O9KSiKo00lD2qMknpf3DmQyemWFnTM
         d43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        fh=6b/6ReXjDxpU2CheEaVTRx2jkXj3Xpr88Te96Juc9EI=;
        b=UGZl20Srv3UrjvXwRXECfqZo1hDYgsBRM3WA/B/LNVApvqJqaG0r7az+CnX3we26oQ
         QWegyFFkPf6+zHVFFC9DEWkRPvf2Np8wKMoqMky9NDE7sx6SpYhmPV3OoDBFeaX/EDfS
         3+fslT2njxa3757ja4M/1crZHrNvcIiRoPw1PhvSIEX6gRh6YAuh773CSjDaqWtlMWr3
         8vjW8CvbBGC61tciin557lJNQsWZ8L8pL0/loIFjGn7XN+5xX8AKaI3M04snobCyvqb8
         9wG7pYGDtKrl6VVnnDiyuDIinqGWtRDOSsM+i58WbhtIIlQEiavdc8CUk8MwQS/VBVee
         2/JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786365605; x=1786970405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        b=k+bu9765oVFkSjPN1HOpEjxdqYbtTERBNeGp8mFGHl6HPhlrsSulAnH/pCdYHaD/Iq
         l+Fca83G3Ui+FxQn82ZxEtl8029Nh7cps09Le6tbFN4xeRq2nI2jigt2bxKWcjscKXRX
         rPXmHbVv4OwrBRVp7bydLq8CKHSXwT//njxIcY1yYqqD6TP7vX9O27U2nHe/HR1+f4mM
         E71gXzXmFN3OiPG8sDZRlu3riIP8X14rJc+QZIp2PlhBEYdmtSCUJXp16oOHDPETeqiR
         UjE9wUrlAtpGUM3+xHvpnrmfs79rspH1Ur2Na9MKFRraWEjhPUtABHZ+r/l7lPLivfmC
         VVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365605; x=1786970405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        b=N11c3sUZFmVhZIdQHDibjrA2DL2N5P+pU2W2e6KMa2B1oDZMoZRT2BmPTFW6hmRROY
         WLkxIIJ56GlE31wb9963dEKCJ9G+hkRO68XzqIETsSeuRCz9kGS3vr4qTliyKVo5TDQ5
         6n+RC1FwBCsn8AluWzk9arfhKBMG1BdKcfvItKE1SanIWiFE8aC5yhX9f2vcciHJb/zY
         jenofP9HXd8yEffLPlMY/gZpJ4SnJeKXLbMO/uHe2JofUSXvuUJnoKg7FQxaQFQ8Pv7Q
         NHCsPTrwfYdk+s9PTs6HF8Ry4kHiZAkAbNScjnK7GCQaszvTuyUG0Bf8uhPK1ooGbvrZ
         t2lg==
X-Forwarded-Encrypted: i=1; AHgh+RqRfpXBgQI3lW6+jKfGqoM0adobOHNCVt8VmyGcMpqeawTTxbD09lQjx+96MyBPP/2wtZXAFvq5Trg2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5AKDjbgdDn3Dbq7P4klee42wMX2xtfspha13UdFIfOLiVRUE
	obd+ND3RKWqR4GTfhqKrPPcu8UK/+pOxJOA5o9uFgsGeRvKPv+MeQMz7oV2JPZMzGeCklyhpMMn
	mWW0iy6TWUysHkaPctu5+KwAGFyOnGkE=
X-Gm-Gg: AR+sD11cdePAQMK/U0LWn1tNwfFKqdBplbBbw+eU84aecBluoRKRJn8Uhgc3ZSd6BTi
	m3NNZfopZ/+hiwHPsEOPnp/ejrv6DTavtqH729oV6PMy4kBAcXHL8pTBQtuS70GhwKTTlp46Q0X
	rl2KFEctca86ms/VPIoe+XOMlQ4QORS1dMOt4+x7aDXXqkLnHfPbIDYcXi3H2PyHOc4Ra6yTNH5
	GTEckmVrgdkRVO82dBGXyqG5bFtcNkeGkxUS6nBqXhenbAOq7dLM8BYkVvcsbHh4UiKK2R/ydIX
	XWiiFYrDWZjiraUwGv7eKuEUC+oHkeo+yY4A8a2Hc79ExR1lu/yDrHsqc6oWBF8Lq3TpjwS/OSU
	PAg==
X-Received: by 2002:a05:6402:2351:b0:6a1:fd14:8829 with SMTP id
 4fb4d7f45d1cf-6a1fd1489dfmr3529309a12.4.1786365602791; Mon, 10 Aug 2026
 05:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com> <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
 <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com> <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
In-Reply-To: <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 10 Aug 2026 20:39:50 +0800
X-Gm-Features: AUfX_mwg7RyitAzo5nWhArTwTiYbA1EMZOXHMkTdNy0X60zc4wq-eQxbT6UdjPw
Message-ID: <CAPwA33KHoH6AM7HLMQSBMwy2-TS2A_J=QyLwcg-S=t2yQ+_78w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Michael Riesch <michael.riesch@collabora.com>=E6=96=BC 2026=E5=B9=B48=E6=9C=
=888=E6=97=A5=E9=80=B1=E5=85=AD=EF=BC=8C07:00=E5=AF=AB=E9=81=93=EF=BC=9A
> [...]
> OK, makes sense. Looking forward to v3!

Thanks for confirming the shared block and for chasing the GRF
question with Rockchip - much appreciated.

v3 is out:
https://lore.kernel.org/r/20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com

The shared-block handling follows your suggestion - one struct phy
per PHY with a use-counted common block; the changelog there covers
the details, including why the helpers ended up as get()/put() and
why the GRF mode selects stay untouched for now.

Thanks,
Jason
