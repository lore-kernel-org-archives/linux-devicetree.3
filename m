Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266494;
	b=B4XFo+HU9mdroDvnQ//+NvQFHlyl+w4jZ9dlsFIi8PDCLLogqw2XOtsaNyvyShYC9VMm
	 rGNfT+Sp0gGj1dxaCdfplxzBvV1sxHdbsLCLpfUSF+ipUXV29BMSOAiv1a6TrCw97agYI
	 5Fb1MoA3nU+/QOBgHe5jaylcLgX/jbT0CF1iJvlbD71BbECERYnZJP3ZeWnFd6BJDOfjo
	 zQ16wg/SUtdVCTDqwdLFYSyhx9T8bTubknqf1RHH4cmoOcHRQYk/yuk4Q3yAHdGlU2rhH
	 D1Uij+UgcunI4sIqcWaU/Q0RhOVt1BAlevlTW9kodIyE45ejLGzlmD1kETEow4tzWFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
	b=JPxFF5HDf3U/kVG+ZaMZcTc4YAykJzeRCjDK13QhtIYbHXiZR+7OhtB9dUzrbIDT9IRc
	 p+NVaQ864oIKSksdr1WAZjlO8c2mrJSAKjqLP4z1NK/JrUKsVmfe8+Y9zhoaxLumLR2Aw
	 u6w6chQOosCxfs65jzg/eWnqqvuX38uSZsEIckkP5CILjzXdjTlPhewVmjimwV35Lq5Ql
	 c0Sdn1OHGsTMTLOXWWGJ85b7vcS7lKShqURPFjHmQrcDoQYy9ye2T1XMvLnDJaDDkmYUo
	 UFTAt7fBnZY34K27rKyJ9Oetz/X816xi3vWvs3NURCX6/iTim2JX9je+w8saYqDsr5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D631606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D631606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so978399f8f.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 05:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795266493; x=1795871293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=Mi9up7NjvpRyWzOY8s0o7PJ9oq3lkrxuxfoNnumarCgA4nUizFfFXZxPUIRrdNcD82
         4hQjmpK/hA7CXZ09fxX0NHtcnkVMJFgfv8kJGtzoT27SOgmpe3G747ISiSEPZj7c3cqB
         LZXcEcDDWHH8fiKcsQZ5EkOssnF0b1tUhg6Je3k9Kn0WWU7y2nZ3hh7gzcBUbUnAUbIV
         gfuoHPYCRARbWl8xEqLsbFoMIxw9cciZ1oxXtglEIFYGXfohgSML6AhXpr+vh2Gj2vme
         rHKgcwFj9QFrtjmpFI0tqdcFnkeg+uMpd2wjBlPhS3VjLW4e6Y8VUAccKZr0Bc3Au7tj
         7DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266493; x=1795871293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=nynfL7nL82qB7pCemLtjKeIcaukaoja9YDetgmjBDei52gvsOZkvGMfXcgE5ERDSu3
         Yk5xtLcr5IKorNZn/jA22DBzsCziBX0b1snsdirf1eLXo4uhEfC4d/lIoxSalHFNxuCw
         ne3UuSG93C7aVhRwWdW5RempUCSvszl2yO7ShJl7C6GcPbVcMBEQH+RL8mccKIVd/c9+
         GhmVh7Xw6yu8IwGDwYNASQUSlwpxY/65UOhWRJwz3u+3QFDfvyS+uwfiqKg0sJ7UhSRO
         Q2jzbhALBs9N9x9sO5uAWd8QI/w2zjrZ/qsT5XsxDhUQ8Eee/rCks32rsLgbIQyG+0CQ
         pw1Q==
X-Forwarded-Encrypted: i=1; AL+hErEQqIZWQyp+iWc5Q0qc5vV3kBtZy/6cgBFP1F++TmOrxhwzmD9eld6XWTyz7nrKjU4XsHLk1tigVrdf@vger.kernel.org
X-Gm-Message-State: APuU4Z9NUggCt3h+uaAVujEF2dv+y0geyGAF5RurTq/+sinJhufaowuO
	deZi0EYbuxlrDxIsNcHTGAndzpEIdCpwjzyuJk+P3+Av3zCaB+B7wHHF
X-Gm-Gg: AZFdTZdwRu+MikQFTr61xOdxf4vJkMSAJTr5t37S5k4tD3wpGSTB6gY3kZpC6igLGaF
	N3WHaa097zmp2JWfuBG2xodksTfvYAmIA741VjH9zqvIIgQ/5/xSC+Mk86RW3JCrQYltCEZy8EG
	ldbMWHJck3YgOYAP/sAzPNTTCJ92kuK6JoboRMHK1GB66hrRSI97+0vccOleKcgZe9o4dSKYupV
	Y1rgWWo5WvvMQflu8EP/NjjldG2dDVI8jMahWwWeYq4o10FMr8cxc04Qwz8ejhIH27Sf33A0lXw
	dOAgWIUZBR82XiZR3JhpG6AMm1dJf3AjpxKgFQ4IcULu2IN0FBl1SLNh/O5gTyxMtdMk/Jr79Ib
	RE9me/i+ZQhAumxLNnGNO49K1UznN1YswpfU8LcqMhGY0EPCV8WGwAVnP+VF4XcdIdaGwdVG+Tr
	BCt+K0FhEEfE40YnyjJ/ze9cYRkNWTdRt0lmiJ5qG10Lqitn/2Dstn/bQrhRnlzgLvQxi/sgYao
	TIV1JlnlW6VP2ZyPj81wZwh/SkWN/UZJ7XjLFFdZ3Yx9XZaTqH/Tlywc7r0kLDVMygP/rNi0mzH
	ehyA8nIglylXRISbcVf8gOO1TYXLB6CuyQhBNzRk6VCmjgs=
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr148513185e9.19.1795266492771;
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm48512235e9.0.2026.11.21.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Message-ID: <84ee070c-f134-4a78-a92e-0d03d0f0fca5@gmail.com>
Date: Sat, 21 Nov 2026 14:08:11 +0100
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
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

>> +builtin_platform_driver(gpio_enabled_clk_driver);
> 
> module_platform_driver

Any explanation on that? All other drivers in this file use 
builtin_platform_driver. If you'd like to change that, perhaps it should 
be changed for other clocks as well?

Slava
