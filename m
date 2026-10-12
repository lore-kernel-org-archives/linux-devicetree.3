Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4574F48EBEE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814700; cv=none; b=vDaNXhx4JWxg7HCNAjBUVmehodp8AGiqQ+E9oHW0wraJImOOd/94VfTpdoHQf4KG7X484si1V7DKtY0wD78PmaCeZC7ze0YTwlTMpR0lEdyTbn1TYpKWS+VR9Wd4fpz8doV6v8QCO3aDIn4IXlNRfk6MrzVCk0wczx3gSCSYnkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814700; c=relaxed/simple;
	bh=xsipEPEhRlPufE3owq6BYPDTNCupZs7aJocTjmILrD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsYs1rHt9GSYURZo9V1SW0KfQBgi5jx07V6BueQMjVWl1++JtogaHMy7KTheIT+WQd9SHt5adT3+icF17+c80GDZNro2mgg8laSHTFO0Vk40CglBJGMbuwq7Z/KF7L0LzGaPvITjoRHL6R2+5b09QBYuBgnjwu9vZPoyMWeQIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sifeVwhn; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sifeVwhn"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so3757643c88.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814698; x=1792419498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERwSK8KKE1W5zoZLZRnHG0stGyfGnvHWTKq0AM5CtPQ=;
        b=sifeVwhnawn4SdKKrVhr3YxJ1+x2AXwGkkVn8O9CaQ/qYt2yr0iOZLM9TKYGl+DCQO
         Qr+7Mw6On0oATRgqZrSKw0lim9gGcVHo+ciCULtzuNz7BFreRG8+9w4uWGkxjiOuS52M
         Jo1vodb1RDGC4+nzKlHcyUqjwjb3gF9Wd+y8VnOZYMcclPdmodG/ok1/4XFFtATvaHV+
         i54OfOE5IhQXyYJgckMVBbl+4pcXj5I/2XvU+l3LHYCizS0BqC/MBhFe9YKYJvjK4R17
         fvi1BnzrYIdQhlqFRoDPHnFh/2qTxVKxm8QMJ5rayYTRK/q55b7KYmT3G+0G6snldXP2
         Qwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814698; x=1792419498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERwSK8KKE1W5zoZLZRnHG0stGyfGnvHWTKq0AM5CtPQ=;
        b=dxNxfvmysnmlxBKW1uSchmeTyaLpunlVQVDxmh+xEZD7fOd4O6Aw4kpULw7CYXuN77
         Gahi+2Xtkd+BU+DZ3OL1JV8Fe7HxWv180droyaqXNlzdWSmPR+JSrDJpXA8SwsHgR16h
         fOFHcPxcPpxE0ZTHcehwi1AoPqnSIUm3rUxOrxKYwWDLxkYePrLveyM/4gMS+T7qG/BG
         74QZFmx6PbuIUr1LuIgIA0QXdQPgCq/kk8ggRMvJLuUBTC8GSh57L581m3fOJXrY/90f
         hxvJ1H9mgov0z/npqnk2sGoet2rR6Ci8S4sOPPLWiImVWHGW/3o0SA42bGzwZQ9GcIAK
         ePNw==
X-Forwarded-Encrypted: i=1; AKwUvByV6Yl9czFtNCZqPnOeQqq4hrzU0P6UE9/H7ai3ZWN3JdG6r1GvHAzzWV4bDRQF6PNxxDxtkKTq0lDt@vger.kernel.org
X-Gm-Message-State: AFq9FYILp6ejRu/2CyxClitx0rkyoJB55a0oIeMUsuFw6tmb4n5zPCgF
	qzJu6vHEm69porZciIWTOo7z1/2KRpLn1+kEm3xg7yiA2AaLAZxLJu6W
X-Gm-Gg: AYBFou2eLT3wtKbKDPzlZ6HemLSr2FRUMipGKo8TtRxSzR7b/W73P4plp8wL/dWJQ7i
	xB6JI4TIoixCp54otCXgzUYj3sQI7nj7Csp2w5WRcYb/veFFiYD2foh84x2mlku0sCYIL7qa3V+
	JXmyg/Tm17ovxniyiA3m2KMKndA3Wq35a+rHMpXeeg5veit3Gc5aP8NuCCyGgZ7FrrOGnB3ky3U
	NsH8JIsogf2rBNVg0Ca7gPV+MvUtLdXJWBYjU/gQ+xTt7UcO+UBs1bNyrXkI4ySmRz9WmFYGg0w
	kmPLBezKUhSbEihO2TkVY/RQfUCHU6Og6bdpfujhfFWCWccyGC/ZlJRy3HJb7ZOg6vZuiFWEoch
	B4y+6+cKgJtXAULN01wqxpiaRPnndfQAwQfdEMAjKZ4ME6D1KlJ2hkcPB/eA2lZOegMm4i/7KUn
	iR/YnhCTuh/RhhfE0ev8MYy3MeAlsaOjUrkldDK2hAH4mHWuxemgUn1pNImWUNT0NPKrrypLqKM
	YtbP0kLvPJ/JM2CeDyG8EEOIY+xARHEHxk4utWJSepSVU25F6B4TEHzvPMofxqQWgtZprn++rI0
	gr8ahY4KIXRwZAC2fpq8YuZIPNxhxGVHiafQWlHvuGydcQy3EDhqhouUcBYf7sltKv7cnIdffKG
	Ok6KTVTI7w3vF98K26w==
X-Received: by 2002:a05:701a:c90a:b0:147:9ad0:cf10 with SMTP id a92af1059eb24-16a610ca3d6mr13377655c88.47.1791814698097;
        Mon, 12 Oct 2026 07:18:18 -0700 (PDT)
Received: from mail.codeweavers.com ([69.63.209.59])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm28442350c88.4.2026.10.12.07.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:18:17 -0700 (PDT)
Message-ID: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
Date: Mon, 12 Oct 2026 22:18:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
 (SFA14-11)
To: Jianfeng Liu <liujianfeng1994@gmail.com>, kaipeng94@gmail.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 robh@kernel.org
References: <CAHk8ZdsVK-n6u+KO5W0=7c_4_eQ2Aj0aqTg_tqU_x_58t0L6dQ@mail.gmail.com>
 <20261012100325.38128-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Jactry Zeng <jactry92@gmail.com>
In-Reply-To: <20261012100325.38128-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/12/26 18:03, Jianfeng Liu wrote:
> On Mon, 12 Oct 2026 16:15:19 +0800,Kaipeng Zeng wrote:
>> Acer had a page about "Acer Swift Go Pro AI" but it was deleted,
>> fortunately here is
>> a snapshot:
>> https://web.archive.org/web/20260314171131/https://www.acer.com.cn/ 
>> product_list.html?parentid=323
>> It's sold in China using the name "Acer 非凡 Go Pro AI".
>> There is some discussion in the thread of my previous version:
>> https://lore.kernel.org/linux-devicetree/20260729064538.19564-3- 
>> kaipeng94@gmail.com/
>> I have no idea if your "swift SFA14-11" is the same as my "Acer swift
>> Go Pro AI".
> On the naming: you're right, and thanks for the pointer — the SFA14-11
> series was indeed marketed in China as 宏碁非凡 Go Pro AI (my unit is
> an SFA14-11-QWU1; the retail listings I found, e.g. on Suning, are other
> SKUs like the SFA14-11-QGU1). One thing I noticed though: that retail page
>   has since been taken down, and Acer's support sites — global and China
> alike [2] — identify the machine as plain "SFA14-11" within the Swift/非凡
> series, matching the DMI and the model string shown in Windows. So it
> looks like "Swift SFA14-11" is the stable, support-level identity, while
> "Go Pro AI" was the transient retail name.

I think we are about confusing the product name and the model name here?
It is clear that the product name is Acer Swift (aka '非凡' in Chinese) Go 
Pro AI; the link to Ubuntu stubble you provided also reveals this somehow.

Also, IMHO, I think we can't use 'stable' to describe this situation. As 
soon as the product is produced, it was given a product/model name; 
unless Acer renames it, this is it. The vendor can also remove the 
support page that you referred to sometime in the future, just like they 
removed the product page; this isn't rare; I think we always shouldn't 
depend on it.

As Kaipeng mentioned, there were more discussions about naming in the 
threads of his v1 and v2 to this mailing list in July, if you are 
interested.
