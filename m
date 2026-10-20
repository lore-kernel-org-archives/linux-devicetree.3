Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524404;
	b=2/QPhOGOT2FnH6n5WUA9KtPCxuNk9eoe4F5FBV25SfoU7IaXQ5Kp9JLt4UL6FMLBK/pp
	 grbR5rcZiDGKu/erT/PM0der/DNMTI11XmQtxAmV74RyAtdEjnJZjDracGE87z1H7hK42
	 bxNSkeI8RjKRQmQL3MUu89wNRGE41no7w0zrq2zHayjoyKA08eWbVwa+CReQd+2sV7gVX
	 vvvxm0gBYqN6Wa5OVW5fkx7HMMaU75tT+CRrZJ73dHHLx/n5wMbR9DG7F/v+zMt1G+Zwq
	 HpPHNVzO9FLzrHgBIYNeOcV4dLYz222hUsRj6G4/NU+kaLxiHJf2mB5n0TVkqLuwUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
	b=Q79Iec7qkzyVsPSbpTvXUlA+ipRz5sU2E9NjSYv9bOtCr83CJN5MVlGtGCZwv7BANNAx
	 yaOT/om4My6PYlsz/uECR6VT2Bqk0Jd1bvYJNhRf6nb42AgABRZoZf9vUQDgtTIHAJ1Us
	 4SVwVo7mngqfJtNF2RRAHwIgrzxd3vEDrWOHHaVjYlEuGVHvnrzf5oCq6flsEH1dr/44w
	 Qt1OmbdFAGYNe7ki/gY85Pte8oYpF4q62Qi9Ep4vm01c0v1mZjjTidddtrMI4uEzbadpL
	 wKinFMT5KeRFpf3GPQeU6Ia3wU6sb2hMkuq9/E1ciK+NejfN7Zs/4bClN2vkhDrAevA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Jl3W+NiV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094C606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7094C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Jl3W+NiV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso35885275e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524402; x=1793129202; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=Jl3W+NiVjzOLdc1yjvnMCh9KK49lWbGu6oFGzqG7xriQpMgUNfgDnSELLjjnSsld+Q
         2nr2+cxfgJdMkbp1xdfIDSUoNLkZFWsVkf9QmImgUZuCfto2aPOm3W+w6HldIJjHopuS
         kJHW0wzuahUKrihedWLGnL/YeixpC19vTRpVes7GFZO7yP9/Y1EaUK0NnJuWBkeXgUTu
         qhyEaCyP+UTryz51Af2O+HRdCKl6ZP2e6HzN00CnWbUJToTzorJGY8BDwh6X8Ewx0Xsd
         +9fcrNUTZxOxQSjihUYqcWPrYO5+Vwhx8L9WNh4eqevucoJ2I/14iEPBdVP7ywLdTPP0
         8nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524402; x=1793129202;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=aJhK68F9gw2jIYCOV7QK5WlNZwyhBO+zSqz4/Q7pgj7TIIb5pX95E2TZ3prlB10ZVE
         7ijz0n4Irrw7UjsZ0GdfKbOYqLNzQLfnGm3X7puyc/DtqI0Fl/PBQaIdP9eUWlwjRxjs
         OSYjJddmf6Dc/mWHLL2K/wx4kM+OCDVLMaXHEMaOklHAjo2cn2YGXdAj3ef5pjmgD9/E
         KTlKpve/DWTLHSA0zuB9YZaGq9EWPXVKBFS27TOtnjF2MmTvUbaFdyQo8qaPEu+czXRL
         o76k0M8LBc1q9jA2ecl+ycSm6kAifekGvFYz8XY48pgc7DeSPZhLRf3bMW/e+mohOXDA
         /BWA==
X-Forwarded-Encrypted: i=1; AKwUvBxmot+NZq6qNdPh7X0AbJG3RJPeGIKGjjiqaNry5z96c073jYmkSU4Wb7l1j59xSdiXF7LHnZavV8Wd@vger.kernel.org
X-Gm-Message-State: AFq9FYInxpprVUYifFa4Z/EVTp5oCzAA3XSzbEy5WA6MpuuhA9DMDNhb
	5XiyHKWRVQm6bqfqbDBrfcyz8fyPxJ9021AO91iHmU/H447v4EHtw3b+0q8Latj4aVY=
X-Gm-Gg: AYBFou1jWfkZkasgPy+o89D1Y822R1mJHbjGb8xrR9J6Hd3i/xnRmS0/wbvNt9t2z2m
	MBYnBDS+o1zlvZLwUFjv1R8A4wXEq2nBI+yFwOHO9NwQEQcaZuqjWalldV+LxUet1ma6VPIp1zD
	pEkXJjiOlRCDqKOB3T6mDS2YszL/kbGr8VIPo4sRyEV2slK40qTtpndHPXoV0PhmHo8MrcALLPQ
	8vaNKQuZGTeiECSsTT4Xq2HJbju9a6xxvxDcJiBFPOvuLzw1ySftrEG1zs1Mv8pqoGmsQ6iun1Q
	diFe0Ls80YLwijFgt7DIgkJVsEFLc4xPy9Mt0JlBeJnzO+AJSsK4nkTmX2EtXJ+Scq3v7Zf0vsj
	dbwZssqm1oSuqo0RlUAM+agCSE8KCvIpU5boCgjRz4/jQhbWH5MfF/M7X+67DRU8xGMNSo2kDwX
	MLWRy2ngfO0xVURZz9NXr+6BwcsdBD2N7BkRvG22b2Ze5rdpCtU9dA5DVau7jUdL6HH92uf6org
	LROLDWqw4K4H/u8aCkgww==
X-Received: by 2002:a05:600c:c119:b0:4a1:dbdc:b2f1 with SMTP id 5b1f17b1804b1-4a1dbdcb405mr180375035e9.14.1792524401827;
        Tue, 20 Oct 2026 12:26:41 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm846135c88.5.2026.10.20.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:26:40 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 00:56:30 +0530
Message-Id: <DM9WV4TQ3JAM.2KC03GKSF297S@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
In-Reply-To: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:03 PM IST, Konrad Dybcio wrote:
> On 10/13/26 12:17 PM, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>>> Drop the output-low, the consumers already take care of the state
>>=20
>> For both enable and pwm?
>
> Yeah

That seems to work totally fine. Will include those changes in v2 then.

Regards
Luca

>
> Konrad


