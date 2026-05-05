Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52DB49252C
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999599; cv=none; b=d773OVy2+Hgbdm5VFCnrVSG3KlMesADRApV7xuBp3e0v210StkTsla0FXDdPc93WAoH4gObTJYWiTUvehDUmA6Buc189JejiS84unYgiu+90xz94FnKMQw0tvrcdwl+Xve3wgMFTbfDiS63BBssIhzT7lo4HHx2Q4gEyrUk8IXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999599; c=relaxed/simple;
	bh=lP8GSMfbSOdPUQu2yG23BWNhx5HOEezwIqDOAMp/G78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvw0uQ9ZYEhNYFrbN4/BF5MdPUxoAANvYdig1n7gn15VQ2T/3O4aCE9d15VaB+hfKQkfqrs9OqvFSNaDztrNtzSYU0KYHa5aK/hK84wKD9zjTUprwA9RT7rdIs4Xq7rbAhMVORBdNKufGP91KEbcaPFgLXbkL0YikNla32/Ic6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JkAevuNr; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JkAevuNr"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd8cb26219so12582867b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999597; x=1778604397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=JkAevuNruhd/yKdOlNO/Zb4RDcsdJSG8b3alVSqro2WqzsHTZqjrgeqGwWn2qboD0R
         Vvg10QJ5eul0ZaRcVdACZe4ej6YQ6+ykfGXbLrDof53cKOyGDxvQFOXpyBJ+2JgLVEdw
         CmpVDaZfiR0KHOvghsUBqRSnDsIhdmcqGpqEKij3Mk++aVjWT9/l7oNgAwcNdv4WrqzR
         VKOV4rioDm/xd4aAmUWWAdto+cotpCAZ+6rYpyPyqRF1zOt4OeqzKXizhKTimcDgL49s
         DVZZn78TEwa/SfVNS6gcZBT2+EQL3ju7rQ3KLi2V0oDD5NG3pvX1PUlHpZ2sENlL3aJA
         TQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999597; x=1778604397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=kfpznGkQ3W2K9bEVye300qXH1ku68KxitkGM57sqU/rt9q7r6Xh/RnXyjCw3Mkq0+x
         YlHFYNZjUf+VFxpIXTpyHyIzBmZd0bSAFMxHCVKbJibIrn6yq4kUMmxeonbEzNYDMclK
         bQMSGEX12B1584llLfkFNSMx4UjecOGsHHpxfWhgU7cvSDPAPS4gi6i17hYmmvku/Q5x
         +4KjuyC6SVHMIAznPvhS2LXAV8Jpmn1fb37V+ERO1zbYlDPOvNFnCVIpXiVOic9jC4yf
         J0zkX1gvc6524OGKqfmrdB+zD3MHW6C5nhk+uNAJinm/f7YJNd/Y4ZpJBYfQoKTrGsB0
         lgeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OQU8wKtff8DWY9nXooLJElVCOAmljmY7cs2Q7I8BiGmo1Su/F3se/ea3r7Mrp9qHaiIla81B1J6Ho@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyGzLQfaJvy2Fqb6TkTWm0X2WGI22IG/NEVqsFcgtlhCD+PlS
	2zZfJlWP1M5TD5oU6N24GUiLhEeh68yWUk1BspwfLUvq01MZgdUdisqGUeRpF6FEzm8=
X-Gm-Gg: AeBDiesh51d7c4eHtsds/od513izAz663MwtOjtxM4hOdqXsBb4896jtjFGGwInnVJ4
	JHJQ44vR7GT5j/YoSg7SrAgIUHIN8AeaolFyPM594ZR9x88Bhxatf4esDGsAYLq8FeFXIEt7hyt
	GAMz8GcuGt9Dz1649pps+DJWh5dDDp3a2vImBaIUQQH4O8fPEIwx6OZX6IfbKVzHwfAiZbJDgWt
	lDjQEu3nq/C7sUOrFpLiy3gK+B8q/LS+qLN9UZWkhm2kwoh80JjxDvRAbxrTj+pBVScajMLz3KE
	LbSGce4skX9yAMOfXKAT8VaCU/PUNQs3IgZnviz836mQZgQhqq68nVFO9yjGgdyp2sWsE8FiWxu
	VU7iQkL+esNmKbF3wzj6IpaMvBVitj0CggWzGm4q7CJNL2SgGR9pECyser1cDMeWPNMxW/9k88M
	3U1o9CMrPF6fNUFhpDE7T53Gp+zriBHiUISIZ1Ea36NvrAbB7a0mCQsIkkwiwEG3nwSikA7Gcy8
	A==
X-Received: by 2002:a05:690c:60c4:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7bdac5ffe89mr42184327b3.39.1777999596609;
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66558f35sm66666507b3.15.2026.05.05.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Message-ID: <c716efe3-1b60-4a82-8fcf-1928c0233d64@riscstar.com>
Date: Tue, 5 May 2026 11:46:33 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 11:42 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
>> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
>>
>> There are multiple builds of RB3Gen2 with components included/excluded.
>> That means whether or not there is a phy attached to eMAC0 depends on
>> the exact board. However all versions include a TC9564 combined with a
>> single QCS8081 attached to eMAC1.
>>
>> Add properties to the existing PCI nodes to describe how the TC9564 and
>> QCS8081 are connected to each other (and to the host SoC).
>>
>> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
>> binding, but checkpatch.pl doesn't recognize that.)
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

OK, I'll fix that too.  Thanks a lot Ayaan.

					-Alex

> 
> 	Ayaan

