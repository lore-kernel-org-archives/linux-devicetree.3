Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4B2222A9
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025284; cv=none; b=MVUGmpG0IEwTlZidwZnFGmVjpqFV1bWsJOY12jQ2P+NLAEQgsO4dEVeLak4Jmh5LOlAopK2wXTyuLxMkkUskZemjf8Xmdx879DzbQQhEZ5T8H5ZL7+pABNsU/7KCQfs5+ZEnOfqpRrx1R60GykuvwAG5X+trqkY059U88V+tTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025284; c=relaxed/simple;
	bh=W2ZAay13kqesE9lEmGALBxCr6bpBT0xBVpE3WfgZrWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3uk9PbQzEJH2sIQb1Li+iV/B6C07h3RgOOHEXYmbdmtOMf/n/1HgyvtV85nqCruB822dFZaTOPD6HzT+tLTEUwE+MbpAQMYGXiEWdW8ak5oyhqgXgriQmUvY2ZJmALd9jWrMMFSSyMM/Ewwg1t+eGza2BTpfyK9t2cXqMu0lTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/7qmBns; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/7qmBns"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so629910a12.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789025283; x=1789630083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QM06wsJmDFUwDTXBwOD8bKArEY6vK/Tt6RRUM1IU/M=;
        b=C/7qmBns+r/lJWoxGTmAKuqboFfnpjh2zTikIUiFZ2SIHTDwh1ZBTMs9O+lCiG6jkr
         xGUkEnxm2ld6YmQK3dZdI8uI+zhfGtNaOJ7weYKlwG9rAdvFtbn8bAj0/mNtl+59MKHJ
         eCb4Jl3/31rYGP14wv3w4IMQiNVbEdpOtCa+k5/LbQ1LDNHGvDqY5AvaMZnK+ys0ast4
         rIY1wdwz/7RCjLuEqT22G93CBS0vofxMZn8IUllS4oR8PaebPHf8H+r0TICToZABrDhv
         7DttNWsDknQJAmWTfBMI1egYfQZMqxtBSRO5HOq1mMdfrmdQR+UvTELtGi0M07tPkLvQ
         xI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025283; x=1789630083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QM06wsJmDFUwDTXBwOD8bKArEY6vK/Tt6RRUM1IU/M=;
        b=jzfVsB9oElyd7SKvH8x5xHPGoh1a2wDj+w64o/+aUaIEsBpUFghK3vEnVQBwJMTmnu
         KCovbcY0fJbjPlNJltBSQXwd0DuyZByb+RrD0SrVf6XnyhDOd2+avvxJiMsHXNeU5ohE
         G0pb2lplFrZAgxWCAozbD0MVTwXHsgV/UlVzptLcXPaQKk9cd39ZRsuh+qm/6nafB2o4
         v9Xmg3cJe0oBATK2gPG8DqwWnUvHHPkviEr8Wpz3coipm8uhRJUDXSv8buj7Zhrn5BqB
         f/PssB00UN8QMLLunF553BrsMTuDpuGzHic8w6EX/yvCbZI8BntNtkzbzv1Yi4X4PvLI
         CiHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfJpQfIUbaH6MbRBlHHKT+p/rHLH2GrHw2p1BVj7praK7wW24fIgIIPSyBwfU7rt1pZqnKvoD/LXEA@vger.kernel.org
X-Gm-Message-State: AFuF++kGOpRi3tjeiQfSXtk0XA6iMPvzICjH5CKCaxiDgT4Amko46/CV
	66/nDURrGAf/bkSq/th42TYpLHQzhtLm7LA/TP7+MA5B5iu+3qmt67GxvJyEdA==
X-Gm-Gg: AYBFou26WhxS2QVpsBtEuRI2fFpB5KSU/WzU9abkZeSuXlbEA7oBrlT24DSPyAdPsU7
	GMcfq01abdyHAZmWfwvaTx9tMcvt9qIyl+JB3AqHI3FBgTeEVHRF6Q3LTybrY1/13Adc4fcyHXK
	gjPD7F2izilsRzksqXEqOBJbPJGSzIe5mdcyTaqrX+TF1RyFQy4waTGWLhLJU77smxvVOyqRlvy
	pDGAbXuF0MqplrlE256cV0OsTPCy4ZZX79HYJ+yiNH9KMZ8dChy++c11Ds+Y/3hghXVKalbLDoD
	n5JtoZ74SkS5qNwUdslo1DESB85rmlrCgN0kHjKOgxMBDf/+MPdIoRB619lmY/nuvew3Nqic14A
	19AkknZRuJWNO1UzYfI86AU7okOQnhxm6NCphH3g2yRXsuyJUKDW1DQksc4OIu2ivGF+Lx0q2Nn
	ixhHy0ztss9V2x9gAyeyk1ZTl553yWMG8e6vNHt+ATTU0vRs8xnrkYvOQlcTwOjPL7T9Ck0eJRz
	67vzNDmp5dT5C/LEbvFS/uCiTfOVaDF+09aJMdNhAd7SnhvR2o2ILp+
X-Received: by 2002:a17:90b:3e46:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39d77bcba5emr3182903a91.14.1789025282698;
        Thu, 10 Sep 2026 00:28:02 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4178071a91.2.2026.09.10.00.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:28:02 -0700 (PDT)
Message-ID: <7d4b5db1-7b0d-466b-9432-d80882e2720d@gmail.com>
Date: Thu, 10 Sep 2026 15:27:57 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260720102222.251179-1-a0987203069@gmail.com>
 <20260720102222.251179-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260720102222.251179-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

  Hi Joey,

Thanks for v4.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..5a7a39b1b514 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -88,6 +88,14 @@ sys: system-management@40460000 {
>                          #reset-cells = <1>;
>                  };
>
> +               usb_phy: usb-phy {
> +                       compatible = "nuvoton,ma35d1-usb2-phy";
> +                       clocks = <&clk HUSBH0_GATE>;
> +                       nuvoton,sys = <&sys>;
> +                       #phy-cells = <1>;
> +                       status = "disabled";
> +               };
> +
>

The usb-phy node is placed directly under /soc, which is a simple-bus, 
but it has no <reg> or <ranges> property.
This triggers DT validation warnings.

Please move the usb-phy node outside /soc.


Regards Regards,
Jacky Huang

