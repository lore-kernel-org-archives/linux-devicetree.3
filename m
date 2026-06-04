Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96F29AB05
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608228; cv=none; b=RjUty5k9aGxwR5/6uEBRARbkSE/5aZrn2XjDLDefOnJIXX2TfwHycwd2bmRxXqK0u0kEfioAyKG3fyD7sKdJKysonkzylHAckqm1sgGEyASemcRDLiqJqSOVRg7ljglVfKTFf5c59peIp7YYuPXxOIz+Z3JpPqS67jZszqZrNVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608228; c=relaxed/simple;
	bh=56DCBwbBpEWN7ab0NGz3+vg6p3n+Q+puRjJ0XIHeC9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Poo0/tE2d0v4xGqnGa62n0KEgjvLrYv6GlNppl/ALDfgxBM8pj1ZOHhYaE0AMfRg9IXhZH9jg14Tjz+uaEJDhzLJQ8X7dWh2CIH6r7624osjVzrlLtQxzcrUdROf004+T9+n9uEW0uWDh5kp8bpApbGNgcVXe/KIvkIOVqQxT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dc0xtxBC; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dc0xtxBC"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-96395a59ff6so462381241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 14:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780608226; x=1781213026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ywNOCiZbOBaXvTwi0yahMBNcZD2OXLAw/3rJV8izSk=;
        b=Dc0xtxBCvD3mSSret+tSKuTC/zuOMk+AjsqnfkSQE1AfTQcrsia+OP39Wn5NHn/kMc
         CYaTJrbCgUC881zNwwiWGZcY6J18BRlszuell9X2KeCjNvsBY1JkNzosePVuw6T8jniB
         lBCFuSuwbNvHd4H6nslyvHCZA1Va5VXYLy+9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780608226; x=1781213026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ywNOCiZbOBaXvTwi0yahMBNcZD2OXLAw/3rJV8izSk=;
        b=RdrMTjyqIFOruJTjrzV6YQLj70FUoMdEGYD2XpXgaGZO3YRUR9QcLIICJnldGxewsc
         1wm7e9KunytBnnrJ561R4qsl31Uvl064+DatGWsh+RzXrWUTk2cBgcmE7ke+uNFX1Tis
         WVkKzY9Xk0phxJ7gMjWjWCXzZWxOsEUwJafRSiA/pxfYBqHHZ3TsrYczktoFscAcux4Z
         5RKXsc3v6YOG9YmrwuyzGtFX9NTJbCtNGrLXhwvad3B4QINv2Oxo0sDQIX536y1e7iDz
         1eFxsQWmWvEc5PRNb8/d0aQ2b+WsS9/LQDjHiUighwjhPNbGLNybdpOJh+e2Wd7ifGbi
         1Dag==
X-Forwarded-Encrypted: i=1; AFNElJ+ON0GbztnWZWAohRP01BcfiUsc5tfmqC/JdcmpQ8GrGAG+Qy2YSZEbwttXzusNvXAneJEmSohNIWQf@vger.kernel.org
X-Gm-Message-State: AOJu0YyaaCi1hPsniNDry5Nya2BgY0LkCn391+xmVrQnIpRW8wTghkad
	xKDLkZnJbUpPeq+HIw+u3+RtUhP508xYaXIe4oXFVNQoAo58stqB70loHAnPsHxqm9SvaMGTLwz
	We4c=
X-Gm-Gg: Acq92OHnh/X9Xbko4N/yjgWbCgBwLP+uGJE0ssgcQ6bgShrU7PLOXErylKOI++rEj3r
	KZ6xDlRBu48f7xVhcuPjANUD7W/xNkbIz4aQBF0mvGzvR5QhoOS5kZ7Nt7u5vBfsWRxf8QOoBtm
	pv2XfY1RrMVNSa7kaaz2cn/krU/kDuhts7f9yK692IBhBNk9zzi4JILCDqfZCYUn+h/eOMA7szc
	wNT1853wP7H8tPT1LbBqnILzy/aHfDZI92IywjcAjsURe5Ad9i/O7gWH+GCqO/wNBWAG6onqGCx
	LkQSffQ+JiWy5Z81zzSNAtAIJcVJ+Nzeb1cfgWloIFNx8I4yCM+rKePt0+iGTuwnw4YGBAok6Qb
	g1CZBv3m509Zy6Fl01z9bHmKGmhN/hOeyJk0cBN5tLvequf41kWbFB5iCWxhE+f9vcH2m6b1Fc2
	7QBax09+YHkgFVhqiUjCm7EkhaRn4keAvDcmPW30TGtpQjJUGVwLMG31AP8ipV+GyYKn6+O2Ta
X-Received: by 2002:a05:6102:510d:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-6ff07cf332dmr359409137.13.1780608225596;
        Thu, 04 Jun 2026 14:23:45 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb6668702fsm5847336137.10.2026.06.04.14.23.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:23:38 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a35acfaaso418283241.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 14:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+aMA7nj7IV7ZforlsVwKPmVs4NMEuJ4KBFyLGeZsUdDoR2M/A4ofT2dsgBlQtRQlrCkv/+E3blbG7j@vger.kernel.org
X-Received: by 2002:a05:6102:5e87:b0:6a2:cf9a:a5f3 with SMTP id
 ada2fe7eead31-6fef26ce86amr349440137.0.1780608217159; Thu, 04 Jun 2026
 14:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Jun 2026 14:23:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc4MG7c0lW6-0qjcdQ-D0zLqfcs-TS6nz5hMf5r8Kr4Mvblgg-anJYVP1A
Message-ID: <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 4, 2026 at 1:07=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> Some variants of the Qualcomm Snapdragon X2 Elite-based Lenovo Yoga
> Slim 7x Gen11 laptop ship with a Samsung ATNA40HQ08-0 2880x1800 120 Hz
> OLED panel which seems to be compatible with the other ATNAxxx panels,
> document it.
>
> Note that I stripped the -0 suffix from the compatible, as it seems to
> be of little importance and some sources omit it.
>
> EDID:
> 0000000 ff00 ffff ffff 00ff 834c 422f 002f 0000
> 0000010 2300 0401 1eb5 7813 6603 ae85 3851 24b9
> 0000020 500a 0054 0000 0101 0101 0101 0101 0101
> 0000030 0101 0101 0101 0000 0000 0000 0000 0000
> 0000040 0000 0000 0000 0000 0000 fd00 1e00 e678
> 0000050 47e6 0a01 2020 2020 2020 0000 fe00 5300
> 0000060 4344 2020 2020 2020 2020 2020 0000 fc00
> 0000070 4100 4e54 3441 4830 3051 2d38 2030 c402
> 0000080 2070 0279 2000 1800 1200 2ffb 0042 0000
> 0000090 0000 0c23 5441 414e 3034 5148 3830 302d
> 00000a0 0021 ca1d 5e0b 4007 080b 0007 7ae5 8551
> 00000b0 b9a3 024a 020a 5445 5fd0 644c 4400 7823
> 00000c0 0026 0609 0000 0000 5000 0000 0022 0014
> 00000d0 0ad4 3f85 c70b 0700 1f00 0700 7707 4f00
> 00000e0 0f00 2e00 0600 4500 5fd0 644c 002b 270c
> 00000f0 1e00 0077 2700 1e00 003b 0000 0000 9085
> 0000100 2070 0079 2200 1400 d400 050a 0b3f 00c7
> 0000110 0007 001f 0707 07f7 07cf 000f 0081 731f
> 0000120 001a 0300 1e5b 0078 8fa0 6a02 7802 0000
> 0000130 0000 e38d 8005 e600 0506 8f01 016a 0000
> 0000140 0000 0000 0000 0000 0000 0000 0000 0000
> 0000150 0000 0000 0000 0000 0000 0000 0000 0000
> 0000160 0000 0000 0000 0000 0000 0000 0000 0000
> 0000170 0000 0000 0000 0000 0000 0000 0000 900f

I'm not a fan of the EDID being presented in 16-bit words. :-/
Changing it to this when applying:

00 ff ff ff ff ff ff 00 4c 83 2f 42 2f 00 00 00
00 23 01 04 b5 1e 13 78 03 66 85 ae 51 38 b9 24
0a 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 fd 00 1e 78 e6
e6 47 01 0a 20 20 20 20 20 20 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fc
00 41 54 4e 41 34 30 48 51 30 38 2d 30 20 02 c4
70 20 79 02 00 20 00 18 00 12 fb 2f 42 00 00 00
00 00 23 0c 41 54 4e 41 34 30 48 51 30 38 2d 30
21 00 1d ca 0b 5e 07 40 0b 08 07 00 e5 7a 51 85
a3 b9 4a 02 0a 02 45 54 d0 5f 4c 64 00 44 23 78
26 00 09 06 00 00 00 00 00 50 00 00 22 00 14 00
d4 0a 85 3f 0b c7 00 07 00 1f 00 07 07 77 00 4f
00 0f 00 2e 00 06 00 45 d0 5f 4c 64 2b 00 0c 27
00 1e 77 00 00 27 00 1e 3b 00 00 00 00 00 85 90
70 20 79 00 00 22 00 14 00 d4 0a 05 3f 0b c7 00
07 00 1f 00 07 07 f7 07 cf 07 0f 00 81 00 1f 73
1a 00 00 03 5b 1e 78 00 a0 8f 02 6a 02 78 00 00
00 00 8d e3 05 80 00 e6 06 05 01 8f 6a 01 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 0f 90


> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml =
| 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 1bbe0da3997c3b06eccd18fe8980b58a6c05d963..27536eeaed8594c047dd0fa1c=
f425912be189508 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -25,6 +25,8 @@ properties:
>                - samsung,atna40ct06
>                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
>                - samsung,atna40cu11
> +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +              - samsung,atna40hq08

Sure. I'll repeat the same comment I made the last time someone landed
a change to this file [1] in the hopes that maybe someone will post a
patch one day:

<repeat>
Given how many of these we're up to now, I'm starting to wonder if we
should come up with a generic compatible like we did with "edp-panel"
and then we can stop having to merge CLs like this. All of these
Samsung OLED eDP panels have the same power up sequence and once we do
that then we can read them via EDID or via DP AUX bus to identify
which specific panel we have and if they need additional tweaking,
just like we do with "edp-panel". Do DT folks have any opinion about
that? Coming up with a name would be a pain since I wouldn't want to
assert that all future Samsung OLED eDP panels will have the same
powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
sounds terrible and there's no known need for a "-v2"?
</repeat>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
      commit: 6f7565f2fc85e9dc0d9d7594bdfc2b03c4e11205


[1] http://lore.kernel.org/r/CAD=3DFV=3DXvHu_NnahFOcfLV4XQm_mQkO5cG3YP+acRg=
C9AE2m6Jw@mail.gmail.com
