Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614904;
	b=k4TSMzrTIe/54UYg33mEs8kYHHF6V3mkzJ/gSIS1hqDMAVX4NzAN1qHGf33CKGfAHjpS
	 4G6n/lRfHY9eBXNurFFOIFul+XqAuaBnIQZQzziHgFiSEDqdYVmofKilEqFipeMSRMoSB
	 vegAMCPEjgST77T4zAy11zkTcAyK2/Lewk1juDJlF1Bz+LQZnsv2Ym/qfhpyAGNm43LOq
	 MfmVojXrnUEVkRlDZs+YTt4D9JoF08sGYbdabCgwrKGa5PiCY7sfeAuyGNUV0LU7+75eG
	 g/x0nK5UuqnVnr8NF5vJ3gt0E9l1u5Za8fc8T6G557zDM4bUKp4tPzCLA3qRD3bs9bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=;
	b=hhOiIyD/pGGTcGVJifDlUsXaYfdUr5V2XbfjwiFivDLFg4BWXVWT3CwFdxkbnM6OTSET
	 0mre3WhZ4PN4uVTawnA0GiUp2LO9ZHYmRBO2BfLgE993x6idua5ChgTpYKbXSXKf1pvAF
	 j2xd6Tw4dC76XkL/iYmGF6XD/Y0Whs2GIjdXB1nQwEfGFYUe1VYkbsM3GBBWW985khX2Z
	 SF8GpUso1IE+6m45FT0MmK7wKbnr07/V8BeGkVgu+In21YLo1wdF8Xdy3lTTVxK3NRRqe
	 bv86L8Rmokv9SQ739zs8Mj78Jy8zWRjyKRNhAA0ZEhCSSWvKMTnja/uaj+n/ujE1JzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AP2C8OHG;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C6606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AP2C8OHG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so57553785e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795614903; x=1796219703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=;
        b=AP2C8OHGOl0DwkmI5Sp2NUj7zGMD39QQo6CwIEJJPM4DnRxUp9DuhQO+kVMWFqX1eW
         8ouMbFbawn0PB4Whn4akvv6M6cFSkVu2LSD7vl+5Kglbs2aHR8iKOmwOOqBSwKhcQucu
         XN1OX6tmqEHc+qyZM7KKhUhKpKCDIk22QX2iiFx5BlkVzv3f4Xcmn9lRfxmDtpH/ZEQI
         uvjJ9vHWIq1ytBPHXzwYockTaWaLwH0nB0hfvcclFww2HPmVUZJhiLybtT+ZjU6IMsX9
         C4IAvrEJPrn6n/TdFeD85cmg+WNo29CCk/L3LrBIQv453qWeD61l/d5bHXA30/PsGkgt
         UFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614903; x=1796219703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdlCDf2dlFxOjylVGdoM/KhHearUI/+HreUvx630OTI=;
        b=KShB/3oyb4x8vmDiT3vceq4+GJIS6yE8aOvjUK17zuzHT9pvhMgW2lkddu8ZHG0kqL
         pGMcwQrmhBb8c4OSUml2B73OnOcYoMxEj0luamHQHwk+3MEDPUgJsTdXurVyzXW+SjsV
         24JR/JWLsEJsteaOnrr4cjtBlTw4tXxIpgelPa06y6dhfxo1iw/AnnJjQWB6KAuXzaI5
         ZEXGFjxYnl1OwGw+i60Wei/X+KHNav0m9vT8rtnGHaKLCaT+5CgDjX8G8FQPsv2CNb+S
         It73pxoMxw/APVAg0r3VQW+HCL7eGbjQWcTxp5Tg0up09Cqs6zHxgrITBOhlDFXw5UYP
         JxMQ==
X-Forwarded-Encrypted: i=1; AL+hErFL1HccduqMbDV5CLyhkBsUx/qwYOVliniHkXti7eeJ6LpWx4zhxilkQd7LWkRijazTuIcnXwJ0Dj+8@vger.kernel.org
X-Gm-Message-State: APuU4Z8v95jErj377lxmWoosRqFWbp9Rw6ilfYl69IObt4+6AhRwtONz
	pU38bAgx3UYKnaVkJuITmENYGKG6yRqHlJR6jKlQBs9WjK4WjcoKGLY+C+XPU9eebpM=
X-Gm-Gg: AZFdTZdVqX2Ia6Z42SUfm7d++Ilp0UTR1JZTsPqrd+NqedmKyhSss8W553/P7XSS6Fo
	6+4qWisQ24oEMBRzT/e4kjxko97OWOfULaWZxoo2TMWAKRQV/ujDDFuq3npkKKEvReWamkJLYWk
	hINqFklpnGArevNyb5qkHabJa0CcXbTTVrxJERgCp+vovZaCnyTolFW9IgTegi+OjbUtqrcPNmc
	fv+yMUyPN0Ch3bqfaLlJN0k3G3yosJLtkQXfP92M51TJd0hysAf1e51RJiNIiFmqVwbkWvu1lZV
	uMF2CAwItsBr3SyBdFvSdcv2Wb+2HbO+BvhUsjSX+IAE+SwwcKxNCnkdHs2IWIS1XYuPqANDPii
	3v6SDMND+dCa+XNLsS3wFHdl5WwaV8eYgy4FbzFGj7QX6nWu+Bhxl91en/UNynkXEHu51EZ9yYi
	TJ8W7ouGI/fIAitVSH+z77ec1CJO/TTde+RceSh6h11ciOTb+Y/f8RpLGufZ0T2X1FS48ZeAgx1
	AileUleIZWTzX4W08SiQcEwb7BuzP7+pyJsWNjtQ8i7A/Zm0AR7QS1EzDlGScTTwpEVC6S6PRLu
	VNa2ESfv89yK9k48K/nshVF0jd4d7ktomg/Rm5zQo/3TFSBDdQnJdPcT6WohzaljsNgB4irC+Z4
	PfeaEg4Kgmmg=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr359907805e9.0.1795614902892;
        Wed, 25 Nov 2026 05:55:02 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm515864135e9.5.2026.11.25.05.55.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:55:02 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: fabrice.gasnier@foss.st.com
Cc: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature sensor calibration
Date: Wed, 25 Nov 2026 14:55:00 +0100
Message-ID: <20261125135500.5306-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
References: <20261124202220.23721-1-gerard@teslabs.com> <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/25/26 13:56, Fabrice Gasnier wrote:
> The DT is deprecated and are going to be removed [1].
>
> [1] https://lore.kernel.org/linux-arm-kernel/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/
>
> So I'm not sure the dt-bindings update is useful.

Hi Fabrice,

Thanks, I wasn't aware of the removal. I'll drop the dtsi patch then.

The binding itself stays, as it covers the STM32MP1 ADCs too, and it is
used outside Linux: PebbleOS describes the STM32H747 with it, so the
temperature sensor calibration cells would still be useful there. Would
you be fine taking patch 1 alone? If so I'll send a v2 with just the
binding.

Best regards,
Gerard
