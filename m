Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE93ACA57
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368060; cv=none; b=Nxr2pj92RVQIlMnq1N+I7o071SboXBKUneakD44b+i2IbYuR+up/iKL71SoUHPrToS16B8zqSVlznAJMAMRuV4gg4mbH4Bqwi6rbTYGWccBQjEbzza7cQAfmDp38RRW9ntC7T+NX6VLthNtFHRN1Psx+l/bslBNcr2s8/AXaZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368060; c=relaxed/simple;
	bh=i4HZR/ysSs5sue/FuYbEGclJGLUj/Ps6aBiPnSPKd9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INhR0bR6xZjQGfghOb9S8K5TFjcfcJsGlbGSblZjbL/TKJZDy1kGX69rUcZaA7AY9VK8BkBXmEsQ1AihZ4fWce+G+r2kixB495mRkOEGxNVtJA7AEyhhV9TggltVMvjiZjyYwUgCcQksG/+qbPOwBRBKqTu4RA7xrBEUChexvEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqvFKw/g; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqvFKw/g"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1173903066b.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368057; x=1779972857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX8JQtFi+BvlsvlLv6LSQKoDQ+bIQLnoccLpvxGybgo=;
        b=gqvFKw/gErbUNBw3izhCpZ7TFFLUFkBMoHrmj+daer8lZ2kyi37PHF2t3fDEjmXPnp
         VqIBRsVe8E5MiDCLDe1cL8SHsKIHuo4G8JfuS7Tg2bz3EX1X1xeAEwS/WdrAANMp1pcY
         l+eTaJb7Su+nr8pICxK2sPd1IV1+/nu4pTWytN96rqaxjvA8pfVpGW2hXV7CxEttv40P
         Vbf0j6faIB+xF9YtExwTjG6IbAQXTwkOdRAuPd8GyUGOcfK5KQo8nL/77v4SwCgEO/Iq
         Gp1N+oFFULq+As8Co5yY50UIJYOIe9m2s2o6F+gO2h9HqZpZwEcWa34iuviDpvAw3F0w
         pSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368057; x=1779972857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX8JQtFi+BvlsvlLv6LSQKoDQ+bIQLnoccLpvxGybgo=;
        b=QIexeCYz9lZ8W/pAJksisiDmZUAULjq0lKcWHlgewoWPXbhl6BAUcBjnmEgxUKSGdE
         3/p0aS+T6km/sI6iJz+m5IeK5bCITv4eTWkCqz57JfKxV3IfwxPA+GNa2fGoYNHptCOc
         bF6L4Ob/tXtAA5ox3kScIR8c/Mg1n5GsASHrQ4Mx6gMLTQW1UhqHoL+uLIuuxvcmjbT7
         bme6LsIQ9RKIY0kZuSyVoyxesvD7jhms5qf8jWpo5Gv+IqjnQ3RD1KghqXkdYqdGZdbH
         i9YqfsXL2SgFopC99UkRZ2UPt+Q0hY4eQx0p7QVLRfmWAsSOPGGX8pQ06WPi/ClYwlSO
         5THw==
X-Gm-Message-State: AOJu0YwR8ZztIaSKy43jwLi17DJYh6a7lg/CO1EYws3DQN7m6IJIJ+lu
	joLxnWZmOMErBOgWkZrBzQdFgqSB7e6CGg1EbhaPyxAEzDlitPK9ozSUua1h9A==
X-Gm-Gg: Acq92OGONEPNzq5kEm4/CRjp4CK4dAaMQpjmhyH8TNx44izoR/7dbNx6Tc9AWomPA4z
	P5cSQo1w6P1au1odGAOdp5pedbS8GNmXfs6cgSFmzPzetygyrHuHtJLAQAEbnSDrfd0jNhkvmIT
	VdWpqbBgwUY0bJTVR3cNVMs/CYKO6PINQnmtCq6nRYKpR68ltkw3XDw4MVYfTpj9D7hwpUyBgTG
	Uu59mjTwOTfMNa7qRxMIF6yjBrS7gfoNE6lnxIbuh5wcY+mc0ipLEc+o6L9YZApaR6NjYKOL4AB
	UzXopWWXdNWfbSdYHst4C3cGO9Y8S+bUJIpt1CmhHjidpJH/w7VZQ5E0MFvWrzH0GtkAbjpFxui
	eYhvclQkQSgzEaP63xW5JffAu0Ku0f4QtxVswVypWWnb9xhbejvr3i+R2bAWg5e+BaWAsPQQjav
	td/vTgBZ5ZjRmzWsLVXivdtH6LoAgrEziAfNUBeA3aQBZ2BEeCaUPKEdLrsZfOZPK+vHpVUWsyZ
	LvxnfpRFpjw9kprXRCsQPveCcQpruCg47/+rGcBRWzosl17n3GS6mKvmw==
X-Received: by 2002:a17:906:7315:b0:bda:d9e1:4e1d with SMTP id a640c23a62f3a-bdc14f5e9c2mr146768466b.34.1779368057254;
        Thu, 21 May 2026 05:54:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e964947sm101453a12.21.2026.05.21.05.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:54:16 -0700 (PDT)
Message-ID: <7e5cc82f-4e28-41b1-ad83-3433b50a07bd@gmail.com>
Date: Thu, 21 May 2026 14:54:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: sram: Document qcom,shikra-imem compatible
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 2:38 PM, Komal Bajaj wrote:
> Add compatible for Shikra SoC IMEM.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
