Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974027;
	b=HbAbliblaP0CA86XO54qomfv2aj3ULyoa4/shyaQQ9GX6zoy6NPawVz/J4Abx+aK6qNv
	 lqYd8j0/ttADgIMO7TEMeUlYnQouOhyr7NK/LM6HqLO8OAJwVuA9AHjILlXBdK2Ijz1qe
	 1/bj8rYcWZUyLjxKBiNzLp8dST/Rw4CRFzhFfINpe3SGH9qZQPxfJ3zkAEjZv0269iKp5
	 IW/4iKwoepktqv2hLhPEcZXlnELRbZSG6YsFXLer6sQNAvOSr+EeUu0OU/LxS7OKEAgq0
	 Tu2Yy7BS040+W2YmYUTerPrjysjZZv2dg+tAJO7BI7XM4/PD7KMH+ACuxKGiDJDAX7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
	b=Gmlo2CbsoWWRGstpD+o3auNvkmDOWciU3YiZqK52KduDFm3tncLYQC9iEPWndkKpEng+
	 nY0QtAve6xTGPTGtJiOGVbADUVAppy0uBvxOpvoISJzes/sySnGbmmkzFdlfSTVW/W8tC
	 kHb4YEbU8KRWf7iM+mrJjX8YHHbY3+Wy+bSDSieFiXCt5dBb08MLodh2j8MGctneHLxAm
	 zvJ8FQx52gz8K2jmMLbZt7wHNJQ1yO2tTwRf3fnmmWHsD/TD9swo/qDPTjcDUp89VkbgX
	 uAAb6VVgG34sUpBgVjQtdLwHUGTcs0udoMrljvrxDlHxsW+ov7plx1OQlt7GQ7FubDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mrg+OS4m;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7263A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7263A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mrg+OS4m
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so322071466b.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794974026; x=1795578826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=Mrg+OS4mQTP9jdpB0a/wNlPzbOul10OpIuVBEQTOQRu/IM9l6Vv9oys3WA4/oXijnH
         JxbTeSTxlR/YT0G8X1QDW+V5POR96eD0KXR4BtFCE4YJU5YBjP2p21T0EBV5VFevyKJM
         U5a1gnsyl8HfGoN3ckYGDwWZplOuZnMojGpjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974026; x=1795578826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=vbHXNSFA1HgKf39/7JeYBu8+7JpK/tHpOZ8RZD9vzTWYxTGNKMeWEwYBhOiyqv2l79
         HABD+5o93N+XIiyxV/QAQ+F7Nt1j9y+JhbnliS9H7NCzEr0UVPcOdIoVFwsklx3QU5LB
         RjpVIcNwUypzLLYtSa9G1Io5cyatKrRrMdAltpPs5M6PbAcrqSfcQYeQEfcU7K54ULCj
         eulSFJn+yUQG1Te5kIz66PbFzAnNGilQxbR+HAnIRDsFex873W4kw0db8ambieOnd+Yt
         vAE6eZ70/LyJrJCC4m9XTUnkkDe2T6DklFkMyVaBDXjprCni6uL8Vkt9ZpC2eKdV/uDE
         UeGQ==
X-Forwarded-Encrypted: i=1; AL+hErFQdUVGsWbdk49FEBGrJnYvKsNgORd+R7jAOb+/ByRh5bFcvi8+A+WpP3estOQq5aaVaOjmb5Du2qCo@vger.kernel.org
X-Gm-Message-State: APuU4Z8JkN997f82qwWWXzvezC5V4Z8vZ+EhDAL9EOvJE3Zu3wEo/nmb
	jLXJvzQMDLEluH75unfuIIgCI+09rKaQh5N+YbnUDXp5vFokUX0bWEFPIKXBp+pHGOtXwO7Y//w
	c/xg6bnXO
X-Gm-Gg: AYBFou1bHZeBvu45Go7u3Csau6K8JoUMdpxD+3Hw8AeqMWhWA0z7LOiLlQrdOWXWf5j
	3x3sd6DDWP3gxUePow68QP9syvoUZXXbRhWn5V7/U8XxqQ9pgVX6Ifz5mBJ/93Q02OkHYA8DDho
	XxFDB+4U173lWRBJNg784HOWLVUY1T1snYwW82LOPVKgINjVntHThZ0mG+dl5xryaNwtxDXGw5V
	mzObNcWZln+pfOHvPkHfsyEFL/bqKLoakGs1Yc+f9yRS2LO+ycPkYvjgKkkxs3frtkZXkIX2mW3
	pwwawZj9jB7qWlnx3lOvtcQQw2byRljdrJaF1mNwB/qaTZRhPmSlMdKNRoMOZkdeu6eKG1PkElb
	HnCP5HWuHUOS8WQXyFVjENanmze8e67Zc3rLL8/VucHET2Fc/xLu//lzb7fpy9hubJ9JU4BsVfm
	osV62j+zH1wM+qeJujq7g+9xdEnve62U3jMcm2iMSR/D7XekZaUCCYZOTHnekzQULFAShEoVP+E
	qZbYrRQeGLP6KOTZP4Xi6wu5rcFKBTM11csac4I6yeBgfCzZvbagYlZkI3yzmjN+lfKhJOrjMDS
	3898A2Nquz29xu4795UWpNr0tMvdkjkKsvv2CKlsVM1xOAj6BsyCFLDfKn4+aL60fXpMpw==
X-Received: by 2002:a17:907:d40a:b0:c51:45a:1a5a with SMTP id a640c23a62f3a-c510dc7ade2mr113146866b.0.1794974025791;
        Tue, 17 Nov 2026 19:53:45 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca6271bsm50242566b.44.2026.11.17.19.53.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:53:43 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so232335f8f.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF/3Vz2AVQLF66HkyhkE2I5rL+TA/UITrSN7io+dn7H3W2++VP9B4jQMk4QgHU/kOK3+edHT3A1wjjn@vger.kernel.org
X-Received: by 2002:a05:6000:2893:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-4a3774cbbbamr10035694f8f.24.1794974022637; Tue, 17 Nov 2026
 19:53:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com> <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 19:53:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
X-Gm-Features: Aa3M54pcJVKrzVh9hl7PlSfdr6bBBDt4Ls2uHxZOi9oF_y8egwxD6E6UxsIqAlM
Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas Stach <dev@lynxeye.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2026 at 4:11=E2=80=AFAM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
> panel only has 60 Hz and 40 Hz. Output of edid-decode:
>
>   DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>   DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>
> On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
> 60 Hz timing from the EDID.
>
> Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Hmmm, this worries me a little bit. I know that on some boards people
purposely set a clock rate that didn't match the EDID because it was
the only rate achievable with the PLLs available. It kinda seems like
that's the case for at least one user of this board. In commit
eb893e34309c ("arm64: dts: mnt-reform2: add internal display
support"), for instance, I see:

> Clocking
> is derived from a system PLL, which provides quite good rate matching
> for the single supported display mode and keeps the video PLL free for
> usage with the external display, which isn't supported yet.

By picking a different rate here, you might break someone's setup.
...or is that your setup?

FWIW, it would be better to change how the panel is expressed in the
device tree rather than changing this mode. Can you change to using
the generic "edp-panel" under the AUX bus? Then everything just comes
from the EDID anyway.

-Doug
