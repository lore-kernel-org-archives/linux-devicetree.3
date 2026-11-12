Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499822;
	b=ThN5wWDwr2Jtg6qVEhbrkLavJz7pdAbQiB3Y5jU/7wS34mLhlDGPSq07OQW1beTJA12t
	 0DyFxYLuFbtbzTSMYQTxZa5oYBdAdRo/IgGx7wAtfbVfZPg+C2hwzs3yquCQ49qtL/pt0
	 ZwU4j7UqiOeRuLwgGi9jcRkMUtFmXzIphPyrrhPXzs7iWaf5sM877BLywsApS02CQa7w7
	 DAZhjrWze4GhrmKXYeZk6AmTenvphDi9cBhgGzS+48dL8I7IYXQRFvo/VRlQLuM/xcl9E
	 5bX6BZllUGhazPjS1gtEtJZLoEevnlpfAwLVcIJLOzDi9qFE2qBR4iZkFFjRU4uWTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499822;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:
	 X-Rspamd-Score:DKIM-Signature;
	bh=chOtkRmA9LqcH4xpz7Hul5fzkPX+9e1RBVUmRFQ4sbE=;
	b=2P7aIF8rjFJG/Z3u2B3JEFiqU0VkMK4Q5PvxGR3mfVRxyxM5/0Xt2uvBNh6f04v5c4pK
	 E01bMSq9j0WzS2Sh47e6Q29WDxn+Ou03WOv34jd5ZsCMBCUWKSnVjTsiE6R5S7ZkMivQT
	 TmV0DLiT7z/nRBzfPfoj0bM/ldNqdh1pnyVBL+FgsvzUfR+YJw+WCKeRLC7zFnLzVcJ47
	 XASActkpCL/Q7mQU1/SjB+zrPj1t8F6SaFAeND/y4PdkSEcv40YwZStcVNP76WCLQcmOd
	 KpB1q+/Hwj4ett0YaWX8X5uw3BIDNfkWkI1jw6XlBTO2aHk8BVTlKbTtkhGx0zYszWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=f9LFcXvY;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB6F606A33D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB6F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=f9LFcXvY
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id ECD15608F0
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:10:12 +0100 (CET)
Received: (qmail 9224 invoked by uid 990); 12 Nov 2026 16:10:12 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 12 Nov 2026 17:10:12 +0100
Message-ID: <13dd3297-f264-4cfb-b8ac-b05c53d3c820@lausen.nl>
Date: Thu, 12 Nov 2026 17:10:06 +0100
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
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 finley.xiao@rock-chips.com, zhangqing@rock-chips.com, inindev@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, gahing@gahingwoo.com
References: <20261019092417.391522-1-leonard@lausen.nl>
 <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999905) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.589905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=6Bq9skfW1p6CvrhTcRQngnvs1JbfcWRTcyvjApbE79k=;
	b=f9LFcXvYXYLJ6LKsYRYU0/74LbfOdjzkKFjcsco/PWpx9sJwNbRIduzRv26MuDj+gDOcgmh1R2
	lA7YzyvTarn0W8RaqGzE4g0aB5D4K2Ojo0xZ85sk0fRLlME4IeP1Fs1OmwA1JYcUYNNsVnyWAEFN
	sCmj+itYuCK8X7d4Yxc/GB2iw63A7/2Uc/ffpz6pfmfxWkpjBWshuNygy425mCMDTp1to9v1EpVA
	9eXid+2WSfnXEwyB0y53bOX+nlY+QVUHrPCfKxaY0eiHhBnv3GCREEtB9lrLnbj5TKvoY844R91k
	5pLR9f+2akWQxHG6HPUg+x8OL2eWydAIgF1fNYxqiQuQyF3BVl86flWYzFoAZseVKesV8/jWmwXl
	wl0/lAdkYgGLKkzhHiTZActWAqK3flQQLliggPBZAAhqBvlQTcmVzWYXhbH/S+m0W9UFpqlob4hk
	xKdXacopb/lN6944nO+CyTTKQinGvI/lnDqjaq6uSjeV/U32HAv+Z7Jly2mw8zTiVntDM900PHFd
	3xGcix27TEuWKwX0ET6urawGSuGAxRONBshGOKBWN5YQEM6TDsd08pWBrPxPSRKakrX66XzXHUUo
	/bXtrLZGxxsuHxQFL+Sdc9XlGHVu2YgeoZs2zrCMWQBpgtP8x3Uhlm/ZkapxN4Lr4EQeR1xLGHH7
	Q=

Am 12.11.26 um 16:19 schrieb Ulf Hansson:
> On Mon, Oct 19, 2026 at 11:24 AM Leonard Lausen <leonard@lausen.nl> wrote:
>>
>> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
>> fix, booting required blacklisting Panfrost on the kernel command line.
>> Loading Panfrost after boot reports a GPU power-domain acknowledgment
>> timeout:
>>
>>    failed to get ack on domain 'gpu', val=0x113ff
>>
>> Add regulator support to the RK3576 domain descriptors and mark the GPU
>> domain as regulator-dependent. This lets the existing Rockchip
>> power-domain regulator handling manage the GPU domain supply.
>>
>> A corresponding domain-supply property is needed in the board DT.
>>
>> The regulator-capable descriptors are based on the regulator support in
>> Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
>> delay changes.
>>
>> Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwoo.com/
>> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
>> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> 
> So this should be applied as a fix and tagged for stable kernels, right?
Hi Uffe,

No concerns on backporting from my side. I was previously running 6.19 
and had to disable panfrost to avoid the boot hang fixed here. I 
validated the fix only on 7.3 however. If you prefer only applying to 
next, it also works for me.

Best regards
Leonard
