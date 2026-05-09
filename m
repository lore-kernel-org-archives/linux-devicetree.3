Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E237BE89
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778365274; cv=none; b=F6BUuvlGz6/LudJfcTR5O/eeCxWzpEhXzOz5M/q7JiHf0d8inJOnuuUTV3A2BhaDWgr4aA81BW8fMIM4BA07lpwbKs9itTWXUhCOJ2ivBNW+Br5Ax0zzd9fHdCxzirC9FJrqhnW1OhWVD5mClK51sdTkkkCIjdymZ7gmOvLuIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778365274; c=relaxed/simple;
	bh=V3PnkRNkI9BUmkfd37NWASsHb2UoFlKqUAxni6iD868=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMQGOlaDgKOqHah5NVBpLb3bTiqu09O1pZUJ7hSK784kC5vlNDqtb2PrBtYpbqWPn4VAL8sjnSAk+8nGMhWqwAKBcvikxRXJxkH9T1JI130KZI4yOo3r7ul1zpDGUzFV7i223hIrgl0/31aa2TGoZQrVBp5AkprbnEgSDMilWXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=CbEo5nh9; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="CbEo5nh9"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbe07d3ec3so1608835a34.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778365271; x=1778970071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAJdZFhhyoVEmBVhRoifLB48NRsX03oJG1Z1uzT0ZtU=;
        b=CbEo5nh9rqNOmrG95Y9NAXLf8ByYYlYQfiZaPZmN52Q7e5IeAJlWDJAdWXT9+WLQvI
         tkyzVqNHRW/TM+FvIfqqw2wy8CktDtsvdsIP1p6AqTd+cwUh9VWQNcZCBX/NMKupIFTY
         VeBqvFOMXv1+XcjB2eIZVZ7dhnBp8ZLROwfp2DvVH28PdopCRgtFP9BdgXTT5TaKwr9F
         fveeHL+8qga8yFIYEDtgpkN2rAAPS3rNAKPLg+qoGVCWBGlHhypsZA3Maxrh2BtvDF5S
         unngNQ03iKCpruvYyOPrIObDopQJyjICfcMAwheGMoRVLvf7GS1EwdySHlgAhqy+BeDQ
         j/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778365271; x=1778970071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAJdZFhhyoVEmBVhRoifLB48NRsX03oJG1Z1uzT0ZtU=;
        b=OWvrTz8ePVf1pIdW2xbc/b2k2DFFxkVukZS68GVPtkpYMZbpMlKUdJ0rIa4+wWtVRj
         zknLAz7UmE3W4pFxW6AWGn6pmS1orpEfjebmyUk9P4XgJJOHwNzmaA/7rpYEiPkn1OkO
         bGWGO7343p+tgDrdXcQ3T+6oUniQSt0sVGiELud5JuMb4VprKh3UMXwyGUbo8U5lAkf1
         KdMTKGB+DxN3EsCxEtR7rN810rqiicOiGARXsnaNyr84YmE49oVip9ZeP9nyRxvLTXhO
         mFMEmHCWN4fek9G3tlOvV485rYSzLGiv64mzzlt8+Tu+PvbmJ1S1wmS1s55TmaxDb06H
         z8BA==
X-Forwarded-Encrypted: i=1; AFNElJ+PxQjQa2qUiwBTW3rMqQL2HO5LfQTKPOSc0y0wfT1ITEBTJzR4Z+7Sp0gflcoiCetKI6U6i7rQBZAa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44lVhvZE6b0Y/OUtu3ZNjtxen5gkGPWSRcOY/srw/yi27nSp5
	3HysdaQ/iHiu4vjotWlZ0bBV1aNQ4dyQ1MFOsx6RwqSQdyQSOqG+4/Xs1F8spzSBV54=
X-Gm-Gg: Acq92OEV2legzrbm5zC+km7t5ukfBOlxqtdenOEwtISyO/N8A2/y6b3oudIL5Inb/c7
	mnqTfr+jtNwauIM+BFRGMiXXiNz4RilqLQqHEh/iDN1zEIk6t5+FK19sNPs5bsiW3rIME39c9/i
	tlxptD4qIndP/JVD6ZF0vKCRZE7nsoKF67rSS4DCl6mwwfXv4SM6fm3aMuY4pDUsso2hZT01zWA
	uoTnLHGQGlvGVEYhJWkXwUAY8utoDnh/byy/Xa3ekf+yqDrn4ivTmm1AUE5F326FEPsmmEyuGU+
	BMMc77Kny7st8IDDZhe19kmVIqhXwxNFdr0HdCqmnLYMWMpbK/70fNo6MTmaA6xIaVht1Z+/Smf
	Nccq6mQFM2HI9/FznF+mx7DXklbGJTSuwJq/ZtzaJOwrE53yJQFeJ4QqzuxFjr7GQDbC5IFl5V1
	g97/km2PEH/xYiqe2YtupabyweGbyJBwiPVHhs9zrjjYm3KhXy36GXb433Z6y6k7jmEpgXInwuL
	ZWOXq9DfQ==
X-Received: by 2002:a05:6830:3905:b0:7dc:cd0b:58b0 with SMTP id 46e09a7af769-7e1ded2b16fmr11431496a34.3.1778365271231;
        Sat, 09 May 2026 15:21:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:12a0:9178:ab4:39cc? ([2600:8803:e7e4:500:12a0:9178:ab4:39cc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d9d788sm3674656a34.24.2026.05.09.15.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 15:21:10 -0700 (PDT)
Message-ID: <5afc2ee5-7b2d-420d-911e-7019b7f8b2c5@baylibre.com>
Date: Sat, 9 May 2026 17:21:10 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818
 binding
To: Hungyu Lin <dennylin0707@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260509022718.82957-1-dennylin0707@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260509022718.82957-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 9:27 PM, Hungyu Lin wrote:
> Changes in v3:
> - Fix commit message based on input from Sanjay Chitroda
> 
> Changes in v2:
> - Fix commit message to match binding requirements
> 
> Hungyu Lin (1):
>   dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
> 
>  .../bindings/iio/adc/adi,ad7816.yaml          | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> 

Don't need a cover letter for a single patch. Just put
this after --- in the commit message of the patch.
