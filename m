Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343F345CAB
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192254; cv=none; b=Pw0rAxz2t7imbV7H5lO+aiTsd5ap+nVqAGW7RhDH8V8Ya0i750SDOLyf3c+ylpydhAfxDUAY67qyW+hHfv+2IlyaRIQY3e2fbhWdKlhx0C52zUJonrd21RKRAW2uXLhRJwz/BHFUej7Wl/xa+2zAkgNdPqjagS/n+IFZ7zrp96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192254; c=relaxed/simple;
	bh=nUqtAeSwtxg2g10Nn3t8JgkOkKTEyo+HUlH2xOySZMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j52tsnSM6gAkgIJlSNtwA56vFfGd/seaEzzaWT1N18efhIwdi2ow2lByi47sd10zeMu4SctzzVFn8Z5iScRoKEdkwNNxjjJRBWdbqmVtadcT/SHMwxh01BzKpH6sf17Ds6DW0PUZv02dp64bWqbOF0M3agqLAW32jC67dBD54qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Hcrw5OJh; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Hcrw5OJh"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8f83efb5729so130009985a.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778192252; x=1778797052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=Hcrw5OJh6PlWZxzRnvFn+UW5odJBcqGZFJAcf1xuY+dVv+t7TCtX/vMaAWFjnVG6Yl
         s8oCh094BPUtVBIgneGKmDXKHHuzH8VjK4vRJtA4Rl6w91nS9Sa03BErXGDM8Oha97dk
         DFBaOSG2YwDEK8fJ5SrMSPqxu79cKZLhgnOh89+RnV+k7iyV/GB6Z7JdiAXASADEJvym
         oylte+CJp0zC4SJBr5DZIudaLYj/Q9TVVIuLGNsdPJISYCzy4uWhcPby4JoMNC8bsoET
         O9flifkcoqz6p1mZHo5I5LI206l8rwCXTCivGBs2kjGFapbOr5zY4k83j5vAUmXaArLP
         LNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192252; x=1778797052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=V6rPpzM68qUnbrdqG12/xCEsefzr1rCH1rV8kWtOwXNY4F3Rji+MX/DozjNLshSkw4
         6FjhzMz5vFJrxDvoGCrXjSBCKhnvOjxb9k5dgwomG4W6dB3xxLRQOvvbOQVi3K3Zeec5
         P7GTPcQE+QI6d6JmK47xZ22rPWgBW34OP6aJij+2ANT2tCXOFGYB4evXIHlRMPPIiWj7
         9GJjdDrNiYTCV6rZ0yrsoeJElmb7pzwR6D43JBL9o3ct6qXtTikTpos8UmUqxPZzkaiN
         b6eINTwAUEhrVveo1fkrTNj4vdGjlG1C3dmuWnblAhWc3nf9R0Tjj5wWpnDdiKOfp19e
         /jIg==
X-Forwarded-Encrypted: i=1; AFNElJ9SmM2YM8XQGefYFl3PUfPR4iczh0IW5nzpXWx5BAHXeL3FBETwGLuUA1z880o+qBkjyESnP8T+aru6@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNApELkUXmFcVISIMfxJWiKGq3ZYLYclkEtHncMqGywCrv7vd
	L4Togem/aAX3bDpmYl7XVl9iIkV2Gq/1l3YwztiaC9mW5KWnd6ploo6mrBw9FJ/4olA=
X-Gm-Gg: AeBDies1jZnL4n8RO9lyK5MK/LN26lKLvAOXf7ExQOkxGEwJJctB61MG3wXVOxpgM+K
	dlnWW2jbTeUzFLu/T6cW9PUh7GZZrbFiMAZ4uY1xGjkPRs2a394u54O6W2L8XjBUhnExtbBF3KF
	tMsLJBoE9ZZmIvgEp122+jgxgDzHEzwru0ZCkxJVj9GH8uGEOISmjv05uWEYNdkjJCoJNovznsb
	JWBsqrNpkk/X/xfSQ+E21KAWwtvBZqks9TCI3pEV8z5CyvwGNwlaSYkytMNfUklx72mYTk30ANy
	DFkrwCFQUEvKyR+QD8ecz3pKkDXoe9y/a0ZKALHh7pj9GGMJ3/pdGHpGIUacpkoSHp5m+s1Azz5
	mEoMZ8vmDZQvlwAEcqG0EqW9xgett7bLJUvVxGfMpNTMun8DAnoyAh4kHfTq3eM0Sy932OcfGIe
	iUYFeXS1heK9zEP0U7ihgSdbsH6L3QST2c9HIoC3h0aYDM3/vHCIWsCCkcFqUsynxXvk8xkKRJX
	Yw=
X-Received: by 2002:a05:620a:29d0:b0:8cd:9033:1724 with SMTP id af79cd13be357-904d3cb8ed7mr1550360785a.9.1778192252020;
        Thu, 07 May 2026 15:17:32 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b986c371sm9463285a.2.2026.05.07.15.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:17:31 -0700 (PDT)
Message-ID: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
Date: Thu, 7 May 2026 17:17:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Why not add an subnodes for the ethernet interfaces?

We will define "ethernet" devicetree subnodes of the PCIe functions
in the next version of the series.  Something like what's below.

					-Alex

pci@0,1 {
         compatible = "pci1179,0220";
         reg = <0x50100 0x0 0x0 0x0 0x0>;
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";
         ranges;

         ethernet {
                 phy-mode = "sgmii";
                 phy-handle = <&tc956x_emac1_phy>;

                 mdio {
                         compatible = "snps,dwmac-mdio";
                         #address-cells = <1>;
                         #size-cells = <0>;

                         tc956x_emac1_phy: ethernet-phy@1c {
                                 compatible = "ethernet-phy-id004d.d101";
				...
			};
		};
	};
};
