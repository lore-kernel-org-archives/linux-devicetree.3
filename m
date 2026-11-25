Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594253;
	b=Vz1neRHTICw0Lrc14DHGo3QRUa6F+IYUYsXEm+Dphn9fNXhz/ZeRTETAAF6wLgRLdYBc
	 qfasRLS0Fc2fqzxhT8MJnLcd+ZzswHlZQJfhAl2E9KNBL6cKJwQR8hiYzaWNcVzGiMebx
	 6MQElRYSpcqK9dzyfwRcxIdt5qgKSv/FOK5+5T1gwmQ74LOa1N50+ZIqBLnds0wmHcUrS
	 qZdnAr8WTt/LyXtAjMB8x6GzVxuc10g3XxQZs96HvXo88CvTvMrIclzaEZ4botYyVI4Kj
	 XIKoAGoJ0uGF2vI0smJkdo5x2EB+vuBGIW5hoDmBh3MLkuLcc9j12R8kLXd35LERJ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
	b=lua+G4a/niX7wkv3/G2xaMizAE0o773LMw5ZBUqGgPntXc7oJXeXDqx8U33at5gRl+Sy
	 ZjaM+9dKw0yyUvJFE1lSTzn8cRiY8lF3aDZekkrM6TsJxICFcoIXwAWJX9pcNrl9w4j+r
	 V0KySO5HaYgiMFQgUgqa9b5WooE7EIAwcROgXpqeawX3GtFB3DzCx11j2rW0T2YwXMvXO
	 M3PXBl9wtVa9NpgKpmw0HR0F8GtwvGrjcPIv14RZQIjjJsFLCBuRBSbc6sjKMnfb4Qfjh
	 ljPefRS/fqXcIGucfBOnwGGPjzLj1maeBLgyZpmM4NLKgdTGWVgLT6g6Z+6VmnFRqPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Axi/6UaU";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C185606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C185606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Axi/6UaU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4710453f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795594250; x=1796199050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=Axi/6UaU56VI48FBOJ0Iuol++iREtc8Gq+qW1zWGU1vVEnaSvbob0k+3ZfA+F+RIZO
         I5uQl7TAdl1SPHyDZjq5Dv23VwS0DC9RL5k2X5NCa3z23u7EFZRvqTknvRZ9hO1p2Rf+
         KMrYnPJlwhXc6saE+VVVh/zmQbOjbEFka2m1a4abMx0WMhltlVR0wKryxEoeUsWKm7p4
         /SaTRtv4WDijhvmjHVG4lgM+x4N8jEoTKElJqf48QpLRnF7Q28DzwO4SC0jGHEggwCof
         o64i5ChchfZ34nDZLE4xJ9OZRWiU3WFpBk9v2dx4wtKbSYZp29Z/gh3bbDmDVrnabc9w
         brag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594250; x=1796199050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=HZPS3KEKPnbfq7vvQg1TW+HSfy1Rw5hQ8/pQ0rlIw2VIsy3WycHCgCIPz7/auTnWu2
         DtgzDy/aQvtLWWGlV27iUKkD/EQRltddWBICogVJ7Yizl8o1KGfPKcRHrqmB1yt+WKdg
         L2ghdccHshVFYt3MGu2HpZ9DKr9BpNVg/f315VmoVWqq/Y/wlbd6XQfxuYzbBQDnNgx4
         LUu07VHJQduZzAY7T5VfobKgwg0XkmBqsZ+VoVhjFVskov8DBjjGpXgOjTZM92F+7bkP
         ts5DiKaHsaDGMmbElxSmPhS/D972J0+8XUACgEzi/YLGls91cVnTkSQnjj85+L3SbHis
         uNfw==
X-Forwarded-Encrypted: i=1; AL+hErFPQGLdjY2zivwgetlIYRE2gIlZoojvFNbo0t4FW21vuZrWM41JdC9k1UV9qAR0GkD4y47fSjDODds2@vger.kernel.org
X-Gm-Message-State: APuU4Z84fDfjegz2oygJzAkk5AQBrCj57hAxeoc3NzxrkUIvC9mBzNwj
	3M3lQsM38D/Wuommjip8PmnvhqxGL45BZghuj2VAJFKxECewky7GibZNUfQX1yL/DQ4=
X-Gm-Gg: AZFdTZflsVbYk2mLuHw1kGCfl1STa7ORAjmc3tZqcZ0roz5WPc7Mtuxt+OcNYDTPRVr
	Nvj7TEZWBHu7Yj6oipCi4A98bLoM0WnkBnxBTptGZ3HDUBdavevvMTK68ayH5BFYgF7XcqzLmaN
	kK5GQDd42lfX2jZIuU3C83TlGlgSy7qC0/l7I9RTwwuHdtjyjceN09xfqqw1677XAVKjO/Mdr8O
	10BKhDJi6njO1EmLqwHXQLN3LYWRK1Hzjjv/dY7+8JENWP+Dbs2QVWP8Uvv8/s2eMrmeazQJGgf
	qViuJRA2tN7b5i95huy9GL7PdN4s+lthiGBncmcA972r2sZBB+9VhY9zKKGmhLYW8u+WRfOyEW8
	6t1oMEu91FD3jcQ/jkCqbjEqy/NkC4pkFsuxkZqROIJBNdUUj5LTmBFu47Uf6EA26juLeugtcji
	B0AsgHJvMIJuxLQ3L+FCV3qkBAjPIG2tpRGV0H1wIkaNFm5nin9wchb75Tl5qVoijNpSkBR4kPT
	+qwwcKWWsXZlAND8veJUMj0Ts1OtvdBOeTuQZXt02hIY/tgk37IOuqrJ7TbVkWn7QLFpQ4gIOF1
	9jlv6JAZO8a2X0hESXdLWIZpSjBR09zza/OP9yfaGnMQ8IqEa5O/bQ64qp4f5Fjc3Tf9MB0vMKw
	=
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr32677127f8f.0.1795594250026;
        Wed, 25 Nov 2026 00:10:50 -0800 (PST)
Received: from [192.168.2.69] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31415134f8f.0.2026.11.25.00.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:10:49 -0800 (PST)
Message-ID: <f7fe449e-5dd9-4476-9f1a-100466dc0c8f@bytesatwork.ch>
Date: Wed, 25 Nov 2026 09:10:48 +0100
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
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
To: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Walle
 <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
 <20261124201110.GA366860@francesco-nb>
Content-Language: en-US
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
In-Reply-To: <20261124201110.GA366860@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Francesco,

Thanks for the feedback and the offer to review/test!

Frank Li actually just applied patch 3/5 (the i.MX93 MIPI DSI controller 
node) to his tree. The remaining patches (dt-bindings and board DTS) are 
currently waiting for the Youritech et050fw01-kt panel driver patch to 
be picked up on the DRM/panel side so we don't introduce broken 
dt-binding references.

Any additional Tested-by or Reviewed-by tags on the remaining patches 
(or the panel patch) would definitely be very welcome.

Best regards,
Frank

On 24/11/2026 21:11, Francesco Dolcini wrote:
> Hello Frank (both),
>
> On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
>> Add dsi node to the i.MX93 for support with mipi dsi panels.
>>
>> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> I am not sure if the other patches of the series are ready to be merged
> or not, but this seems a patch we should merge in any case so that we
> enable other users of the DSI interface of the imx93.
>
> What do you think? What's the plan for this series?
>
> (yes, I could test and review it to help, I know :-)
>
> Francesco
>
