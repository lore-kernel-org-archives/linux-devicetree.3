Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957245293F7
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688145; cv=pass; b=QJ8DnBI8QFUJwetAU6He+xe3FZtH0O9AaIVboMmGnDD7mR5i0X99BwsC5DabYtbFU50ZkYncS4jBYvAQkdudHsRuAScH3iW9yWU6BXUhg0QJNsTgOpWA81OO/bRJS96WuYN8ukF+04OgeWSLlmkKWBdGr+qWjgrIAeQGfVTxcBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688145; c=relaxed/simple;
	bh=9kGGIoKUXsVY33zGMSg04jYAL3JPXU1LBRMzAUAEyQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk47+5YHlyzpNuyvY/2EgU31NwwN51VU7kKpw50zzhjzLCgzfeNMR/e8OvdXHCNRofsOQtEbPuEwlFOPWkonquGmyZ/qxb1D38GlCJOi3orY5nQ5ryiWZm3z9nbAuglfwNxOutcGaeQqeIqtPQ5MDN02h9KVeM2QlLhnLsf0Jv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj/yrugm; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj/yrugm"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso6437520eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688143; cv=none;
        d=google.com; s=arc-20260327;
        b=NX5S9Rf8rHh+LLtOzHxo/vCRgb83FMEw2zIhAdKSQPR5FA25JoHU81s1qL//1K9TWv
         SebxMEb1hfvz3pkrpswRcTEc6p/lJBa+1rZA4erelW2McLQHYgAbLqwRsyOeDK6v15oS
         +2DjGC3XIR5aX+fpqJJVNE9uMkg6jg1xYgqYt4eKUIi2KpqocEkZGS9vToYM9a7Xv1HK
         SV0EPwInLQdjUiKWea+75SdhiVibw2m5GA4VooFezBF8aoCJitFesZrUtXKbBi4mI/Wx
         fN9uAjQkqf6DvzPm3eKYieBgrJQ5JJ+vIUIqDhQ+qzfgJ29oiCPabjpkZR8Zn/JMImEo
         7+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        fh=5cn/G5tWWpmkCACCxxbxtee+IwuAxwsABjdmlpLm0Nc=;
        b=CFDWLq0hHrx6g3TpIEGybWkm8vjN9q1B8nEmsLgSPFWamXod0KrRKdoXmM5nXIPY5z
         kItoHhXofLbLymGgYKMEeCPUTzp+BaV+kFnr444ytQmg78BiPXLtB+g2Bm0PnOgoiX9t
         72gkVqkeDjWqEshZLg+KQqwD4pCasEQvUImgExnSRDehR83CC3tWQ4U0wIvSMGJZIFa3
         X5r+32Cg4J75AExQWpxmxmQBrZt4Q+l37OYb/y7Nd0L8w/W26O0lNprG6b+fzjByoiJF
         m4XYYHveynImlxdqbSfGjjndCOnPpkUt5Q5EIHht8NaglQr0EPiNcaCIz4NiTsysE4CU
         w8Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688143; x=1791292943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=Dj/yrugmmvlu8SkXqgAplzDBIbFAq/IOFm2owZOH5h9s13/b1Of4HJu7VVKDuIZsOz
         Bw+Nwm6Vm3N3f7jhBSndb/5VcFuVdwD/c79+DTlrlMQiK+N8okc7MAUU1erAswQDezFs
         V2MM06VvsMqgFBQHK3FcNBlerYu6PCiJqbUbTYCQS0rrDIoGXPthtYt/k3+JeoE8Q1ii
         g68D2lwSxQTzatjo6khz7cK740umARlZeftyTEPwzCwR3eS1Q6VkPcP7RmcFZDNXqyAh
         U3M+Z0ZbegjVsFyRuInHLjrNBcOP6w+lg8blcNspz3bLSsD7Fc+P5K6dKNuPBVPYjC+b
         5F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688143; x=1791292943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRXRMKUc7hby8sfn6/3owXND2OxfjdsuZ9xeJILdsHY=;
        b=mcsZrHc/DIlrEE7cU060jaS4yiGVAs6EzIFzuHzivNYh9zY+9Nx2jMtg335Vau3UuK
         q1z/Kp4QsC+zz9YttRbS5qWg1j26Se11Sbr++m0zFVKomYNyXsYLeeoy9IHBdDhFQPgl
         hmokTKFrujrStdst6tVO+RDPdNSpO2KCC7iA0nhNBmbxLJn4IxWVVNnjUEUxTkwqZT+S
         4FSMM4bIZU7LDIi3uj6fMzwlIsT7BTNwBI1Sm4gKJSSoccD5Bcjes67Mfxqx8iZObcd/
         GxbaVzwzWvd1LobC0Q+coOZwg9CNefagshvbZTwn1S3Q2pAO9Vd3PR8gVD2OwEY3TwZq
         Sixg==
X-Forwarded-Encrypted: i=1; AKwUvBwpV2s9rdLgkSrBh3e2Sg18NaKEvtQkFuc66Fdsxpb0VbVE6/vtBwSmQgcX5AWwzf/FzvyNWw4FgyzN@vger.kernel.org
X-Gm-Message-State: AFq9FYJMINf7g+Hm0qNcvaRXBl+KKpBfxRl0tecYQEPBMYI8dWEQBbcW
	SxE8dnrWfsvoZTawMk2MH0me7h/J1TsFfo3+WOn6nUGicfhtunH7ngf5sTAccKp1bjGD/ksa2Mv
	wXuwh+iUSDEvsPZY1f7Jlcx4rkjmtqRs=
X-Gm-Gg: AYBFou1w/+MlWGkfFxHRYSKCkgkRUPA6ItMjHtOybE/q+QU+C5D1GD2V+QVTGRr2HiF
	t2QNOvTpagsVWXZ8zPD2K3Of33AusjdBQqC/lTKW24WeOa+aUXUCp7ISvy6IwFaznX61BgR6WKR
	1Tvc/JcSM1EWRqpAcdPQxFM0THWuTkNc0UcPq2ABjm1tFsJisuwoMeprHsVcZsD8yKHuKAUlm62
	MMisAS6MptPlKm0fwFhDIUQFDX94t60zt2pPbMSHSVkBxczCO0ozoqGe6FLNo2YDrzcvtTJAnKm
	gnQ1/+blm1ne5HtH8MTCnlfUg1i9MKoOqtd6MQ2z7lKWFfgLQTn5cj3RQMJsHRun3VZ31cJijS1
	uzx3eVHfvJZFi9QLk32LWC90gzVU3Bn75FlmlOz/MN6Ot2ccCte7bmdsYph0WH6fDeBlkGMiG8m
	+4MWw7Ag8K4dWZ1HtKxC1GuVEqDY8opbIAah0FpfhoXjpsXYpvYoY=
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id
 5a478bee46e88-343fdea2578mr10273152eec.28.1790688142453; Tue, 29 Sep 2026
 06:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
 <20260925-apple-m3-nvme-v1-2-5e832e2f4aa9@jannau.net> <20260929-debonair-busy-hamster-be2fda@quoll>
In-Reply-To: <20260929-debonair-busy-hamster-be2fda@quoll>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 29 Sep 2026 15:22:09 +0200
X-Gm-Features: AclHuK_jJoonbrdcWTM4pJ6-SA0D9nOYSb3Qq4ribSs7qfnRaIDq9x1ahszR1jY
Message-ID: <CADo9pHg2JyGyOA=_6orXdhDwj7NaKRBciyQMG2w7fQcPm0MNwg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: mailbox: Add Apple M3 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Keith Busch <kbusch@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>, 
	linux-nvme@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

https://youtu.be/TPwe53kCJuM

Den tis 29 sep. 2026 kl 10:21 skrev Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 25, 2026 at 10:22:49AM +0200, Janne Grunau wrote:
> > The ASC mailbox on Apple M3, M3 Pro and M3 Max/Ultra is compatible to
> > the mailbox on M1 ("apple,asc-mailbox-v4"). Add their per-SoC
> > compatibles "apple,t8122-asc-mailbox", "apple,t6030-asc-mailbox" and
> > "apple,t6031-asc-mailbox" to its dt-bindings.
> >
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
>
