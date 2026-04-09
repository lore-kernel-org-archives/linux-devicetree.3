Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED63E3C53
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760040; cv=none; b=H9dkpgVKbqK6BnhACDpEtRfdsbDp4QDQBDvISt/QqHA/2TUrs+7Ng/bd43uW8dET7pXvD4WJJNPVx3OD20Y6DUfwDvrYjr9ik2t4Ql8vMJCxKirXBmuFGg5rAqP6ns+hdOhQWeN97nLY1rLvH/nskfLpMqa+1z+SSw0fHvziQsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760040; c=relaxed/simple;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhKQ1BKes5fQVp4IYN7D3wRr2slwvpUXYx2dNY2r24FhZVHOh/MFdyC2teA0egAKN3d/zZNU1Fb3hjOzq8b0L0Ylpj36c6QZRY6x+EFKGCyvLpVsP84sy7Ll9f4Srg4xfYA7D5TqRYzq5QLZqB15sF7amtUsmntmLBWzjqmdkL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=H0phYpxs; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="H0phYpxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775760035; x=1776019235;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H0phYpxsB7XPwLrtnfyBN6mvMhy+ifqvS1OVIwQxLRbLu8/GIAUFfTRcvbzZqfwUV
	 rf8I0GJvkpeiYA7OYVE9V7phE3AVR7XIXIaT/hOTsJi0wtvBchGd62vHCp1vCL+nnO
	 LNDmcVP7zqZO0xDNBRiSFIhY9OpPljgIDI8YIe/gtviZUuFKWpZG1O8jApfZbg3N/r
	 rKPWxjUKgn2LM+AoTjoa5qZyU0nhes1r9A3QqjVQOgipr67e4jJmxQ+gVRK88m5Kuw
	 j9neUNX1uiAKmodUnlM26VR0bDRNzJE0U4IpI0T8eKqoydCcp8mQzFJ2KvOfXlhBii
	 pYO2VWTYUkeIw==
Date: Thu, 09 Apr 2026 18:40:29 +0000
To: Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock controllers
Message-ID: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com> <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: c775f395f3f55a1766c8ed589cec7719a6c679ab
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/04/2026 19:10, Taniya Das wrote:
> +=09=09videocc: clock-controller@aaf0000 {
> +=09=09=09compatible =3D "qcom,eliza-videocc";
> +=09=09=09reg =3D <0x0 0xaaf0000 0x0 0x10000>;
> +
> +=09=09=09clocks =3D <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>,
> +=09=09=09=09 <&gcc GCC_VIDEO_AHB_CLK>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09=09#power-domain-cells =3D <1>;
> +=09=09};
> +
> +=09=09camcc: clock-controller@ade0000 {
> +=09=09=09compatible =3D "qcom,eliza-camcc";
> +=09=09=09reg =3D <0x0 0x0ade0000 0x0 0x20000>;
> +
> +=09=09=09clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +=09=09=09=09 <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09};

This looks odd.

Why do these two controllers have no power-domains ?

---
bod

