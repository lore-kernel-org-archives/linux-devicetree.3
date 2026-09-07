Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F651E42B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800794; cv=none; b=GJAWTVhd48s/fPSNjgZDo+WNaCMN+bPncMKdabzgRSECD9PMo48PE9vdHoQeQmJjzjzvZ9hJpKFlQPo7cLtOJfG2jgGpiJMWrioi0nqK/WbF01K6Npnakj0Uuo+mJGQvJSigQE19RwnvZDj3UOCztDuYNC+NMpLfmuhLj0KJ920=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800794; c=relaxed/simple;
	bh=2PdNaUxKJRJi7RvykJFebnVsm1A6ub4hc2r/C24LJEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pIjYBhnzn0vFHfWXfAOGzY9F9OoFT8adDMYs7IlHhtS16+7qGKEQKqdBM+UDaOfcvwkTZRkbSoHxWk2WY5SckGejiJiH5N16Ht0XurkwpWhPxf/1BMBCe0/ogJV73N1WVFFn6nvwe1Q9/54NJpjpqq73fX+PWfHiymVDfr/i5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ryzerjPQ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ryzerjPQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60d5so27977266b.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788800791; x=1789405591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V74NNxb8dY/ytrLpD3Pf305hAIorNLqeiKPQE+X43xo=;
        b=ryzerjPQ+4RupQerUOzQXiW6l2bmiycZgLFBpRqW6pTyt8MG4lnEYTdkyEJx2blsBS
         T0EXeW9AxcAY5lpEYA66vLzeYoJJhEC05ej1XVV8LNI5kBBskTSLh0UYuG3Ao9FZN0kw
         QVu4xcFJVBvJwRVevW86Kbi8kj3MJm7qhzb7KXj/lsn4KO5uh2wnr4O3QX9WKcWP6CE0
         ralb8xk6Cclrlqrletlp6mgqOjuWHaaJ8it4sCmO5RymfRDRut9mYRhBSH1NqICZ/prJ
         v46vUhSObbhus5gp4SKNYcR3loND88KA55EKzzGGd2UAcanHp2+2v4juPV3or+HHJqk8
         QI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800791; x=1789405591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V74NNxb8dY/ytrLpD3Pf305hAIorNLqeiKPQE+X43xo=;
        b=WCe5Bi7mLrZnEjQ04DyAr9/gl9mjxwUP2t/rcZ/drPFknjhR/Xf5ef9NUOOE8kxtRz
         HjtXi5bi8OiopJqH1YBA0fLefycqJHps3wc4hI0dVgAvdKiGLtX/CDaYgp6gLhsc+E2A
         mK/i9SP0KKk2+kPftjlaVEa6QJWJkeJUoKPx/mgzvoa7PwDR789wM44Wp19nZ+FssZ4/
         X42WIyzC5vdrA9P0CavYYGs4loxoBZPAyHvTZaRDeDU799Fby5a7uji0jzA304QuLY8m
         d5g/NAcxIFP0QowUw4IKd5OE9tYt98aGF/y3LhryCxO2JyLgz88Nyy/e6AFAxb6lXLOj
         FLEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvKl7o/Ymg7bILQw8V3MnBCPF1kZSFV32Dvb4QhdUbuBFr0/N1nGful2NAAJdKXjDIFvGF9Pt5YtYt@vger.kernel.org
X-Gm-Message-State: AFuF++k6p1OT6GzHmkl0jVowC6Raz/6YpRnKULo1B6TBd2c0sBmJdsih
	xBj2iQdklLKfIAVI2zdXVWTA0TUArY0V5DabCLT1+5I4GO1fMxVP1YgbnFi8wTzWyH0=
X-Gm-Gg: AYBFou3pBPSPxDIZO+Rev8tvoyHEtBdB2VsJA5IWGZXs3U+bwwSkU7c74YilQP5XmvD
	Zo9QHw6v2DBCFyW/WFDlqSvkLB+ArUKrPVyxmgk0HIYDMtmbylIz5uQiS0WGFMMhC2pkquLtRTV
	RwGbzA4fjl+3HZ1z7JXDsg2BQ8RgtkULkz9R7ykXOtzO2TBLKzwpmBSj2E5VLM9542UFaPZMWwP
	+nPIX0hGXfogPVL2rCUCGfg711Px/ukEEZN9GOJflDcAaUd3ZYdi3la5splwWMOKgoZhV2UT0YI
	Q34+Vj82M1hRIpLuUXiNltzZTls8av6Ih941ajEeGtX65Xgi32XcWhkxzqNVNul5QntriX7ZOOp
	IGE7mO1jZbiqWvk3ssZpLwYN+S+Lio2baYhlP+5d1G9J1/k0C6O1d8UEqRktcE5mP/Nzt7Z9vsT
	/8agw05gli83IYJyPfZPB1XSlS/ibadB7IGp/umJH6C3TyZL45dh/ikJ9V4+LH+Q8YyEQJ3tWrw
	XqxnQ3dsrI9qQLwNQu59wiqyMl66umHpNRZ7vXUAiK7ZHfZCIQnpe+qbuCxcURLvvMAmeY8HUXy
	qVzStqYRh0Gf9dzLADRyUBEdzQ==
X-Received: by 2002:a17:907:179a:b0:c25:4ba1:594f with SMTP id a640c23a62f3a-c2903f8890emr88367166b.0.1788800790753;
        Mon, 07 Sep 2026 10:06:30 -0700 (PDT)
Received: from [192.168.3.32] (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm498003966b.6.2026.09.07.10.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 10:06:30 -0700 (PDT)
Message-ID: <4699bdf7-9093-412b-8844-c2a48f9d6a5d@sartura.hr>
Date: Mon, 7 Sep 2026 19:06:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] phy: Add support for Airoha AN7583 USB PHY
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20260827131551.26725-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> This small series add support for Airoha USB PHY and Gen2 PCIe
> PHY.

Tested-by: Robert Marko <robert.marko@sartura.hr>

>
> Changes v3:
> - Fix broken patch for YAML patch
> - Split the YAML for USB and PCIe
> - Rework driver to direct node for PCIe PHY
>
> Changes v2:
> - Add Documentation
> - Out of RFC
> - Rework to Serdes PHY instead of SCU (following
>    for consistency AN7581 implementation)
>    Link: https://lore.kernel.org/all/20260811124724.702467-1-ansuelsmth@gmail.com/
>
> Christian Marangi (3):
>    dt-bindings: phy: airoha: Document support for AN7583 USB PHY
>    dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
>    phy: airoha: Add support for Airoha AN7583 USB PHY
>
>   .../phy/airoha,an7583-pcie-gen2-phy.yaml      |   63 +
>   .../bindings/phy/airoha,an7583-usb-phy.yaml   |  133 ++
>   drivers/phy/Kconfig                           |    1 +
>   drivers/phy/Makefile                          |    3 +-
>   drivers/phy/airoha/Kconfig                    |   11 +
>   drivers/phy/airoha/Makefile                   |    3 +
>   drivers/phy/airoha/phy-an7583-usb.c           | 2016 +++++++++++++++++
>   7 files changed, 2229 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
>   create mode 100644 drivers/phy/airoha/Kconfig
>   create mode 100644 drivers/phy/airoha/Makefile
>   create mode 100644 drivers/phy/airoha/phy-an7583-usb.c
>
