Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2EC49620
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246492; cv=pass; b=CoORvqZlivOo+OQ0VwPoAAN0K4GPUzli7WzxqUA/hD/xQrQvQue+jdmR4OKiMS+HOd02MG6DI8h7avspGDVlvOjUCW6rjyW516MIwZvIsR7KHg+HyeYYD6p9zSpjZqPgE7vlQzDh6cVl3o5ItHA2eQmBay1xfmMawqfpqwMJA7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246492; c=relaxed/simple;
	bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKICUST6PpCLXThSzcWdHIoSKRW0D4oFlHzE4SMGjnirt7Yba0ag8oV9RkCGoo538hFSzyRUwPUtrjm51KHc9GBhPc75XJzVU9c11BLoCC8J1ETMXIBogzUwMUmtMNu/9JCWfVQtizSbm3r043gnRR94VlvJJk4Fd8BO5VkY9JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS31jB9F; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS31jB9F"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a093c784b0so80379526d6.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776246490; cv=none;
        d=google.com; s=arc-20240605;
        b=BeRhlze+NM7Mlv6YKHkux3YbTu61pW9+gHFvdrBZRwExeiIJ30AseUDbS1zGq+XyTm
         FnhmxgvMdl2NVn9JR4fyPp/ehWNpqndAts3WQCX3KEVUunKKLhlQ+8lvOMJXBQxwHbQJ
         JNu2OcvyIfYMuwzeotog7lWsajHGjwTCsPAz0zf3/CYcknRDervpl6ENTeMrNes8b6pC
         LAKYXNwDfxyQOTZNgMQtmnIXHwza3QWs8AsX8+OuG5Z36MK5PcmGz/o1IsOADZwr6S+B
         o9eq0UbtiJMHDt4rEcs50XEBrRRys8CGI8XGb3e+NjnOtyY0oiO1f9a+ijnJzAR7rCUT
         SwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        fh=/iT3LnTdl9LCY0MSbY1v2i2/AxVvA4+i4yMC8FxCMkE=;
        b=H2DGbMFW8B4UUPJuiIu63JR3vBqxwx+pKMMHc3PoSdjKLc1OfCOu1v8MOpkSUziTT1
         0pCAuVdn11gy+ZKCHX0JNisV/Hqu9v+7M9N5KtDMK4vhuABcEcXPVPLjwByiodLk/L+g
         kKOAH5M+AHLDeWmNZae4BxKgLqQkd3FTjjMWWEWOq8vtn2efLVpsJDIlvpEZ2Gp+rdYh
         jHsNiAX78zRLKm1MJiYNTz641nqy4JycKOwTGEZFJaJsvOLvo2doARw20vZdpwWSLfEb
         maf9VjI1iUr26KYSPwhblzHSIzkoKubfWjXmK+TP01Z6XjrvLv9sC61r5GUAwok8SYkB
         lobA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246490; x=1776851290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=SS31jB9FmB+4UPDFk/EjyC1JvSVJNTTGqV84k3GTCRoX1RTK7t3Bu9I+0Mcwer650w
         qeZMaEiIOLy+9KKtbGP3PEADg7MYEoZMqjU77sorvxfs+DUKrpxcS5z27K07ly++qWfi
         5l4rX1sXkXqL3h89Cs1GKVJ6gff3d1L3VS5jw2IjmIBjYWFhUQN2deltfuE0onvt2We5
         EyVSvsnk4PmG/5BMpHX0ggK57/fKFT97AyMSaARKJM1j9OZceM5d8t5zb3LjkmT5b9nQ
         sKZRSxrX/Op8N5G/ODTPgO9CowItKixIeWjusvSgmj5ku0vtosexu+fHPLkkediXcGzR
         OE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246490; x=1776851290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyJiLQD5TCPnlIsoP9sQ4nsBlHq4fhOleCfx0q9dKFo=;
        b=IiK3A5xVseiIQtcykl5JkR18HAFBmLOkfqhF+ZuiPt9yVtAJNAz43uRwR4klzk3ujO
         78Do2XD9maGVMfgMpMSmg1P87EkYAsv5Ebk7wVJ4PFXAUcG9TbLBPP1kfNEt9OH84AUL
         ehbXw565f1M1eh6g/EyUSxAiEQ+KIfw/7URnB/rkUdJS5oQxBD5lB+NELen4dzMjAdyY
         w4vs87uJqNNj1doEg6RhSW7zfdx0oOjcDlTEqLX90oNhBG3SeJd9mWqtKZtEftR1k6LK
         j/ciavRzLn6fdksiyFVXJ5RTJbreLf3r7Ts8AyRsNR9rMJlw4wv2IEQwxGV3jOkvlO/m
         //xw==
X-Forwarded-Encrypted: i=1; AFNElJ9PN5rK7R24/FkB7RUYRbN0TMORoVeCXYr77PR4le/Y3/G194gmf3vwnZtxOwK2yNhmaYJzJ0s+lDtw@vger.kernel.org
X-Gm-Message-State: AOJu0YyhpIVzg/dij1B3vqTt+MHfKeJgF74yMoV774ipalcl6AzYnCe8
	MmGp0d0D3/h9JiVTEQVExqZPsAvW0HLp5UxrmWvEQjZjebdwmruE1Ou2RUSQq8jWQdSGr9MyOGE
	NLlooqS2PieN6xTPD36nUYMRLs+lihhc=
X-Gm-Gg: AeBDievl27sDJgBFJOitkLWc8Hd4m+B/GDAbHdj7aSLKxnL1kCnRu5RPyafOcGw+tWn
	/4LmuY35U/bpXBuMdduahp7ftMX1k+NGKrAlpJtLeFannK7Fh4Nt0FbR8m50R826Y9aGuQ71WZT
	FtIei1+NBQ6Ko+veewSp+fvCHbeuOe8lqBbfeyDdDPhki1TaFUDS3QSy2MFFSUjsa6aQwAXG0ep
	TnqQzfjKrokuNOVn7WMTru6E8toggG1j5ggUFToCAhlWPn7Sx2qAk9V7KSPNcLxEK8u181wkVv9
	fciluMBVtP/AddPbVCMT54zqGYY=
X-Received: by 2002:a05:6214:2e48:b0:8ac:7616:569c with SMTP id
 6a1803df08f44-8ac861ad3aamr350240316d6.21.1776246489728; Wed, 15 Apr 2026
 02:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org> <abBPufvrG8I8UP69@lore-desk>
In-Reply-To: <abBPufvrG8I8UP69@lore-desk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 15 Apr 2026 11:47:54 +0200
X-Gm-Features: AQROBzC_3emuWl_zkXPyDwuBn-0k_x9_JCqk9UTd8pYkmyaVmNF-Oazonv_2HuA
Message-ID: <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
<lorenzo@kernel.org> ha scritto:
>
> > Enable spi controller used for snand memory device for EN7581 evaluation
> > board.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>
> Hi all,
>
> it seems this patch has been reviewed by AngeloGioacchino, but it has never
> been applied to linux-mediatek tree (or at least I can't find it). It is marked
> as 'New, archived' in patchwork [0]. Am I missing something?
>
> Regards,
> Lorenzo
>
> [0] https://patchwork.kernel.org/project/linux-mediatek/patch/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
>

Hi,

friendly ping here. There are lots of patch with review tag and ACK
also for 7583.

Any chance someone can ping maintainers that take care of picking these patch?
Or someone that can reply on how to handle this? Maybe we need to sync with
them? Lorenzo (and also me) are fully maintaining the Airoha ARM target also on
U-Boot. Also on OpenWrt this target is starting to get traction and is
getting used
there, so Airoha is not considered an abandoned target anymore.
