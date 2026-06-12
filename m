Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C637A486
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288183; cv=none; b=n8HY8TVbcq+JeHb7NJvQdPngmY4ZwSAgxlRqczV1ejOFAlYXlm12s9j7CeSBDW70xaKiDyyymxVa7JLScRjfX1MROiCF3jSCuvgfvIFT9tLl4bhEps7fNEm8kCJpUDoSqnGEfKILz/ZNYwhFgYyJrwcNHp47pECa5BlS7+YtiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288183; c=relaxed/simple;
	bh=kJHBC7zOJdFr54Q1tOf/VVgkT3wW/KkqDJx6n438ZAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q81nl/tEUWbi/9r9pwWT88ALYp+JZf7Jf9iLMHeIk1/YOX2Z4INInLqqpqO+vuUh1bIYNvkz/ReBeGKjohZPlz6VdSpaSK97/p/hv1ICPZ9XlkhwSfh7bUgfBy2JwK+pNlZejI0B3AKQrxoh6uLvR0zdKk9GdeY8JFSXyhut7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsJklsM9; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsJklsM9"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39666ac91a2so20750301fa.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288180; x=1781892980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C79CBR33drE1u/8t77KlECapusXxwvj3erPrWmd11zE=;
        b=BsJklsM97uWb5/Yd/LKpJ53g5+L83kZNY2cQoltQA3/UI3ntneSswSqg20EEGvg26o
         sl1YBOxujamZ/frUn95glStwnHfJsGSATnWOb8PkGT5T1t3Ezo4PyC8A8HPChzQBafHB
         Nz0h7LSjO0PJ39HnxynYCqovKQA7PN8gFjY0Ul5/kJBVQQJZmJrCIXXqHk69Zin5b4hG
         zOsu0rYChmIYMLJMKx9d1P7z1uFO608krapDzpW+OihYZeAmq1XtwRWWTBUl6up+uIVg
         jkVXd58MtVxUtAKwok9fzwlE2ouQtrmOs3taJizVP0ZmzquGI1cfp1NfF8xcJ1gSjI1C
         iwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288180; x=1781892980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C79CBR33drE1u/8t77KlECapusXxwvj3erPrWmd11zE=;
        b=iAuaoJdAXWaGdjc3maBCLWov7VZC8f65P/zQs47iKDbtTwKDg4+QLDxzUoL8t04lEM
         F1oxOJnkoNqucU/8hDp+WNyawobZmBLxvLiY+dZ3xtM4xeUUaQgIEngCLiQPqIBn0FoX
         3XCwHZGg4uEvLV4BKRvVW/zgq3eMr/3bzepLiYlU7dhlLVzygrsji+3xHp9GRvGzlkF1
         s21IGJ1R8muo7mTOUb6BE4bcd3wqzBD/x7UV5KBOV0xxKGKXEpjQ40b/Vg/fXCztztqx
         9SoRx4SLAblYtrEQBr9fRuAPz4KfQwHEXUGwhmCatETbGoEpBvRhVLH9yMipFqT+m6v5
         rHnA==
X-Forwarded-Encrypted: i=1; AFNElJ8ALDnwFl/fupTDDvbvzIXKG3V2ALF6xST/0XxhiBD3NIW34YAIK2l2qGIR8XHA6+bjXvPjxAyHRP8K@vger.kernel.org
X-Gm-Message-State: AOJu0YxMU2aAubkOcZMta23D/Jtc1T3UnITRKb3KvBlbYC+0CL8ZDo8R
	CH0THyuxhyggLFi20p94+6dmExYDFG8BZU/wVfRyF9o+xaUwVjim5EFk
X-Gm-Gg: Acq92OEbS51BvUYnSQZYTVgmdmmIJ43iZXVHkp7rCI64Cvh41t9QYfHMFFCmh8yF+SS
	Lj+xgh3YyLNil3EjvwOL4+AJKjq3vBcvi6PdH0Swnhi+KB1xpolDF+338VyNsA/Y/ucWe03YEWT
	LVR+05HOGb0K8Eh4ZbMW6zQy2aM9FQjCnryD9mPrGyrhlkDvInHT06PPGDcuV3yi9VmE69LUUYP
	kX2lG0NoEm1iOjAqboQbjzWj4+M3pDtB2b2lUnr4AL5JeuUtWc+1V11GU28KvwF5isazqOeoT9f
	gM56LUOskp1vL+dPJNKofhZ7fk0TPDFUWuaoyzZYxeZ8K8NlwPeQU2M5hL8peZTGaz1LqFT7DOB
	5KB7rsGjeUps5ZpsEKC1PQOY6OD//uixVkS99C1zhUSt56zGMKeAfXZOZrIcdctEg86VRDq7JIQ
	yPdF5aUEdo6d47mQgk7sDRkWEOLP/NDd78FwmxP1iENBcz+JIt+3sruLsYPvkruZzoMJ0P5rDe3
	uUjNfmsbkYGJQ==
X-Received: by 2002:a05:651c:3253:b0:396:a647:76f5 with SMTP id 38308e7fff4ca-39929b48892mr11943051fa.5.1781288179270;
        Fri, 12 Jun 2026 11:16:19 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29687sm7844271fa.4.2026.06.12.11.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:16:18 -0700 (PDT)
Message-ID: <44f779a2-74dd-4488-8338-4cb9e2dcdc59@gmail.com>
Date: Fri, 12 Jun 2026 21:16:15 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 2/9] net: ethernet: ravb: Move programming of gPTP
 timer interval
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Commit f384ab481cab ("net: ravb: Split GTI computation and set
> operations") broke apart the operations of computing the timer interval
> and programming of it. However it kept the programming of the interval
> in the RAVB main logic.
> 
> Having split the two apart this can be improved further by moving the
> programming to the gPTP initialization function, as the first action of
> the gPTP init function is to wait for the timer interval programming to
> be acknowledge by the hardware.
> 
> As an added bonus the interaction with the gPTP registers for the
> programming can then also be done while holding the gPTP registers lock.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

