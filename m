Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1A497B77
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181971; cv=none; b=Hz96mgiCAd8HXn9pleCArTrgsCm9Iq1zL8C/BwO1VPKWPZDBsGg96F6GrorzxlpMjRDMZUiuYYcUGH5DM/ehuVrjxzPec1SBcGMtEmLmMiwd50HZc8NHAxdAtMHuvD3xsjFS6NexGYXVxifZ8ln5hG87z5GpXhPgVPfhsczmaYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181971; c=relaxed/simple;
	bh=2LlTo3wwPmeDQzltOkv+nInMpH0dQjqgS94fiJ0KCus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRFNNUowyZXbP6QCjlC7f5Qg2yJe13UAImmx6BZ1SiUGgngON+8SVDI683uJCRf0Tyv/D3c/y5pkQaCMBy8RN4z0WgkFpcwhSuMQE/rVeDzwJ4teho4Vlbzn68egRGnpEinCXGGxRnV8Pvpvf5AMMuDOJmeiPcH3MPRivOO47g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb8lTj6s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb8lTj6s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so6425195e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181961; x=1790786761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCRN4DHgD6jqSzbMa54UXzXSIZG4JDsooNiRjXbs5co=;
        b=jb8lTj6srvLoYdLZ8fgvRhF6IgsY0mLFQHujgE2MhNB98VI/iGpw8nFnsXOxJZ6EyG
         PCD9ATDKQz9UbTGRhcumGEBRga99HE5yYb9Nkn/TZdO8pT1M8uQ4pHfPR7BwqsetYp6/
         dfI8SV75SuEQc2ttQoeliZlOxEta8rntr3NGiiZktR1WdY92x8ayZrkAinGeGz8zAX/n
         YbjF2yv93mCFUUSm2ltnx6UliUDZiYbCNQ/UnC/p6nV3C0SQuubTWDKXV54Aol36UPJ6
         aY4pi2eQg5EWUZ88lc2u6tP8+7TY4VE7pIviHoQb7nW61REvmG73ERhpVts6UgyzXYNb
         Doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181961; x=1790786761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCRN4DHgD6jqSzbMa54UXzXSIZG4JDsooNiRjXbs5co=;
        b=OvxkiUj2+dNNxmMQcz2KWVzemitaJ3NKG4SskdUpmftGeNOr6YBeaMCym3MVUDWN4d
         3TFc5XVjMQphxd8Kj/XyEEG8LA6hwC33V2xoqaw+P1vzmceR68v79ZiEZseK1HMPKBHQ
         68EvHMuBPsC6D42g2oZYz3jxz0+Wsfks4cQTxGPEHXrnn1to5IubOLIrs/+ThvQOxWdx
         qBRCXFlIo6rNtAgXcT9aYBBegqsXhdxO5iw4Dlb6JBqU18OfOAcbbmxP44kopD+Ao59c
         AhNyRdRN5Iv295BJaiICE2mPax7HDph0P+27mS3lRXmPz3Zs6ShvMz3u8s4401zCMZa4
         NxnA==
X-Forwarded-Encrypted: i=1; AKwUvBzfdEepI30hiY6apwHy8TggG+ELCycCI623yJoadZ9do+I1q9/57oB2xv49b0xGmlKwP70o+xsW7QCr@vger.kernel.org
X-Gm-Message-State: AFuF++l9K00g1ibZa+tSE5aEYpBcCRsaRujhA2AxTanROnuE9iYvIs8A
	ywYgz2+Bu0BsC5MfFoVNYsx8xe1rInJ9gHyp2zfKweJ6etSdanOw8GcT
X-Gm-Gg: AYBFou1MjlGYdP4kIJbEduX9P9isGYN60W1FOF6Gdgi/sKGAAFbkCXCN1mvAodmgNAk
	rkGSG2CPs0fkppGTd811V/cjv+wE7ao4Ey0Q9sOHfFEVJy5REiXNtAznmPdSpQgmS3HOB0fQb3R
	0kmTQL/i0vXNChRVHWNdsOBBXRBAfNxrhhamaFBZKWghN4a2dQvH7Bdo5YQ8qeoLXzkRLc0Fcjo
	9D42dRe7rYegAG1Rx8PpnSOOndrxQ8gzxJEpqAiAZhLoiUVrFnyxswBz10TjWu21Z1iJItGjo/C
	uEf2VEK0HlMvOAw+Il3TDtoscxRaXTw3zHvB8Qr/CTQcNzSs+bFav4fOHQTdFxkTcHCjqeB+41g
	0I0NaxRtfkvdHezS+t2qahuMHTd0iQbaW8PT3eST44yGhTi+EfEfVd3Dvr9Y4MR0LNaDzw2vexB
	wDw2KjWZ4mwRqp67/gu2OP0ihX9sZcieNPb9avKZSWPajSuBBvQhrJ8S7S7KR1a/8UpVUyy3+89
	Qz3ggXnZBN+v3VX3cypFp2f9dK//xx2L0VbI/qQWVc=
X-Received: by 2002:a05:600c:3515:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-49fdee0aa22mr49910965e9.5.1790181961405;
        Wed, 23 Sep 2026 09:46:01 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c104a6sm65685625e9.0.2026.09.23.09.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:46:00 -0700 (PDT)
Message-ID: <6de301bd-0bb6-4704-8c3f-8da09c5f6830@gmail.com>
Date: Wed, 23 Sep 2026 18:46:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260923131323.1099979-1-sander.speetjens@gmail.com>
 <20260923131323.1099979-2-sander.speetjens@gmail.com>
 <20260923-browbeat-judgingly-b047721f5cb3@spud>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <20260923-browbeat-judgingly-b047721f5cb3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Is this actually needed? Shouldn't the type of uint32 come from the same
> source that the type in rtc.yaml does? Or is this missing in dt-schema?

The rtc.yaml does only provide the description not the type, I also 
expected the type to be there.

