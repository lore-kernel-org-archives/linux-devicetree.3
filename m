Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF392EEE65
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427922; cv=none; b=iMmJZ4ZksmpAOSlKaVrwHe7MT0KL3ZbpjRtmg6J0vMP2Zo8IKwZZBFlXkdKsTWeIJTn2e4aykb6Wp69Nsg5L+sAH5eWB9Ef7xitChIV5GuxUa2Vqf3oyzHHNHJoSCkzkhhBcwJR43PpqD+wGnzHmaBUvoYj+C0h9c8NV7LOlgwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427922; c=relaxed/simple;
	bh=8Qig20Vn1Z39mL/aPI0UZZpoHMcdtsF7kx5Ekyaw5xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+Pxjooja568Q3Ezn7Y+I5zq4A3JB+ILAJd4+8Gyk8weqR1W1nzoV7WXhvdlNL22YpAGJP2P/7kp2EptogsA3ZrTvcx4HdeBDWAEngvxe+OU+Y6xLDba8XdURZWVqBb7awgQo83AWpoplvMw+weOXTVmmnFbWrweK/X9Z8NYbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaItmTq0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaItmTq0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4998e0916faso13370055e9.2
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787427919; x=1788032719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Qig20Vn1Z39mL/aPI0UZZpoHMcdtsF7kx5Ekyaw5xc=;
        b=UaItmTq0/aOb78MI7RCW+m3E1neKc6PiOpHa3+nfuLYPY1cL5nsFJrV1eJSh9DGxq4
         52+DoJV15yssFXrw3aMNBU53p5PAoRCi8XaeVKIfiHj8kG2wzCC0dvPqEH9y70AYPedR
         uS2Rhfp+msL6RNsQ17a2F65WqFOmhxkjytZTZBDky5RvDLxuw9dWHG2dOF2kBL2EyfZ9
         ZJQQPG18corrP7M+Paoea3nLs7N8tppBEnmgAibMnG+FSkdWUq9Eq3sxz6NytKzowQPD
         eCBsg7KT5gViiMbRpq9zwGsOSxQ5atgNmA1y1pV9zlAn/ZccVoTlzmGCqYZPf5veC4hQ
         IOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787427919; x=1788032719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Qig20Vn1Z39mL/aPI0UZZpoHMcdtsF7kx5Ekyaw5xc=;
        b=Qrm12tN9Ccc1XLyHQEBQ3VE70E1bhrC45xeJM9zp0bT4/tBMchap9k3dNXLHOjYMo5
         OynhGNlD8NBxKWOcs8JxxELju6+pbOUFq9YdQua5zaEUWB4w+SAvuLIxzfO5fqknQio/
         BYjvKqITcTyD59aOy+vjqdbLG3HvTxeh4q01SjgfMMTEH/7VBPO83BelbWKPEt80o4nh
         DN/qY03trVThk48BesB0OYpP1ZASaRTmgDOG6jzn9T6q4LJVIW7D1rSDk0UvTLZ6eoHe
         cGQOPp4/2tZUzKI/03O5rwNrQHh7PinLivj4ijPLb5h0VbsYHZn/kmCkgSg0H/9Zkagi
         RC9A==
X-Forwarded-Encrypted: i=1; AHgh+RrH1kKFmyFI9Xwdnce6IXrYhHQfG88Bh+95bQuFVFee+B9kOzD7scvFfvycID3ja6DaDozXFJ3erY18@vger.kernel.org
X-Gm-Message-State: AFuF++mux8KfFCXQ/wdg67qAcJt4btcZT00k3S6TAs8xqPi3EFESuN13
	EaaAGxxDCVueGUSeYcItPIPI1FnZyjWuN6hCG2uoxcHTSi19ifHIm1dW
X-Gm-Gg: AR+sD10AD7bmtimWEh4vJgTO+aMVHc8f/KNt/jFnu7vkXA0hFubPn3HIZumZj6cd/gM
	+sgzdYQsMuG+pjfqKAp5img9moQ6abXcn/U9dfrM3fM9SylPOadVCXMgT9L6ogbId5fjebB2c5G
	/q03iuX+JSnQkfht6QPgQeC7un920njmjiok3TBQ1YXUboLxfnRA3oaAvwxfCHcx0xui3Dg0N7P
	MwDx/he5NI+g/7UHlijBK7JLN2uUO5L3Z2RhoQCNzTqzn8ezjM5t3TeiVnkvb4b4VOt5UtDzPjh
	+scglvLODt5o8eK7xEbNGY72FSckjwkLc2ai7qqG8+sDhda+0lVHp8UkUmjkwH86zduUShYjwIc
	iKP6zNYEqmNda/9OstRhCw33jgugpaveEPVp3UoTA1EHfEvX9lnPc5mF7dTbIETPswbFKSH7d4g
	K1zd7cY5Xp8v0sbctpGyF2wtLfjkpFa7Qu5dOVyEzvvG+RfPSPibWdbp5OgnBn9frrRiNsq9OMv
	/eP0leoBg==
X-Received: by 2002:a05:600c:608f:b0:499:a4d1:d7d9 with SMTP id 5b1f17b1804b1-499c19d7367mr69091855e9.9.1787427918747;
        Sat, 22 Aug 2026 12:45:18 -0700 (PDT)
Received: from fedora ([105.74.8.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm31267215e9.1.2026.08.22.12.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 12:45:18 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: dlechner@baylibre.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v6 6/6] iio: dac: ad5504: support scale via output-range-microvolt property
Date: Sat, 22 Aug 2026 15:45:05 -0400
Message-ID: <20260822194505.20389-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fb0b857e-eac8-4755-9330-5cfe55523271@baylibre.com>
References: <fb0b857e-eac8-4755-9330-5cfe55523271@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> We should probably handle range-sel-gpios here. Otherwise, if a new
> DT tries to use it, it will end up falling back to this old wrong
> behavior.
>
> Either return an error here that it is not supported. Or implement
> it by making IIO_CHAN_INFO_SCALE writable.

Thank you for catching that. For now I'll return an error in that
case, we can always expand it later if needed.

Best Regards,
Taha Ed-Dafili
