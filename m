Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E634D3B5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018649; cv=none; b=kpxHjE5QCQIKV7jV4itZtmmmwIa18a/NkoBYIKYC/WEClEy+tkWBf1P5wq2w84wDmHLP3fqfbVivIO0cNv3pLGcvssLm6TgHuCXb6olS3wrhaA2VlaERdBpvI3v3EYO2egFOLYZ1N7+1KoEvJOWE6BPiTEFOppQBHBTuVYNz3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018649; c=relaxed/simple;
	bh=4IfsnaPHh13o1z0ejQou7xq+LRWaOK/P7ySfL7X6d/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WvG/b9FxyaN6T7bCtUPGm+godygpicarbkFyl2JnSmYUPvEk2iQEEOZ+NLGTcEmZzpvZcHxj9SUc5aG8Ak4ZB/zMn1UyQTPm67UIHcPm6xkbgomkeqi7tBTq0u0KnV5OkF53uhT5OzeX2FsSsx+aL85B24CKz8m+YwzncXXKrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE0LLzaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE0LLzaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902DC1F00893;
	Tue,  9 Jun 2026 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018648;
	bh=0CtmRAf9Xj0sfp+/QugBob/T2TXuuWiHXK5ibQGl1o0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oE0LLzaJ7UVDW2CAS3m6YKhR9WjRJ4tBifLNHoonwMPYTlcaPsr2aBgJTl/gIBbdm
	 V+cYCTSkElwocvW17ux/HAFcTVEx7K0oRrEMN/rFsiAwPbWi0nD45yfNWLgjjW5/Nq
	 ctkORUDMybNM9D6T2kaMNoLVq5YxQEk2eyB/y402aOh6pafmgJuw8TBphiY2vgmM6r
	 nsxP9ULflSvRW584FFwoh4XzuLBhhRauU7wskKMhdejZmA6DA39X9+uYODfIULKPzl
	 D24uQ5PDTKQOUzsvTWHNQqPd6af6GCZM0b0oaP7mzH4yuejhfjYnIu2JfXO7iAU+FY
	 NPyWe/BPGXWpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-4-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-4-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 15:24:07 +0000
Message-Id: <20260609152408.902DC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] video_cc_ahb_clk_src incorrectly sets .hw_clk_ctrl =3D true.
--

commit 17dde18cb6830ef09380f666b54112994b478845
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: videocc: Add video clock controller driver for Eliza

This commit adds support for the video clock controller on the Eliza platfo=
rm.
It allows video clients to request videocc clocks for video encoding and
decoding functionality.

> diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-=
eliza.c
> new file mode 100644
> index 0000000000000..36af35e070299
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-eliza.c

[ ... ]

> +static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_ahb_clk_src =3D {
> +	.cmd_rcgr =3D 0x8018,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D video_cc_parent_map_0,
> +	.freq_tbl =3D ftbl_video_cc_ahb_clk_src,
> +	.hw_clk_ctrl =3D true,

[Severity: High]
Does this incorrectly set the hardware clock control flag on the
software-controlled AHB RCG?

Because video_cc_ahb_clk_src is an AHB bus clock, it is purely software
controlled. If the hardware clock control flag is set, when
clk_rcg2_shared_ops attempts to park the clock at initialization by writing
to CFG_REG and triggering the CMD_UPDATE bit, the hardware will wait
indefinitely for a hardware trigger that never arrives.

This causes update_config() to timeout, emit a warning, and fail to apply t=
he
configuration, effectively leaving the clock stuck in its bootloader state.

> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "video_cc_ahb_clk_src",
> +		.parent_data =3D video_cc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-b4-eliza_m=
m_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com?part=3D4
