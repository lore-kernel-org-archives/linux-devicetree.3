Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B53A7F52
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058744; cv=none; b=q5D/MKPKLL1CqLQbW86S6AiFLvK+ie94kJryVzi+VB46LuGHNxowM/E9Ce7gDTDo64zqPIt+ySuV3DlISS29nuUTLCiaRcAH0pa41DxV4d2XyiU6KdrG+UXglf+kcXNhhzdJ2k4YYYkssYi164nHGzEMtlOXN+MylQub5zahxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058744; c=relaxed/simple;
	bh=p6n/4oQ/+Mf+bndL/38+0XMFVZA7/fqezSsjvbILeL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgh66YvKoyP/euEF+cRYzMvjjhVe3UHxNKEsiCkJ48X64UjtvPxVVO6a+ZPn7IEyF9YBQKEgeR+pO6E5FlBrWPuu+zlzFGGxrym3ncL4pNf0hJA0ARf4j/TkuZXvdv10ZSJua09QjDd5oThLnn2AcrPd2nCjKsdxLMmI+YIRWYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSQyD8XW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSQyD8XW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1679972a91.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058737; x=1789663537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=RSQyD8XWalxcRTEVxsSTXLOt2Cp/qzXf0dEEfnI3C/wszDtt+Xirx6qfM/vPoiTm5G
         DuegSsS7oRVBJzx0R5YTb6yC8AndMy50F8nwT5VnRxS4Io3fFD0UtcB7MbGBoj5t9zp8
         ZWsic2cDNFJ4ZtKTNrNZY775m6cxu5c5L4qNwMxpvndG2tCiRt+xBObePmgsu6j8ipDW
         GzSuM42IEOSkNTZMT9tDoR4joWIjizs8QCSihKLpO0l58IdZCYv2O0sUhVecuMTeTUAF
         BFJKyq7D2wzy4M0ry9obYhSYyWZ1qssrucxUYuQsjsWU2iAkoDH2lv+ZL2F2BCcN/zqb
         ZZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058737; x=1789663537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=Go+Vob1L+Wv8lggr3mSUhE15oSXUcLdWc4HEwMjRb6X5Qis2N2b71JeytE1EOzC1YV
         GgBmWXVIpo0v5OVf3IWg1zUNo8r1zZKmiQwSP7IRJJM1HT6JbXcchZqxU2Y/rKEwQ9f+
         cqa+Q4U9myoQKCtPBe5A7GIDHVgDnVYp8wKSG0B6HBh2QYpujci449hXUOSyT3K8B3hs
         mB4wAxxv5iMRW2HctdV6Qnwa1/uHnxaaTscncvHU7e2o8nRW49PqI2WRg8FFnbvW6VvC
         6FK8Ntbhi21LDxYtZW1cFLMi8q2yOPiS4NBV/rCPEtKqvY8QYzhUUX1MdbNVx8Rqdx9q
         +sUQ==
X-Forwarded-Encrypted: i=1; AKwUvByvUgF4Hyxy2JXys/rvVVLBctD+S3lau1TxNVg9JivDna7WH+J/sjLzKDWhBwEccJr9IGNVZGehzMWQ@vger.kernel.org
X-Gm-Message-State: AFuF++nhdx/xZ7vj1/1lLDLoiu83eterrXtlpFmAFZTpefXspihH3wuW
	hbY/4k1nIDMV/gulHSrrxU7IGh9bumkSqcYMGfZ4ZRKq2fMYk79VmGsQ
X-Gm-Gg: AYBFou33lXdLRLKwRlqKcaiaDLPLl/vm7sk9qYnX7/3eiubXiH9lz2mhFHuQxQhjzFb
	m+4cSQZHnyjkZGxbnAczLj8Ko/0AIvBC3u5NGWv81KABrJUL6598k7KK0W/6ZP3XUIP3RQK1tSY
	GTcDOGjfS1pwVo337akX/O2bSNHA/V9eVyqwwQGAkH53sFyyUWAEyj9krp+Tw9Z+W8cp77sEm3l
	u5ZrNH6PGMOIOsbmBaIgA+Li04mKsacNhk49aPzvm8Db/ERRUjMYij8lTHiukbv0WpYwkumXkvC
	KJvJ/HQsy9Y70fx0zhhG+FIcrAfI2wdyewjFXnueVv57EHv3/K3Vcak8SuW1XWpGp2Sbs0g9jpN
	yN/G/WtlrimGdkNzoEDuUHZwgtLx71sBj/7dM0yT5O8WzObYqT3fPSYNv9qI3kuo1akHiZLvW5k
	cAHfNPTrx/5vT99/lVjaAfdpudPGMyEyoJzJCZIIb8yCPH0JrseaZOg5LT9zatLs5mP2CnlBWX3
	mYE4h/I84scdghbHy3OQYGJPs30KT2IvagjkeX14VxwnyWrZZaYK/I=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr12712034a91.10.1789058736550;
        Thu, 10 Sep 2026 09:45:36 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm496465a91.1.2026.09.10.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:45:35 -0700 (PDT)
Message-ID: <3b6ec7ca-f3f0-4605-af1e-4f6197c7c1a6@gmail.com>
Date: Fri, 11 Sep 2026 00:45:30 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
> for it have already been contributed.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..9eec44128d28 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -431,5 +431,16 @@ mdio1: mdio {
>                                  #size-cells = <0>;
>                          };
>                  };
> +
> +               qspi0: spi@40680000 {
> +                       compatible = "nuvoton,ma35d1-qspi";
> +                       reg = <0x0 0x40680000 0x0 0x100>;
> +                       interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk QSPI0_GATE>;
> +                       resets = <&sys MA35D1_RESET_QSPI0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
>          };
>   };
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

