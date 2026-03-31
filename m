Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748D3FA5EF;
	Tue, 31 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971962; cv=none; b=knOdkbCSntZnHQiwlTvyDJ7QOzW00O0MY0y06ZuwON2SUDFcSluOZAOENDJOXeFDTrVDCmVLC3+iavRJFJ/YZC+zby4/5KTCovycKnIQBXTUaOm9poLU6vSEPdJsV9OHqKca7iyy0D0muM4x2A4SJKy7oMkQU5E/k3VXkj0x1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971962; c=relaxed/simple;
	bh=ZDCn/arx4W/a11XMkqZDI4Vf4ZYts8W1le/qsfEE6Ps=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=o0GRQYtBkhacj7TRemaeOzako+BVpCjr90eJJaV1x5I8piV80FT1pI01DLDFy0+drRI8fbuGLxhXAppy+hULEz3DcJ43oPdi/eO3BWcqRjJtMK1t+GjVw2bk1WWY4pdWbqd2L1u6envD3OMIY4qhkpjK/BlEwPHvNHamDE2zWdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Qd8GLtIn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Qd8GLtIn"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C976425D82;
	Tue, 31 Mar 2026 17:45:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SELuN0x1nHuE; Tue, 31 Mar 2026 17:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774971950; bh=ZDCn/arx4W/a11XMkqZDI4Vf4ZYts8W1le/qsfEE6Ps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Qd8GLtInbREtHipVmG7gb0Qlni7/NYrdRvdJhyi0Z4j5wFO/tQPwrdeGnxDt8yLfc
	 dwpf1ln+1bblry1/92LiX/f335TrQ4OLEE9jkDduCn1xGF/P1SYC8Rfpz1pkoE7b5O
	 PEoAec3U2upWvdm17a7u/qK8phqzNEQ+lkBIk+5zAT76lFV/11DaxyTJXTqengfniS
	 hC0yvQN4vJbLLm7jfAmLjM7RdcmiBAnYl5itjyaDfIJK6EVmrG53k6Z7gqxMeINonp
	 0VKy9QwSb3BkJ9gRcC4FnSsmQNzEuA4ky9YrKa7oFu4I0iWRDRcYh79sAmv+CMT1xX
	 2oIZyKFeD31wg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 15:45:49 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Zavertkin
 <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 2/6] phy: realtek: usb2: introduce read and write
 functions to driver data
In-Reply-To: <20260330211918.y7su36j47e3uelcv@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-3-adilov@disroot.org>
 <20260330211918.y7su36j47e3uelcv@skbuf>
Message-ID: <bd7475a1702711073b7fa7e8034eb8d3@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,
On 2026-03-30 21:19, Vladimir Oltean wrote:
> On Fri, Mar 27, 2026 at 09:06:34PM +0500, Rustam Adilov wrote:
>> +static inline u32 phy_read(void __iomem *reg)
>> +{
>> +	return readl(reg);
>> +}
>> +
>> +static inline u32 phy_read_le(void __iomem *reg)
>> +{
>> +	return le32_to_cpu(readl(reg));
>> +}
>> +
>> +static inline void phy_write(u32 val, void __iomem *reg)
>> +{
>> +	writel(val, reg);
>> +}
>> +
>> +static inline void phy_write_le(u32 val, void __iomem *reg)
>> +{
>> +	writel(cpu_to_le32(val), reg);
>> +}
> 
> Please don't name driver-level functions phy_read() and phy_write().
> That will collide with networking API functions of the same name and
> will make grep-based code searching more difficult.

I can change it to something like "rtk_phy_read" or "usb2phy_read" then.

> Also, have you looked at regmap? It has native support for endianness;
> it supports regmap_field_read()/regmap_field_write() for abstracting
> registers which may be found at different places for different HW;
> it offers regmap_read_poll_timeout() so you don't have to pass the
> function pointer to utmi_wait_register(). It seems the result would be a
> bit more elegant.

In fact, I did not because it would involve in way more refactoring for patch 
series that is supposed to simply add RTL9607C support. And unfortunately, 
the regmap is not going to the solve the issue, which i will explain in the
later email to your LLM review on readl/writel.
