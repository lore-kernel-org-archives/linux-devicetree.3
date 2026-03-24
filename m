Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E543B4E8A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774396790; cv=pass; b=gYCWlpuLqLhP+dzPTcq5isE3piZfEC4P0GHptiU4otbnqehEqjZ+CR06+lThZhc4T5XY5GnKk1jaAC42Or6uVUvCpbgtLmeTSrcD7YdLjrWrh2+wA0hkC5gx+SefzI7wjg4Ee6x/TNPmeb2fAyvFeyTB2MzoHbHTRyASjZj6k5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774396790; c=relaxed/simple;
	bh=nap0O3EuZ/qoysrcqsKpH2z2J6LNNl9s5ITuqaxGIhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdVViW+5XWRWuSLdqljqI5cBxoIVjiwuyHHvRqc/+JRoWgeHtFecoLGfAsRlyJpF2B22n61OHFRJX4keZjwvH+EFZdjnw8iBqT5ruNo8/Cv8xYmEyJYrIC2W6/9Rjts/rXcRfy3qHKrUk9FDzBV/5lpC+ldvw7YZ7EMq2dDim6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c91dDhz3; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c91dDhz3"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89cc638496aso2963596d6.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774396788; cv=none;
        d=google.com; s=arc-20240605;
        b=ZymyccsWNvaAck1QXWbTgcpEFFOJwtQ6Jlft0h9lX+GuK3dMeOBHlG4zs1ezGxiynF
         F+Z2FLQoMJhesmAfq8R+Z3GjOcMqaoX9MaO07F5xI2jay8rhuTPGgVdQyg2p+5r6eW48
         AZU2ooSACFWahGPYvDgR/9RUgph8eygKi5kDj7t/dvcAmesE75q51y4iQKvFmw3QKB+Q
         /QTdXhNV503a3c/iaAyk7GZm2Y4lGY9uj+9dkg9k9ZJ1F698LYdeMbUCNl3j7FJ6WsIT
         iXPyw8WASlE4Ae05WhCSW3lpK2uxND50BdOQ8OcnULO0RxZ2agbQ+w3bcaouPCnour1j
         o5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uiewSMRs+XwlKBP4+JT5tYJ1so3OLkN3F3J3k0h+W+I=;
        fh=C8GQGCi5Q3U7HvraV9EGjKRKokt7loefY7vr6/6oOK4=;
        b=WLC1nGZR2OCCuz1FpSGvmQOqfMHBn74SgoyTYFuBij403JEP+hxMVlJreH5T76iw69
         o/QLCyuRSHc1N65txS0AFitctVWrw+XFkdjpwrfzGKLpr1HJgcBrK+7OKYLO45wSgrJF
         T8oapjtN+wVutkB9E2T1Ey6wE6StSGZ9FGWOERi31WpuEYenv9AaGL5y3PuJiZjNZA05
         MJTbLHqof+47Xsc9oVp/XQOGmJ7NyO8kJsVOlTPQVyhmaSOSfDaflaIgbz6I3UXofkSw
         kJCG/W3ROmctTfZgipU/BAP3PEmcbdGa75HdqhOEsCT8lZykJCxTIodZUNCSg/xqxQmh
         5o/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774396788; x=1775001588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uiewSMRs+XwlKBP4+JT5tYJ1so3OLkN3F3J3k0h+W+I=;
        b=c91dDhz3K8Q994kGQNv76xRdNV207bvEFSSxanrzhWgCza/DgJ5ivNoj/7/Ey4PnBY
         v8S/Ae3dFvzXa/cIwKhKeNCkSq6lMaa2abuN61zx/dvlFfndxxANdvDCFOrpL7BFB3YE
         gCbzzeOUFodq7Fh0fvTuYxmPGS5IeKa5L95WykUoqz1OC0AL6Sai5Yp366qnLM1wKX9v
         AcIynwalu+Xsne3zD5r1Q1eRqlRwKuxg4l90XKC9UA+6gQF2IAb29KFKaGDQesPTbNBJ
         kRk3/3E9i6y16oCvatfgpcnyuIH8767y38eZI1mUGwNtVEbUQXNAqBqAcJsMqJtzTW3k
         OxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774396788; x=1775001588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiewSMRs+XwlKBP4+JT5tYJ1so3OLkN3F3J3k0h+W+I=;
        b=JFj0hJDGyuRhU4R44XWdj7mw1ych9ti0q9fizFtGxlzGWZW2pTpRpKxQV5KX3aXDUw
         2FDzTTgo73bPzF09FrWubPTr7urib6AIJGhjlN2da1uWxcMTovETAH0VJTqpYKdm7ncn
         17HxW/zmGoPxoT3jh3zF2XX5EjsmGvZbxUVtWbRqKglMS439/Phs7UmPKr836VlQblBp
         iddKrFNQ+f4kuoUuZixJ2tvOoZRjn6iOqr3Sn/yiIv0RWZe2S5kn1aTsZWvir/uC2ab7
         8vjTidvtWd2rHJJFFaRVBwq9GrjwBH3dHLhhsqiBl/4ivjvXeHcXTChQM2bE70nEV7QA
         Ur5A==
X-Forwarded-Encrypted: i=1; AJvYcCWKLRMS2U+12/SE3p8bsrAsunKXkYpcVWQEk04SIZRGF2UV7Al4LWGg7RQ2hgjxtbGXzn0+cYShV6e0@vger.kernel.org
X-Gm-Message-State: AOJu0YygjL4NHfSDDloH7SF+uZ6yVymFy+WCHNsJPC+xHfK4fzn93q5A
	m2P8IIK/sVypMW7c/lCNYc9E71wiQ0A9j41TAqbNbcp5YARkgVM9h27n0bkht1nGQIJjjYgHktb
	dkgcYyGDdy1YnGmNk56fDlbiQ9KDVwoM=
X-Gm-Gg: ATEYQzzAxU87OIJ7rNAE4pJBK4wTLNnQ31HXAJ8AalhY2fXMphFoFbfdKlOMQXpMuLQ
	lC1569K1HoQdlxyRGKWe/4Tbeh/ZBL7Oyo6CbB7+HN8dthV+IHweu7L9nhFKaQMF7UCO5Dmiiql
	X4hAbcclavU4DnC1LoRjJJRanPjo374VfiUgNwzxi8cZRYBCy6wbljXfEL1aBaRfuUS9aWjZTKu
	zsvDcH5wmjz/oF95dde2SgMLplvppYr+vDOKVoFM5Swu9QI23g3yVUlq+fOmmK6BoMO3vvUHODc
	PWSoxsTrHOd2dIV87yKbr6GB3q2QnlQizbv9qGPMo8yRuoZ9l+In5vuyCj16w/5Hi9k=
X-Received: by 2002:a05:6214:c6d:b0:896:cc24:138e with SMTP id
 6a1803df08f44-89cc4b65e6cmr27219036d6.54.1774396788182; Tue, 24 Mar 2026
 16:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-lt8713sx-bridge-driver-v5-0-6cc2a855aafa@oss.qualcomm.com>
 <177345419701.98253.11507693763985665579.b4-ty@oss.qualcomm.com>
In-Reply-To: <177345419701.98253.11507693763985665579.b4-ty@oss.qualcomm.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Mar 2026 09:59:36 +1000
X-Gm-Features: AQROBzBAhdkkbQbtMmKagJBqy5qFRmo63QEe7wc-WMhxWlbYF3hp2JIC-NPKySc
Message-ID: <CAPM=9tzAQaZbzpVw521cwBc2btWC4AK488edwuDE5D+Z6d6QYw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add lontium lt8713sx bridge driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>, 
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	prahlad.valluru@oss.qualcomm.com, Prahlad Valluru <vvalluru@qti.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Simon Zhu <xmzhu@lontium.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"

Can we apply the two follow-up fixes to this from Arnd, this is broken
now in drm-next.

Dave.

On Sat, 14 Mar 2026 at 12:10, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, 03 Mar 2026 22:13:34 +0530, Vishnu Saini wrote:
> > The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
> > with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
> > audio output interface.
> >
> > This series provides bridge driver and dt bindings for lt8713sx.
> > The driver is required for firmware upgrade and enabling the bridge chip.
> >
> > [...]
>
> Applied to drm-misc-next, thanks!
>
> [1/2] dt-bindings: bridge: lt8713sx: Add bindings
>       commit: 130daea1cb6217fb9b9ad51453e0a06e8111b3b2
> [2/2] drm/bridge: add support for lontium lt8713sx bridge driver
>       commit: 4037c6adc1f99843b9076e7ced85db0f233e9eeb
>
> Best regards,
> --
> With best wishes
> Dmitry
>
>
