Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2E3F58C4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998586; cv=pass; b=XvgdoaRt099Bj4ooUqKowfhv807clF/CSnNn9dGfD/mknNUXpiMlj5jkfOgQl7a69MXiQTamqrtKNQb0hRWNYlfq3yXePgnQjK/69ceuxkuRZSmcKGBctiz7N+hNpS60P7JTEAf2FYqaDdGMTsfZZOaKAM8TvLK15EcCewKsZSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998586; c=relaxed/simple;
	bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ca337mC6wedoeBpLKbY3rMsqR2QrVBt6gaJPIibW/ax1L5gsgesNZO4/ZGzmAzuEtsJjlvhl/UcXkPdCXrU3aUS5MGx0yK4FxMhjWMvulVREpjXeimNx3XaWj2Jun+v16nlgNmCueMVe2brmbWjt3cEKYhqT07L+S7leOPsMIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBbM86Ky; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBbM86Ky"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b9328c4aso37233825ad.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998585; cv=none;
        d=google.com; s=arc-20240605;
        b=WlmPbi2la5uuufEVKRwgeC/fWftALsa3OnsflIbYC0Ih0CwWhvvkoAZ4zsgFmh9e0D
         Pu26WDNP/iNHJq0GFCAK7nsiIChlfkTTTCoEwKPdHLH5c6Qwy25QbJH2QrH2jG8bLKjI
         o1T00TtBmtMR+kkT2Am0e2ANQTtykIpb6yXHMvp39dBj3FIz0J33VIB49H522UGCGPpr
         MQkYWxl/wgjYMjo+bzlftalLBI0IU/RFiNCElX0Vutf8zB/I6+jmTwf03IR3lOZkPMdR
         ocK/qT8xTJSXadhsUIZnMXIQEpW20IRhZQbq0YmgMyHyw6LxVouf8HG3uN6tpdx6UfFR
         LcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        fh=fkrqL8TzQ3zsYO7m0LF1vCkBM06Aqigkw0Z5q9npMxc=;
        b=g3qXWer7HCXI6bOcHkM/NGgKytwCc+0dg99+T6MlkbW/cHTmltYZSDSk2d80gRkdmS
         O0dJxD433oU9CQbMehuRLTRRIrrNXP2jLt9HcTQ2uehtH+l9oJ1C1AAPZjNvpT7f3BS1
         ZltbEaCEejjbPzraxtuZZjY71yTc8luxKFMQZd7lAD4iTWXdzB/HMevjxaIe1MqqLm7O
         i+3J4uHUy5OlWVodH3DlINzoeqQG3Lu++C88Nfu0sUABNf1tHknEukg7RASKArgB9w2I
         QwX8chh1IqPuJPAWV8n70ZomySUm6JxiwMDNeROpPxBosUCCvE5CGyHpU2rx+lv6zxPp
         x+Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998585; x=1781603385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=KBbM86KyF2nfp2WA+02JDxIwb2euc7XguaPtK77tXmF9Yq6PJNheOBy2xScKCQ5Vx2
         X717y9ajvuSaCM1XXHpbajuPyGRwckuWfseGBmzsnunmD/b9WdFLVzUBCRa7y9Kx76f3
         ehCjBI5X3OPQ0vyKWxliXWwqltJyFfe1JGwhnw3EcZXvGSjTBrf/BrS/ORpkrEexRJ3Z
         Ity9ZSfWAoiOwD7S2LnFisB+SF46EgFv+XGMqdlF2Tfg2YD05dVmYdFFUudH8V+SrOP8
         ABwfr4KvR8ffng2RGQGb4ojAorVJGCAbtOtT47lzEX3IA7M0kx0tn7GSWS9OkiSQPLBR
         ePiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998585; x=1781603385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5WaJN9st8+bnH1+MzVguSudiJc27t/J+CSb2Cfa8zU=;
        b=ixKHZK6dblslJNcFupEYMms67mDqtDsaUgk4GrBtDQUU2yeEIX9/BPWSfz5gYY4xMw
         dD4/wI+QSe8kxvXFv4WX3uTUT9Iwxdwb0qi+rBUZV6mNiPGfy/JYUfj13ki56rSOlwqE
         q7O5tfjUesLijkygDVfZlxmmFLT3UpoHUV4vEj/GHkzA01t5e6VQZXMLD7/s9yoK2Kab
         RTsKIMDsu000rhs0kDfcNU7/ayrzjmutNFFkQMkZtkAjm0FqdAAXfCXpprZUv1bJDvtK
         eig4YEWGJ7QaVcSV41T3+30FUTC3ybsKve030wfNs/YFj/UoLRG/yM+NQeQ04OaogtwA
         yYAw==
X-Forwarded-Encrypted: i=1; AFNElJ83LXeAkODOiQlkA72w7jmfZEqHcJRrTjGcQETTVsr7fhh0m5pyvo8CYytfDh/2nYNamQYkjo7YwdBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8ErNQnL4DU6RwdWnBETGSQ+IlkB1XcdeuF5J0thyGidtM2z6
	p6hMddE61FxY3fiiA2lZ+EowQmNqBB60kA3tLMaV2LbzqHuVpdw892IUZWLxIxmQstiZ0C+OOzr
	X+0AxOnF0jSgBZty7N3TJOpIJ+CFoS5c=
X-Gm-Gg: Acq92OFEYsIG8HaA9jpXOGQdaK+1XerWIYWJ7TY6joG33sddzyD1OY/KLJ8/Xoo3b9A
	6nHeOb22cIoYt5mK9MtaIYy+G+osCJH8nIGw+8apzebiwjcrIg2rmy4M3cLb8AhqAuV9xm9XbXE
	yfomNLfB+1iO8ErHWSR5J35Pq8n2EwlGJVFO52SNO8gtyIjVGPF+afr9aflrO5cSoTV8gWpp31T
	y8rkiWyKMNsvSAvY+X6Vvm21LWN60FeGo48+8dMzegYTSKILKge1DTPS6m3g3OE00TDrYNqovAa
	fgO1VYjwiRBPM+13Qj3zeoVO/QHo3kw84XhmpkqwxNYnjJs1ZuzwdtF9FEk=
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id
 d9443c01a7336-2c2a19b70c4mr29256975ad.0.1780998584740; Tue, 09 Jun 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:49:33 +0700
X-Gm-Features: AVVi8CdljbTt5iumVzeCFBObBOG-VUOn8HWf8RQUwP6hql8FD7Nvhkr27Hm_R2E
Message-ID: <CAABR9nGTi_Sc4Rn_Prg-cv0OeQkR_qjvaFPZAH8hf3JSCF-yZg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

> For all patches (except DT)
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>

Thank you very much for your review and Acked-by.
I will send a v6 shortly to update the commit message for the DT binding
patch based on Krzysztof's feedback. I also have a few small updates for
patches 8 and 11 to address comments from the Sashiko review.
Thank you again for your help and guidance.

Best regards,
Phuc
