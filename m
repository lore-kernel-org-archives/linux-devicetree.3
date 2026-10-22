Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691376;
	b=F+ich+Bo66RNUhqBKg+VgEv+0Zbqb7BevecRYEp+iHOXOBXvS61tRC8TQdCLCTrzRmZt
	 TU5WmPkKSJ6WOoRj9q8kX0pzNUI0hSFiYtC4VvCOF2P+K2xzrwlT3nyl72UJcgZQEyQXw
	 3EhQ1XKFfLFkcMYiJ3exRbRKsHQx24dhMJv3fr0PdV7mxye0VV+aEpmP5CPnOEmvbXtUB
	 0iG2GebvqUg+QXPpMQ0I5yDDKMY5KEdlZ97yH4fCQhiOJNQNEp7SGwBELatk5M6CM8+dT
	 JcctTNpZDxZzsbhjts2CkwVaz7FFLAt7+DtRfKs0umosmYSj8g9y6jp3DeSZwQnT0uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691376;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=;
	b=5AIDNiF+IlKO2EvjsxmcHxHo54mW3oDhgpOPVu3jCTE7LSiF/r21k8Mg22BvFg2puXbq
	 feqd2HQteAMRSEioB8E9rioVx7WCihoJK0Ij1iusAZFuleq0Gpr+f86JaTB4Gn4YgK3Id
	 cVncJI6KNZQon0axUYuE5REtB9XVVYOrTpogcDawklY+/0FxdHDu8ykUMZQPp3ZXxkpk4
	 +Khk0ogosZgUdg4vWxPE2Brx8opAx7S2K32HQoPoV6KVdxWEekcvoXZgSvWKpA8+Daaxw
	 rHN11YPzszSyVA9CvThJjR7SmDZ8tDGC67DOWKp+ZCaninhIh3EDAAeSuFPOThhxIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563C606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9563C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso476385e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691374; x=1793296174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmShLIi0Try9xlFwdP7Bt6IdYlCRVmbmMWtY33HkzA4=;
        b=ijBoRr894/43InU0EfEKst1C8X3M5oTfbVdKRHfZKrT6CV18JY0VUOYhBXvcnAc9Wi
         8WPpq2XexFguVa1YNfAjwDp22UhAdluEmxuxbxR6lPTkbttcwTNQOKukrBTzJ6dzTlPm
         Nbh990e8BThSJyPpLeqy62IWDlz39WWE7zpObImCWr1suBFSuuGAJER4nMvwFE7EoSuB
         8iNid5iAsLW/KMVFHiqzIHE/RP+CXGfwh3G16M5wW/WcvLRghy6Is+3tFbD1EXDgMc5h
         HH7me/YK78ZEgwbxQ9+TPthzHyIeMWBy1HOPCsTaXH96YRL8Mc6w377GGhe/6nOFy9Kh
         0U3g==
X-Forwarded-Encrypted: i=1; AKwUvBzlylT5xuHgvhWs/9d2YVOfXY6bQvhNXhaPPsUtjQC2+g4toq2JCxhLdjw56eZUp9LEiD2X1niyy0qN@vger.kernel.org
X-Gm-Message-State: AFq9FYKFNpMzRUO2ve69uvYpHHfWMdanycQHDpEkTqFIB1rWCNvfYx3L
	9ytr8a3LHdd8CFSW8p/lPJufyOxl3PlHRf3P6QiRfuX1YF7j3MrPuqtg
X-Gm-Gg: AYBFou1pWrnzO1JdAYAqQ3axjvciq+5N+pbaiypvujjw0Q6yv+HPU1Tjxeh0I7h9MCR
	yhv9VIO8ZW+zF8xJNjMJdsYKyaqzFNLB8uIX0QZsgJhUefjJsnc7mlkc3U4m713+etC6U3cvcGe
	OLRPKkBlIShHD3Q/UTqQ5UUVePUZVb676Wsu5rHj+yB4Eh8X04lBrTJvknXVE3NNr5SjxcDZrKo
	VNm4rdwsUJWLvpuERzsxmVSwh3pQOsOlx5ucevJeK0MdlDVAjYi5JULHmX8aoHgyzjpAXEYL2Dl
	r3JUemBtIzC4ik0i6KOWzzMf9FxsqmB1ZH1P9AuJDpNdI/47U5gL+n3KOMABnYOyMYfZseHI9FP
	AcsBmwgFjHmYbIOCB86hjHehBYhW3ouODZh3jbwH5Fy+317h4J1CkCwAOYFb/mywJkqzgtDh03b
	dcOmbkYlGZ0j0uzohR/TrQ4h9ozuuHsm9WloVL3p+qoMbEPX34yDBsfqEaD68/DXNIlbrs8HlaQ
	R7Uh/dDPRIK4KFrqLhsiLIlSe2zyCNmaCumzvFvAh7H0VCbfidwRs3RzQSML9JiCwYu/FZb476m
	i72Wkz/7aA==
X-Received: by 2002:a05:600c:4684:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a1fdd74b6cmr122177475e9.35.1792691373949;
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm13451355e9.13.2026.10.22.10.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:49:33 -0700 (PDT)
Message-ID: <a23b3a53-9cdf-4e32-8ca8-a80d927d65e2@linux.com>
Date: Thu, 22 Oct 2026 18:49:32 +0100
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
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <20261012-suds-karaoke-efc4acf056af@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261012-suds-karaoke-efc4acf056af@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 20:18, Conor Dooley wrote:
> On Sat, Oct 10, 2026 at 11:59:00AM +0100, Lucas Tanure wrote:
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> 
> If the net guys think this is valuable,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks, but I will drop this patch as is wrong.> (although for something 
like this, us acking probably ain't needed,
> ehh?)
> 
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
>> -- 
>> 2.56.0
>>

