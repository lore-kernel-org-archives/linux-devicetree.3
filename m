Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755DB3264D6;
	Tue, 24 Mar 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351141; cv=none; b=BLPkYwMjNRB+hHsNQxGUZME6jqgqNmQcN7F9xbT9JIVTWymZ4hqIHOo5dag9BD6ptelfQWvt5YgMGvH7gPTxcQIvujnoZlFZ4rQeABs7dKGs/AB9PakRG0ab1lDIVh9gg9qXtwEsLfqGwbATqRbkHW+3dQ9jIzIn1+7SYnFdJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351141; c=relaxed/simple;
	bh=UKyanTaa3bAcO0AHokq+HZtb8o9J90V2szIDEcQ5uwM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rto6I0Y6GM8Yf8gFRGlXC3bYZc9YvS1Ow0yy4cNgZZVeov0VTl0yZFUjpVugPmFKGUlI8WTVByZk6H6cXcNlMCewOdl0er32Xlal5x+LKslVGY1QKs+OqraDfjNOP7sJ7TcnngCu2oOZvnHMCJ+pu9xeWGBvi9WE6nRRC64ia6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VWsVMZwC; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VWsVMZwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774351129; x=1774610329;
	bh=qVjkyw5ZHphaFrlSim6h5wgpJKPCtWdAfdOkUlHhv9E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VWsVMZwCr8orPqBG41pIABYqhyDVjQTu/hE9DKpKafooLdT+2p0xJwaPqqj12PXRk
	 9crMX3u/zcFvjFIzbAsnzY8j8fPVw1TqTspKgpnLchTCSDp6kNMm7WQV5jwMHspuQk
	 69CailYkjbTF+aUe6nzDLKwq/8wNDhz/CM1r8r0rsIuuctJ9UYIR+nzBGTj4zwVfXZ
	 QG8HQ6f5m6BpcjxCbzrHbv43yFdyU12aAjTj5n/kvlKxloUtMd2Tno83AxK/4bmbhh
	 PIeltpjOaYXErXphdt7HzXYtRGUqKo0nspb2xAPx8w1P4CBBoSyyz2tpmAkeW4wcAF
	 NQO1OotX16ttQ==
Date: Tue, 24 Mar 2026 11:18:43 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <7wYxWlqdcbL3ANB9n0g4t74x-dwE2yG4CmVw9TwGNmwARxbT5WsdG1fpuIDSA5ab750Gs8OUBwmVa_nZd065guKDJueytb1AmlQ05__IzmU=@protonmail.com>
In-Reply-To: <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com> <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com> <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 4b4a5d996315f0912517e9a2ba4b654fffffc846
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 23rd, 2026 at 11:52, Konrad Dybcio <konrad.dybcio@oss.qual=
comm.com> wrote:

> On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Add the description for the display panel found on this phone.
> > And with this done we can also enable the GPU and set the zap shader
> > firmware path.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
>=20
> [...]
>=20
> > +=09panel_default: panel-default-state {
> > +=09=09pins =3D "gpio61";
> > +=09=09function =3D "gpio";
> > +=09=09drive-strength =3D <8>;
> > +=09=09bias-disable;
> > +=09=09output-high;
>=20
> This says "by default, actively drive the pin not to reset the display
> panel". Is this actually necessary?

I've tried to remove panel pinctrl stuff from the panel and the device stil=
l boots/works exactly like before. So, have I to submit v4 without pinctrl =
at all for the panel?

> Konrad
> 
