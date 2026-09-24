Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F139934B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260951; cv=pass; b=Wrjc/d7seKksG81IfVcBzQvXBeqUl34XYaTTIAWRQcrcIgRPXeKnzxzb4V7ICtBDjBXtwc84D5BUOawiR46ouYp00Lvuar47w4ujYEbdl5hXYoExRHV0/RAyM0yc6gRd/zznfrQn2TT0N+9lepGs/rB6p+tUytXs2XUjJWf633s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260951; c=relaxed/simple;
	bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tocr4iVpXILiEgYnRjt2WBHfIQlwjjlnKVSzsqCozBls2fIRgwiLBtVMkqVOe8yRGUniTohZzp2TeIriPTS9Dw7NRmOCarY+aJvMucTtF9P7hDukEOF1lgHlUx7J9mc19FdLgWyFrPkYcapgj/ZjDZepCkld86tQ6ojNbSVmYkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBR3+1BT; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBR3+1BT"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac8d1dso23313527b3.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790260949; cv=none;
        d=google.com; s=arc-20260327;
        b=BbR9YWB8zLTKEJsd9MmRmBvC1riNQmgOxIT7iXeZJG6ePBGSIivFe+QnwpKuIM4PPr
         wZlCtkXvabb3DbTtWFWL7a0Hsqt4ymAoA6XKTrpo08LUGBdn6M6sGgQxUj9GU2qTp/lR
         EDAE58zjZ85DYt4KVDwXXv6oz04DnT5wLGxoZJg9ajoTEaSXMchTOxmWlB8RVr2P6t5Y
         cWiqA/Gu0zF25PzK24ENobJoVNbKI4pacbaDTpD47FdkBG3UbyvzXFTHFtSfi9XC/ATx
         SLstEwFZSfgEBYGbkMw3oZtgUPMH4MdPZj3mLquCyJNc/OgDuPKnxefSL38AkR71VvEd
         uEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        fh=WMvb3vw64DD6Qxmr9/uZaZAbG26XeiTQ3LOD31CZkMs=;
        b=jl4MgytLc6Q7IOep/xNeOiC1wOnG0WYDaBNFNgLGeEqQ44oTzLSoGRKo0K2wpuQWNw
         kYHw4aZ+rQW76gvZ1Zvf9kseYVIhLOuPxt+k/ckcNBd7uFBC12pM3asNkq89oo7LT6+t
         1v8hGC1ERbvz0n864rvnQWrVWEozcE8z/Qu9VgaBwwDX371AvxlTz1bARXFC+eSlCrIt
         s+Sew+Ls69vG9HI/6L2B6GB5uOdeBWsG5PrfagWFdF4OyXKnisMiYdht7iXJzdzi8xLs
         wkVOHknWE2odZ/rGNhJZqXq2Dxnzn2yKZtp1sexyzqdYOsObvTxGFsbpxJ2hhKXI8iB7
         9XHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790260949; x=1790865749; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=iBR3+1BTK0VWFZ1W3QF2JD1jeUf3vCpZQ6rd+i7OE/JoPKkPBcNtyigSymDjSYGSt/
         RNxXVSEJImBsSmQvMUtoUCnOX2eoKcljFxjPqB0ETI1BtQEG05bvixq2VtSk+7mHa5vu
         krjg5n9V/xmyR7zFk6F9tdPsR83VfVZQEFnIPWc5p1vuEDrrzUfGo8vllW2btWoFpdwD
         DT6cMU7ZYQ2iRKCQw6Tw+oVqQkq9jYxZyuWyetA+aIH/OPnGH5jQvGn/o3utWPPBooUy
         Fa6BvQ3b9zS+WVqj/dblpiqit47X6sdEFQ+TT5q4GS2kUfj3kIZT8s/fZYJxZJKIGHil
         Ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260949; x=1790865749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YOd5bZyODtN9cGxOXCDLK+zhRfQThyoLAp0qXa6H4c=;
        b=Lr+BVce3Iv26qbI2KaGCBUTYSiAg8eN67eCwSC/MsEmyDo7BiYXP6AVHT28FKqmO0d
         jPMa+LeS8n790M1OMFUtG0V/5HZgxKK69/tZkTsRX5HMRslbcZQQyIscIcRx6l+/8fHx
         D9lItHfGRbt/XBhTDOtMOxFw8JoL9LmvejcmErYw3o9CA+OdSQS0z+9Zhuq94I9efr0p
         kS9vf50lZdnTsKZXJJIHpkEw7Z8vtWAfCNsrkEN0Vx8RFEfDvJ7JlQQiSLU5DH2jGWHU
         f9KB57AJvSVrhEVeDAkqHjcwIota4iJ/0ZV6y/THNkQFYNuK6D1ajv5KoxCkPMVCRsb4
         1E4A==
X-Forwarded-Encrypted: i=1; AKwUvBzE7jhvpC8oQL/qZbP7nET6DSoykN+aPH7EjspyeA8o/cbYOcybUcx8LI05M+pzzcrbCPx6q+d87XfH@vger.kernel.org
X-Gm-Message-State: AFuF++kIF5Hw037vd88y9dw9BiWKBSP0D9GxgD5z+7H9OYP5MB6UW+Bg
	PiPZ9BhjLu4wc2hWT1qi1O9sBfCSE/jRxLx08oX7L8AxJhX/1twoVcZDAVqbrSCmGa/6BECfPXC
	C2krSkFfg3M31+TKpvx9Ld0rQ+SP22Qg=
X-Gm-Gg: AYBFou2VudZ36qedemVNcCOA27Z3z6OuYPMNXTGmUSU99B6O6B72shooZVUwdY+FzQr
	sXBoeYiuL9ZVjsQyLSpT4dStNYy0uqAi+QxzfyLGGUUifLmmIM6ILvMVdcjHrAlmcf79R1Z+T4A
	/TJ2Avajp1Iij65himGG0HFR+v1v7a1kz/QZdX5MJIsFp+2rN3J86zzB71uOgkN0846SierwRks
	k3a8gbHgmYTwDfFrGqQFGtIyDR0lH3spBDeHboaw3i5WgGoZpwls1Sjq1RR/hbT/KGr3FjYPyVF
	vp9a44udFEwhNlPOcKO7bf7/W/lq9Wj8hWk/HyCD7nn6MmTZc6Uz7ARjhg==
X-Received: by 2002:a05:690e:4386:b0:672:a52c:db1f with SMTP id
 956f58d0204a3-672ed48ebadmr1187815d50.103.1790260949554; Thu, 24 Sep 2026
 07:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923112009.1062-1-anykey196@gmail.com> <20260923112009.1062-2-anykey196@gmail.com>
 <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
In-Reply-To: <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Thu, 24 Sep 2026 19:42:17 +0500
X-Gm-Features: AclHuK_hCbEyvfcHbTXKt-ecvSOb-lEWKE5cl3FOBZCvjRjKdS35-bDLlzlza6k
Message-ID: <CANHPwAT=tDAnTY6hor0WssxiYFh27doZeD=j42WHxX=3fUcHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 SDIO WiFi/BT (AW859A)
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'd better rework my patch and letter, do more testing and then resend it.
