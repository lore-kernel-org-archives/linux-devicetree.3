Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699715;
	b=UJm0kHG2IBDJZIhXlDwuFYnzqW41u6r4mI+vbqGdjlh3AVyKMtLPSmXx9i7N0h9yBze7
	 54AW0kO2IYT/SIT/xZJ2NjTjK3+CjLyfe3buYZ47gGxIwpG+I/JLdG+PqSn03J8n0tQRJ
	 SAE0nwadqRPrLI1gt/J31LUe1QOC6qOOzCF6Vvo7MKXGcDoFS/tnHUGTk1H9jrDfqFw/A
	 lh5SMlBj1YZUS6S0ThwJJ2iuF9MuzF8MnLxrNz8QwiuQJVZg1AFcnQwOR7yDQRnkWgW1/
	 ofImSeVRsXIBgutkFsiQhdrBPphxDzMpD4E85X1i3xqwpsoiH60nucxHk0X7obyRdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
	b=VQ45YUyeCylUzm1xbFadyKdEnwz43q/GIYXe3qxXe4Vpdvf/cDFd+P1k+1zCemLLSeWv
	 FIskgg/z0uj/Kcu+fAjd51ZXnlfuTkjEA7JshwACcOweSPS+LcaxJnCh5a+WgZqXcHFtO
	 jkMLFilWJLUWnwWlo9LyS/7tmFC9vgywnuJ+x2g0MA5lg70KsDRa0BmfH+wr+HwNU3Nu9
	 t4u8EIvYORvz4ns8PEjYoi1IExU6v1q4IM1zo/hl1rq+vSWwf4xupHvXHbxC92f0as2pv
	 e8xKoNnAwHoI1cmRQ9toD1NCFV/GnR4hKPk6FvovjaBDJd+XRXsjKutNmAhzQuSnsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MC/TKS47";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3704606A334
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3704606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MC/TKS47
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so13610924eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699714; x=1796304514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=MC/TKS47PCVThH4hxBVbgYAI17PI8aoyvnUrzLlf5cUFLIk+p2ddtVf+hQToBZH+Q/
         rB5Im9GJK7ymW6o+kw2H38ubAlvFSPrnLV7QUMeiielvCCVXjFgTv9pPaMj7j5bKFWgq
         IbMU6BMgevQG1NxYkx63x1CZ1CrFMrFtSuCi8sABEky3K6kX7E0ldh4+6UPuYNnMdTHW
         Bz1jigNK9fpe2VkAaSyGXsKvGbRhb+8I4k8LzZkkFdqc/bZrTYAIonP49b8b0MsEuwkT
         GAW+ARRDnT9SD9ayDaZpUz7XLSvG1CfXy+gvHuMerhQ22jporeapnIv76onGGYCGVYpw
         lXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699714; x=1796304514;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=p2JVAPnT/3wg6U89osm5g6/FQPO6FHhk0bwdRN+WDcpZM0geSHcfPhSnMh+y4gvJNC
         kanNG6/8ITu59y31O2hsqJhK8bS54IMvh3uFaPvvUPtUqTmg5hdykbBH5Z1wzMEgO0aL
         P5Cuof/7mRANXDU3MWGAbXZV0aX9F3UfmvLOQKJEYOfxxylrcr/BLOSHJRgbsq6yYVYA
         Uqf9iqIjiOzbW9zlPLqgtDM7oernrZcpCgF+BJdq+H8f6EaSZeDSg8MiqwCYg/IkFQYP
         j56bA/5Tu477eCSnSi5bAmrM1XCPDYoTiMffyFJc8QcZst7Q2mEUGZNlBJqIJbpH3ec3
         0HMg==
X-Forwarded-Encrypted: i=1; AL+hErHRyfzHCyHvpLXzktXPi4Hl/+RujvCYR7/axk/EvksbIFa8GHjZIeBLj6suay4yzPsM/WT4pn+ehmoE@vger.kernel.org
X-Gm-Message-State: APuU4Z/t/mVQfu+QFu7mYlcOpw7oxXzcNZ2YzOrylJEah/vYcwKlpgL+
	Xlt3aRuAa0duBuvdXK7mlSVf4k+1lMPfmMHB4PvrFG+8CRkXTkJXuKqE
X-Gm-Gg: AZFdTZe2AI/sQratm/Z68RlcBBpafgIVzy5x0TGGU9oJ1eMLVwAL+FT+LIW6XcWS5u8
	MKMh5QrbjTiSMcapLVQ0LAJ3s+iCHppTCbRzD3JQsV5J1OlOrCh9Tn6zgMVgnJ30VORQR2g2G/d
	EM82IwPg6Xm2V+BGXKh1Tzf1Y92o9P4mSumYSPKtgoS9bJfS9aiRadZQ+azdJuKihk7/7ocb5Ip
	pKbLyprAC4pjEPBH/5J7l4p1Pp2zutVUrDZqiQldJeK7pN52WZfhd5hmpq2vsbaK1rD0o2DAU1Z
	c9T/9mSN/t2PVWyI1doL47Ptmbf7VL8GrX7pRjOC+rQKWtT9pyPDiXc2OoQBlv5llBmNJu+gdKO
	Pz25WL4UkEHcaQYSwj3NYzWTcpim+WhOmDfkXynLd8fpYq9zAOYBh1JsGpESyTI81DlCOZvSdS2
	XGu+LZkryF4DPZfZD3DLCN2PUodmCvZJymfKL0XIJ0TAxOfFCvXY7ZD99oms9KJ3ioqBPwryXi0
	ib2l0vJSVttuAUfXl+FxYJPGGbb+dj4TsdAB/VwxeWjdU+jfHFpBfu3r3/Psac3JgAXLoiyDpmp
	8DElYZ8ARENL2Qux/ywZPWDY/zUlsIH8wqlpyfW52sLVeI1GeFYvjW2e4EALJ21od2I=
X-Received: by 2002:a05:7300:c00e:20b0:386:c3ab:ab7d with SMTP id 5a478bee46e88-386c3abaf3bmr8681892eec.3.1795699713612;
        Thu, 26 Nov 2026 05:28:33 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm59213477eec.7.2026.11.26.05.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:28:32 -0800 (PST)
Message-ID: <86a7174f-c44b-4663-862b-3631b0d6c5bd@gmail.com>
Date: Thu, 26 Nov 2026 22:28:28 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v4 00/11] PM / devfreq: rockchip-dfi: cleanups and RK3576
 support
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> This is a combination of the DFI driver patches from the following two
> series to ease applying to devfreq tree. It is based on devfreq-next
> and there are no other dependencies.
> 
>  * https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
>  * https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/
> 
> Changes in PATCHv4:
>  * Link to v3: https://patch.msgid.link/20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com
>  * In PATCHv3 I accidentally used the patches from PATCHv1 as base with
>    the wrong DT bindings; this is now fixed
>  * I've fixed num_clks typo in kernel doc (Sashiko)
>  * I've fixed incorrect LPDDR5 BANK_MODE_MASK for RK3576 (Sashiko)
>  * I added a fix at the start of the series correcting LPDDR5 bank
>    mode value (Sashiko)
>  * I've added a fix at the start of the series avoiding usage of
>    uninitialized memory (Sashiko)
> 
> Changes in PATCHv3:
>  * split out DFI driver patches from both series and merge them into a
>    new one; clock controller and DT patches will be sent separately.
>  * rebase to devfreq-next
>  * collecting Reviewed-by / Acked-by
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Nicolas Frattaroli (6):
>       dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
>       dt-bindings: devfreq: event: rockchip,dfi: add rk3576
>       PM / devfreq: rockchip-dfi: move to per-variant const structs
>       PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
>       PM / devfreq: rockchip-dfi: use bulk clock APIs
>       PM / devfreq: rockchip-dfi: make RK3588 use its clocks
> 
> Sebastian Reichel (5):
>       PM / devfreq: rockchip-dfi: drop incorrect shift of LP5 bank mode
>       PM / devfreq: rockchip-dfi: initialize dmc_count structs
>       PM / devfreq: rockchip-dfi: move register offsets to variant struct
>       PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
>       PM / devfreq: rockchip-dfi: add RK3576 support
> 
>  .../bindings/devfreq/event/rockchip,dfi.yaml       |  89 +++++-
>  drivers/devfreq/event/rockchip-dfi.c               | 297 +++++++++++++++------
>  2 files changed, 290 insertions(+), 96 deletions(-)
> ---
> base-commit: f9316c13d6f621af4f6f4a6089d3c989ffe899e6
> change-id: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>

Applied them. But you also need to send the clock patch[1] and get it applied.
[1] https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

Thanks,

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
