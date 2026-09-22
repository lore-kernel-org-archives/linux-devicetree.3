Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BC5540A9
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083314; cv=none; b=tN2b718r+At2jiuIhAjsv/j5hPzPfRyRmwSIptDIfUAmoeSIzdAra6rpqyCzhYQvMBMn5UTbd+ijn2dGeHWTVVSQML27VGDF/NqthFM0plNUhxLS+B3ulbkktNn8Z147kKhpP+H5Xn0PvwdRcGMrBxGUOk3w4VFMgkUdFVvfQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083314; c=relaxed/simple;
	bh=4uifs47mEzmyBoeOxvbxfVk2BkBVG8/x2kWmzdGQkAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/qFiCYLd3SPWK48LYGRk8VHyYaEntIU62K8LbIJAdECwVn1s7HNZe71ki1TM5NVVEESuGmf51xGcRkIYfXv3+hNs2WZFANscJI5jaHjOEnhpwxF7T+dgb5o5X9c6rvSz3MDCwpVusEgHVDOdessqh4nwTnureg4CY3fXnTcjOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=fKhtmud3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="fKhtmud3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso59029305e9.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083311; x=1790688111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lryHDGBzH0yt6rZeb3UHP0vuOu2NeBF2okLNiTIg9o=;
        b=fKhtmud3g+zX2HQ6ijL3Lxeq86uHLxYI31rZgl4YMjkHkoJBZ7Y0a2eBg41LObJ56C
         b2qzyuJGUPDvFWYTp5w6s1kiyHa54jkS02reCSWbv+SjKK+FaY+E1kzUGCcyAAesJNnZ
         VsL0AR7GZv2oDA8NNNz6Ftzd1MISaurOGMnlP3FEtloOpUhmMdGWkXkePhz5SYuhZVRX
         Iycrx8oXo54EoQYd0MO/QeyLi0Gg1JS47DOvnTS1qg0sO1PLl0MtuJsqiaA0YhXWNz1S
         3luqEX0ul0qyImoWRXWX8O6tFHGhpgobeWTvv8xa5crnRYg8w5PbpoBQbPMAnGUY+4TK
         0L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083311; x=1790688111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lryHDGBzH0yt6rZeb3UHP0vuOu2NeBF2okLNiTIg9o=;
        b=13kUBBEVGgDt1RNovKq3u9IX1t5DLfceM8Ho4v7eLSjhkETSrucYBiMBfl3SdaJvf1
         AkXlpsJvmYBZ96EjupfJ4oQ/KwQM9oEl/AG4SDgdaTvC5elWjlIgpGshTGUVBZbvKT/Z
         Tb8DkhlXTlLfmNmXeK92oLT12Dh527wR/NWoCB73y6MotQfV+/vHiTvUBoc90B/pqSKf
         9a1ZsyxS/UnNFFceo1HI7eXClghj3ckxBdbnyk51Vze3aLM9J2ipre7YOFJVLguVGzOi
         HvXdT6H7A+efJi0yNv5WhjlI4nvOcBS7OOZnaZGFQjQSLYVsSq6mqsgAUhYSVplxgpJe
         V+iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXyQGucPOojgk83N+y31eozeGiZajtp5xHuyx4zH79BJrjZVlE/6HcOCH9Uby3OAkurJ4oc9Imrf/F@vger.kernel.org
X-Gm-Message-State: AFuF++k8AsNzYdIMY13+0+9ogVDiCzBwpSDCJgrDh+nIb01cOV+HR1qd
	IW0dc+MDK/zPTSEZFquBKma16+NNK6dOaA/BxsSfIWW+cczmyXRVGfSAyQ2lM91OiQI=
X-Gm-Gg: AYBFou0ZcmPLyHDjB76lNHhB4Xmzz4heAg5r1ddsy36f13oq8C0CO5GA847mK087jpV
	TQgOERRiRl2M391yTy6bxHGbYB/WRYdCzyKt2cjZ5hyVonoVz245cwE+jrGqMffafvRUhZV9uYz
	ojH4uYfViz2D476KCE67fkRS0FAlks2F3cQlqGmVI44DO3CJZKwwb2PInGDwhBUNyJ7pg/4fPyy
	oppc5qIRp1NW5HQcA2VmJZa8hhC6iZ9XNu+jrMEFU6rQI3zjAa4C8CC68cJrgrRnonqdVu6mhGs
	D60K/L5i0F9JroUZMYeAnBGZoxo8/qiqlcpIZZLw9/XPm8PXy+A5ase12QdWvK8s7DC+opEaNPD
	xKL3XmGqNHTw2rulKWOSYfsrAwincn8DNTdD5r8Eu3hmLzOHAT54ymJoML5tZBmIoGtPiw4X+Jn
	skQYj5DXpNlTMsT0oE9a3xihaaGDy9zrZBnosXAqMyTmHplCzh0goM79BL3ysMiOaK1/fNCXMyS
	eI4r2Rr/1pW6R7laox5FvyJEEvDmrR8eR8aWrpueX5pMztNSTRWLvqIqLvPEQ==
X-Received: by 2002:a05:600c:8b03:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fc566e609mr187887745e9.3.1790083311001;
        Tue, 22 Sep 2026 06:21:51 -0700 (PDT)
Received: from ?IPV6:2a01:599:842:c46f:7b1d:31f2:7a17:2f4c? ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad2a3e0sm70823335e9.5.2026.09.22.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:21:50 -0700 (PDT)
Message-ID: <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
Date: Tue, 22 Sep 2026 15:21:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
 support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, joel@jms.id.au
Cc: andrew@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 andrew@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 2:34 PM, Prasanth Kumar Padarthi wrote:
> Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible string and describes the BMC memory, SPI NOR flash layout, UART console, GPIO line names, graphics reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.
> 
> MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID mode.
> 
> Changes in v7:
> 
> * Correct the GPIOP bank line names for the reset, power and NMI button/control signals according to the confirmed board mapping.
> * Remove the obsolete GPIOF5 reset-button line name.
> * Leave the binding patch unchanged.
> 
> The B650D4U DTB builds successfully using aspeed_g5_defconfig.

What? The B650D4U has an AST2600, so using `aspeed_g5_defconfig` means 
you're using a config set for the AST2*5*00...

Also, please preserve the trailers from previous serieses (i.e. Andrew's 
Reviewed-by trailer) if you don't change anything significantly for the 
parts that got reviewed.

Tan
