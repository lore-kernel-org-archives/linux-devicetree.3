Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645436657B
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042491; cv=none; b=njNye4+HHUfw8heVrEjOHp9wPbH88m6f9fjdN7UXKxP1nKpPaJS9foDZeI1GHlgBq+N4+MnZN9wo5zNZlbqYtOZETvFCU9bCX6PE4LE0iQhatrbPK7a0BYE1m8oi3EdDIf65lPAwGyYdMTmf+xcveJp4zS3OZ2hP2V71n/bVIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042491; c=relaxed/simple;
	bh=PR0isj10QwP95HwCZjGrRcK1KY+Fggropjc2Ve4qruM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EnHtZircUP/0F1nIcKZ3voH2w9hlqn3YkZaEw8wOADZaEerDS6qKpj+VJkLqjdSJSOCWnrbSnAO3UrehVaah2yu6bcDbCSv54liGcaFQPn8OjBHEYkrFMxR85vxBGvaoVV3/Io45A43Er5bQ4NhsMf1FfdwHxS8etU/xPOmou3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=beKarWb8; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="beKarWb8"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2a871daa98fso8606285ad.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774042489; x=1774647289;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHiAoV4+fwbAPfRCTePaiBsLGnqxTeGrcZRHEV+lAeo=;
        b=GipqHw6+7QwtPSvdAM5/mgzafTecpI+kG+eVmgKo8wOZLw4gXUI+husdkX7ST01vrh
         MRNIz6g9s9S7JC4u3pYrkeln6Fipo5EoXSWdUs2AMN3UM98q8Y8grcvGehEHMhktc+g5
         DzCvuuBKSchu9RG7SUvnAbNZvRd51zTtAESqLEArFgOe6ZW6jDaiqPGSK8wgdn7POT9c
         FH9Jm59VyvH0flkbOTHk21OvDWBPveP13lCtdGlREF6xumzyEcyr79uUil23RdwkpznL
         rjbNhNbAJS/y4o8UaqAoioVy9nyJbdTh9TlqBS1pHS3I80KfznDdiaXiEbjyxHc9GXDk
         bRmw==
X-Forwarded-Encrypted: i=1; AJvYcCWDrGKEva0UxEyoLYW6nB4sIOZX6L1MqErz8V9JyDDABPclVhSbAWz0wfWCYKV6yUcPEG2dp/2OlPTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CJPe/vzrgEpmz4G+aBJhdX+CaxShmIG3rt2GVxi8vTmrwgQ2
	eepvB8lV7SYxyDj3YYPbQY+YnGxhyMhIjLFvkOZFjD/8qFJz6VRFfzBuxvkDNaYa/EYGyJ7Np2i
	4BwLbvJ1GlQaKyVU0hdEYJbn31fHdMZoZuMueQwijR0L6JqzlV4Xozm+L64RS3U2XcKf+gOxSRc
	IrMbL1iEaQyiT6yA6WiONBXGBneZ8IUtgoxjs889lZ++DrjJLz9/DPTm/uw6oEZtqbwKSDl3tt+
	mNxbklWviGcqb7+tGp8Qw==
X-Gm-Gg: ATEYQzxpZB1engCDvyr3WoDogHnzlYoCR2wbGiFR67xjI5gigqmrqhw1FcErrraGCbR
	kI9Fh94XkwpI5pmPGSoY26K0cZvf+yhcvfRAV6kmDPe6OgIJt21teWxYwUbcCkZuVEVZB0/gGTl
	Qi7GKhAYgo6yVs9SRAZrg22cXpWM8H6yIJ61o87HmRe1CNnPHQzuopowyWBDy6gY4OmTJWQztEn
	x3S436Elq43/5aUIAjMPWgXzkqHEKMq4R11m77RDT+pKYtnGTWat0s1puLikEaaM4e52KKvN/oL
	elWp9w4l9/CHltUixc+pla8bp2C0faUKB1zdaJWcXa1JNnVx0guOkCj2jv5yoJ72uMJvIdhpc31
	eNIq3+bboSKylYWfUeE8Ju2MKOFc6h0aopqo7hLdPPo1vLgKOepDRAJ4xKv1ctYkU4DkKjXjTw+
	7/o5WGOQN57quK6Un0eaTe3/PJz3chAYhDKb/FUR4/W1Z8GDF99BAz5LvNPNihAbi9
X-Received: by 2002:a17:902:f690:b0:2b0:7ab2:d6b8 with SMTP id d9443c01a7336-2b0827a927bmr43456845ad.36.1774042488926;
        Fri, 20 Mar 2026 14:34:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0834ee46esm4266465ad.9.2026.03.20.14.34.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:34:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ec884bffso919283eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774042487; x=1774647287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iHiAoV4+fwbAPfRCTePaiBsLGnqxTeGrcZRHEV+lAeo=;
        b=beKarWb80H8pyMHf1kR1gB0Wj2YNqyOmSpLAK+hMpPhJ/J7A5CXGqEwRVmPVkehbS4
         ae9ES3+dv/a7NbWxbf9BxBIUWxY2SsjJADsM2Baw51dl2Py12HwunaoSMsOfFc7OVB0Y
         jNSfsPKG3gKDhjjeb/a/Nzqe3QnSoKjyx3xqY=
X-Forwarded-Encrypted: i=1; AJvYcCXmjBv/W0mQaTT93idNubLZ4yhDK5vg0CpBOoJcdSZtqjxcijntjHlhWTLZisu/iLqMq68a2QlttsPn@vger.kernel.org
X-Received: by 2002:a05:7022:6728:b0:119:e569:f609 with SMTP id a92af1059eb24-12a7264f4demr1889995c88.2.1774042487055;
        Fri, 20 Mar 2026 14:34:47 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:119:e569:f609 with SMTP id a92af1059eb24-12a7264f4demr1889984c88.2.1774042486387;
        Fri, 20 Mar 2026 14:34:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c99bsm4972628eec.1.2026.03.20.14.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 14:34:45 -0700 (PDT)
Message-ID: <fb4c139a-1abb-410c-950d-97b1ed44c9ff@broadcom.com>
Date: Fri, 20 Mar 2026 14:34:44 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260319035324.269905-1-rosenp@gmail.com>
 <20260319035324.269905-5-rosenp@gmail.com>
 <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
 <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/20/26 10:29, Florian Fainelli wrote:
> On 3/19/26 17:29, Rosen Penev wrote:
>> On Wed, Mar 18, 2026 at 8:53 PM Rosen Penev <rosenp@gmail.com> wrote:
>>>
>>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
>>> some of them for proper operation.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
>>>   1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/ 
>>> arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> index 617fb55bc52f..7b1363aa1144 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>>> @@ -93,6 +93,56 @@ led-3 {
>>>          };
>>>   };
>>>
>>> +&pcie_bridge0 {
>>> +       pcie@0,0 {
>>> +               device_type = "pci';
>>> +               reg = <0x0000 0 0 0 0>;
>>> +               bus-range = <0x01 0xff>;
>>> +
>>> +               #address-cells = <3>;
>>> +               #size-cells = <2>;
>>> +               ranges;
>>> +
>>> +               pcie@1,0 {
>>> +                       device_type = "pci';
>> There are typos here. "pci' vs "pci". Should I resend?
> 
> Not necessary, fixed it up while applying, thanks!

Meh, this was not even build tested, even fixing that gives me:

  ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CHECK_DTBS=y 
broadcom/bcm4709-linksys-ea9200.dtb
   DTC [C] arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dtb
Lexical error: 
arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22 
Unexpected 'pci'
Error: arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts:107.19-22 
syntax error
FATAL ERROR: Unable to parse input tree

Please resubmit patches 4 and 6 since I dropped them as a result.
-- 
Florian
