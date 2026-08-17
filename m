Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47733AE1A2
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003514; cv=none; b=sQTRYOw/P6JCSBjvzbexekzq/lCFKQZBjYRCZLE03gnOXfavKkuS+k9hB32a4LJbaQ8FLZkoq2PkvG7uK3oEKLUsO/9CczWHrouHvjAvoheG0PB9k/SLrwyMZfyGUZqbR1dIERZuTu7okUfIc2Av3/K1Wzxh5PAW3V5WB14UiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003514; c=relaxed/simple;
	bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=B25r6i/3qN8OmRMnsFk8PXVoH4UN1v994yygK8hilMk0GJ6La8zgIW2QnLxCSCqIUU8S71PzPJHtSpmmkAQCVPGkUwUnPN8itdLiVpZcfqS37YddJf0cs34IFrgR/6FggGYlmGFtZCBlDId90DNu3TNPCebc6NgZnwbIDP+TO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxSIKrC7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxSIKrC7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-481412f1828so1321176f8f.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003510; x=1787608310; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=DxSIKrC7OWT3udCwLzo/m2GVuYeCbwUYybIylo9o6YoqXHWKkXjrfpFISGiRNRcRhF
         MXl/TXCXX6uIP9zhKxECeMscMv4s9ylHyjQ3N+YDkYh1v7n0Id1WvQjXUjosRpWaczSL
         NFaR8yNAP9SS0AVlBFLtC2WdwcOM+mbBsU/dQ0sVURxWIzaHIiLNiRL9FKM3MsvcppAc
         X6CkKjoMQUQZ+fS2Thu6Y6soCClxqrDp/g7NQmqq7rLFgbqIp7q2sZwR2ZBiWggOchpK
         YgnhHBpdYcpZwkBSX9TXRK2Gl6Pd4JqPbnfmazmB0tsq/igNKCWRb9oEPZCIgFoX3Ylt
         QRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003510; x=1787608310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=RNAnLQfbaAtAeYxtG8M/2RGSAiboAXaTMLe4AI9goyW7MNNjI9wPD/52gRru1Xy/Nz
         ZVssYe0Q0ezSJ94zPTH8yd9K3bJD4ZXsooJnlQAdjSuMJIz9WsqZMsbQCNVUSrn1my1N
         ZUUFx2qRe7nyW2QMNm3UwKID6ToeGL+nXjbdSS+Y+HNb2tVViCoqf9SIm3+1TR2tBerx
         Ie23PisSSyFB5kb96GnrLVn9WyT3vnsJAKmT+vQMSUT7L6rKp+OwUQkr2U30OaBeC+sQ
         NBWbVRYi2ESKH4/k5AH1g4NT/H1y6T/VILge2LoOPzAnyeL0lg/IxLw0rZ6JLrBs21e2
         8oBw==
X-Forwarded-Encrypted: i=1; AHgh+RrVNdwvwOMjgJIv592iaq7KL4jDW344iJU1BlcTT9D6KzDatcVAWqilawzW0git1ZKnHhK97Cl0o6bi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSoybXuZp6sdCViUr9QXxi+hYn03jlOjE/4p4UTkR8Wx0hiFF
	Mzl79Sr9OJ/NIRIDZbJnqaG10yOke5BhiNL4/fLYXVuJlPLvxqW2mYmD
X-Gm-Gg: AR+sD123Vrq9rPtIVwBcRqgjmSdhSLSTr15lWrtjplZTGoayk1umQ3B6zd2ygAOfIKy
	9Asr5zndFrr+Zth0qPRxMT0N3c8h3Wrexy3cPyaVkuvlOVQna9QjkRcBq82fXwYDMauMYUiA5U0
	lx/plUspvoCfn9BfFf8irwUNqOFPq/Akb4wnGcN28wDcNypQ0hBejJuWQJvasW+4IsQA/yNCzpw
	QHzPaBFGczo3Zeu10ergfi5wZQ2vBLm05uIS8Gs++K+AiRc1f8/tl4muvitx9Ec7ixiDPsCh8Jj
	Zob8r1resNIcp9i0fBBt9vEDmrZgTbsyEUYwoc/XvPlky4ZIqx8bZlPO+FsbHtipSqshjygLiPD
	ompfsrce1XOzdkbPEu/SDu8ChbqcIYgzHionWmLzdPKvnu6vQXBc2xSk3xxU8fp/Gqx8TJIEbH+
	ZMjvO2LM5Oe472BpLe4WXG6SaKExrRM/qpKsd33XfrBIOOgSBRXxRrfxD5givDL3Q1E9s4R5jvK
	6zq1uSQp8xVVJR/jIsKz97dNlN3Fk6SNfyy4zBE3+MkM0kfdZABSAMjS65nv92egg==
X-Received: by 2002:a05:600c:4e87:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-4998793867bmr392242985e9.4.1787003509504;
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309465955e9.4.2026.08.17.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:55 +0200
Message-Id: <DKRJMF592GX4.2ZR8HRZLIXWP8@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 17/22] media: i2c: maxim-serdes: add MAX96724 driver
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max96724_select_links() sleeps 60 ms after RESET_ONESHOT and never
checks link lock status. Would it be possible to poll a lock bit
instead? The max96714 driver removed in patch 22 reads such a bit
(MAX96714_LINK_LOCK_BIT) in its log_status callback. Polling would also
let a dead link fail here with a straightforward message, instead of the
failure surfacing later as a timeout from max_ser_wait_for_multiple().

Kind Regards,
Artur Andrzejczak
