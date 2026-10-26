Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003969;
	b=YIDrTaOb3wiSj5SDF/5K9eQ8oXyMANKBtgaKow/hGBh8fTwFLWxFk7uUGOeLqRmpsr6c
	 mcZ/kynJkO7p5sP4M9//4U+LzVEA/bSvqd2OtcUEouLiYGAKcXkDXL0wAvZ7B3bFuA87I
	 1qdBVmUm4xJznPSF2+v7TD591tD8v8gaIstA+8uUbfycseI8BdeXZ3jdiGG7zix22BL/A
	 asjr27MLx+Jq+8LuGX4KdFIdpwPOfMlv3IdGxeVrHysd9INe2mwB+MiH6BvaYN1Q+gQLL
	 5BRlNg7hI2WgfVzLfe6zuSqejZ3/eTq6yEPXgHDZ3n/d5V96kO1zlrTsG+PsY/W8VUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
	b=iVERwHYmQ0eFadAQsCEe2auyEgOQbRGBdldXWlaWD9lLPgzCgqbJmP6D3Q6lVAs2dTtk
	 DIsVIjjkGOco6e8YYg6z3hQMQYSXTn4tw5EsTP5k5KNAy5V+vX41G6UiENvKdlkPkWSCJ
	 4RblYdnVAgd5sQBaOxXoVnc05M2yckrOguFHD4Rx7RSM4pQUKhs9CJXoxQfmd5keZVJtf
	 mFrrG7PY2grV3A4RFgccRNqCvfvXiP3k2m/aguSeuG8LjRPO7p4grvNRRyrnaQWUE6lHi
	 BN3i3/BOt27TNhaGI3/TezIUKMu39Mp/7Al8x7ehWsFe/jIfq0IzMQO4lkYf1AGnASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E2606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1330902f8f.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003967; x=1793608767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=rg1j5lHgIKe2pYctEnUSlK2gfR/BB707z/jC+v7QfZhX6VzgxZxs5z0aKmRwx9kbZL
         ixyd4iSTbbqPzYfy8XapAwDptOtJt+8GNnzD9HPmy/99EIf6ii3UmYFWTzXcPMNYNXXd
         gujqsxf2RTyoezpIOyMzyNuZQ0JRiySvH6S1qTephY9OxOZoH0s4k/+72RJ6Ssy/5WhS
         RzaAbPq87Rxhvn54uLbQm9t/kzWXMFupa5HSMYU1YVbMMn5MRih0CzP6FpM81bcM/o54
         +cIQDQJIQos50HjcBcdryfXvAurhHjB0oBs5c+Z8L4eweKXt8qRL/dE5F3FRqidRWIYu
         9hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003967; x=1793608767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=gtkngAGZqWDKWrV/bkZFiw1nV0MKOi2SX/DILlqwghPXkawTA6Nr9og2B8ALcK9CoC
         8xisjYpFSC+NqxCpHHyX7s7Mx+XtF0WlRyeP9uY5TOQRQmF2NShdhmkInJnyZZkEZ+66
         wg4LxmaCC1jpXBwQIf9EfyrJ6mcZAn3Jz/0OIb65LjFSLMGU1lIVJBZX+G/SAy/bjeCw
         FLVTbFqo9lgKs7iTP4j6qACdbWfa2+jlBfqkrv4D+K6hz0Vec1sb5FoUz51pUB13NqJa
         OblY8l4lC9CufGnOc22EQhUfgG8IlQDajDpos8jL0pQg4ssx2ddunHHP8YwvuLY7atGR
         e8yg==
X-Forwarded-Encrypted: i=1; AKwUvBxMV46u5xd+jWFnXcC0byqMhaYEtxHrirL8E78EsthRVVcWQm3OEFr/Ds+BIijuY+UfdbH3Z5Lr9Jcw@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2P8NlTwWRtb7Rym2FyHepU+PL28Y25mADsi9H9z0sA6UuUQL+
	Ns7gY2RBv6Ltym16QAf8HEHqEJ/9fpVfe/6YaZMYMmijr4I2v6ejsiVo3zbnM+WTKNQ=
X-Gm-Gg: AYBFou2EpB33lzD5CzOikRlyKr5vGaT1Jj+HceuvhSy5Xt+gR0vlVMqTqSFyglrkroV
	lnynM6mnoBZ2B1lZqUxT1qYxrZOmDKbuSYF8NFiFPiKcwaPf3TnqT+R2OU8CP8lJmpySriTOmt3
	L8ywxPq6IvBZIU8Vl68gwy3PnTaXklcuI22SIDslvvzPFh3iKd4nJvDm68xVdd5u2MnM4jeh0sD
	DQn23fuzup5lYqnihSmRw6sVBs7zM7USqQJwTVT3aydF1kHdVMS3STQhmFNZUstDqlHndWHHGdG
	0BdfzARU9FzWTJvE9f/crL0KZ6XdS7IgAmrhcdKjiPGLSFJTD2lcyIRhQdg6iygfNSYZMg3/A+B
	S0b4Mgm5S/Du63yOzs3kxpPeXaAgb5KkjuMVSO5tNuS7eyDlyyTkpDrMvQDl+hRFlgKi1lrTr0n
	sGTAxk3empNcf9kouFNF4i/xX2XW+M7ZNPNHCbowBCVPLwanjqB7mpjxwF6CD4/yNlaudKbycLp
	DQYD2CivBnZ26c1VpasM/7RMZ3y4F44LKl9Qbrpv6PmOALZ2KtfVQlL79SlZr7sHR4pxr4K7KCm
	MXSPxCTNXTRqXQ==
X-Received: by 2002:a05:6000:188b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e3eb98ee3mr11807123f8f.39.1793003967452;
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm14673690f8f.2.2026.10.26.01.39.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH RFC 0/2] mmc: jz4740: Use the integrated DMA controller on the X1600
Date: Mon, 26 Oct 2026 09:38:11 +0100
Message-ID: <20261026083811.67574-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
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

Hi Ulf,

Please drop this RFC, both its premise and its question turned out to
be wrong.

The X1600's MSCs do have request lines to the system DMA controller:
the programming manual lists PDMA request types for both (0x34 to 0x37),
and MSC_DMAC.DMASEL picks between the two DMA paths. With dmas in the
device tree, the existing PDMA path works on the HiBy R1, card setup
included, and reads as fast as the integrated DMA did (23.0 to 23.5 MB/s
against 23.5 MB/s with dd, the CPU about 20% busy for both).

And DMA_DATA_DONE does come. jz_mmc_irq() clears the flags of masked
interrupts, DMA_DATA_DONE among them, and on the X1600 writing that bit
also clears DATA_TRAN_DONE and DMAEND, which most likely is why reads
looked unfinished.

So the X1600 needs no driver change here, only dmas in its device tree
like the other Ingenic SoCs.

Sorry for the noise,
Olivier
