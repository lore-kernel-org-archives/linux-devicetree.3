Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351341;
	b=aypdpA/Q8KsEDIHUWR9uE2TM82O3xEAex9jZz5KI91TuKMfMyfVKFbCPrOjF261LOeOX
	 C/ONyxpl2xDZtj0XBwFfWxrRSnLOHNZfvxNnorBG/cgyf1KmfhVihtY3Jujw2COHIynSl
	 IkOi9cqBxXsDgsSqyRZ6H7cdw5Ev+2ggYrLFMEBCu0ZFDFLHjNR9HNDpblSGqNXz3vLDu
	 8vbrytc7vO60BtcN+XCy0COBkfGdc3BgSfUne693/nFHqYugjymHtO7GplPSyK8WnQV7R
	 Ade813C4CExpFGGD5zcLusrMz/695XhECL9faTiBqgf+AqFDJhtU8ODUX5VON+JIVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
	b=sd8yKNKqxYTjFCrMnj22/441vdi7+ZcbobOd7IfkyrF05nTW+KypoZOkpNaWCpLkcD2j
	 u4+ufpVlhJVtlNXgjtstpRshjXTUYKfUzHk9nEfvxqHKjs9XddSq9ySgREs7uerDg5vSO
	 S4rlaPMyoScZ5azBanyjfMn4AAo/BRabcw2ymDqCxMfDSvRaXvyjfydQw1aK1Jrf1nvhF
	 s8V2L0LfBmpU3yxFfwIP+Ffbc/vxHyEbrXBly3xtuhGjRGDn82Co31CzPi18xuy3S5I//
	 z0rf9LmsQARgcVQ7c6jCI8Gf+0ezMrvI1GLGWWljG5K8YBGh+TxWu7o4Xk4TvCqakXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFEF606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFEF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1913691f8f.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 04:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795351339; x=1795956139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=iWfDGmTCde2bt+wepq4PgJNyha1vow8HgShJhgAqgwEb4VqiIG1qAiKLIKiWaGRuxd
         f8R6vPe1+sThZNdOoA0Mq356EC2okYJ243uZQdz5uLx7ZsNjaqfeymrnBu2nUSX3KkFt
         YgB7/fupJe1qhGJlFwKWug3Ng1ZX/n1BdxOf5Jjvnk70H94tQnTcRAB1K9VrdyKhjJko
         LnW8pJK3Oe1kytqRL+BYgKvMiCn9vuCirhPSy6vw+PNkvaNOsUsgwZlsKRHzqWW2qvcS
         WcUTjr5KMnUfMGamPt2r79Go/SYQtMvprdmDjIHkSPDd674WlwFczVf+G/FHc1QPveKO
         xVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351339; x=1795956139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=KtWMxVVoBhpDucLeLNkcKa+5ukLHtA0iPh89N4HVe+Xtd7Zqf53y/Eu9Xw4vgSIFDM
         qsXkJmjboZo7o5qEarQArIUKXCU+BNhi37hjU+mQFhOxHTk3VWWNp8VkqMxlUMiTPHyI
         lsWqE+L+xzWyV8kr7G5Sl6T7XM04frrU6YLYi/iu9fthzCXHPabp/ZG6qylhVuWrnY9K
         vYVQVgcJhyiTooQti6khlRqiLOobv8vA/9HC66ABb8K1yoZbWTfUpmrhQ2j7OdyeI1Jr
         lTkJbXsCXv7WKHJrxsBz2NqKThRDWF+THmMLAZd1TNOJnXn4UcAwjgVcTQD09V99FNX7
         baTA==
X-Forwarded-Encrypted: i=1; AL+hErHuULS13G0E3TvJfKGJZjUZvvhz2sndt6HSD+sERxGh875F4KnofYlrcDjaOq4DVC37XowDNdUr1WC6@vger.kernel.org
X-Gm-Message-State: APuU4Z/UAmBvx0sdOvKlWLIM/IRPD5SYqSd3aujk/FbHs6O7pTSgbT6w
	338CbVmWtFcFd3PQMP/c2CzdB6fa5Oz0aj44KnFnaF2bjso6akfO2jCidfTs7PJ3RiA=
X-Gm-Gg: AZFdTZfGbMw2Jf7lHhoxm2AB8bri00wIJwnUMNLKImX4P9EZbBxj6tUbeFh50pYOICU
	WBFEJ6NX2wWXyQ/vakm5MQQhG3ltKPAST2ux1dPxK3QGK5K1rpk1DoH0wECqEY7/zkwIB2FfLM4
	q8d14v0A/MRV2ubVCQlKmI0sYBbCFmro92LGqvOMsp6gltisXukrR42A2l9UL0IbbUcpjiXUF6a
	80UGboyJQIBShALM/OvbZ1Y9hu7hczafvNHYQHy9vpmwGArQQgxsp8+d+6i7D0iFgTLhVW2mbSG
	Dqnbtf/dXnfFTRHm8cJZxOwXhCPexlDu0GPIx0nLDhW6jYU7U+flCn5wtn/jWZw/aFqzr7tFLW4
	DuF7t1q5r0xr5k/JURFq+CRuc5GTp2N/maHLj88z1jlF1D384a3ZOV1tTlbJ//70Lz7gVNDTa8t
	3vj7e5cMysj49V1xduSk+GevaSvU3okHRv69vsg9IpNikAWYJ7dCNhjGLIIFp6M3BKPtKqMeeI7
	82M/MkBej6ch09H4YUBP9Sm9uTU/UmLXbVxo38SaFrKkjOlgj5Ryw/iDRSvozIvOgYBnOoILL4n
	jLwgRYe2THrxjVokDmhil5hiYu8xkGYO99tdEmQN3r8ZCcL0StX7clnTW3xceQ==
X-Received: by 2002:a5d:5d0a:0:b0:4a8:eed3:760 with SMTP id ffacd0b85a97d-4abb225faa7mr18135404f8f.31.1795351339007;
        Sun, 22 Nov 2026 04:42:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm16091531f8f.56.2026.11.22.04.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:42:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sun, 22 Nov 2026 13:42:17 +0100
Message-ID: <20261122124217.9668-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu> <20261109190345.61480-1-olivier@mgcrea.io> <384F58FF-41C4-46AC-8B2A-1B6ABCDA6981@goldelico.com> <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
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

Hi Andi,

On Thu, Nov 12, 2026 at 11:06:39AM +0100, H. Nikolaus Schaller wrote:
> So at the moment I have no device using I2C at high speed to do real tests.
>
> Please go ahead and if I find something we can write updates later on.

Nikolaus can't test it for now and is fine with it going in. Could you
take v2 as it is, with the two patches swapped as you offered? It still
applies on i2c/i2c-next.

Thanks,
Olivier
