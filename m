Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBCB453A3B
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596749; cv=none; b=WKmaBJIiwFBX5Lb85HtXJplYDOzJr0kGh1pqZhp0dUsRWbkcib75sHtYr1png01eCwxBbwoBlZDl9UzwK+jh6WioQN5tR5DBzEEaRon5GZYCj7Z7VNsUvMhRjB7LiHqerp4Lth2GasoWIslvJFVtXsl0wWY+YNNYbujrmB20xMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596749; c=relaxed/simple;
	bh=OviR5kaHs976PRzULV1vC0IpWTkvgJa0y9VkRRzLNZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9p++GA32jCmzP1Ka5ldSK2rdQCMIa0VLQX60hiL6/6WPM49kG+A8vFEz4Vgad06uA+KlD9QF9hramGYUppWyt2mPVEcvFvZDaXcN+/UFqv5BFNeDL7eciCw9tvvcM1oGdE0LffXJ2BiKqYKdWe37Z2mY/nlH0Yejk82kn78R6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUzs1Vjh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUzs1Vjh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2102588a91.3
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788596743; x=1789201543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=cUzs1VjhW0s0igUPqsohFtn2jCWJ+jc187XwO03Ztix4UldNcRd5jQ10HbIHlsVe1I
         XrvkpTD2nBZ8UTwKwBYjEU73PCZD4LesdY/nFcdW2SsW09m7l7M3gzneZs8YiSI7VvfN
         RCM2CV5Tl0cQlU8GV0/2Vl9nszyE9BPFaad4zF5Qkg9Z+Ysqfhv81hqFHJ9TeATzLbUO
         Wq1f7V0i1VD9pZFOvn0Az2M45PAXfDrb45pnMVx5e/fv3RiN/JR9yQLhG6qC8vtRXwvk
         +abBPoEjSDz6dCGi5BJCwLje1twBF5epG6T6W43tmP4IRWC0bIjlEg982rRiUxjMrNrm
         yRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596743; x=1789201543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=j3Ig3GQsw2J6jLSoPYifwDX72UYcVyIt9MjOQCD0g1aj7fReSWU+Zh5cCxlmlQvcVo
         Qb3iaRVoOMwh1JDDsSA7dbPPSVAHhsDcOAbr+R/4RMQXxKIpcNu+XqRCMVEj2NaDPgE1
         qGRNmrqVTfiCvp1ZmYxF2dLNgUmDc3lAg1HCWjkEPpfHb9NkzTbq3qc1eqf1uDPeY2wh
         Y5do2qOC+UPtzRCT6AUWMqrzPdrGLbka+2fnOsBWYDKEsPF67PVzUaPhmGoBYTqUrUvp
         QBdFK1Xdbs+dfUdOFcxNG1HLdnITmvaeDIEn2nILDRDE1mbWYV3o3I7uQGnGP7XOo9dL
         fWxw==
X-Gm-Message-State: AFuF++lWQCVMV62I+3r5YTDKLoVVaseKXqCw6rW2Is7ltW+ZFb0jj1dS
	r1ukD9Tn+gV4vRXVhwjYx/R6/0JNVcykmdnBaktLYYAczn6ZhN+OB3nQ
X-Gm-Gg: AYBFou1gvvCJR58QAMZZ+rCEPaublkhOm4xgCiyijMi1jPGoLnNHT+prVbU6PRH/VYQ
	FKoAV3acELGGLf2ASSNjpVEgjUlT8ZGOnN6DbdJTf3rVQIP8l5Pq5vq76ZBv4uONH9oXAnMUBU1
	EFHxj+zxQWAYAY+LOteSwLa6wiZ1IsmW6Qp805PJvWHBGK6Yi58IrW3ziBMHmqUJAOZgnS2ZyhV
	xaOT7gloDX7zWaedliD8/Vc8j4NZpF9UR5OK6xh2qbB2Ds87rY5ETM4y/BifBFw8H0+VMbLH2nE
	yrr8TDT4XX4dp4I8IXJKKd8SUs927QFrCVWWtzlle70hitvIi3/5JnnZgMOKy+ANKr6fL124CVF
	l3hSLh4351QPkTwUVs1TiADjURY+J38Jx2lEqoxCQRQ9TIDdZtpsfdzag3U7DQI3C4RWb2TmL0j
	QN8zFNaxASpt5VfeNGp2Ra+EMWx9HriqK1dEOSoLuYwOrlbtomNghZ9DSTQzlKH8Sam+6c227pn
	0DUxA==
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39b26298ba1mr15383737a91.23.1788596743161;
        Sat, 05 Sep 2026 01:25:43 -0700 (PDT)
Received: from [192.168.1.107] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm14262328eec.1.2026.09.05.01.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 01:25:42 -0700 (PDT)
Message-ID: <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
Date: Sat, 5 Sep 2026 16:25:36 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Yureka Lilian 於 2026/9/5 凌晨3:49 寫道:
> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
> the M1-M4 SoCs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index 1cb886785173..e3cadc5ad39d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -46,6 +46,7 @@ properties:
>                - apple,t6030-aic3
>                - apple,t6031-aic3
>                - apple,t8132-aic3
> +              - apple,t8140-aic3

the title should be "... Add t8140 compatible" describing the hardware corresponding
to the added compatible since the compatible being added is not "apple,t8140".

(Alternatively, if you mention the compatible in title, say "...Add apple,t8140-aic3" as
"compatible" is already implied)


>            - const: apple,t8122-aic3
>        - const: apple,t8122-aic3
>  
>
