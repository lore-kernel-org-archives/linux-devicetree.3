Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004135B633
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701590; cv=none; b=kNvUFbuXJlJqGJYV/OZuD/zleir3kSrAnQKu23W8KBT16EsETQDWlcHohdEXzXVhxkKte9hnHh0J+zOxRLGtlaqrlHHSHk0nsuQJ7ufBDfzIQQLFOi4P/udWSDls9D1hp75P8OiPvjOt5f6tb4D6PMJygfFUy6hEn5TwdSbEYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701590; c=relaxed/simple;
	bh=2+pxe1kU4fEfdSxs26jAJpTMIaMSl6lYnVxeYKl+0io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9Oa4db1ezuIjp9GCw6Jy+0kItWcyc4mwrl3IaxqhiqqK21sxj1o3jd8pzsAIHpy1j6ov2BueQA/+GGUKs+3U1KTT1NOwj5lfOrRZXp9fxnrKI5datCwVl1k3n3rua9YpcEC8vizT3LOrriX7TPYVTR7X6MORAkGZzYrgZ/a0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY7Dy1J0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY7Dy1J0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so69506255e9.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701586; x=1780306386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=XY7Dy1J0v9GjqHUP3kCcP+HunkHtpw3HSWpkzPjG3wO3iaWW+TmQPTmRL7ok3OstKU
         atJTDISqf7EPVmQiTbaGlvCcByuWcug6z5NjcY8BymOblQxWfAWduXiBU7POLJC4QwF4
         Hg0vvxKnVkLGiOTaIVua/zx0z4Lg5KIH6Y2SXfP4Ti9/zyCsgWgLdg00zpru25WzaBou
         7HZNjPlxpW5X/h+KxBgVYLoUADWVVn/ysn9xmo7OZ8AmvQFtC8hh60muO8bcG8Qh4oK4
         DOG6F5rN4o+TSu/UE2H0h6JjYpJ70Hqrgs3hTfZWlykiJmQKzGsRXla5I5zDXtAsLNEo
         t+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701586; x=1780306386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=WePyCeIhwjlxfaX8/DdHyVGZ1r5PNSyv4dXhMJ57G9Dr9/2yqncl08No8MbPIOit77
         pS3dNra7fF1qvjOYgB0qEEPB5D/NRmoh5kRICAAPaHRMlv4XY+9c8XHfRSvh/YvNGqub
         6qd0DMi1tSX1TUrVIspy0yU/ScsWNCUnN1DZvJnwKMytepi6QAumsAkFbWqdfnRqSI3+
         r0PPOi3eHa24HBj/1hHtu/Ly95ardDDyiuf/yu6sj842F38gXd5y2qUSOTYXpzlg5rBx
         WUBa6QkBa0NYuVQOYUN9K61Dpaki/nPd6v5/jmsdrDqW9gYoljEDkrkE9uu2bSA6mwVl
         06ew==
X-Forwarded-Encrypted: i=1; AFNElJ/UStMY2IWegXao5FZqElnNXw7kXVheUCmagnwYLMIgBTZYN4CFi4kEYpyt4f3Z7uj8ZOc5ZF/MXuLz@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWp/flRfoc80oqf7EtWesqS7qzq4mO/6RWHnKNxFgGMTaphEI
	J6y3wdqUb9+JpdQCv3AZWBYq8I2xOdvv4QX47szTK/kTPrs7ekYK0/xvQTqsAA==
X-Gm-Gg: Acq92OECl5sQn73lUsuW5klxGTZTMycfcvNlhIQmzrlNbB29H9ly/NK0adJZ1pK+5L0
	6JTwJ88HRYEPu8plP/stZ+vCImh7PhiRWMkjsHgJ2Q50AvjKTYYxUaR0kdAxTTuXAxizYjS5+zy
	JQlak+VNHYjghc5Xqh2tbmxS0/WHpdgZxJgaAt9lIC0dlqHzhEbd9e0Hy55JmXgJHti6E7RN4FB
	0Cy/olIq7pcktd1pONXUApeB616K3jsBl9gc+Trcf9dGK/Bf4W1G/HYmIGpxqUI3FFeukDNopCq
	W4BTkCjEsDFRKCW8gPzIQ3r2NDoaqisUESGz1FY4Dsf2u8kgB6tRldEQeSbeg68ENFqy/mNqiR4
	UxPLXd3TgOA65Wr5buo6xmLmcb0VhpkOVLvlpE+9IwZLfNG4cj2j0WGOeP5++N3fKT4quuk9ooE
	eHTrTeHJu3q2tQVfjJFcah/XFiSMaagDobuMFzr7gfH5Y1tQgNwoTJX4yv
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id 5b1f17b1804b1-490428e205cmr231028375e9.26.1779701586132;
        Mon, 25 May 2026 02:33:06 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm135468715e9.0.2026.05.25.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:33:05 -0700 (PDT)
Message-ID: <3c2bc7b9-33e8-4840-af41-ce6e7308ae2f@gmail.com>
Date: Mon, 25 May 2026 02:33:02 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
 <ahOwvnij7Fwxh3La@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwvnij7Fwxh3La@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:15 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The CM7 remoteproc configuration is common to multiple MX95-based
>> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
>> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
>> channels using <>.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
>> arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
>> 2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 7d760470201f..c94a63a3bf8f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
>> 		startup-delay-us = <2000>;
>> 	};
>>
>> -	remoteproc-cm7 {
>> -		compatible = "fsl,imx95-cm7";
>> -		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
>> -		mbox-names = "tx", "rx", "rxdb";
>> -		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> -				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> -	};
>> -
>> 	reserved-memory {
>> 		#address-cells = <2>;
>> 		#size-cells = <2>;
>> @@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
>> 	};
>> };
>>
>> +&cm7 {
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	status = "okay";
>> +};
>> +
>> /* SMARC GBE0 */
>> &enetc_port0 {
>> 	pinctrl-names = "default";
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3e35c956a4d7..f8760ac067fa 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -272,6 +272,13 @@ opp-1000000000 {
>> 		};
>> 	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
> 
> Please not put mboxes and mbox-names in dtsi. Some demos may not
> require them and boards may use different MUs.
> 
> Regards
> Peng
> 

Not going to insist on this.
Frank Li, are you ok with dropping this patch and handling this at board/SoM level?

