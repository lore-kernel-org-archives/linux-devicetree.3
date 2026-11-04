Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805259;
	b=uo0kqVUavRY7auEgTWW3Mr0F0KDccosquu+JcC9plmwZqAcqPdXiND697G861X5ofaZt
	 6aiWdR3Exvkd9AOuWSfocIvCyQYfJJi5e44WD4TVYT1FV6JxAkvpPd1OtKMEAipzNu5jJ
	 QDSJCGbGuEcwEyZwHCzmvT9AzzpisMOgkENirGMBDQeNfOrqFFCzLlCGTM/R6lwxZAdN6
	 7jGwY/vh6iYcjFLYWiasb47XkG4zSznV5Tf1jyJ/+YJTb+R3v+QTcVb+47FYM4VyhDfls
	 VLdtPc8y1puJV1qEj9sK0TsFdZFTArMwBatp62XTwZdvoh+dhp8TqYHXMYMmM8lHnOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
	b=ajXRljGxMPmBPQJcP8skBICiYOkUgqQjbSTK7HEXi9OiFqTuaieR3ukOPLMWPdTNlIQ4
	 knEweLoeWLFt4GahOX9rMTVN2Kz5ZZLuBtlf590EnnmDpdy5KDmkfejC1YrPVeB63o3fP
	 WZvHZC1Hu7pdj30sDtWL+DuOe0jYL32UkEEh7Z7u8Nbtg9DOlifYPots8wuugcGZUHzSd
	 r9o92Mw++ZFBCgzyqBmmbJdikWK/3E+NdMEaW19oyCuJL+wsRqH/gIsU4UyNjuEyRTy4X
	 Mz6LzLsV+nfC3NBSaLUZI5QDDV4XO1Lt2vErTE/k33AIv4XVHmi6P5X5V6CUaaTFWcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A1606A32F
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584A1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so125563166b.3
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805258; cv=none;
        d=google.com; s=arc-20260327;
        b=BosCmKwiP18Fo2RUx8/IPpSD/f/9AedYGLkSkHa+v1hcYyQcM/a5YLcdZaj3p9Vf0g
         kdVEH9IKHa/k5iafwzYN9GA/d7rtY/Tk2Gzwx5REV5Y/d5LYqDVlPnVoF18giGYiXvO/
         e2e1iBAO5cUAGVTHZB8InS/xZsjT/xqPnrCgVyyu3NBFeK7xI7PswR90QbDRbpXJ138b
         MRJxJZD6CG33Kp8NN9lEE7N79f411eTVvdPV5Xl0gdn67VlYpCX8NCQKFuBLXecsOSw4
         QRjR3AbYmE0lauaCPHPjf4lOCu0nH0eI1miJaoSZysF+//QvlVsStz/M/hZ+BvKeh/8x
         5rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        fh=GftXLu7I1bFWxqkNqIXsStZ4doWN3kTLidI9ovVJmTc=;
        b=Zd40/KsVnDHHdjhoNdqxXLBwkGbu5QQoCzGH3b0skczsmnbWfT04YP46hhT2piDZ1v
         bFUzz28vc0Bt6d3LRv3eJv53eFw+oT+dFV2GGnZPasjL2S0OAKvZfqIbtFTzExkGyx7o
         P62lEhqVuOvsiwEeMCeaNCMg+MUoPIPWJMeJDszpLBlXnXm0DcHjLTMe4XIC7zPhqUq8
         8sEQ3az4aFzOc0x2IVFNaTR8H+FfpIO2iFHs6c6l9uJffeVWhjV5CquMpjBsHSMyB/iM
         EzsdFEZFiypOj6gHj5tTcy5HgiiLQa57WJ76CnoCSQILyFYPGbrVySb4KYk/IrxmAscc
         QPcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805258; x=1794410058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=X4twjPvMo8O+/BkdL3YgGabPuN9DltmynN2uPyL45WP8/lgf2q9RpSqkWE9pvDG4ok
         P8LqF8f8bCvdIWISi5N0eUisbGtKhcofr5PLsVtXmvdmh6jQtOdFx8I+WtBIyX8Eqosw
         LyjWDJaho3C9yNu6DyNHRkKyz/RUwX6KVM1p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805258; x=1794410058;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=TwOp1o43+NaGo+U6Lh9395pkRjP7Hba0PmRsicz4l9Qz86BtIbUitYnMyP/zoGp27g
         F3MaqB3JXWxwhEHqUSfqY7nOpnqYUmY+N5IdfD7yiyD854U1bgKQPo9QTr11NAapnXa+
         kf/ZCR2UG920GtEjOjDcdV29rpb1g7vCLUzA2SRuWeCBQbaoqO4kIL46ON6gnatZoO79
         cN59ROPELEbryi7gr8fBfubAXzM05Gg7YAu6E4xD/BClyws1CdhQuiMPRcz0kp96GFdj
         3J4Q+e7OtJ0gMlJwRYsyVtHseOTtxHFqE/96beLBJLRtWJJA36NYNYmmA9BDpedFVnwV
         xK2w==
X-Forwarded-Encrypted: i=1; AKwUvBzfE68BAj3eiJKvqS+beBTPWeeZxJjUrOT9gJDO3ZLejdcLpF/iXjtoLpdrPMaEB7v/JrAtKE86gunC@vger.kernel.org
X-Gm-Message-State: APuU4Z8LUb30a9Mmaz24IATxEdfKn8k/mjwMSmlpnIOjhc5lgvoNfi5v
	YjrsiiwkcQvn80lI+E/kP5HItezGGsAHACbhwrafWT+vVHeMOst7ztRN25qOKHnRGtgdAM01Cj+
	u90iKgSirQNi5Jt98nFuVdFRAxMiuZEXL8aA3RotS
X-Gm-Gg: AYBFou38UCZfuJTun995zj3ln7M5ljOoUrVnCnJ6qWquhbbP2VHM0l7A9tasDfH09P/
	Nv3E3b3DCd6z3WksJXjNfbsUB/c41VQQPNMZSzswzLOQcfOXnluVRkhW98ElaLK7K//IfotGiUT
	8KVt6mv1KGeDeEAM+8OoeWLvGIT5Mag/6uH4aYq2tYksCzJlgxEoCUQADOJZ+ycycw8xaVeHNC9
	bdUhXnWO9MFiwh/9VTGv0Icgz6BZldACg0bPcQiGIKhVzewCxGjfCxD7WGQuL+EFb3SYRCTakQL
	Yha8ZDBwx4NqzJ/+s+24h62gZrzMn//mpTyFR8wYLNBptzZHd+pu5E2RBLB/YEHpK2f9YkNvefN
	0mm24/SkYPhL4qk4tV2aiKUTMNHyLFUYQB025q7wf5uKPd1YsG1YcnJLR/j96jqj9jBDCHBM=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1586536466b.14.1793805257870; Wed, 04 Nov 2026
 07:14:17 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:16 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:49 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-11-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:16 -0800
X-Gm-Features: AclHuK9ApV58fCR-2zSxW0lIXRwkMPc7QZYOG9hrN35s6jfXd6uS4NXmkfDPcWw
Message-ID: <CAFLszTi-3DOb3GxHdDW=kxBFWrynhnnrvXNdQLnkRnyWeSOkMA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Make fdto const in overlay_apply_node()
>
> `overlay_apply_node()` only reads from the overlay blob `@fdto` while
> merging properties and subnodes into `@fdt`. Mark `@fdto` as
> `const void *` so callers holding a `const void *fdto` pointer (such as
> the upcoming `/__local_fixups__` update logic) can call
> `overlay_apply_node()` without casting away `const`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
