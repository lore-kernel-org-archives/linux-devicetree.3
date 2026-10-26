Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973409;
	b=DYbovHBvNlpe0IQDx94QvTUbsoZ+2dM5fiUkX9KeHPAfDQC3fLn3MG+jpP8txwhDw5hG
	 UBzRA28h+ptBYZbLpYHY5unIlzpMHDAKqZgIthFxAZbJAabsmRiGvHw1TVj0SVC54V6cB
	 RhWaz4Sz9bM0XaG08Eh+AHW0z6ltJ0EFJKeMcfaSFKXL3Y/DhwP9CCyMch3/JJGii4ov4
	 v1heBllVLqAyw7UTwch2qFzzQEavala9ReizFmVvW5IdtehD2r8qLkCP0rGxCNn2pKWZA
	 dFCJEOo0sMsdrGVeaQfbPjM1QIFGCiTIinrJnTAGjOKvcpjEFJnp/By+N3Hdj23nvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
	b=XRlT5XwEMH+7w7/UrP/78rJRJQDmAER8hyWqRZMBDX3X1VXRznscHioxZ8ukgkeD+yed
	 jjDs/IUe9zg0QaiU4QjrlYkgrcC+UOhQf2q0hzJTUsC3kK5g/ox8DJY9OHrBWEW0Jt3/a
	 3ntQ5QAR+QCVu+M6pvkECOeaCLkW5lTP6aKmK0wPQeLDcT9QV/7EBbuQTTYu4ipF0t4ay
	 rqKZHeCbc+R8WGpkyPG28qqjQ2bQ6MF1F+3Wm3FZrWH3IQBrjHTirBoG2bnZO9E7R84mV
	 97A11nMqjl2SJ5zBKB2YbTHrIuZ76rkxGlp+PFSl0HJST9PAgFcETBpjgDQWfc5pjxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obGspQYT;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF41606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF41606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=obGspQYT
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06210b29fso835213b3a.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973408; x=1793578208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
        b=obGspQYTYyqXhIh45EyMX+wi/DglbB6Fl+P0tHTQUCssxcre7T3xvzUTngUHg6ZeNR
         5fds8Q2TCrIG9GF01u/+fd9yyR1DphOkA175De9TfldLy8jE8D1XxkGQYbey6PEA52ud
         9ncjnnFHQXH3UVfPto7OPuwkAmpeIdnIx2Wr97IrdKcj5YO70kxYjEkt+1D36hSNppDq
         pCNs1gJxtb+uTDukEoPGdgC+FWMNOErI7FI2I3fQS7eGIk9paY5FMayg9dsVjw8wOEQZ
         vkpV8vAZ7RnmvUn0Yd/wxDPYF/JoDwUwowiN+Cw3xBkQkG4Vjri71Px5UXyjozoCQLIv
         1sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973408; x=1793578208;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6RNa18QQwE+anXKqe6bcJQOCZahegO/UDnIdYaNXRQ=;
        b=QLj3U8PV5TPSQUi1h6Nv7j+86IOrTAQxosFXucVxrCoettNZf16IDpUWj/+PuPmWdo
         Ggynor6pMA/97UHze4TijAj9bfSDz/H8B1Mz3DRqnzUHFfu0AeuqUvCGMBIUl5XjQnNR
         X7d+yuZSVqcCG7zsDFqhB5CiESWIrjYQHIjFyp0ELXYn8ADs8UULsXcaIFJ6dM4xN9Yk
         5EzKH+d37izmcFeJHXutbCsM1HJl8NjA0ru4y1TMUoC+UbXV62466ec7rnk1Gy2nOY0f
         LMau6PwVD7hYn6JTW7AncdgRZPEgHlZtYoJaFsiBI7TNyweJLzQ44Moy6JHteyZk2Lym
         cfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKN81Nl6lz7FTQbRIihBc0rkoTupQif+WD+ZldfhmJTDZuzVO8kSZ7+a28iaWCLEP4K5NCEaRWGB68@vger.kernel.org
X-Gm-Message-State: AFq9FYJKKg4FF0lSgChem2gc2djH8EgSzGr7K2C5ecLFqCnoApHLd958
	KKrB7XwKXGtqkna2YqZC+WVl/3ocWNnBJPoo8q/4K6ScG4/sIMdTKcFl
X-Gm-Gg: AYBFou3UROvz3affR9ncG5zOg98ScLitsyVzJi+OAu6I4BvajvpSMYuPd4nrZcUGR/W
	Y06/ntg032A2r/QL8HoeX7pirlHS7WgRzwaXu3gL8nIOWVUnGYvDQilt3PGh1f6jfZMDGbErWmP
	Aede9M7f0J2JYQNFzfw7sUb14sMVaYczJvr8SZFmDWz/8nKYq8S+TWJWHy3GjRW3AR9n6XMpFaK
	V9OrgHzwDpwkDjZa8K+pu+lvO4+0OH+3ut/ajbTIKKMFDZWxG+6ftlYmezK3xq+A72KAzplWLUQ
	ZDpwWBoIv7jGWnIS1ydALecThPv3uhI3WfCUSGCHH0CoI49XApDAO89k1xCfKdgi+ANvDL6d/k7
	z8N95L2Lf5OBofgUqq2radJ2kK3WZtQyO0cCLu3HpcfJe+tImjUaJFS7w7rEWFdMrQ1Merj+1xn
	ezATET9xV91rgjdelqpp1h3sd8HfDj9w2HbHcWH5SMn1XRDwtXPTzwplwSIjiL4l9KuVyXKw2qU
	WGS/TjHoU+dQQhNUUUjkyutifeqBQJ6wpyjn28DMkhhHAZYH6/wkoH6Mai1Ouo4IcLYEjjvk/He
	K0JjGvEr2A7sdAB6TgO4yv3fLZZixg==
X-Received: by 2002:a17:90b:2789:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3adea9d6f7dmr4046130a91.20.1792973407824;
        Sun, 25 Oct 2026 17:10:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm6169808a91.6.2026.10.25.17.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 17:10:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd1f8bf4-0dc7-4d89-9eee-8a08e2d5832e@roeck-us.net>
Date: Sun, 25 Oct 2026 17:10:05 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Analog Devices MAX30210
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, Michael.Hennerich@analog.com, andy@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, joshua.crofts1@gmail.com,
 linux-hwmon@vger.kernel.org
References: <20261023080623.1830-1-johnerasmusmari.geronimo@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261023080623.1830-1-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 01:06, John Erasmus Mari Geronimo wrote:
> This series adds support for the Analog Devices MAX30210 I2C
> temperature sensor.
> 
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max30210.pdf
> 
> The device provides a 16-bit temperature output and includes
> features such as a hardware FIFO, programmable sampling rate,
> threshold alarms, and interrupt support. These capabilities map
> naturally to the IIO subsystem, particularly the buffered interface
> and event framework -- hwmon has no equivalent buffered-capture
> framework, and its alarm attributes are polled rather than
> interrupt-driven, so there is no path to supporting the FIFO or the
> autonomous threshold comparators there.

Oh, please, do not make up stuff. The hardware monitoring subsystem
does support interrupts, but it is not mandatory. Sure, most drivers
don't implement it, but that does not mean it is not supported.

Guenter

