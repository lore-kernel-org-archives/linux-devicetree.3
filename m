Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71753909A9
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209411; cv=none; b=mfKHgQ8+hILsMsWkQvrzgxbH51ZrQKG3rmtyrxM6qPHh/Xz2h7qHXcadRvy1LLsxDZEGnZ1DbMWbT9cPVEF3HEDMVf9kfZ07rSROc8CNagCksNjt/5zIc0UxgTBxC4HSUOw3+m+QNdI3ipPfvPwefqt98So8c9z5uRqABTzFMBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209411; c=relaxed/simple;
	bh=4mcXj8n21nn8IOpehKLpsbJ3K8jdzjXslOfmGaZD28U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6gOF375arZ4ZC6SnSxkm/iyVol6XUSij3HWjDXCG+sum/c/2FFRw5CIZn4zZFFzSks/uOPk5UpmQAWIpxXzaWejXSjZZ2BFhwsPoa1ZT4yIlE1Xn4oQuqgKgZ5kPr/Wz8LjnHdpU6sj7QF6wg2daDXIzLmFtNTfddm9X+61GoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvmx2sIt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvmx2sIt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so24566025e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209406; x=1775814206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5InlHETi+SIWgmcBrnKanh/RI7eCvH1urjB/VkUdx5Y=;
        b=lvmx2sItbCzf5zq/d8iaEK0u9Swmr98ak1Ydzhz/PQ9DuTJIh78H7O7RnKWS0wLEMy
         YvwaGO+5eJxXKElKCEGCgOl9udEzryi2iEgnIyYzF8Zr956hKc7Dk0wNcVjMsSfc60Iy
         xfwp/TGA3YTidaviVmGNItSJGhzGUGmuq0jkYpwSkpmdxplU+N/Tzys7m2700E3LYm2g
         cwMuV97gvrReUJkk36PzMrh6wixcqBF68mlkbZuCyLxK0f9kq6a3PeNwvBvwAsqie1uC
         +ivyPD1f4uYyqNdC6pnr+kytbv9sLsqouiUOX7Gk0Hnn4MmQ7lSV76jt5uzNYODNVoyr
         ROtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209406; x=1775814206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5InlHETi+SIWgmcBrnKanh/RI7eCvH1urjB/VkUdx5Y=;
        b=iDVPfa0fL8rF6nvH8wuVOIkX9BnLYzN0mGZ8U/OOXU7Z9aKUslXgsoWpLWXuugEzpn
         TEAmMNkIdKSgw283WXjCJmwhqEOsN67adL2QMHd2O4Qa2gQ1WFuvpLC+gcbI/bmWsO8N
         8KUoD5ZGjmB/k0K3O/kPmZih9oU+DpWsYoBEPHh5SFJRtOXEwxvsz4ZbpA/1RDPOTb22
         8kRTAFpnOiwWx82S6XQfNh9bdqrRVgvCVa8H/NM+Y/EWSahy+7/KrKo72q4Fm32BAnKn
         E4l6bFlsUMs5UrrcOhgrCPHVQpEZaAfe9hD4hEbChBlC/a9bQbnO9VEVHvwG8hiXUjSa
         orZw==
X-Forwarded-Encrypted: i=1; AJvYcCVxUv5jSXMRG2dBumTpF4HI1D9ntohxORjc3jTaBYNx+pxVUGAPydup+HdXlkAiTTfd4As1EuHoClda@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbvVuBci74BsqPaXxBh+FfY6LxzNE99iLACDk1UC6gZAjXWZH
	M65I4S4aqsZ3Wb+efW95NtUl8WN4eY3rDcvqtE1njke2ifP7z1r+5bkS
X-Gm-Gg: ATEYQzxfAF2eo3ciFJVjhVZIsitCcd+vWddt/jfhvYRUliCaqsdeiYDzAZ8vcU8y5K0
	6VjjUNvbpeUnAz6Pu8ye6mtlvvyjgfuGD7MAnSSKWhXACZ+i7C7gdK90cYlJdW+V8czWKNr4wrt
	fGlmUYs2JfpQZANazFfWI5tvMXcITDQuhLRVqQusEGfrfnstC4wyJ/QdNuSZSkOH56jutkUfZAu
	JEdHXMBfk9Pb4tGzu0TfpoXXFaY652frrnj4jLJKyalzVBMfpKrmmua47HkfvJOiLccAINo9R0n
	XMEFytP5aR8TLWb/qzRz+UiLEiQH8l/H/J+e59SnGIt+gEW5hjRk4HGhmj1hq2N+1cm76+DGSjG
	butBXqD9jCAjpNuA4Xh/BxHv48u7jra6Us73BMVtErR46JMcKhcWwyBKBUIXREuwStlSA8F5l5X
	kuCu2Q/nIoyAgR6I3TdNJhPlpotFRAlBQ8IHp6KXpSxzagCtaPBFxFcg1tOUKjdWCesKmdu1Y+D
	W8Rw2rfdQ==
X-Received: by 2002:a05:600c:4753:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-4889976eb60mr34158545e9.13.1775209406305;
        Fri, 03 Apr 2026 02:43:26 -0700 (PDT)
Received: from [10.1.4.108] (cust-east-par-46-193-119-166.cust.wifirst.net. [46.193.119.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897b8176fsm27664325e9.0.2026.04.03.02.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:43:26 -0700 (PDT)
Message-ID: <fe14415a-52fa-42cc-9e4c-e3876588d513@gmail.com>
Date: Fri, 3 Apr 2026 11:43:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: dsa: microchip: implement KSZ87xx Module 3
 low-loss cable errata
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fidelio Lawson <fidelio.lawson@exotec.com>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>
 <ab6a06c1-2d7d-4032-8d38-063470cd45c0@lunn.ch>
Content-Language: en-US
From: Fidelio LAWSON <lawson.fidelio@gmail.com>
In-Reply-To: <ab6a06c1-2d7d-4032-8d38-063470cd45c0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/26/26 13:18, Andrew Lunn wrote:
>> +	mutex_lock(&dev->alu_mutex);
>> +
>> +	ret = ksz_write8(dev, regs[REG_IND_CTRL_0], 0xA0);
>> +
>> +	if (!ret)
>> +		ret = ksz_write8(dev, 0x6F, indir_reg);
>> +
>> +	if (!ret)
>> +		ret = ksz_write8(dev, regs[REG_IND_BYTE], indir_val);
>> +
>> +	mutex_unlock(&dev->alu_mutex);
> 
> What address space are these registers in? Normally workarounds for a
> PHY would be in the PHY driver. But that assumes the registers are
> accessible from the PHY driver.
> 
> 	   Andrew

Hi Andrew,
These registers belong to the KSZ87xx switch address space, accessed 
through the switch’s indirect access mechanism. In particular, the 
offsets used here correspond to entries within the TABLE_LINK_MD_V 
indirect table of the KSZ8-family switches.

In the next revision I will switch to using ksz8_ind_write8(), and I 
will also replace the remaining magic values with proper register macros.

Best regards,
Fidelio
