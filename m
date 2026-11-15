Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711196;
	b=V8oPjS3azXfKFvk+GAZT4E97EIL71Cr+eVTin+91y4ReGPkVrazLQF2i499qZL9tmgTK
	 ItM1TiG45HSy0RVmjojtFKxwDRq04zEr0mfP4KzZAaMmzq07+UQ7uCg+RaBNt8ESyBeRZ
	 pNoyWVxD0VKNBh4j+8ZVfXefzvfqtZ4jpXDpryJBm0WdOiwjxcXZTSXZMOnVLCoXB0dRr
	 mPGkDqnrHzEz1+ERkSK6I6aVJL+3FbkLSTQwFTCf2I8zP4H+2+HxpSoUHUtFi239FaPlH
	 ky+pCOWI36nTNVD2UojNv3NWgSZwQ0WNRxCu60Al+HhDFQRZ8H+EmV73lQUaiDMgj3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
	b=MFb5fbJ1mqofR9XjAXHRdQ4UR0j6H2fLhTeuFWzPz52vR/kelvEgOrouZ7a+4IMyWagM
	 eeLLTul9Kpu2+aEAs1njRJwEZ03ihApTjLx12yvfeiejrRxpofr9uNrZPvhRBOQJaUG2a
	 1gkryDCXiactqZTrzwLCCb75WxlfccG4Bhq9t39plwzOJnPc5Sh1TsC9UkyOMsHdxxwO0
	 otcRoVtlXIT/2748/wAC8s+noCG2UmaZlSv5w8iCM7XRaAZ4wIruZglposvYV4dN6omXl
	 okU0oWfWg75e9pP2uFxaYy4vFXbouDhb7IFn1Gw2WLqhjpb19nIaYJv4/Prij9M9i7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16F606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE16F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so321463685a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711195; x=1795315995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=qcrn69dzmQolEs+h5yEiGzVJHu4bLX1DKf+xYNeVJXaDRLsor4tZEhx0QaAMSct2Tz
         LN798TXybSwRmQRtctyWLyEz+Jjw8D1neNJ9la9K39X0ZbxWbPtEJbREdwkj+ZY/dozn
         G1DTejOIXmlYRFDHgnWyoT1JygHcZjaH+ZjvOSwRZsh5R1u0YEkp88Aiq61QignskC1k
         DXDZ2yAK595kXGwUTtrSzpqB22ijBdfQrZMXI/vKtcw2O6umgX92Z2Ke6L1QcxCwAo8k
         UGtwfpzn5iCUd9ae//G54GJeHk8wUvPcwBEOmVUPzBikroIQJN8ai85vc7c5qVW1oyML
         ypUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711195; x=1795315995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=e+mF3O+Xk8GCWhepeXeRRNxKISCUvG/8WC2H9TzDkXROrLyGf7BBghlpdSlPAJRWRl
         Pgujg4Lp6wr9Li5XlrU6HOnb/8u77Wf9mzxLgBOA5+ROePJ0e5RQ6TVOG84/I0Lre0uU
         3E9JNTpVW/PFng/llJaWEpKGDXzgpoyhYMhsxw9dhZQinY2EsDnzG4gNhfSq7WARGXv6
         6Ha2IYFU6WaKwYyi1M9MsoSs4T8B5hDg8Gd/aSYOr1wgKi9DyIHS0Nrodji7oolufJWr
         fRYNlo2Vpzh4jgdXRjK1aj+vWlqf5HhDCncnulUOVkl4D6ZCFeG/7/IsvBMIT6WmOPoU
         0IMQ==
X-Forwarded-Encrypted: i=1; AL+hErEmdwjOkK9PXy0/Dm5cNqM5B6qYxcrfB4mTkxfyrpp2Nu6+F4beIgaFyhi03dTMXF2zO0Ft6D6jwUmZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9j7P3jHkLpSjqDXYYBzJ4skvVyrk0F8jRsX7wfAa1uDlSMmCd3
	sH54+5oMzmAitT2mMYYuKfbKKwV/Ndfvs2Wybcav6In8Cyy0+CtTzvGQ
X-Gm-Gg: AYBFou26a1B2bRVudHZHi46TsJ/b182yRgtncSYDwA2eoluaV6uMtwGZp86+X2ne5U9
	PmagoiqJOqETmX4RPlDr4PMa2XM/5dWppKIUSEtCwnLXKBehI6Vg2155VjEIseFhzWJOAJf545K
	ri3DLK9CjMHw8G+gE0L43BNId9/umGrToNlEr+lK+yYEnCeJ99iyMSghCurz8wrrS1WItSYC/TP
	juAB6KShWd7HdNL4zV6H4BabvccYsWDAuP3bEJ/UorNdog3+gdu7co6xaBuieO3Pl/ksGLo5PF3
	AVjcwm/jCuNRA4lpc1Y9YrEFqeFaHICddX12HTDv/E93JwbgRA8GBfeekeV1iyPMFurz35YBeyJ
	6OabhVAOjiO0udaTfHm+BDVQEeuZ2vmQuZxTrg+Zpm8f9f+nSPd1vFZjTa5K95vf1xaHovQI1kB
	cORPbQQOex2M4h9DRIqq4M4afoAArnKHoCkf+iEjR76biihWE5OTxDOopbPcTm5SuE/Oiy6TpHL
	4E03xm3/0brfZ/HNRPNINHM9gsZC9dJ6F2dHgr1bP+tuu/kJddF8qfT/L0c7pCd0fsnAudF489Q
	Nbi5SZLKUqoQa/Gi4cy8XHPqFfVR6yiTjqYhwAweccXCaKxi1i9jR8c4wSwbAZQVyYEnk/vj4EY
	SZyEVRqAehkcf15nW60oQXOLEqoyBj/6AQCWm6rE1sKtDCA6hhwY20hRKO86X4ciOG4vvyVR8do
	g=
X-Received: by 2002:a05:620a:2614:b0:939:fde0:a71b with SMTP id af79cd13be357-9494b86e99fmr1082857185a.0.1794711194579;
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836156sm531348285a.19.2026.11.14.18.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Message-ID: <9c17de44-8c69-432a-a196-90a4765be871@gmail.com>
Date: Sat, 14 Nov 2026 21:53:13 -0500
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
Subject: Re: [PATCH 0/5] Add support for the Microsoft Surface Pro X
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maximilian Luz
 <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X is a 2019-era tablet powered by the Qualcomm SC8180X SoC,
> released in three variants (SQ1, Wi-Fi, SQ2).
> 
> Patches to support it have been around in a downstream tree at
> https://github.com/linux-surface/kernel for a while. Let's upstream it!
> 
> I have permission from Maximilian Luz to use his From/S-o-b with modified
> (squashed, stripped down and split by model variant) patches:
> https://github.com/linux-surface/surface-pro-x/issues/7#issuecomment-6597291831
> [...]

Hi Val,

Thanks for your work upstreaming this. I've been running the 
linux-surface SPX patches on my Surface Pro X Wi-Fi SQ2
(Surface_Pro_X_2010) for a while and tested this series on it (v7.4-rc1
+ your SLPI + this series) plus a few fixups needed to get it working:

1. Labels for smb2351_2 (pmic@2) and smb2351_a (pmic@a) in
   sc8180x-pmics.dtsi so the board DTS files build.

2. &qupv3_id_2 { status = "okay"; } in the SPX dtsi so uart13 (BT) and
   uart15 (SAM EC) are populated.

3. Tested caspar.dtb as-is but this will cap CPU4 at 2.995 GHz (SQ1
   clocks). Added carina's two SQ2 CPU4 OPPs to reach 3.15 GHz on my
   SQ2 Wi-Fi. Please see reply to 2/5.

4. Wi-Fi: I had to revert v7.4-rc1 544d85de4dc2 ("net: qrtr: Send HELLO
   message on endpoint registration") otherwise MPSS hits a fatal error
   ~40s after every start and crash-loops. Wi-Fi associates but never 
   passes traffic.
   After reverting it the modem starts up so this may be a regression
   unrelated to this series.

With the fixups noted above, for
- Surface Pro X Wi-Fi SQ2 (Surface_Pro_X_2010)

Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Happy to re-test v2 on this unit if needed.

Thanks,
Haipeng
