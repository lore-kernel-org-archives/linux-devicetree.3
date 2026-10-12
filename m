Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05A4A0F05
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821069; cv=none; b=dLNlVEABmaIwJ1YJ/r2RKF+7I9wXD9QKdNr3JTQvJmeDsl68TxApShe4pyoEExSKu3QtqScF5caNsmxy26044IWXrrYS/WqmTFfv6/UVSErui3AygbVQ1XMGjKrGJsM4sJArdqMOZ5Tsk7grMn6jzIWhRRWgx0cmI5W1h5GCi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821069; c=relaxed/simple;
	bh=PFwuJYxYbHzYOrQGOqQkjsM9gJQq3amLZPRqzWlEQi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHbp/z8Ao5USP9Ur01edW+msIWETYkK1oi4PZKMRep1FpQuFXoJt9J2saRHLS35s6ewkHSHnSHrWMRddzkqZDrhLa3kzQfQFE3UoPJMTOBJMqEKvHLaKoZbmgQCtW60f/zKexVpvQzMO0AKZZxUXBnuEZoy5NbaowGb5682zbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=vE3Q4HI4; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="vE3Q4HI4"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92ed3993c1eso124897885a.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791821067; x=1792425867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBZy9CvLpjRJHFxBiFOyI0eAdKUiKTp4IxBeE2T+R8A=;
        b=vE3Q4HI4J4ZBwkg5y5yup3ZGtFQhVKftlEXVVQrlwiNrGk+QJGPnq24/TcJwXywlnR
         9CJ2HKtyZpr8G1EG89E7Zd33Ypo5RuB7ze8qhugJqXl6zwBrh1jeTOHZynoFgR4ke6IZ
         9hDtUlcK59JK1NrSW/kiCvs8Ebj26YYSwVaSpjhhtFl9NStdfQ3pVkK5bJQi5320/Vsd
         MpSLxc3H1H5+oxjk53MgGcmuJSp71ch5oFeZZFnLlstKAkRSsAqLzmPQH1heqx5Zj5aw
         JWi6vN7u0Koqr5GsRYcSGJdL1/FzqZS2478ucsZnICcpheKwWpC0qjoGRUZyhiPewUOz
         44qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821067; x=1792425867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBZy9CvLpjRJHFxBiFOyI0eAdKUiKTp4IxBeE2T+R8A=;
        b=qksH+S4V7hm4yVpljCenZFJd0+mkTuY5oVgyq6WqEvZyGv6YKuVdm3rWV2Mxrark6d
         v2BrnOrQKO9vUnCVOH81EP4KZ7zMEHXSXUf1uSjZZguur6yo47mEnJDXEhuahPkrFeP5
         VIw18+7szmc4C5lgdWHxGgWK8wI0UsHP4J6KJlpRZDJI2UCIyB0T79PIC9fm0BsoPUmG
         lmbltXuhGXcuf9Q1EF+MT251PFAhOgqpJ8nRp5NVK+ysKJPWiq63jjS6ZejN1elUB30n
         z9faBntZH/G2hFZylrFfbx/C6Ey0gL7rzJSbSJd6uPM2z4q+x/lC8Q0Ad2PPm2WxVi50
         x3Jg==
X-Forwarded-Encrypted: i=1; AKwUvBycbJlCCcqyn8HHASLURXn4q10tITCyM2mleQUf3kBWxkSVIkg/dtVoNbXP0o1NjY8IZbnBMbgBDw3y@vger.kernel.org
X-Gm-Message-State: AFq9FYKs5yyl+WIUEsZBjuppEtIeYRP2H/iKSETMcWScDemQpsS2HIPz
	j4bQNKEnK8+bohsTgF0uYZV4X7FZiLLh4uu60snAXsRdmoG5x1a8EUs0odgvymZDRKM=
X-Gm-Gg: AYBFou0gqUqt9YUCqxW4TywXFS4keG3oLt2sR/R/3N8+mXMrfrxH6HYg9+DVrN+cxGZ
	O68wkx09S+Ym5OT5nit1gKRZ28/CFDZI3TvZSqXC+iouirPr8M6Q4AsuX2vfuwFZI0WmU4V+5Rf
	pQ4PFNxmxGOkE0X20lz9r9XYzUwkQaepTTxciA5R/UrCu/nHshMCYhOPIr7RpBWwW5xXxsaNJ5m
	3Zn99MN9Yurud5ZbJdMQqAkRRJYPwItsn7ZemYHtqSYImtxtyf4kY70fWHP0NVFo3P2LZoiGc87
	tI6Wa/B0c+fYChLJ/O4tzy7PgjGUhQSRORS1f3Q3UfwPlVqJy9j+1QLJfg8linJ8/PaSKm8ksUo
	6vd0cT27KyjdiJtUWH1Fn44z2OgVO3JVubfs1t3CpxWmhmmB8FduK5kBzZC5lk199s02fmLQ3mT
	p/5ekQW2Z+3o87xSMatFrXWbpscmkHX+5ZU013DKAGCzNHi5sTAITMd0NMEsKX9tQDSmJU7u+M
X-Received: by 2002:a05:620a:2715:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93ebd211041mr1501700385a.20.1791821066523;
        Mon, 12 Oct 2026 09:04:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bce2c5sm928636d6.36.2026.10.12.09.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:04:24 -0700 (PDT)
Message-ID: <27c7ce19-e05b-4c48-8670-01329196970c@riscstar.com>
Date: Mon, 12 Oct 2026 11:04:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-5-elder@riscstar.com>
 <a8e6e9b7-ca66-4969-bc34-99df34058af0@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a8e6e9b7-ca66-4969-bc34-99df34058af0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:02 AM, Konrad Dybcio wrote:
> On 10/12/26 5:24 PM, Alex Elder wrote:
>> The clock controller within the TC9564 SoC is accessed via a PCI
>> endpoint bus through BAR 4 of the first embedded PCIe function.
>> A syscon node is created to provide access to a range of memory
>> that is used by the clock controller and shared with other devices.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
> 
> [...]
> 
>> +&pcie_s1b5d0f0_bar4_bus {
>> +	syscon@0 {
>> +		compatible = "syscon", "simple-mfd";
>> +		reg = <0x0 0x2000>;
>> +
>> +		tc9564_clock0: clock-controller {
>> +			compatible = "toshiba,tc9564-clock";
>> +			clocks = <&tc9564_xo_board>;
>> +			#clock-cells = <1>;
>> +		};
>> +	};
> 
> It's the same file - just put the node under the ep-bus definition

OK.  I was just trying to avoid very deep indentation.  I
saw this practice in at least one other place in Qualcomm
devicetree files, but I'll do as you say in version 4 of
this series.

Thank you.

					-Alex
> 
> Konrad

