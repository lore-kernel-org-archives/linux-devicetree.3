Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945C511193
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859169; cv=pass; b=ZztN/B4nYUeea2nNmW7eVjXuxAvc05R86ZsIVrHvUz6HF8nsgueQnd9gdjb5YOeWmNA+EF2rpY0elB7jl1GgPYpI3WH20Z3JgNsETdF4Pd0fpksc6BwHbBLYhBEYqNWVVz4pqZDCNtow9PuT4c0T97ITxlZOVoQLibzXkzykujM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859169; c=relaxed/simple;
	bh=1CJ3Fj5ZeETTIou3X8k81+BylqMvg1us8lXgPWVlAw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqxGccbSy6hFe2pGa8cy4uGnnL3pfs7U1FVfBp3ttWlS7bSCiSpU1d9EwThgt9z/MdHxBfqrtOv5n+MbZuI9YS97zDmfvyMG7HtEHp4yF64dCkRPgY/Uz7V5SvUyKQN+mEqpSZkk3tEOYB8LQTOMCreNaYAUt7Ukffq5vkdBk9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+XC3HIE; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+XC3HIE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6f9e2f681so47236275ad.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859167; cv=none;
        d=google.com; s=arc-20260327;
        b=VtJWyjkgcR9X+rOZoBORSrVabyPw7G7Ez8Tj2omx9noVapvfoLORr8wAj7WOM8xYxX
         0JR0T0q9D3OqS2rG2dAk60OO3kej0PKOcX53QfXz2i/nNH/niaZHDng7XvSu49Qgm61Q
         Qog+nq576FcT+ZR1uH1GYTLv4zVpzOk2aZuToZyOW46cat02gWg0kWW3CsMTbbAuXhA0
         BxHwCk+a5KRzwIeG+GQCvl0xoOFlZX8fF4GNgcMcxGJ82LZaukaptBCoZtUx9CVhXkJH
         zenFzwqoixczfDGX5d5xA0sBG/sZZPEttBeVcebESue/dYFuRmyjEAqxI2JWMlYaDWgd
         L0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        fh=V1NNgnk2AwsG2OSlzgnOlfySccyhnAbfEorTE9Pu9Mc=;
        b=NRCb2mgELbKx6qwxjs5Lqtll/SKTvGBX6BnHPvceEwkAtVxw9NrGUdtQ8HDTvwe3DV
         X0/oTduHGZYe7ArhccHvhlgiON6K/xToe9Y8WW/+dbxlvnbSRf+64Ukp82SV2kn0tfWb
         7UQfzCgMVlURenGia2e1+yHFKUhaqV4e4vYTbj/Y6SamcfTuPPSplJzVeTKzT6WpPtfz
         tcZrpgCa/FQzzP+A3NxTKfY5cOt8BLiHRErgYHz0y6JT1Bh2gxPSy0lqyZmOmHN5ZUBi
         SRcTwxAugzKehLwOIAEE1DErc1h3xCoaHSwPPHTtwtSjvGcO8e654S7mTt5y05lWIj03
         njiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859167; x=1789463967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=O+XC3HIEh4BvShXFCFAaXRAFIX46peg6MtueGCced9Gl6ZE3xOxNkfco69Lfy3plI3
         szB4t5ssfobRGXsPxZgr8QvO/8va2hII6m/9oMSj5+0rD6wWoFT4BScsIJL9lO5gWEWX
         gDItRBp2o/heh/OfsLdLVFnlS7VWf3B4sZenYi804DwdILHrM2TzosHoRq4R3X0ldary
         VBP1R9T+LCZZivgjKOTkvUCYyWWfbxkyx91fQIF/j25ldADwBKnBgtfJt8T+iBBcqVh0
         1ytdA2H2jShNv5YGSmnMpi2Bm9dYa1HFfB5YbZmAxgfAEv7+/6ls9rDEboZlhOpJKm0q
         lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859167; x=1789463967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yG4Pnz01dW2S7kM9qcZcTMa47qByQxdGgpfF/vR9rUI=;
        b=diz/vUq+BnC5OB3qzItW9Z8fp7NQC9wNUY/atOZtGKNMgPcwS7mhxXY2JrDSu/zMGX
         C/3vckBPdGvCCleZK7Pd5e5ZbGto/HZw/wtbx0OFsPMEPHf2ltkXahWcFdHPGpwOffE/
         0CLJLLCgSpX5Y9IZqGeQuHNxbI5B+i9L8CFpXI333bEsdkiupVQuZMcQqA3PL/TT4WPS
         PVidvvC10lIMbij/8ETx07lwXzWwS9Y6v4ACXNleuf63lALbWZNLXFJ/X3bXA77LGx69
         mefNl+eSbnlzaQGH2mi1xhq55mD+xovFeVf+orDU5VCK/T0JToPw6uHUvvy67bqyCrx0
         J//Q==
X-Forwarded-Encrypted: i=1; AKwUvByJUu+KsdC5UVqZLPRuCG9nnXby/oQ+F3pZrKwopRB51lYGYF2byAdenyLwxdllJGNBxV5VDUOacF5D@vger.kernel.org
X-Gm-Message-State: AFuF++ka3mTjRBUVSbURHr3sMEP9bqRn4n8Sqt11/5eAb0T9NsZgu21/
	5gsRf6AajgJo0pbNGdl+0tvHe6Voh3Txjq9gkurqKN+0yKrxnKpUyBKSzoiVwc+NZyKx2DUiyWb
	XrzPxzz/HMs+Th8fK/qa4VrBntjyrKCI=
X-Gm-Gg: AYBFou1fyudVmTfuRB0XIPKaUxcomvwQ/QdvIHEBoEhbF3Y36gA9TYi9P+5WQosfmco
	06xN09Hw+80ceIdtmpkab+wBD2JFB5z0MJNE/mR9Tt2SvKqtjGquFBIQ4XAuOU1L8wS/YKXQK67
	kefKImEZM+H9v2T1dkDs81YxpfU6NScrmZxMgvk83om0J1UdIMv0/BTbzpC44pW9RRQIW856R13
	OU9BfRr59lgK6uynnXf1vwrAd91kOf6NzW32Fr8PDFVf5jFMJcZOP1q2IhG+AjeAL0IxxeQHhPb
	9yRqzmS4SQv1p/AnrRezmQ/pdQ1KgXWARu+VHOg66WPcQ/tslM3QdwpE+BRGKboOLDElVUIlcWD
	wWngagSKiYttZWqSgdM/wCN4UE3EX67oyAnrwNhqKUygWEr7Dr/lwKGYW
X-Received: by 2002:a17:903:3c47:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2db12106896mr426721305ad.0.1788859167169; Tue, 08 Sep 2026
 02:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <20260908090448.3332-5-ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-5-ansuelsmth@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 16:19:14 +0700
X-Gm-Features: AcwNN1VpPKN1gkIiS51yj4BLA5N52CV9eNK9WOCJ4im1zZlIaPxLmU_uBzBetZQ
Message-ID: <CAABR9nERV0bGkEQm=4kLNBZVfurr+6c-Q_to9=XixJV9CT=vyQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> +       ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
> +

I think we can return the error directly here, as devm_request_irq()
already reports the error.
dev_err_probe() would result in a redundant error message.
