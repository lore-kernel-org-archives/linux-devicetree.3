Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1045DF5B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758948; cv=pass; b=gu2RbXliAfxYDkRnVP450CcaNUfDKsEDAkyO6zqhrLI+4QGUGabiQ12N05Ml6n+awUOJ6lENjC361N6kEQnob2rGTr+J7DWFTZF736sogMEPg9ClmJwBvBtJhlsixGTew4YKZUXQsO+IVXQFKDqAKNeYSjhEgD6VRhkYkmUbdgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758948; c=relaxed/simple;
	bh=LudNYNgHQKH6hdYc0e5cVfVYBZBCqVTtPXU1MdM7gts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik7IRBfP9Uxt8CRjK05QdM1KJU+GFoq5cEYOkTCKQMfM1tCkPAknTh9s+K4Df4PwpEct0LwaI1OHfKdcE1hN7nhOnjdrHXuFmhZvW0PBmRnKbXMgN8MjEyosAIqTqzvREq2MrZ9yyqnl+PznNxHfFHp1Nxt6nABkjImFIkYpMtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBIRrWvP; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBIRrWvP"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7813589eec.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758945; cv=none;
        d=google.com; s=arc-20260327;
        b=s70n1uLHUxtSP8GHATJnCwAQ2/ZmUwjNaLTF+T3Vn4RoYdHT/YRlt3Bjh+Q2JsHfex
         XA3UxCoA/c3DXQX6sWh//VMvwvtQp453/xKsHj0i2E6CzUgwjwZcH8QCsI0YV5j69cjG
         nzuWFjzMEfXYvk4MHtL9bdfF+siL0+a+eq0FjUgNu5Avvj0cHz5XRNx6/PKOhOti/1tN
         0c9XveujRIYn7AZDHejwou9Zi4dOrWMXNqxFNyNV6x81SR0qtoTcnkkhuzAkQm6g9T8S
         a2tr9BbMLbrp4bode9aJ6U1chss9TFtLpb+ZabgJZeXcPOvIlB+JO7OWMwQq4tzCkiy6
         rAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        fh=qPJ0TFsKw+K0dww8sqqyivOe+XGfvalnmi94ifqTQ0g=;
        b=hlSKjzmvlm+N0s5vOVxrqi6EJaJ352OirwSpd/ewyig80sY1xx5pVVzmGcsBLwF7RR
         UHdHZZ13/lGIzy1hF16qnhHxQtTJB5iMspX780GOgzdZeX1lIEE6MZrwEAXPk1+8DJJR
         NaCLQf8oAIW09iZmvs7MjJIDzaa3FTFxNtTt3hvuyDSuutLkhL61agYVtaeO9EGIsWGt
         pEr7kbjnBPUhQBhnC6h2DHED5yv/99EB2v71OLVDPDoGsRnFelE8t0nYDzK+SxElnM5u
         ad6BAiXNs9BfhfxK9U0r0GsQMPyZxfwmBWTPGf0skIHw/cB7P+VWpYz59m8Q7k8G8Cdv
         7Z8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758945; x=1791363745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=aBIRrWvPgLicUMdgdqp2LKbQiCRzODbl2m7RBZu9meqKBaWGbuExyB4QG23JPma/1y
         ZE0nFUeS/kfPvJSaDizyF+Se6oa8JId16R9eSivFfLSeBVhDJJqX2Aw4JDXatWMQJoaO
         J+oWq/Q6a8rR+XjpSji5bPPLEUGgEER0sVftpfQCVV4w3xlc7dtMgHWquDoZ3tewSkJy
         /q+gJO7gHRmxGXrG3+GZvz8EJFHTaDNrtg6SksY1hdofvM4W7ybSOQcf3VM69rf5CUFy
         TYA0X99kdIlHrJN41VBdqCvRIfTLVdo69swwjcqP3pl+bD+QOTl/rrSVT0PJ9T/y+tzJ
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758945; x=1791363745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=y/7qu02crmGuqdzpMpR1EFFHqw9fQlHFTYDdQMiGXwyAoz8rtGl7Bm3EicfOisZSzR
         ADPy5V9upTpO4AdZW3o4qLKl/7ZVKqKj2+I2cjuFyHsPttRFhuO3SS5p78nXPaGILflP
         qH7AitvmxgWflZKaEY6C4JKhgAJu8muaRa4ghQyFR7kri65Pnai/l5oN5LaB7YNc3lfZ
         U+tqGSEbGbRhz3rSmCDJFVJc+WpsoiU12TUCWbtBi0C7ttKTcYiSDxGyOXxio7tB/xGW
         5m/oWlpoI5AWNO8CN0gNRUlp0MKo7jN/bVK6hjfDE/NwbSBkR6venpWWSnmToU+72+tG
         KoHg==
X-Forwarded-Encrypted: i=1; AKwUvBzekKFJZ7J1h0IpYRE6QJ2Jfl2x+C/GqVxvrXaM9rt/YvbCnyYTUvtCEWdzTKYX8iCLtlegXtMPBya0@vger.kernel.org
X-Gm-Message-State: AFq9FYI980lACDzpbJOa1M08dlyaoeFUYAU5TtDkzo5cmKyiVIu6r16Y
	HHU+6j7QeSkf1Cjz/p0JCc7m8PA6+mw36StMnGxwVpcXVwIT5yXVPaBWEfsQfoeDlXLv1Yftaai
	7yOQybLFLDFtLttbIOAc27IxwRpZojSM=
X-Gm-Gg: AYBFou0ciHjcCtLbbqcPVPfGAOqkALJwk0DR8a8zZC89HU4hJCS/k9Xdic5WNYrYgtK
	Y1VdtaGqwUQc+6SN/0FDmv+UxZOk6t14WfxhZv21cG5leaykPTL9TZPIl7y8EggEvDMLsCePCTa
	Shg2BIKCz0UEWAhEkT/NsOHMloF8hlxhsqk/yRNaMzVa/Ie2yINaf85ZfnxDP7ygZNrYIUUTzuk
	1Ms0zqnXPO//SgzZbSLViHIIEFSjlgdC1rHqHwjFOZpbSSIaHOMimAFjYI1OivrG3KBfj8vqTKE
	+L6lxIBLCGxFtm/XDhYZQU10eJCwsHIwwSiKUS/lK/toic+6MSlx6/kuRF2gfCq+qzLqyCajGcy
	ITgDeQR4LkE72M4JlUR/bEuI=
X-Received: by 2002:a05:7301:4b12:b0:34c:85c:da56 with SMTP id
 5a478bee46e88-34cdc1ce152mr1130423eec.17.1790758945369; Wed, 30 Sep 2026
 02:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-5-clamor95@gmail.com>
 <arzMjoi2LcyfxCzN@orome>
In-Reply-To: <arzMjoi2LcyfxCzN@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:02:14 +0300
X-Gm-Features: AclHuK9Pghb36l-P22g_3lrlycHGrleGAXYX6a3Jb3oFvTmErepUHWwZ9_v-FXc
Message-ID: <CAPVz0n1WnhwOqz2xOp_0SsbgUFuYAf5YBByoMv_+XUDPANvhFw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/tegra: Add support for 8-bit CPU interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:48 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:33AM +0300, Svyatoslav Ryhel wrote:
> > The display controller in Tegra20/30 SoCs features an 8-bit SPI interfa=
ce
> > that closely resembles the MIPI DBI Type B protocol and is referred to =
as
> > '8-bit CPU'. Each display controller provides two such interfaces, whic=
h
> > can be used to send MIPI DCS commands to initialize and control the pan=
el
> > while image data is transmitted via 16/18/24-line RGB.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/Kconfig      |   7 +
> >  drivers/gpu/drm/tegra/Makefile     |   1 +
> >  drivers/gpu/drm/tegra/cpu-bridge.c | 427 +++++++++++++++++++++++++++++
> >  3 files changed, 435 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c
>
> This doesn't need to be a separate driver. It should all live in dc.c.
> Or maybe even rgb.c, since it uses pretty much the same pins and is
> quite similar to it.
>

I don't mind moving this to dc or rgb, my intention was to avoid
bloating them with smth that is not used often and is present only on
Tegra20 and Tegra30.

> Thierry
