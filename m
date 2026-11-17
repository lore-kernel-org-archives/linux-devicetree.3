Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924980;
	b=hR/XaF2wpZcnPG2nZxBUjB3ALDNcE4QZcDQJB98Df1IYdb1rG54Jy/qg+FVAO007xsa7
	 p3WWwl6XDrccAw/cFJ6tjeKDPwmZ+tmiSDEM7ybDSxbLhh/lPrwioFyhhTDIPuZs9ykIi
	 Q63k2bFfhLVRg7wnqRU1LtyDosWXms8pcBLhFohXavPQf/UGnTgpNrZ+NxMyxU5QDQ8gF
	 tUZLXY3zmQaDBWHOCmiMJvtEKgUVaCOrAAcw2Pj1ewmRC4q0m6ZJwgsdZCkbNJ8gmgxe9
	 q772Pz//3E75bdBCe4w9mV8bBZ7vRE70BmNLlq9wO8cG6DEbzJqM/elT++1AJwVOndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
	b=Dw8mAI/boQlTAhmCPXTX2nY+eXrh4wPO4ML9W4bGdi7cxrgSUSpJ2apDZJUEKvihPa4B
	 yIPMMpnZ/sslmWzMkDKxbt13dYtmXJnnL7DhJdB4AfwMB94c34tq+z16GIMEY+Dh6mQ5B
	 ZdWF9M5ee3AEFR3QUb5J7eZWtE8jQ1n4ILb91UmGcxq0rSolj6MBgdjolmCvYpbeaBYKR
	 FdV+rB2NomYoXevUZxHwL0uDVoaUJJej7ATm3bYLCqz9IjfUJNOjVCg4gDYamFHu0MZuh
	 jwW7q9F59v3cNFc7MhOKLed2Z2uXDhTZMw6rtAvTR1p2Q/Blm/HXcvZD9X+Di5ZEgYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t69rdOlt;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B5606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543B5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t69rdOlt
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so6966012eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924979; x=1795529779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=t69rdOltjvx5qXxGRNojKyKeaNC41rfaJiKtcaRrmPQP/lk9UeeAKX5TuvNwLG2YTU
         lj/fqP9kUHml24YBOioaHKTh020Sg5vswBz8kqxg7nudfckKKA2UFvCQvsZGITFUVs1z
         DXGsW7vyUUGTxlT7UeSiuAf3amRRojLwhECb7bDQiFd4SAcoCrtGubN/qFzKNcT1EH9p
         QyzhXWzp1qNtziBNqehGz+Oege5nZMaaKax3h/vTbbW2DpHQXgvV+6pSoIgEUH10Ns42
         Hqi21CmbJkXxW+Te2TIwkJjjF+B/Z/7j8nGU61tVjnLu6x4oCulqQASJg+bcHQarHXrq
         f4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924979; x=1795529779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=bOHMhr1ZglQXLHv3ClBh08WvJHjq+TvGqSy0W2aZCFQi9U5Ho6JB4VuqzX4v/wR4VA
         DGnGZ1R15hKlWEgBwelZxxv6w8AEsjxHpo622JXWnqfSyX8G/j23kryks1Sw50xqKDQ9
         22BD5aFtZvOKy2qk2bs4Dxh6Pkqrq0LHDnyM+VCpXzqJZXZeln3JDZlh1Ou7yvvzx5wC
         O8LCCbqfE5r013ucSTuThVLLx82aUPaD7JCW1FoDFaFRTfSvhLuakDInGxfJr1keAN7R
         /HyJDfJjJkrfFfihEBqrednnT6pzS68ZqqHsHb1pgy0vbd/wbeoEjWiY5795ADFqcRaL
         hYUA==
X-Forwarded-Encrypted: i=1; AL+hErEASEXH/YPY7+9KUY4QkqzcTlHj1jPg64MFtdThgQI5+ZbMQQf7oUHcpRfL3ksFqV31bYJxn96S+weR@vger.kernel.org
X-Gm-Message-State: APuU4Z/cpJVCafDuBtBtMv+WngK0o75H7tRSMKo265moayzPAsyhOXll
	QCXxyx/kDo6y6ZaD0H0PVbL6XHrtVr06SlpB/ZjLZ06fueinlwTRA1n6
X-Gm-Gg: AZFdTZfiw/W9cDb/stICS1FMDDwvuM3Vpep6JGLeZRME4mii7Lt0r4/binHBewxaGGB
	zyhwCX/hbO8yL9R4lPSBymvUWP274AzSj7vU3yONjfcuKTxP1ur/yFPfJBQHqyUupIRCNInWRDk
	R1yr3EDVv6bHbZ9s+GwoMVJi9QDvHZWFu4nVV1g1//BuYMLR8yoOrQY36jGSDRu/JSG13ikADTb
	Tve8LcnLX8o+QAN+XwVV8t+V8vg6qvFDmRQD+NF20yASqV4T7tlDETuAC9/PFfEe0JLusit1NAV
	Z9YFfiaTBlfTMgpXctwUqv7TVvS5wJwzRr1wsKCjTOTMTRQrIeOUKmMusdVWjo8JXkcjOueBzcf
	HiLDSzz6R6ofAm3XsMkw63t+b61nzDedlO7t8tlZSS+3winBs7soKbByn28u+CiXlbMjhbOGg5k
	K+TKbla8yp5ffRvK+VdS5/Rk5g8Sbn7cx6g+LNQN8nms0ejE+Gy/UgyFlIzrV/1q5Vr6dr1wRJ0
	0xfqqRk7ovOssGzLaaFddsz/Sh4ITQM0bnnPt0ugAQDnX2N8dpRtrWuUI7/wjgrR1n4oFoIj5pj
	IfMn7/j1hnpCH9wYOA==
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr19474818eec.40.1794924979189;
        Tue, 17 Nov 2026 06:16:19 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac1:3b00:a18::2ff:99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9540594eec.24.2026.11.17.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:18 -0800 (PST)
Date: Tue, 17 Nov 2026 23:16:25 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
Message-ID: <avxXNp5xEbczbb1y@buffalo-ssd>
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

You mentioned 64-bit MediaTek SoCs, but the same class of issues also
exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.

I hope this push for correctness doesn't lead to any regressions.

Best regards,
Akari
