Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90CF366561
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947652; cv=none; b=JujBI9MhxMclqZoB7377YJF9YLX/Ef5HxWLOK9xGL74iexIPBzoZ/rOQyeFSZKaCGe3IFBaK2WGb7LeFwdKjlpKE15cMriEUhlrRyuFz6IbyUeyOU07fxSHV2SS0xK0HlT6R5JVOX7facgtF2921HTPC7kfBQ+B9B0bhbR6ueho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947652; c=relaxed/simple;
	bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIJA0WwSpmfj0XF/ulMLz6jIJ3R/WitgkjH3p3CCI8lh1q51L8TgfL4stPchPcsIGfwcT+3IYnZV6B68Mb/dDrUvyVJc+xogzpt9y+r/T9BHPEboOJiCtfIYFW31o9tVNH22hyco2hS8G+8uO1iLs8DBOwbDiXoEgRs5kJqaWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OyuRrHlB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyuRrHlB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso68553195e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776947649; x=1777552449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=OyuRrHlBpR0TcLjq11DTQNVtYQFiAa0ENCTgMudk1mmQm9bi3GjK0R+oqirFvaux56
         tiRflDIWvLlzZ0z0VxddZifTV8BBSsdBZDJ83frSosJnARIDfSQvBCWqcDIk/20KWfF8
         RLnCxbLa42aWvpoN3X5VBE8QCtyZUTqn5uHDT74lEb83MawzycdF5ewTBOMq8jM/GmZ9
         EGnQyJAsjGh4MX4X2Nf+i2LlYrrwenkMWqPKmxB/1LtLVIpImd5HAvjizdmNEMlc3NMT
         weIWR5WCAM4x+JDd3XhJW3AZ+3PILhr8/095YeW4587nwhr6XPNaIspj7jKjrWLB/rUc
         8QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947649; x=1777552449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=HSMMm6wkCSbIogX07YMhqYfzkeYaLpFKBc1Y9T+Z9RfUpDofmCTaY2p8WQR1brEQpP
         oGBfwmyzvNezBnqal4tGHwdO48oO3uL/8Vl1a9r2nAUBQTW82DR5laKFwzr4vOcTAe48
         nMUtcTKYgBRYBP6MQk/YHqBIWLqJcfZC+dlt7F2uVZyBQPndc9kTgIC35xRFnV0OtcwN
         FkY0NExiRY2Gt+cm2YL/XOjnrjXr/JsrB7VXCjN1houz3JZGUSoMnak7pNUoms5or4zI
         O7C8p19kJf9uL+snM5JcI9lp1KW9a1pxbRf0/TscRxwmXdSteZw8zCPJt/XukFLq7xu+
         CAOg==
X-Forwarded-Encrypted: i=1; AFNElJ/dxa3xodg2Q0T+SLmNKdGtudaP9P40/2+IlvbN3mLrcX2NRLRRl21VPKRQP8t0oG5amu8UvCrSj0HA@vger.kernel.org
X-Gm-Message-State: AOJu0YzfM4fEAFea5XWtBzrjUMLyMsJe8NmTMfTJfN8B33Z1LGEIaOni
	w8f6BJCiHCRpTwE1k31zBOr+prTWIIZPKhbQ8+Sy038gXWQB8pOHGdXzmW598lLgEzE=
X-Gm-Gg: AeBDiesDdoYDkH454oCV7YiVdnh3pB/xVHSQroLd8nvyuJf1Mwm4IxNWitXRKfeLYlU
	/Hqvtj2CwI1Q54f4NeI8zcscrxveI3ECO5FhvOv57VpiB6k9gw/0lX5MZbhiHMXvGamMOJXGWBI
	s3eS9oDje7asHZNKStX9qzoNH92lu8oOU0gSr91X1kqV99fecERU//Q/s7zWimRHGdiF+l1IiIQ
	r9DuYyJ36en+/JHiEC2VxDY4CYyMSla4i4XJf/dmh0ggWfiydT2miR8jd9yAwqm/g6VQWZYyZhi
	5Yr/CwvrDuiThiRYVEjLolWqVw1PaOIxRwGFi12MKH14sekUY8g+ETX/5d0bFF3z4BAXKED/dEP
	6Quli1Q11JEJGGA3pwwu85kEsepWewCtKNRjhqJUD1l5+SXs0OquER44OvgxAW+97/DsyQbMCVd
	wVV2L/ClJdCgAQH2swfSCTFAKM7Mt7/M3c7efwoWSBRO0=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr363286325e9.18.1776947649347;
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Received: from [10.11.12.108] ([86.127.43.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm588535385e9.12.2026.04.23.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Message-ID: <b85c3dc6-46a7-4d08-8008-a8334262f4a1@linaro.org>
Date: Thu, 23 Apr 2026 15:34:04 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
To: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sashiko identified few bugs in the existing upstream acpm code.
And two bugs for the current proposal. Preparing v4 where I
squash all.

Thanks,
ta
