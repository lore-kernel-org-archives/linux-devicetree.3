Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797180;
	b=YrGAzltPyQCrZyxOt4MFc3WxyVjTEWuQX2AE7KiGxssmWvaNtg5zbRnazOJJzyPDaNpo
	 GjzCz8pRpzVvsxttafPg23185oa198sViw0gI1hTJx9KZ7PzWKTuchD0rVQNFjunUn5WT
	 YMy4apZJkTzrkAkhajv3mCHRnnaoNhAAtfFY0Aj9Uo8Onxr5+cSKXMpOyYfOW178tOzRT
	 ergg7T/iqWEqck65TKvSRoKuZTllH9MVoF8bl4Zx10aaF08V9+ilOFpSxqZ8mF7wvDrYk
	 V3sTaivS/4gEaU3khWm9diI82DBgb/fl/OKHdApWvhMwlxrwWN4Byu1vRgVkL7YK/MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
	b=qdj+srezvwAptf/SKWULIsfnzidjld42OuiGjtrkO2u5aBFf/eToqJiwoxlaDr0gFVKP
	 psnWmPn54DLgBJKy9QXrjd//c7RQHefcqEHgFcYDAdrUvDS3gcpytmbYQX60qe38s/7Es
	 UJQhA5vSQvR9D1n8eCf8pYSrt1QUX47LMB02hbZeFZvvjSz1nvojigNzf/ZXL7KJyh5jd
	 yiAHhQQoS/0VIOQuBvPUOdX13yHrFICgIY04lzHg5fdrDneUKfjGdrLQOQvHMlgljgYJz
	 LSbGvs3Lne828/CPLtGPCR/knwJZ7h526umsV3r92Rfb1s7do2ik5bnXMFbhY5M+iMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0OV/R8N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B8606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0OV/R8N
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9497a167a6aso1065013185a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797179; cv=none;
        d=google.com; s=arc-20260327;
        b=EVUTASERayvewZnsZVm5bE9PDlBN6qn1fJH5Y5k1Z8Y1faRDrokW0/K74aqiL6p8T1
         SxeMxGFtoO3H2bhme57OYyQYGawCnRc+7+Qum75kV5vkPzsqSJ7Y6LrWX+v8dCv0FKor
         DSFz28uE3+cZoFLpQ4VIHL02zgRNNrWeNNfKv8TcEch41/nT4IsC4zp1jIRuYjKHY8ho
         6K++npj72sUMMkuX4OEUFFiUXEgcgu+Eu5BRruugsVPlpVVT9qG/9aMTnJSnifA4PbMF
         DNcGpMJ28Fo+E6lnn3MCiZKQOM3xGLyGV/Wj6KIOrnVoQ38ZLuhYOLdTzMoCImjNl8yS
         oJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        fh=rOhe1mIONE/UVDeFDPJ5iEnzwiYKG0TAKIHtggZ9dHM=;
        b=p1K48bQJocin+c0SfuYaCePijWJiP4tJ0VjtJMkCyh3cbzkMmR/OJh/s3ZI+j/ZaPy
         tR1jRS9y8QST2SYDVkKaatzV9I/2xbJvkIZp+e1zwtTzXflfcJPNnDlCUtLUaZVQ5l79
         x0CCtb6i3g2I4nPUNszD7l3CcIsRT1zn0hERcLJpD0akFmAMFrMaSl8FtSC3/XniL9az
         o+1F8KCiFTE3fIZ3nNNVjyBUf95i9NGznEWEUuggTqGIg5Ic5ltKn2jxjTdsqmq9Hb98
         pxUUiIaA1FDpVV4vmfgFgBGSgoz25N/GDWlFEfuhDS3UMbRi6ZfjdXLf04j7uK61VzQ1
         0zeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797179; x=1796401979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=R0OV/R8N3BVXXKY1j0aTwOiPavF7AId5koBfS3gHaU4jEr5HoP+Tj640rwdSzLgRXH
         CGvg2hqLOF9uvz+3E5CeSvTj3enmbqX+80sdsC35Zd7qOQo+aGoPD10v5P1GRogm6G8t
         SmBwu0rJxJRYkL0DIta9tRVhidpGkA7hnA3xNd4BY/X9OQ4C6SCSxLW+Mjdj89Br4mTx
         WRngpZCi2qvPMoFP3fI+CtwSkMcv4e8jOvO2SlpMmWE2HLkrx5kGzmbg+muJAYWduDSB
         UJoBL0pXIs27FYQQEEXDxE6N5YTsacs8zFatD3SuAWjcsNLfNJ3jCy9LLMzfXNd31Khx
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797179; x=1796401979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=SQZ2tBrcD3LTuw+HAP3/Mnmlpjxn/viGdcfzRIt0d37qGMgE7HejygT7rTpnLYzLyw
         rcAK/SRU4QbZGNX41fkO5d2DE1/BaLWwMXlnfWIqFAgSeRmkma4YXOeIMaG7qE+wKJEO
         hzMkfFaHAUJ0O8i6P5Z/3RFGap3nBXKdmMNAbDPHmAafy9rz5FEObFRcLCe5HT3KIkq8
         7UN99YfWgYRskIo5QaX29/Gy0wyjg6D7hOSNb4E0Dv34/rnyrHxHeDg3jK7LshTMRjDW
         qmlVsRB1P1J0PQ7NWI0aL1w78xAxLcO0sFhH2iPEv8Rd/5If2UJYUXMg0s8oeiloLXE6
         H4ww==
X-Forwarded-Encrypted: i=1; AL+hErHWKpPMlb1cfw5NwOMzDbfRCn75gk89Vt++hAxrImwu/mbB3nXtU3UiyzuhV+rHGiEgZ7ti+cigIG2i@vger.kernel.org
X-Gm-Message-State: APuU4Z9u1NLbJ+o3QwXzrTZ0azXcAf9ZATpuLvs437W7tRyzgXT2mP8v
	ZZ0BYqH0OoYOcJN8WgIOQ1WJsPSGYMlNgqu6Q2Ew++VT2nyt2KkRt+oaJfo4C9zaYSxKmzAg+rf
	5hr0U7bJ9NC0JiDdr4Y7Ggdh1wH6aXKs=
X-Gm-Gg: AZFdTZcP7Z2ME50zN9URPChx8lW5Yi7N2Ba24bIap5BI9xAwu7LBE0tWBs28HalpCGN
	bJ6GoAFD59sPBq9W1wuXHCzcANYv7MK2bJXpy4qzDf4wvcMkZD80pC8krZwPuengmJEOgqbnNuR
	xcESBxdX4b4oTpoV9VjCrAol5pH24TigfEwhKoAocd4fZTUjD36pnaisgsCaPcix6bkH97MeLG+
	LSavizXrPXH4N+fVbYdcRFcD6IYsrz7ucjhWbAn97epxIwB6dRpQUBtUcdMhYOv72gF8U+WX1je
	CVo5fZAMIyQalzBuuzVUN6NYJ62KPfgcwm9p3slieVbmqN8FtWKICkMgbb0+kn8RIPv9l0VeV4y
	qsDiC0HOiB5F4wYaQeOLyg7NroQTxHmuMK5SjHsm9DjVF1unWYjAOr00l8B1vjZGhmY4=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id
 af79cd13be357-949b35ac8d5mr4672679685a.18.1795797179191; Fri, 27 Nov 2026
 08:32:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com> <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
In-Reply-To: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:32:48 +0700
X-Gm-Features: Aa3M54rpV9JJE-D1PefPa0XgKPQ9lDOZXhSn9zQqqor1iBHttCk79es3V0AufT8
Message-ID: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the suggestion. Splitting this into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes (noting the
dependencies on the sensor series) makes a lot of sense.

For the gcc-msm8953 change, I will drop the board-specific reference and
update the commit message to explain the basis for using P_GPLL0 with a
divider of 8 (including comparison with similar Qualcomm GCC drivers like
gcc-msm8939.c and verification on MSM8953 hardware).

I'll re-spin with these adjustments.

Best regards,
Hikmah


Pada Jum, 27 Nov 2026 pukul 23.14 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> > cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> > MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> > devicetree updates.
> >
> > Changes in v5:
> > - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
> >    entries in drivers/media/i2c/Kconfig.
> > - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
> >    ov12a10 driver patch to preserve per-commit bisectability, and add
> >    MAINTAINERS entries for both bindings and drivers.
> > - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
> >    v4l2_subdev_cleanup() in the probe error unwind path, update the active
> >    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
> >    post-powerdown delay when reset_gpio is absent, and match the initial
> >    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> > - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
> >    child node under `&rpm_requests`.
> > - Include base-commit metadata via git format-patch --base.
> >
> > Hikmah Gumelar (7):
> >    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
> >    media: dt-bindings: media: i2c: add Samsung S5K5E8
> >    media: i2c: add s5k5e8 image sensor driver
> >    media: dt-bindings: media: i2c: add OmniVision OV12A10
> >    media: i2c: add ov12a10 image sensor driver
> >    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
> >    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
> I recommend breaking up your patches in three separate series.
>
> 1. s5k5e8
> 2. ov12a10
> 3. SoC depends
>
> with #3 depending on #1 and #2. As is you need people to pick up patches
> individually within a series which is always tougher.
>
> ---
> bod



-- 
Best regards,
Hikmah Gumelar
