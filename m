Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360B34D3A9;
	Fri, 19 Jun 2026 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781910946; cv=none; b=FwgEJysKNjiCgAp9tBj9LxriWAQbv9EWQOk41hNC8yrUlGDFeL8b8Utw2VdQL2CFFDIEqxieJ+T99Rxl1A6Cd0P8GtCTv2Jdu37t2QJ3FxvH/wgjTOzNF58RhqBA284mJYBfljrnHiUDXpn8UpEtGok4cUM7C+rpiQSU8HNwIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781910946; c=relaxed/simple;
	bh=bqAw1h8hGh8hYM7UU4X4K+VxIqS9gQmTmc+aLMqi4Os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpucS1ehJlwcb/MqNeDm7E4auZUof2BCVPYGNJaMLbL1wOroGurDXDy7NXVdWZ088bEacjWr2DAYxXab50MeKgNhLCv74Uxzc2wLx28CZkFa4+5C9zxnLnAYQOk9/Cce1RmEMpfM/bNp9P3Is9urMEZOR1lj+eOYLlG7BNshdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com; spf=pass smtp.mailfrom=samcday.com; dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b=ayIqT8Ay; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samcday.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samcday.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samcday.com header.i=@samcday.com header.b="ayIqT8Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail3; t=1781910942; x=1782170142;
	bh=o5aEs35DeSAlC1MEWga2IiIiYLDF15o+JaC/AsoHC9k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ayIqT8Aym3SUpOuiU0XVTJCWDpttKoJ59wvkLVYSHXVrw9SqCr5xjVEYHCkfCV8LC
	 e/T0CEbPKLcbS+NRG75R4Ize4vQGreSo9S9jtEyfcMpDSzgsrUrZ8kiTNwyFVix4vo
	 kglyzdKRsvtrAKIPX3+8tHaSntnXh1NWYbaw4BG6gEsSCqIYEcwwCtYsoMVkbB41xb
	 T5CrZFczDmPvQxoWL6KYSvo2DuAJX5kFRAG+7EINLdDligM4dtJtxS2zMFIFUT9kkn
	 cj9rKQp4EM/RM9w729gkKleq3Tm+KxeOCZP0LM7h8th71wgwozObc09PGaZWaVGO3X
	 OBOSVBC4ESkEA==
Date: Fri, 19 Jun 2026 23:15:36 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to simplefb
Message-ID: <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
In-Reply-To: <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com> <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 5db3d3f2e8d6dc1639bb82f41ed40bcd9a7edd8c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Konrad,

On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.qual=
comm.com> wrote:

> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
> > From: Sam Day <me@samcday.com>
> >
> > These regulators are marked regulator-boot-on, but that doesn't
> > guarantee they'll stay alive as long as the simplefb does. Adding the
> > explicit supplies ensures that booting with MDSS disabled doesn't
> > switch the panel off 30 seconds after boot.
>=20
> Why would you boot without MDSS if you want the panel to function?

For my particular use-case [1] I'm trying to avoid taking over the display
hardware entirely, and use simplefb until kexecing into the real kernel. In
this case the user might halt in a pre-boot menu UI for a while.

I can also imagine this being similarly useful for "recovery kernel" use-ca=
ses
where again, it may not be desirable to assume control of MDSS/MDP/DSI bloc=
ks.

[1]: https://github.com/samcday/pocketboot

Regards,
-Sam

>=20
> Konrad
> 
