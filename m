Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576429;
	b=12HvBWnzuYkpyWfHngkMqBXHMMgtF7TaAqmUUKM/T1hcn6/Uwm/BSrq9sbUIXvZqGhZX
	 8f3PECwPzVAPxl7a1CHyl/9kTVntAdTYfHXQQwU+6xWdWLpINzq/olDyZZ0eMca16S2W7
	 77b4Kh/X5UyVQ2kswAgA+0W+DJM9FBWYh4QPG6bs8bMY/ymNwZvFVX6fDmSuTBfBJkciY
	 Wcac47rKuB0g2GDy0uDBJUNSHFJD7L1b//mpIp5o9SEG9Jsf01TjBKOYyeu/GE6D4yPhb
	 Q9U0oSMXVYnjG22O+w/lhRICwZ2Pq/ABSPqbODP0ZExHQRCvefe7YP4Rju6lTQut1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
	b=bf06cwP1Eh67xnfN0F79ATXoI0ybnLRQDXLeGJqWR2qDtwFoNY09fWhVwCIk8xfFInx4
	 dSRssWpseo0FnVSqppGko/fJr2gPoSya+RttykoTrkgICJS1cZchzBB28Hp3mQI/IFuwE
	 kjPimRckvJd07flBU2OhBe9XX26/ta57HPjKyMNl5hiJugX0Z2RlOrNYM+bb1zU/uteYd
	 PNmT0c0leaI1BPF3t0djxO5GD0bSJGTNeVCM6CQc9KpJvTGW08+umlXTcf6jOTdJldoQu
	 W6DowzZIz9aDyDdn2lpmEq4PP9gZvofut5TYYgQiUT16xMS5pRow9Tl0i3SRsZmCWGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM;
	arc=none smtp.remote-ip=74.125.228.69
Received: from mail-ed2-f5.google.com (mail-ed2-f5.google.com [74.125.228.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF120606ABA7
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF120606ABA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM
Received: by mail-ed2-f5.google.com with SMTP id 4fb4d7f45d1cf-6b76ad6eeebso627253a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794576427; x=1795181227; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=F1yZ87jMnXnJnLHZNPOxMjDFrraMurLQnwrX1PMENdMZOVISppTaVGBEAtXvSg6sOz
         i9eAuh6Cgy71jZrixdwAxgT137uU60LKBjJZoecYrDmBY17aqhX0CQK53z3/DFHzp3OS
         HO8pY1ChVVmzaURKpqR/0uDaIqzBpuWsL7pNlWQv+WWGPTGnGiWVhc+sH9t3ocCdIsk/
         1gaPJkUFZkhMnE29cSX/5rSBAPg25LLQMAhR455VagPty+KLpeKraqzH7YhZa0gufVVd
         L0RdUdI/LMnKL55WBR+7ihZnx6jRxbWPHl6iZ6QPdbO9T4NB5waWuYKHll7qFbYZnn1L
         5Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576427; x=1795181227;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=ZLBAyQX55yCpTjaD+GBSF7VjLR46w2HY/TpedZ4RNJeLHZCdg7AiSxn4emZ+robt2m
         CzchSiN1RikA/Ak/ZvePZdJ5YcCdoCPMXbrraSX+h9b3Lnt1xFaBth2HoIQXQeN6CCGS
         feVqfcWqZGucy1PVG7E4xaQGH2UBkRfbRMqm4erNaChCGEBT5uQN6Nvgve3WmasZ9Eg9
         mIQiYxA7IlyCL0gxrsB6WGNCVO+pxpMzOYDOyyoE54xtoKllc39QTltCKPA7MhnoZCi2
         D+2tqDSjn8TIw1U1TiZv8doan1xb/tWWdpbJJkXxPRCwNW8IQJV8gAwzD3TffGKQpvCP
         7R+g==
X-Forwarded-Encrypted: i=1; AL+hErHKINqC5TX0zMLmgEx5u4wNNiXy7q5AR+c4afHtzuZhUYQnQvDZU53RyyKfwfi2Pv3hC1fMRJjVIaEN@vger.kernel.org
X-Gm-Message-State: APuU4Z/NabrTfx8tVHrQUWUx1B2VhOF0aG6H5xM1MRkEHGHfgzvlcNoM
	E3Kp2meI75ZTAxEA9SNnCJTA8fXk7qAARzpUGiJWDzvluxJT9s1NcO7gGiG8CkrE2t0=
X-Gm-Gg: AYBFou162f35ouxqct3YZVGz7Von4y2X0yE7P+W4usdGxPPfEOFtwJZ53Au0suWXwIi
	0xFLNRis1ZoR0Sal5ZRJZ5IMqkdg04JI+IVJ5dQe4FhQd/yScJB9nBlHF7TiQ8JBcG+XErrt3M7
	I05Zs9AombId4ElG3t7yTWIHxqYXOunA5hIZDJfLW/YaB6s3/8XQ0s/iXsXFmamkiXbUAAfvfvK
	2Z70refBJDaDKcC2xefeABlVkerMiPX34IL7haDM83loIbwYbrjZV0RWTH9s10uCjI/J+x7XeZR
	1K+zNeyEAsr9O0FYNRn77h4f53o/YoYAiDI5BSM7pRuW3vwZXwaRptvQj8FzZDvAdLPghVN2fWn
	MfKEvLhfePX/9y0tHYxdeGESX7S7Pvh6GMxQfhyZoQN/tPUByVYigm5VbeeHpKSDMLYNMeYx8oH
	uU1QogVvQcor12C+IzEvyDOiuZZDLRcw5t390X8V/CznNWB0wqDw8R/Hy687AEcfGMA9S8+uz/v
	XIFFKV3CDtQFRTogeZ+Nfo9hsWwQR0VquX5l3E45/WGAL29AhVlNaeSi23ppfg31CiwWL2NRgCO
	xsjnBw57hnwevXc7p9z7DQaMQqTyp8JHgp3Fm8VRwiKqJE+YxlExNYlceMZwQIkEZJPW8CJ9vw=
	=
X-Received: by 2002:a05:6402:280e:b0:6b6:f22a:8def with SMTP id 4fb4d7f45d1cf-6b7c0ccec63mr2358666a12.34.1794576426950;
        Fri, 13 Nov 2026 05:27:06 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c1e49be0sm968246a12.0.2026.11.13.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:27:03 -0800 (PST)
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
Date: Fri, 13 Nov 2026 14:27:01 +0100
Message-Id: <DMU48Z0SWPHQ.1HRZYE04S91HX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa"
 <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
 <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
In-Reply-To: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>

On Fri Nov 13, 2026 at 2:09 PM CET, Val Packett wrote:
>
> On 11/13/26 9:59 AM, Luca Weiss wrote:
>> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>>> we can turn them off and on as desired.
>> Actually after some more testing with extra patches, it seems that on
>> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
>> on FP3 it works perfectly fine.
>>
>> So please ignore this specific patch for now, I will figure out what the
>> problem is and re-submit. All the other patches in the series are still
>> good to go in!
>
> Your touchscreen needs to be a drm panel follower and/or reference the=20
> same supplies as well :) Most modern touch controllers are part of the=20
> same physical DDIC as the actual display side

Yep, I assumed the same. Probably need to resend the init sequence [0]
after power cycle, when the panel is back on again, to get everything
running again.

[0] https://lore.kernel.org/linux-arm-msm/20260821-fp4-hx83112a-v1-2-474941=
bd8860@fairphone.com/ hx83112a_init()

Fairphone 3 should be a similar setup (FP3: hx83112b, FP4: hx83112a) but
apparently the hx83112b doesn't need any sort of init to start sending
touch inputs compared to hx83112a.

Regards
Luca
