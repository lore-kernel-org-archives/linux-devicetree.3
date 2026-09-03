Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864550AC3D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464435; cv=none; b=SgDiU8FSrJ7WkIz3+2cDXxy3a6Oq1PBTZ1ZBhbO2G5nGINLKXh0M/7glzNocOdvwQP8pW1hIPIdGwUQKlouuoJl+8rxn/uCK7aJzXDPfHtOaj9kba8sG0w1JdFdsIhK2lXONB0oPmp1I1dhzAa/4JYBLeWIRAS/6C8MMl5AkfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464435; c=relaxed/simple;
	bh=59JAhlyzGm7Y0kjtf+cA64P3VtNlNyMr2+Ukst/oW4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdcXtYooYy3KIRYgDxtidBlRNTDOGqhoB2LvmU3DeW1I5iRMH1ERUJG1S9mkNhIKjJClhlmtlOvKXWhqWbUYW7TOOi42np2kQsMCNk6g2CsZhvfanPyX89nIP+Me8YxRHy6Mr26iXD1ptPj2cMGLaQUGHTZhI24W+szYHTvMkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QRLbqf+B; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QRLbqf+B"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc1c7364550so406093a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464417; x=1789069217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p8+z4kiOtdTmn8miWX+XqbRCAv1t3K0Ial/sw+P7zoA=;
        b=lNZXxzARlibTcuzAwL8R/Ckn3T/jnbwbMv+ZLgfynTCmDZWhiO61/9F3WQf2NuqmAy
         MPQEisFHgOgPpwpq5CopQY4DUhbF0u5gUR1aHGVD6Hc8tgxPxf5YoMZa3fRmzofpn0Fx
         9nGgMDuNzEejiJoaTGaR7GjKsmFaW3VcJdKUOoUWdiQKssE15GZoWRF/M/bU3ea5qcY3
         vYNBRQfBwtSFY4MXe/kvIfVvHq+/YfpDd6pWPVCGnoWxv+6qzhxmOjuFvQeoqx+LiEFR
         v4Qke0B09+zqUU9TLTVkj7nkEliO3N/UfOxRjyXpJjZWUGX5OlSBT7U4HFEikaIcZ6kJ
         nmGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzsaHfCXjL2HsJ00AuAHjJOT0znmYTdfiz/fumc8zwjrL36Oz/490tLfpViu00mT/EQBocAFoBtmWI@vger.kernel.org
X-Gm-Message-State: AFuF++mLaXFaUrxlr0RmCbI48oqLfNjo7ocDpq8jOlCv12YU6xUpSGw4
	d8N8NojIHfiJB1Q+ACvKVFYRiBO3/KGis11fs260DQp2hskqey37dMyD+OhgYOeToSRLedTnmDc
	vr2aliw4QlqDz2rTzjNRDwoxmwtmqj06KPS3/qmVfhSp8/Iwoxrz815AHTQnUe8NFIiP4dHcBzq
	XbyOPurRjHx3As+kiFcBiPZu46ileN/9LB9/w4VyZf5dh82sEI6IVB6Gi473mZkoibwS38ZbPl3
	tsdvcgKuUUUlz6vDHzNYQ==
X-Gm-Gg: AYBFou1WtaFAOJjUBQjrSv/Egdkgzf06iZot25ub9Yw8aDWvyM5X5RvlGjlhuwPjyPN
	ZNfAAk65YLLOGHaCuRE1p2XjG3G4ZCAXpoi4PZKA7V7UcyqoY98MgPFGXen+GXSixJxAv3UNhbf
	gjQ08VYYOu47vCFacQqleIynvfrNS9PZXn0ohYr11Eo2qz+ZXhupxGCkQxEQHOmW6hVaxgN+wlb
	5ffdOinI1MrM0QF36n8IQjD55eor3LA6BPQ5NwdUNv7wyMdpkRrySXKcJmynBy2a50xfz7Z2Jpr
	TNMQwmozUv1iJ16NOTeqZYNuL40zMYOh6zcBRQCC634r8YZTxIlDaujRcfq5mS7l7iPEckIEt28
	vKeXL339ie6b8cT0xeFB3tMkv2sl4bWKSKBoJZZnhgcvPgxZVLKB5wJOGkiF8OP3pLKGoswcIG/
	BeMiwoHM+33sRyq4/X+ggBEtzeYD+RJizoDmavvCLW
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr1297614a91.9.1788464416724;
        Thu, 03 Sep 2026 12:40:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39aec45e666sm508905a91.0.2026.09.03.12.40.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:40:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso379487a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464415; x=1789069215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8+z4kiOtdTmn8miWX+XqbRCAv1t3K0Ial/sw+P7zoA=;
        b=QRLbqf+Bl11XLJHyWP1yoN9CPTjwh3uOTYJgbkAi0/8I5+HIFd8LeiharcDDOmSrZ2
         yqHcg6sUMDJDcYyi70S+bG7ej00toaoiIy+affPgjO06CPeW1dhRXC9jJ9xuyBdqYUPU
         3g50ioVgcVaIFGeTcc3ktojcsNh1VhhX2QBvE=
X-Forwarded-Encrypted: i=1; AKwUvBwqxV4ARt5FtKg1sGZ/hhCZREiNH3VJR864lNClr9XWrn2FlNll2a3Ju2RmXWgAWNazIe1USxSKrlN/@vger.kernel.org
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr1274557a91.24.1788464414682;
        Thu, 03 Sep 2026 12:40:14 -0700 (PDT)
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr1274468a91.24.1788464414183;
        Thu, 03 Sep 2026 12:40:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm1124198eec.20.2026.09.03.12.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:40:13 -0700 (PDT)
Message-ID: <ba2ef3fe-5be0-4e1b-a2bb-f0832fc4dd95@broadcom.com>
Date: Thu, 3 Sep 2026 12:40:12 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/vc4: Use the reset controller to recover from a
 GPU hang
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-3-896444373716@igalia.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260816-vc4-reset-control-v1-3-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/16/26 07:05, Maíra Canal wrote:
> vc4_reset() recovers a hung GPU by dropping the runtime PM usage count to
> zero so that the power domain goes down, and then taking it again. Such an
> unconventional approach only works if the driver knows exactly how many
> references it holds, which is why vc4 wrapped every pm_runtime_get_sync()
> call in a private refcount and mutex.
> 
> Commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
> under a new binding.") exposed a V3D reset line for exactly this reason,
> so that the block can be reset without power-cycling its domain, but the
> vc4 driver never picked it up. Use it now, which removes the need for the
> private refcount and leaves vc4_v3d_pm_get/put() as plain runtime PM
> wrappers.
> 
> The reset line is optional, to accommodate older device trees. Device
> trees that do not describe one still get the driver-side recovery in
> vc4_irq_reset(), but the hardware is left untouched. Two in-tree platforms
> use the VC4 V3D block: BCM2835 gains the resets property in the next
> commit, and Cygnus is no worse off than it was, as its V3D node has no
> power domain and the power-cycle only ever gated its clock.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
