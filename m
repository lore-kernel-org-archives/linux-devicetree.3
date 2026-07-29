Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0643DA3C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316006; cv=none; b=tT8oOp1wR2L9O3dBXoM3C8jQD0r7B0zSTW97vsGjHbPPiZJ0EQLZYDBretQ54e8I2O0oV4xM6wmERJC06/B5czJ9n0FYt5hhpP5fr3snYxnqmgkq1Bjk/86NLQVv8f9Q+xBB0QdPqzxVWrm0s0+fnUWwDrdEufWcWbtUlAcE+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316006; c=relaxed/simple;
	bh=Tj2A7G3xOugsZdpTkzC7PSnEnC2yGvZhcunhbg8M3xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzzXf0yhzgnz3+Xt6/KZUUt7MHl+Xfz4Q6OuFajYwKwt8NI0+eZQa9E21bt0i/UhnCxszCOwoIRF6myS9A/JE/kEVgIzQKZPpPueSZUGEVqDum5CXlSRjXk6zjhkZfzNCmMKwJypXGMjfFBZIKxDK1wbvl1k31EMw/XLQ59Nt8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GBbSHl+p; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GBbSHl+p"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197eaaab00so106037866b.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785316002; x=1785920802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ErTA5SmPrm2LDng6tlFDy5jDtcI+zchVNjeWFoCdYk=;
        b=GBbSHl+pS9ZsQi4PCOgA5QMbzkHSkkrmDAzFVu4Ilqa4uS01z1LrCc109Kb/9gAgue
         sloX7ZrnFL5oo7BYjIqjeek9KeY0wRlDm+cQy7yRzovRoKZkomdNgG0nVmH6CDL7fQjG
         mTjc8vbUJ75Ps4B3vAn4WPP5MUBvya8Em0CBzenH+g5AJte0gNdUgCkSbJ4pbB7gQuw6
         gD116gQe3HSvhbBSgW1vDz6ErWMRr7+wsub367V1ifTc2cGIUi3GAxRYMi7/rkyf65O3
         U+GB7431TytddnqnGuK52Ey1dWl+XamypOuinjxS2efQKFw5qYiiDmsEUoWNoqoY12rE
         Awrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316002; x=1785920802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ErTA5SmPrm2LDng6tlFDy5jDtcI+zchVNjeWFoCdYk=;
        b=A400V1TuCA/kaSTKZrKmh5NtFmvI17UNRaoTh8xNz7iHb+ZGNl8/QzJa3XD8YGva3l
         bq20Ebzku1JqVsI1bmJkMvCTrTiX41ELgTi9o6ZHZBstgqLSEUFc9Mtbffl1DiMLGgOW
         SPfmAGgepFJavnmbsyw6cLQucNv8T7JSaNxWZNvz/sKih6Ng7nKauMSos+lkOaNEGjFZ
         m1sj9PZ/bTFk6xPHiWKjPZJhrJ51bbtY/fI13AtmKdm4p6ogim0163Yhu9Y46ofMwtIp
         JvmYezdpDWF/nZlsYwTOPoFPO3b0dqU8bpcr0kC4LfLnYzTRbC1MnhUXklY4XSqxrUVY
         npOA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzu0GJX2BD6tqAciBSGLkYXDBFR1BK38DDH5ZUDJeEP3vK94C6lDQmZKeBW/f8e6hYpkT5TXlxIV41@vger.kernel.org
X-Gm-Message-State: AOJu0YwEN4gTbPb3PfBzSVNFbQ0mHTWW0uKD6/LEu7xn39YRTiIFoMz6
	7KMDLIDUC+wFNz3K8WiYw5e6JmpWWdC/2Qr9g2gu9h8L8FhKzBanOxjHLA6jMIxIuP0=
X-Gm-Gg: AR+sD10ynOp43vKPcP4VTwpRbWUKM1RjjyNNIAHGQaZ5vtYOnUOMeJn/grBd0r+tEZS
	XecfeVuY8RdIhvmtA0G6rqu8fppDTWOsRUJBVdQmIVYmp5m1gSOfe+mDQC/aLyFusOKfZ1J0Xvy
	p2sf1/eMWDDzkdFnf3NWi8fxReDb1mbS7FwiobJfidCNVil7qvf4WVwTq3TsX+1/fFe1VBGebM0
	4b8ZYwwf0azwfk2PeDeiJEvnkmIz4YMmVKO3Mt0gPm0rrMYk0gSkh92s5G+7XEUV5UUCCqoL0Rm
	p/W3A0oJXCoe6kfzzSGKXtZ207zq7Cd0XowMQDWpeQZznsTSkB4KIJxNlGuojs4t8RcU5rQJ5L5
	RuQTOruxuVKIS7hycC9AXfPYTwXzjnuJYi69+AdOaP/ZOEbTpRPso5f8bFkMsic9pwyvbuxjrUc
	gwlM2194B4lKNLZ0RaYUG+wCWIw7iyoNVDZJLfCYm95I+xrQM15NcZopdyQC9siGiYJePg1g==
X-Received: by 2002:a17:906:f599:b0:c16:12ff:dc8b with SMTP id a640c23a62f3a-c1f72216e04mr326056966b.54.1785316002175;
        Wed, 29 Jul 2026 02:06:42 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83ce1649sm86953066b.21.2026.07.29.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:06:40 -0700 (PDT)
Message-ID: <53d0bd5e-60c0-40ce-83e0-c123d191a72b@linaro.org>
Date: Wed, 29 Jul 2026 10:06:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
 <20260729-uptight-proficient-whippet-1a4aa8@quoll>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260729-uptight-proficient-whippet-1a4aa8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2026 07:25, Krzysztof Kozlowski wrote:
> On Tue, Jul 28, 2026 at 10:35:36AM +0100, Bryan O'Donoghue wrote:
>> Moving the csiphy to peer nodes means making the current supplies optional.
> 
> There is no move here, thus this change is incomplete.
> 
> Best regards,
> Krzysztof
> 

Hmm, I've obviously missed a comment from you.

Sorry about that.

---
bod
