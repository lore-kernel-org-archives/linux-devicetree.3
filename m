Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870565;
	b=tRzcqEd9/zqdaLR5Xpvc23pgqSs3CnHLIVNzmKuLRlJJIM3i8cpzlnmjT6y9CqhcGQAy
	 ElQPOQ7ttNXCmbu+eRAyY7HNY8jpTy0Te8QCs8sOzO4fAyY9p4RgR7SHBTmtbmNUbew5E
	 naKRIR3OSmroQeGj76aq79n7nvaEpra5QSii4hEOc4PzKUyMWCx7ed3bvdQUm3fJmDur7
	 3tbOv275mLZHPOax8fbl8Z/qSFdrBgkjec0B0HwIQI8S728AaBeBiLlAlKRYpgXTxeQL2
	 Hrr6jQc7FGF6iYAvs2SJyV7VFfJKsiboNS/XpQpmFzeU/XqaGv6TLMaf1THcLRMrQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870565;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=;
	b=Q3InMMDROKqU8lTMH1rx8e77gq/57uc30ZMwGDZ134n6g5dgiIrLY3o4wd3CokyrO90x
	 OHGv8asVb8fNGZd3k4jCf4cF25DfZs5A0p8TiBClN3wmXpdALUoFGozGD09gzbTcmtyzl
	 aiZ4WjsgTHX8bwlJE55MsBW3eYchR2vsvs/O3jGGs+4uaJ/UiYCqpsRYiuVZa5WQdj8qr
	 iLz1JwofHuAtkybDrwqDMUK8XSC+tn9JbYDQde/NYrohXbZKZZkZFvUZv0058RUAAQzLs
	 EE7sfRuA3Nynz2CsX+O0czVuEFaMWYUXcc+nkJsztQlz0DMiQbRiyoVIrc2I/r1Sj1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8iiICVZ;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924BF606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W8iiICVZ
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8b271e573adso1777562b3a.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870564; x=1795475364;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=;
        b=warGAjGGE5NYn8NP+Vnuu+BJEIIqjML79wBpiLIO7ksMJTF7gnUkAxhEP4Jhmu6tlI
         DB0jvfsOC1VhK+N56cg6c98T/uRW1UW/Wr+Y5JfT4fz/aKDE/z7zvNVzeVTrPJN3PCCA
         hs1tjSuYpePcnZGGn8haSPNtbSIv12CApxjiMQXJXCkTpcIKKtc/f9Rk9/zQKv9Hvt0M
         UJaW81/xDkgpE4Z0bn66+JyzKsz9vS89vvSPmnzPHZtu0OGhRPeOQ1HU3H+SlkMIdVYl
         Nph9djuRnVDsUlyAxiUQ8qonzACFtA/91awp99T0ZktHINB40Wl3V+uqgQlntBgLd8xC
         D4Jw==
X-Forwarded-Encrypted: i=1; AL+hErEDMsid2wHcSMkiHRzriRhCVzYH2FULdnNEzvoJQKciDaqiEiAQDwtGOIa1lkHvDA3NlQsu7kQq/ksk@vger.kernel.org
X-Gm-Message-State: APuU4Z/d3YH/UWlwvSzLDF01sAdf/CbnUaTTrPhzVt7us2plpw9wnodC
	/xdKH9bXY8JD6jxxsc+6Cl9G3DCtVo6O5LoEKa1Ml8Z1IslTJjC1CgIZhHw6HLqCrYfV6ge7ymZ
	Ck/abotPZBGWWtdTXv2ndIaHTK0N9bh9sgfHAknkxZeKqdbvHB/9tO7p4PaqPtNvsgYRA2oDkER
	5WO/rEZkumHfYZLuHLjKA1fvLU4T5Ftqi/Asac9I/TENZvF6Tt7BVM+0R2NgRPa7zitxJL2tdQZ
	BzWalu0xoddT511y+AiQA==
X-Gm-Gg: AZFdTZfIOGa8pvTdx/L3gk+UdxaYqA+cKrRQ4gN9XNqktmlHgTRXzyU0g7ZRKG6Zk0J
	V9kz/T7wDgUuwYX9FcEZiT8icC2ylCM3aUEjtzqQiN1+tiHvAk/M8FyhBYNhOcCowUa2f2JtyIN
	mTYTlF1pvvqNLwMO9MPiw7GNRw98Ko7u+HACwBlSiE0/7ujTCO0Bsu/m8duprAf7bpzfnZAgfmV
	nn4YP9deSjkP7p83KPWt0q4chrlWInrjqv360q0rSaA/3s1HtJh99WUCFCZ4UL6ENz5NtoLB+ZD
	9D0P1LYEuZR7YKmIWVVNmDG2hiIWwwt/qRRSQqRmynWpgVjh33nmOQyFRTvx8svnTfZBIc3cYuM
	YPa9cvnyQmx+VWzajnEnlerT2eiz+XDy8orNgT2hIXpUTS4imf3iSgWNGrFYHjw/tg4cexuA/Z6
	eaRp3dxc33oRyiNuM8/WPBOHlDFOgIGu/acQ09WSOhmYU=
X-Received: by 2002:a17:90b:1c81:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b1b09f60bemr10664667a91.20.1794870563691;
        Mon, 16 Nov 2026 15:09:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb97be4sm539558a91.1.2026.11.16.15.09.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:09:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so5858709c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870561; x=1795475361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=;
        b=W8iiICVZm4aVPejipGeg3kD5DljfJii5IRhp6THOXJNOKxIsoLjj4EW2rN2RqAjMPW
         sm8iB84gJQFPBPL1f+f171/GdFv82+q9pstb8m+IxBWZmOIbbhwf5aTd8d2f+tWeGIYU
         pcIX0/tXq80stq+Q6m80x8Yw+agHwyEOSxDH0=
X-Forwarded-Encrypted: i=1; AL+hErFoX2XV72+Sx7COnAvFow1VDA0Qrv7gtbtjoP51ZfsQIL9jgU0cDmDiftCIWKtKhVldXax46l/AaVN6@vger.kernel.org
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr12089863c88.2.1794870561034;
        Mon, 16 Nov 2026 15:09:21 -0800 (PST)
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr12089825c88.2.1794870560347;
        Mon, 16 Nov 2026 15:09:20 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm35222352c88.6.2026.11.16.15.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:09:19 -0800 (PST)
Message-ID: <1b7b63a6-ef87-4a2d-be3a-ec6ee34c6173@broadcom.com>
Date: Mon, 16 Nov 2026 15:09:17 -0800
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
Subject: Re: [PATCH v4 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the
 shared PCB window
To: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <20261029212513.4126083-2-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261029212513.4126083-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 14:25, Florian Fainelli wrote:
> Northstar Plus has one PCB register aperture for both SATA ports. Its
> per-port OOB settings use separate banks, while the PLL registers are
> shared.
> 
> The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
> stride. NSP previously passed the shared base directly to the helpers.
> For port 1, the new stride moves the bank selector from 0x1804033c to
> 0x1804133c in the AHCI register window, outside the PHY resource, and
> prevents the second PHY from being initialized correctly.
> 
> Exclude NSP from the per-port aperture offset in both read and write
> helpers, preserving its existing bank selection.
> 
> Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>   drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
> index fb69e21a0292..b5fb9dff1ae9 100644
> --- a/drivers/phy/broadcom/phy-brcm-sata.c
> +++ b/drivers/phy/broadcom/phy-brcm-sata.c
> @@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
>   	void __iomem *pcb_base = priv->phy_base;
>   	u32 tmp;
>   
> +	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
>   	if (priv->version == BRCM_SATA_PHY_STB_40NM)
>   		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
> -	else
> +	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
>   		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
>   
>   	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
> @@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
>   
>   	if (priv->version == BRCM_SATA_PHY_STB_40NM)
>   		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
> -	else
> +	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
>   		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
>   
>   	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);

Vinod, can you apply this patch now since the other 5 went through their 
respective trees? Thanks!
-- 
Florian
