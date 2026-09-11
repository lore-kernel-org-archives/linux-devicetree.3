Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE6F3C0A03
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093551; cv=none; b=aww6eBtndOvGM8FGRfaV8YlqjLy1UimDDHbnQ+RDpfX1NYXjR6VFZhQYQMn/QJUayPgPcibITrGJQhx5qWYuqwkPWWU7S63mpQhQxROpf7ebsIZESOh+gEeDfoLRmqHAdiixh0n9UaC+lLn6sla0Qeft+9soDHB18/i0t48ygIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093551; c=relaxed/simple;
	bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZ+7mgaXmWM/oVGY1AU3lxJrPqeMzitSrACyn+nWtf2IlRZGgsQqwuZWBAfIfwta1jJKNXh3ZTwGWZty3r7w71LHvrs99tcUiwiM9KPRnplAT+F/3ClvQ6SzhBN9xEk1/D/+mzWGSYWnhzKPOi5Oc6IsBrHy646Oz+QwfUDoNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5OMm3Jj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5OMm3Jj"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so459065a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 19:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093550; x=1789698350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=X5OMm3JjhYkvNbI1kyqpUUhwq5knZC5nfZUKSdrNkVbe/VwHXKNxlEkDmAaj98UJ2R
         pu1j2x8m6Zp0T1M35F4YcA/7/3BWDKaTy0ifnZSebiAIJM7N0Ih9nBf5AGvSXcsPNEhr
         jbvEqCyfEkIVOtNG3f8HclsbZZ6Et5oZRz7Buo5xygUtTBY23GmvXHC6wbFfZmSaVncJ
         3ACLbF03tmCkz6hbb0w7M5htwQC6tBJgqyQfgVYoQMPEIW2uhRA6jmTY9fcm6YkVACiB
         MfURlwcHL9HxFfuVPD7KzVm2ra+EHVQqQn4Hs+MJpg0BITCoOuZEyuL8cMALp7rJXada
         qKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093550; x=1789698350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuxOMmFLlhO7PBg7Pbai7BgbNylrrfzDckYCbeR2JDg=;
        b=SoWXi5Q4QCMV/LOd5RRs+YK91ID4BaFhX2VunoroVJ98Lzdy77SJSE8PwpuQmFcUQe
         S7LdaCn6UMIniccxoCXg1NuJxH81Wj6TjzFywjn6CDXP+ccPJut4IDsDcnanlIGwZBsY
         6ihiqd5eU4WMAtYnHIAF1GCci0yZ/4ToFg3JaB+AINaQ3kV7uvWWvCkrwrZe3npmFauZ
         O+IMosyb5wNSp5IttvuE+fnHbPV56yUVcHboEaiBbJIdk61X8BRxdp8m9IeB7xyPHU5L
         Rt8xjQZJ+acOk+BpBx1hv0KT2EbbbI2D7r3hA38IBQ2VCFsvwJ3kQzAuqUePI+GVN5y6
         gm/w==
X-Forwarded-Encrypted: i=1; AKwUvBwefKkpm2YqaiCpWe9yyQBLQAXxec3nqsxYBRYMjdIDNqgDWXDj1/U1aVyOEaDMU+NeZaoP5fjO8rb9@vger.kernel.org
X-Gm-Message-State: AFuF++lh8DWNiC/Jo0rTQTWQsxXtpBKPYZ6NQfBJFCGzu2j7f7Yq6d9N
	Ech/PV/g4dui59jFa7y27W+uWirNMVWb717XmfnZeIhl66u3TVQweJlA
X-Gm-Gg: AYBFou0r3AgLSCyb+fWJo4WqLvYJIg7h/kupC1phawwuswNrp8m6N68sk7zHw3NG0n7
	k/OeFIRnu+P39F+Sz9qCAWUajOw26PlwotA8ilFy6Q9vzFizdHOqMnYuxjQavapujXy8TNdr5gI
	lJrxAsD1L6aoKIPybLNfJhUT98wXawAWzexQVmn0HNN+SU9o/MwqeGcmtf8luaHxCX32zo4Foqr
	bx0nXwdgeM7WsreC9KLqQicZqwohfYfcR57XHTKHLpvJA7RVw55Ndgi10DTKNv+6teAqTKNq8oX
	qBw9LWdi1w2YGluNaFs39NNti0jAniDVbGbTMEUqOKCrMs7BUyes/5KoyBRZRRQw+NKoztcJr32
	LDFSxS2Dy0BC/+UpeMjLPEOHcBOx2l3FGNdGOngkEUT2xyniUYIe8IrOCyNU0D0q2f8lkRDGzYp
	ssKzYE45R5adEvhfxigY+RH962FjZkhE/s+lAP8//W86RRMHUG/2nrYW3vGmMFUgsRjqqX3K+60
	b1CP+FYWCh942VmUU0zo/F7Z1FlhXCyqe8TebDK0AOi5Eame1Co+/s=
X-Received: by 2002:a17:90a:d2cb:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39d9bd971fcmr2831000a91.8.1789093549708;
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm1998815a91.5.2026.09.10.19.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:25:49 -0700 (PDT)
Message-ID: <c7dc7356-22fb-4194-aeb6-084b5d3f9b73@gmail.com>
Date: Fri, 11 Sep 2026 10:25:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260908014526.413399-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zi-Yu,

I reviewed v3 of this patch, including the CAN controller addresses,
interrupts, clocks, Message RAM ranges, pinctrl settings, and the
board-level clock configuration.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

