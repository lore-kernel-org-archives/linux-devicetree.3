Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98710391853
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619995; cv=none; b=Dlr62t6U87EXDAH7UiI967HKgag1xcbzXcnI4ysSZ9DbWagOFbdXP9PZSbzBOx7r4GcPwxwUqynJgj2iGK2oHJBmfP2EDNitukrtkHpwyqKCTJq78ZTHJNMHYujQ3veDgJrVWf1GUyRVFgndXjeS2FYQiufsJDD599SqKRNkGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619995; c=relaxed/simple;
	bh=+b7CFFHgZ618D+Uis2e9wFQoJJRfY/sRed2KpRC4bYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FaWHtibXL8H4Dw8S2DqL7u0rbekY9CbYS4c4B/X2FHXhkUiuI+zEewLSqOkwcUoR5jgikpCXKd+dEXwExltWlpWDu8SofLnDIRy4ibV/FeeU7bAao1o8L+6mNvkShAE0BeV/LJFyKErIWZ245mOgk5WP8w1PmsgsTK2EAS0U2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T9zLs2We; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T9zLs2We"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1240016a91.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619993; x=1791224793;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGjdMwJsnua5C5JwBesKhZf4WJKUTjxVN8HV5NiB4F4=;
        b=eVbMQDgzkfF/rakSysPerxMrvD1raCOXIFHIR+DtLLvrBKZsr9qQVDmuxvVITQ/Ewm
         Ruy+GfC/eRiTblDSM0h0D9uOewHSySG6MVp29iTStu2EssK0HPfVnqbxWfN+vxnkwu3T
         5xNtXewZx3q44KsbznBzO+E1xQShM23Uls1GI7+AsSx+UR9f0sclakjEpsE4WUIQRnlt
         rzSXDiP/526MnM1DCPTOWPCWeas0sX8R9UM/wIdfcU1e2VuYf9vHTjeaAGJSwNNix2zT
         mfKu6fVsMmLXYZ5NiL9ARUcSKcOkZnS5Wk48mEVty4UKY9+Q//0ONyCK4vW2u/soXVJO
         0HgA==
X-Forwarded-Encrypted: i=1; AKwUvBzuXnrOHD1ryHaOb4w4nETtD7c5L/O3ojlJOwJjm2s3BVai8TLtVoqPEljgv0sGBnn/mtGOYEn5pftl@vger.kernel.org
X-Gm-Message-State: AFq9FYJX4MTYMQyL9iZTH7iahpC4jcunaRncfThQgg9EvgGFadAaemQG
	cFbe8ZIdQWhZ6iHYzUnAvym7IuNV+hnbvaootKolLkRKE2vFxXZG8BsV7KLwJn9gMUH9BCPacg7
	QXZPkOIdtTxL5B91E9CZXFNXjZhYzwVnUiTgyolfV97/xF7RA4FPmxbqmU4DfQRgBC5gN8kPKnA
	cQsbxzGjacssKCZWMjR+nrDULJekLc3P8lYkF7OXMdP3TdrXD9XSxHwznVkCJdcibbp/mRAwGYa
	Z/692s7KhjF4NUaJz7Q0Q==
X-Gm-Gg: AYBFou2K+bwQ+urkvLXy6IMho/HD4vhEYrETLWsMyMFBkl265QN1nB3NpKOongdpnw8
	5ThQRbOmtY/vcCSFQKGpa0UqA7eJ8yQR+2EPzU/gSGBOMEtMFqHcHiMz6mDvw9S6nkPfodwUx1l
	iD/uzreubse+oB6RxeZYx6Gwp6xkCK4nOpUuXSkIf+W50lOByQ+LXSxwvAuQuvv0epxIbDr5uGb
	35lrQX+6Au05+7Xv/+hjWZytSEzTRgPUQNeb0oBxPQfFg3O0d80mAPW/v49xkRRJ8mQwZodwhoX
	5ox80qP9iQ9KyRv4W3k+tZjtAOhMbjLvY8bfHaMy1PV6pRG4ZC0IVIJel78sqnYhelT8cuKO7KW
	lv1GJRj3+vBtle/lm+xwbD1J9AxpV7kMuG/u+nKIFl69eeoSzwZ+r4sLPnCInLhKus4W1+ajxhv
	NPGuwzOtcsx8549kwsp9kr2NHJnYX3wD63FlGrKhi3
X-Received: by 2002:a17:90b:3952:b0:3a0:c22d:fbea with SMTP id 98e67ed59e1d1-3a0c22e022amr7830032a91.60.1790619992799;
        Mon, 28 Sep 2026 11:26:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a497f21894sm219893a91.7.2026.09.28.11.26.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so773808eec.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790619990; x=1791224790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGjdMwJsnua5C5JwBesKhZf4WJKUTjxVN8HV5NiB4F4=;
        b=T9zLs2WeOZ0WTMzPllACcc/68+cOEaryRNpBXBD8LDZjb0ici6+6XxGXrC45BsOmDo
         NFX6yEBxOTSe9G9CqdTs1mT1qfT+/F2QKXKSJc+5iE7+hudl7r+b0B8rMc4w5lg73mzk
         mwXjwbF5DQNa9zqTy5X4qfMdlSo1QJG5bUlRQ=
X-Forwarded-Encrypted: i=1; AKwUvBzQmKj7XW39kjM6cXmms7K3nG93stU6pApuvPDz8h01ZCv7Wc0FSMoMEIR2HFNWwSmtlR5XZdI9ggox@vger.kernel.org
X-Received: by 2002:a05:7300:3081:b0:344:1bd9:1f0d with SMTP id 5a478bee46e88-3441bd92155mr11160560eec.21.1790619989823;
        Mon, 28 Sep 2026 11:26:29 -0700 (PDT)
X-Received: by 2002:a05:7300:3081:b0:344:1bd9:1f0d with SMTP id 5a478bee46e88-3441bd92155mr11160501eec.21.1790619989070;
        Mon, 28 Sep 2026 11:26:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm27663297eec.26.2026.09.28.11.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:28 -0700 (PDT)
Message-ID: <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
Date: Mon, 28 Sep 2026 11:26:26 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1790606188.git.andrea.porta@suse.com>
 <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
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
In-Reply-To: <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/28/26 07:42, Andrea della Porta wrote:
> From: Stanimir Varbanov <svarbanov@suse.de>
> 
> The RP1 chipset used on the Raspberry Pi 5 features an integrated
> PWM controller to drive the cooling fan.
> 
> Add the corresponding DT node for this PWM controller.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to devicetre-arm64/next, thanks!
-- 
Florian
