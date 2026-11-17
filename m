Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893444;
	b=bcOkCS96LaLzrWAUvbBHMv2v+KUlEOe+CUpWErd1kS1So0kUo3rCNdugcI58stEIZE8f
	 ofJ9CEa/0+hlbGuzO21o3EWLfyE8r1T+n+B4AYBNTrH+4zpMTy6ks+jc8ihceG7r4SABa
	 jeVCb80l28A0Atqws4K6ThobUwqApCQZ6WZN9JKjhEHuq7KrkLXxKSXQR0P1/0eJ+ZdiL
	 dxbKPnQn/VOyOZ7lJeslbEKAWC6rALY5XgBK/3KbxtwC3jLgg/E+qeTh9oNYq4KFEn82B
	 pt9s5mGm1atBbjPIRDbmBe8gXSSfWs8QTcn64TJTR45qCuMG1oixJsDrq3zzw199jkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
	b=PgGfKHZvlcU6H8iUprbEFrn4m56POypHup7y08iemzTZVV4wJyxzBUGDEUoDMebP0cI3
	 VjMnlSTL8PcaVzvY+gB7G3Kkgb8IXZNEH1DOk0KB+N4nLvg4cZiaIOqBoIZQtELMib9k7
	 npjl/ff8HMlaTAX7wvrIqSogveYrHxTevPdnLmd7IBqxFLRuNqzxvtn4RUrmcrwwAx3eq
	 sS9079V/Nf2hm4rYxLUs8eOsoYtbc9a6KjDMlhggEIUKvmAqFs5io3hBsmgKUfCnjEGrm
	 lFm7BT8KRs84SxkXMH/VlX8AAKaG35gSvHgOt3YWdQ0D86VGvIXaZxrSUqqzNI+7koQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zf4QXcp8;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F77606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F77606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zf4QXcp8
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so522220eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893443; x=1795498243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
        b=zf4QXcp8BIXJgVQ932XNIbJBipZ7OOoNr+x0JQwatdUhWjptVB1cVAQ0I4et3Y0vLk
         Kc5yATO8atKFXpKmIe4fY5otpiE5bqcdClrDQWlHVlVda9SUDWarzKu87gUOjbat0Li9
         WxQtTjeTyS+x2LvSFJqGQIpR56cZIlPEO0QOTBQyaJvjDAzOudqDA/LidrE18foibQG6
         wpZO5e8Euu7p4lT/S270Os2CbQ9LyPAVZTkasmQAo+YAC045V1r+v6F8x+uZcLD/4kPT
         /4RKjLFxYSj53EqbIDhapPSb08DghVty5keXFjLHVWPUEoeKTZH3qwCoRpdiArHiY79w
         Plbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893443; x=1795498243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
        b=a0Brq1WZanmf7DOacuw/VIu+M58Z/NsHTYeLh8PDZ7AyBkpqt8pqu4z1NXJMYWHSFF
         DfRKEoc5ZqJK1nS9uQ2miG+XR2X9rVLZEfBYnlZd2f0SHyAYBPvqQMDLdxYlQv7eDsM9
         W75KpfdfzRqbILoG6sV4oNr23E9uORy6rGcmz1A0IQFpD6wbK+0XWkKabaui1sg/aNnW
         SflWQwx3pfNwJjgtpBfimzwialKZFuIJ8sJb3tq9DA5wYyWGYwFbBO9THMHAUufF9BvF
         K5Dbkzqz/WmoQcawKlW6b4dOLAx1smjGPZ45IKcZ+OufHmqd9w3wIlZFsGfhMA8jDbwT
         Jydw==
X-Forwarded-Encrypted: i=1; AL+hErEDsuLyP5IukTWZsy1Dg1py6b//ig947KuvbhvHY4bkOXdvIed70SlJYGk3qWUNd8II40rd6wfyxme8@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4hnGu3BI+ABNBC+3Q1h8xQWEhuBjeySpck1g77Z2LmQXhShw
	v7vaQXJQ0GzmtP6IWGO2JgaMdHfvTDZxc+aD54qHPSfZEcIWGoWNtR0u15kAWqXSZYg=
X-Gm-Gg: AZFdTZdFU21oVC85i62UEjdM1Men5Vcghtf+gmbOa0jl5V4bd3sR/nNPfiZ+E45RRUa
	mVM+SQusYvWK8hyzjf9gBXcv7khWJSPdGiRlzvBy80Krj1ZPtoafnCH5Wjzy0lqQQYYyhh/1AhD
	LYN7MqgQVFRBm2K2N+6CxRb4vD5EThvcuyuBtXzSG4QLvzV3uwctkH8xRHgavva+k5gpDxPB7U1
	PT+oIIWlBL/9tCko6pE2l/51ys7TQpEJhZswNuwbrqQtgIV1g6YXHJvC+y3/cxVjvtzPF1bgjtu
	3+/rR+umP1Q4qy8Mh6kqg/I0IJB9JZhsrAqjTJlPXJgV+pdRLzR+dGALYU+JykG2jXulKmHWkr8
	PnDXx5gnvL2ZUfkBSkhyiwjMaW44olVrtTqw8zlHi6XHeEIurRrNRVWAGgWniCASm+Q9HHsVANj
	Cw4uswzbPGCMzlYlkcw8tTigQOzOwFmP6890WUfJdaWCEcY6FF/cDSS2gdp4o2digsqlLFUGMtm
	cwOmlVsdWkzdJ4MpXrhmg18b0Ik1nCYgiE2Tcunr05LjK/gaRoiXAkfgRmNiP725Bg8S6nfbqnE
	OtlViMgmIKuZ76opuS+0OXlCCLQ0yw==
X-Received: by 2002:a05:693c:83db:10b0:381:761b:f335 with SMTP id 5a478bee46e88-381761c0832mr629547eec.6.1794893442481;
        Mon, 16 Nov 2026 21:30:42 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm40154597eec.7.2026.11.16.21.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:30:41 -0800 (PST)
Date: Tue, 17 Nov 2026 11:00:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: David Yang <mmyangfl@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: arm,sp805: reference the
 PrimeCell binding
Message-ID: <avvmf71B4E2mKrgN@vireshk-B250M-D3H>
References: <20261114184257.535546-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261114184257.535546-1-mmyangfl@gmail.com>

On 15-11-26, 02:42, David Yang wrote:
> Unlike the other PrimeCell bindings, the binding ends in
> unevaluatedProperties: false without referencing
> /schemas/arm/primecell.yaml#, so arm,primecell-periphid is not an
> evaluated property on an arm,sp805 node. Two nodes in the tree carry
> that property regardless -- watchdog@a2c000 in hisi-x5hd2.dtsi and
> watchdog@8000 in mps2.dtsi.
> 
> `make CHECK_DTBS=y`:
> 
>   watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed
>   ('arm,primecell-periphid' was unexpected)
> 
> Add the reference so the property becomes evaluable; both nodes then
> validate.
> 
> Fixes: 73d3e43f9813 ("dt-bindings: watchdog: sp-805: Convert to Json-schema")
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> index bd7c09ed1938..690456839fcc 100644
> --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> @@ -16,6 +16,7 @@ description: |+
>  
>  allOf:
>    - $ref: /schemas/watchdog/watchdog.yaml#
> +  - $ref: /schemas/arm/primecell.yaml#
>  
>  # Need a custom select here or 'arm,primecell' will match on lots of nodes
>  select:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
