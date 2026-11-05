Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840079;
	b=c+S6MHZSs3kWKFKPZ2FalHWfIo/urHdNqYRKXNfhks9YUGvSNDpQe4jGiPxaNBFxASHT
	 ka6pefXajIKT98dxmjLyd/AZwifFO4Iksih6/0DFCi6IzJXw3pMmbzXTb27PRok2TdKQ1
	 jLNlSGyd/n5OFCPNWVkb+Ec8HXRnC7OwnGa82a3D2xsEEWYmgl+z4U9L/q30rLiPeWR5F
	 AIHKBtds5Ice/5hVZj33qQwH8bpQLMhDKKURQ0flDde4RQAxwfRViNNbj0EUgmy33JZfx
	 F1BGSyR6IVaBMJKn6zFKnM0Ir5xnFqnIWmBdalufj33ZscOSVR7IvXc5xCdwwbqmE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
	b=jGbEWKAW5EsgrVhGbpJczavm9T0IofRXYIfHfaOHnTmqPYJIsEKs0eVjcOWFsMBhp9nJ
	 34CofwJw+No7IvXmyAsDfXJ36/seg5VTdV7RljI8KRqtqAUh0nLeCVcBZhy+IpP8xamwX
	 W48uciD8QhiX5qTCHQBY/l7RInAzMbuUbEhbyX3tp7oLo58E6EyRN2h+/qAJrjZTaJbq+
	 0mpmig0J1MR5So3JMKQajdBwVV7OLiEIjFWL0+IcMBLO5GXb73NBV8AJ9UHGYTyLcb8MQ
	 pM8pDd3paycx4ClQymrqJRUvVKlKHdgTS1DSAMmvrJnVLmZlMTs3bDN7U5fnbYBXVyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C7606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8C7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed2bfe3252so138445ad.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840078; x=1794444878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
        b=csjVmusK6GiXmAfuWTKhX33rj02D1Pn60bBt718fUkr9fd2Ijma3cjNJPPzXh5T97s
         SRipRZGpVrncJ76rej6k0UZR+OsiV0w1vnuqUQK/13ncFkX4z4WtegqFBQOwWKk/KtR+
         LxLqZAbKHQ7MsGYLkmzFw6WtAYvn/ADYKt6uyImVlM8hHWvBxfwCS+J0PQiW/IALHSLU
         m8lDf4miQ+C1AxoUyH5E9BSlokFLMT1iLuKO+T4cklIanl7TgJytVaeaoArJwOrCchgJ
         KpurKKsTLfpdpibZ6XSnzBWgC3TmTixWMsZRs4SnEWdjpz+TjBKzd0l3UnMtPZ4bJOnp
         IMSg==
X-Forwarded-Encrypted: i=1; AKwUvByb0oeNEYdGJYV0iQ0iW48S29icehEs6wvJ0wHTtPlt5eQFgKQPloCJUqHxIAA64hpM3/+AjoxuA4W4@vger.kernel.org
X-Gm-Message-State: APuU4Z+s7xEI1GY+b0NIvl/4YN3qjkVh+tmKVdh/7e0cMfVC6Gj52u/k
	6F3lLMvRZBvBbDQ2OeP5M4AYi22+663EDpqLfiCWI2ZbDUS4JvN0Um2CNNJddQNW
X-Gm-Gg: AYBFou2BP9RxVr/nOVomq9LBtWPeJBxZOM9j0PkqPfE5+/w6VE8uBFvlBESmDZ8NVJy
	bBm8ZHWiHPcWl610Mx3ZuNwygnJC99nFX/XK1oaIstTW12t8TUAhDTcoIgzGVV8NcDqU7JlmRoE
	Pz9P9hRyzML4vHsvCM9qr48YDoHJPgNlM6xvCHGasHrVfSsXzJgufj90i7fujPpg9MUR3kIkMhg
	Bvpo2vGg8eHdkZjK9NcYRq+SRa6QWmQ0cF6dRL0AgJPauYdC4W3CgjMEyoltx4RsyedNHTUdJIm
	t+gW8/+LaPArgRrCZvAT0IjL9RyLFMQW/75lblL0JWWntjCFA/EcDMDBcXkwFk+RqTGvL72DXX9
	c0ZPAxfzRkwojNA9YNfJQOF2y/xKcvtXMqTOVhNHlwJGoVfPIhQI7qjMkeBcXMK1nPZRIMbPjtC
	fWz3LFIPS4yuKBhdNu1ncLy1Pbw6R5ybGMqWG67Z6nXee1Q5y7YPCzVjsPYHHAPQQhjAZ9HiMO8
	PltP20IWKWqaGgpo/6O6Rr6znvWrsYG9CvzzEpLqe0tzCG30VKc/owgidc0ZK8a36QH4KR9GLtT
	Sx0/1k3rEogTTlBJJe5cPz4izF07FU0zg3QsXqtbwj/V9X5GPpTROSdZDt5BRT/1KoYKnQu7g9b
	k2/+9nHPINizlJbMHWtlzRQY8CB9bwHPlbbZ3+ik0Xng=
X-Received: by 2002:a17:90b:3b4c:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3ae89765c3bmr14032489a91.38.1793840078049;
        Wed, 04 Nov 2026 16:54:38 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3131f8csm1163828a91.2.2026.11.04.16.54.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:54:37 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so801388eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:54:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxAZbdDQfOicodmX+SJjHWHSsEGvzLrD88k6icLbOH6JGRYiTe21B6tgbNGvChhC2aPChmMWXigVWuZ@vger.kernel.org
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id
 5a478bee46e88-36a42437876mr26853707eec.34.1793840077202; Wed, 04 Nov 2026
 16:54:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
In-Reply-To: <20261104-geiger-handler-f6688647819c@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:54:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
X-Gm-Features: AclHuK-Z6NSKmUV0ZPuPw18jk94Az1xuvLsjfOJ7Ac2Y0GWV6yFDmJA_PUWlBBE
Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you just use pinctrl_generic_pins_function_dt_node_to_map here and
> dynamically create the groups at runtime (and also make use of the
> generic get_groups_* implementations)?

Yes, I'll switch to them in v2. One consequence first: the helper reads
"pins" as pin numbers, so the binding's pins would change from names
like "UART_TX" to numbers, as in microchip,mpfs-pinctrl-mssio. The
function names stay as they are. Is that change fine with you?
