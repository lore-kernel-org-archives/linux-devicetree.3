Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628697;
	b=EmxK67eHiof2f0ZWOZcB+h23tVffrXH5GiKR0CHASVncPuS/rKJ2R9wREhtRGOJE4PIL
	 CNH9ASsmoih5cjdbGY9o0Z91PuEVk2ZXR/OEBMCuyEmwyXHqmdHORFVGnRty1UCLgnrSP
	 kY4TKGtDrCxHDr3mCsKm5Ci4NGbTM271CM9nMrKtnnGnH16JGWPK4omQ2kNjmz+WJz+IH
	 jYYgxJ22QkRrl4ENWmNI+leDx00jOMPv3yOE+VgkpFq8EAG2HQJUtaExZmpy2ApaMu5v3
	 xhxOsyfdgh3WbhQJqb5dp1ColCg0By5cjhoMXjSATk6Rt2o04GUYDH3MIKZl20Rzofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628697;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
	b=wenaPFVeBfOcUuJWhl/L3555oG1gYaZglWxxxeOoxPgR7IDQ4Toj7u8u6VIe6ow1Clxt
	 dRStjnrx+fE43sTJp5cZrnpOFCUAICAaG6vpdtZXbvx08ZUCxutfAJmByFcts45WXBh0L
	 q2x9+HZ2kw7whZLx+qtryuiQDg3cmStJ3ImAzrFK81c1H5mX8zTR4GblunTyAw/P0Y+0R
	 HMBWRm66hpeIq9l1n3afP55SRbpxJ0HAz/iwJzrGmj2YXIgQHj5sko+JnE/475Jgz+dfT
	 TI9haHWw9y2cplTKQH7G9CcuvZMPif81JAPo7eJUne+ToGSGAXZ0cN2bu/oLibZGWWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EUgX5FSq;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE35606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE35606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EUgX5FSq
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso874101a91.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628697; x=1795233497;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=AVr6a/PxLG2+HDHSVByvGyNuaU4iSFcKKpr4/URN6hhDJj0labF7Eoct4Eikf7ffxb
         7m+T+VHReeoN3YI2vULhD3rDU25eGaQ2UIiaqcAb/g7mA5LM1Lo/semVbHKBXoJ76WCG
         VnxrcdfQTqJLE7DeglN5rzNfvMYqVq/uGpEC5/ZFFPO7LOdoWgVUTzDvN7Bu3h4RG59k
         E3CHYTbIdCKhoondnbbhiy4Z6kME3O4ln9ykzDD/RHJTkJ5IVV0wAQPpYEle6l2WNO5j
         SMOzL7vk5Hjdf6QEukGFr4+uWUm8hWwznyio92sc9vdnVBgPGCKL7QYxmVtBNRCuJzv1
         GJ7g==
X-Forwarded-Encrypted: i=1; AL+hErGcKtxz/tDHb0CMLNsTTaDwLu1oRsGhGI7T94xx4pdfcq0eiEdhZTx3naYc7rniqt7RIURBdpsyEuR3@vger.kernel.org
X-Gm-Message-State: APuU4Z/laGhBuJSzcf6IsCFcm4jBPwkNmjUXGuRoEFqjvGYx2/3F46Lz
	LpwHm5XenlXsM36B8ja8aTZFl9YMiopniTP5oEPJjVo5gcK3Vr+R3bQ84ey7GB8C+yFDFGCMa50
	hPswQPR1M2Z7PH75NBAwNmnHID0iUfWipGxbuIyLEp5ogqvItF6xe+44/R7MnxU7B77QGZA82ET
	jo2cErp9juvZH0MOWnNHbxOilObkJ+B3baqPYo6svRT1Lgh8HR0OPQ4w/vk1T/Tm9YUpAX+jUJL
	jT/BTTOS1qJkEEPuC52mw==
X-Gm-Gg: AYBFou047SXVTftPXHWeiy3CjEVE0jGVbSU3y9v6O7aiSxTHXf3GpAcJ50oP0+YYacZ
	HIek+bG8+z++PQxQOXtMe3C3C8GjkzEmrszs9BuK0aJmHW7VxCdEaFVyQPOwwDVdppWeDVwjQG8
	2v+c1GoUi2HO3nXSFeba1pe+VqB7EChdkSPRCihFrnrAYP6hp8lm8cFHjieutTR8OinqYZZ333J
	O7GwXD3BCw1fBAnwjC90/rd46Ts84qZPY9wTtl6T/J2dx0C2XvGpjfQ3ANRvCHRQprQoKoc61cz
	zIVXRT60wVZVmwVB2VCnE7SV0f/bjhp1ME82Xp5LN1dOeRB6xTVuQBQl+udCASd2HquEOmwuXMm
	pe5gZhvcsDBkwd4XE2i0pBbbJ0/I7NCSWmDThIuGma9p97m4GohDcQBITzu32ShsJ
X-Received: by 2002:a17:90b:5585:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b1b0b88263mr4039657a91.44.1794628696616;
        Fri, 13 Nov 2026 19:58:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm8591319a91.1.2026.11.13.19.58.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so1417122c88.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628695; x=1795233495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=EUgX5FSqjuAssA8DsBuQRosSTicJV4r/3yNPVh11xcaq3h7k8WJzUbsTSJmUpv8Ket
         +vtenoh7othWqBjim505hd1rZEMeVXTg3Xqb151VDaEuclRt9V4AspUdZIccE6IkOKzw
         yiACaSCr2fX7tvtMN5tjEv3xlXgchn7fpeSOY=
X-Forwarded-Encrypted: i=1; AL+hErEliVDGznCjyS8brUVRNeN69GhFA1BSOxCVros6Xq8dqRlgC2Yjsij2QxgGapoWwszkbyPHFddBnrwG@vger.kernel.org
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262711c88.14.1794628694764;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262678c88.14.1794628694018;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm13785460c88.5.2026.11.13.19.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:13 -0800 (PST)
Message-ID: <26f5268a-5a82-4bd1-9ea4-50cdd83e6e8a@broadcom.com>
Date: Fri, 13 Nov 2026 19:58:12 -0800
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
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
References: <20260911203324.104422-1-rosenp@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20260911203324.104422-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/11/2026 1:33 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

