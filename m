Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485841;
	b=UQzYQAkdCOVY2YGRlAjCrzTbdpd5lMG0a0eaARoWvkCXUGvrU2tAxwjet8XcfUdBB5zz
	 1Q/O7DXstjx6m6h6nhONj5T1yfGtmVq1HovMze037BN/uw7xP2cHWWv6dZT6MkEGK5vXI
	 ge8skjTU7iLPXo8vw8730pDg4vpprcwv3nSCKxA2pZvAQh2nqkVJBFWkF8U6bgIopmhta
	 LdpPJSdn/9qFX8mzDmCF47YE281EWfEQhvRG2/nKXL9GRMNj/X0bCst9v86kRvGInGJG5
	 6QfK5meyXcbZf1Wu7WchaJ8vJ+Os5tzxTbUMsQcJaTh/1Vlf4TWSrYM/wS1GjNvxqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
	b=deH5A5lOMsezdESLoQzDdOAIkTVELaK91M1fut2sabgCqWKTHDGG5zvKUIbrCjtAa1VC
	 AHu5l0miQ/CPSHv4KIcF0WUDVFfV/cw03FKoAf417TFtNIX4cOBZWr4wvYJRbr50fSpNP
	 HPTjeV9oIy0ObKG/bRqn0h552PPo5xAtGvbTpj/BlTl+ae/YYMkOE5saIOByxN+Y8q96/
	 xzFIppacT+fNDVs5vO91ryjtnALCvCm1xVNAgo8n/oFEZJ5EWyLZfBNe3R96M3k254NMf
	 /A18jqBLc2ud0oEnlcFUMhc/XmF1JLV4Yn2cjymv2zzFfVxUQDMD6Wfda7HLCyIt+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0oDUdr;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8B606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0oDUdr
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso397515a91.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485840; x=1795090640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=CY0oDUdr+f4DkiWnmKRSAd57WWzK/uog6M6Pb3L5wSrf/K0q3L2NLkmTBYBhsL63ui
         pAsWmzkOwUYohRVAzqoRrbSdB8buX8iMNebBavj19JtlfUVAjpBRSq0lWyollHt2iTZH
         s9zepFIWQPPgs6YrlWIo7FG+XiLwxDlnYky4VqgIkBuKxlbD84+HJ8i83HDQ2EUcU3Yk
         NXLiXuyaKiS9MdBoeFBQFci79bbK8sGhib17NdB7S5cEBa4f+NvNAD1/9Xbl4c9qGQiS
         xcRm1MXfRVEeSU0QIaQKqaUssx/rd5yMJ2A3r6YMDz4gdrst127OtvkIjOR8MGENKVjz
         Cm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485840; x=1795090640;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=j2hQH1H04NQjcHF4eC6x4V3FIq/NR1SP+uUYkWkDnHbWp9OZJ4pGzBFs4nqZt5e+hH
         +OvapRWVcYGZSsKi3M+Qt4HSBYAR7ioIAQyH7NVHyyU1MS5ZoNKtTrtPZ0Y+1RaLPe9b
         wtEKdfgJT3Igvez/TfpYMGTE+Hhq/FCx5ZKEhV7J0FjVXph5EYLuIVtDasuVCBolB4sV
         FfeeOztir0UqLhDSeplypfSFXyIkZFp1SBw5Q+gVjfA/GfwKrJmgw695xexbLQfa7b+E
         ZUxJsGKIizxrxF215wqipNItYZi5TVUS0q2/h63oDPK+odBjnQIXQI52yjIwnXudNek0
         sMJg==
X-Forwarded-Encrypted: i=1; AL+hErGu4m+wJgOgIpnnvx3J04Y35QngFwM2DtrsmtMXEuUwYRPqjVDqDQe3cXFXYRnWScl5jsiCXe6C1hBv@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULjtLhanwfFv6y4YTfpACwoPPEquVn4PcShhOzbXl13DAFRWc
	ZiFZuW6OVrxk2mnqI7zCIZ3wbp6QNE+U2IQbt6xFb8zADo+DE/hWAh17
X-Gm-Gg: AYBFou19DeTunJHs625mbH1BQa7LNCasXgnpmK71x6SChVjnim4KvBjJ2XA8NNXq1wi
	b+ROUQ1K2OLPsJ45OJ8CvODsutndUchnrpF4XY4TCRepWlM70P0cge2koYIBAJDis5et4QWeNaJ
	yfqANZkWodhl8WGVqhphHZMmxXQCyeWE2KgIsz0C4+pJZtoBBZrIuP47evDARerzv2hXSxZWdPx
	s+dPIxnDQACnNtngt8XqzJ3egoQACO/XI6JAvyJrvaCQfMEvkP9/BIwXdMnLHosQD1zkDu8kNJZ
	G+tuNY8LDNTlhizAYCA7xLhEqESYNr0MCx0xJwCa/uGq8T0VXuyBOYVfyJVJHlJ0ofDwBuRlPDL
	Xbidry/0j8W/AxG//xopZI/lP9C//xUakzyVMu4cimR7KcxvURGfYgFUrAyPRyo4u019iBr7CRx
	hxijGG6AXXLFDxWDjggd12R2VQjucJ+yzMOXsu8JcmIegjV3/gXO7PXrvrVZTL1PZf8C6fC5WuE
	Sm+iIoFLX/qn2P0d5SgoR1ub3R1zSQvxTD3C4WIZqrNvGD8P2r0mO7WgGro4Es6oYtwVbJZSGiC
	S7EO1w+kbf4w/sBQoO+g/Q==
X-Received: by 2002:a17:90a:8c12:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b197c81815mr1116711a91.1.1794485840292;
        Thu, 12 Nov 2026 04:17:20 -0800 (PST)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm4489297a91.16.2026.11.12.04.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:17:19 -0800 (PST)
Date: Thu, 12 Nov 2026 20:17:14 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Shawn Lin <shawn.lin@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v13_2/2=5D_phy=3A_rockchip=3A_naneng-?=
 =?US-ASCII?Q?combphy=3A_add_SGMII_MAC_selection_for_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <avV77eoO96zacmoq@parshuram>
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com> <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com> <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com> <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com> <avV77eoO96zacmoq@parshuram>
Message-ID: <073A7037-8E56-4B14-BBDD-DA3118970086@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 12, 2026 4:42:21 PM GMT+08:00, Vinod Koul <vkoul@kernel=2Eorg> =
wrote:
>On 22-10-26, 10:32, Coia Prant wrote:
>> Hi Vinod,
>>=20
>> Gentle ping on this series=2E
>>=20
>> The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
>> https://git=2Ekernel=2Eorg/netdev/net-next/c/5e91edfb0e45
>>=20
>> The DTS changes are waiting on this PHY binding and driver to land befo=
re
>> they can be sent=2E Is there anything you'd like changed, or is it just
>> queued?
>
>I dont see the dt patch acked=2E=2E
>

Hi Vinod,

Conor Dooley already provided an Acked-by for this patch on Oct 7th:

Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>

You can see it in the patchwork thread here:

https://patchwork=2Ekernel=2Eorg/project/linux-phy/patch/20261006162807=2E=
2843858-2-coiaprant@gmail=2Ecom/

Or in the lore archive:

https://lore=2Ekernel=2Eorg/all/20261007-9753b5de7344a15472337c6d@squawk/

If you need an additional Ack from someone else, please let me know=2E

Thanks,
Coia
