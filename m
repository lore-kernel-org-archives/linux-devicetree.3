Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649B35A3B2
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339754; cv=none; b=UcxTA6C565IJxKbHL0+BJX6sEIOqmziH+rLGi7u6/HxzV9FQnFQEZx73obngXmBK6JU6/w6Y5SlaO0pps+SAhtUJ8HxojGgx3C+2/S2WwtW7zHtyRe4dl6joszpDnxVymGndzCrSuYRjNalzB3pIk2e3NF46cITzlGSn9JIbPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339754; c=relaxed/simple;
	bh=vd9uo414jAEIgy4ZN2umRK7n3iiTZe25EdUOrW2buJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8LXvdpvj7tI3GI6wv4OSec2biYe3J6upmc19Mo6vjJaBKba4KJu4VacGg6mpAU5xBf2iDLCqUltnuq10soOIBmCkHE55Zco3ui96GsYSbHLtoYWcqzRB1zSv59LjmhjrYDyYA/dIozYVrRNfQpwkrFSokl7dg/zMrBltVB5v34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YdSetXMr; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YdSetXMr"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so4964528137.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339746; x=1774944546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=YdSetXMrMN/QmYoa/+5u2czURYWDISCqKpvTxv/YgNHTMaJFYmzY+M2SiFkTIpf7nL
         Rhx2ThNUcabiep7KOuHS1ZJ3ZAnPsy+BJMJVzAP4sj87oTiNHjeI26JzadFPh1uLoItP
         MEgwbXd2vW656roWTMtOGc3175uTBqedc0inI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339746; x=1774944546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=OTUSBDQYn+Ya7dl3IxImsiaw9Q/852y65iaakKzcM/o7GUxbY3cE9+s5jB4VdVnV2E
         h7s1wpa3OkOnFWpwQNnDZMyrCW1XLtzPq0f3Rd86bVEmsAtyx0hO9ELydGjMS5lypDsR
         +45O/zrBYtA2uxNYE38vj64W4EeMgIWrtWFo/0P9bnUvblnhXtc/AuHl/05laTfGC2jT
         FmUbhQCVT1p55aYhmQN4ODgaTSHynvE0WNxcehfld9DbTH1DcdDeWJUDAkiYbE5diTPp
         VhboVIJQKPUFGJrults86N2/ZXXofredbOXJB9owuQs7LMhl2lIOiaSX3k+bTjVAAnQh
         TTMA==
X-Forwarded-Encrypted: i=1; AJvYcCV5cMER6dMrkQbyQd4Iv+xRQ1wGUJ2xd/h+Dkz38aReD5Ircn3rvikwFFtJRbTVRMIy3pSm/qzwaYwX@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6nf+L9PDh1vUZWCUa4pWuwEnqoY4wGzoJ887Dycos9wwvc4M
	oDUQxpvfYmJD7wgVD26Pcr/88D2H6118hREpg5atSrqwozMF9Iepu1/LM2tF27lpzGuWd0OV3W+
	ItLc=
X-Gm-Gg: ATEYQzwU8w2Wgep0mhqSiJEG9FFS2oYYrUiUPC+FdwPWtKoJJ8ErfRIDfYXLb7QuIha
	NKQEq4raPWdAQXpAiMhMYlbTbks/BCkl2zIstOfPIOAUjf8dy1QCmjkCqc9Hnk86hZPPWm9Qpgo
	+iujTuW/WbYvlRH6uHI0zqocaUucQWp1Tz/aJHvuw/w2ymSHS6gJRpv3Mr/MU/08j2sSKeH5EUE
	pe3b+uXeia8XCfJeKHWcpqXMgbObSsRpc6aZxq8czVZdSQXdhTIpVW7EzSJydli3Bbd0C2I1sqe
	o3LusoJ0amCR2r66rjA0Sly1+DqrB1KXbnaVQrOLvzl4H0+mxJniPR9umgY/83k0lDkOWET6j75
	gBWRZT0vlP2bZfzDc+B3qRncF5NOs7CgVkwrZwTeTxE785GiPmkjXTLX/Xo68arvm6fY0nVdppr
	a55+lZeUh5Chk89v+OsQl93CXol5qebD78aPq77iYYy6saoWcsQdI6UeBp0g==
X-Received: by 2002:a05:6102:4b82:b0:5fd:eacf:27df with SMTP id ada2fe7eead31-603160a2310mr1358753137.10.1774339746218;
        Tue, 24 Mar 2026 01:09:06 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm9832289137.10.2026.03.24.01.09.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:05 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ddffda372so3828854241.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXa4JVYZOxeurLUvFPxsJxVmy0AN88Kp9bJfA8e7mqiOftpnWuA8mCUNpsy/ELYzKnoo+YwXbcw1LcQ@vger.kernel.org
X-Received: by 2002:a05:6102:2b8b:b0:602:91be:3506 with SMTP id
 ada2fe7eead31-603160acc76mr1148240137.11.1774339744256; Tue, 24 Mar 2026
 01:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-13-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-13-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:08:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
X-Gm-Features: AQROBzBA4rP2zsCeaLi30ZrkxDrzS3ElI-DHHIjgmcs2EqAF9GjEhjgWRZZrfYI
Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: mediatek: mt8188-geralt: Add MT6359
 PMIC supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The MT6359 PMIC has a number of power inputs for its various buck and
> LDO regulators. The binding recently gained property definitions for
> them.
>
> Add the supplies for the PMIC regulators to the common design dtsi file.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>
