Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD1221F20
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 20:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814156; cv=none; b=BVSBuheVDkp7rxPsgXCas7GfOGtICUvu4HSW40/xczIfKfm3DwSK3v1rEZCEknDe+ZaznoG8cJ0JydCOJC+BFC/Ks8p5HbmqEnC2vx0IEJypeEwuY/RBthhIgF2yCG6PGe/3PcVp9mbnB9q/8nfI/8FLxSzagaaCxRKE/5BTPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814156; c=relaxed/simple;
	bh=0vCetBQc/RgR282rGyH6o5vXIBU7+7jTBsdkWgjaAkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9r+OKNSeGi7weivJKtAI5vNto/4zgJAUUzfcgNkS6ap7N5sePwhpwJrwFMrrYGjbkHK8PlhzO/nQ6qPbJog8392HDYe5X3YVw64SQAxtv9sI7R8nPJLGuoiFK2IFpTw3+OPG4FVdnHWBRMdsRleh6AajUQ3hu2KbLoLqBxVpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq0cSHpC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq0cSHpC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf1f074a12so13829445ad.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781814155; x=1782418955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvYpMoq3VW0fKqjPGnaW7LsX6jXZOIA+8rdGT75spEY=;
        b=Bq0cSHpC/V+OCdzZglYdppH+kal0UvqVlUIgw5THV3RY13/Z0Db3N/HRoto2kffH/p
         YUXiUyrOEXS4bPzCBfjNgzS3HkyFKITFcRAilFrSNkZT5lRHRdsXEsNtBrdo9HawSXJb
         YspGM9Pe19AXhVBQasroCs1NjD2GafZW6ROmP0/QaK3JZ9mZyGlZhcj/7NXphrA+ifUO
         OOKG8rJd5nvryJhNHpi+bryWvBYMgJpIURqHSa6WuSqOuHwDXP0ERQKJbuy6p0T+KQ1t
         T0hzFNLA52iF3j1TgbbD1HJiTpAK+iMCZ2S7PIoPoP3OM3QCgqWQrJogsBvSQYgF2zyt
         T7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814155; x=1782418955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvYpMoq3VW0fKqjPGnaW7LsX6jXZOIA+8rdGT75spEY=;
        b=d/W8edrPzePiDyV+KvBxfz6d/L5UC9JvGMeGb0RHxZxF8r2ErE0ISOrVqlBOppwDzC
         xxvjCMiyy6yAzbDATkNJCaLWfgP/n3jbcUy4LrQJFTt4YUZ68RrA6dvkm4LWTbVsv/IC
         9ZUFk1ZqxNKXDAt+jwyzPHF71q3KChpoe9P2xOcEpEf2Db6vaMuSCSWPXOUTVV8VJpv4
         AdyQvjlZXScMghnWBXG4j0Ba6J6ImT7R+KKVHs2Z8MQXpqgW3XxV1STJYvDl7PnkDi80
         HD8iAXDyxAzd2AREMpVzt7ugm1en0ID8bGBYIJQmVf6iiLxbu+/HhXT9pjb716EaFcQo
         6Iqw==
X-Forwarded-Encrypted: i=1; AFNElJ8pjYFFy01PRUqbaZzJ9i45Ev74g8EuZMrm1zhJgNx8f6vrxRE/a1ges23i4sGZkQtr/bAua8OBRt0x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RfpKa9ZjO4rwFNkbnkHMBjJHJ18JYbOrmTHKATWqlnG4Nt8W
	0dV7OIUmux9UQd0cLUvumebEExRiahYgvgPeQPSMZ/6s7VxxZUz3mLw=
X-Gm-Gg: AfdE7cm7g+mCufT2yV69fXVbUg/pndWfDNF9+VfesHLcTUot6QGlPvbl/EcVyuwlGo0
	q18eMdyhmYu+ZrPq6IDfdN24I71De2b5ZYFIhc1QEzTPlw/l+E/BlM9PhTxs/scj7ZgnG55S0SF
	SlWiw+S3ZXn4X2OQMopbeLLDWhtJBVjsq199OS4NmQWD8R7B+aq+tPEqHXQ9nXGFidCAr5Zakxt
	FBpIBCp2hI0b3U7LjPcKjlGrWWtFEU+slsKWQNSWlxz2POC8Mw7wDpFkABXMJKxMuus83vXA/KE
	P4RfWMBdpk9wRHzeajWtyVMxnRy4EcBJYBRJ91eWKbZ9CGKiWh2yMH0bRBPGEvYIazUh0//QMfC
	yzUvHiZ8bMQM4+jyncgaPY7q0zEvQWK5CzAQPEuEM0COJ+LJKTKJynDveLVA1dJFUO9Tf45wYXF
	XzZ2EnuWv4unN7x1zNtCLouauDwCCNpJ+3g/+2ktXoBLPT9SRkn4Adj/56aQ==
X-Received: by 2002:a17:903:1248:b0:2c1:42d2:40a with SMTP id d9443c01a7336-2c718cc902bmr9301895ad.9.1781814155016;
        Thu, 18 Jun 2026 13:22:35 -0700 (PDT)
Received: from [192.168.1.45] ([101.0.62.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089c1e1sm116205ad.11.2026.06.18.13.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:22:34 -0700 (PDT)
Message-ID: <d8b7df8c-56ae-47f0-9d92-830110511252@gmail.com>
Date: Fri, 19 Jun 2026 01:52:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: magnetometer: add support for Melexis
 MLX90393
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
 <20260618160141.11409-3-nikhilgtr@gmail.com> <ajQpq1yzA-ig2c7s@monoceros>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <ajQpq1yzA-ig2c7s@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18-06-2026 10:55 pm, Uwe Kleine-König wrote:
> Hello,
>
> On Thu, Jun 18, 2026 at 09:31:41PM +0530, Nikhil Gautam wrote:
> Please make that:
>
> 	{ .name = "mlx90393" },
Thanks for pointing this out. I'll update it in v3.
> I guess you want
>
> 	.id_table = mlx90393_id,
Yes, that's correct. I'll add the missing .id_table entry in the next 
version.

Thanks for the review!

Best regards,
Nikhil
