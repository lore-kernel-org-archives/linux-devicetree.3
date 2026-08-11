Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D364519A2
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467715; cv=pass; b=pWtcfy64P0TCqUhhCe8zuoUUvRX+FyucmIPpBg7/bvmA+ToSbOrEKw2/jewvLyO+hvrVCwgPNCnXTXWVmAUHMNaewcqYz7Xm8ZCBIXaIllTtkkuPr3IKyO0QYsvHD9nsw3KGqqHoYP6/9ck/gnnhLMSZYHw/uAHR5xR2Tn+N/z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467715; c=relaxed/simple;
	bh=TWfzhxo7/xMmuS2MmQr5q0gKhU/gaJMPano50ie7PP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDL1SgAimPMuwO19TgRdq5PHSGtCQ4hQ8aRUqa3/8uHs8DmrHuLsYIT45vOIHa9HbEs7gMCg7YC3fsbEStUEBNPHRX+wxHqury4m1HI6asSOrryUp5nZQL/+OJgrullCIUiMUnMHBj5+rChpOKTygYcGdAteQggyHg8CAQuS3oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtJEZ0/5; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtJEZ0/5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84874b52eabso136167b3a.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786467713; cv=none;
        d=google.com; s=arc-20260327;
        b=FaN/M+8qZISSba8A5NXSLDOfCp7GyS/yfyfVYyqRZ/DelXJMTaLhYxsdSL97QOHWvV
         blA10fqthCpzc9JO5ASyQwSPuXRO3wSmrXvL4G5Ek+GAUPse2BKSHnpEFpJj4KZ8lKP5
         lBxJGNu9MYmETJkEFzidiC0sHn4csVqR/BAWEAP9J5YspxYCrw+3h8yVWTdqKcpqaFkI
         NVf8L8UQz5MUaY/4zajte9JPZnQm60z0SIfo93iadpaYgCKKgRtX6IaChUJ+W1G2Z1OF
         6+4yGLTWMblbKwZ4ZU6KHRqyFz+SilSrl+rVvQ5LPCO7k/vUF3uPpTW+XJPLZXkPlVBU
         JG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TWfzhxo7/xMmuS2MmQr5q0gKhU/gaJMPano50ie7PP0=;
        fh=TZ6g4t9vam21ZRlw9TV3qV+07/SCCbCenK9zI1W8UmE=;
        b=BuYSsczKRMcsonsahHjStU/kAjiC296MXFutilseFYa8TEHtzMrtmNK5beGkdNrB6x
         LaSe6pzVf5rxr87pUh2LlQEMGUqUamdiowNMVYOiLT3Iv4/eaoTNXV1+Oq5np4pwnrfP
         eJGGSApt9TSbtcTPbh/H1KlnKMIgNMQx/TH5c8N5Q7rUZt6Bl/bKs7w9vt19MiNZ0rQR
         fS0/hE9Ki3Nr1DKeTVSVAExwD0ZVCc0FxJDPNBTflXarlolnGzR4DhDw+Bm/lUXHT6Wk
         CXFxcWha88bWEwox4MLr5ZaEgJdz4Am9yMN9a7oc2jmQndC9FRVjr07H7hiHddL8JGR0
         8B8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786467713; x=1787072513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWfzhxo7/xMmuS2MmQr5q0gKhU/gaJMPano50ie7PP0=;
        b=RtJEZ0/5OnkITtjEBqHf0h+6Crk79hhJvIu9t7ySbRKDbfFtU35rYyGynyO8YVSJUh
         k0Tto15vX39u+ey5dRL0z593lRkR0DBkmso4vYmEaC5TEF8ulV+e4atb4xARQVfA07YN
         ltqXabmwV8jJRSIpeKeGuaWTq5L4B1UvLPuVvRYQhR+DUy5SJYt7cW6SUuY+btVC3A/B
         NkwzDplBHpdsIrqbrC7BfC0hcEFWgVHP0cyb90pZHdcfuVqm6z88YiDgw9Go6KODnxZ6
         YXkI9+DtK809ylT1qRD2RwNhYir7Hyivz1qoVNfK9qXL4VDq4xpYRsCYvCA4r0wUFmRA
         YfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467713; x=1787072513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TWfzhxo7/xMmuS2MmQr5q0gKhU/gaJMPano50ie7PP0=;
        b=SyYkqRXMYYg9q4TYgfv3FnrlXyVsewi146/SxzE/eEw8oZuwhva7dco0/2V5eBIQRf
         zLeP3FexLYQCAr9Xu77hFf0Z6QbG3y1ZDgk2cPWK3ObAtsXPAiRP/9q/VyiGlHYprIfm
         426eYGN4X/oXAAo1ycuCUWTxRQMXEPhIN90nqKbxjb198iB7L8TZOpGGjgtdQvxCfNGl
         o/8JRznfT/6DX3Nuw8glke2YSGDxufzijm/t0EBwzMCrjKaztKey7LzvEPlYa1Y3E2qn
         iDS0maUtbzab+VwAqfgvfh2A0LjD63alvkF/7FaZVvunDkHLcQ6k44Gt57syJo+P945x
         K3rw==
X-Forwarded-Encrypted: i=1; AHgh+RrQolvOFmB2T8p8eBcCl4qQps9m6F4DudpkZT39tiRypiX0gwHqj2APeWXKGq+Pi2csiWikhhlzqRl+@vger.kernel.org
X-Gm-Message-State: AOJu0YwMA+PltGNEjlxTiwU1V7Pi1ftWBQ3BSlkpfsQEKEaPIg9Y6Szh
	Otw/2vZ9MbN0vxswjOuXZ901mX0kVqguoLEJtlHvl9G8BwwxMQCTaku6Z+5b0tmD+GmqCOJzR/u
	5LKpF3TuiAAskPoQM6fnhEzG5nD82U04=
X-Gm-Gg: AR+sD1139UhUPA0u1qJRKzN00hK2000uqIAM1t7gYAAZD9JluLuXlk0UovDAIhSoMPC
	URKSqzANLdQqNaGYBbad92HCsYBPPfi0FVhfkvx3tf9ymsM4wlnJJFlUISbAOBgAVbPHhT16BQf
	LwKJMzYNIfpnrBIB1nw2HB2Np4iNHdnyGx/uoShZHNx8NVWfhkv9cZwmrbzTQmjc7aNjSsFRzC5
	4PdESy7O579SQJlOa80Ci2uuGpF0h9ssR5WpMwcWOkyq32C3CRfnWJgjrFduMlpiVVNr9MpE7p0
	+8i3kErfLha7b2b7nfIA6VVBtB7t6kEoQvtV+YIfcy2xQGZxM/lemCg7sYN7W5hqrQWNCrlI0iJ
	gCZeOTiis8qJ60g==
X-Received: by 2002:a05:6a00:3306:b0:845:cd11:37e8 with SMTP id
 d2e1a72fcca58-84fa8836414mr5878515b3a.24.1786467713015; Tue, 11 Aug 2026
 10:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com> <anocR1F6uCdh4e1V@ashevche-desk.local>
In-Reply-To: <anocR1F6uCdh4e1V@ashevche-desk.local>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Tue, 11 Aug 2026 19:01:40 +0200
X-Gm-Features: AUfX_mzzdwhLUB_Ygu2ISlH2HoKNN70xUsEwlWxKIpls3MKE5UGi6bJj3xYuDf8
Message-ID: <CA+gq5JgkegYTNKD1dPcWRp9sYXoMDfa9O4=B2azROy3QuTszpw@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110
 to ti-ads1100 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt@analog.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mike.looijmans@topic.nl, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jorge.marques@analog.com, 
	antoniu.miclaus@analog.com, mazziesaccount@gmail.com, 
	jishnu.prakash@oss.qualcomm.com, duje@dujemihanovic.xyz, wens@kernel.org, 
	sakari.ailus@linux.intel.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

> LGTM now,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> A few minor comments that Jonathan hopefully may tweak whilst applying.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

thanks for review Andy

Best regards,
Jakub Szczudlo
