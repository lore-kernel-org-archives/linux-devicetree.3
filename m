Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698820;
	b=XUXcgT3xbuaxOusbUX9C+DeMHwtE6QuZwYKuZ8mneoUJFWN9s0GxI3THb/88VTyWlAc7
	 lcozCjvYZX/kNmWx91KUgsQleOFzy+te9sKWzsc8BYB8XlBsbB7h/jsn+aFx1WmF1QxCN
	 aDbQTDJZ03ryspMP3zCmiWELxF6wdHnUOd8DhDGxctuVubj3xpG6sIH8lbEOhDUz+2lT1
	 HTuzEfKyNmzXkphxkxcozkWvCFBtH29RojDIZG5Olw9QQuufqP49tq6TphLdni1WQfDFn
	 qAoiCJeh/vZgU4Z4xIgjy11khJn6MXJYwfZ7taoNZ7Dyx+a+pRed0uy9uk89dMpiuxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
	b=azhFlF1/tcufPK0O8YMUu7AcZN4d4UIWOHO58XD3XD95ggL3LWCrWtw1ZpaG7oql80qy
	 5+W75neXEezs+dryuzKR4dqTrfw/g/VtqPjB4ufdXb8sSPPhHP0HZkM6z0XegrSmC+yqI
	 +hPQckI5ad8O8fQBpuj3kaoyR7r5dVJgG6UOLER5QPUOUYZzQcd+X8X5kL4O74F4jgG3y
	 kWdHZCrkUWNvFbhLlDT03Rn60URrLT2s7uGksTlNKqZiGUdseGw7ua/5znWtxbMrO8vF/
	 nGft1tnZTW4+Vhcstkijb/aCzNeMzYqZOlVekCBZw8himriX8/A472rk/5zNbXQsT3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bcl4/e4p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F53606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bcl4/e4p
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67999045530so3329437d50.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698819; cv=none;
        d=google.com; s=arc-20260327;
        b=X/KwJe6JuuXdFMYLPLi23LWo+2O+Mt9X50cfJmmQ8mys9uap3LoTg4+EXdfCZ/38oP
         NS3etDOOVQ+G5+Dcrw53jOT8t89uI8g8KN6umXzXjGBUslP+QO422NxT33iBxIVwvC3/
         fTYdE/A+AyZckUfoH90KgL33tq6T4qGv6dzhVsWLSgFeOC9R5mS+pdnOW2CZyWkUJgky
         IHu4d907c4g7Bjv8Eled5YQV7Wce1dKf5OS2xG/bnOd0EFdrz0ss3ZiwzkLLmZ0ap3PD
         ogjgFEllqe1SSeINBxCwF12Iisxsj79yhTYVospwo3s+JcrzQDYL6wkc9/X2ABDtHtfI
         PTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        fh=UN2HkWPig77/TJPq50batAlvIpm4csbcYsy7db4+kko=;
        b=PtJxGph8wjpR7rGe3gCqTtL5lYiuLtgh+9dhidKH9AU/GRO0GaQAUmKkEODBKtfXrr
         JpThsAs5Cwe3Q6f2lfjUMXSnHKLuS2uhfa5bguz+3lIx7vU2NfkqxYAuAN+APt+3Jkz2
         OEY4R6ZfC1yzC1w2JXlxRgiyljsOWofRgI5fwqwlNiM5BCCjGFCy4nbmIO5lalMhqMYT
         fzo+/4pjQn4UDqmE64+SHJa55QNtOiCvWGxeyTPX/hwb6ouYfFeNo8xkoGdGxiSiUegj
         WrRpkf3BIQZpoVYUePbmijyjgNdHoHzI3zlE9BxluiCMQA50RdbR9pX85bXtQev/BQ9Z
         gr2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698819; x=1794303619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=Bcl4/e4pfJXk8T9seSrGkQ+IYi6EBAg3ylBUFruPMYAw5c9nFuNnEbEGQlFGJI1JqH
         4avjO4kIySvU6oj/20gAYXq4+NNeI1wJaaFypgan/bd25u8r90C//Aiww77pBDmbjqDy
         n0k58ogdSg4POJYyNsKbUuAJtT5riXJMTkbflJ52gXwv/FfV5XXyuIejDTRVpsof4QnQ
         WLzD+IS4ax4yk27LJ4/swgyk3GOHNDslT6a7g7ZEUmNPt8SssRYP+Q0GaX37f6cMhxjc
         gHxNWh1/0AGdfZAefBbw+gCF612G5uyJ69FtxRirb1NICz9AbqIz1+bfn3PLHukeTxcU
         Dd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698819; x=1794303619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=nC/EeWnK5UzZGuEutzqPL5xapeqf1CuLIIJdscHj8O9vpCeOCYq3KlQ44zN6dqa7fU
         AGh6KVwN72uYYcYiHjzDvknYqjEVHchGHuYsQyIxVkd8LFLarIJoWXaLzn8HBBLLw5oB
         jaWsUrf43YPgy5IypVLiYsp95tb4fS7GSYp8F5Ax5sKFD6EEjtpxpgJoanyzVkTnhooK
         TM2+zhStR2rjd8+EKl4qkxHxSij/VgSMJYghhX+RNZcOHr9IIXp5WWszTyYKsDs77cb8
         +uMEhoUFWcxch2Y/3tMNEkJSWAi42VheN/FucaG8eydfheQW4bbeXx8t/cmSaSJZUD8r
         mLKA==
X-Forwarded-Encrypted: i=1; AKwUvBxTNuxzSZBq6XqlaOH/yqLAAxmtDaQxpHyy/ntittJoViefQz03CRAs0/+buK4s6y0mC3HUJShF3QK8@vger.kernel.org
X-Gm-Message-State: APuU4Z9PIv4zrtLu32cmEBspxnE6p9c/Yyl4F4ccjuTudGO4kJQeX7d6
	5o++lzEOdmXV9MtqcYNEHIPMaKb+E+Ovt8IGD81z/af4koXAB2KYT2pC5NLEYuHROAmkAD0dxeZ
	xYvBMHJUyS63TLSXCDra7+HInGfcVBA==
X-Gm-Gg: AYBFou3OIyi7dZrvRasOWsXeb/yPhFLMo3jz4DbrcfDWjntfnTUB0VjZwnp7ep0NU3x
	Qgqk0n9CzxqoaAMSZEIqoTy9Crm/efaKuIo0wy2rQ+dDem2lIZJLXdud/3an5+SDGrwFVFgZ8Nt
	sF8k7Ha05wih9lxE0RN4nf+uwfs5pzHpQo8SqXWNtTyLdft2vWKfcmWTzVkV/8+G6bJkVa1fWI1
	5RjdyUOZh2qDp8X4am9P2Wcsquk1Fc99pRjPvWh8HmTkr1D7oYHUm1uWzXd+tUDOz80kUFqFlWn
	jYjtjZ6tFscmUvbF+kSdqCO5uccUD2YbLq7BgsUtjsxOwqswQQ1nVJ3rsDbiucMAknsgFPRuyvo
	Zpl3tth+C8OsLubfcNk81Vz1CCI1j0FJAbwdG6K5HcQYznyLqER9r/OUuzb+sJ4x9mUhVfQ9wG4
	C0GxNinkR/YtCsfvE=
X-Received: by 2002:a05:690e:80c:20b0:671:3c9c:e5ad with SMTP id
 956f58d0204a3-67ba4f070c8mr5998587d50.49.1793698819403; Tue, 03 Nov 2026
 01:40:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 03:40:07 -0600
X-Gm-Features: AclHuK-4a97yVJVbkGNNnQIL8viqTEZhruO_MoVfFcSl06giv7eYpRWt0lOZS3E
Message-ID: <CANxy8yTAJ=9AwD=s_oVpvnoQWiip2NDecscAJmccRRZ8bCfzww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For transparency, per Documentation/process/generated-content.rst:this
patch and its changelog were prepared with help from an AI coding
assistant (Claude), which drafted them from my instructions and helped
run the tests. I reviewed every line, checked the values against the
Allwinner BSP and the A133 datasheet, tested it on my board, and take
full responsibility for it. Happy to answer any questions.

Rajan
