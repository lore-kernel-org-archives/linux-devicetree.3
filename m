Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401686;
	b=ygWzV/bNlOmUDmKJiYttMdU458d//Bwia+7SxirJowLBsiIQlcK9e5as6EwvMq2zFyqZ
	 0CCJTPvccPnFS2Vg9oz6gq7XoaeUPWdFF/YM1m+3VdPVaXfLsOB0Q/UoTEKmodjx2tCwO
	 qN6YnldB945Df8v2JJ/Eji5YErgcP2Cds3PnT9q+BbY2MJd0vaeqdxp36Q4NbaPWYVkLc
	 PcZHNcN/CgHdIKf3+z8ceB3jti7vyAgGRrcBMM7OcIMkGoYGmYKGwHnf8PRetR+8lG7PQ
	 ALJB4q1+Dc9LqGZUP9IVRBnKg9kWjQ4JgWkPLFJ9+SdfUeChh6y90ZvQDuDsctEeXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401686;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kutl9pjsMR5YgX8beF0lS5PZuVFUbRflFXgsgOe5LY8=;
	b=ICWe8wbM7SQtFsT1ToCG2uum5hjp1+Yd2sWRqR9qIqSN5oIp3TFYQoORi1QGMXcKF71o
	 vFIM1dWjcNR38I/sQNiv+Qiu+i2rWeVdYm2YoKkQHtOqvmHsYjYu/TbXT81Qp6k2W8iOO
	 ydBXPAgQsNJ63X4p0x1yKFXY8i/mGuzUhq1d1WdWDOjCcFsfGC14UZfK/xQBvp3ToApC+
	 q0lPjybJB6lEjNb0gBpCK9zRd94Q8MqeTV7uf0yrvc0FH1rTYb/KBCl5EjXo2g4tTgSI1
	 ebo+yozVMAg8PcPW19BbSSTvWlVv7gfhukKoHWQkS0TqRqP7ryq/oZtMvCp2Wj8254g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J2eXXL68;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEF606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J2eXXL68
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F28E1F00A05;
	Wed, 11 Nov 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401686;
	bh=Kutl9pjsMR5YgX8beF0lS5PZuVFUbRflFXgsgOe5LY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2eXXL68dpDitCXiUsA89VE+EcZBbze5r3RIYdZJiU/jbJChaRNMQJKODL0C9BApP
	 SdfmqNvs4xXq5YoGKqFk6fJWD8OornAd9bJ4UIMSqDpj0/uCBfltzlw69YbthiDKY7
	 Swfitex9nSZjHHs8P2477OsUQlO4EVOpG1UAZIPFeoA5jcjOTm9Xf4Fs/FWQvZEpVt
	 VdHE3eJhBI6mFGbJ7ekBpHJ0sDwmpK2+IIuCtkJWgaFLURjCRkbDSjAKneXUIE5MvG
	 cJWOY05C7MHOtGlcTXSD1cyZBX52dsdubnSQXnFCoCOEfdBgAIxlCu4DppvGAKyqnA
	 fz41VwR7RIDWQ==
Message-ID: <sashiko-outbox-209024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab
 S7 FE LTE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishal Balasubramanian" <vishal.bala.nps@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-master-v2-2-5eb864e9f38d@gmail.com>
References: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
 <20261111-master-v2-2-5eb864e9f38d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:54:45 +0000
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
- [Medium] arm64: dts: qcom: sm7225-samsung-gts7xllite: missing display
  clocks in simple-framebuffer
--

commit 048a3dda70bddbbbba376b3ae7c313748689b1cb
Author: Vishal Balasubramanian <vishal.bala.nps@gmail.com>

arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7 FE LTE

This commit adds initial Device Tree support for the Samsung Galaxy Tab S7
FE LTE (SM-T735) based on the Qualcomm SM7225 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts b/arc=
h/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
> new file mode 100644
> index 0000000000000..e472e3016cb9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
> @@ -0,0 +1,586 @@

[ ... ]

> +	chosen {
> +		framebuffer0: framebuffer {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&cont_splash_memory>;
> +			width =3D <1600>;
> +			height =3D <2560>;
> +			stride =3D <(1600 * 4)>;
> +			format =3D "a8r8g8b8";
> +		};
> +	};

[Severity: Medium]
Does framebuffer0 need a clocks property (such as <&gcc GCC_DISP_AXI_CLK>)
to keep the display clocks enabled?

Because dispcc and mdss are disabled on this board, no enabled node claims
gcc_disp_axi_clk or gcc_disp_gpll0_clk.  Unlike gcc_disp_ahb_clk and
gcc_disp_cc_xo_clk, these clocks are registered in
drivers/clk/qcom/gcc-sm6350.c without CLK_IS_CRITICAL, so
clk_disable_unused() will gate them off during boot while the display is
scanning out cont_splash_memory, killing framebuffer output or hanging the
bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-master-v2-=
0-5eb864e9f38d@gmail.com?part=3D2
