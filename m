Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6903B9D9A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326918; cv=none; b=GFYoRlLCauwPAvxUQ/rGduDmVlmhNFdlJOuAC6UTlSNmb38e5Nb+mouyQbwy1YExcypZUkajmio0ANIGfVemslYcYpvBNHfHUbrsH/8nvNmmoyCpDK2bfYc4fz8C1+xEU8BjETCvgJoZB5iI27l/7OIOaP8XXlMCxY9nT/5rH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326918; c=relaxed/simple;
	bh=Lr2GTmMh9wuduPyUMz9X0KgTMet0vw72GnJfELBArNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLMmzyep5QoEjm+QkLNChWnVIO+WmhSteCT+1Lvr3AeZD9mFbW6QBcE9bKI8/5QfasyMP8Z5cxO5uZ1ah9OYw3cpAGxWm3NK6/Wzc285pCIYEIH5RPvebtMJmCk7Io4hJuU+RQ6+JDaSF5HzK3440sZHBgQV8bQ2avGO1tV1kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLKR+Pzu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLKR+Pzu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954df200ddso3539335e9.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784326915; x=1784931715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yScwpwmBKpfi8wj0lw4TvJs3n46Ct7Tg5oNtfrudcZw=;
        b=aLKR+Pzucg1kq1Kx3SClA53HYqOmXoSQyJ7bCAqSeJGleJyiGay5+OWbRM+gEpeL/J
         B3c4Sv7len9ti3nisfJM+UgXrktrxOUFVwOWl3P+9H3e59RF9AtgNhSDwNNzJg8VYQem
         mv5Mp7PN8IQLRlzpAh4FUZQ12GAnzNqLUftDepDgCU+ZAxKQdIYrro3zejTE4vNbhAVN
         gr0qXySOkL8j12/DlE0ZMIkmDqKgVvJ+xWEsWvCy75qcVQuEftIoFtpObxo8FSPld9+0
         cETBuco38qeW2XxcmP9lA0axs5NvjOByLcsZ4a9CeVcOFqTsf4rV8+o2f38D+FB2dNvF
         2JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326915; x=1784931715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yScwpwmBKpfi8wj0lw4TvJs3n46Ct7Tg5oNtfrudcZw=;
        b=AYL/KOYiIGFw2hU06kaz9lXurUm2Ms4MC4MBR0LOSjuy+TXUTwgAS8Kc8xSL1p/V7q
         6CYp4NKvGHXisFMPpuqpZ4+WnSTmJX4fI3TljinacklKvtipkIepTbQ6bjTEP3V7/3CS
         Ywf6yV+pAHX7wvkwDlXRWowPFTIHKf/ccw4mQm/kHNec5r2eLSv91pXq3C1tme68st9T
         tgNlNZQLD6Ey27NzzB7sxYcwWQgEUd0KOX+PLEiKmzuUIgYEHHXyaUikkk8C8VCOKnV9
         gFz07YG6NC8aLZkyKT/OU+4p549amEzNQoNslbkH+C2pBwNcA48MBAQlKENEmtxA11Ia
         sJxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgQzSa6cUkSbNLwv9ufawcQYt/w+2kMT1BNyhkALzWb/Pq4TimowQWu8Fo4RQc+Pj83PYMMLQLl9DW@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRqC0GZvCPadFG4OdAmMNGH8XuiPSXIXj3CPXChS51MTXgY9/
	wUX6ecxMY5Jh8qBc3Gvlz2acVhq550IbtMmXsEaKnvrW2OD3YGDiGexAAjjO5M+WSJQ=
X-Gm-Gg: AfdE7cnlkPRS41Mx7rriwVJBxxrmTrfbTgX5WevACmhZ/+Mbc3CPo547P8HtMEpBQci
	40fCX7nuAUM68JX3OYsRH9n99x/SV6yKW+8lEoUKSnhSLyOdJj6V0sbyxbRVoOvX2MQmNIaJbjn
	Gn6aBfJWeETd5TcNTSTOy5p7PYPD9ElgZOl26QM8lV11FqtXdyztUS+EkevQBF9VbRAVipz0ega
	Pi0YOWhjnaGaNi5GisXiAUa6g3UMykPt6bpIBAISQeJh0nxLEjlSg9ycsPYHKSlSOLzD099ixW8
	4Ia+qhG7MHduKy3Qa0vIA0x0BQPv1NVlflfW9uvLnmJwJw5JGpp5UBxx6hBy0jx6ZzpaAYyK2x5
	8lLr+Lz7h+3gfpFspvWU09LlYV070Jq2s9xyNoN7/k56IhGM5bN6rYfGr0dAsXxewi9LrAjvcwn
	DNJHnCWk++rkws1v8yF5ZwxVYc
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr45458575e9.28.1784326915351;
        Fri, 17 Jul 2026 15:21:55 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.30.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm52586385e9.0.2026.07.17.15.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 15:21:54 -0700 (PDT)
Message-ID: <eed3783f-86fc-44df-9709-ed717fdf0819@linaro.org>
Date: Fri, 17 Jul 2026 23:21:52 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
 <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org> <alfzEnd10K2kPjwp@baldur>
 <alqn705VnocjAGbW@baldur>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <alqn705VnocjAGbW@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 23:16, Bjorn Andersson wrote:
>>> For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding
> It doesn't say anywhere that I merged the csi2-phy nodes, above
> ty-letter states that I merged the camcc patch.

Ah camcc - my mistake I really thought you'd pulled in the WIP stuff for 
CSIPHY etc.

Thanks for checking.

---
bod
