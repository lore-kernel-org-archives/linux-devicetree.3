Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581660;
	b=EVtXAQTUlTBbogcrHsbZqvvw1Psdly82igZMqjWyRcGbxFZG0v0ZMSqpMLJF4jA4NfWR
	 zPKAU80DLaJiYvPN+knEccOD5an/YQHI0m/OcZHqqS1lNGN85nLMLYOWQl4ZyfZdRRD8c
	 xCMes4oC5I0czdRxbwbS7ayZboSTCcfGUoWZxz0aVMP3rINjV2Xxk+baGC/fZvpMeHxAi
	 R3j4i+r3qRyx4WCLUcqfrgPyR/bntJW3fSotpJb+oxhWpaiEZA6cDOZBIUgWfuJct4hX2
	 2/dj+avlajeEoSGylsh/aabWaI2cZNlYNd4GnkMmPKFVmOTupCElmzO71mj4EzvJ8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
	b=DBNIf0MtzrQD5BJaOT4IFb2Z0ljegEt6StUpSGedgbH17I2G7QN/UTl/S7p+NS60gCts
	 C77woLtTR5zI3e89bYRZBIpFB4gSR/kgNrPtVMgYtBWLqB503gt+RSEH3b5Yy9z3O3Q8b
	 5PZiAleNawCzxB/TFaxN1mDJM1uL4zUcOspV58SVVHlGaM85vLiYnQPG9FI14WNf/R3EU
	 8CmPUAAiVNkM+dMFXBNdkXOq/uzxpKwaf4gdf000x1fW9THurj0w2fddRmAoCpN89Ip9P
	 HYH7IdpZJ3GueXP4PMnzCTMkJqzjUeV3dsrte5LlyCO/GhOa5FQt5oTQh2Bk6wSLrgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E12606A336
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E12606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50aaad19fbso27696266b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581659; x=1795186459; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=DtUb2MSsTrLlshbb82Qrnc7nt2mk7Di/3LVlJvL+a+hyBCjKmoyE0a3v6Lz0I7liwB
         R3K2EeLS5F7QYb0Nz5bXmUSDqnPOI1WSnzrKMViW88wuGkzfF+xl/UBdQXCablxE4Wan
         Y3ZhfYDrLnPIDnTZ7hSk62AG5/+tmmjCTrQFKjC/EOCY09k/1bY0RZnFNcq+zsKk4XZi
         eIs87xMiMyXOwCK1T7zuhkfN6s6nb5Gd7Y00aJuq+UExYKM3NuGb6dAtWan9VpQjLkPz
         jwX9oVYTvUmuB9MY+5dXaTOTRWj676J+TyeoH7V3rmUu/c1SJkaK3aSRaOy6OP/HP4CT
         HdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581659; x=1795186459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=IgX406S1RN6TZ9YE/L9sqnFIPk8YbVGM/IeLb2CmgEcMrrczIYiceCJbx/0H3SdGlD
         aZAlXD25v24i1xbW2IcbCy1fITCYI5FtTr/Se12dH1deZWcPD5h1P74detA0iG+9qBuv
         6nqjvLnwHB+q4xi1JGibww/UiverAGC94cEftBThCRQnUFVBjMaJIFNGlX2jyjpGWkPF
         0ThfxFF7iGKAzIsdsZhEBopX3ZEhWZnkg2+B/cw5nosbmJh3jU1+yb/FsA7rsuT8nC+m
         KRoSWk2UwaXaKbUjjfccqWOAx3vAW5L9EZP7GObmFI9OwuXol2NsBWDNQtmx7bsvZBtV
         zxmw==
X-Forwarded-Encrypted: i=1; AL+hErFu1K2CIhJpsul4601tNpMPMd+DGuwXNmd07raRNYxL9l6zDg0ApdTQ7UBBr/xtsPpBKRYJaCt/RhMG@vger.kernel.org
X-Gm-Message-State: APuU4Z+fnsTZ43mzVE315//EIVE88eBz22/NhFKdUBjpyJRhOuJKG4kz
	RU97PXGfDTnL+1JG/kM/jamTasoJn3/joS+u51QCNYQQaQZ/R3bx35vPiqCqttUMFDM=
X-Gm-Gg: AYBFou2nu5GyBp4Zk6nqWeFRmnNriY0KmOOk4360ir+PH48cBDEIpFhAs03l6+WkDtX
	0U2VAAO/VdEnoFYGU006g4SlxjoRmEP+lqMZ5eUdZvhN7KE495sA2tsdmau42AV3JzbIXCzoN78
	QqvEkN9KWnCQSf21xn2MHdyH1rMo6vRPw4E/ZD+mvscjAzpPo4QFhaHNsKO3rQ1ZK40hMfMsvr2
	2ecJicw8NzacaBuQqpM8bNsAEGFlZGDtXcgkVlT5sHPttCmAqIk/T+FaI3ocrDUApEBTw7hyIHs
	h13NQHe4e4mOb3tfzDSjze5TjfJC97+UqIDUH108ws7bP+8U7fQwTh5oaqJZNtdjwMDlcfdSCXj
	Z70DeXUdCCCdH0WhnOjeMYNCNYxcd+feCxGRM6udaaSmCnZUUtNLfRd0UF5OmxeKt0N8CxeM4Bo
	p6xqqF/oDlDxM3gicTq3nVjnOwJ+XPB3LL0DzGt6WaqKI83qx+ltxJzDzJ6m66GcwwKjmmoOn7S
	tSVsy+L7ejH9agqOIJDUAFlNkjAv3QAZNSjDezCFDWfp+a5ltbT2Ye0avGe86dfVHPpE9ePubnj
	UeniOm/qZp/PR0625LzIzBMVaCZcgHFYeAGvTK6exAX2182PiWrulpgRj1p5BWZZ7JKXOEu4qLo
	=
X-Received: by 2002:a17:907:a089:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c509664a09fmr236807866b.43.1794581658937;
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c78asm112075866b.10.2026.11.13.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 15:54:18 +0100
Message-Id: <DMU63SK443BB.1CQ2KXXP5PNW4@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
 <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
In-Reply-To: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>

Hi all,

On Fri Sep 18, 2026 at 4:43 PM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
>> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>>=20
>>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dr=
op
>>>> deletion of power-domains properties then.
>>>>=20
>>>> This follows previous commits moving Chrome-specific configuration to
>>>> the correct file, leaving kodiak.dtsi for Elite and
>>>> qcs6490-audioreach.dtsi for AudioReach.
>>>>=20
>>>> No functional change intended. The clock-output-names property will no=
w
>>>> exist for both Chrome and AudioReach devices but this shouldn't have a=
ny
>>>> relevant effect. And WSA macro clocks weren't added to Chrome because =
I
>>>> don't believe this would've ever worked given it already referenced
>>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>>
>>> I think it's better to keep them, if only to make sure that the result
>>> of dtx_diff isn't outside the expectation of a commit that claims to
>>> only reshuffle data for these platforms
>>
>> I documented this in the commit message for this purpose.
>>
>> But I'd argue not putting (likely incorrect) wsa_macro overrides there
>> is the better thing to do. Probably somebody should've taken care of the
>> Chrome platforms when adding the wsa nodes in the first place.
>
> Is that okay, or do you want me to change this? I'm still of the opinion
> that adding a very-likely-broken WSA macro to chrome is not great.
>
> Anything else to note? R-b would be nice :)

Any further comment or review? I can also resend if that's helpful.

Regards
Luca

>
> Regards
> Luca
>
>>
>>>
>>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>>> checked rb3gen2 and FP5)
>>
>> Thanks!
>>
>> Regards
>> Luca


