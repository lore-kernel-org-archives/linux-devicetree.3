Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A03A7D81
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615628; cv=none; b=sEf5MWNVlBJVnGJ6c8vMpKX+1bHkZulZq7MV/kR3RVov0wSDV7DTfSYuarAKGn9JuuW5tqaitFCHfXPqNiI+FN5rqntrYM35lRQQfIkGIq+H+2uPzVrYBpoMIJ8C1YgEcWlWw4XFsaygKQ7Vg6PZo6hSQu7pftDa1UlgHd+lh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615628; c=relaxed/simple;
	bh=R3FAfBMCy0I3rYNbY7ljz1l5sVG2klBi7lbMe897t6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIzjWPPILunkptK7x8eQOyaZXlK9oZ5h405UsuAceNysdvG+bo55B8MgaJ6qNhJIZKGFKSTKUYOFraQacaM93Lm5eo7XqbjvgWjVhQb8RAHAbMXvANUkIdzwYVtNjK1Cl5ZVLunvFFbKsP3+p3Ja/FYGB29BtcVHP2uSslbjV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnerzhUF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnerzhUF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2420175e9.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789615623; x=1790220423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=DnerzhUFn78f74xuOB0DoViVteBgbh8n06A5FDz+rb/nC8CXzZ0J5WdZszzwGBb9FR
         Z4igT3YBo7FEU8V1Zo9FeDh30EhX+21DF+iB+k44ZLctNmOjVh0LEhEq3RlUlBFmpzDE
         ba8mAshJPvf64c1ZkemVmexX2rx8O84PiqjiIHnRwjiBB3ahpnl47XbkNvCNeNCQUUIW
         JTEqcIwhTB2NDGtHoRHtGpXkb6MTJ7otrpLAATahoYZwf1383vgtCBhuRgCFEyrj60JK
         3InaMerdX8fwhTsXXJTqU7S6GIl7elGUOwc0fctNFd1jrLppBBMzpWwAhlE2leABEpK9
         eRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615623; x=1790220423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfZ+gBA8a1DG0OUmX7Tsw/OgchSGtEjjMWjZU8Wx4UA=;
        b=iM7ECpizM+xgewcTHWqFX0MNoDpUrGTPq/6SlacMLgxg6yNrfSrvgdJl3ECwoLCHqf
         lOffkCkxwJZ9fagpZ8yx/I+zzJ2RDkxtREhzFhfzrbr2huNyfD/QDoWby+GMG1ynqsje
         T3/8V+Lf8Hixk7a6gvZm9VNCst0XYi5TMTHmHuFrC74UwosEMe0+L9R4LqN3w0l8AEXp
         EI7uKGNQr0wvco0Xt4wqnGj6/j6MGwuUKhwU6Qbo6KonZbWU6n7NV8PsByCTunmzdqwt
         QfYJnmxCfysOgRNG1oYbONNYQGOcjl0TcmpuV5c93BQJsEML/NczJwXHJ+Wk/p6KHy5Y
         q+OQ==
X-Forwarded-Encrypted: i=1; AKwUvBysUM2lxeUg0rYeM9A/MSNeVf6DwgzuSVpRnbP5KGfIABODFUQT7zc2ULtYATsKh1LKkFIULtiV40wq@vger.kernel.org
X-Gm-Message-State: AFuF++mmBfkq6B1jfTjyG1HLejbxTRvabrozzRWOxAUqGrz61kPV/H0p
	VAu1CGq4/Rz9ngXxXGWUbJuffx06sqSVRwJkgNcOwbnsFyAi00fIQiXI
X-Gm-Gg: AYBFou2m96ox1YphzchTKEpCHYORlqhxpM4Srq8hCEWiDuMGsoKi8QhQpIYUfcIiXHk
	jcrxXJL6LkubLjErWjLVcONBDdL0AZxhQ9BZYE/oNmxdv215kWmVx3+1zyFvnR6q9bpAEsc1VV4
	BYysok6VBCgz58HqofuoPf235dmSBRIu2A3QxCBO8F2jrigemY5GhpP4EYvXv6KoZXQpLywWuTd
	D52E3jhKux1wC+hQ8kFNoE9hO1dNGLj1xXvd+QKMmTEXpbwxe4QBaLTzt7+gfr+oGv9H8ouc6lj
	ruwupFmj4FPeNdgbiASGaalLU8EjzvpBHJQmAztasGcRLY6wpUU4jTYEQuyuOzHGMe/N5zOhU7W
	Dr8RO7HhjVKRcyQ4CYpPOtM8HN0USuA9zhx7RLRhG4OVRU/6GUcN7EHuHhvDx89EspyU6kArYpC
	rUqN9GmrtN2Sy9+Okn7l4RPpRb6ZOqpoV+baKqHJfmusxl5iCQ+HjeheAlCK2pLpHNvgLy23wL3
	Lt6b6OH4TPsX9ftRBalsQr3w3iX1O0bkZAadPpIZs1XgKt26niuVOukrEgOHDYJdlyjRLcmo0Xe
	JC5swWditUcxYw/XZmBSAQdy1pNRoI0goD4vSGpK2NjRd9Ekoew8BGIYQmzLGQudENNV+9bCoXq
	ibJU=
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49ebb4297c4mr61135065e9.24.1789615622470;
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e6ca:5780:b097:7d16:9a11:ca28? (2a02-8388-e6ca-5780-b097-7d16-9a11-ca28.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:b097:7d16:9a11:ca28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm11432549f8f.35.2026.09.16.20.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <e2c853c4-34bd-4f2f-8c8c-a05cc4442a98@gmail.com>
Date: Thu, 17 Sep 2026 05:27:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Inochi Amaoto <inochiama@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yao Zi <me@ziyao.cc>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
 <aqtKAuoVSCxcts52@inochi.infowork>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <aqtKAuoVSCxcts52@inochi.infowork>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Inochi, Samuel, Yao,

On 17.09.26 04:02, Inochi Amaoto wrote:
> On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
>> Hi Andrei,
>>
>> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
>>> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
>>> Reserve this region to prevent Linux from using it.
>>
>> If the FSBL wants to reserve some RAM, it should modify the devicetree at
>> runtime to add that reservation. Adding the reservation here creates an
>> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
>>
>> Regards,
>> Samuel
>>
> 
> This is fair, and the fact is that the current fsbl can disable
> coprocessor in its configuration. So I will not take this patch
> and maybe do a cleanup for existed devicetree if I have enough
> time for it.

I guess you are right. Just thought that it might have been mistakenly
overlooked for Duo-S because both Duo 64M and Duo 256M have the same
node in their DTSes.
If it is okay with you, I will try remove this node from the DTSes for the
64M/256M variants.

Thank you for the review and sorry for the noise.

 
> Regards,
> Inohci
> 
-- 
Best regards,
Andrei Lalaev
