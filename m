Received: from mail-ej2-f29.google.com (mail-ej2-f29.google.com [74.125.228.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8648E0D2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720652; cv=none; b=gUJhr5Fr1pOCbovOOAZ3+DyJlZRxIo7vKAJX20eIPSrud9wxNPt0fHKWhkzYNKfmHOodpe2fP8qtQT0KH7zcs7WfR9ruS/syQyifOltTqj4xIAJQk/+kaNAvVCZez4ZwtDWcaQ76c67MpiFuCUV1UWEm6BNZjWPrEBJ1JBFPsdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720652; c=relaxed/simple;
	bh=Uxr4WVyD/DNS/detS6ug+v7NOvEjI5JJaJV4V+VWxsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am0IELLQjdqJ+e6HE3lYFiGf8zbohkyqCGFE+OGwLECfUReAMIrSdzirYS3qO31rmgyW7gHDghwg9CwyC+/wp3Fd1qqE2xdbjNNXcLbkfS7TJtUBPww7Rj8hrj8jqZiY8GlpinMbFZsQXJY7kPUoNQ6Y3chlEOX3agEhRpFGRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUyKAVm5; arc=none smtp.client-ip=74.125.228.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUyKAVm5"
Received: by mail-ej2-f29.google.com with SMTP id a640c23a62f3a-c294496989aso67110966b.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720648; x=1790325448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=sUyKAVm5UpfIhhx75ErJhS6MhdSrfjRXsde0yBrmtZLPEhSOoZwsTSeg2sPetwzmSS
         zFDuCjaOq2pfNyh0hC1OWHKqPxYyh5Jf53eCycmrOTuDBreFIljsoVmr98FFBpKBftkE
         dVPzK2Jg0MCAGFcU+cL7kYUvP5E3Re9QxSNA9+P/F4yo5GK53Up9tnhah2OpIna1ZYRX
         JthbQcFArVC/Pmnc+4ANRjvUekvp65CzP1/3xVZfjXTG85PrTvTmuv6Me7DfQYG3g1S+
         uXZKj+0eHTvrTYK0NSI0RAkp7P4GsNJNjunmdrh78Gw51scMd6otBM+8jYoCBR08b1yL
         qXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720648; x=1790325448;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsGHbbePiTbUM57NiqY/i+2M/82wdnf8yfJzQr85VmA=;
        b=wGB4Cq72chNLt72tWtMQfnfKvy3eZbo2eyoowVqqo35fMUeUfbN1ibA1xWW8Fyl+nv
         4mRUwQSqQchpX1whrNG46OGGYRkYNyo085yxXjPD2txu6vgMFLaYNZzIrwG3FC+0cXS1
         cPDKWJ9ADnIFJmp+TqX5ZV/JEdIfHtXNrXwLbB7EP/8tK03iGgkXSLKGfRvsNHhMxUJC
         lwIuDafkZt1S3gQMkA3OuYNkRKUqgLGLHE/rz5BPwbC2/aFW6+nvOQUqh4OHXibZ20uz
         oVxUlCiXZubEIrPz/IkS5QAxcRsWCmggziqbi7c8pc6Zpu/N9xYde8Q+8VF2AJwePGlt
         Uf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3xKW+ztcGP/coJcL8yyR8XdhUK3mbR8THuToo/wGfQsQj9FdqhworwO/5t+iX2Nq1DPm1kDPz49Nh@vger.kernel.org
X-Gm-Message-State: AFuF++nPkyeh+NuanZk0JlrjWgX0hf+I3opa1KQ0EGgKgmBLb7r1R29l
	yh7z9dIPGIg7cb2dehoBs1IExUIhFAIOK396zuimXVsuBS7kJJioTzPNkva1BwKtIZA=
X-Gm-Gg: AYBFou3CeBdxo5E9ZQQcYKd8Q4L4zT6K0L92w+sy7tofTNOlLxNYkCY6k25x0j4Ihyx
	m+GcIehID3cZQChYAbhEpNRaUtB1G77oA0pdYD+HmsCnCGWziFRzpWNTsOOqvQ3u78lmLvzovB5
	qw86ykMKZemGwwGaBz9i/NKEsVNLonMeFaE8Myo9VphDJ1756yJY3UOANqe+hh7IvCzVF0P9GWO
	fg8et0yUqqkr0fdaGFwCjkIEp7nC14ekx5R8vswqq0Thy6fNyms9QEmLDF2yfCYTsUakjF6Pt3A
	WGsQSlWwndHAYV/VDM1eN4G9HouoegZOS0JsQi63YSs7Ja/o3xVMxmwvpjjkRl0BC6rIkdVdWmC
	w4EYEh69sGFZesgPZsucsF+9UCZFOUCKgtRTiZXz8d/tZ3Te/pW/RSK0RbqeKnv0u9TKxDN8ct4
	6FC25PxRbXLddQxUUnXC9pVrhVGOxGsqXElfl6LkKn8JmPaG8yJROfU5M8xs/XrqWabsxpcACcm
	4PuD/LiRw==
X-Received: by 2002:a17:907:1c1b:b0:c25:62db:772b with SMTP id a640c23a62f3a-c2a15846850mr191330566b.7.1789720648074;
        Fri, 18 Sep 2026 01:37:28 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm32784166b.53.2026.09.18.01.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:37:27 -0700 (PDT)
Message-ID: <70284db7-a7d9-48a6-acdd-7a9850cdc7e4@linaro.org>
Date: Fri, 18 Sep 2026 09:37:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
To: Manivannan Sadhasivam <mani@kernel.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <cqoquu7hzclx54km763745dupaxahv7y4xbzq7vxg23isptgqz@j6los24mhnnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2026 02:36, Manivannan Sadhasivam wrote:
> Looks like you completely missed all my comments given in v17 :/
> 
> - Mani

oops so I did, my apologies Mani, I will take those in now.

---
bod
