Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004903;
	b=rgvkSNu7rN3g+uhUobsyzf5vnEORSEYie3ABMr7tqB8+j5FlIt5YNJbFkXdzHNRuo6Wp
	 44EakfJLXJX4yfdj3tfnv1amTlGxWf/mMJfr+x35xLBXd0dXzk2ngaJg30Fgi1KaBw5Em
	 Qda8T1TmXjdX1pMQXDKOgZeCJBd9TY963BXtddBpIwqZahPB88rEVpAAzE+X8cPFMCZDS
	 Vz+Ox7NjFwW1wtQUH1WOF+cs+UEeiwZgHT+C5njjYBs2njikLCgIQ0RKdfPsxEEEUtnWr
	 4rnsbd3PzV99LZQVnz03m7gxd5RtTJknPUG5JDQoZM28H5HbEXgtHL8Md1ghb5awSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=;
	b=G8VBYCmS+O/BJRkzz9Hr0paHYrUQpa04BmKUb51J2RV1/tXz1vu4b3hUAy+zd/hzbmke
	 jH4opUf4KmtrvcEs0SSbmfJAt1xPuwSlTQkM7y86/0zsNi9NNM7Vx/+NEUjThu6Wg6QEp
	 krmAp/7rTmE13o2ZRn85Lvd5K3Ubkd4etFk/2p3kz62bAX2YYIyG4S15ZbhGvmMNnZmWP
	 R+ZeeB7Y4hmhfT5RNsRuxh5KeIT9c0OYy8TK0CVxbMRXIegWrZzeihMqTwt6IAfV+54QB
	 zs53yt1NckPobLU3omaRHCutT5Vur0uXCB0Lnd/SBfguu06xjF86E4n0IIQ5k55xmcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DwJTdQXa;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99D606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A99D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DwJTdQXa
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so9471125e9.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004902; x=1795609702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=;
        b=DwJTdQXa/iSzaeeOAEmRihuTWLJZ/OoP86mPO9H0wCzLqDckv3ZdhPOPpPmwTt2ft3
         xMBYsYGOKfBs2BlDoZoiCFMTOTOjrToZCzR1iyUtpoWNSofl9DzSTVOqZR86mnA0gqJU
         zS5tJld9p0mJ/3BvBKiinJIBiO5C2jAOuxrzMpEE7dPprF0o7wRzM+q1LYe7ZX7K7dRL
         Mkqn6/8p+mkDpH/5rM5/HxVol3KezCHmsJUOBubrVS+8jtb8WoetUODA33NkVB1rg7va
         3988PppSIfhAgb2JEIBvJ28xe/dgl/ok+xcU2jS/9SQdHsyb9xDbX1obloDFWL5pprGg
         NlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004902; x=1795609702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=;
        b=1zek7wHbAtXq+LEzOEpeB81PvYG0OLLYlcSviu+QkRiwwwcemMlMLwn9n60Lkdpyam
         Txz67ABTxNWqxfuDqdx0acBsMRFB2/QfgOuVlc/t0XmHE56VUpR6cRHohjZ2KWRSIWbc
         8OtkKPOXTpXzD0dIuQe+ohLF71thOVWNkiV1Th6qZaVC5rPHo/qtgUCR4SHqEvuYyl/q
         5hMk4x5+qbq6kwvXbLsz6Hd2UHxgHIauY6LY631JgwoWEuEHaQAMcDkslfD1KFfWThn1
         4cDCC3PPBU1/LCl294Lr8smdu6NAXsXDM++WMc39mRRjORD6WXNG8xl7ZGn8bzfITNx8
         nGCg==
X-Forwarded-Encrypted: i=1; AL+hErFb0EJkwtCkLRBW1xmtkKt7nRkg584oCDxkMbqj35Qka/saiSbk93ivQneazMwQwZxd2jYPWetY0JNS@vger.kernel.org
X-Gm-Message-State: APuU4Z+qfE4n2B5PsQse1G26Y2JpyXwinJ+AZ83OhEUEiXXSsoBAru1P
	6OS36nLUxdi2btZm0hEpNqt/2JpbrKB23m5YS56ID4DT9sCUhESstauNr1BK8RPSLDE=
X-Gm-Gg: AYBFou3iJN3ozTyMkibn5f+UodfzqNDSo1Bo1nopBi3iqYlukspVeA30RbSLiYycykX
	RIYJHeQO2wdqNL64KzccAJU57MKt/UvDBhAUl/9xKInd0FIxXD62+Q5rDbi3XX3SF1XQSI9lw6K
	jXJkVeDk5eyukaa9yIH34QEVZ34fllIXz/073mlx43AHqsLwN+coC32rHreLGMBA3kHP0a/11td
	dw9j5mHa7axCG7W8RYpwY9iIkTMw2gp3PeYHfL26ytTu1Rpv7eA24Q9i5+IEuuzeJJyYgD7H7mA
	m/A7uhfTWqFXkVY6Jbbke3Y5XLFvGMYmlk8m23EzijyNJFRwZvERl6Cd26fPetVQ92q5fyy6HNy
	sPqOiHlvdyVYatZ69yvRY/FInHYZQuS/upmMcTLtV1buQEf6a14GSh0uwyXnxWAaCqSMhNguKqj
	m7+HN1kebcgphDacj/r3o13wOQwjhllAz2zVgmeliej1zMiq9f9n/xhpxw49Mu5CY5t8bg52MDZ
	FNQcRT6aa1mQMmF+2bVxk7l9jDI7sX3nsyURmu48DZiaZoEeMNSWHSznotrPf+xgecSc1PxXhY9
	H4IZKBvv9LpmPYH03ZzzJoOqNUnbNVDjY8uEPP28JcvSZEaAhdfvA86XFU+mMRlSDSXrtvzxVvU
	D5Q==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr46698525e9.1.1795004901817;
        Wed, 18 Nov 2026 04:28:21 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm64858355e9.7.2026.11.18.04.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:21 -0800 (PST)
Message-ID: <49a9337f-6808-4f30-b826-9a280849a51c@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:19 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 11/12] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> Each core is on its own power domain only: core 0 on PD_NPU0, core 1 on
> PD_NPU1. Measured with both cores running, the results are correct, and
> the nputop and npu domains above them are powered through the domain
> hierarchy.

No need to include lab notes; we assume you tested this work and found
it to be working before submission.

> Label PD_NPU so a board can connect the NPU supply. The IOMMUs use four
> clocks.
> 
> Also set CLK_RKNN_DSU0 to 594 MHz. Mainline sets neither its rate nor the
> NPU voltage. On the ROCK 4D the DSU runs at 786 MHz by default and the
> rail boots at 750 mV; with both cores running, each pass of the 5400-row
> test has 11 to 25 wrong words. At 594 MHz the test is all correct. In the
> vendor OPP table, the 500 MHz and 600 MHz steps both need 725 mV.

I found this wording a bit confusing. I think you're saying, the system
boots into Linux with 786MHz & 750mV, and that configuration gives bad
results.

I'm not clear why you picked 594 Hz then. What does the vendor kernel
do, are you matching that behaviour?

