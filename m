Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226642F532F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 00:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112126; cv=none; b=uao0F/yUpNdZUgvF5aAmPnlXThP+LJBfQAOjonENHs16y4cd5HZzsWvhqUENSQitmhag0yiN0BoUR2ySvfTXGJ/sb6WZcZiBnMEnJzo7TxK9SiSXTgwqDlTswg+nxBG1aF691t2hQnixiZGNPuGufxLk0GgK6gHIcsoqQc9tiZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112126; c=relaxed/simple;
	bh=hh8xym4JQgXHNzgZxH22Nfrp1ofGYWiJboNIC3qrWEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/vQPZtdPvohrX/oV+UG/+CWOMufmdSPY1k5s2aikcwRB8ZwYIYm/gmTtBEbBcNoQPk93araSOKhcktG3paRgwFzQjcf3v9z3jWT6Hr+VApjicqj52HJS1kyI4BM0yAcZ4tYceyYpZgTzah3bo8mr150p0FU0OM8LKfZVPvlKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffr9yJa4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffr9yJa4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89edb9bc666so682763b3a.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112124; x=1792716924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=ffr9yJa4Ylyc5r1jcrxJTU8I3u1E/Mt4QU9l3pMIVXMIkrcXG+aPiERrOutIXp/+wB
         21TAs/yestfK88VmOm01QZk8prwgTo9yZbFpWpTs2VbLyjqgFh008C6yV/YLnGjiALzC
         nhPnAX34291O3WL8L+/5x5vsjDb2cyrZWmUZ4b6YRk2ulNp8GzdyU1PbRIGdsFZg2jmE
         B4Ge9qxO+igLHzXM57gb1L75aJCPUUllcpZfCMrnetO4wpzLzc6LWtetkqzFMpOR/Yhh
         5Sb+MnldKquKkLN3WjC1Z2he85WasGZjD1wk8z7xxf5iF86dxB5ToM6JGP2I7IRX+a2t
         CA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112124; x=1792716924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyHDwGXyjmNBTugltzNjIAs8HpIjTxQ9m7AkCFTAf3o=;
        b=IdhwQUd8UmWZbbgBs7wyUURQWV+1keSkB02+eYTfG4plhU0knu4qQ8yBki7YCZlTPl
         PJWyXaNKe+ojkfwu82OcRzr7ULFHWTNR+CeYTNFLNLs5WHsAL29XAzBrAC3O0qd2xFzs
         08/Ea+FJD1gyPh3nUzcZKtopWoAC+KVhgaalvVvd13h5MdpaGKRXH3fFVeNoP1WwcbJ9
         xgLU2sS+XXYqFNBj0l2497fnTXIw9k95Kc1kZX/7Jon6H18SUnO/hnkQyK2BYw2CRdkS
         +YNzl2ebyH71JfCRaMl7sr9I8C/KyNdXlIih0BBBjmINk9JhNCJygM0CFneUlv5pjRd4
         sj3g==
X-Forwarded-Encrypted: i=1; AKwUvBz2Euq8fwmuCQ9k9w3UfJQS0zm+M64tGkAHh/QQrIqtLC/s7I7xKUv8qxgpwn2zGmA2m2DRTvA5PIif@vger.kernel.org
X-Gm-Message-State: AFq9FYI6Q87PYoUn7+oI1G0jTO1ymgUQKaFDP31AmFn8dyGyReWE96Si
	VEJZoCkhBNp40vZSkWZTzZ5957uAA0veoB6utFBkfDIdVEHRObALotd+
X-Gm-Gg: AYBFou0MxldBmOGdYo1/D7RIW1ohT1FlLmV9C/AgUgYwmFUNfd8XTN5jYyyStSkI4Lo
	EcTexaXdzSxGR6g+jXD78ykqCch/Mz3CT/sNNSQ6HSPDgxfxdKqb5GynRZiJKBStqGpOf/68U9F
	gagshnHn4wDT+sPmLC4saVZl8/hTSNIurzFIfyBqvrs84fyci1k+c2sLFEO8PqidX/120SR2yVh
	V7N0v1arTw/TwejyR6HBflPDGj7oPLCcPp3CF+rNi0EMnwnVJelqp0/OeuhIX2efrz/P1NZS3Wv
	H7JYvok9UnwGx9cvk4ymgwNbUvNPEfHXE65B6EgoVhMu6TG5X0H8RFRQIjx4a1Z2PWsaq4b8XvI
	7hsZ5Nm98KhVWL4K4eh5qbCVGRqbCFNeeJwhpC8rWyKqxtUACh6+4UxraCqHHcbZEOaH/8Ygrs6
	373e2IMD8GRbFi7GPnUc+e2I/DTchIBThKqKMpY6mlQ8OthFVDZjiLU1//pBeT9Y8MePca0F3Ns
	8hFGWTyh2l6ma8MeiOYSRDxGAKClhV4PUKlj4MOiUVbnA==
X-Received: by 2002:a05:6a00:f04:b0:892:a8f1:c53d with SMTP id d2e1a72fcca58-897c76e25a4mr19506420b3a.22.1792112124477;
        Thu, 15 Oct 2026 17:55:24 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58416a5fsm311339b3a.60.2026.10.15.17.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:55:22 -0700 (PDT)
Message-ID: <b30445d5-c5be-485d-a935-8b574a7aedea@gmail.com>
Date: Fri, 16 Oct 2026 08:55:16 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
 <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andi,

Thanks for your review.

I reviewed the Sashiko AI report and will address two findings in v12:
- Disable the dedicated IRQ during transfer state initialization to
prevent the IRQ handler from accessing partially initialized state.
- Clear the wake-up control register if `enable_irq_wake()` fails.

For the other findings, I have provided the relevant hardware and
driver design rationale in my inline replies.

I will send v12 with these changes.

Thanks,
Zi-Yu

Andi Shyti 於 2026/10/14 下午 06:29 寫道:
> Hi Zi-Yi,
> 
> On Thu, Oct 01, 2026 at 03:51:00PM +0800, Zi-Yu Chen wrote:
>> Add I2C support for Nuvoton MA35D1 SoC.
>> The controller supports standard, fast and fast-plus modes,
>> and provides controller/target functionality.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> 
> to me the patch is fine. Sashiko has pointed out a few things
> that require device knowledge. Are those concerns valid?
> 
> Thanks,
> Andi

