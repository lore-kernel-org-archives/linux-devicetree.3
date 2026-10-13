Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE6521207
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924116; cv=none; b=f7+m3vXlAKTjqnGyn0K8yDQzziLLj5i27PIlTJETJaTdgSMVBX8Amf0so8QwnKz9WQoQMc9Vj3wkNigc96VIiQBXMb8yNAszLsRo6Lk4up7aKQGs/JCk6X2s9l1SSSzqq0Vd3hYsSKVf1G9Fj6BdjfRtbnekfgeNyhmf7X8wgJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924116; c=relaxed/simple;
	bh=vSdc/GgrjZjvW48jrW3QLCyEw09wBJTQiSl8ktErzpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNqKRuE30+yNfBKYFCMYKLu0nVM22vCTZx7ahx6Mn3KHIWMiSWA2T7gvco/8BhFB8032emQMYLATnywpe6Y02wo7Anmqn/C0bcMEZwF5lhtDfjPEhb4sJ+iCdCDAaY9xuwZxh6RbslzYobnsYlfaRCZHurui6xPPE9pJLv0hRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nPdn2NuQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nPdn2NuQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso441605a12.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924112; x=1792528912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=nPdn2NuQHfQl5pYdx3nMI7jMjfKcx0ihLtRy9P+KXAsRBKJzR1iaf92ytI5pvuaLs7
         mvarG5KKykGii9D0jnN+BoclgaASRPxPF10rtFv8ywhyUgmXMFdJVujDhMyNu4SeK7Vo
         ncaJiw06OKclKxzxSxfX0CmdCe5ACfjn7Vu4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924112; x=1792528912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=toPt+MvzyfGDPaBgfFM49DbMIhOBsY6q+Pa1pzVVu6xVVnWcOMhwuZeKhC50QaPe7y
         63ORLEu6UcpdrKkpWY9EQxbZyWnrqJOUHSB/o71nmacrVmd77LxM3pqu2IHd00wnm2Cd
         tY2l8ZD56z5y2KCCI6g4euVFsoFDqkF6C+ZbUZOLg79CLHgvdwSxHavFHAjE2rxSM6w9
         BKdKEeu+5qoP+3gPCs6ZSI0ubw63Sm6tmsFkb9AzSEjMsWKnmaGfMjLQT1iQcS08w0/v
         QJP+D6DfN/tTuBtwGcqw/0hm+pEPNm2wwCa5oqVGG3iiAik1OvzMDv4pzT+72wsCOmqn
         AvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBx61toierNO5ll3s05l9K3TLzNMIR5DI/w4PCKJLj2OnI154Cw+pzIqWtN95btoE3BbUNePN/7N3VpO@vger.kernel.org
X-Gm-Message-State: AFq9FYLFLwVIsv02MeutoFk4DdBTmLYxYUqaOO1APZiEBds+tGrAwOVP
	KklexpDI5d6TJCV4YDF81zmlBoih8TRhyI7P7rmWoUKEnTDqvEBebEX1izjVLPN90AGHH2DNswm
	tskgAkEKn
X-Gm-Gg: AYBFou2UNz/wGjfkx82j23eR1JNhMHP4UC00Mjmpb0fKQZ9Oh06jKvzsR+KHZkJ2h1l
	+DXJzdyoBob72gNtlPaiDJW3WUUYgL/KtPJtiDr7Fl1rGQwRxr3pni4JmjAyIKoV6alRQq1EN2C
	rF3Yr/qmEYcqPcmA21rEz2EDXiyC1o0eE0ojY7Dqt2YiatrAELElhOfjdWsfyFFwaL92NVcXxWs
	7xUe3v7miLDZ8Fez/wYOTSO60D5kUQiAk/gnsCp3RLw2O6AM3Ujk209zu0XsbQnyuTw8usmGSRX
	Ji0mCgCpLotrjmLMPXw084xC3lgjOJ8OwB2G33LRupOhySfHTFbCvGGjolIWx44amV0/fp7k8iV
	LUoUbtx8/Eq9KfzfOAUaDi3ajb1hNej7smHe93kvZDmJFcwt//TP2hTv6EyZsc2DusiPqhRpdf1
	QcDDB1KwqOv+K8exGrqjcbYKSILq8Q0Jc0PYoMeY23UjbGIQUK3/XUrF6GfRmok7mY7FHpRsBno
	6HjazdGfrwt18zk5vtz5zQbdNTyCGU+NvSVVg==
X-Received: by 2002:a05:6402:321c:b0:6af:9bef:cf75 with SMTP id 4fb4d7f45d1cf-6b17c1e03e9mr11718533a12.4.1791924112071;
        Tue, 13 Oct 2026 13:41:52 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203865c2csm274458a12.21.2026.10.13.13.41.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:41:51 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso50059766b.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwE/atUjVmxXlIH7CmSQcIq0+wep0Ke+uD/7OPxrrBarWBQhkWojJiNvmIscVeHJpn6h3fuj6aEW2QU@vger.kernel.org
X-Received: by 2002:a5d:4b4c:0:b0:48b:f92:1f67 with SMTP id
 ffacd0b85a97d-48dbaae6d3cmr18389338f8f.21.1791923713788; Tue, 13 Oct 2026
 13:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com> <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:35:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
X-Gm-Features: AclHuK_Kdnq_Nm7orMZLL2zoW1RgGH3OpgePi2fH32LmSKFmFT8VrWVBo8fW_FI
Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jasper Korten <jja2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> From: Jasper Korten <jja2000@gmail.com>
>
> Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> Galaxy Book2 Go.
>
> $ edid-decode /sys/class/drm/card0-eDP-1/edid
>
> 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
>
> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..73cdc2d37ab7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140H=
AN06.4"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140H=
AN04.0"),

I'd assume you don't have a datasheet here and that the timings are a
bit of a guess. It's nice if you put that in the commit message, but I
won't block it. Ideally you could reply here and let me know if you
referred to a datasheet or just made a guess about the timings so if
the question ever comes up later we can find the conversation based on
the Link: tag...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
      commit: 9125232bc2a5020710db1eadd21973757f740648
