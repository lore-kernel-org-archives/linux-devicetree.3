Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56332378D64
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 02:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488131; cv=none; b=IaZDT5BL9l3MfHaKXq8SCglUDqKZeTW8JCfnf4SaAv/1lJDXkKD9HmTm4mrhbYWFqSDx59l7SNJSsyf4KL2i+ru/D+sgykEBB8oD6NPJnSqpVpFOVAW//ZGVBSic3BcnaWDRlII9Q+fgLqVqmK6xGTZH4ZaPdAqSWMPO7siTyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488131; c=relaxed/simple;
	bh=lq4v/AwbmMMBdu9Utq17/sfVxy5ZTeQRCbLkzsvdYJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW5XwUZc4IidT0LeOWOY5bXwZL5t3KMEehoGUTtZdqL6KYTrFLN5bYFccZ983aYL4eJv7nHoXT/M8PzyyVJ6r0zsrnlOnWIJZsF/f0iyTFFiXlNPJZn/JcOTcHXe/P2DIqi2FabVBeiKgVk0vBS9/OMGB59+SLR9LomiGRZRVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qW/kEZJP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qW/kEZJP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso5378845ad.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488130; x=1789092930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndeE7CrNCxxdH5dHnLsA71031MLc9UwFM/YE1dDZ/bg=;
        b=qW/kEZJPCbyK5zhzSY55bDxn8E2ztHHge9va9K+AQq+Wts2zS1ER6bDtgwY1qg3C9H
         mikHaGcAGlds3jHxxh0L+v4a7TqINgL1DaNHRU4MUc/xzXHQxJUyfDjwqVCytHUwFzOQ
         ZB6avYMEc69EIdkd7jccZqnQzjLT+2FKjuZFnJ5qrqWkuQRzt3+WA+Cls7bptE1Kc4px
         BepVYp/tIql65qyu9++cg3QcPoajfkfU2LWmzSZ21OJ8a/w6SIwirq7Qr9W4gmmsHaSK
         U9TEmEOsip/Rg4iHGAJquLEKikomMVwCkAlmdXEhJ4K67BJi4/Xmt09a+aKT606UIcCr
         3b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488130; x=1789092930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndeE7CrNCxxdH5dHnLsA71031MLc9UwFM/YE1dDZ/bg=;
        b=cULgPTBWL/shfP2wD8Iv/sg4ll5ytpovEHVDEi6jbhmwol5gGG0aMmTcP7Xpt2BkDJ
         xq9mm8YPkg/AN5aUuR6zhctgD6IJHfburn+OYJ8K5vfiY5MWnN7Bu4NZfa8983FVrZgo
         BiFv7iPPOWxeMVixco8/xZHZvRBs2hxVtgo4SyNAWeAtqwoCsKohNzX5wOSazS7sNRCV
         LIRP0eR1ycChxUlVUcVPf1D4b8P7p9W4y+zglcRzIrJ1bXI7CryJK61muHc+7kkcqo9x
         7G095/djWFa1U0qkZEWQW/CK2KMTf5zBN9RSFNsaP5NynC6ZUkDrT0sOgft1Xxml/wAT
         oCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkHxx1yVdlbi58jm0zIfb1dnCqo6O5XWNTwsMaZTPe6iP4gcpOB/IYA7gNlmxVLGv+Oq4lEV2f30jY@vger.kernel.org
X-Gm-Message-State: AFuF++mc/3SZCrpkX0/Rb9pDFwuH4YlagACiimcxPjvX2E5k0jXM6wYO
	N4UrR0l2DOxR6KaSbh8qOUHP2zo4/i06wTluyp3+jMuW2ny3ZRBmSWBRmqEn1/sC
X-Gm-Gg: AYBFou1OuaLSOrT+myggEpcJa5gCXpWPvmdvWgrFllXRVTtH4VFEb1DmtfYFGYbFfHw
	hXl8bP6AdZyg18pNjA/n+W0/VQ8F9UeIaNWvfizg8De0gA5bwWxTrdrpo21id/Ep/TEhSLp4XcN
	UsXyMqw5GAlbD5PDksUrd0buKr7WO/yjfldTRzmVdYrE8Cnp/bL9/6mSrwHqxu+7kf5iYu5TZuY
	NXhqmwvfaJR2p1vyZ+Hn26PeaDFZqsSnzHUimwgDjraYcgJhCpUro60AGLBuX8DpCtesYOWyADJ
	CKX+rDcufnT8FTAqGju1n/oTMf04dTy/xnI/nq08GVLG+/XPxADIx7iEW8Oe7udoEbp8v0KnO1C
	yhCyo5AxAx+siBtON2dl3TN3M0EzZFsnJ3aD9pGSFb98n3dV1hKbh3a8N3LSJEA4Jnyh8rI4uir
	g9II4h2uZZVWX4HRqNYmC50NF2GUG8u3zHGYnqjLHBm+bKR6FRYj69NYGjvZN0wNACDjIss7V4
X-Received: by 2002:a17:902:b217:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2db159b5996mr10682725ad.6.1788488129501;
        Thu, 03 Sep 2026 19:15:29 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0b2sm3062125ad.28.2026.09.03.19.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:15:28 -0700 (PDT)
Message-ID: <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>
Date: Thu, 3 Sep 2026 19:15:14 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
 <20260324-marshland-stretch-cc21ae7fdc2e@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260324-marshland-stretch-cc21ae7fdc2e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 10:49, Conor Dooley wrote:
> On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
>> Hi All,
>>
>> Any suggestions/comments on this?
> 
> I'll get to it at some point, just busy sorry!

Hi Conor,

It's been quite a while, and I almost forgot about this. Any new
suggestions? Comments?

Bo
