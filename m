Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287973;
	b=I3luseEfYSAOkBDGmxuPf5oHEAGGxjW2IIOBNogH69WkcgWMgYSWcEo7S4rinZpshxuv
	 m9a73M2SF+03RzUcTCEpbF97/nYvWlLILfGrkBN1HMyVRWR5wgHyZSKHVYvSs4y8u/GKe
	 PG4r3U+/htot7kY2tezpu/Hz2siNPLbdx6S4TZSdtxOv05tTp5I5r3P354HN4LxZ9SN27
	 pTae2tSVfzrD8mQQblcW5vq3QC+Mu8is+H4+k+FR+0g1WnUNxlag/5morwqJaHbEZ0ADI
	 NDXzLqmxO33Ozb1T/J2DpLmAMlhdgurVJBtoUvIGwJuAO5mTGUAR2tK4xySyrCc+30w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
	b=jfiGrODIPo8ZvI8GTJ9ftS264b35ZsYQQqWkc8IpEB1RlGizqGMuf1BloL7togyiWTaN
	 WM/qDPsz4aFY62W8drtk9hIr4ebMvXXHy8u5dUOA0jBFANetxrY6aQUUXL2BOi+9h9lvm
	 EedMwaGlivyKQP13EaIL9mf/lrlX9kXdPlBG5e3xCpGiiGzaq4LqTAm4fAac5qeabff5L
	 o60+R49gzRaj0+DYIWt3IrO84ih/wZIEfGnuUV8yiy204gJRxTKMEFkHqKYYd9rbiBl1e
	 d2tLJ0KacMlhniD9jdKKXvC0IBqHf+SLXG6i6p0nIICHeLrpdlCKPnLX+JCdq0XJxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893DE606A332
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893DE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23919485e9.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287972; x=1795892772; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=dRUFuQH8w4MMSrEuc/tUiHbAWm2e8J0TZVBrfHQOSMQQc0vMhH6D331bHZwmWI0nW2
         lOwdSLLGhfXzgXbQEBKpcvr4+PI3b7XJh4mhRWqOQcNiR7cWa5aPNcNWAzqLnO4DfizM
         opphh1/ieNCtEuzXfWV6VbBhb4yO6YmMnc8jznq9GO072dx30HONa2zs+cUSQbS8TJxV
         m+4h+3WjdKBDkuVYBJ3KduUxejxMzvESrVOUs2AqVsUZ5dslRzyepHS7zppw82DxZaO1
         rw9OiPKIfdAJwSEUOwttDjkpvJ5P6XfNisG/ZtDNOADkU2kxZdvnT4Ieor0Vy+9lLbUP
         RBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287972; x=1795892772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=QcnLLtofHiMgW8eCrUtkRINX+oOY6fecly78DhF/uuQzZq+M5tCFmkKRkMW5YS93Eb
         3XlQ6igEoHEBsQPvGxn1pT87V3TQutyAcqk8OIZZKFjxaTJggLFYmlecExtx6rWgOtpu
         WTt6C9NnEbAMJo+XTlAmdxNYxMIAAbnXdGImBPDzJ7NqJMcNnYK2SoKGpf3PSzafDemb
         b2abZN40IVI7kBNrHd3vireoTXUF/PG4qyy+XmfUbACIFXF4iOELbm4b1CtQzadDPmiW
         yBigt8K0xHaat9Xc+8DT0Th0cY1Utt0HLQD6SzhSA1RsvTtL3nzLN416f6gHJwS3kMjs
         oupg==
X-Forwarded-Encrypted: i=1; AL+hErFTt225jqyoblPMEApmJZgLrYR7WMnp14aeDtHe+0+tci4LIxfd9NuUCCW0dmlK2nvvosURxGVPuJsh@vger.kernel.org
X-Gm-Message-State: APuU4Z8yfbFmWKFfELSvbFqmBemRpLj6RPnOJhgqdLaXgZn5EpveCxsO
	RpduNbhMfW/TzqI5Wiy45AjfDCFCYlzzUs+wC63bYnZ94J/VUjxiADz2
X-Gm-Gg: AZFdTZdy8wHafUskK4b4a0J2pVIbXXDTrdxJljd7SSkZ//kVHlByy5onnzkza0vrY/1
	Kjdxt0csGwnFyIJ9jxi2tTEV3ashSZnfTuzvMbVpxSffDSGdJknm0/m4DP3mV/eQ7kQ6FRSc3fB
	pG0LNBm2yquMIg6SNlySwrmCMggPWu5G/BWhzLBJiku8Ocyja+9kgw++LJ8oXOy4F9WbsuBnXHF
	zJqDxCkfbqv+0Nfj7+Fh+S6JZSmUCfZZAPgD6/ub7UQnjC8Tf+/ZyLHu4YqTcPB+zxHn0DhJlny
	Rz6YcmiB77WgZLpDERxuOLDef9ouid+ndeIdG4R6npQNJqe1YThWPBbBGsYWSLU8gWPZfB8GXW/
	f5ONUf/8f8aYP8MMGzq1Urgk6NA/3SjpAoHdIb2VvqNvqJ6vrLsuWXU2BLTr89RazJyowyUj+Fd
	m/pEo0BqZRQJ4Uthlw2fBTvLHpryfYMF+XE255FBS9BjCG299gp9yXPeAfjDuprkK6NsbrrMz2I
	dNFvFUknHXEJXH5i4kssNmYm+mZyRXBnDVi4TLAmBo14jQ9gSt1v2DqQejxQUv2eiRDsM1cWhj/
	1A+z6kPA0QFLGnQ6rVJo5qb98PwkLWjoY2OghvsUKLlk0+kcSFXj7YIa0r3xxjkN0HM/SPldW4q
	9ThUgIo79daIg1HJoa0Ueyoc0PNRX6Q==
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb888106damr154232025e9.20.1795287971698;
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm148595925e9.4.2026.11.21.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Message-ID: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
From: David Virag <virag.david003@gmail.com>
To: umer.uddin@mentallysanemainliners.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Sat, 21 Nov 2026 20:06:10 +0100
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
References: 
	<20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series adds support for USB on Exynos7885. This
> series
> is based on David Virag's work[1] I had rebased it onto krzk's for-
> next
> tree and tested it on gta3xllte. This series also enables S2MU005 FG
> on gta3xllte, which is also tested.

Hi, thanks for reviving my old patches

I actually have sent the patches before [1], got some reviews, but only
ended up with the clock patches submitted and applied, and never
actually got to submitting these patches with fixes based on the
reviews (which have been sitting on my PC for quite a while).

I think I will submit my fixed up patches (the ones you submitted still
have some problems), and then your gta3xxlte patches can sit on top.

[1]
https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.dav=
id003@gmail.com/

>=20
> Please note, I did drop enabling USB on jackpotlte, this is because I
> don't have the device myself to test the changes personally and I
> didn't
> want to risk a regression on jackpotlte.

I can confirm it does still work properly on jackpotlte.

Best regards,
David
