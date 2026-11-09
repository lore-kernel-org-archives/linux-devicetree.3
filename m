Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213426;
	b=FSDdraiNhii0wfXtz1lsU+dx98WvXLil8T4Te1NABJot1qTLAjlf0pf63TGuco7cWhTz
	 fnUxRDWF328NVMgXhXkbxRvundIZz9GMl8SmH+q53wuufrM6rFihlXwVBjOZfnV1OJzIi
	 txFsE+XPcJIagToINi5NUL/mXnHVkKli9WDpIzZ0NL2+nNoIB9Am4Z5oR60E+7mL9FNcn
	 3NXoI4l2dtCQGmQzdZPBrFd+PQHOByFTyDHUml+Zc9tlNnsr8D3ezdjUtVTXeKeCC3+Il
	 gCAtTE+NI98okSPrvxIRXsfqFsX+0mwpaInbfecZmtfpI3LfGJ2Q//N5eRc3yks9F0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
	b=gFFwlqfdMFPKH9nsDhWEVypgifk9RdNhGTn+9V2dIjZ7k8jwdtIAm67edJkjOyMs6c7X
	 vsZeyQORoIFO7WLMPyYZZzUB6j44V22QrNGtzf6vBwmmkXhSQITgMr3NupRxTD6/C6IHA
	 y1laYOBj4/PdOEslrQUy9VSG1/9k/zD0sFXRJb3f+rnZWc6HzuUPES1KKIbAnW4tmB2Ae
	 TG+xhL6GxDYkM3a+/sYiggtR351G7L9c8X3CQRpdkXuzwFWB2eizAV5+tqVahXUMk+1GT
	 gTHFNmNvHkibi3dL4gE6WPShayJDBAXal7uLiQspj5hC/GHoO3GYgg/Qe8uMQK98fqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCF606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCCF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e4831c028so651643f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794213422; x=1794818222; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tzw6RxrqPja/r0l06MJeWiJ0A320QfCoAEQXFBZDyLMfOvcyVsNFSavVL2KeLrAjtd
         Iyy6sj0S3bd1T5cU7P3PvJaphryRjt4v6pqH94tBoCn9qqAdNj+FMMjaIhujpqNpdtha
         qPBGznQGAgMxY/hF4fXcXaCc9KTd9o2HvRfXlP+lfEQjxj7pkmweN1pWIS6Jk16O5q70
         oaXCHBTtKa+EAa8zwwwPq4eaJPiEKpkACrZvRz2jVQMN4H+Jb/kMxFDAcRxY2oydMRnd
         BvQqw9tBC51SFrUfgTtifHxsfqOIaNzro98P7eV+L6u+hjSAxHgCTVsDhAB2FSd6m3ra
         YcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213422; x=1794818222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=MxGt2cjXIuj9Bpi+N1mE/zsjyM5mcbS9AjmhVIGpoa+Iz2aw+BOnWX0I/5wWUDwUtA
         UJ9qOHjJdsx1TY2+OT6oBjfE3Z8LbdGJWLiWHeMkkNhBPPpZW8y3PGVlNh18rQZ6o86e
         dB0I907Sw5dO4FRGFJvLefrZn6G44o+ofwRH4UGToM0yOM6uVa5A8m/4nQQEkRuCXTV6
         3uAP0ssCmPkJg9WwjhYuVz/xbRVDLzONS1tITeJEsFOGLp1h1traiM5BfCkTws7ffSPv
         TPSXIA7u07UzVSFXzWLY7jR2ilQQIH1/uJAY0l+9pmUikhO8wYkNXOY43a8sYqvPMXlz
         3cHg==
X-Forwarded-Encrypted: i=1; AL+hErFf1D4Y8TVjGx1PNVxUWsb8FhW+RuzUOFxjeo+foO1GvcY0/WtufJZl8BbFPpUfWTK0VrZTo3MgC7xp@vger.kernel.org
X-Gm-Message-State: APuU4Z/kULN/5JkSuvA2EbZ7sMaQaVmdRZQqKNuFqgcPxdCIjDlqbq9Q
	OYfGl+bCNNULQxcpD3mkH7BtuaFRafRtjsG9hc0AxF4Slj+5Dodn0scJhZRvWsR5E48=
X-Gm-Gg: AYBFou1mVo4cleRwLgoI7m1h7/42zSCuhm+vYgImz0rdEB474Hk5qxWGFFVHHxDaoBv
	Y4g1E6TdyBURz5ot/tvHMxuFtY7m5pvjT5SbPbjONDplkYJWyx/yZwnfzbD9W3hp7Mo1HIy4aN9
	829No79tb8+M0c54j7PqpCBBhwux9kYMayeHpz8i/mmyqlJsB91A1RwDgi1eWIF6aog7mkmZTMw
	7so26KSuGRxxpec4iKvoN+J2lVu2wksGQqnOKpBFVpR4v9it9n39jy7NdSjwGSmGbPlvndZdZjR
	OAw3qfnPVRU4mfTjZeCZfQXxekoh/l3YSfA7RDTiKqnUpTWwg+PZuBKVo9YKtevrNpp121UO7h/
	hYm5thROiw5es2Cyo+9uYa91wlGzkEL/Bf7iEwf0yXKJQhdHOdG3YV9t18vK4BftEdtZ62XAyCS
	0p3ZHdB0WU2SOxAxYC083TBY4GrNwHgQbZ1J//TjvqGQ3hyHjkv3HTZbrI7OJzEXfqfB2j+LlFX
	EeN1PM4lPtr7av6KiPAZkkJDryC1Rj4ZFwXxYB7vNs/NgPI5vNznQu4aDm1NuoftQ/C4YI1kQO9
	q+tvwL+DiG+W0gOHEme1D9nRTNxXNbWJ/IvSGZzsk4YOs+RN
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5896344f8f.49.1794213422144;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm8320547f8f.7.2026.11.09.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan
 Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
Date: Mon, 09 Nov 2026 09:37:00 +0100
Message-ID: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:

> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
>> The S7 firmware exposes clocks through SCMI, including sources needed
>> by the other clock controllers.
>> 
>> Define their identifiers so devicetree can reference these
>> firmware-provided clocks.
>
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?

There is no such document available unfortunately. I'm not sure one
exist to be honest. Those IDs have been stable ... so far, but sure,
a FW change could change them.

The IDs are totally made up, in the very same way the other
amlogic clock driver IDs are. Providers and consumer just need a common
reference to desginate clocks, this is it.

>
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

If you think it is more appropriate to have them there, it is fine
by me.

Carlo if you have to respin with this particular change on the DT side,
feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..10d7caa5d1e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2026 BayLibre, SAS.
>> + */
>> +
>> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
>> +#define __AMLOGIC_S7_SCMI_CLKC_H
>> +
>> +#define CLKID_DDR_PHY_OSC			0
>> +#define CLKID_USB1_PLL_OSC			1
>> +#define CLKID_TOP_PLL_OSC			2
>> +#define CLKID_HDMI_PLL_OSC			3
>> +#define CLKID_USB0_PHY_PLL_OSC			4
>> +#define CLKID_USB1_PHY_PLL_OSC			5
>> +#define CLKID_USB0_PLL_OSC			6
>> +#define CLKID_ETH_PLL_OSC			7
>> +#define CLKID_ADC_PLL_OSC			8
>> +#define CLKID_CPU_CLK				9
>> +#define CLKID_DSU_CLK				10
>> +#define CLKID_GP1_PLL				11
>> +#define CLKID_ACLKM				12
>> +#define CLKID_PWM_G				13
>> +#define CLKID_PWM_H				14
>> +#define CLKID_PWM_I				15
>> +#define CLKID_PWM_J				16
>> +
>> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>> 
>> -- 
>> 2.56.0
>> 

-- 
Jerome
