Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630193;
	b=M5WEvyxWgI+lYj7cbWzC3F7747q8zfjaA+gxUlUitgyZ+027+XMP/wS0eT/HeYVozw8z
	 M/awWBruM4ZKScN7awgcJL0HKMyITJgs2By2iz/HWYA9YsGcxq5QkxwH1nILk+B9EuWop
	 YUEriPZeUkWl1I/00oBX+Tnb3TGw39XC+YJaUDDWjgfm/Fe/i05z2nVqwUwea9tqbp8Kj
	 DSvUKj80SO6rsKmMKS8eh7skKCxKFZOhVKWq5ybEoZjZ36FG/N8T8hkVYpy7Wv89HQ8OO
	 w037RaNd8GNMSloJCP9o5eSaHdFwpPLQxZmB4X90+vr8U57uUzCacWin4R/AYVCaNgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
	b=m2DjDWgtpydKa1oOXEc8yVliva9PCumbIUw5Wy9MTzNzjAmU7JcOB8plSM6eGzRFP5SP
	 UQh3w2d9Sooq+V4FxIgpscllaioBICH9Lvbvr3pvokhxrPUUxJHo64XHjV430jvv3Jk/C
	 qWUTcW43gM2Rgwk6A7M5RkT8gkKyL97+5uZUPg4Vcoy7flXaAQirWxwphY6kHQArAbY2V
	 amPDq7Jb1ABWKpPiSVzxziVGEgpgeJhcARmHmgzzsXQEvxYgrE2pVmKDdZOItyHpeSCoR
	 f6J3qj0eEZ8obIIesJ/8CBa30V3xiwqRahtDiK/9n3w76hq3V3lLOM2rdthLKPhx+Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGvuWvXA;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCED6078249
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCED6078249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGvuWvXA
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so1374919a34.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630191; x=1794234991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=yGvuWvXAnv/ALgw/ng7DiKt3/v4Bc9Py6IomOc07OmxQNEgtiT4A+vgouwG4lOZ6Cy
         LcKm5jMK2iGs8gkNO6KkLjoe4VTlGr1VLROmHSArFpPnekaAhNjMnfl8O49jixZvc8uh
         Xcz3Ki4nVuRdlvI19+/kn03r/WzAw2tueHb6hz12ExZK71YLMGaXZPyn8mJu0Nk+vdaQ
         yxDUnxVqJVHc7w33XlZcEdmxNXf8gl5sWb5MDUkIFUoiCNDq8saj59W4kdlC5E5FTxJn
         U5rwYsh03vOWfF7u8c3TxcgQzoWhkH36cOn2dJJ1sWe/e3ldKpsapOeQ8XDsC7m/CbmS
         H6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630191; x=1794234991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=E8YYp3sThWXt9/v0hyzEkj4h06CjFCqs6AEwyNOy5Id0Tiih/jON+XDjJ9bRNnb+1r
         V8LwVBpFTvxVqKR3vmg/64eomyR9CSKbbJdWD8J/9MFjoAjBPqfUU3cS7UhYyYKvK5Xb
         byY/bPgMj3Plv0fC3FouMs86tZmu5bR5c/WUlXYQAT0Sv5iMBJA479Sx0YBmv6M9KXst
         TtmnZq4Wo755KOo3GWsr9mu1h3GVMgiPEA/Uelpao3W3CFY07hTap9b8dU+rAzI4gN1S
         gWZIwnhJUTM6gKCmn3fvdowy7lEyGYyXPETZWqfnTF/tMnElDjTJoRrbJ0wOHuTeQ5q7
         vLvg==
X-Forwarded-Encrypted: i=1; AKwUvBylyry4DtXu1kK9h8Sp5k6dK9JmUsRwkRCd6NBXOCZU/qOU3enVjPnmtEDh2usgqFS4tW4ha+7ERsRW@vger.kernel.org
X-Gm-Message-State: AFq9FYLVUZ7tn/0b3XB35kOg/gCBsA2F1B6I1rewelSOsQlWg7FQmgcy
	j3Wzm29heoLkTDh240VaBvVzZLSAuKD25xl9zuf3BBbVwGI6LFOTVMeA
X-Gm-Gg: AYBFou1h/dd/Z7x9xS1sgm36DtCoqETVAxdaLf/NZmAq1OlW608e6jhDaTJfIxJIBN1
	OUOnm1fKsS+EkycEC7l03B05ACXuq/3cs0xb24r/QxZzRdAshFDdvx7W0MIY/URLE7uK/GqwZ1K
	npp7CzNaXVQ/UCIxU5zWFgDHNZJBF7syFvlCPJrDqcEchFJgKiSnfONC4sveRHXnEuwMC7WZcWm
	zRSk4uDJMxOsZ6/ACi2zXK4q2DrlihW85SDBNPYTje6pS984PSocagJPHLivKEvGpBLBD00xhDn
	tzGAzWiCKNI59Jnkq16/68OJa5+FpLb51phBqD9qZcVjka5KhUCMxqet6k1dHHh/i4QAnlhGIQD
	v2ambNK7dMagVcDvfpQVb4JhKvdLlzlAykb7/rqyJrLoAAtDd13fR3xSkprv/lpAgjuE4gKx0be
	iuyd3N+yXFLhvK55bmTVZAK1SeRGgpsgUh9jvJndB0YdAth0TVvEbhxV/M1MqPNxClgKRVulHpK
	03igjnoLIXFwftsvIeQLJT7roAGPf6EB50GdXTZK3Yqdcm5eaEoxXECy4+cwQO2uyZw8B8JKGPy
	N/W6muaZcneZWTYIWJ70aBxceJcKvdDbdteyE3zBTG1f
X-Received: by 2002:a05:6830:82f4:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-85d364871femr7316643a34.16.1793630191638;
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985b2sm9189411a34.11.2026.11.02.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Message-ID: <eb5b989c-0308-4721-b55e-4f179b8f13eb@gmail.com>
Date: Mon, 2 Nov 2026 08:36:29 -0600
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
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <sashiko-outbox-192928@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-192928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 11:44 PM, sashiko-bot@kernel.org wrote:
> When pdev->dev.of_node is NULL, of_device_get_match_data() returns NULL.
> Previously, mtk_rtc_probe() never dereferenced rtc->data during probe,
> whereas mtk_rtc_register_clkout() now evaluates !rtc->data->con before
> checking dev->of_node or whether rtc->data is NULL.
>
> Should mtk_rtc_register_clkout() check !rtc->data (or check
> of_property_present() first), or should mtk_rtc_probe() handle a NULL
> rtc->data?
>

Yes, good find, my bad. I'll send out a v2 fixing this.

--
Ryan Brue
