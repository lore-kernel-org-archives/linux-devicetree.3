Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7909156C6A
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552649; cv=none; b=OfO//V3iQWHos0gII9zDAIvHCGWUMGNqTPe0/rqC74tAyJNRaFeJXTW8Ufo7yPEDRjl0jygFczayGgeT7cXTY76hfSSVLjeYm8/rBq+lVma/5ztN49OGvX3SNVsS6csNNvNUvKpD2FJHn/2zvzncBy27fY1upOl9rsOhi+c+aXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552649; c=relaxed/simple;
	bh=E8yVqC/zi2IdNu5B9ZngEkUph7ZkUNPop4VYVkOR4u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaKgLYuLXd2WxLGVwR+qwLi5Bnk718z0aSPzj+0sonXCZUiVXz54kovBFTIwsj06/+Jx9I9AVG0+WIK1PVCyVFaN51mf5tzqIES0LgLAqsC4dEfktCxlnHBNAoel49CNYF7AEjd6shAWffT1vlp/hH19hN0Qa0dEoGXCeeRMsds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btZA4Izm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btZA4Izm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso20906955e9.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791552646; x=1792157446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRmBW0+uiCkDF6IJ8Hrz163xMrqCOuoENGdFxOZif3w=;
        b=btZA4Izm2DN0huJtTrNeWuVqrjaER23nBz3Tba/1gWT9EWB1NRxeU2Me+qlySrJb96
         Pce+R2AF+sTxb3c6eMhYkX/KCL7FHMJBsKAu7gD1Hvacb+mS8vJnB4Em0PKyN68DPXMu
         pzPTJNRgKEii43IWEOIcLIBfOQ0HDUq4mDUPOELclfMmbObwY6qIWW9xsUt3cwd5RMBu
         ZK0xAUsEdTwFAjj+2FnSHuCL9CA+s7bKCOhU3aBPQ+VYdF97vWDba0vMnEGzvPz3fOxZ
         oFMMZIK0g6otywbm67L9AlI3f+PIy60vjwRakoFnRyZg8T+PNMuE0dbl/Ok5a+9Rrzc9
         QxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552646; x=1792157446;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRmBW0+uiCkDF6IJ8Hrz163xMrqCOuoENGdFxOZif3w=;
        b=YdUffzWXnsaETdRLCWbQhiYiPOudhTDt1s9h26jaAZ0q2m2H30oP+XJlJmhSxK60jv
         5adrI2fXwz5lZbAF4Lu0HTbn7MJLZdht7gv2WOWuRcj2IQ5s/uPo3KXgy0AuJZAHlCfA
         OqfeMtjuyH7x8+VCUkKeqX7dbiBrb1+g5jqrgm4CZ7cNMZBFHc5j8waqUJTJwbAtzyz2
         4pIAvXK9ACRmCH9pm2TwvtUhskw41vKcKoI4bAhQbqi+QBb7BUz03E2iJ5o2OXEhpaBU
         bm6kf1xXHK5TjOhVFU0IU6mbEddMAHZg6jWYqj4NUlWRJRVAqzb82aX8Z2kg1LFXXzuT
         C8iw==
X-Forwarded-Encrypted: i=1; AKwUvBxsoS8FO6BytqX51ldz47zqNM0jkMqwRjdAWplgGW1YCRPYKTqmfvw2bMO7qWoX57GIBB1g4dto8brR@vger.kernel.org
X-Gm-Message-State: AFuF++l1I+ARNtYv9Qx505YBnJYfTgli2m7lKlilJp4z1ELVCHQAvogP
	II6F9ecpu3Dxcws1lbBfHWKbiWBCgETxjifngDge3+toPrlfWU10OGai
X-Gm-Gg: AYBFou1GBzA/zTIX8BP5JkF3eKKyooDkRXpFXfW6u9DxbW70S9WjfVmOm4uH2EJXApr
	ndhk1bleEy27kfcWLprS7HECOWJGhjptEWoO4f/hUwWzRxV/x9HKj8/qs/n7RL9Q+iowF1af85H
	JBlFnt6ssvZ2NBl0ahdEXI6kqx9yuB52GS9YHCdrKq/dNyZGl5q2j81ZjA6rgdEyvJvvTeX7ZaH
	6n4p0yrcPJoUW0jB3yJjCOPGbjBlSdWr4CedoR4wiAUjCDROTZFLAYamjSbWrzUCgXw61eQWh4h
	Ldd1B83QH4XzrYNFdgt/YMBDRLiWVUW0jkLywEnSpMQGn7L6x5PRCAEenD59X1hYqZmrx6JnBHd
	F7+1vCsHP2KUbk+IbY7VDWP+e5ha3ppPCM20VQZWWqh9Q1V2+g8e2vOSK5k186Xsz/FIFKgc+EC
	US3/+y1zp0gdicUStHyyBnEOhU2AQ+otnU5MojIPjnyjBcqgE/aHJHTFW/R0vTeJ+yHSDvaBb6g
	ad1OKDM8LFT7CzvoTXjH/iX9/+pUsSCu3Qi4Q==
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id 5b1f17b1804b1-4a18eb4483bmr35172655e9.2.1791552645946;
        Fri, 09 Oct 2026 06:30:45 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adeacdsm3973525f8f.55.2026.10.09.06.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 06:30:45 -0700 (PDT)
Message-ID: <1796fd45-50aa-40a3-bccb-d779559ca02d@gmail.com>
Date: Fri, 9 Oct 2026 15:30:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
Content-Language: hu
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
 <ca27b076-1814-4780-80f1-d022183736cf@kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <ca27b076-1814-4780-80f1-d022183736cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 10. 09. 12:15 keltezéssel, Krzysztof Kozlowski írta:
> On 07/10/2026 18:59, Gabor Juhos wrote:
>> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
>> Change the prefix of the board dts to reflect that.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                                       | 2 +-
>>  ...5018-tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 0
> 
> No, this just breaks whatever scripts people have for no real gain.
> Assuming 0518 exists, then still 5018 is as good prefix.

Ok, will drop this one.

Regards,
Gabor
