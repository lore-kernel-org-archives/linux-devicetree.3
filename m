Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069977;
	b=VIDLAzHGwrltQXXjd16raPjt/MIDIbcGN2YwAlYsLi7nX68nMu2M4j6Y6RZtz9hNyRZP
	 4Ws+2aB1mVvznwYxMzfw2c2xnyldyOgP9fb+M0UucYncsCW1YKBeJjfLwQ5qZ7RKw6LXz
	 2vDiVKXINEGMT9igPtEUAaDUEhfCw6zd3zlp3S7pdlkX4ASAtFsr+PdeNCPzwOqznmEP7
	 vaj/ykLv2RtJAWXoL0JGBOpwKzEPQ/YDQWNuNoZtcMHGEc3fArjSRrqXPwg0HDSkRA1Jw
	 V5uCOZEGUhTEIQ4qFduIjgnPgkqTgZJVIvWfWA7W0rutrAlt7q5OYh+g133NRYF/1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
	b=Ivpxg7b7zwKHzmCu/MMPuswxsUeFMNg2Zzr5j+FpskQu5iYG7VgmkUffAyjzgs8fCy2u
	 OGsQ7Wi1/zpm1ZHtsRU489nrT4Z0WTX2KftHc9t/xRLIQeAlUXH93lvAuOPC27oBTNUmM
	 UnvndL0QpxjFRDEMvrPYa7AeSehJ22cI2bnu0apenDSvAVl62hsAKx/WyPiAm+sdm6ZCO
	 sy4WGHBhU7VyDqpJzyX7GOSU6mNPYxE8o122/VBas/ggpPKhDE801AWObeN5pT1G1PIId
	 ScTqLH4UbG7dULm/tuNPu2v0vSehh3CqGiOjlZxpmz/lN6McGNQZW2VqjsLiPgoXbdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqPieSzT;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9D606A32D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA9D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqPieSzT
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso20253605ad.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069976; x=1793674776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=CqPieSzTRnCkJ8rM6iRBdGSlNKE/l4IOUn6nhqhCKR3eN5UyjZ4YejMK7uN59tO960
         0yu/KRBg4FK9xogLSEnUuK8UuoDvXhLTaAYlp6EwjRsd+FiylLmYDYdtyIFvMYjqII4d
         PrD8pzYLMxiCE0u+GZlurVLeHQabNRFGQBDzN160lLbae9otfAf69kqhEPC+kRVNo2MV
         VbL+XM8AbqeOFxiCh6f+MPMEk3GynSem1BV/9x3DzYr2FpsSljxD/hMHwCpKZUlzQKYO
         eG6vbr+4vbcsFrcNNwz+xlY2ensSLFllJFd8SEv56tKThwBAm877UqxcFeLxj25Gexb3
         P9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069976; x=1793674776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSnvvzDhM2uKqCBxyLgpEZ66FQuzFPilOEd8OHc2tQE=;
        b=1KmFSWFxYT+rJuFc0UHBPMJU1J1sxYOc7OA+MJP4kuSWb1PlTZoyFc6UltWOYEcviG
         2wsWIQkN5J3VMkMxL/EgOLcoKsjaFLGi4B+yPzsk3TpO7BswHOA8I74vM5QTigNWbuN5
         xgOvVKlMeUXJl2VjHAYBDteR5/ip/+d8KI7Amkgb4yQsbiggEo7bLSNStlxludze91Cd
         0SudyFMmNmqvBOdVOvLDZZNSvaNsowAdfXwA+zi/+KVyj4ldCnqzzk0GI/mx1GtN6w20
         7Xs/p2R46YOu2mg5KLx41dKXT0vpspRP03t0GlE+Kr1tqzvmIV3uMfA1q1uA/u52oZSc
         9JUw==
X-Forwarded-Encrypted: i=1; AKwUvBxGZJE0U7QlKhHv3RRjUe3yQ4HeRhSYpWkfOtNbzhbNvaZg4mAu/V9idbww7PPR59oQwgakiIBYtqz1@vger.kernel.org
X-Gm-Message-State: AFq9FYLdUrwOOCoxgQScjP8i1nFR3MiKyOtCaxPWbEJY2uB3lywITZ20
	ce8dd1E+ige7MhrDzAMdzBwNY7PuNgU/oSfUSlpauKFDoTgFXMZYrzGg
X-Gm-Gg: AYBFou1WGlcvfJ2sJySqndthSWB8LY9Z8Q4vWF//8xQJtDV+olsGMlqTlHBqL3ADsfV
	eomvdGKbjAI+AEq+P0O3/FO/b+pJgxD1C0kA0KgOEiqR0D2QraQWaOj0Q5ugiXmz0lbceIcVN21
	gIUsIi64tgGW84ZDDnEscSCS44TTR6B3TwuxpdF/DjS/I7d0SwJkyrMJwCRBYyvD+3cbfWAkkml
	7xdDAP/0CFiJDwEDCrKOS44lsVAVF8z6Xwih0FyXc56Z2Odz2feUW9iCM01NnnIPzBhr4ssn1qH
	1muJZL4aYbzURPlg0KXFfWudAgiAR2hcCNaEAnUsbsoQcBroPoUq3WLQGpiRcThhqUe4j6il3PE
	iS7dE09ufrNioT2LJfXvFV1tWxwaILVJJklM6OrBzO4P3pY7HNWxaosQyyFPTuIjEifgtT7lDpB
	7wH/GACRdariog4weXj1t8K+z6FsKorFiz5CZRu8xH46BwrBSjuN+SU91BLN8ESrTGHIThZB+Z6
	WDDbt1kXbRTnPCHxDSm0ZZshhcieIfFQflJahnSMN+IzwTPTZB25RfSmOrIND062bHL58tsqYFg
	czkaspPvh9h6LxMuzRWQ
X-Received: by 2002:a17:902:d48e:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ea9c9875fbmr71515405ad.57.1793069975922;
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c912f9sm2255465ad.60.2026.10.26.19.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:59:35 -0700 (PDT)
Message-ID: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
Date: Tue, 27 Oct 2026 10:59:28 +0800
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
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> index 7785eb1a68fc..750046e1a5c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> @@ -222,6 +222,12 @@ cpu {
>  		};
>  	};
>  
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		label = "mqs-audio";
> +		links = <&sai1_port1>;
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
> @@ -390,6 +396,70 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mqs1 {
> +	clocks = <&scmi_clk IMX952_CLK_SAI1>;
> +	clock-names = "mclk";
> +	#sound-dai-cells = <0>;

Above 3 properties have been defined in dtsi node. No need to add again.

Regards,
Chancel Liu

