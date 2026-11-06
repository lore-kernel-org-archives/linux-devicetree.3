Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793983815;
	b=nJvmEZg2rgNc51KFe0EBLeHoRzOklEHNBZktPLGYi4MUg74nLn9oDqfnfo5uasE9dAKx
	 mlZjybaR8kPUvisqWOSeGu68hU2Ih5mDOs4rndvQnGSkISWpoBhK6W4S8FIhwBvn1W380
	 Delzte89pFDCYR1dGy/lyocTRDwYJ44wd/xsNSTbDm2aEsYbisJj53Vc0bYZ7w+CDt11h
	 a6jGRF9oIFQNwuBixnmwLizSA98lPhMMqgmocOkpE765rrhwmIbLXEHZ/xMeoKJGLsk1p
	 pGUqemYGBK5HsHy50zYt0cJS2JHSYjsts90xxrnjqA3PtRua6YbY+wwqe+cj8AY50QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
	b=R0ATUjpvpeuFxdmseUhXuRZotBsiGDYUeCvaMKgzn5OWk6xC7r0gBXBKmz2evBVz4cA4
	 nbZ5RZISz9uN3TXgR5rmd5q+y3NX4KsOBDVB/qW0C0dkEr8rFJGWyvD8Bf6Il7Sry3m3S
	 Qim6kuekjGYqCKqqIzRTfYPHVsbNGiQY1sFYUBYFIkhVqsHhWvtvOj0pcwRqyEjJfrMMH
	 KbhDSWHaEGG6DshnKORzoi0PJr/jtbEgW9vZzJqZ60ck5ddzWHEvyeb+ua5K8NAwzSB9T
	 XuEKLSKxhXPKxDCJXpiRyj/S6XbRe++t7Gmrtt9rz8VjTDgiQ30kF5nhRHLJKe8glMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ft2X5jZ1;
	arc=fail smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64684606A33C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64684606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ft2X5jZ1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so8857175e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793983814; cv=none;
        d=google.com; s=arc-20260327;
        b=Hzm45gLk1pqGsPVGNYfS1Idzd+3YoNrbzAowz133cUedRcmdrdG19ylgiaZx1erpkP
         1T7grHVQRyBcfkWe9liE4M1VaOLBHb3aseD5xCZAitSkz4c+quKMU4cwr9b7oUbIDJlP
         /7x2rXGiFwfMXHDeRCaZhfEdRq6WrHKpdmY2m0IoOjRsW19B9bs9JXNlJ3KRMYp5++Dq
         Dc9/OldbR2pyV3quz2978sMoHr2gI01LXav4ygcoVmZ/YLkzc0RjtQvZMyGkv9WUktCh
         np4jyJsJMgAqjSvh7kadoSwO8atjMvUj8k9BzUFpOK/4GUuHyAaXDb410WnA6ek8i+JE
         nVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        fh=8X90mpsOKmy8yxZlRHtC9TB9HgZxJ5wD6DR+H05rsI8=;
        b=A3ZNPqYyCI/HbS/jSX6lpOZxNt2fkpWyFbDFY7b+5VS9XD68BnvBjyqJqs/jZFeldA
         t/bnB2KB4bhjAutBvhn9ggguR+QJ+S/YbgmXKOps6tBFP3XEGHXPYuhQ39vTU66M9Jck
         dASOWU452u0IWRbRoq6SBDY7k03wIrTG39faB+zKSkKnPzQWEbVVsTmrJExs5kDXngiF
         WLtmflOj1OwLXSx35Gl06ZjZEd5Xa7eAk8pqYrPj00MYnJS1JY9aDoVOANUMe6iIam3T
         Gr//Q05xrK+DS6P2pt0148ZOQ46vklt3TN0EQenJAOF+GFvVLLo78PQ2uP5xKOf9uMbx
         vnFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793983814; x=1794588614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        b=Ft2X5jZ1lI8h7klghApXq0FuNuF0U5uWbI/EGwdkCLouO9jnchDQHVZIPJLXe/1X+b
         Pdd6ZX4+fa8VCMFkFUbXpMkcSueTAschYyWQZTZLoNiIGHSmqwCpdeg7dSmZVJdQuH2T
         sHqrmWUQdLag0Yzn+Gojg8b33uc/EgfvEALAj1RZZdRY+AlhdJ7lj/v5zQvnxY7QRzJT
         jSVgpif5144onxVEAXUAr+hqylI+rQhJgqGT93QLtGpQsSv/tOeNxW4WO6/w3hfDKR+n
         OwPghxTQ2FVLONUeLvDwordzrhmb6ugCL7Q4RUxZmly8URb5/Q8NgjAdK2lR9kCFyfRN
         Njmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983814; x=1794588614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R/yFeQr6gmoITHwguMOwp6bUn0uPGF0WL3IvUmQST58=;
        b=J4gOYyc26qAY5Rfe7QAzPVYLBRLmVqQZzrU6jMTfve76wWdI4aQzbtcPRNuDpgfI7f
         lP5BvzyqwmdVf7IXRgWg5+fDEFJL2iDrrm/9joVtN2eU2gVFuPlrclkKJPZzzgAhOMr5
         +g0XwVR3/kWD2YZXWCd0e7FO1PjKuSo5kACG3LduGwZhFfMhxISwiQSzr3MQCoGWa938
         fJWc5ji1vV1t98OgNRvLi9rkxuWRUhwVl+M85K0L/F17+ub3PdkoUIF1hgsRLTf59Uyz
         UkT0cVFZ/oUqojzqZVSlE7kyTXxCcUp35rcxRg8FFCfHbTYuPaaA4EN15kEKvkVrb0c0
         Mmyg==
X-Forwarded-Encrypted: i=1; AKwUvBw4hIJHqdfRUlUmlYLtG3K77gf5gUQMHyg3D8NoYuOBaNWqYFZWPB6DnG1AZAD1ihldajx1wKGsoByI@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4uxjxjuwx56WRXSA4GUkWVWIPIOfbhICsLG8ER0TuplM3hPe
	9efwCGuZ7dRyS6wlmxiNtZoXSpY96yLowg77pmszFwNLNyrVO3R7jbNagrx55tfOmL2n9lRCRgj
	SRlS2oPyrriGCbeIyX5NzB/CEoczsgCU=
X-Gm-Gg: AYBFou0yiQVu5QXYOssOPDEXtEnDZRUzsByjjnUazGc2ZRH8RzmFTowR8eX1ZmKtSa0
	RMD8+LogfihDFn+GWxJOot/QMMug3gVFpwPXem5RvW5+Lm20KAs8ta7NVBFfJxqxLIzheLL/ER5
	tSUoYNz94+In68AF3RknuptMqtc39lxQqF7P4FldgFi9tk70JwZAYUYX1IeaQ1BYZ4sdh9zjPDj
	Xw2BciiyXGRzTs9b2WXMfsrXmonUmahQyxh396Oe0K1r4dW/gbI9R82XFxnqks0TgvPrerm1b3+
	ZcRlvvenMrYmuZbHTgzou0/qBbDfPwyDeXHT+u6HMmzjn2gzE5pk95DUMEpzlQroQgd8yZvFXcN
	jeW/VkERz3iB/56fDOylxnAkKwQGDbjBEAC1qQK8XPuiizUaq2E/Xph+tKXtVchzp1c3YOA==
X-Received: by 2002:a05:600c:608a:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4b6dc6dec3emr54790815e9.4.1793983813665; Fri, 06 Nov 2026
 08:50:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-1-3246e91e6394@gmail.com>
 <20261106023612.344f3b86@jic23-hlaptop>
In-Reply-To: <20261106023612.344f3b86@jic23-hlaptop>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:20:02 +0530
X-Gm-Features: AclHuK94pqY4o9kDaIq0ZXjLoVkpvvbtbW1DPpiIVyi1k-5YacPr6LPcR1PnSQ8
Message-ID: <CAFkCdFz6zLMQPiAuDs4U8_6G8us-YoAJAjiT0WzB02=5RfJLoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: magnetometer: add Infineon TLE493D-W2B6
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 02:36:00 +0000, Jonathan Cameron <jic23@kernel.org> wrote:

> That doesn't exclude using a shared device tree binding (as it is a many
> to many relationship between bindings and drivers) and it seems like
> nothing stops you combining this with the tle493d-a1b6 binding.

Makes sense, I'll add the compatible to infineon,tlv493d-a1b6.yaml in
v2 and Cc Dixit.

Thanks,
Viral
