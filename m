Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771321;
	b=FzJGvGjWyEY52m1COK9YVWcto98LZI+sgaIFxUKPb8BWo0OydTlvWV4LFSDviW4ShBTM
	 5hxHzHTwni1F47maoiVyQXSR5pPO9R/liOp9Krb1d619QN3zaqpKos0ooigHvwzih4aG7
	 UeYUlv2ihiUb7eLwvtDzgocpIAldR7x2P7pHgMv/WydE1emGB7T/v/ahjHnbR0NDnBS6p
	 F3SMAOCCHjJU/XnJrG9LZ0/hv20mRMU20XmKK8UziuhwbxXBi/MgvQUhQDXmtRxxU1tY0
	 eUrnefGWyErUxvy3Cdz054nwnB+dJZar1UNq2UxaOdW/gyJftrqfHpFmKcBx6dJm1Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
	b=dMSFBCG6NIQ/o1VOFa5JTJ1CDIEKnUP/dnDKpRTKdnnjcqEk9g0Q6L+93dJVJCFBUE/9
	 3UbV4TiJ7kZIj9KVwsCLsp9n8JcPB2f3iIFmmFWbW4LpFEXGHli4HSldgXxmmVUUgy4fW
	 VkPFGye+dhb4u+kf4spISgAoppZpkqnvhr60/IbJq1EA/p3n8/VVNRbGUdskQEOz1sWtV
	 uRv+mhbR1aVvjtghox3wkS352sD8HvUenTvQNECAFhWZEkZXWy0EXKh1Q1UJ2EGSlwujG
	 JWHowIBvnb1A49ZjZUXurJApbT99CJBkSfYEkGRSt/v8OwNzAcjgm0faKJqEqynodVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ntrYKELj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4026606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4026606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ntrYKELj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so7361878f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795771319; x=1796376119; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=ntrYKELjVyYmc5EIREXSJiz5LXrlRVwcqTuOc4K4L1xHE1tQ+xj25KrNTBRt35kFug
         w2wLN+wqageIsfHvEhmshrL04ynMxt3sKEhqPIKw6B5ujjPKgehMtnQ3kNd6CBbh67+E
         s83Sk+9+q6wTVCvt0iiHLxVIucsOhokGu5E3ZR+FgVqNXszbiJw1KkxhAsT/k11Vi5gh
         srngCczt8bWD5XRdot7/7vD2Syc1ZP2ZKxK6bSg1GgflMct152fuhWnDQmcpcslHfgzi
         tx6Jm8S2Cge8zyjiwuLBWKpV98Iw+4Tdn7hy6ns5bmpTZ9zk74rklc5wQUAEnes7Q/fm
         PG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771319; x=1796376119;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqN+LSE4nSI9/z7BXHGFyErjuKwOTgsn0qz0X0Y03jY=;
        b=Lkax3rUCnZKGkhNxXR+2t+xhwbJajkoL6X7p+dWPpJI9FCpsHXtTc+ztgVd1tASCU9
         jqpvZ2AuxeP8fqSFPevidkPr/h1hXZC+yzOqcZHHQwRO4EXJr3oneXo8PkA1DOscOw7f
         /qG5LsJU3qmHDqPRVndZhdXZOxztt5lEKi1rHultrN+sdxnnCaj/Nzos2S0JH7ir6DQy
         uj2jhr9Th4yQP+dMmg7YHBpNmD57w9zwdAYJV3scFyG8hjPTmXzkxSsolpX3MvuUR4dl
         vOO/DSrEwGdzS3vBaUzRHe/I7/FKVXD3y0RtfalrUH8tzNAYDIVEEpwLETIMGNCAPwgh
         4yzQ==
X-Forwarded-Encrypted: i=1; AL+hErG+H3Y1ubhKIQQTqXfPFwvvJzaHYKJNqBTxgAhLhAjtCy/nRPDxDjwkswwRiO4MeZWRr5K6LNHt9kxU@vger.kernel.org
X-Gm-Message-State: APuU4Z/uE+XV83oM2oeTuDJhJ+eu4mwAJXD5ZmZDhDvaHYVBUGZD1adX
	fc4J3t05J//+NL7BONy8Fh/+cxlCkFmOnSQxhU+wS0ygR8JxbtFKUKcQgznkfo4iQmg=
X-Gm-Gg: AZFdTZfmJfwXykuxWzLDeYBC5hSGLmdX+748drgo3x/OLxp5K5oc/WF+7cbeiQ0aUzg
	sHf1iWIZPwRcLFu/yWL9qda6+nNMOA5olFyCnJoP4bzb+DughCHvF+cPi1iuG1zSaZfe0D0BuNP
	0gUhxVfC328cstOHXj6feieLvTL3KrCKISMQz1oextG0TCmz58wxitB097R3io+DUVhHkpzU+uf
	MnwMBYASkoqpyyDu8ALRrVAm/P7B2jWJoLVHeTkoGiLId7xEx3qT0GOCgspkoRjsuBQOKNbZtiC
	ztEORqHdu2Rdz2XkBFCaoQd80+0XsbD/mVUk4pAvRK3pUKWyvNHTdfIHiBaq3sHhx6JHAPg5oGT
	yOEyre8nVS70s+35OHYlMULCJHyNBfzSqmSu7g9ua4vrpjoaLZBR8bKGsT933UsjP7oHUqVgsP9
	vyZ6ZKJn/DSemCuM7l8zlDpw3vPwotL5XPNF6esATOctVVDDy/yWrj7Uz+qgiYQdVa72cvgcKCp
	G2uZytxSUlLZtatMtyn15kZrnZl0cT3TlTPAcciftYQz1qIysE4+QjBxFN57sgGVBMWEYKVl3vX
	18wwrSk1Ez4jIjVckp1NIFo+f7aT8hj9PdK+Ng23a29O59lI
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr538864655e9.10.1795771318996;
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm741305005e9.14.2026.11.27.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:21:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
In-Reply-To: <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20261127084820.GN38590@joneslee-macbookpro.roam.internal>
Date: Fri, 27 Nov 2026 10:21:57 +0100
Message-ID: <1jzeuu1vey.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 08:48, Lee Jones <lee@kernel.org> wrote:

> On Thu, 10 Sep 2026, Jerome Brunet wrote:
>
>> This patch series adds support for the X-Powers AXP318W PMIC, which is
>> used recently on new boards with Allwinner SoCs (the A733).
>
> Doesn't apply.  Please rebase onto v7.4-rc1 and submit a [RESEND].

No worries.

In this cycle, series based on -rc1 and devm_kzalloc() in them tend to
conflict in next. This series would be impacted too. I can rebase on -rc2
if you'd prefer to avoid this. Just tell which you prefer.

Cheers

>
> -- 
> Lee Jones

-- 
Jerome
