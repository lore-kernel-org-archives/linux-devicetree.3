Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3D330B32
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255379; cv=none; b=I/Wwke0iFC1fmrcl1n6TNQ8STcrQaIANMSi+8v+C3OrC5jYnrxryjQCbeDgBVb9ZZr0jRxFiVlY71KvP3R209taHlsFOkGb37sw9yDd+ZNDtDAFQOQgsidgdoeXaJaYcyJzQMeAPohkZ/rQHg5+VjM75VYXC2dSCoskldQzgvM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255379; c=relaxed/simple;
	bh=x1rLLX/vkNvctkkbqb4D6XZRu6Oxaibmg38/EIDQCIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O0+G40KO8eVIl3Y1B5tdYIlgR6EUg1wp/RuOcu9yJ9g4oNCbq9KWhWowf3dchD/dH9vjvz+jQWY9cL7YrYkpBEqBPkuTGUP7zCJxflKCd9iaST64zKufHzDFXddXQQnOZpSvFzrCPda6Bh+B3qE0oXJ5UrCTt2/iAgaLfbOMCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJDSmE/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJDSmE/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98371F000E9;
	Tue, 28 Jul 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255378;
	bh=x1rLLX/vkNvctkkbqb4D6XZRu6Oxaibmg38/EIDQCIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJDSmE/qSGU/379xGQX8ZiGXpB+tGD5V4Xrb7X9cwY5aDfMJY6f1Q93oDUcR1FC2b
	 h/yO25caYbB0q5msYnUIjtrP+hnMSM1JBZegSSdZyF3y+fhJBiYaF4uslI8ZCnD6Af
	 lnitoQHGcX5CL3nkzJsXRmyBK//p05WEV+DL2vuedwxGMKaxAQwXTEuQQWV/g2Zb0W
	 E5hBsEnLXUF9FqCsyawz39RzPA+qcjyRE48RkrTATKfFu79JJZHKQx9KpBHdxPKnas
	 cDB+Uec85hrSKMqoUPecTNz+JlE0IM3XmcQFomh85eNz//eb8TkVzAh+Sfo9aWUdAp
	 2Ml8J0QD2yl0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728-adc5_gen3_dt-v4-3-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
 <20260728-adc5_gen3_dt-v4-3-355f0edece77@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:16:17 +0000
Message-Id: <20260728161617.B98371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims that both SID 0 and SID 2=
 are PMM8620AU PMIC instances, whereas the device tree correctly uses PMM86=
50AU for SID 2.
--

--- Patch [3]: [PATCH v4 3/4] arm64: dts: qcom: monaco-pmics: Add ADC suppo=
rt for PMM8620AU ---
commit 07dcd0ba34ae862d89be0793a9dab759b0361ee1
Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU

This commit adds ADC nodes for PMIC instances on the Monaco platform. The
new nodes expose the die temperature and supply voltage channels.

> Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
> present on the Monaco platform.

[Severity: Medium]
Is this description accurate? The commit message states that both SID 0 and
SID 2 are PMM8620AU PMIC instances.

Looking at the added device tree nodes, the PMIC at SID 2 (pmic@2) is named
pmm8650au_1 and its ADC node is named pmm8650au_1_adc, which indicates it is
a PMM8650AU instance rather than PMM8620AU.

Could the commit message be updated to correctly reflect the hardware being
modified for SID 2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-adc5_gen3_=
dt-v4-0-355f0edece77@oss.qualcomm.com?part=3D3
