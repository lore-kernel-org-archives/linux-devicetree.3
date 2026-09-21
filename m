Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE9246783
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950136; cv=none; b=MRdxb3dCUCuDMGqyFk2miPKZdGPTZUPxXFKXT/WAXcb0Px7+ewNL/QbIUjym6p4LiMuU324QOGL18SVqi9MR6PQw/wFPgiW3bOTGAMXvc37mJTInZLvQLQZ1jbadYVJqrJqqn8J8xF25OJVxTluhegdULf2mcBMx96Dka6P6L88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950136; c=relaxed/simple;
	bh=XwsRzJLQL722rDOxKBtIkGBU0anBu6ItURQT6kz124Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFPB4shLkA8RNb51lXJbLDErJO6ujrDR1sSMGlMgMvdvp3tAEaRsmcnaqlPVoZwAkWnpm1K5YNITEetoJ9K6KGlWA8pCFcaawXzUTTK1rAFM5DPgLvo9X7Rvp1Ra8MJLaAe0wSeNbGKIbkCYnC9cEMfigHqSMpkQH3uPvDFLLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRx7OgU8; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRx7OgU8"
Received: by mail-oo2-f6.google.com with SMTP id 006d021491bc7-6aafac56856so1182978eaf.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950134; x=1790554934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=gRx7OgU8bDTs8tAAAJaQuWCc8DHTk1qHRi4qoJhKM9zAUf7iI5BCIPH6u6cwph9sfl
         zVnIdfFp6zqFTiCVRFUz4Gp+3jX+i65MxWyxLrMfOogNTrWCBhJQVZvloXOoVchLRrnv
         sb5N0lONhD+Lf5xDUDhTQl9Ybq8C1dEGtxCOYsUxi6lLAs7WYqsCBNIDyjEFogpJL5j5
         kPJOiFoksMl28E7DqlFwz6rSrxsNcO+TCXDQNpyZ2T1cE1gCd7xFd1/4T9GcJNt1/Muh
         FQqiMHwIV/3CrDN9HuP7DqsQl7FtXmiUL89kQ2XadcjIrYM45JwyWgPmaNrzd2GYOBuy
         5VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950134; x=1790554934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=nfWEAeADUUkmA+qZdiOUA98z3xX2iFZY0T4JAKjGxUBwmmoLbPlL9DyRgMLYGkEjDW
         RqNVzP7SCnJ4b5s10fgpRyclpoYVQEpaQoLqeouUd7DRefTgNklQs7C25IAS1U0EmEso
         dcj4fkJdCXtaXKm7aZ3G8cEXXvHJ9ixid1cYJkRtW2iP5siqGnox2diHhdfmW5DhUI8e
         7bRGSnXKKpZEzazXKfn/GDPSlTdE1Qvkt4ZID+q5xtoK4Pt0Gdo4NLBEshX9+nBdMaJT
         MJlOnAI3TPBH+RBy+VGbrtpNiJnO3651ZKYj1mi47xx5kE3DH9bYVo4alAUXamIb+NVR
         oAsw==
X-Forwarded-Encrypted: i=1; AKwUvByc/8Jlw5sQ1OvgXhjTUGWY1g0mNxBclBx2I1OVH5rlogj39pfB5gnUw0YVtkHbi9uxQtAu2xaj3F/M@vger.kernel.org
X-Gm-Message-State: AFuF++kwJftRvL8ClU6wJwB0XKNIuN5ynP84Bcl3N1/2jzjQO0ggLxOT
	VVosiJSqUy35+kV8DYxYDQhQ6SfoWKzFr1A2u6nWhEUw5AZaBES33r/L
X-Gm-Gg: AYBFou2mMXzgNe4kcUsiwzoY1wld4nVxHNbuDH/ek4oGTPlzbBIVSjo1DmuYEtjus25
	A+dwzArNZUfaHUJQrnb1r26RZqmYlqQR5FB6CVSG5/aYJplPcUL2Qd27tYvTIQw78oh0Xe09WVR
	Gnl9JUJh4xdU8/aROMViD0v+7SrQ20PZ7tsCINkn3XUPp+ewwDVk/M1mLbUcNwoKjQnqd9mqFv5
	LYJKxlzZAPcUihv7kpSdgliAwjhI7QJqJWfxvXECi3g6jayyPvlhZApxJVbstYCoSK1ivwvpshZ
	YebSY9iwJkYYQoD/jkN+1B4LAJsdreSZ0N7V8BFst3rouyG/0gUePzDksnpIUxZFbUb9w3EzQjt
	cT2OEFOXVviW9HU/ZzRjQnos4VY+oJbmhJfHvpQnkcY2dcjCm37ux84hJeADaZeFd0FFZYgiVYR
	NTtO2nPew3pvDESpR1RmFqG6MmKa2VcXiJRVdH71UayB3X1RQ+TDLRnUCXch6XoUiT+pxFbNWfz
	yiuvA4vimtOVQo=
X-Received: by 2002:a05:6820:1f04:b0:6c2:1018:3f7 with SMTP id 006d021491bc7-6ca9aa4245emr7824820eaf.23.1789950133885;
        Sun, 20 Sep 2026 17:22:13 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd34b3101esm7471632eaf.6.2026.09.20.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 17:22:12 -0700 (PDT)
Message-ID: <41503126-2f2b-4ac9-bb9a-610686be4729@gmail.com>
Date: Sun, 20 Sep 2026 19:22:10 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260921001702.3a208780@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260921001702.3a208780@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 6:17 PM, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 00:31:50 -0500
> Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> Hi Ryan,
>
> Please slow down between new versions.  Unless a maintainer is specifically
> asking for a quick turn around (sometimes happen very late in a series) at
> least a week is typical time to allow multiple reviews to come in
> and hence save on effort all round.
>
> Jonathan
Hi Jonathan,

Got it, thanks for being patient with me while I'm learning the kernel 
workflow. I'm sure you guys get a lot of newcomers not knowing the ins 
and outs. Won't happen again.

Best regards,
Ryan Brue
