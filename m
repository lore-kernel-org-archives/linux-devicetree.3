Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077813;
	b=oH43hLmA/CIUyOQndEuMNg+JchRgycpoldRitsReu9vb/T48Mv1quBEJv1IExeyXrZJ4
	 1DOBjKqc5gAoliIB3CJUlOVMdJe6CinMgBuOZw6hxG3qGKhl+LPW8bbqFBkwd6NEYt62O
	 l+usyGp6axVmeHtY4O1slL7S4FOSNVAL61AwasX7GNre9h+SA6OvKOqKuabkT3qw/3oZV
	 waiZWe7UIjzpst/0Kql9h0YBkkLYLCqxsGcZXBFvkvE/w/uyAPhkWDiYUnu4Ds12apl9d
	 hvbZ69+WrSPELe9LwbjKq8u983FgeNo9TAaK15NMidr2jUx0NOnnZ0OIEKgIoI4RF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
	b=D5c+KXE0hFTdu0JCJujGJQMWm7EWSuff0hqUlsKHzDWNwm6hjQhNGk0bl3BLppkkpnZ5
	 7oT9QiiNr+7zyzodEZ++2X8Z/suNrsHw23/LXk/oj3tDD/StohAsSdvpTRDtsoOq3dcEU
	 AHucWvb1CmwkEt/LblJ4qHAGDXFxUy8/MEGKeOqIEnFVAvdVi3KxvVSJHmmDLylUhmNqs
	 dgrdAH9+6eo8Jgbd4eORicDKD7gWV7UDy/KclY4RGzE3GF93xdWBx2GG/XaYnMc+Pd29/
	 9F/V9yN0/nZgA+psUYxr1Nb4Enn3KC3TM0Y24biPNF9i2zSj38CFKa7d2pc2/bJdsAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvhShgG7;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE71606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE71606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvhShgG7
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1839435a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793077812; x=1793682612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=bvhShgG7D7zcmztInFea9OSn7D5JSB0D4i6yf2n+crTq7yi8sQ9L3LLKQSM8xXnhkp
         AqbuI5FqtrdowocluYV2ukrP3D2+6rsKCdi1Z41pOP7b0xldyB01FWsU87xcrM1ltKwt
         kcr3vYsZ4f88sTfTaGS/12FRaQs3mo6OTf+MfJiFNZx7PdYwgY7Y/5XkHklFZ3etM9nJ
         RgVAgbYVxMhelPq7iSNSZhjFSWLaT1v5Vhtg/pvm67NtxQsd+f5YoS+gOBVzn176vHZz
         MPR2DrAz13Zck1vA7Ep9FKsc3GjKSyDQCbtFP8lGYIvNws58FuwvoNcq4dC31tEtn1pQ
         v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077812; x=1793682612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhQnVDe9USo4MEDAt10lIRyoDXqtd5qy3HB/D8OuXxY=;
        b=vMP7xxeoswBdZTem4774Frlbpd5899hMvLYd0GxehNqjtMniZfCT3BppnJJMFOMlTF
         pXjp5gyJTV/JoC3p8ltjKDHthKTgDtyOhkMihqiqitSkIVla8XvKQi0s/7w4M/+BUS6d
         XrtR2DSaKdvNy+Rf0qxojvgIZX7IpoMkR34mdSAMCRoYPLpHR24dH5y3EL+IcsV3Uqez
         M8aav2Agt8mcAJ9h3dom63cB3YLC/dIEVImSuFqm7SDnhZ+THWyThqG8r4DQjMxQhWWq
         anMbv5I+CR6EnGAx29R8/pDrM2wuReKvNhNpBnx78ydTLCpyJKhWpInk52fsfUpHTSQo
         DYuw==
X-Forwarded-Encrypted: i=1; AKwUvBwgnOANVgqxu0TBICbKXxLxilYquk6W1VEUxhmhKKbFzjvi6nT48gIzJCw1mEuj4EDinfY2a2nUeXBH@vger.kernel.org
X-Gm-Message-State: AFq9FYLnmElUdKaMliIvmceBNIxRAGqxR0RK0YGtLPCc7KGLQ660VNe2
	6DP+X2d/9OD61C9O/wYHo/QVQ81EdMAV8F4NJjrYQkAnvKJI/ZBMxju2
X-Gm-Gg: AYBFou3NWTMYEScjP0omoBWquu1HBpxCEGg8xndN/ZIGERWaMwvm2HgjVQfG0Syy10R
	EjiBp/q2g8gO4HHQFqTgq0zgyrnC15J8v4sYi5utG+hWq7aQLsr9lkrqNKKqDJFhAc7ZdX7lFnU
	68PdgPjGkwPl/lC3e7KQRTdebraGzRS+EQt/pA3rb3wHLqZVN+masfbVNZ9i/+wFc0HdB3kyP1L
	y4OaekLrqxvHMH+DIKcS7OLcinuxq6VisltzJN8mabF3sqg+7VtkFhrLOlwMGmn0+J3eVfwWHOQ
	B9c/G7jJEU5dXegHMwZNXqkPCNZy/FWip9DaBS9A1zk61qjGPf21cROvX/QASy2ikjGqxFMKvGg
	z62H9zRObqYPgJMZ0nlecWD/AsVzXngHRCfU1NZyGr8b+s4mj91zTEnnkxmR952MWt0J0LFV0kv
	saXB3t8yrPe5xYjsyX4VqZHo3efj+GV5KKG67Yr76ORAPlRwkadrtJll5ADxnmrmWr7cCeWwcuh
	7QlqpLyhyA2TYxqndBXx3hGvmMQOBylNKLGBg==
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr8125294a91.1.1793077812053;
        Mon, 26 Oct 2026 22:10:12 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200::7be])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404556fbsm1893858a91.11.2026.10.26.22.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:10:11 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: lorenzo@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com
Subject: Re: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Tue, 27 Oct 2026 15:10:02 +1000
Message-ID: <20261027051002.3360392-1-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <at8FyOLeaMlpS7mR@lore-desk>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com> <20261024154150.45733-3-gilroyscott1970@gmail.com> <at8FyOLeaMlpS7mR@lore-desk>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026, Lorenzo Bianconi wrote:
> nit: what about creating a dedicated routine for both firmware and dma
> memory regions. Something like:
>
> +static int airoha_npu_reserve_mem_region(struct device *dev,
> +					 struct resource *res)
[...]

Hi Lorenzo,

Thanks for the review. Sure, I will move both into
airoha_npu_reserve_mem_region() in v1. The pool attach then moves
ahead of dma_set_mask_and_coherent(), which is fine since nothing
allocates coherent memory in between.

v1 will follow once net-next reopens, together with a binding fix
from the Sashiko review of 1/3.

Regards,
Chris
