Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520960;
	b=gm9725FRGTh3zGa621/YEs4tSyywRcotA67iWtsBUQVXOJxoN99tTe2La4/ngfpMYVpL
	 FswsTgETSKLbbPMhBh5uBrh19bmXKkvOnPL5hX1khZHNPao0sz347j9GE8BKIILFT3yAv
	 nONDvxZO323s7kkOkuZ2OzJkmuQ+6jeU5+XbxHS4aPlROkot/pH+VEkN7DNJ9/zSgOriG
	 uMfyv56GWpjNS0zRSaHvxehaZh3fQa8eTOISbdHJO1BO7p4ckBXvMrPs+Bu6JPiYuZDah
	 PbwI6nHQ7cSIFvAM76+s3/oH3lDnRiwvOP/gw58KkggrY+xkxYt546BYe9fkS4NFTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
	b=OCr2uLqcDTplayXw5W9XM+cTFVCo7x6NgyN9VOaD/2IjQj0KsSPYxhRLiVuuHeCdZsQE
	 QskuXjV0ujrSprs2TLiEYP0YtTk1DyXJ4U/I2is5IFnQKnEJ52K9GE7RyYDIy2yMKUIBF
	 nqfv6qPwnm7s1YOr36OPoCirpGBDKihvrqC9b9+/L41LH7aEUaoF6DbHNs/7ZxmqWAKTJ
	 UoWufqA6A3TrnHgOA0ORPWxXlLW7S8moS3K2NcDMj2yQC1rZbMmlodEBrrjJ+nVbqegxI
	 IejHkUXMR8achN1QLngL2bbON5I+3JDUVRXdC9uuA7a+yoisV/09PkEWdyF0vZPzlBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ka4Ljsuk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93778606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93778606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ka4Ljsuk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso48120805e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795520958; x=1796125758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=Ka4LjsukkiiGtoUMimX5MeuAtQ4VDcf9Uy2Men64dsSuoCJ6KflQMJ+8//f1c4kzqf
         +ftiWLIY1c8LW00sDgpJRLd2CSWyvM7t0Wi7tqbi700yYnhWOjwCDDdtmkY4aj7dKAPT
         cglkALw7ZgC7uXUiYGM+om0c9yKIKtfJ1K02mEtdS4aczhGKwVpIoR/GGnymT5cejBtL
         itAZpyD9oJyFIHGySQKkqmWzDvtMrp/olxLqQ2cLC6tbEkD0rbvK4k/1E/V7mJDLfOIc
         TJ/nxOFVG7wfQa1coPvmzIyf4BY/h4AvL45LHEc6k/7jpvhbsKrtkBlDMchWwETXwj41
         7cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520958; x=1796125758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1NeJEfZebfbcpy8hj3dQLRnIcpIwRmtjjuLE6tESEc=;
        b=uATZOFiP3+L2HZNMLb9gnRM8+Q5Jk9Q7TClox8+ypIaioLLl2rptA4YgCzDjFBuNp4
         tfbf7iWqV0EJfcqiWLiXwMm2i96QveoTOW2B5lbkJ98d78WUGMWgvlZeq8Sx3kJOxZnH
         cRtucoUM2keVP651k46/wIhR7WLrOuxQuzYuk+dHHXk7o22BkSphDPj3A7FpiGSWxK+o
         FBYXd27i9nDVnKi4ZKc4akW+uYCiqMcRWvpcN37Ydf5unnXJTktNENsH3r5+ILLsx3cN
         XV8BNN0mn6ZzKN1riHkU1gu9X9vf+ZSNFcsmuk1Q1N3y66Qzg2pUu3tXweJMAL/I202b
         kaZg==
X-Forwarded-Encrypted: i=1; AL+hErEDGY+tZyKGvLLvlzPrRBJEziVJjTFh44+EEw7JUJ27WEd2M9Si0ZxeHff9UXryokWyKdVesH9A9/4N@vger.kernel.org
X-Gm-Message-State: APuU4Z/HO+FqYr62ixb3m17pEEXkkJuzhqfcNqarM37hNct5IPl5ZRhF
	Uu71la8IlRvRoV0ObxFaZ25NLn1W9NXQaYghl6Vj/c1rxsnzyLZYuzICIlpNl15G8Lc=
X-Gm-Gg: AZFdTZfUTI3H61u6CF8uBsYA2r89Db9p0m5+XADrI8yRt/XzOFvTgYKWPl3n2M1IBSM
	tjsOUfoVTglal2wo17MBNRQun+OFrxUBPQ7XS8AI9Iyff/hDfnjLRnieGKXyKLU5bWJksT78W11
	L/hN+QaqbrONlPiNuejekYR43B0jIc4PJr+NucUIWWM6JB3c1NmoMTsFstDo6E/hWQlIveEiHrd
	IKtgHhXHaXR0hJym6sdxPPlwMtZGEuhtTN4zKWc2jz2+3PcnL8w69xJv6PsKDchVQzdVjjLKVIg
	7/j2ScozOJVio36dIpXzdSSXSWKnMNV11o9/caz1iShVUkncixhV98kmSDCs1mX99r44BAiobez
	oYe4xUka1Kb0LFUdLKmE4gLZ62j2MoVhjvM2M0oaKg2JBYIQzDagjPLs++DRNvliUd/UyTIRP9f
	7KcB24Kj9ZTcQjHcO0eC3JSo7vYPuMaPf/EEpohgdIcBO9Xy7+N4QdgSthVjiVYIYN7vqaOpU75
	Ao/dRwGzgn6JWDeEDecpMEnrNFqc1bosTiKeUDMSHRZe0qfBo3fU4tszJ7/QObjGDByt6jFv8El
	ST88zAtyho+/QGEUNz8Hat8ZZIB+DfJlqncxs1WkIH/+K/bOr5oCxbPYUP5urElaOFodrv4vt1p
	0Cl6oi1tsMpNovqIVExDjyaU=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr290637705e9.16.1795520957605;
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm416542295e9.10.2026.11.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <99f6fa65-33f1-4865-9745-c092fff2e032@baylibre.com>
Date: Tue, 24 Nov 2026 11:49:14 +0000
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
Subject: Re: [PATCH v18 7/8] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the two NPU cores and their IOMMUs, disabled by default. Core 0 is
> in PD_NPU0, core 1 in PD_NPU1. Label PD_NPU so that boards can give it
> the NPU supply.
> 
> Set CLK_RKNN_DSU0 to 594 MHz. Nothing scales the NPU clock or voltage in
> mainline, and the boot rate of 786 MHz at the boot voltage of 750 mV is
> outside the vendor OPP table and gives wrong results; that table runs
> up to 600 MHz at 725 mV.

I still struggled to understand this (particularly the choice of 594
MHz) even with your notes, but I think I got it now. Suggested rewrite
that will hopefully make it easier for others:

---
Set the DSU0 clock to 594 MHz for now. Radxa ROCK 4D boots with the DSU0
clock at 786 MHz with a voltage of 750 mV, however this gives wrong
results and the vendor OPP table suggests this voltage is only workable
up to 700 MHz. The rocket driver does not control the voltage yet, so
594 MHz (GPLL/2) is selected as the highest rate that we can select for
this operating point. Voltage and frequency scaling could be implemented
in future to more closely match the vendor driver behaviour.
---

Please tweak something along those lines, you can add my reviewed-by.

