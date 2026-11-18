Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007188;
	b=1uf6fhosp9C3bO0n9PEy0vJGm8r997DN4vZgTGDfR3VJpHhps3VhHBagFwIuyAb4MNzt
	 70B0+OhXHJw6gPXVXD3MvPOMW4MSsjkbHaMiWYfILlFiqDkwGngrQv+HAtDfcD+itQT+6
	 Cd4NgNJ+lpnEua+MbyTYLlGMUeQIgvHhnXja2MMBaQ/MhcZJVGYze/W4D/vCMpghOrp7M
	 cB4d43qFB7kBHA/Ycfs+BjfhawDF8oYXFviKFe1Hoq6MOCO/01LzcwPAWOhqOFI5hUH+0
	 Rg3sbPI7YiSscviCFBdBuiyHzNNgaYChQ2Gt7rwZvz5qO1KSHKHJrLpodSXJgmH0aQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
	b=KTaUx4JpSf/SbTs3RUVYYohBXdkE3rLk0KykoBOmBP+P+QssTLq6rifOOs4L+Fzwik7Y
	 BMpTrjawifNNfzGVuhAStLASUR83zFxvmnYc7avtLPj7+ECRc5rdP8wo4RCpisPSy41BL
	 QYPX5AIRrJTPLRdLBUX4/uaKDyK817T5vPHAqbdZ97TUpo2D7ILu8gaA0UGD01K95kDo5
	 D8GzxJI9inNqKIQgu+hHQV/CqipT0Ib6a0V3JMWsSl7wQta/WU3BElHFAEFapXlzb7QRr
	 kx4XeN+GKppyGDOJ3TzWJf5VXJcObxTp2iOt2kAqa46E6yb+qTwQVOJVFkk7DDphnwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F3ds/Y6i";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAAD606A33D
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAAD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3ds/Y6i
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso577994a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007187; x=1795611987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=F3ds/Y6iTAFk6c9okiHX4ugqJMur/U27X6JeeAJ+yzfGm0q4P2rBjaloJgMDKUr2/W
         34tCb0YlWvaAgF2fQL4f2Xcvuoro9nCd1LfXYXKmm4CyIqaxlMCF9o+vkiAjcyvDc/uI
         ysgwTZw0SGro996TrtCOaN9mXeVmFXu2WJe7KphPz9Zy0Z2kly+HcWaC1s/z5tH69wtZ
         v+yxhZv2dKyRATvbRm6FcqW4Fxtz+H33a+AyhlkW6K7JbUrOMO0oolMfhgmivnE3pQ69
         v0b6WJn9lqV6pFXwDSfEqAC5mLbH6CwDZ4dEpLHdp30XdPD9y1tDcR3kHyWnC+6/CF4Z
         zSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007187; x=1795611987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=Jc7LqN94lB/FqMZ7ka5alVwKHm3Dbm+xCiDrC4sB4V3LORKhpvOTdD+VuOCgJE0bfD
         +6Fih7s10i5alVSc2qEUoi+B8fYBVWCeYhtzQAQXvyZfJhiduhZYIdvrsVeaz+NThFkk
         NIwadoVs1Irol8okFBESy4WqAw/KkdBzmCFSU4ntGfe8iVOvY8ma3wjSEb9ZvCYe4pGw
         zPOrnAUuW84ssG4eMh6tVLiGrAgZ02q0QLLrHZYqf0yciPn3byax4jxpkh08lKMOv9Q0
         Yv4esghIS33xe74yfvYTUNOjl6k+ymi3VQhkMURbtVkxBZczC0ihiL5pCugr3L+bLnyA
         ly9g==
X-Forwarded-Encrypted: i=1; AL+hErET6QsfMgEMESfsBFl3lGfBQG1tbebOUFHz2KCOerGWiF8gBS0bwxZ66CpvFR5J98WWcTzUz0wbEs7R@vger.kernel.org
X-Gm-Message-State: APuU4Z9gX3gT+qWGcMvjFCfB1GOYbNeOCANmYciWRTAsu7GlsEX2SfkY
	idq4zGJUbblaWZyGrnDBXaSAvnWvLqRjGjeiXGR5pJ+Zc3KWW7LnRahH
X-Gm-Gg: AZFdTZdlep9m6sM7Y29wVz+82CFa3y7/5ug+n8CYmStAqM1Ub4mAOWNz1J2Ozhf+yys
	Zyao+8q5iSkbPwhGo5WXvXhmMyqVSdHwI5SDWRmR10+y8aPDhZuUW0s0xQQ+7k3rpFft1wHiSLN
	ryA5/tyowSrZqvNl1gFFSoXxpl8q7gL9dphyKuutwejnbKvtRyfiPCcqfwooBIe6oNx4bAIjT12
	HAJObZJ4C+FzV1apfeRQy0OykW1/wQC2j1I0dPY37p7b0sRyJGo592fRQVKbeNYmEbxfVBgt7DL
	qfJ7mektpWvgNMDIX4XWKNRWM3BafPsaS9YhJ0AzTcTrz+NCTp7oPS/cgSYL/JRQsjNfojojb1Q
	qYbbDeOZkz04p4XZ7m8phfyK+7y6MXKBjuJ8RHKRd70IREZnTALE5tvcE/QpnHcFvypwVOGeeIA
	MrzwJL48LM+n9LHAZ4GCJu4pkp1kh234DH1Kbow2tzz/v30IFzJ1Fh8u+QX+UxCtkvyams+2bdR
	Zjtd67ez4fTwFJgyL3AKGcGBjf9ZrwKyE5fE9Si3YlPCxYkuJ3qPpHB140I3JyisqJEsKdeNf+U
	dW54Aesz9CPTOJtEDtHh2MMkxehS/7z/
X-Received: by 2002:a17:90b:2243:b0:3b3:c44b:b774 with SMTP id 98e67ed59e1d1-3b3d07a7a7fmr2534441a91.45.1795007186887;
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm4314633a91.15.2026.11.18.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Date: Thu, 19 Nov 2026 00:06:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>
Subject: Re: [PATCH v2 02/15] drivers/perf: apple_m1: Remove unused variables
Message-ID: <av2iyF3Ssa5mwgTH@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-2-acf1e78da039@gmail.com>
 <865wxu1jfa.wl-maz@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865wxu1jfa.wl-maz@kernel.org>

On Wed, Nov 18, 2026 at 11:13:45AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:49 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Myria Sarvay <myrialsarvay@gmail.com>
> > 
> > These variables are calculated elsewhere as well, remove the extra dead
> > code.
> > 
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
> 
> Not quite. In this patch, the variables were very much in use. They
> became useless with 75ecffc361bbc ("drivers/perf: apple_m1: Refactor
> event select/filter configuration").
> 
> Please adjust the tag accordingly, or just drop it because this really
> isn't a fix, only a minor cleanup.

Yeah, sashiko picked this up. I had fixed it locally for v3, but was
just waiting for other reviews before sending another series with just a
fixes tag. Thanks for picking it up!

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
