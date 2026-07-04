Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B983A1688
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155393; cv=none; b=BgosqM4Q1NYRuODRD8hGWl/RAqfG72oegvVEpJDLONiy+VlW4gWKJl2alozRjfHmo4zOGEwOnas89O8yOCItw2CT5O3yb5F+mafpTjH3PH6Kuyr5XzPsEb8qzV0fe7hDlfA661StaEOKhKxf+kARitdr4Sh6vKoU426oCGFNe+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155393; c=relaxed/simple;
	bh=rw7/9OzqfRsTbCam+3oyxvlooacrsew7P34zffYaA1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OF5pDHw29ECLVElZl7VvriPLWQl+GEXWlJQzKkOCP62qjHGl85SuFxgDj89fbOUmOXRD3qcXDVwLdPVMf0V1Q6Nr3lGgSBUTyfh/XwwxPFO1/xSn2onmSmHgX1zFNsXEhgnTORMO43SwmeJrOrYl3O3/0dE2c15u+iCk8KC/akQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIgLsoGT; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIgLsoGT"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6663b4fe293so1016209d50.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155391; x=1783760191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=RIgLsoGTsK11TvKbesAz617bZ99ittPVQN6SeCwaf2+1TIc8ccGnTllRrrxYmIhwIq
         Ppzk4J8LnRfTN4hmUeDY1WhV2H027iraQRs3cOyM8kg6XKUcd9JaWo6KAD5o9GPQgB55
         NB65r3gDQ0kE4uOQqqWFCvm12cZPbNQkbsmPzXDNDvol3Z7rrMM6u9HpE1zsjkBPl/BT
         /SbkFuda1ZBqH95LLfXbRI1ecU53G/rq9Oeq/jvDfvFQcHFYtv4Wnhxefsl6h1C7iLLE
         4pbVq7SRSNKXRlA88snhqciUqkERwYmELb7laV/W0qBnaKE9E9z8WwMTTkZJN+tZJuBX
         ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155391; x=1783760191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=oY9apetIYowiLRIUOjDdYWK0LUgXq8XJaAqLk7sqEWLOzJHANNvcq3KE0MfSGx6BGL
         WuIgRDB5dxBb0JtM1VXHILmPZ94EiF7KWHqEr0hCjkeol/U3iQZsFFdtukmWenjCo6X9
         wIzo5u3IPpsuUPx52X3aZsP+1dH9Rk94mT+KyyNo9Osn5780z5Jp6vv/EEjyzZlNdyXI
         Y1UGPBCeGEpoDz7ciG1YnjCsUF8/je2p72UOUbQRXZI5UX2A/7EZvGJlQW/4ZKu5Fvbw
         UBfZ4doxmXvX36/OU9TgDNzgtlRJVP5ys3AzO6peiQEhriWDM1KXbnrKa5Sv+dNfyRPT
         Y+nA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8dQdwpzPrtJNsJiQeI4rLtNbVdbdN0UwV1Fjes92kidyjDssq4idvCaSHfBmPOsDIe9EaYl/AEFWm@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9HDScoolXI0C5KhqwI42UAMmBxccBhqFPZQmXPznc3vQFsin
	9nBGA4TVj3kjVU/zsmDp3hnyPB71hdC8q9VSholD1lH6SEMaZjAB4k+N
X-Gm-Gg: AfdE7cmWa3iYZkFjKgv8LEjK1lJ72T/YA/46jeSUIfBzeyZxKkM9NnLhWYc53B/fCnK
	ssl39slojyPtbaPxUyMrPIZf2dtrPEFFrcwuzZBWbcEO1IjcKGIQj74rVFEKQBD3HaMmZbWd1x2
	wjTnAcwiMJ8LGIqUMOzG4yLBsaaI3yOUpFvDLjIzB4SHlxzgrZkKxDDbryOXbjv0HQdraxCx8ge
	BCQbwAcLpMWABEznh94HQH/IVQFp/H3dpd6l3R6bgSqlHeVXtMoOmDy/qwMsp6V8XBy+bqipMy5
	2kosx04WjZOEfNKIlTGtBDP8/rsml7hDP4ysGL5tQEJJU5a4taUcmMdzqriOb7j3XzsOcJMbmC/
	+V4qZCB+CwjXQvvSpkpIhT+u81xhXuUiB00BTbh+v6wD0TGGpc+1N9NJvq+E33TD0c5KOR4Rd6v
	O1NzconHdtkBrnJr8=
X-Received: by 2002:a05:690e:484f:b0:664:e430:cb76 with SMTP id 956f58d0204a3-6665306b95emr1287023d50.59.1783155391641;
        Sat, 04 Jul 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm33528307b3.17.2026.07.04.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:56:30 -0700 (PDT)
Message-ID: <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Date: Sat, 4 Jul 2026 11:55:34 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. Must be because this device does not
support USB 3.0 (super-speed).
