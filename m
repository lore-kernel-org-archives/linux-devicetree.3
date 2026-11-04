Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815599;
	b=c7mr0GsJLKPcv028G6MGsbhX3ZVAt32C/ldIwcGCUVilHR7mVY7iikJ2PjI9ijVjhnbm
	 Z/5UMS7bMjuBuiFSLZ9AxCIQDIABrDLnTJCW/EYvoDRW5oeT9Nikm0SRJ3YAM2nVB45+k
	 8Gd0t1OYQacQE8HlCj4w3MqBwSZQZ2gzQqxBqQtv95FLBSspI+mvkpZNxqfqjOKkvgKZ3
	 186Ds+eppUtvfTxARh0JT9yu+LzgVG4ue1vH9CKEYNzTM3BdKswmp/r9NYbZRAXmVniDY
	 5W/Nb+il3eWH01+CS7CgGgui4+7rbLuaeG3Z7ZuZ+evy8Nw2ZuVLtIc6zpnawmvb5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815599;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=JYnILKMZUQQ2qcf11fz0nOgyjnPywaDnZ+5Jo4mb0H4=;
	b=MKWTy8SqNBE6fTUnSacQG3QMKjbpWQIBydyL5N0H0B+A/eTQgmjVzTR0MWoe8fAOo7LK
	 dJyWof1KCgdpo2nlCeg8SgacFwxwIu6V4a63kwm+10fsKRdrDzpINGVj2bJd4qMxRyj0f
	 rjYZV+p9vEXwZc2qMRcXpkH+7JkylICvE0WrxA5Zu6sdptujsd4NSIVMWzR3HjZPK0tQY
	 1AyFNUDu2JSKXHOcFv2doYBbw8ZxY5p0rHxGeX4qk+6/vmJnR2L3VYAUfHqlvoJU6UZgX
	 C3zH3TtBdPCxzM6nNACNUuqIZjPNmTTGdPBpvyKHzaCaJLgkt0nVkrz6d99crpt9PiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="XsS9wk/K";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0F606D83F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA0F606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XsS9wk/K
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D087C8F46B;
	Wed,  4 Nov 2026 18:07:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FE5960770;
	Wed,  4 Nov 2026 18:06:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E71110329205;
	Wed,  4 Nov 2026 19:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793815593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JYnILKMZUQQ2qcf11fz0nOgyjnPywaDnZ+5Jo4mb0H4=;
	b=XsS9wk/K+3MnYk2ZviDuOyRdciIrNf/G6bpo1TAnnDdxOY5EXX4guoJqQ/ePMKWhHV2shM
	Fig3dQL+ImMwlhpLYLsWPQ+/+Ku/n4/UuHVoV/JaST62i/xk3zcIzKYxnhw8N7J2x2JKBj
	4B/I5x/WDey2atSKT4TflgCxtgzlRhGPNeh+leZAp+T1CTpq/U7BaerDFfl4fJ26m6o+AC
	m1RcnoVxroCGDAvngU/qYezzl0ZjNESJj9jQ1FUfuTq6ydtXQKrVRvpRmrF88yUQmtGtwY
	90XLvh8crZAdbA7fkGuDgPzusRIHoYYm0DWv3YBQJf+ldsoJ+3eTRqx2bH2hgg==
Message-ID: <ac9f57f7-cb96-4a2c-85c0-5369b3bb0a64@bootlin.com>
Date: Wed, 4 Nov 2026 19:06:25 +0100
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
Subject: Re: [PATCH v3 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Joshua Crofts <crofts@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, herve.codina@bootlin.com,
 thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104125726.1754980-1-maxime.chevallier@bootlin.com>
 <20261104125726.1754980-3-maxime.chevallier@bootlin.com>
 <20261104145641.000070f2@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261104145641.000070f2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Joshua,

On 11/4/26 14:56, Joshua Crofts wrote:

[...]

>> +static int tla2528_read(struct tla2528 *tla2528, u8 channel, int *val)
>> +{
>> +	__be16 data;
>> +	int ret;
>> +
>> +	guard(mutex)(&tla2528->lock);
>> +
>> +	ret = regmap_update_bits(tla2528->regmap, TLA2528_CHANNEL_SEL_ADR,
>> +				 TLA2528_CHANNEL_SEL_MANUAL_CHID, channel);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = i2c_master_recv(tla2528->client, (char *)&data, sizeof(data));
>> +	if (ret < 0)
>> +		return ret;
>>
> 
> As rare as short reads may be, perhaps add a check whether the expected amount
> of bits have been returned from the device?

True yes, I'll address that. Got a sashiko review about that too :/

I'll also address the other comments in V4, thanks a lot for reviewing,

Maxime
