Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3832C92A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132198; cv=pass; b=uXhC71aOiS4Ws2990qwD/cOmAaQIjrbKNTohBApP4lXlbEjForGW6UTojUZbF7yX/cBW81NSGFsVJ1I/XOTO6ISoD1HF5FOpcHjDiCDiSRXcZp9B4/eu4wOQtrdRag8GOwimUpKwPLzMBx85fKqFsgiuOuDRQ4/35D2j3X7nEpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132198; c=relaxed/simple;
	bh=VKMWcXMVP7UvVkz7QMUJ2T15eWcXIS/K48F8fvZe+IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMKdkuCcyEWUYTEkxuYEfQH/W3G8QmoboIhiD5mBaUyZZbDC5S2sPHOlKkELosBLJFMCw2GQKlOd/fk4Iy72bQ3/7PpuHuyJ8mm28nKds8vrepNeOjqRL5g3no5V10QuSwSxdRmc6KW+2g30HVx9D8NP7/l5LuO6R+y8uNExKNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lULXP3Ki; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lULXP3Ki"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so3631240e87.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786132192; cv=none;
        d=google.com; s=arc-20260327;
        b=QsU/adC905+3NKqzYcCh+ZHE4UbgoUC8yNFpqOHYmUppzaDVJYdYnDgSaYOHGSvPCo
         opQNTsa6zleA0EtGBKAaZ7H2sUkro0tMzPb1cdNuqSi5nTh9owNj5oA0OcI2+CIhnTvw
         FVr6m3CNs/fYmVExBP14pReGifu41V/YbQppugaZiNILIxS6jvDcWw8Bp9oyPGATYwH6
         gz988QFTMX41IThFg5mraQDc9tFMK7j0ZN5+vImXa8ZlgJwf38AtjdKqAZ2gbm0dcM6b
         XFk7EVzdREvA9aCMr6AKLlf+Miovu0Iv8TBcxAheKuCt5ZtxLEM30HEBJ3xtEUlx3Zeq
         ihNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        fh=fNhbClTjJnVeUwPtAtIglXHzlHNmkCKmN+4+TXXHbQE=;
        b=guLX0ITCewW3omKDtFrmsOk0Q4zWCoxecugFr34+Vdo2BAHU/dwTGKyUxwdRgHoQDE
         ISlUu+NLDkdK4Wzmx29cVVTQ7GV/j1C8SrbYSBI4mgMS8X5GL8fy+7Sh1KZ0ZhjKwWr9
         nY2nBFWdAVJsZIP334TfCtQ5DF7j5xt7dGO7LbR3hMb9jp/WtCE5QDBfTTmxPtkxUigt
         yL8z5uxNG6VcDOnzq7H66eNx/+m8IsOFGh+jgyZX7/rWhx49PRucmaYKNHtiWIrb/exe
         zBbIxXEP75/4jGKLb48zTde/HNNjiWnkkKTrJLDVRLP7kWFB5iJn71e4faHBLL0Iq5TY
         qpAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786132192; x=1786736992; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        b=lULXP3Ki1idUu+/iFZj8OMV+hV2dQlCvoOa7t42xuD6zUz2XEse/CwVbmD+Vr3s027
         IhvkDtkIOoNyIfkI8Wzo7msLCjWh+U6mK20vSVyPeLY7qJsUdv9FYmhmoyD4JwmXhoqp
         dThggtbFZ0M5Aqanx9GmfXYwNLaFO3JgRJD0/WA3D2a+p7waCC3/mS78jqttH4Uy744C
         qEJwsvg8M8D4BFv6wkdN5J6qYIREMoNx+AvzuxwceBF/jYRq5YyEAFb03cmXF3Oo0MNf
         xnD3bcA3bqTBDGvcgUFa+279dKJm/YOn2ILq/z63YyxtTNamgbgSyghG5V8/82pO53A+
         I7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132192; x=1786736992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SxyKUAmrI0LwYfrXT8fRXwyn/HyoaEU+MOGavpvLNWE=;
        b=aSz/2D9NFhxs2g0APuBlqbZ6TkIGtE2KpSGkkAG7oB3+KCjN+FOODNAXo5IT3IeB/r
         yzW4Kl9nroeFdmR3Yt+X7COZVthNsRVVfQoQJVHtJ3Xnu6sON9VrxWdsA7GivAqP5FqZ
         ifqxN4peTysIf5R680/MoVK4bFfK4hk6nNcLBcld2UaTlg4pQNv4/vO6anyJK+xE0K8F
         6u7zq5Z/BVOr3YNAZoOUrGVsBPMM75VACsDbeu7VpjYvY+yZOrdgDfY022JcVFFL2WQL
         sT1ztIxzdVu2/Mr+Nr4LIjAHPAqRFVQBe3ymsT1QJYVIQ0BRvw5oEag+TqG1erD9AN4r
         TKzA==
X-Forwarded-Encrypted: i=1; AHgh+RqTnwrxTuNDpUcwUppjSY1mGX7ZrznI30hNDDmW6MFhOvGO90xFUQWKeSAMP+Lxwys/eJjMx9w+52uV@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZMotP5zuDI2U4MnGrc1DTkGb+cr/TxGKrM3ZtArR+8kNvZuC
	kkX3mhk/KWypa4MTDUPpHmJRxHvknB2t34gQBHtR4A1RnhPiJn7qJhv8/fA99qcX39CWQ8kdht2
	jX3CSP8Q6PsOiLB960XN6IxjTKiWbqOI=
X-Gm-Gg: AR+sD10LB/ByZQo1vOL3JWBEI5QfgXBDSvsafcMeKkDAoY4C4lvwBtl3Z4TA0SO7Qii
	nZmc7BAS/ttqQI8+5wNknqTrGPAc3qqBeDoLQn9lyEIs5QaxpvSfRr0Jp/vaOnTdTDwG+Y9qiFL
	oeitUm7oMrSBMbIviqN4Xr2UKQyWGddtCfSEWnBQHH2EtV/zIBgCUc/IpX3o3VamjyErtMtnJQb
	UybznFRgZekNBzEeOIYUPzb4pdiy5peP4lkewSe4fdY39x3UjDqxjNIFBWynBWiolyeHOa/3aN8
	CrewnD8N7dgiqSd3w5ql0sTy06ZScO0zUGd6Kid+Xgo/n4hkU7DZTjuhIJYTS4QKxmmcAAdy8io
	kzXIiZDxVfvF9SBx8sulsw9+KxA==
X-Received: by 2002:a05:6512:3c92:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b2f4cc45ffmr3489843e87.30.1786132192296; Fri, 07 Aug 2026
 12:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com> <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
In-Reply-To: <9cf8e6ee9c4c655e685708bc5660429074b18326.camel@sipsolutions.net>
From: George Valkov <gvalkov@gmail.com>
Date: Fri, 7 Aug 2026 22:49:40 +0300
X-Gm-Features: AUfX_mxRBT9-U8Aa_GHxuMmHTk-qUbjASbhV_06GViPmHzIDoVy768Olpa7FjGk
Message-ID: <CADOrJmbhdWhqRj_TSKYEgb_TrbJUpkQeYTGDb_93WSDdeaJPpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on WRT3200ACM/WRT32x
To: Johannes Berg <johannes@sipsolutions.net>, sashiko-bot@kernel.org
Cc: briannorris@chromium.org, andrew@lunn.ch, chunfan.chen@gmail.com, 
	francesco@dolcini.it, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com, 
	peddolla.reddy@oss.qualcomm.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Johannes, and thank you for your quick reply!

> You're supposed to always update bindings first, no?
To me the logical order is to implement the feature in the driver and
then enable it in each board which needs it. For Linux just WRT3200ACM.
A separate patch for WRT32x should be sent to OpenWrt.

Please let me know if I should reverse the order.


Hello Sashiko AI,
Yes, I intentionally implemented the flag as a root node.
This way the new device-tree property can be reused for the
other radios, which use mwlwifi, and also require this fix.

It would be inefficient and impractical to define a separate
device-tree property for each radio, where it is actually the
board that is affected, so it should be a per-board setting.

Also my attempts to use per device nodes or the parent always
return false so they are not usable.

I do not understand the part about dependence on CONFIG_OF.
of_property_read_bool() returns false when the flag is not
defined. This preserves the original behaviour as if it is
set to false, so the feature is disabled.
External radios which do not implement support for this flag
are not affected.

v2 of this PR used of_machine_is_compatible, but there was an
objection that this adds platform code to the driver.

How can I add binding documentation and where?

On Fri, 7 Aug 2026 at 21:39, Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Fri, 2026-08-07 at 21:21 +0300, Georgi Valkov wrote:
> >
> > +                             /* Allow platforms to ignore an incorrect
> > +                              * regulatory hint from ROM, so userspace
> > +                              * can set the correct regulatory domain.
> > +                              */
> >                               if (country_code &&
> > +                                 !of_property_read_bool(of_root,
> > +                                                        "marvell,ignore-regulatory-hint") &&
> >                                   regulatory_hint(wiphy, country_code))
>
> You're supposed to always update bindings first, no?
>
> johannes
