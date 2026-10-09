Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E851A752
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570592; cv=none; b=POOTFmqiWAcrcZ3g8DyjjphA+AeeFWZjRqd2yelqT2nLKdj649hgGPBjiiWLZnUNKDglk4iArnnobIUnW0koH4WkAw2Ip/fqsDuP0VoBjzAe0En4bKNuD3gZ55L5VbPYNpGBR53jcW+k1NR8IIyl/pXeHNb/INWnF1rFgmdUzcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570592; c=relaxed/simple;
	bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=X3HSA855jUB3w0bXdMsj0xQ70U9lxWw7gB7UTaeRRfq0eXfla1n9zoneEIl3q23nQARVE+D+6og0A7L/XpHe+K925QSQow/imKqv1WgPKtyaVT6ljep0OF+Dz7u3hTdrLIGEUZBw5kDGg9wsnGoIDUoIeOhEPCJilY/l5RX1ouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NFIQpbsI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NFIQpbsI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0584ad71so76236f8f.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570583; x=1792175383; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=NFIQpbsIwd3TNsM3/p15h9/Em8NjFJzbsvqNQwftlCucUvzPf+8y0HxLla/3xN1OcO
         SQ1llAGiDCpevOpQgWTdU0a6RnLnayKUmhDBQG60vgwsTj06+gT7dx6UB3OiVPHhFvTu
         U5g2me+ZHVFGf3zvDGM7KgTEeRD6EZXYqh2oLd078dkTOUD9JmJaXdGkN7+4Ghfo88gr
         CgLZ4PABZQgvqsaIala/VcsAzklhsYIIrYwWlsxEUO9ALDJglbmjBwrsV0mJ4dy2gQQf
         5BwVnLES6SF06Gk7DhmXzHDcSUzercK2zsenVGAfXisurnz9p9IQbot8lYjU6kDmECsL
         U0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570583; x=1792175383;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=bm+njveXlhJJVtc7mzY++i/OQpvftvpr2mTJw9t5511FZzqzd+HLiDJTtthhu5QLP1
         ze11eXajV8hP0u+2o2HtoWmCQBE8ujHal51UYwTUtL8RHNZJxnQrWGYHpAj0oFIFOzKa
         Kl8HHvZVpjonv0MOHgI+4rdvpTPMCiKzI+BOx9So3iRrRjgpqUC76XD1XrlAPjjISU91
         E5euRoB6Ey2TjWiDlvERtXYGSmAXLpMmo/fMsm/c2SAiURZ3yYxLKs1xEvQJSCuu5y7H
         4gyTcWi5wiSnpOuTS+uNQgkYj3sJKMZjIgl3hBEKjHX7NeR6AAnT5rCMoS87aEYY3psk
         Yzew==
X-Forwarded-Encrypted: i=1; AKwUvBxD3m33nNOhNlU72IkbzeA+5/v0tbChSNnhUjpC6iEUgzgNaRQ3h6v3OQ2WlikdMZ/K2zyqfqVaAZuG@vger.kernel.org
X-Gm-Message-State: AFq9FYIqL4M5EMqmnVUWQU/O9O3flpWYucInOU6mVKAzpbjR594fAXMp
	3SCiIElQsg1jTMNf+p8r8hdbxM3Dz0QuFjyMx/cf97XvkfAjr6XMqaGdt1ZNkfVypwI=
X-Gm-Gg: AYBFou0bIdaQ1FD6V0MzObiF80tE02uj1vNIwiJAaQCGh+4Hh2cZhXYXaqWv0e6O2mi
	Nq3+banrdkHmFxJrc0N4NmsZ0IP1lC3Oxlmv7u016nFyNp6+MmVGnRpHf3yAnaYiOIDEvKpJOJz
	IN3qZTLLqipyYWCNRxHypAl/P+gCl7bvVROk21OH/QOEFBGs71n+aNE2MPbn0Wp5RL9Q4Op55ko
	mNq3I+the38fTsND/Nzd990jQdU6Ob1d14dLqcD5WJBtyn5JzalgZOXc+fJbCEJCTO8cC/+1vMx
	09LMK3Phn/k9oB8MbMDA8wA39KOTyTPOKdWDHsGMyUloFjujPYVHrmCagaarAyM9ujhbsgL+Kat
	KkcT/aGFkbJo/vKnrsvhpZzSySQsT3jKyru7DjrPcNpTuvfvYoXMMqx5ttoXjRJXTAx4DrQVVYl
	ftgzVTvQqPJBtGXteIEENl+gTOi2pbsHhsfhk1ewsIm3sofInCbWnO6J6JQ3bQx2LKS0J8awUig
	sRW9ModmQuDWvROTQ==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr6202771f8f.10.1791570583358;
        Fri, 09 Oct 2026 11:29:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac025esm5100156f8f.38.2026.10.09.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057523.266328.2566485767894163325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaa+4K9V8u6b/PntowMt814KcwjOWLFsVd7WeS7Vd
 5JfHvsW1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJeMxk+Kdit0ivKsB0Hq//
 hGXK773kWRh5mwJXzK5OOMuVcjRSbgXDfycJszeN584z66no9p2bq3tOv0CZ+e22l0/O9k//vGt
 3ITMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Hello,
> 
> This patch series adds the clock and reset controller support for Realtek's
> RTD1625 SoC platform.
> 
> Because the reset controllers share the same register space with the
> clock controllers on this platform, we utilize the Auxiliary Bus framework
> to decouple them. The clock controllers act as the primary devices,
> registering the reset controllers as auxiliary devices.

Considering those are properly decoupled, there is no reason to send them
together anymore. You could send the reset part to reset, and just clock
part to clock.

Sending a series that address a single tree helps because then we can merge it
using your cover-letter as merge commit, instead of cherry-picking.

-- 
Jerome

