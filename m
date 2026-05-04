Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855913D3D0E
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901794; cv=none; b=IF1oiu2D795HjrKB7GFeYw6YbRKjXUfAJ0KW/LXEnBIL+6ctaPwkZkMjWPiGs/BCkp3LBjYMp5/D1SaeWt6wTpiOdE5cQ3FGy5Ac2Rr2V/LzSO4JQ5hRamMBdX2fdxG4LRgyNsV99dh8G8M++9R8XAJk+4TOaAefX3cRsLZYxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901794; c=relaxed/simple;
	bh=VzGeyGQbSF70bdcGHoU4CptP9q5WGSOi8Lk1b8r4k/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JRj5XLBtqb00FQIv7mAkcF4wvBhPZvw6G4VHd798opZl1fUP5TfAuxo2O2nVq4MNNgb7MWZTcxBHI3wRJxok60HT8Y0EUajz7vj5a+r14XoSRY5k1vEU/htN+wyjcLvAKQQscO84r15f8o2i6BEB2IBV2RDBV3tCxC1WCfRX5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vIdT+Ttd; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vIdT+Ttd"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso8463225a12.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777901791; x=1778506591; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=vIdT+Ttdt5EYlT8ppELuFyQ2sl/9vxh6NMwRBSGDTQvQMPN8YXCspgPbv9Zq0zCt/t
         fPOSaDFjhlM6R/PJd1V0vXGmflgdXOv4j7rJW+cCXdpm0mSvuq77mfsG6CDSy2QG/ixQ
         TVP7Z4lAKkdtzETLL7J2lQCZvrXj4gTzTMiz8sbQsbiIRjgIkVKiZAaPRO0HajWil65i
         +CAxpeqmB7mqv0fZOzNZMxcMPry85un+WwkkOyktEOz2hegL+6hRyYrB6Ju/FexfbI10
         2drf5HrQ6ccMfbMsj3nr/VmX5UAfD7pYm3nh1LT+5Q/QpdgA9XnkUQ/EqGBzj5rIif9l
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901791; x=1778506591;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=ozlW5kJelnkKpGllydG5N+gQ1q+u2TmblXA9q9727MObfCQ7kW+4EyRxdVcyBSrNaW
         gUVe0S4DHKA2j41SHDEbFxSo9LG9hqoBm1h/pBTIcMFkQt10y4+MU/FMNFGIZeFj4VOM
         IX7D2294hN61k4NHqi5YFOg5wP/uAOCLAGftmibxbRoMPyaTEJrJJVfKBzwwStv/JzV2
         zuFIgDpxj0z2utEsp7+qJoeFTcsmvzIVLpe+WAwY6SmOCXjVUhGdA+vFfffizid2ea5k
         I39Tl8KozYIwWaKDeg/0VYfCQmYrPVyflTBNRIzxKtDUTXam6ktqPL2KJhQhbYCK61Ml
         2zdw==
X-Forwarded-Encrypted: i=1; AFNElJ8zyemRl4tINICHEDxzS366Vqx8fSlnIqyvTA5V/F5NOiMOZj5hDl6Jzqgf/ZOxfzr7szI5FQJf7tnG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9azsWjcQZwrTdUJ/O0zibsA/Fo3kJavGWTallGyZfPdn9VsMb
	6FnnSOXk/OM/uxkS7GhQW+lYGHiHAzLCmVGieElbr3RNFMZrphFoiHK0pK+s1qpYe9w=
X-Gm-Gg: AeBDiet6JVf4fJVTsp0Jq9qauLuQMwuMGBUeXNqPrJvn27Q6Rk4wnOo7vxAgyWU7f5c
	NHrZHF/ry329RbN6aWs/v4mOeoZrduaDrmrcF1m66BnA69UGAtz78R32BmlM86F3xevXzUTfwvI
	0LMr3k7dG+U2ZzRE9SESCjDBrvAPIZwH4B0FWK12jB56wi8U3wgGBvlkGkSC86hDOAeYAwjY8et
	HKsWy4dT3gff5b+BKrArudx6KQjKc00XexUVO1ox/YyGoVktS4eQWv04knJHgE9wZADTUbRwogi
	LMDBB0VZISfN+jU/xrlSsJLxdCgoFLsIt8pX4VnCjvhAdvmkW/cZXXwJ1CUOFndbSTmdAVZzAYe
	8O1ElKZp8t87R14Nw40tsslvK3/BFPTBiXdySraG2EArfhm7dteGnr0x6wMf94l/ZvTRxW4maem
	fMXDF91TCglc1Ks2al6g+Cb7Db7EgT1BNJu0OnVxejKKNmjGxx61niXoUnhzN5bMfXmAFrY9w6K
	zgzk40=
X-Received: by 2002:a17:907:1c9c:b0:bc3:5f51:7a3 with SMTP id a640c23a62f3a-bc35f5107f2mr72609466b.16.1777901790709;
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm151369766b.45.2026.05.04.06.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:36:27 +0200
Message-Id: <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Conor Dooley" <conor@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
In-Reply-To: <20260501-yogurt-wise-2a2884e3ec59@spud>

Hi Conor,

On Fri May 1, 2026 at 5:51 PM CEST, Conor Dooley wrote:
> On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
>>=20
>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>> from BOE) using it.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++++=
+++++++
>>  1 file changed, 72 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt3=
7705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705=
.yaml
>> new file mode 100644
>> index 000000000000..1c796599f6fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.ya=
ml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Novatek NT37705-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED =
panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: boe,bj631jhm-t71-d900
>
> Compatible doesn't match the filename, nor does the commit message match
> what you've got here. Sounds like you're missing a fallback to
> $filename.

The last times I was upstreaming panel drivers (Feb 2024 and June 2025),
this was the requested way of doing things.

Compatible being the company and model number making the actual panel
assembly (driver IC + touchscreen + glass etc), while the rest being
named after the driver IC manufacturer & number.

As seen in
* himax,hx83112b + djn,98-03057-6598b-i (Fairphone 3)
* himax,hx83112a + djn,9a-3r063-1102b (Fairphone 4)

Fairphone 5 panel (raydium,rm692e5) was upstreamed earlier and follows
different naming.

Has the way of doing things changed since then?

Regards
Luca
