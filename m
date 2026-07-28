Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DD37647E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785210774; cv=none; b=RoU0hN59krALDpM8BP5f0c9qHSXR7FPLuYHCi2MD5bKtDgMhkHpLAhkfVSZwgIcYyO9BUnOXPsWxofwSk1RUvn8Apy2x6PGVrhtmI1IzzmRLCNIL9/snwIlP542TRdwfIRirUgCw+OBKEMW1545szEflX7nYD9sS8oe0gMVxlhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785210774; c=relaxed/simple;
	bh=M5T+KaAM80t9AovNsGUv3DFWLw7uVTelJY8eceUcDiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD64N+VN7uCyxJv7qzmCT7OJDZY5bRrG12odlZxx8nuXz1IY8YmqnojEMlrpMYZNjyng3JbaJO7JxCN7DglcHJXhRIjHX2yI47gn+Q6laAgg66Khhnco7+Y8WOFNGgK4vQ26G8xzju0rfHrtwVKP9EBFtYxgcRQZ1eAVY9zrVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtzdPc6A; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtzdPc6A"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2460903a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785210773; x=1785815573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NC0j+I/moo0hAr2UFiiUrPSesKOHYlZZ/duqtEzgHMI=;
        b=HtzdPc6Ak9tS7+a8q7fCwnE8dEg2CqiYg/lv+vjrqyf3WLNAJN9gJgX4LhTb0mKXax
         zw2Gp1hTnxi0mdqO5vfj7H2X4yEzLPm4OGp0T1QFBL5i0nxUjin6CpYD96wSNXaI4up2
         nsn4yOBSpTt9fT1TFA0Uev00EPX9dR/BzCd+fvBpdYI75BQ7RRFWAUSRm6NFFzhR1ePf
         /g80gVI+1NqDl0KEmZf2SvpxQsn8iT3BUA+Si0zLL7uODa0xF94UMxpONqdb8OUBJT4N
         YO36IJNMFsppltxL8wmbE4T2ExrQhxpweGOF/dgYPhhZhJdFH5oj7TxrTYvTw+d/wRjJ
         g/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785210773; x=1785815573;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NC0j+I/moo0hAr2UFiiUrPSesKOHYlZZ/duqtEzgHMI=;
        b=JwGna25CaFJ15GYCx4hpKr1huYh8MKmyC7XgQ7Lahx1b5so2MZIWsYkOBAmpagxIuB
         NDjSBdKPozN8vCBxzqvJvwtX/raPoSc/fLc+u3DJV9+C86KATenIslzCQB6LT/myQSH+
         /GpMhCG/9v0JbQh0ddpk4LnEWgQqqaeJos5dangbiqZDM/SZ8TkbPkiWWTy4oKlA6P5v
         OCK7/ctKxo+2nWIhOFy5wGrj8cF3KM+kfqiewLoyaDnL6GtAg60Nss6o9sSO9BeVTAQU
         pQCYdxuNPQNG1RvtR6mMb4UG5C8uXujKrpNk1dtvZqoUJccv5xEquutCaASnh36qveOo
         EVvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrcbzg3DteAi9h+xlDUMKDUgflXwZgWN1gFSZSIrnPgMtxH7kf5Yui+Pf/TYymrgNZ9aX9hYJX1VU94@vger.kernel.org
X-Gm-Message-State: AOJu0YykN37LXf6X74sfNliuCrpM/JBxEn7Ls13ZXkJJjYGz2XHbivMv
	rZRxPiuSQhtm5AYxGXRrdKw56FsRMw+XJBci0WifZRot+0YRalIfjfx4
X-Gm-Gg: AR+sD13ID/+8HL05OPA9YcIFBjNIMVoGsAkQTyFx7+3pr/i8rWI4DFap3fsPrxdm+M2
	M7yDV6SEOOAA10KwVn15/v4TdFHWGi07GTyMoh5k4wpYzKyQdrlN5wVy3I14RY95DZeUTENokC2
	4r+3WAasqtTx7886NAHlhe47DENBlK3q0OvNdVoncxrEqgd7pjnuXHvRsNJanyAmGFg/+fzVyK1
	X4/Y8nNcJz8cqxIMS+xBPBXCEjYgc0suaqsT7LHXE1vwPLiZDbANqDkIWNS61Rm1vz9vgsd8pRx
	cQQAdqyHyZhN1HNYfdE+QPiQnaJ/DAvGtPyVC2dFp9RyirCBqzn9OeMf3C/2GTaCER1QoZqYB3h
	GHfai3wEvhqohxpeXV852lEM5YZtHKMjDGJeAqcaianCT7qyB0dguhi+OyTlzz9YlO9RRd4Ph+Z
	p5Z+/ZXe+HHAkbN4nX41c2fsBoQv4G+Cc1n9DBh3uECtd4PQuaAvs=
X-Received: by 2002:a17:90b:55c8:b0:38e:7d77:2fbb with SMTP id 98e67ed59e1d1-38f6a425a50mr730604a91.32.1785210772563;
        Mon, 27 Jul 2026 20:52:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f641053cfsm601716a91.3.2026.07.27.20.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 20:52:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f8d70912-3b01-47aa-9be2-f77ea5dfbf0e@roeck-us.net>
Date: Mon, 27 Jul 2026 20:52:50 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon-next PATCH v3 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
 <CAJq09z7QtzTxucEvcKa6zXjhGyuqDjpLHiD8A=EJXshpoV_vvA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJq09z7QtzTxucEvcKa6zXjhGyuqDjpLHiD8A=EJXshpoV_vvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 20:21, Luiz Angelo Daros de Luca wrote:
> It looks like Sashiko had trouble applying the patchset on top of
> hwmon-next. I likely should have used a base commit that's available
> across other trees, such as linux-next. I'll double-check whether I
> misconfigured the prerequisites (it was my first time using them),
> though b4 validated everything fine locally.
> 
I pushed the patch series only into the hwmon branch. I guess Sashiko
doesn't know about that branch. I now rebased hwmon-next on top of hwmon
and pushed it out, so Sashiko should now be able to see the previous
patches.

Guenter

