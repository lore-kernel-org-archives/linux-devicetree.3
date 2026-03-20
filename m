Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AE2F25F5
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027774; cv=none; b=fg7k4x68aiGW6r+XMGqayrrAnCPnR/HzcfIUUKkHsvOKm6GUrLpYPjhJr8z+koop+ymwUhpT1RHYtSiWUdXqVMyP3lfiG3PCMDCKXw/Qj3kaYV+6Bu0FsuhiAys6ftZDqq8CnaSp7wvQEL53kFx9q3Z5GKM7KMo6TdMaWhgWxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027774; c=relaxed/simple;
	bh=QNympt2JpqHHxRDK92vDApnL7q7IcMPWy7QBH2Lv/qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDxSGGMtSOrOzxL7SdLLnES+FNOYY/ksZX1bBJpPqbk/GgFkCTCXyHQIlf8WZHzVdDtfj3llIDIe7VsQWrHorRPUsgpfcsAuZu1fajo+5oCkBbOAnu/Rp+lzWaNgGK1Eb8hG5AVI0nfD0xeU8K6Kv/uTj+riNEMmPkg1UENvifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Mga5C6TH; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Mga5C6TH"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso894008a12.3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027773; x=1774632573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYHI9ZcwdBnBRWoYvHZn9L/zxUC92mcsfUn7OjmWmmU=;
        b=IX+2zfnUMCKX95TEWhCpl/SG9XijmVldn3J2SUNe5/39Xs8kfGITCjUs9xbDlZLq05
         QGj0zKljCcJDaQtOcg3vFOn+jc8+cfMDYYy0nI3JQvwLB+a1BSKwMqLI0AAqgMOJpjDL
         0OICyk+aThGQ7YCTXvhRMgWn51hA+WQnTE62eBiWCQo/7th2C8VwjUIewxwjID600eB+
         yBrFOeMcF+/4n5sx72zg4gdWk7VGLQhBbyuG6mbRj/9ERwKFIiOcz3DI5reGh7NCf545
         UfM6vPLVmkUDGkFCwmlcJ7XY69yiDOuM6O/4S63bT916owodnrzrr+65FgZefEU2k2xq
         X9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVxJUaVxLcI9k0SfMu2bjvjR22S6LGySQzeyoNGcpL2ToumibEAAlNMjVCxezByfCGZwsKd6vOsmBu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7ADmYT1SzPyEQEMdFqm7UivAiBRqM7TiYxTOiO9aaAsujMFi
	s85TcAHqxzpIv8DNnxFJQB/bu93hzE1rN0FWZJnH/NAneOTyyDhThL2oDvXg42qZduGEA2CKLcO
	AbzjUeiHsp0UiYGtZ7L8RpkHQHByT/RSKCA3yB3KKIRYjxaxi+HYR3qOMisfwLPPB+WLKniy2VR
	RSyAFfn9kyVUQqgSnemMI8lrZcdqjNYmD8dD0IGoeg3BD3Azsl9un2j6K9IQu6vpJcST6k5ycL3
	EMTw6rBVlwCXIYAaeEijQ==
X-Gm-Gg: ATEYQzzIuL06tIy4b9zLoo5waMn9EKIbSlWIRORC9l1trb5LoQheb7q0M+InvlsDdMp
	BVM+tomQKVUAAgeyAieWKhHBBNW8hdJF/NWTMsiblvzxbXqNRzy9D5diD1p2enc98whw2zyASbQ
	icFiWJib36aI2EsxsQAPnM/aDh5EeHDAwisU8Ivo4rw32emv0dFxOQR9U6+gyYJ22xmRRIYclmd
	eSsSfjW/bnu5VqERWQoHENDzLnOyGEMk6pEd0K0Aj2EoGrNrSjXnGWKKOneFShpcqot9jhNQ7ET
	iTKyasQ2TYp8q/CLZjn5zFzi7cC/R/bGHfYMhKJV7AluEKu67AhaH3+aCBnGPrtTr0OkHW6ldrE
	eIlxlI+dqeu8RDdUMRRxp1KvK9ieN6JbWET82DvGBuvOnGjeYnJoAWeVpfNouVrBQEwz3C/65+0
	mXIc3JigNMDyUO8QsU68ooQHWGG9Y9ORxyUkB5dLCjHFoiS6LLXfRJL+sF2jDzFpuJ
X-Received: by 2002:a17:902:db04:b0:2ad:d0ff:2ed4 with SMTP id d9443c01a7336-2b0826c3ffcmr38417535ad.6.1774027772578;
        Fri, 20 Mar 2026 10:29:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0835d893csm3498145ad.25.2026.03.20.10.29.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:29:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270dcd11c1so2149842c88.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774027770; x=1774632570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SYHI9ZcwdBnBRWoYvHZn9L/zxUC92mcsfUn7OjmWmmU=;
        b=Mga5C6THfGCE76AsUWFPDXdrq3MacgHfbQei6mVRXAV6DNJgEoAewVMbaDksddVPvz
         fBMg9rhibk1ufM46vuVs5PZc94JAVXBQ9MijqV4iDXqgQZcBs8AnFPW4M6PmpClPzVCE
         bdPoHZM8EkYBa6m+97InkkUjItZEr4JEkY1RI=
X-Forwarded-Encrypted: i=1; AJvYcCUeNbk1GVgNenTjO/tD8MJ4zPs5YrQSKl3YVL8wti+A54WwnhztAekInk/vXwRcrhf6oxi/4Wr8wVXB@vger.kernel.org
X-Received: by 2002:a05:7022:490:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-12a726b9b0cmr1784840c88.29.1774027770533;
        Fri, 20 Mar 2026 10:29:30 -0700 (PDT)
X-Received: by 2002:a05:7022:490:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-12a726b9b0cmr1784823c88.29.1774027769924;
        Fri, 20 Mar 2026 10:29:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a99sm2898825c88.1.2026.03.20.10.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:29:29 -0700 (PDT)
Message-ID: <b3212a44-2783-4c37-95d4-56e0b486c73c@broadcom.com>
Date: Fri, 20 Mar 2026 10:29:26 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
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
In-Reply-To: <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/19/26 17:29, Rosen Penev wrote:
> On Wed, Mar 18, 2026 at 8:53 PM Rosen Penev <rosenp@gmail.com> wrote:
>>
>> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
>> some of them for proper operation.
>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>   .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> index 617fb55bc52f..7b1363aa1144 100644
>> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
>> @@ -93,6 +93,56 @@ led-3 {
>>          };
>>   };
>>
>> +&pcie_bridge0 {
>> +       pcie@0,0 {
>> +               device_type = "pci';
>> +               reg = <0x0000 0 0 0 0>;
>> +               bus-range = <0x01 0xff>;
>> +
>> +               #address-cells = <3>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               pcie@1,0 {
>> +                       device_type = "pci';
> There are typos here. "pci' vs "pci". Should I resend?

Not necessary, fixed it up while applying, thanks!
-- 
Florian
