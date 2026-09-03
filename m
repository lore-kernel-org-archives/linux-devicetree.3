Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE851123F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466323; cv=none; b=CfJueomlliHorKx+fW1v7DU4xtrc9ZKCQPgPgoo2Lp05nKyoaOefuM/K0xx30s8Lt52dqGyRel5KaBZA3Zim0Lv8Z75PFOrZNepI7w+/gfxsuufRbIfmNcZ7k5S2k4jMqWLRsCIjTM51gkpVztbM7V5YRqtKtPWizt5rdVyPHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466323; c=relaxed/simple;
	bh=2x3Fg80qrgO1JMvyRsoWryYQdJjCtQvS1HZl+tKOeMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=smUzHxOlVvU7/PUVxAv0RLA+UQzhnsSPBka74PRJd+9RJK2PWLwlGBebsWdUKYINz9OjepLCFbPZTw44vYUDOCiozGxJLypr/Gw4vow3T6Rr4MPEBsGGK4HbKrVDkSVeRk42qsvrDRHQZu4ERhxEIgEly1VbBWLh+RAGculswpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IxBApYry; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IxBApYry"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-5303932c4f3so2198221cf.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466308; x=1789071108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=Ry5yx6y47GvOEu2olyxSvchhbru83LdOJB4ba2dt314GFdNGuPFU8wbd494wKZQDCJ
         lhZzyDSkd+QeaWmkxumlYix95n5BvUawHv4ZJpDBtn5OUuWchAsuF9XP4d4maSJpR3YP
         12lGyxiy5jsHaYyagRgnL8rHtnzz/jey8tJamqLbs4IuVI0zpiSqCxmFu5Rhh18PW4B3
         I9tVnZ97AY/t81fWypOxqlkTkYTbaKBU+qxD2WPT5/hyL9sstQZboGTYi1l65hBYxM7i
         mmOwHxuKfOE/oYkh2EhVDXAE/lGa4kDhOk/RPm6YDHRQqIWhhAsNIqmNRrdUxstBhhol
         qr/g==
X-Forwarded-Encrypted: i=1; AKwUvBxy49JhcC3UuJH/Ko4OFivKE42AvdTNcHtIjg+xy7EFUf0Kr1VjhnVBceB73XIsEQrSSdcIBQaIId65@vger.kernel.org
X-Gm-Message-State: AFuF++mUCAihZ6/9ullwjB/EHI34z5nkOYe/As5N2f399MUcpKZh0uMk
	NR3CcTiLg7LmT9nxjRQutBpvaLLRw+swYOO1LAcxrh8E4MvC5Otw/UB0pzLz6MhOsD/KZdDk9N6
	xWioWoEN3uqO0HVSb1PVJ+dchEQXVUdwI91FXDroLygUNilJhqOPGQwE50kfKTaqh2m5FJsiMfO
	LJtniHrdLdDdMsd8cumZMt3iZUymFOuB8XStpUwU9JAYTpIscUGVoNTsWRANRIfVbTKGJmtQEag
	LB7LWH08y1JXFZa7Vy3zQ==
X-Gm-Gg: AYBFou2Vpdl3+vfreC3aXo/6Lshx4n2l2S6zBFOpD0fPwZAWncsBxRzwzrxgqMjOPta
	+/EujLBI3RuLQlbQH9zuW6xX3XXewE2/BpIfzAahp4uqG/hajWg36dl+kNMpOdtLEeoT/3uTw6j
	Q5tyZmvH5NDrJGxZ/ys114QTdtiG66jOWCrZ2tMXSMFbPstbzzkvS94iaQ5GwbFjmkBhufIgReV
	WlxVLAPzpJIp87XwPnxMB0d+o8MtsT376aN72Ya5K3RXHhHzmcIPRy4twx++EdBl5foxDWVAJWG
	RXVNtLb5tKnm/fD86pqTC/586J7KwQD2/ju6dkvJE0EkcBlVh14dmB2bhkrK4+SOdUj5zKtOgfE
	OjAiNmYLwI1U/5sjqMi/bSuemICZKH8U5ddojBBHPakrz9J1zwGErK8TqaCfP33R4ljXWYyX/7j
	Xx1l2Ln9wfXAasxUapX1Z6okAenuCTZlEQPE7Hb8Bx
X-Received: by 2002:a05:622a:5809:b0:530:42e6:b18c with SMTP id d75a77b69052e-530549cbdf1mr15318141cf.42.1788466308029;
        Thu, 03 Sep 2026 13:11:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040721cfasm58256d6.13.2026.09.03.13.11.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939281526e1so21490485a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466306; x=1789071106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=130lNonfXTPzQR8jeTPo2lF/JuVtb2EqoFtB3DFAlj4=;
        b=IxBApYrySYMAETAe4+Bm9eRkwGYZUDu5bngMYt2j2f0brZS3VcQ/g16THiJQwlEQdv
         7+Qbdee0eqAL7VuQba7nbAFsOls2FZVkefB9JBe6VlTE/mYeNcKYfhvL9u/zHU00GfMv
         zmbw2M75xkyD2sJbzp4q7F7yn6x/97rwicGrM=
X-Forwarded-Encrypted: i=1; AKwUvBzykZjP4gwry6pZJnukUFi69/VEvpqT389xEHOJ8+nh+z5MRuQo1jRvf8xptqXIHg1Ek3D/hcngvXw6@vger.kernel.org
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97448285a.49.1788466306405;
        Thu, 03 Sep 2026 13:11:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr97442185a.49.1788466305792;
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9ee9fbsm51700885a.1.2026.09.03.13.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:11:45 -0700 (PDT)
Message-ID: <be3aac0c-3475-4f48-aaef-765aadcc6b75@broadcom.com>
Date: Thu, 3 Sep 2026 13:11:41 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Add RP1 PWM controller support
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
 Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
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
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/20/26 02:44, Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which is then exported by this driver via
> syscon registers. A subsequent patch will add a new device
> and driver to read the RPM and export this value via hwmon.
>   
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea

Uwe, how do we go about applying these patches? Do you want to take 
patch #2 and I take patches #1 and #3 through the Broadcom ARM SoC tree(s)?
-- 
Florian
