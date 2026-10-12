Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AA3BF67A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831446; cv=none; b=UfziFEV52jjuyQ/SObD+1pJlhn9LH5oGmCUZs7i/i5j0+cjZyHr1mdyu8jh2+JCTHHRYzoKmFyCmxs/KHsOvn0i9lRTuE6wjBP2lQetbJ/r9W08yYyWRQvC1ZbIXvQYbIr0vgowx3IOL5zv0vxZ+VeQVEvqvvxIwjOOIdJNJiPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831446; c=relaxed/simple;
	bh=F8CkSS6IWx1ghWlHdt+L/gsrsDwzuUfdc+7urWYp4M8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=Eq1V83a5pbLn2vgQygFsR50MEUeawFvbiDf0sAsAFi5jW5NQ8csm50tOOaPZo03F6rPbqsAuxj1ybbnMjtTa0SchwtW5QHIqHzhvNRb8q6w3NQSFb0UPvyb+Sqbr2vCKseAeTS3lFLXb2eOo5iNitgrki3hEyNHBa8wxPwlqUuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKhGXCnn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKhGXCnn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so350632766b.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831443; x=1792436243; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aq6FGDCLIMEaFm+sGEB7AUNjwxZkgWT2FW+F+6Aa/HU=;
        b=nKhGXCnnR+SCxJkn/6FnRpU+hNmHiP43PDV5GC5JPClqmpM791+o9Orvl/JfZfDogN
         wh7pZAcfuSwFDhZljDQjlzGOEHCpAs6B/xU6zBpLBcBSV9XxMY4Ern+aiDHmhRjCQpG3
         /MWP8peJmq985Vyg96H+mTiistDfgyF4sZ6YClbTlt08OaGyJblOa7fYpfqcOBwtVFkN
         jFhW8Z3m/zP30o5jztUI9qm6Y8Ix9BW55yHloffa0BY8CABAmdbPXXc5xmLYkw8oCsT6
         PPRqKXibTqZOQDeAaN++VZK+P7qU194wyg+2WbBxm4eLJhZMVwIul5JHQaGHemNpASVc
         P6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831443; x=1792436243;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aq6FGDCLIMEaFm+sGEB7AUNjwxZkgWT2FW+F+6Aa/HU=;
        b=lEzYJfbKn9K54ZrQ5JDpebhDBMfc6BgcnKKzCqZCf+EgTSisqJyPISXwwuxhHREiEE
         k/MebYx3omvawlcYE5VIj9iOrheQ1j/mZXK9ORdYFCCDVFQyOERPPIQFGAZtSG/hez0i
         Hbg1Jjg5KuYpXPrMtXK5S//HQvYoNfrIRm6TOP0Bc9px6TxMcm702wsZFITNn+2iMmne
         vKPpOCx4Y8Q8uYqWVgiovoioLnxWQyvKjTLlmzVRggpM0+VWoUr5nIdtffQOoEUtPyE2
         QX0w4y3WQKKpIUmpHjQjsHVDnqG6n/nLv/EWXrYKXeqRtZ7KIPEvFHBECZce7jE6URQn
         /qMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8PQkqcqGrIm8Do2pbd2mMKXLz+80prJz5dL479pe0uSZLv9kQImLIl/k9KtEpja0PNl9XPbGDHkrO@vger.kernel.org
X-Gm-Message-State: AFq9FYJefd52wP3RMUH8OxmvSM1IxO83m1sObR09C/PTNB0mLnIm6Mcp
	tkFqlOkBmQAtredg7zY6S78bt2iSj7QtXSu4mag0Xxth+iEbx9Mg1ew5
X-Gm-Gg: AYBFou3v26bCzJ7KRniv1GoaHspLtcTmMFDxgAYOPml8T5PAp8y6sO59JlAcM4AciVK
	khKK+fKRXiMOunEhDK3ViuHrKN8bbWkmA3DtIUYDIyVGpMumEHd1EmdDnFglmcL9BUwkF4FYPO8
	xFMplH8EIW4tUU7ymhiq3RR5XKF/OEhh6socSB0bJQyjcdT1jnlZ4EeVp30aWCW52L/VDdqu3TB
	pK0vP4d8Wuhrx+w9Mn9K4cpmXcUWH7d2PiV7n9NS0upi0EejQLwUr7zI8KxILV1G/G7gnUFonop
	vb+4gZ73llX86jc5zbJwG8/avn0lZAF2N2r8G+4tnAxuBYWUJlQg79ckXKgTgBQkKHhZ6iwWXmp
	emnDhvtEHpbXNgBfWNV89lth6iFBJsGW/QfQb/dL0cC4TZhtJGWPvlY3cnWw8Iggu/qpBZg6ukC
	LFsdSjdInDEDcFQdVuflnfTxzUexy94u9Dfd44qjeGysOfjrLKztO/bCnSEOIAbnTEQw==
X-Received: by 2002:a17:907:6095:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c34c5e82123mr410354566b.20.1791831442493;
        Mon, 12 Oct 2026 11:57:22 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9af103csm484502566b.87.2026.10.12.11.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 20:57:20 +0200
Message-Id: <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] Input: hynitron-cst816x: release gesture keys
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org>

On Mon Oct 5, 2026 at 11:11 PM CEST, Daniel Golle wrote:
> The gesture key is reported with the value of the touch flag, so it
> stays pressed once the controller stops reporting the gesture code
> while the finger is still down. Report the press on its own and
> release the keys the input core still holds down on the first report
> that carries no gesture code. Report a key only for the gesture codes
> the binding names: the controller also sends codes such as single
> click, and the index fallback aliased those onto the long-press
> keycode. Keycodes above KEY_MAX are rejected, as that release looks
> the key state up in the input core's key bitmap.
>
> Fixes: c87a819bec86 ("Input: add driver for Hynitron CST816x series")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v4:
> - map only the documented gesture codes to keys, as single click
>   aliased onto the long-press keycode (Oleh Kuzhylnyi)
> - read each keycode once in the release loop, so the key it tests is
>   the key it releases (Sashiko AI review)
> v2:
> - reject keycodes above KEY_MAX and publish keycodemax only once the
>   whole array validates (Sashiko AI review)
>
>  drivers/input/touchscreen/hynitron-cst816x.c | 87 +++++++++++++-------
>  1 file changed, 55 insertions(+), 32 deletions(-)
>

Tested on Raspberry Pi 4B with CST816S panel.
Reported coordinates and gestures are valid.

Thank you!

Tested-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
