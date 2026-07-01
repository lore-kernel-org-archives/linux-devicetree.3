Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC94E377E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621740; cv=none; b=BF0Gff4aXxZKZa3qul9qgN5GfcF+GNF63kQllBU6CKhTp7Ec5dhjMF18xkevsEZWyXuzvvwIOfMSqWhIcYj+dpWnplyGtKl95k258AgzZYbdS6NbcHVL+eyH2Dz8cuAOVrPnRoxSFvVhDSMXsS3r54YFzwRTz45Ol4Hk9W0a/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621740; c=relaxed/simple;
	bh=F3880iQjXWhrnjsz5UgW9kwELR4+dgn6tPqZG2gmN40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oRESe8U5bmhS/JL1IdlysuWsV2B0PXnLY+/c1A8bijxpPWq8Rc/r+sT/lk68nipa0s/w4ZAFcwOqd/JG7iADRxBx6IU2sChdIUpzM1oR2xf+RKKpoOPyT0qZSqRcl0R/KosHUEHN0P4xcOJPfxNfA3OkazmWqzZdeGYFGNkYYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=echKC+5X; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="echKC+5X"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-380feaa05dcso145792a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621735; x=1784226535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RN+4SkO8PJ9d9SXPrFRpz0v6UaMeYjDz8fSXVOFCTUQ=;
        b=echKC+5X5qoqV5LdJaqQGubY47jm7Zembzmf9K7+sEEa/jSGiN3uWpdGkt0T+WmwvW
         DTkiOupga53wz/0Nff48YilHcxX8v3vvxOgWtfcNT8t0eAJDze39VGM6u/76qVIhOOTz
         0tuchl/Zimj0RwsH0BPMZOQoyXYS9oiqzNfEWXp0ykQZj/WNS1dKaiFNVg65RicVazY8
         K5tVgJR1KULffrnSHW3bT/q/PewsLuEnrmLOWr1HQLd9t9Veela2IwRPw4f4TOkKjmWc
         /BAmcxxtuW7jGII3slRz8XGALERCP0cWgbeNH0lcGa5pKFMV4MXNcL1FVlqB3dxCbTYb
         0A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621735; x=1784226535;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN+4SkO8PJ9d9SXPrFRpz0v6UaMeYjDz8fSXVOFCTUQ=;
        b=Fh+6oxKHHucnLcof2/6YtRVfPtCSOGuXrxDvCGgPrWt7FLvarD4AKxJLpxqSkblI60
         EwiOEkNk9razJqoXOmA8GHFWrHImFHppEiNrUdvq5uclay2qF1tQxM4vbg2E1HbvoE1M
         3ftG2mNg6fKqh+sdy5xDaBGZmepPQnIcnKpMhEcMuMRSz6cfzMbW1PdZdBxHEhK1ljZn
         RdosQ7xFgDRwILhrrY5AiDaDTZ9sjovqIV4dYJfyqhL0UCsFGdpKgyPnEo0WMpV4kXKD
         It4QDUxeZB60lBI8SG53nKIh303aJJLE/58urQOYIl0k49aFWaaX/peOMbsrXgJ99XZZ
         YPSg==
X-Forwarded-Encrypted: i=1; AHgh+RrTHIZjeTMqNqxiG+qQMEnqlN6mZMtrfcrQ2k0mO9h24m4SyC4feLmKy633FU3BGp0dSKKXqTq5f1xR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzx5XFsIfJ8qi1qNRehMgfgw0RGqF5UHU8JErsJw3Q1Ut7TbFC
	qVgOELhG6TQoKrTEQ3SqIbzP4pO9pQzGRhGBIMocMgqGcfTig95KqeRZ
X-Gm-Gg: AfdE7ckf8Jzm/v/gzTLhYM1Z0bKWl120wFCDG54elaXOnXAsUEi6qAjmLlqXG5WyXJ7
	hVzyuMtPfJp7kSJ0w/QonCWDWG3hdNT/eHWA6aVDpktpSVxnVLWZ8gBcKYlKynQjnItiM8RXNpt
	IbT6rSOwb3jXVBOz+U45p7f8jfuV1jrNhZG5PJ8haHj05l863hQ3ZQOg4i0HgwxCpVrkgv7c9st
	U6pIuNW7dWY22RMywuDoRujUa4BlcKY7jm9IsAHC1w0Ek05jQto35GT/pJE4xeXXFvSRVs+DG23
	7pCeLg//8vgAIuaONhRYXpOg4pytSLXme2oAJQN0FPLIuhzS3RmbZMFxEtQCsqBlI2VVfCUPb22
	s4oC9QmOhj31ZqL0zm0QQ3UI9nlqkAoBfl4mR5QGPOD40OCpnZYpoACAwyafu/TjOKAPG8eSxqT
	Pb/oxqbvb5O+T1EMaUTfDm1cg=
X-Received: by 2002:a05:6a21:7482:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c0bcbc0455mr10030942637.38.1783621734601;
        Thu, 09 Jul 2026 11:28:54 -0700 (PDT)
Received: from ehlo.thunderbird.net ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm4088600a12.7.2026.07.09.11.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:28:54 -0700 (PDT)
Date: Wed, 01 Jul 2026 18:01:30 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701-sturdy-imported-oryx-dfc12a@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com> <20260630153810.3574714-4-coiaprant@gmail.com> <20260701-sturdy-imported-oryx-dfc12a@quoll>
Message-ID: <A4CA0393-B348-48A0-B5DB-D1F9098EB37B@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 1, 2026 3:05:45 PM GMT+08:00, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> wrote:
>On Tue, Jun 30, 2026 at 11:38:09PM +0800, Coia Prant wrote:
>> Add graperain to the vendor prefixes=2E
>>=20
>> Link: https://www=2Egraperain=2Ecn/ (China)
>> Link: https://www=2Egraperain=2Ecom/ (Global)
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes=2Eyaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>
><form letter>
>This is a friendly reminder during the review process=2E
>
>It looks like you received a tag and forgot to add it=2E
>
>If you do not know the process, here is a short explanation:
>Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>versions of patchset, under or above your Signed-off-by tag, unless
>patch changed significantly (e=2Eg=2E new properties added to the DT
>bindings)=2E Tag is "received", when provided in a message replied to you
>on the mailing list=2E Tools like b4 can help here=2E However, there's no
>need to repost patches *only* to add the tags=2E The upstream maintainer
>will do that for tags received on the version they apply=2E
>
>Please read:
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E12-rc3/source/Documentation/pro=
cess/submitting-patches=2Erst#L577
>
>If a tag was not added on purpose, please state in the patch changelog
>or cover letter why and what changed=2E
></form letter>
>
>Best regards,
>Krzysztof
>

My apologies! I am quite new to the kernel submission process and=20
missed picking up the tag from v1=2E=20

Since I need to spin a v3 anyway to fix the text wrapping issue in=20
patch 2, I will make sure to include the missing tags and resend the=20
entire series=2E

Thanks for your patience and for pointing this out!

Best,
Coia
