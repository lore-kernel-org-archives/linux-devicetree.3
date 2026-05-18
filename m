Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126D8346E67
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101226; cv=none; b=UB3A6GpAWW50bLLFM5eNK0B9rTS3HNgFT9wuB9yiIGHz6maAx2YYsPOrJmfvZfYqRXlc77XUAlIK/0r0j2LZ5V8UBHt49teoNxyYDeQlQssEpo9ESz+UPLrIrU1qEuFOpm+Djc6dV6t3d9CQLNSas7FLoDQEV+LvpVmAnyevFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101226; c=relaxed/simple;
	bh=UukKI6xGzmfju1XPEjRWc04LcqZFDCcGbwR5vQmBgtM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OVdJJIT7ggQKiOXUJz7p5Gh64YG5V9Y+FYdZfANHlJhf2DGK6GqN7C5hO33i1ZDGyreFZZoVfpVdudH+jvCc1gVus6na7BdTqG8NRos83ni3Th8v/WHUV+/WQF00/DaqkAUv53C5xe0LtitTAPVBJWXI8jPLWS52JygyxqeHdps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t44721Cc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t44721Cc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so1496622f8f.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779101217; x=1779706017; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=t44721CctlGWpz4UQVtE9DWJinSMRTdzqhYrM1zugYh/prJ/gpxkEBbm2mO4OFIW6L
         4IfzSa0DxPiP0JHcMfyjSQvHkW9wgdNdqditXiYfx7ORUI2zFmjsJonVZ6WcXPfMPJMZ
         kcqUM0C0m2RWn6wfZ7aOB/TEcWmLNYfaatYiqO/Oun0fzPM9DAMFGotlLxzBINF8RpR/
         GVLFKjwOkKeYkY2annp8euADKm0rXoHu1O5PmE2LNcjNQOP5LmM2/714EvN2g/4CNi5+
         T3GuEb1yQTkN/xMynfxt7jQz3u5P5/o5oRz+P+Q3ASs0g5j55AV7HlgHO7XH4fBsJgTG
         TJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101217; x=1779706017;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=51UEAf2XGrgb3sTNi1xRNy5C5WRe9clSdlI0urQKEJI=;
        b=FXZ1H8LEW2X18Z7pl/PbiB9vuP5NNv39WENNS1ToB25bkEVJnUUEUnliMd7OGKJnlS
         u5S1pmj3ntHElTJjpCLIQYAwKOGsLyv4q/nGISzIi6RPdzsRYKtZQZu5bmutXqKlL4kn
         /AJsjzoPfcQwgPFfLZX3fxBmaz/Royw1ZSzcX9ViPnwqQRfMrVpRNcF29UA83P+Tv+zR
         EVsQ2eJY7K0IGAz10DC152eSe5QRQ1pQ4oEL9rQOnpBifBzY0ORkkYrKi4XJtnayQVl9
         0016VhpzB4g7h9T4X6L3b2/buTo/AF1yEyY7fFpJhUbnFFLdyvjIUw4r1VzvoQL2xFsS
         0Xdw==
X-Forwarded-Encrypted: i=1; AFNElJ+aRinLDPZFKEUF9lmWRMBaCBd+vHYOMG+4hpEL5wdYjW5GmBDAdzVaFk28vuriGVZ8KRWJMlJ3zAf5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv32J5vEamJAE2xk2UkeZF4oa9lkxCuzuT1o6lLakPUb9JQaM8
	2oh7h9fFf6Lv/c1CNjSOa18dk64LlZBrozrixaL0Sa3mIvLWoflz3sxBUCAEW3MqVNY=
X-Gm-Gg: Acq92OHWl//UtCyJJt/2Wk6M8WRxOiZJ+I0ktldbnikcVgTMt/w5PjnpSXtOdLdMpzT
	oF6M8dgDPC574+XtFoR6HeSJy2xFtOheAh3PbkkE30KREa0PyTG/cgldobXYoZ4oB0xbTa+TkzP
	PuqMNK1FTBrJxg+7Mx+je5dFm69ioA1lSresdz337Nd82F3RHAraCnnVmBj8zvEa8+b46ANn9Pp
	dKlb102mhfZjoJWQemqJsBfPjkLOvE1IgHVhsgvQeKkZn4SK4B3e00XCPEjXt6fDBwODoAudRtv
	oydmC92vhA7zEBcTAxQRxD0OpubI3ls9hJJxub7BUz8poUSWntrCwUiRh3I1UEtseyIjafLzxQ+
	s8f7W/5E3VHf4sfmOjrnAblzdO+CapDbVgWkFQ6M2jxShc2lIlf+ytDgWUQRtKCYT9DHa75Ruq0
	ukVUgDmpqo4qAmHvenbZOBGb/OPVSWI6vFl32T1nbUYxSKVL5WpYszjnEQk8Sjs9app0D8st9/4
	429Sx2aHGeRBkppHBbltiITU+LV
X-Received: by 2002:a5d:584f:0:b0:45d:484b:ec10 with SMTP id ffacd0b85a97d-45e5c5bbe5cmr22863944f8f.2.1779101217129;
        Mon, 18 May 2026 03:46:57 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm35777201f8f.30.2026.05.18.03.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 11:46:55 +0100
Message-Id: <DILQQVKC65OW.105KDQXOG4PN5@linaro.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org> <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
In-Reply-To: <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>

On Mon May 18, 2026 at 11:27 AM BST, Tudor Ambarus wrote:
>
>
> On 5/13/26 2:12 AM, Alexey Klimov wrote:
>> The Exynos850 SoC contains an APM co-processor. Communication
>> with this hardware block is established using the ACPM protocol,
>> which handles IPC messages for clocks, power, thermal management,
>> and PMIC control.
>>=20
>> Add the "samsung,exynos850-acpm-ipc" compatible string along with
>> its associated match data. This includes the specific initialisation
>
> s/initialisation/initialization=20

Why? Where is the error here?

Also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/doc-guide/contributing.rst?h=3Dv7.1-rc4#n176

"Both American and British English spellings are allowed within the
kernel documentation.  There is no need to fix one by replacing it with
the other."

Also looking at git log, plenty of _s_ spellings.

>> data base offset (which differs from the GS101 offset) and the
>> "exynos850-acpm-clk" device name required to properly instantiate
>> the clock provider.
>
> The patch looks alright. With what client did you test it, cpufreq?
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>=20

Thanks. As you might be aware this was tested with acpm-based tmu
and with dvfs/cpufreq both on e850-96. They are local changes here but I
can't send all of them in one go -- I need dependencies first.

Best regards,
Alexey
