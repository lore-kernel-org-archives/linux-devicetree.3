Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807344AB91;
	Wed, 22 Jul 2026 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698078; cv=none; b=DH2Vh+FergV63aLRqYJlLyftJnHr/mV6k1twGrz7YbtQQlTQsRiPeH/d/j1GAkgTeyPe8NkPelwWRZLmfsA3ETP1UkUT3XQDqFXqKNcLAQo5JgvHi1/NKzB7zkGTmFIWIQ/uO6WDaesbaSTlDvpGtO0IYMYtDX9QPacctRqeXjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698078; c=relaxed/simple;
	bh=+XGu4/YVa0gwn0ZOi6+cD450cBL4GwA8SuEKNV1NOOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqAwC5aKnJgPBTYE1tPeX/Vpul8+w+hWyIhVYiiGVBDECFf4U/l5vlVI7WtHVsX92uAWfiaBC27glPNljmPMWVCAh4nHz4L4rOq1INWvPuJTqS7yTK9YmC4N61XGKGMoyBImGgiZcT+xqfYPHP2xc5xATzVHTcnAxzh3rQYe0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nsHIgWf2; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nsHIgWf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784698064; x=1784957264;
	bh=cI/qXI5aIOtv67IxgQsQWkvSxybRIeo9UIqFM/YYosA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nsHIgWf2mOwt/IYjw6I0iqkXQQekTDShR3GZuubpI11aEwtV8197WvjlCciGGrBDT
	 XgpzyqbsYi87zv2uvLvmE2YZZCRzdCwN5HMnafQESiJm5ROGz5S/MumFVk9qLpRJqj
	 kPdMGjoXb+y/G5L2N3BzcAykgSnwQMNMSFH9iPgguIZsCXhMJ55aQmyPiNV+6vsm5Y
	 GJAO3802WtiXFNMgUv8UngbJbm1KSEgaaRKS+L6yNwibqzOop3JTwrbO5rZZ7Mg60j
	 l5H0ZDZMF54VGJRhVbvgaJPpN7xGpfyrbyeL71jSO+Z2XZ15DtHgy93DvmjSePWLTy
	 v1TSErY0FLIWA==
Date: Wed, 22 Jul 2026 05:27:39 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
Message-ID: <58edef55-b513-4ccb-a384-64f2ee7e0250@proton.me>
In-Reply-To: <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me> <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me> <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af> <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me> <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 544f5ece5549d5872eeeeab0d457c91d6fe6892b
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/21/26 9:02 PM, Esteban Urrutia wrote:
> This does not seem to be the case...
> When HBR2 is used over a direct Type-C to Type-C DP Alt Mode connection,
> link training fails when v1.1 tables are used instead:=20
Expanding on what I said in my previous email, here is what happens when
certain tables are used.
=20
- v1   DP serdes, v1   RBR/HBR/HBR2/HBR3: works
- v1   DP serdes, v1.1 RBR/HBR/HBR2/HBR3: doesn't work
- v1.1 DP serdes, v1   RBR/HBR/HBR2/HBR3: works
- v1.1 DP serdes, v1.1 RBR/HBR/HBR2/HBR3: doesn't work
=20
The third case is interesting. I'm inclined to believe it works because
the only difference between v1 and v1.1 DP serdes tables is the value
written to the BG_TIMER offset.
=20
Regards,
Esteban

