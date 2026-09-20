Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E7356748
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881488; cv=none; b=kM0NXhFeq5CxA4Ie9py9/EMTLaL47ie00RSRqRRmrzEIzRhuv5099+zXVybtZ9RY/dAvrFifg+I+wuIg5tQocOCw3xZnIcJp64w09U0OcBS34ks3qFN8H6nSmpud5rPA12S1Qc4VL1ar6m3l3ALJCFOBvlHmWr4Tx1ZB/d2HdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881488; c=relaxed/simple;
	bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPIMg3vCDpi/skyae2jMPcohXOINfVOpyGgPQ8SUFNEAS+DUsKiCZFepyRZKWdkQyFuewAJ6JWNnmOV103hbpBJCrSlTXnRy38NZH/7TQTUgTkktjxyHXYfKAkJcedXAuxBeoNO09Z3xrPZKu17RITyjSwQ4Qpq9HxkoVvvD+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTUBTSnh; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTUBTSnh"
Received: by mail-oi2-f6.google.com with SMTP id 46e09a7af769-8069d92e182so822000a34.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 22:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789881484; x=1790486284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=QTUBTSnhmc2cI4Qhs11uPePlJt3zwaGvPe/l0T8YX1qJktU+Jo/2CdoY/XLPAEEYCo
         jkXItKiYhfdoLRy2tXryA7OkvWokLkYt7Sokos3egUFK+Nb4gu2Z+9UVW3q6SPZwrfpk
         Q287tq8uj9b4dgeu+/7abMZKqjPNL3mvTIKYRYAspcdGYX0PUgnXPk10OowZcj9LRcHU
         A0Ofa4o2UnkVDeej5p2jUUUCHmLTwZ1KzIp0IOFTKnFYZz3rVVD1G2uWMhki9zhK2Vq1
         Yw152lMEv2Q3UpPGL/mpKDBamVplAlOo7Qm8F+11K0iEM+6hDkhMzuJd6OEo2hjWb1Y6
         9Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881484; x=1790486284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=GuPOYG1hcmERTEcaTF6X0hnsnwe5k4hA32urLIssUeHBIL3rcrFPhw1FGSna/Wc4N1
         RRgNJ23WDtDY7vdw/6ZLAyfo8NfMZjO1Cy7jJInjh0In+22DDnwP7J25RDbtl48aeZJB
         gebWNgMw6RUbo1wZkla+/QuhZL6IcSb26ybXfmljvGTmGxOp+apZIO4fxMZbf0KDmJRL
         +5IQC54tKcHOKr5kPlz/+7o9YXuRwIxip6vklfIXZL/wiJA1Tn0nzu7d2p7id3PNEF2j
         mshAVnRwBJIvAeaPxtEZ4OhjV5HM7XAyh3WUjoFl+iU0/r5F/zhJskfhIs2tFjTSMJy2
         uqew==
X-Forwarded-Encrypted: i=1; AKwUvBxnITC1oJZttcsH7hotq5d3x+GqRvbHcRPKf7dcD0U616Pi6VGzXQpKJE6dTvcrUdM4MKAjHYFiBOss@vger.kernel.org
X-Gm-Message-State: AFuF++lp4FvheXFB5GKsBEfrfJMfmaEXEgjNhP3QfJf/2rPHSpWp/njx
	U7BrSnW++z5DIPAbwQbrCXK4tIYJqKNpqWORfYFmfEGz6J3IAcckaKnx
X-Gm-Gg: AYBFou2OVOKMMce3CFMiAthABSxMjaPtJ/NulLxlp5mnPaMit+IkNG6Hc21Hbp0KLyC
	AXZlgv/Rp8I1MpvNghs+jausyvyxPkpFrLtXkvbok2JEmzq3tPqArtipRwN2PVTZGGhaZcu0ikS
	Ei+CDpvbeN2M6R6DzNB7WSTqBNQWzhw4uF3YU5r881mnirIi/YVdgu65UgUiL0DPrOMf2Tbuqgf
	Ih35ijupThILv8xSSVC/ApUOoWjfA8BZgppxXXAGf9c/FwnqL/odba0F30Xs52IUMpzWswDPcia
	FiXOWbFqzUUKJgH9N4KAnnHtLEs9z9wLTiXpauO+986r38QDSg+5FodKagscKiuWKENme3gnGN0
	zp26Usan/qUwJU8E851aSrZ5morU1U1uD2dvdj0lLtk4UlpKAmEZW6l4pKCirdqcLARtRnsX7mJ
	F4LSIaLTJj/TEOaB7Px/a5U42fRGc7Wx+j7IHhEhxL77nGrhSklNpYhCpbrx32a0SAVWfoWtoBO
	h2UdtbYmr4b/vQ=
X-Received: by 2002:a05:6820:2219:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6ca972e90f2mr6018628eaf.0.1789881484271;
        Sat, 19 Sep 2026 22:18:04 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd320d5c30sm5494232eaf.2.2026.09.19.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:18:02 -0700 (PDT)
Message-ID: <1c1b2958-dbcc-4a8f-8d7f-d2eaaebc941b@gmail.com>
Date: Sun, 20 Sep 2026 00:18:00 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 2:18 AM, Andy Shevchenko wrote:
>> Cc'd Luca.
> Instead of this, just put the real Cc: email tag here
> Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Done in v3.

Thank you!

Best regards,
Ryan Brue
