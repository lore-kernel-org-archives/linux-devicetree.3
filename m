Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533701;
	b=2aUbdwvL20zVm1wVCgTdrnQ0ww1HQIxHpuW0ym4MAScup9lUfOMJD7tgOfk9DWKRSx+M
	 ZXVcrMLvMlcpwLqjwcpvYpu5f1Hxpd0E6292uz1poECP6wae0Ow9jJYxlSc8fE/U/te8Q
	 x4u/1mmfBhpT+fbi2FmhKolXUVTCm8vKocVLFz7oZEwRCzlm9zaOSxBePHZhWKctOcTcs
	 +tby5FKgyAnc2BojeGv2TzoNYYO1NwGHeok+XllKflL/ffq6yxS83w23c1xgFM8MdoovR
	 Nnl/yNQEyrdbNju9pat2OinMyUaROXw54dUNR63uUUHW77in/3VCMhcmcpO7LAUVdTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iuEH0iwZU/W/lcNweviPOVHKVlL3rSG3rdk2Qd+zQXE=;
	b=3EG1Vccg2H+iVtjFFK/yBNTb4XJ7SB95YPoI77R4Jqa749yy1Obzy/Zih2IP/Okt2qIE
	 qLTAxU1w1JAop+3sFe+QxSnycJ8vp1be9Fi9rIQKv8zYa+maWrg4fJyqI4kOg/weW72RP
	 GiumVP06Blz+ug8L42fs4B7LtHmjQb5wR8kztMzngeWKyzoNyzXh7vK3QUKnvbtuZ5yBl
	 n6YLIln0tsPIMUlIAFxnJKW40wCKX+ENhi354t5GLTIqkFSjzZxBw+f6rawiuDjy5vrou
	 b7UOxYE+DL7dZ+hTFKvbLmA6gJNDxfFtYiTdW3gkH1O9UH5lk+3i9B1QXOI+Ty1LyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvkJFuMV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE0A606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvkJFuMV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12A71F000C4;
	Fri, 13 Nov 2026 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533701;
	bh=iuEH0iwZU/W/lcNweviPOVHKVlL3rSG3rdk2Qd+zQXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hvkJFuMVDeP1FhyHKIpJ/0m6U0wo93y+Sz8xZ9tNBl8GjwB0mIOhQJqhTX1Wu9cwb
	 dAi/iwajHd7u+timZhfqv8qf2JuAUr8b47YE8LxcnNA3xmyOO2FYndike5c4difXIa
	 kOhmEu00RI51mW2S7Eu2sCLBP+zQapvf8ov9AKNidkN7dBv3CLGXVwwfSZ/S2/6E69
	 XTgoNrxbbu1yfNs+aV8fyXUhX/F1/2yCtqywD1mUOs1m6JZQFSFYqyNVlvhuGPN+TB
	 6H3JvKsvH2WgNZyX+m+kTAiGkG2hr4B9nM2CBWHfnhW8DR4PLjNDAk5Yu+8JlVfU99
	 xG0U45SR1iOgw==
Message-ID: <sashiko-outbox-212068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sm6350-lena: enable
 remaining i2c busses
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-12-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-12-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:35:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: handle used instead of real name in
  Signed-off-by
--

commit fe7e98e46dac6038a81f144f88f59c95001cffd5
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: enable remaining i2c busses
>
> Enable all i2c busses where something is connected on this phone. Add
> comments as placeholders for which components are still missing.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author and Signed-off-by fields use the handle "erebion" rather than a
full real name.  Under Documentation/process/submitting-patches.rst and the
Developer's Certificate of Origin, patches cannot be merged without a
sign-off using a known real identity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D12
