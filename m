Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425828;
	b=ZAGubJfh7TvInYTrW9n55DOcUS95qlQCSbNxsUuWuOZVapDpsrxkaBSLxcqkiP6xh4L0
	 RdcczZ3D2CGylb1dxZ8HAMq2CQ1CdeALqmTVaDP0JbE6YEG4LdMJVe/Vu60q7nXwt/mx2
	 Av88vaTebxRltukrdZB8jON6NucyoO7nEKRCenIDEoPcVL0wFHY0UEsxYO/7tYCSYfxAr
	 gM31AVfO5BH9gY3zCsMgcz2J5z2LR6Zrx4Rh+4aiNWbEGf1xGscfChu2IcYmKQVnypkXM
	 P6BiVFe8BwTWMjxrNUuCmXDvgD0gbH4J8hCVB77FX6x//mcxCkUIikzS9tNO2nFAG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
	b=LubBA8WsxyX4/+P8pjF6hCtjjf5nV/IAqGunsVkBzG4v8thpDyh7ADFJ2GBV6J8Qi7WB
	 zz7mwK/2dEtORV441FqhCF+Nzb4eoi3ob35mpuGWfDgPEaPpf73bv9yoRCTIyg1sso4O2
	 qI/Dn9kRJaGeeTXp9b67y/6enN/Tmdwv3/GqudI9rPtPBtNBR+rXJmWxbBnpDjYQc2cH8
	 shAtrZI81oXmFI5duGy+DJAWND1Eo1CL3a7We5qoEsCN5mANg19ZL65n/sDY8N7DAMtQM
	 E0uHkiFgroGmT1f9CocVmcMdd8bjFOXS8OOlVR1V0LHUr/SS6NaY2qdwt4vlcu1w7MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SMbLjT6c;
	arc=none smtp.remote-ip=209.85.210.67
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E721606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E721606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SMbLjT6c
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-84e513877a3so154061a34.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794425827; x=1795030627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
        b=SMbLjT6cNRV7jwHoT5xyxEi8ORGpJg82W4P9wY1A2lJtdQ+VQjdnh2uLXO9IL2VtyI
         Ny24E6hnma/o5GtU9AnutcqyDyPnh2IlIoNG1khlplkKP1qbAp2AkZpNIdov4SeG27L/
         nrFIUmCGKijBWUARok6iYHcRLhw269k8rLyNVfU6ARTrcV3aCzqR5D6TvfafIZe/lZGm
         0Nio7JmszKTtntiN0hRKSCBUfPmM65bluqnTGfaQWBigAndRJLqL+H107Sd2QFuN9rK9
         twuOiDp92S9wq/pqrnAsorJDA/J1tafQ15MUG7rCNKYom2nCV+0/0piiJVfzKKrhH546
         gkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425827; x=1795030627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
        b=C5kA2VqQVwVDX3NVoAeBBjYJUln9UULnKxv1hBIF0GxO6TizGgkk3nUjQIWTQry4Xx
         hxdsuZ9gtk3EVaGJMuKc5XESm5G/HRl4x8aikfumAYbUCHEj2gUaZi8VvF0wMF++y4Rt
         7kKkY0bXegY8MeIgivEpyYYQ3uBwzXOCNTKZyPvIGgoukEcVQ9JaOhYV/sqCC0JwSYUQ
         F85/lLSy7KhZmx2cBBRb2Nm/7kvQoYMVQi6LclyXotSTOlP/hjYz38JziMipDyNfw1hq
         7h3stFagYI5MsP3PDBt6IbLioa7tub08mWIFiJlCpiVB+XDbukbpGnG8tJ1ztUmnW3DB
         A/Tg==
X-Gm-Message-State: APuU4Z+B2RQCyGbTKMGy55UKZeU4aa6VGEgW7WgLA92lV+ywC1PaXjvx
	pQqTUDC7jRz4WnRCA1kt/kYgnTbr+8/+WkUJLc7UNB3psN3CeNBQHQJT
X-Gm-Gg: AYBFou1LI/A3y7T+43s/h0JrAcN5LoxesuHJqgHLFApV9kZrFByE7VnDVS+tuRoHEin
	i6hIT0JgdUPJwHw1Y19xTxAf82uJR951QNMi+1wPXkaB7nQgl2xsiDV9D3T8c6okFAwsvKrlmuQ
	lrOB8MZM8L04bB1Sox4OYkGDLeA+GU+KQChp4SWZkl0hOnY9cFKWtYsZ7h4Y4IbLYfkHlCU+nag
	3H7Lm268rsnAjFIQ8omL5ScpRto0CmCW4uiTDMw5whZKaygxzAEcBFifjuLwL/m4OLF6rVOFOTt
	FSNWnVNChcXrwlfGzV5S+lfyqN/svenXf9MquB3ifaUfXmdGKMEVpnv3HSuZJbE0c3EhYMMonoK
	p5ecR1bVkwEpTOwj5YdiZElFp+GZIIndb9jqGKg0fKl91aJBv+p/5pb7j74PCPMLQ2IMfCZJ55M
	mB9uBh/PQ1PRHPfm7pdTnqSdtZadYw+xloRARXsIfD72A+rc0lG+hml5AJi0ZPkApf4MG/ANNvh
	Ka4eEn9OUcmHG7IgkAjlus06Xb97tqfbzYyeXlPOJtxVfaxOk23SKVNsXhkKC+cJ9IsKLy1lgQn
	sFtZhQOyBRbPGT+u99TvG08NbOgZ9+cJhISUbJldCIl0ZbeV1mHadVvohtgsx/rr+URQyfVkIil
	GAf2fYxlO8iPMk2rbGjU=
X-Received: by 2002:a05:6830:6d2d:b0:861:54ce:a344 with SMTP id 46e09a7af769-86154cea888mr11927a34.20.1794425827170;
        Wed, 11 Nov 2026 11:37:07 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm5095536a34.4.2026.11.11.11.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:37:06 -0800 (PST)
Message-ID: <b005af5b-96a3-47da-b53d-5dd034b6d56b@gmail.com>
Date: Wed, 11 Nov 2026 13:37:06 -0600
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
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
 <sashiko-outbox-209542@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-209542@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 1:14 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Should "mediatek,mt8173-keypad" be documented in
> Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml first?
> Without adding it to the compatible enum in the binding schema, this causes
> checkpatch.pl warnings and dtbs_check validation failures on MT8173 device
> trees.

The compatible is documented in [1], which is queued in input already. I 
couldn't make this series depend on it because the keypad binding as 
posted didn't apply cleanly to v7.4-rc2. Hopefully this is not a problem.

[1] 
https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/

Best Regards,
Ryan Brue
