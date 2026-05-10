Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998836494F
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402092; cv=pass; b=N/fb585HoYNkmA9Fx8TVWAcRnI4HWb1FKhTHAiDYwyRpYCraC+xK3iobeyAtuBiQFg/XAMODsUn0r1ZzVEH04uaIpfi9xUfzJX19HJ0/d2+55xLUluLf3X+bfuz9he/KLycDrUXPF0uZ1WuonM0D7DlFLo++Hby4RXhJy6bMm/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402092; c=relaxed/simple;
	bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbGmlcm71K95ROAynadwWptz2RAswHM7twF24IpCR7VrfVhrGD0WIkpRZ77UTiqeTH/mfLlPOvvmqsJ/T0LOnh2Q8yiF3hlNM5vsd2iKoMtRwfUtoZy7THTHUaXRyjNk/zcL6eqFubbbHovEVInKW/S/yUqMCRToeYBR4O+76Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1sX+HyD; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1sX+HyD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b788a98557so24833805ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778402091; cv=none;
        d=google.com; s=arc-20240605;
        b=QTCKXbodO1wrhFxeeEIBJZVEYD21ZvAml+CpiLSz8Baj5fId3/RyqYNQgo+la2DHpp
         GavurA75x8r5zddxSOFdhcxNlAPHnBLr2kt8R8Z3UAGpSpYIokPKGUoO87jMXCgoabWf
         ZvUZ3v235nx9ulYCbPmpIx/SlLewjoy7xzpiTG3f+zG8JcmQSu9pLFdLEi8LMrhtqKeb
         LjAx1Jy4/AWNAOMpyot/w3U/aiYdsD33pyape6m9MAzOi1UNIjJ+AY3A714gi/ZuiQgj
         ThL5g3YjprLm1vqREWtOoZgXqfC37/s9JCyB7XIDBB5vJBankkA+5aJURxhS5JNiXLRz
         pCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        fh=hQnTVNWFswK3vbG67JQCAGTiyNNJQsnqXftVsMarICQ=;
        b=eCT0zTypKCUgBAUY3x7JXxIByP9Xo0lkdH2kADR/5hrHgtWgWdwWkHuEoeeKZOHzKO
         /YBfzsVN4GA5GHCk+cebB89WBOIc4aXZV6aep4b7EGCv430DjjXqMXKim1zac/sRp/i+
         CVCxeEQ6mui/klZOdrQP/1uGo1h+DhQWUQCDnufPq5JR1/UhRBip46824KPMkBWyui/I
         9RlWRmkIRkFr6ASpK4oqS7soY7z4B1R168KnR1Y9LRb8NjVZtK0pNKgPKf+jLa6Zhv5h
         VitETsOKKplUobW66K+DZAWm5hku5twDoLDcna/TT1NC0nEbrmU1wPNoQUhIT28du/U/
         7IbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402091; x=1779006891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=C1sX+HyDQAgmMdNHjY3sIz4GOi7WJ2B4jFhkkVU1shNs2RfqrfDUgtJTTn5QX5BnD3
         NexD3QBMcE3ITVD0DHdDj14tufdA2K3nZUu3ljoHkLoObZvQctgbLOJimlvAzRnmRknY
         cFUeMS0+rZxMC5P2FvyqKykCJjO0Q8aiWxkYYEvXvwhEIkKq2TsfpCnRH96aQig94L6k
         oAqCKQyS02BMnTzxHZwfbsgTyQvOFwmlpsGEUODFDvpP7Auw0Yx8oiAEPn4KzBevBll+
         iyInjt0H2+PWUEdn2cVEA3qBbRrtdiC94x5kpuofPaDJbn0V+iITSwxnSWoggGGdB62k
         HslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402091; x=1779006891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=qtNNCTDjot9eATcwDKB+6cwAEaiuxeqaF5UAbVH+qyKtv8vh2qt+Jrt6lPydq5DBN/
         2qApNfuzaQ34x5b4w02GWXo7uNP/6wjfD5r8P5TSMHrGeCs3yBuMpC0JCRw5BK8ENIFG
         1RKdOrWDjQAWHUQ1SOY+MKhJtuxK49JlF4umW31qrvw/AATYbnRYZkAFMCJlufednvvo
         mfkbt25wjer4wK4Yi5yTQXrYjsEIQtg8GSstJtd0eX4NmKHz9zWW1shmvU1buBy4hOFw
         YtmsLeheP+SwpTpcHx7xOf5ZzQiD8gOQsSpV2PcnEB9Fk3yDQ0ofra12BWexedj1C0X1
         h8cg==
X-Forwarded-Encrypted: i=1; AFNElJ/df1A2Xex2XpX0DuvHKHNaXgtOsPBp8ExAD0IlHc0m4mQ6mYfuchBo49ap/Efbg7YA462e2GPcE1JZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw097gUfx5hD0U3Tlt0AbKROqdpiOAO7sARxTYHm3Ig2zpMsrVg
	MIEw32WXnVHChoQEaND4rZZYzDwQiau/Yo0JmhkvKPE2RM5DCmlt8V+8aaGaauDEtnjoQ0XaZ2v
	BPU++xQIfWoB6kCEMX0pCU2vMh81ydjs=
X-Gm-Gg: Acq92OENWCKbWZom8LnL+qTVEGmu5w1GFJedlY/9sPC366aB9m4DawZ3G+1aRiERIPM
	/GONcwLEcP3dOhxqy1M0sXoNyj8gJwG46Ln2hyqnI+eLXjFINPszDENta1dkm5FuU+WAS6t3u2d
	Xp+cteBI/7REcEUXCTZx4/LssJg3B/4oz+rfzqwJhKa8VFF+0Vq1mUGq1xc77hT6oh0E24iaOyF
	4c62IvTZdkYpgMPLSasc7YWwIsC+v/roFRPapsEalbz0vEvvA2PuoXuxSbCFM2Ho6A+nM3OKf4X
	y2KQ/CbZ1F8SA6F8VFmSI2uVOHSkCgVhHVU9pw==
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id
 d9443c01a7336-2baf0e4fedcmr101160115ad.33.1778402090680; Sun, 10 May 2026
 01:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com> <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
In-Reply-To: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 10 May 2026 15:34:39 +0700
X-Gm-Features: AVHnY4JtIFjXEfpi29lPaktBvsTRJzvsyk6zoeOhoHMm2kGF0XKoWYVx8WWmEro
Message-ID: <CAABR9nFw8RL8_emWR3qNLmoG-hmkHAgoEBP+4odN2kSyTSmtug@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Since there are quite a few related patches, I will send v3 directly.

Regarding the optimization approach for in-flight IRQ handlers, please
feel free to provide your feedback on the v3 patch series.

I will make further adjustments in the next versions if needed.

Best Regards,

Phuc,
