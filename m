Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229EA3F6C48
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795262; cv=none; b=TPOjY+3eaUZs+UiOEmjK1BloH1Ot9bS7NgCHXCMdlMConfJYaa6FMQNMx9MboMVmgsAT1l9oGEh+JyiOCWx/ftm8CD4GNd7Kt6VXrt9VwxCFQafRMus7P887Gpyw963jmIBCmGwJigSqx9sNKIS3WWn8UwSB6B4+jb7LqTbRV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795262; c=relaxed/simple;
	bh=iUYf4ZXxUmQBkwuxQs5Vz0Lx7FC9aydiVa0qMnIiRKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niDL7kOx0s0lrZ+aYCjHB13Mx08oYC19qb06NEwVg/WtAmw5m5ajHNb/9ZQ4MJBNfujY6CIDbNrDWd9UJwNpcQbb3HEDSMV7BCBRmP4phMZnh0dvIw9Gf0MEET6ZVH4as0TkumbdrnepjzOJIxP/dG6aNMqUtoZxem7JpkMODX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=h5VWTN5z; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="h5VWTN5z"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so232978f8f.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784795254; x=1785400054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzWVKNZJjWhBbzN1rR+/yBpzdQgpD36yDfa9L4ksi18=;
        b=h5VWTN5zSF4+Smi2E0F5dtAAk2rsrDW9hVDHBL2OGFw1i5PK3dHHxwpVxl23xR1Xg9
         XAP9DnCq8FSo7Gm1goH0IP6qxF//4josihcJia8+HxrCpWiL16L01P8zBrADEP6gwVi9
         qSiLJ+mvGJ1J8g7MEGZ9qgAVkEmy+N1kjHMZXKUztAIDeNehz0PeTVV4GQzopQ80rJEV
         FthSnrf2JizD7HcpWgBM3P8gzhGXa3hQ6NyrHirfY5brhFW/eLTu4phu4yd0fY6T3frQ
         S3+Zjlv+Afu4WN2sP8CiBEQAhyi4p6PfNzYM6wISnCuqXPD2LbFKg7Xe2N5D6kemUftD
         0jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795254; x=1785400054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzWVKNZJjWhBbzN1rR+/yBpzdQgpD36yDfa9L4ksi18=;
        b=Sr1BAbOoE9qXGxZ0j2lnD4Gyo90LBN45tMjEo7lo7GN9mKDgsNVP/0V2u6SdQ4q6gC
         YMIFNk51taMtCsQT+M0nX67QKUPwAOogIERgJ9Kpu5ljYOqJtNmg/hXAF4M2JQk5qz7Z
         L4XMGJk5hlD6nA8wd3dQpVpF6qvxnwZghR+nRGn5tGmhxTbnj2DYiJKTh+5onL0roePO
         tcufEltyc87/6qYTrW178fC9ktyi8bDa07OIsOfnzP8/j3O7NJ3m8O8QimCiN4Akxlkx
         dqnafTqGHbqNBgXmoxhgQRxHM2zY3Blw56ioHx4OAWRa9Ndn6Grnko2AZP6IFIY0nCzi
         4S+w==
X-Forwarded-Encrypted: i=1; AHgh+RoVSQoZ7mbIFzb6xg/m70+SOz1DBHsZXR4HcGm33FAITTHXTjKMdloFumF0dL/YgljRQUePWfGfZl8X@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgUSfuESXe30fbDyzdZTyC1lqaMkTtaU66EzXSLNdEnviCTLt
	I6y+Hn+Y2vEsxiIdp4x6FJcLxSwv0ErTyEV4h5+vE9q8qiThMd/TuYUeHwthiU112hc=
X-Gm-Gg: AR+sD12HkRPQaMDwOj2tNQr+IKq3QomMK+kOnmGxLsV2F6QvWAFa+SaKSZR7TX9xsjW
	7qZDkpVL3qZpEAPXjuKDrFvKi38D7bJZSAcIWLqRqOEYIAXv7xY5Uez8Sef6n68MkBSZliPYcRW
	tWutME1Qo6gzpzXtSETQUKWCNgvG0nqNwGqmKJzQKGBnY1Wv09zOX8W7WrFn6BE/uBdCaa2vMxV
	lY4udJh+v8WvoM8KVdUA8UZ6a3B6eqkYaKdQP9eWuUjMEfpsZgfugDUMquk11rI4bb2D6vTaXw6
	ReUtgi/cjH7eBcbvji0tsjzABm9v3i0GPHEpWMZbC1t6remimyh2yR+s7dx8B1zrsoWHppn0SJt
	FLFsA6OLymww9AhDUVwgIAUhYh6KxjH6uNuDKFYvIx5HX0Aem71T6HXne1WPKPqes7xVgrtCfVu
	qICUEdUQs69zNQBt5t0c+N52nQIcii/vz263vDYqPpnTY=
X-Received: by 2002:a05:6000:29d3:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-47f8f8fdf24mr1439467f8f.12.1784795254579;
        Thu, 23 Jul 2026 01:27:34 -0700 (PDT)
Received: from [192.168.32.21] (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c66cebsm12675920f8f.30.2026.07.23.01.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:27:33 -0700 (PDT)
Message-ID: <12c3243f-35c5-4158-acb2-f1ff4499c20c@arturia.com>
Date: Thu, 23 Jul 2026 10:27:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add fan53555 allowed modes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
 <20260720100336.62004-2-victor.krawiec@arturia.com>
 <20260721-modest-miraculous-cormorant-f5fa7f@quoll>
Content-Language: en-US
From: Victor Krawiec <victor.krawiec@arturia.com>
In-Reply-To: <20260721-modest-miraculous-cormorant-f5fa7f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 10:29, Krzysztof Kozlowski wrote: 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Sorry about this mistake. I included the checkpatch call to my patch
generation script so it will not happen anymore
