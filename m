Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D83DD85B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761806; cv=none; b=IBExuTeomLAV8pWCjAkFWgnpLmw9D22cT59F5fQeu1Qcjion7GN5i4sOy9J7/eBPsfyFOP6if6qyjQqbbDhmoQCkW+6R3abxapEHv/Unou8/o8W+mQlcrw+bG8mNhBf1GJ1hHRcAe7laqw5hA9zIPCniMJl9h7TIoab/A+lX22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761806; c=relaxed/simple;
	bh=i9+uTqXoacl7v5Lz6pWBWTjoV9At10lDDPe86RfZ5yM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oiaGDzNyNjuPFScL1JR3ZSMMFD2kVngIbidvURgwYm6PnWMUCam3angmFJrypVFWI4/sITDlVvGYVtVS6GxTEUY9X66ryCJMhsJQW64eyN33vFaKAZ1ko+YcXV1XDLYXt1LeDQya4CZIvKoxRoPfzjN/cvsSiGSMDixzXuCZZ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDpTez0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDpTez0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E96CC2BCB3;
	Thu, 14 May 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761806;
	bh=i9+uTqXoacl7v5Lz6pWBWTjoV9At10lDDPe86RfZ5yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iDpTez0YfJ4ZIFQfh2TOCvUJaDbW3fb5moHgfkArcjUvHBQ7UE5N52cRH1CXui7ku
	 atXKeOFXsaKYQM9o8Ny3TpOQOwYB4g0k3GLoKRbfC8VQWxg/nriYOKyc509jlQmM+B
	 CEVux/liH9G0OQrz2Cn+Oe2E5mQMxqZDcS3PgsKc86OyAISzFzBebN0s6FPzeEejwl
	 ETctIdF3qqrn3aXYOJ0J27h62tAe9sz8ahR0Z3tokvi+OaygMhuyKtdoMpwP5KPeY4
	 O6R37yfM+4haroWZva8+xtk/XZg3Re2JdJOcU9gXzLdchkuMyQAZFDH9JlO6wmAU2e
	 um+dj96cADSdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-msm8939-venus-rfc-v7-5-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-5-33c6c6fb9285@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:30:05 +0000
Message-Id: <20260514123006.0E96CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message fails to mention and explain the addition of =
`.halt_check =3D BRANCH_HALT_SKIP` to `gcc_venus0_core0_vcodec0_clk` and `g=
cc_venus0_core1_vcodec0_clk`.
--

commit 4d497cce125abb4eb5e06f88b3056c8f33e326e0
Author: Erikas Bitovtas <xerikasxx@gmail.com>

clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled

This commit adds the HW_CTRL_TRIGGER flag to VENUS_CORE0_GDSC and
VENUS_CORE1_GDSC to indicate their control can be passed to hardware,
based on downstream device tree properties.

> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm893=
9.c
> index 45193b3d714ba..243d31a32e924 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk =3D=
 {
> =20
>  static struct clk_branch gcc_venus0_core0_vcodec0_clk =3D {
>  	.halt_reg =3D 0x4c02c,
> +	.halt_check =3D BRANCH_HALT_SKIP,

This isn't a bug, but the commit message explains the addition of the
HW_CTRL_TRIGGER flag to the GDSCs without mentioning the modifications to t=
he
associated clock branches.

While skipping the halt check is the correct approach for branch clocks tied
to hardware-triggered GDSCs (as software polling would time out while the
hardware keeps the clock gated), could the commit message be updated to also
document this change to .halt_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-msm8939-ve=
nus-rfc-v7-0-33c6c6fb9285@gmail.com?part=3D5
