Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321358;
	b=FvfZlxUbapz3R/C2iWVO81XvxtWqWYWd61H/aP4laYby2HvKnk0guvXiXhZXKIf6e7LL
	 vJnuXslyinwAVfeXY3MBb3a9uwdODDI8Wk5FqRKTrdy/RgXUJLJipoXKwIu1q8abwiUgc
	 UAUQAiLduZHCJ/D3fRAJrCGRfeDVN3W3bEAtVTp9UfsDtL7M6z6Ul8BYVoXHh4ruPu5Jo
	 T4dsPA+2obihnF8o9olue88fvWpIjENQd1NgiaCRgF4BsiqcAEaLUs8pVCT0JiD3gY7Cr
	 UYjKn/1gOWCMm3vAKV4GxcG9AhXcsbXP6gCUhHGt+qNATKVz/cHx/ztfCiw+dmRdgfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
	b=SZ5nYurP6gXeVrunPA7XVTYDtsShrzZrRepZtzOTZWaVGbyy9HiQ/G2SOrHLotKMSED2
	 ZDLusqRoT12JN4gFUFPRX6VDWiMQyFjOT/FXYCd/XAMAXhoDkPGxIIn57vevTeCz3DtvM
	 EIwsQpwK3GZC3BVkqVCzl/FYezPxH8WYtcHQfkHi+btIgSUwH826QDa4xc3W/0fFKQsOn
	 MjX04s1UWPqnLA6CkOFr5O9LZILID5DRZTIxhNyfmgxkNgLt+lpsPs1qwv6wov4nnStZL
	 kWrE0KETwp85RZEegMrUmj9XgbpZVKKeg+HqxHHD1G3NAH83aARK/2RoKitT7ijgbUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A326606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 00:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A326606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so954455e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793321356; x=1793926156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=ZAPRZtINaBu5ACaiUNxrIJuRhA6KMJwNCSPkWmCoxJb5c0gEk2peNiYOZsGK01uWY+
         JK2ZnAiLSAb9wgzwQu7wlc/KNmORiIqCLdKJ3V8rp7OCu2nPXGMI65YfO0UVDSWkwKkp
         hggTvq/kdfxRCvNZXPbWV4c/lNt1Hm1ObLO2YGUQKgYtgcBHu04P9jxnZNCY0PN0oSEQ
         nVwCfT7dBNFZlMs9EANTSKKJlMKgmsmpFutOSXyPi/LG2hHCLJp2KJ+chRrqTAAefj1G
         yfSySWiT44U8rH86j9iyZgk+d494y2/QJjxmmj9c2MmCUSbD2UoszDsaxxy73i5hvuJQ
         NSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793321356; x=1793926156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=n0Hv/Dskbu72GC8EmQsET2Q1pXgT8ov4vaOlrEI/M386dEtukUy0TcC7ictTVePsho
         zMIt9tOMvIfiCszoBZYckWdeIxKygd5OMCt58Fu2eoEWbKGAiEovTBXKZHtL3Fg6wMiE
         SD5bNutudZsJ297RMKn3iY2hof5I0Pp/MwgymA1kPFWrnDovEgOv/wqiWurxxs6qqZgp
         audPRwie2q5HR19O1BzHz6loOyFa8DHg0wJIWDndUtGRmZtPWIgm1Iqh0hgqr6JSgU/Q
         Jb9328uIuFbaCSDMugK+mZPJN+ihS3B2PGxDQVCx3bvsyaG5iORC6B7fldqGGwYmLMp8
         1EBg==
X-Forwarded-Encrypted: i=1; AKwUvByFWMyZt1EohVQBwDBa8GnUVJ8ywiSHAZqvKqRdhEMtEY1u8TBvviFIKPRyu/sSFtni7pLHpbe3aXPW@vger.kernel.org
X-Gm-Message-State: AFq9FYLwupT07Yt/BxLfS1V8nbr9vDb17kxFQ+IxBXNascj3/xTReV5C
	q36cGJoacvJFytM33qluRRJNXBdDWoibHZy1+VcTeMVP1w6U9ybmxjtR
X-Gm-Gg: AYBFou13FDJ8yFJEl1TlveCVEfcgHFC3Sd8eE+ywcDD8XSG705PY7JMZXmUpEhGxPK5
	IoE1NVi0yGuDSMvykRVf+WYVcwKkAdp9qG36dGy3de92J0LtNKsSpDnAJ+Kx0haRL6ySOEddx/2
	Zf2O4K4qgXI7+PSvoZdEuHWjkAjFlidp9NUNY1YOr+KGItIIkLp1q9KsZUmgCW5SFFgNBP+O/Ck
	3vd3CiQ2mgADj2MdjnzZ2TllFMt38e5A8uLe4msBBE664rYktxqneSKpmDEJEU6YXoaD5GNuofR
	vmSPcfHXhkLTbdpPBRiWLBFJO+l2B8MHe1Hm4lwZPvD3HZD4j+dDHLY+SusWuklnsekb2bA6mdA
	h/finTSnd3HHXf7eGyRntoAhK03YUxMxkX7PoZLxCFpE5aVAB77VM4aniXmW3/eAbfFXgcSZYAb
	WfrcyIgn7sf2gfBKKdCM2l46jkRAuCmWVvTN8f760uW0TVDrSM28xnaEnZvD7NCZww/OwcvPFAq
	SqxWfXjOOdsFQx4MFaiBxvI6ygIW6EQJehJ4kQWpBV1V/lELs0I4sAzCAAZWZSSrLkvzI6y9qSf
	ruzIrvnrptZTtAVQraOZhaRyREst0Kvua2l7x1KtE91+/+tNANwCGJcI+ufdgaT5sil2/o7crty
	x/eOOTW51eDcaybs=
X-Received: by 2002:a5d:5d06:0:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e6e2c05e3mr2211332f8f.8.1793321356382;
        Thu, 29 Oct 2026 17:49:16 -0700 (PDT)
Received: from iamyoubutArch (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm158055f8f.9.2026.10.29.17.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:49:15 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 30 Oct 2026 00:48:43 +0000
Message-ID: <20261030004903.1068342-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sreeshankar,

I'm bringing up mainline on a Motorola Moto G 5G Plus (XT2075-3,
"nairo", SM7250), and your series is the base of it: I carried v9 and
have now moved to v11, on top of next-20261021. On top of it I have the
rest of what the phone needs at SoC level: TLMM, the apps SMMU, USB 2.0,
UFS, SDHC, the GPU and display, interconnects, IPCC/AOSS, the modem,
Wi-Fi, IPA, TSENS and the ADSP with the LPASS codec macros.

With v11 in place of v9 (only the GCC driver differs), plus the two
sm7250.dtsi changes below, the phone boots with no stuck clocks or GDSC
errors, and the clock messages at boot are the same as with v9. UFS, the
SD card, the USB gadget, the GPU and display, Wi-Fi, the modem with SMS
and calls, and audio all work, and three s2idle cycles resume with USB,
UFS and Wi-Fi intact, as does a wakeup by SMS.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus (SM7250)

Two changes to sm7250.dtsi that I carry for the phone:

The cpu-map puts core6 in cluster1 and core7 in cluster2. The kernel
then prints "/cpus/cpu-map/cluster1: empty cluster" and drops the whole
cpu-map, since it looks for core0, core1, ... in each cluster. SM7250
is a single DynamIQ cluster, so I put all eight cores in cluster0, as
sm8250.dtsi does. This is the same thing the review bot raised on 5/5.

The cluster idle states: the downstream lito devicetree uses the modes
0x224 and 0xc24 for the two cluster power-collapse states, which gives
arm,psci-suspend-param = <0x41002244> and <0x4100c244> rather than
<0x41001244> and <0x4100b244>. With those values the RPMh sleep stats
show the SoC reaching CX collapse and AOSS sleep in s2idle. I haven't
checked what the current values do.

I'm happy to send both as patches on top of your series, or you can
fold them into the next version, whichever you prefer.

On 2/5, the bot's point about ftbl_gcc_cpuss_ahb_clk_src looks right to
me: v11 changed its source from P_BI_TCXO to DT_BI_TCXO_AO, but the
table entry needs the parent map's source value, which is P_BI_TCXO.
Nothing sets that rate on the phone, so I can't confirm it at runtime.

Once your series is in, I'd like to send the remaining SoC support and
the board devicetree, so that sm7250.dtsi has a board using it. Are you
working on any of those parts yourself? I'd rather not duplicate your
work, and I can send them as a series that depends on yours in the
meantime.

I did the testing and wrote this note with the help of an AI coding
assistant (Claude Code); the results are from the phone.

Thanks,
Filippo
