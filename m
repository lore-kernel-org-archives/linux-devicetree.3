Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575B33D47C2
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361005; cv=pass; b=jmeQq7eqU8gBhVjliRjRnAia7HVCBnqVRzjnO9t4fwrEh1DfYeuZPS0P+3OvitqghR/87KTvZBEt/r3LCjziEjhFL/RPsWyl4p1UkQaVP7HdCRliOMxDheVmYjTZWYcQQAJcBWLslcCMSIulmTNXQJ2hIAdI2MRGenjwGcWxo3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361005; c=relaxed/simple;
	bh=koIEA93JTZUXCDf3T11FGKxll/q40u9DMIcEX3lLTrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHt0ZYk3YBvzcuTz/d6v2s2D6v6V3bPiHDMY2ikYkcMiEPFo7kSNeEPmpo/QkINeOab8FBomJ0oKormrjs1FWTcKZUXSVvZ7aG3T7ZVKui5+RGIjgo/Mvi5Brr3Z9aqUUgwWrq6bKOyqJSwaMMctyAE44IFru/IdJJVDV/JLPsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch3L+Cbg; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch3L+Cbg"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4094b31a037so6387843fac.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777361003; cv=none;
        d=google.com; s=arc-20240605;
        b=CoohhX+zYRingbGBYpExUjyDIjqMg8Um04mgmGqmBhyqU9Jbnu1T/bj/DzQIq/Ex2B
         O2gWLfoLFCICV7L/IGyAmTF6vRVXCFCzSLbx0ioWgJri0sdX63m4RXJvWyPqlLM5gvPK
         Ov7wGv4h3wbQe0+obFlGnj8eM/9675DZYvlr04K6knEe1PqGY4Vr56khTsr9cKlpKMfZ
         I5buZLDAxxSN9yoE0uC1qE0v+WlrLPoV7aBCmVjqPFo0WMgAt5wA8Zc6hNlml2PANtN2
         Wypx90ZVO13b4bxM9HpGfCtU3axQkkpN6rAF4sV7+ywaWHQR96+MYfvmrWtZ7YvrahQO
         Nbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aJhMIdHzsLA6WrFu6/600XMZirRWTnyQ0tRk6GsQGCI=;
        fh=lLQsLo7bSzY/9lRjH4ERhXCcF8L4JL6imr3/AKp7vWw=;
        b=kueUryKZ2bdj+m1ca9FJoXivs1K/LsL9OniR9Aw5h8/VmNCk/1o2pYS5PaUQHJ8yo6
         MbYM7KCb1xziL2JyqFybSM6oZ/hm91MjTXIMHo/Lb5XEds0n7Ta1bL37jMu2yzihBi+z
         D8JTBr1HGjJ/LfK8hrrQoNLmeGdOVvzNVcJe8UsPVQokk3bFbCgN1VfwhU2LE6CI+0Su
         LPA/I5DbQUJDU5aYkOgHwbDNHJGYvygsXcjO2JQOi/OnfM91dIIrBSFHj5iokRfgDnku
         hs1vKarmTryVmybi0rneVA7ztKFN51dcpQFrhvVLR/0XJKpIBsunP+cVDR45C0vS5ROW
         Kupw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777361003; x=1777965803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJhMIdHzsLA6WrFu6/600XMZirRWTnyQ0tRk6GsQGCI=;
        b=Ch3L+CbgyIYEfgHdOi2AIh1F/QElSGDv0gN+SID2Q5SzQtuWwSEG1BF2cDtCgQYVGg
         HQDOktLTvebgzp38zI10n19otNA9PJ9+hlZ9FdKkwROV2RGEW0FBT+UeXRC7qdWD1ZQt
         22errsFTe8Tix62gYcBQWPZW8qtKeQ9rq7vuNEglaeorwBI9EHARUJpNy+4v+9dWQ0Ht
         aUEtpv5uXLP2+L/VLiR/jSHP1OJTQmJ+iY4DPhQBqlMFdlFEA1IZaSAHmgmwRHVbfaLO
         jBgYXaa/j4Ul7XHrUEEIMWvNmWZCmpv/ZyZn7Az2DrhuLcLRBo89YHx2xpXlF8MVQu6g
         ixSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361003; x=1777965803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJhMIdHzsLA6WrFu6/600XMZirRWTnyQ0tRk6GsQGCI=;
        b=j0EQBIVXHRE4C67siiAt4pkHAbQsHUzWsmYrtIvm2aDqApCp0jbDfmipHvBLI9cquk
         dhiOtpZhR+jcWO416/z+38eGH4+tAdmkL6V+HygJLYWgt6rMKe6L/CAY7yKDSr7jOD8g
         brq9VzMLAS7afidPwqDFthyoyj1MvHVKet5gQP8Nb5k1/KT68sj9FqnpImxk4ffI+dQf
         DGHmtVol88fUZBw6YARBPDZtc7cWh+CtQ6R8jT0AHOJyu7rhnWHQzZffuJPmVJI0yVOM
         3qPtWkjRUR5gDqXvffT/V8n6U8r59sXz0KUfBEnd1u9+87z1ovJqhxKoB/FrWHUjXH+k
         N/2A==
X-Forwarded-Encrypted: i=1; AFNElJ9+Ge8i0/lxmvqqLMr/r7PfKxRHA5sSvipDNsXzChL4ifC/3tMKyXPlFEHYyBn7dV9vExyA9g9/Le7P@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNsLy7PIIXaA2nPhDlN/qo8IYKsJt3j6y3atPK5JuqtvAK0iV
	iShRkMjdVIzYWfbeW7a3zumZCuJ4Pa3sU7nC/qyLvdvXGYESWbNq2QAOH6d+2/YiQE4FfBTMa0d
	I5bhS7xadoDLCLI1wIMic1LKuovkMtiE=
X-Gm-Gg: AeBDietadSVFRzw3Yf0a24naHC3ghqn2KsFczyI7PREjlLjbAuuYi716iFsJCcF4lKk
	+ScE1BYi2iD5lPC3MxMAYBArYmxKF8jm5qtA51Dp7cJDHozkVS9jwyICo5PzfEIxT+p28fcWPFY
	JR3y0kp6RH37rERrdY839EkJJ6bvyVZjERgo+zPdV35PgLlfcnNX9W8Rzao3RxyYU8pgZfyDQQL
	X8D0T4J+rxWApveS66nyP+Y74IZswvDkitha9OTJrDXePyBlBlfx79qv+s/QDKOkis/mnLpipSZ
	oSDTsqj/B5Hli54nYQ==
X-Received: by 2002:a05:6820:168e:b0:696:1862:b107 with SMTP id
 006d021491bc7-6965cba18cemr927516eaf.53.1777361003089; Tue, 28 Apr 2026
 00:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428063224.3316655-1-syyang@lontium.com>
In-Reply-To: <20260428063224.3316655-1-syyang@lontium.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 28 Apr 2026 15:23:09 +0800
X-Gm-Features: AVHnY4If7s9xAoiOwj15GEVLV2YCy53Ike0mnT00sCY4Oer4UXH77zMIh6XW9mM
Message-ID: <CAFQXuNb7++Ft9Cse60NM9oL9aQsojEj_NhVXdJp=J+o3UHFOtw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Lontiun LT7911EXC eDP to MIPI DSI bridge
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<syyang@lontium.com> =E4=BA=8E2026=E5=B9=B44=E6=9C=8828=E6=97=A5=E5=91=A8=
=E4=BA=8C 14:32=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Sunyun Yang <syyang@lontium.com>
>
> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi. This series introduces:
>
> - A device tree binding YAML file describing the hardware
> - A new DRM bridge driver implementing the basic functionality
>
> Signed-off-by: Sunyun Yang<syyang@lontium.com>
> ---
> Change in v1:
> - dt-binding:
>  1. reset pins use active low.                        [Dmitry]
> - drm/bridge:
>  1. use atomic_* callbacks.                           [Quentin]
>  2. fix the incorrect formatting and spaces.
>  3. add the required header files.                    [Dmitry]
>  4. remove "enabled" flag.
>  5. remove *fw from the lt7911exc struct.
>  6. .max_register and .range_max use actual range.
>  7. regulator use bulk interface.
>  8. use dev_err_probe, devm_mutex_init and devm_drm_bridge_add.
>  9. Replace GPL with GPL v2.
- Link to init code:
https://lore.kernel.org/lkml/20260420023354.1192642-1-syyang@lontium.com/
> ---
> Sunyun Yang (2):
>   dt-bindings:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
>   drm:bridge: Add Lontiun LT7911EXC eDP to MIPI DSI bridge
>
>  .../display/bridge/lontium,lt7911exc.yaml     |  89 ++++
>  drivers/gpu/drm/bridge/Kconfig                |  13 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c    | 497 ++++++++++++++++++
>  4 files changed, 600 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lont=
ium,lt7911exc.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
>
> --
> 2.34.1
>
