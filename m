Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903670;
	b=fF7IovoRrT8ukRQt+3H8MJWjJD73ScGEKqJIfC138vXrCAxKRCO5dG9Y1Z7Kfh/H3kFZ
	 FtRXpki1akAvcbk+R8oae56b5a/Cw8ywWYXR7cGFWc4DuU/b2u+exaOIt5ZhQI5New9Q9
	 QZJTv76pPGB/dJ/Gb2vXASxTGT2oGwk50zVEuaQa6O85W4i9hKlkPOajGuTD5QAD+YmOG
	 3hafg4Vo/xzKsQOwxA0bJycwxlFBOMdJNpl80QxYKY7f1iXfRD3eDj4YoXwV7xAgotSa9
	 8QwgF2xLL+JB9gz0NYE4RJAWuIYzPH111/SR4P3qX/2gX0dBVeX2TleMjqNoY3Znrew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903670;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kgD+tUTOk9garvkXT1JZE8IpV0ytjaEat0WUrpK1KAE=;
	b=ZLNg8RprsMc6Eg0WDqUDX6fHidLY5SKtHfNdB3fSUEhFlIb0BFCCWrjaVk4iBRsbVnaW
	 QllybdGFYVWH4940/BVt3VKyKS++wj5PU1ViIhoMOdUvmVotDVv27KUpeQHhdfqWlS/3r
	 TXN/wrGaHnlxLUwpUWWsY1NXG03tudWzPR1rtc66uvQdpWz4fRI+vWD7rZjkrIqXwp98V
	 tZIXCp8d8gy5J+4YOviJnuFMeAuJqbuUozNDoDu/AOdzvFkC+wjlO+F8AAO4ZNRUzJp4+
	 VmpesCiLOf3yXo8c0Q/C5Hfpp90NG2fjbGFvpR3ALrqavzwcWRjWjLent0pLBOY6CpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E03606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso410398a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903669; x=1795508469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kgD+tUTOk9garvkXT1JZE8IpV0ytjaEat0WUrpK1KAE=;
        b=JHw3pG/Ji3DEMHJ6gf1kXOGa3EUF/4EcSF0p+y5v1R3nghqfJSugsBjhKUPhTS0gRW
         pkdGKcO2HQdQk1vVplLYWMR4v391WPS8iVy/SGcf5Mbri0EnRpCRVxPwjJOePQSFlEzS
         479HrbW7KTLfTj1fz9ulVZbGEucDf/qbPscDVdzrxR139JYe5eeIsCEyp5BBrxCa2zhZ
         GbbOwbR/5eqBal5wicCRh4tNWaziPc6p3VbwfBZexcPO8n9HaDn/EKeHUNraLErstSWu
         deF2PZAYMW3nZrwjmejIz4mnG0slePyK3694Ky1p83WeddMQlTmr+np6DZrn8eOUayxO
         AoTw==
X-Forwarded-Encrypted: i=1; AL+hErEt8bzdlvsErFhu4Z45RkvS/Sf1WwilWx/nCaASt+gsODegBwPp8sa3il8B61p6p93Q7CqYCRZX2aIS@vger.kernel.org
X-Gm-Message-State: APuU4Z+MdrkBHcaUTtslxU+aIZlSiYD3Jzu/7nA9I3amErVIsUT8KuMh
	YVMqd0HBXGaLtvSCPk6VWVj4DVRyvWewciRdZ/MTSN9cSLf1qzxV/QZchYJtOegK
X-Gm-Gg: AZFdTZeno7KDDP/ETBrejQEZUe53L4zyZV97Suw01f6OBF5rnwO+0Zpeat+aDUpjwB6
	t0bsg28mJKOAuMcIHUD2DPmcU0QuehXK1eEduX8bCrpqlMA+xsA6ypABzcc60XwfWdXcNcweLrt
	O09TSaVGBDbpIt7V4cUQOd05inkLqcQJKYbyXv5OelYhUaV8ACnoVx/1sr8VUU+bpnaaeQdqExo
	cHBNPM65g7/5+BlMBCWY6oF/5jfYIXY565A5+mPCn4AnPEtIUEnmVUm1rZ0kz4Y2DYpDpsLx7FC
	ia0brmMOcaGlLDX4et807d8TtEe3F5IF0l7d0CRbuJfbhrlNi0HxjLIxkbYiLb4VwMQErybVRrl
	Qw5/fxzog5bKw84xCoqspXni79shz2mCmo1SDR9Gy62NNr3+AvndO7gnW/5WCLFzc6OiiPNFiWf
	FoWmdN7jfpJxfdPCNVKNplYHcqHYP6HHL/0tYzdEzXPJR2IfVorL7B7zfSAVLb7sxgE8FSPaSXP
	aLHv5gv92qvFUiOFOm866ivDk7dj1U+g7Uc5yKfLSyEQUjHT3Ohcu1Vt3PUYA7+oZi+wsISNRuS
	LTF56sRvW/J28NIFqolj0FJc1mBvptDY+dn7g3AbJZ+/BrktVX2ViuH2yKiAGIZQEVE+b/Eki/n
	zm/hKLkffqSd7fm6A19y2AIGgZJRqqBzuI1lVH6eZhcGo
X-Received: by 2002:a17:90b:498e:b0:3ac:1629:4091 with SMTP id 98e67ed59e1d1-3b3ac2c385emr1281382a91.45.1794903668733;
        Tue, 17 Nov 2026 00:21:08 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786f7sm2959151a91.1.2026.11.17.00.21.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:21:08 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380c28f9e35so701452eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:21:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFv6muCkUYh3O9U9fkGTj/RoN7YoAlGIJnRpeIQ9izQoOSPoD8neXiqBQSe2zp5lR2iEzTXm5rbicpx@vger.kernel.org
X-Received: by 2002:a05:7301:2ab1:b0:36a:79cd:12df with SMTP id
 5a478bee46e88-3810c843192mr1761148eec.9.1794903667144; Tue, 17 Nov 2026
 00:21:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-1-ef6b7c06d4b0@telaak.dev> <avwL_iuTyEjaj0hs@ashevche-desk.local>
In-Reply-To: <avwL_iuTyEjaj0hs@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 03:20:55 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ53YA3AbkFNCw=OXDSXnPM=CF1_WV+TatUjx0Rbwff0KA@mail.gmail.com>
X-Gm-Features: Aa3M54pifUmPegO6YEwH8eX-E140QvER9X4qv2NjEXyp1YoVc6uiJAyqJ3gFezQ
Message-ID: <CAPY4CJ53YA3AbkFNCw=OXDSXnPM=CF1_WV+TatUjx0Rbwff0KA@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 03:10, Andy Shevchenko wrote:
> > -Date:                October 2016
>
> This is missing in the copied case.

Right, v2 will keep it.

> > -Contact:     Peter Rosin <peda@axentia.se>
>
> This is also, but I think Contact for generic is the IIO as a whole
> (maintainer level).

Agreed, so I'll leave the IIO list as the contact.
