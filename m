Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187E296BBC
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785459903; cv=none; b=UXn77kzCTSOdKyytw2uyT7Xrl4MWNPAO+CFvhENrpd0I2a+DiKDMG9pePvUbBcZZNjTR68KH1ZcfjQVjyWbSjKK3vJwSY3ZDPnqMq8JuobkPsJgoS/iyPDgBhRYO8kDgaXy8qpU9N6ncEF6C2jWtIOUlFVC+loTF5wNtWxpguf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785459903; c=relaxed/simple;
	bh=Ub/ljo2qBnXw+rZPga8aeDvObXqkLbLSa952ZHCWtBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPdoKzWI1s+tSR8iS39kIYnUvyn1s++oSb8a8r/iTSWCxc8zZcjL07FPUZGEdRmmcyBrM8qJGpjU3/ZvEhRU96h9FjAgPgSC8sQlneVDsCWFdkvC3oXSGKTtseePI3DBySiPkipUiDm07y5+ErsLIdMjGotHo9pGRlIv9XAdqSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HirRTdO4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HirRTdO4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e0688b859so278455b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785459901; x=1786064701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFttCK6+IiI9LAnY0cBt5R9XII1QMStajnONswWnhUU=;
        b=HirRTdO4IW/41/VRSAYdIDEvqGRwp1lzui+lUfrMfJLiH0ADLRhI8iPzdQAbngrhA/
         PGmv+vOgP5D1qfErSXKQJRvAgl0+x0Lr1YfVX+X5fQ9zoXGo18KURSdlK1K9gJPiBKF1
         wZ2hS6b6sbvGZabh8gPemhvS0/FbuUDTdKaxGtLnAJNO7ojQ5VM9+a7JUyvzhv9vXaT+
         855jqrUbbzmqX4BOV8OjTZZzjF/cSYbgoF+mKIGaVtmScvqcxN6uSb0xBKNIt91unY9v
         fjxBikHQIxPpDSvLYi6N9ibdp+feA2V4ZDdLtX/xzfIuusuBPICT16N4izAEeRi53yOx
         nz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785459901; x=1786064701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFttCK6+IiI9LAnY0cBt5R9XII1QMStajnONswWnhUU=;
        b=h+KwAozxjBH3i4ZHKCG1M9Hk6zq8OzDLEKuoJj9epzNzrgVIoB0Hzs8S9gHSQ+dLfJ
         hDl3XVi0fZ5rBEdLy6Dp7Z6ku+Sz23bcWyk6h8G9PqjEVn4YKUHeGJlrRLPjqfCbxjgL
         K10SFsxt3Vm8uj29ALHrsLT3Cm5ClBorxi0HS3Tw8R9jPS5R3dUzsEkUPVPhiAPLvFuJ
         KZHaDMzses1Hlxouywy8K6PHIxCXp9WJr5B/EsRZTEiSmfR/6pPSW8JL90a1WyX2Lu3H
         uXZpGfxwf+FqLk1wMwlBr1sP98z6JvkuW1srU5qs/glfFZPu/BLusU+MXI0heroP7VmI
         hJDg==
X-Forwarded-Encrypted: i=1; AHgh+RqEWPwR8Ni5ZavDWIwXVVCMFgTuaQlC1D5I8dgu2ySXkvxeXZT+a99whsTz1CXcil6R4Xbp+XZvJvXs@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTvkk0UdA3alxRh1B5kG0JoFpda4FWxhRYMURceD0wiiyd0W3
	/JIk990ZxJQn5Mj3bpauTfTxvL7LaSQkcegHGWZ9CfE8bnzDQuUXBdsvpcfSzg==
X-Gm-Gg: AR+sD11G2sFFtEDqnbB2IgqLJ91uei6povLD17rHSBr5b+h8TolbjPNXZy8CZC7e7uO
	LK8/kYvn/dfaXRPMLGUqQV12ww0uTxthBsFn1H9lWaKXtMSLsUhnuyGjlsKGGx+0kkAkgpy8c2F
	2eglUUcaakhjHQY/3IZJjpvqdghxttQC3IHZ7bFHohzAuZ+hAamoe1HqFoY5KmH5flUp0OFdJEA
	hZsMgHl7MBIDe+DQDwzALoqWp60PCgJWoqB6zoYOmtL6OOoxoCozogijSRWzVpQG/KtEK+aHnxz
	bZfXl8Xh/hKw/mDdadTeCRiQrBz7ZiDN6//xhNiYwGb7Vt3AyqysGdZrevFIKGNBP6ebj7Pm9p4
	8GHUJ7bKuVpt3b0TOQJZy1iGfR0wCQTQ1vN1komRIuL8RMx6NmTqtvFIddlmB8oJsz9FBrSfrXI
	RmnmTdauHZlLlXikIXnmFaA5lQWleBsUK1NerHFHMuHMBAFNdKmfDGkJMmvI9D3/uEm8e7x3gRi
	94iuP1RMS1psHOKrmHxduIhjmHd/eKavt+k/DRs
X-Received: by 2002:a05:6a00:12c7:b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84ebc425d21mr3954345b3a.76.1785459901336;
        Thu, 30 Jul 2026 18:05:01 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5e30a41sm17865b3a.58.2026.07.30.18.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 18:05:00 -0700 (PDT)
Message-ID: <6c5b44c6-f06d-4f4c-b014-5a06601454ab@gmail.com>
Date: Fri, 31 Jul 2026 09:04:57 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260727091833.750051-1-cwweng.linux@gmail.com>
 <20260727091833.750051-3-cwweng.linux@gmail.com>
 <f698ec65-1677-45fa-bb05-34aa8e092100@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <f698ec65-1677-45fa-bb05-34aa8e092100@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Mark Brown 於 2026/7/30 下午 11:11 寫道:
> On Mon, Jul 27, 2026 at 05:18:33PM +0800, Chi-Wen Weng wrote:
>
>> Add SPI controller driver support for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
>> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
>> +				    const struct spi_mem_op *op)
>> +{
>> +	if (op->dummy.nbytes) {
>> +		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
>> +					   SPI_MEM_DATA_IN);
>> +		ret = nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
>> +		if (ret)
>> +			goto out_deassert_cs;
>> +	}
> I would expect dummy data to be an output rather than an input, we don't
> want the lines left floating?  There's a similar thing below when
> setting up the dummy xfer.

Hi Mark,

Thanks for pointing this out.

You are right. The dummy phase should be driven as an output rather than 
leaving the data lines in input mode.

I will update the direct spi-mem path to use SPI_MEM_DATA_OUT for the 
dummy phase. I will also fix the generic transfer path so that spi-mem 
dummy transfers remain output transfers instead of switching the lines 
to input.

Best regards,
Chi-Wen


