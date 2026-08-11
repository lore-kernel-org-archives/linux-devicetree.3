Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4E299920
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422774; cv=none; b=gKR2yyJmd1lwzfB0cww1Vg8kq3NDE5FVe0bhQ2PTEQ1tEUyoJyxMuVTff5DfeI946pO/e9F0fXOMJJYSZ5oBGsaJJTWGU1y0PnCfFYKxpuSaSC/ToqCHlTaVdBlN1DHbdqi+jJvATk8yhlLDWYFUAp0ue14xB9DXhpmYUffEksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422774; c=relaxed/simple;
	bh=fJmU+BIwJkrdiLINGSNpueASUlZY1S3BdHncMRZDVgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQwvDwiRTCm24afZLbHEs4vFWGy8ozc2s3D+kiIYi9/wq0yMidnw5O5miWSCtthQ34NIRcigVLaiKiXVhtBP+tVMKyrU7E5WOub8fwe7uRr4uknm2FaJpNPr7/2WTs3tUGkoXbQ0d+kfZ8+Rd6JVUq33S42+l1S4DRScjyQgvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqDk/kHM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqDk/kHM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f633e6058so2106917f8f.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422771; x=1787027571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=MqDk/kHMTP5D7zgVlfvttc6Mqka0uuA5mJNIjnDcWLghQRgUKUi1Ik8+LM4YJtXSI/
         kGFyikur818OYAyr1HI+XEczQXwmdGED48AdO9WC/AI99dBcJ5zlHQhAzyX5BFimml9z
         7vwFQZeBe60LEGHjuXh8GvSNFCe+/mpqyyr66yP/2+x8ULTM6vHJ9GtbYgj4MvaLjQP+
         qPIe0ckvCK51H6PVu2upSUo7Vc8XdCCtPl4FszM/3avS4QxFCqoFHP1AQL+7d2JszyRP
         tN+bCT8LfSoriys+tkml8vWCOS+SFMMdOGS7IiQRgrMw9RgeDfjtZYXDTL7+pQPYQezb
         u6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422771; x=1787027571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=m8JHQxYjQfkhYnqUrHV/Ev+wSfEWny2t2J5powmKYT/Y+uHpfXRGsd3QxmICIp3J/D
         0yW6yY64jquXYgFKtcbgfWnkfxCD+MoAiZarS184MUqdqoZ9ilc6sUG5LQZvMko/5R/P
         kc4hpzVV+E/Cvt4jiZRmkytpNZwLdL7cYfHfneqF62TxDBhI6xx1s0MwbC6iB73GDJoD
         SZLgGx9gWOVEzKKTvUp0TTg8saqtathQ1SKDn4vmMXfOkirTpmCNC5cvNqbZRhtgETfe
         00q+vZpIR2Y7Gg1VCtDlHl8ZuvPz14tG+rANTkuNASK/t6i4f39faesWix5XCn0qutd3
         8aJA==
X-Forwarded-Encrypted: i=1; AHgh+RqkacRyGy/ecsJmZo2aqcIQiW76vFvNGoa1nBs/nS74Y2qAT3MPDfTnuruyaixdOFSrKCTol5HA2yxH@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9Z1OIBbL6IYdDEvppxADhnySRQEKzed0GpdZ/ov+xVpTnCaq
	TbwAe/4R9cStJnkdmyoPW0JAQvRwQU6XEXAnn3OvpewSXCtaYRltMTqq
X-Gm-Gg: AR+sD12pHGAETgbTFa7SDySNVoxi/MblQ4dUnbh+KRqH3WqB+SlKN4lHzxhO8HPjO1R
	wMC1/Lx6kn5houwWXvXxssM+C9PRP1hhePV64ggwctn1+0edz9lheJzwFf6mooJAWZ7IXtppTEv
	OBqMf2QSHsK5GSVoBvo4AYHLa6EcZ8BLtGPSrec5uNHdtC/wRK1bxMK2tW0Q2XncSIkjdWYp6VZ
	NQsxd5uE6Xqu7u+g7yyWBGPrbEXpqTtcoPoe2qW57/Jimwd8ZwXRv3jwEjBCP/Q30wvxbMBcLZ6
	x6uQhj/bTVG8VayodQc7Vs3hRHkpxZCCOA5Ix6wvfqQOevgZN+kxYZYmWTL6OkKhFyxkl/sYhRf
	Fw5gODpJwgnED2wanhhQe9O5C1Q7fNf/gWRJi+zbwv9QHT5kIelXw5pghfLD9ty5LsEtsFjMynC
	bUu6Lk3sGGDvK1FeRFSbOo7SVH8xPckmBIhda1Jr7cEwWElTP+nAVIDCcMSwWvcXz4
X-Received: by 2002:a05:6000:4a19:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-4814adc3281mr627184f8f.15.1786422770569;
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Received: from [192.168.0.104] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a6b2ea8sm1050589f8f.16.2026.08.10.21.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Message-ID: <71c1a0e4-73f5-4c22-a443-731be59d0d99@gmail.com>
Date: Tue, 11 Aug 2026 07:32:48 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 phone-devel@vger.kernel.org
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
 <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/5/26 9:41 PM, David Heidelberg wrote:
> On 05/07/2026 12:30, Erikas Bitovtas wrote:
>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>> in 2021. Add initial device tree for SM7125 Samsung platform with
>> support for:
>> - Framebuffer
>> - GPIO keys
>> - Hall sensor
>> - Vibrator
>> - Regulators
>> - Reset input
>> - Real-time clock
>> - SD card
>> - UFS
>> - USB
>>
>> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
>>   .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++
>> ++++++++++
>>   4 files changed, 578 insertions(+)
>>
> 
> Nice,
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> 
> small nitpick, the Copyright inside the files should be yours, at least
> unless you giving up your contributions or you been paid by LF ;-) .
> 
I replaced LF copyright with mine in v3.
I found this patch series from a developer who preferred to stay
pseudonymous. They were licensed under GPLv2, and I got in touch with
the developer and they permitted me to claim ownership for these patches.
https://github.com/map220v/sm7125-mainline/blob/a72q-6.10/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> David

