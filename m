Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC51302CD5
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141594; cv=none; b=QuU7mxiss+bsEV015nhntcQjdyPX7fzK/KRLII6iFFPmZI9b68F8Bkc68pyFFc9YRuGg3BLcvlNpQQXFCvw9ZLczMZFe74/J7dGf1UNhJbbnrs7yHQ1G88cxAV7ACeVQtRTren5vu9xeK0JjLif8XGHdIOR2kt8JtE9rLaFlQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141594; c=relaxed/simple;
	bh=pClFKjIWZQ1zZVeTOv9fsiA7SSfT3UZ9//G9B6WjWFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkwyaRLCdVrUI6mZpMMuijk1KetyWeNwcZSafasrdaLtYFm/hBiqM7AH21FZpHYhKhELp2kcTR2nMGxbL2wF1nTeZHXgRYniB7Hct02oqimqE94FeRMgw9f/RdjSVh28i0X8DSXQso6oB2j2GGBRdb8Kjt0Ks95+jGm5eqNfDLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFAp756H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFAp756H"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48909558b3aso29890365e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779141591; x=1779746391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+V9ld2nee8ACYFa7NLoWrrJwhU2JSDigOdRdNnPmeM8=;
        b=OFAp756Hy8Qt7JLliRlr/2KvaQMyhDtw3GLm91oUwCRsOKhmful8ENdlf34OJ0QjCG
         Dkz/rx60jE/OWEh9lHMKBoRSd9LPKPAvK5Swv4sFeY/TDhx5+Hb4u2eerd36r/eukZJV
         5X6U3hVCUEsLl57yVdXfUQ3TisrEhb7boWJu+O69UaIY1NDYVZR0zU5XdAHgSMW1eMCO
         wPj/XkqrDSpNBdv/PRR+p2HW6IXA9lziTXZ2rVXm80+fdS+QmseERM4Zm2ZZaToRqGUy
         i00S1QKnb91VumcMIgYUQppTBkZTUsh4h4BwT67iMDzidEZAGse/Tywclgt9RbxUBDR6
         czrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141591; x=1779746391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V9ld2nee8ACYFa7NLoWrrJwhU2JSDigOdRdNnPmeM8=;
        b=OibfjGOalO8Q/scKUXMr3z8F/7vBRXf+xQfAhKWAyAx8XmKxRzXfNptOlxk46Myzgm
         dFVTZ6whzJQZHvF73PeWdr+drMwOj1YuR+XAgsKdsEcyeY5K0ZLg1whY0k2rk0xkoPu8
         cp6pa0yHHwO+1n8KVv98SZKuvZnyVuTF36GpYxVumokIsqXmOcMWv1NUTs952jD5vIOY
         YamJI11sTMGoUxXKPafGYkp6NDxjXUvt1a/hVQ1K7/BYGbPWPE5t0BvBTpbrNgTaPvhq
         1lEgSoM2yAjrlMjP51xZymli0GdkX857Y7dTUgWsdo8NEfVrg3HOPfwctH8yvRCTMjM+
         ZeQw==
X-Forwarded-Encrypted: i=1; AFNElJ/ugDVuJDR9Amb0uoxvQiSsAzgjtSiZSe3+eAlrjOR3vKHrdIcc5DbNbtZFRepV8TNkLDImHsT+with@vger.kernel.org
X-Gm-Message-State: AOJu0YwZevpp9ofar2eK5QZSn2D1o3jK/lLhZFKGf0qnykMwJs8O+Cqr
	omjo1WNbcoX5leeluRRCy5ks6QBpQxMOd5qCV7qcCPIO+j1sZYARnGTSUByGK7EPWuQ=
X-Gm-Gg: Acq92OHUP24ZQUTV5+23K4HzAhCpl8srUI4dNTawzmTtVfcCLQHnmNemZiH5O5pNJBT
	hFhbfxXxazetSyVWCHoSEw2FdObrJM5IIlxVJQVg+ALVHCMS8dikw42beERQQCRCrm3atAW8Wys
	rN5KWGWUlsdfClxnqJ14ACemX/0pyl8wkC2GGjzM6Iplx5baMn0M8RFU0LZB/4EhmlXy1x8TgyR
	etjfBWWHZ4CbHayaA5WCg/d6f6v2KG/WKhnycY2vtYYQsgpghx5cY89+U/KPKvjECDGwhkDoBPA
	cAPRXmPqfXPNfXafm2xq9FUGy9EAIvkBZj6s1geJFvY8OhuryBaDRWlvwm5Sm8ZvyEsCs5JWtDd
	McgXbPKVsOKiv+bzY51e4WFjYAdUXmxzQMLRbab8CAVxKP4p31FVhxNmRMxaq0aVNJOOjydrZij
	xPLoML6+UeJyAQZE4QoMa0IRIOW9uZmz2m
X-Received: by 2002:a05:600c:198d:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48fe60e552cmr296639285e9.9.1779141591184;
        Mon, 18 May 2026 14:59:51 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm488709605e9.6.2026.05.18.14.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 14:59:50 -0700 (PDT)
Message-ID: <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
Date: Mon, 18 May 2026 22:59:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2026 21:22, taygoth wrote:
> Power Delivery is not implemented. The PMI8998 PDPHY block at offset
> 0x1700 is register-identical to PM8150B and could be wired through
> the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
> negotiation becomes a requirement.

So in this case why not implement your code as a new instance of of 
type-c phy in the existing TCPM driver ?

---
bod
