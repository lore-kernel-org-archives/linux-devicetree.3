Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354981;
	b=40H3nbfTPnEiSEphYr00I2513lCegNOCfF7BFq8gbPBEt3/qF3qNrCeWzAdGgdrA+jGR
	 Yh6rhn1rPvPbLWGtY/9SYH8ye5I8II9FHzVMA4C2o4YTrcWf6tFOKGze9dRGv3VhXVePN
	 fPOYHX7UAsJMg5mAFQF/9y7FvxPeTO296JrNsjYL21MaYCfxhkCfxDMZsDvZYfp5szwBY
	 nKZ/ak2Apl5bURyvvjm+GFZrVzp4HISkqmjzHCGiyNFx+9GKnJHNBLgTJP/1FbdaxdWro
	 2+VD447rS87rN37QbINNf4LZq6KwVDfEzzPC3lycZZXugY0/FSO28clfzO7SVxGxP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354981;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
	b=ppYc20/9nbFodxMBHHYuSsqDHohGNgpqHzmKgGhElRfjinLuKzVx1TKxv1DIlwQk8cfc
	 VwmARdpvIMk/ZuT7sLgeaZ1kCQscZ4a9a4vlcGMjTMjtP4v/nrZtWjgZ0/AnQGTsKTnPy
	 DWtRmBxDovyrEx9G3c3KWw8/vRce9BPW3qULDckL2lN22KxMVdlau6MgSCNcFYaRTHXVS
	 sW4ryle6ccCjtZQUDLxQGLJiZ/qiYzmkRwErObBCI/vVAlXQRq9gkP7pw4BKHBKFPAV7+
	 l3l+SgZAoMXsHdWQAZqgq2z+XIvBOxG/wpLpQEr7hBQGNIPjqaEM6PEzp8p3Elx3Dng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF5606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3166774d50.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354980; x=1794959780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbgkfmRSlQR0RSZaLLsWqAT5L9ZTG2kkyMrzBfuV6Vk=;
        b=NYyjJQXj8waIU4t/nImFD0tcptzSeiJDANp8KnwQ1NfKBvTkUc8spbV+OzKNXn+zsI
         aDR+YzdfhAnY+I4tCzcGNymG9kbQBsQoVZMZnlhQBgCekLuJIxE07+FPlHAlPWTdYHGU
         FOJwVZkDUyuPxhaMRR/9NBRH+ImHqCEf1lYWTrsCdrGKZG6IlSdD0HMQ9XbUyF1ejNtK
         VjAjA+8FskX+Irvx3eSlq/8ODshT9Q1nxAa7kfsh3TpR3BktRyrmsqYjU6Zen3UB3To7
         UW3LJeZxS50WOZDRnkXvQNLyqUkkG97MyJneMidsE8+lImpGw2ok+lKLSgj6oDa+llh/
         /ZpA==
X-Forwarded-Encrypted: i=1; AL+hErFKi8uJReuR0CAynJ3RSmJ4Ll/y8jClJL+FgV67Y7Z66dqHPNlnFhpDoKVzz460+YouYbMGqiXEDcMN@vger.kernel.org
X-Gm-Message-State: APuU4Z8b1nVOZWWv07ajtfvnhCdSeKWUl81TbpLr2IsySTlLxLyANZAy
	3go34Iw66rQU5pTaT2Fwxb+TobYE3t2izDw3R521Xu6/Pw1YxcJMZXv2
X-Gm-Gg: AYBFou2Fob62pwuUtyurz2aKyjs+dg7jDF9dTMrlcsqw0VWiOORsOZM0H0b3lwA6GSe
	SrwInwRA8ETvbFQplFRZzX9eyoFnKfuim3Jt8q/EVIaPM/75oufVYw8NR7KhdKBeJZR5oq4fHES
	D1fhbux9krLRF/wmzyO/3Nuh1/3utG+LEx0YemtvQzqjccnI/o+3Sc14zK4DO0fgskUIh8jcPg2
	M1lnufQPKhgmHqpB0v4c98JryBMQh6jZkc8/aQCcA7pj9JIzC6LsI7yagZcWvgG2EyWMiF4J08y
	JaSg98BSCftSM9LZ8VeihoivOrzg8jX3xUm4JsHBaMkOrx4eOWGMsCbREw3qIWYnHlz5boSq4JB
	sQALmv7xgBgNxPp557YABe8lb+cy5+CiVMb7uz0fIwv3vw2ADFPdhh6xHacb7I5CXVgCYranNyM
	SN/p22wIdmmqhFWXQQsABIBLZK72j2u/+bhix17Xk4uwcsfS6OWkW5cA5Cjau8o60kRoovR/0e9
	L5WpJmPNPtWpmbMTz+NZlde1TRFPlgXB0TXnTVeYVJq0rTzs0pHwLxsl8iYSk6BjUPaLBVWeYmH
	Awjz2eF8UZ5kfqoEKk5RNZBBzE6rlLGOhYzjNkLvKkiQvqX2CTmjJatQaHqtH1vFBeJ/+1aa
X-Received: by 2002:a53:ec04:0:b0:679:4176:47e4 with SMTP id 956f58d0204a3-67c6811a961mr389098d50.99.1794354980450;
        Tue, 10 Nov 2026 15:56:20 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a294ffsm3158931d50.23.2026.11.10.15.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:56:19 -0800 (PST)
Message-ID: <fb65a7d2-5656-4659-bd96-17fc5bea2b84@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:56:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
 <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

> What you could do to unblock your series and not have a dependency on
> another series is cherry-pick the necessary patch.
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

I took Anusha's approach and dropped the dev_pm_domain_detach() hack.
Single power-domain SoCs now use dev_pm_domain_attach(dev, 0) and the
loops check for a NULL pd_list. I folded it into the PHY patch with
Co-developed-by and Signed-off-by for Anusha, so the series has no
dependency on another series.

On your other points:

> Is there really no AHB clock to be listed here ? Seems again suspect.

There is no separate AHB clock. The "core" clock is cam_cc_csiphyN_clk,
whose parent is cam_cc_cphy_rx_clk_src at 400 MHz, and the second clock
is the CSI PHY timer.

> These are not the correct names

Renamed to vdda-0p9 and vdda-1p2 in the binding, the driver and the DTS.

> But why ?

The SM8150 timer RCG only has 19.2 MHz and 300 MHz. link_freq / 4 rounds
down to 19.2 MHz and the settle count comes out zero, so the rate is
pinned to 300 MHz through timer_rate_hz.

Best regards,
Andrew
