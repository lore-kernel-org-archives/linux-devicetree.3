Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510835;
	b=HEzihKKKuZn7K/ND1uyk6j7isWndvoVyxjKwf9DpRXoZWs9J/J6r/KAT1Q8CON0LsDln
	 0LwThaKoS3bFpaiHo/Z7yodCtVEtZxbnjKsZGs1lDNRLQzkBim+ax903BJe8E0MJm7Oxm
	 JInB+9bC+HS95EFngiwizn2441AogtCUabwhqRkP2lhrtuzeskDinH1wT7vWQ3Rehcv26
	 6OLjMSNPkmtQTZnQj8vGysjxgYtjWoIG1xb1QchFqP+KY1DdXpnfklSmGSNefIaUazBur
	 Lb3rjYzpaDCfE79ZRzef2WENiOmM3e5vwft+hdoMGPAi7Tso5v7NcCgVSc4HSJFY0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510835;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
	b=ROdnj8sEc9GMcLHoolMgoID9YE92NnMyigi9d7SpZdO5tZj45tWjJz2850IKqRB0NeJR
	 8CQ5aPXvGeZYV/03mxPPW4yijUT6N0Luw9bMjGTizuppOi0f94i0goYh02cgHFJ6haZ09
	 QJi8G/pR5DEly1oWaz/osf/qB1jzDiXTryYEhGjP/kNrHzNtsUigrQ+NbzqQ3VBOrbm1q
	 uPXvyUm0kN49YB2E3fFMw6GtytriDE0sUci/xtvVougpeMnjx+4F5Uy35ZgyvXQQwl/bs
	 7H3ia5b1PeY12EGJ2V6jxAscLX0vpJ6GfN6D0X9ek9ivro14KoKUN7Uj8ZENM1bngmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CKCeQ3iv;
	arc=none smtp.remote-ip=74.125.224.97
Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E760A260F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857E760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CKCeQ3iv
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-676858d42f8so2817700d50.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510834; x=1793115634;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=kGck5wugB5QNhqmhL9CYb/InLLtoF7UVW/ZcFRiAx+fYMe5Yyd9JoRzf30oqoeXOPP
         FlJ8i9woHUzPyV5FDjzZ9XaTxVdWGfzqvZJ2KWHlzQIS+gj8z5N2VXwqilx9c1Kt8Tc0
         34jH8hmR2nyIUlrLvERy/ZRsKnwWpicyTUI8X3RNoGv011HAhoNTn/jyV/CwpDzMpmFs
         UmTSi68I1bb5gCQ5vB4ApZ83aEX04Z489uE1UtnVoG1YU9cVOe/4yCvfCU+XRjQBzC5r
         /iz+4Z+V2Mk/myFVO3+ZgxHmd3Eis99RziCvOdlrEqGOSzH794uR6n/padRVmEx3ec+H
         7d+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxLcolW76cct1rzX5/F6674rqbnCbSRt0BzR0AAPdAoxpbLI8QSypYM/RgUiI+C3YoJaR2t6TyHbZX@vger.kernel.org
X-Gm-Message-State: AFq9FYIxH40jfne7DRjMMNu2j1u3MWK814G7/gEV/S/N1Wyih+p4GMJh
	rl7QBSwbqSEVGh3F/5xgXPXKVqF8cKvaw5zQqAhjHySEjwm3JZz7YKyHwv6/diTczRGaART447k
	GpLeK/l0AK3UPw9z+RoY/yUHS4l8hkDgqLFptYYwcQsUpJ2pZWqPL59d9gi30moUdFkpdo92tsG
	AZIbx5sKzczsfkKhQAPyE7WPvFS7hHPROSIyAbECSXSc6KcjdtbQ5N6BeblEfrIk68hET8XlZf6
	MGBPzXUeuj15mRT8xkk2A==
X-Gm-Gg: AYBFou1fCeOHjrnv+FzOsI/EKRTvMA9/IRnVAxQxHaHX4WCX86QM/HgGAC95tCZhp+U
	oYmSxSkvLeWi+QgIv7hExvYWQ3krvCurGT5na0y63h+WfmG+T0PVpipVpOUlzfHJ8R249PA3F07
	YFdmqdTU6aDknK3cr00WOGwaq9boA9MIFnYLdkknK2Yc1FHoVHnwAg+rgYl2JynHLzQ3DQJ5cKl
	acsxGKd5QQtUJ56f7yj+zhuNu63tmw1nEPT+xrw5bWZVKaPK7pOg4yVTR/QRk0+b6KueeSRoJ3I
	/AlNbqKASemrIcmEI6zg/RIk6bmp71mNP1eCU9Ti5RiUzSQKMc/KrKewa9ELUSd5JWNt7MsY+dC
	ZHkckjbcpXWKTDL2bRwjXgvjlteNNlXv6x3PE9KnTPs2iip+amvv59zpeFYNuXyxIjwRG+m6kTa
	KolO5HWfN2eytho28MkbYYfI8m2kdKPb7fEdq+lTrF
X-Received: by 2002:a53:d018:0:b0:679:992e:3ac4 with SMTP id 956f58d0204a3-679ca955141mr2628503d50.150.1792510834253;
        Tue, 20 Oct 2026 08:40:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-679b1c991c7sm233376d50.5.2026.10.20.08.40.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53661e036a2so45360251cf.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792510833; x=1793115633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ML45x5sW+PAr1KGTLm2moYcZjhtqIIktLxAFW+bDKzs=;
        b=CKCeQ3iv9IkMTBHedQbALnrWjXexnvntQNA6lH2JlUnpBZahkwfuELRlVRbFaU1+xG
         RU/ox/q36oyaLE7l8WXqB7pBm4fIf11IIuL6Mx1SmJHqm0AN8nBLvgWL0//ZIMklgwAt
         qEx1+hegNi9CukZZeVH3bRDi7PWQ9RBSJD3Cw=
X-Forwarded-Encrypted: i=1; AKwUvByi7vY5oCTf857XkCgAMEb0ezFZkw2+ZEQilVoqSiWrfokk8A5XrexQavtkBmofdmTAXuA9zSN0A8fI@vger.kernel.org
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164541281cf.74.1792510833302;
        Tue, 20 Oct 2026 08:40:33 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:b0:535:dd0a:c09e with SMTP id d75a77b69052e-53646083963mr164535781cf.74.1792510828049;
        Tue, 20 Oct 2026 08:40:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm81961331cf.14.2026.10.20.08.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:40:27 -0700 (PDT)
Message-ID: <d31ed7f0-2b4e-46a8-9345-68173710dd0f@broadcom.com>
Date: Tue, 20 Oct 2026 08:40:23 -0700
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
Subject: Re: [PATCH 2/3] clk: bcm2835: register the BCM2711 GISB clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-2-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The generator at CM offset 0x1d8 is not in any documentation I could
> find, but the firmware calls it gisb and runs it at 200 MHz off
> PLLD_PER with a 3.75 divider. GISB is the register bus of the STB
> peripherals, and on BCM2711 the GENET MDIO controller clocks its MDC
> from it. mdio-bcm-unimac wants that rate to work out the MDC period.
> 
> Mark it critical. The firmware enables it at boot and nothing in Linux
> owns it, so it must never be gated.
> 
> Checked on a Raspberry Pi CM4 by moving the divider at runtime, the
> MDIO busy time follows it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

> ---
>   drivers/clk/bcm/clk-bcm2835.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 118df86d717c6..bc1de20c7e00e 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -117,6 +117,8 @@
>   #define CM_EMMCDIV		0x1c4
>   #define CM_EMMC2CTL		0x1d0
>   #define CM_EMMC2DIV		0x1d4
> +#define CM_GISBCTL		0x1d8
> +#define CM_GISBDIV		0x1dc

Yes, those names are correct and accurate here.
-- 
Florian
