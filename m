Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25433F2100
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658875; cv=none; b=EICOTQnOu6AfzvIKjuQMG0Xa6p0MFCWZTcvuA1Q0AhN04nOqS2AUpjqf3f/kgdfYxlt2Icgv9nfrg8HV07xiNboatmHpKjcG1ZEWT94GJ38GWmWKu21QNC+H45PkDXVXNzBsZnFYMhQB5HC0WckXvzvrivTDgZoecrPno4Pd608=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658875; c=relaxed/simple;
	bh=eynylHZFBsXgEqVs+4fseQrXK93kdKB/9Os3we6Deik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAC0Oxi1LwkltXY6hL2WigjbeaxnkDfxEQWo4tgVecjLHlkUfBilo87NRwMRW508BYYDhT8drAhxlYOKIjBH5UB6hgehiOX1/Dp+Jp6+6Y8GyxGu9Lwtu6jKQ3Xhh5yZEH2VpgqBil5x1REJ8TFVBvaO9zuWaJneZILwruCRS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=G7l+WI78; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="G7l+WI78"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50e63771eb0so20494851cf.3
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777658871; x=1778263671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7l6FEvqkNwJ0g7Pn9F7zooR8PbKdP3FdX90Rm3Ztm8=;
        b=G7l+WI787dWOE2tuWa3pxOfVBIYDqnB2m5j6wtTcxdKJGenYim/0DQ7lc1rQAGN38R
         egZGidDVax5FzICC7e6oByuAVxtIc43hobHgPS6WF9qrrLDMcPiscPYRYItZAdR95oq/
         3F8mrn+s6cyh8RxBW2qKlMbk9rQzufBK2taQ4JyRAwVLRhWdNOMAaOjfeNiViFLqGwjH
         KoJUY3jNnKDwN7H7sNIRSGtV0okc2Lvj4rIyMJm7ht42K8oWrCz1ueaD6d5EWEqgOVxa
         QmZjJghsojHblT2joTbvV8bouomEpeQwLsAMHIzNap0chIQy8QEu5w+5oOtX4L0IrXhy
         1VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658871; x=1778263671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7l6FEvqkNwJ0g7Pn9F7zooR8PbKdP3FdX90Rm3Ztm8=;
        b=bnRYevUoO3cYhtqPJdHQigkCKmtnq89Cp0lOvZOHsbgOIIArHPCCgBG0VOc56upXs8
         d0b18q3L59Pk6NN6yGMH1LPlvxHJLQowfeEXET8CcJvQaom/8P3gnYJe/KAvjWq9dUWj
         UMHgveIVBqME30O9heCpVWn3cQfaoSCHYWazX2+gSGVp2hSyYD3vNaqEitMN8Uv77D5h
         CPBpjn9vydBWmw/OylFONvYSKUwM3vvApGqH6iLoMRt4Qhe6Z9nxkx/whjS6icDhgXLD
         4+Z8Fily4RyFnJkQ0JKTn7T+zs1SalKdEBxwURvlFb7ziqCIY0mVayaKEKLZZekIg1u2
         nKWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QoOVtMDpAMus0IVM2XvkzM3nun9KYom6zxkFS8zoHy2tlNyP+H9NANHpqu1gl444NcfKEnRuX1iEv@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUjhwRTBv9YcxWucE4sWe9xwYKOuf1oGSQgjTylTIOb0mib5A
	naHC9ZZ92dJBpypTpX5xKYf2jpVO88r+/wgDmqmEXRqberEtCbtJNxqcELzFhL6MSXs=
X-Gm-Gg: AeBDieutzf3DIIwZUwpBFkgRhDsk/SL0KX2QHrqvW4wzzX+HtS8Jc/6iOsj2s5zIKVk
	qR30c4te64Fx/P43bWB+0IFGQv29u7dSD0/dHQ9bBAU9EtVBjp3ehBHTM767MkG7xY7qZu1njTK
	l8TWgdgXhgNgX+aDoTrb+3EwpxUQuxJ1L/1DXxNTESmBG5w4uoRBqHc+jJ48OlcJbR1Qosoiv5l
	7Mz50254K1tMU7ifKF8TLh8BDexupjK5WA1IbkPvyAW0aDlAD3q87OmOVaUYa7dJ71kEOaLRweL
	68GLJc9eFFoBoYYFkAX4AAfBT0hxHOKf1Vhv2SWZq2/Hj3jJwXzsO0JqbCRoh8MYIrMMqgPUclX
	mvZVJ1/VKtirzGyYSKdNapmCQHJpINjyR23e4XhH+EGIb3Tjik5WLjV9nHWj88Si6idNEXMX+sH
	HQ3rgp0qD7oEb86QPSXDdLVSOfD7LgSMUh30ovflVTaLfqUdRXTnoTlsjL1n446jvtVr+CtVG0T
	wiqwYEFhFaw
X-Received: by 2002:a05:622a:903:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5104be231f4mr4182581cf.19.1777658871298;
        Fri, 01 May 2026 11:07:51 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b80a4dsm20498971cf.24.2026.05.01.11.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 11:07:50 -0700 (PDT)
Message-ID: <f60cc448-99d1-4fcc-bdbe-436b0c29d5eb@riscstar.com>
Date: Fri, 1 May 2026 13:07:47 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode
 for 10G-baseR capable PCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 11:50 AM, Andrew Lunn wrote:
>> +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
>> +{
>> +	int mdio_stat2, ret;
>> +
>> +	switch (an_mode) {
>> +	case DW_AN_C37_SGMII:
>> +	case DW_AN_C37_1000BASEX:
>> +	case DW_2500BASEX:
>> +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
>> +		if (mdio_stat2 < 0)
>> +			return mdio_stat2;
>> +
>> +		/*
>> +		 * If this XPCS supports 10Gbase-R then it will be the default
>> +		 * which prevents 1000base-X and slower from working correctly.
> 
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.
> 
> Anybody got access to the databook and erratas?
> 
> 	Andrew

I have the same question.  We do not (currently/yet?) have access
to this information.

					-Alex
