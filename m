Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C135A925
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785917; cv=none; b=tQVhiiLbRgYSGdfMtJD6Ip2k/3miQKtM3OVk5iUQwoPdMEyW+uEXTyVfDEM0/tdi85MFjqn5FmyFxzre/PtLyyeWl/6TMYNdCVHQ0hlGP94eAPoEvtPl/uPlRk1sQS29DcuVKt2/Aj4OeYfju5tOAmppV3f/O2wBYa7ZcRGQwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785917; c=relaxed/simple;
	bh=YgEGX7jK28YkiZDyHM5BziasxP7cT38tyNdxQvk6j/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OWI9iSUXzKtTy0CiKJmZ9e1YKw8ZdpjzfX8HCLtvkK5LYEoF7Gl/a0ekNwq2uDaP91htopAjjVAdME8RbuDqUscSmxGJ+vRMDtfAFdBIRC0sQy0IJp1JWiB26RzUryZH33cGuOt7XWF8d6TCHWEOjoaoMds+9ZlpBoktQgcdNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU2BV+Jo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU2BV+Jo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774B81F000E9;
	Sat, 15 Aug 2026 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786785915;
	bh=IeuBY3zCLztuKo8iMw9s6cVFsBYoMp8CQKm7vor4Q58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mU2BV+Jo3Pgp+GuogrB+MuuiNK0dAvL3Vgx++gNfZ3wbcO6m57X6r1hFDV2FE2A9I
	 BPV9ayCj9afVj+NnOjBeBPdV8BbzztFaKrAV6o2rO5WFZHsTNc9ueMYATfYSmM9KKL
	 1pOFLalOO7EjhgBVCuUWZa4IQG63UOZfkJmuCWdOssBjPBcVpMdrqhyxOpxNVU+AZ7
	 nVGbbIII186D0Ncbi8Rc4prpYFpzJmLFenlm5vfFvcqxp0aLeb2nlRI62oV0YJCtz7
	 AhBdq8/+aVDbtIiMgp+YvHzluc5J9OWoyK4/6Bp+QGtQzNvMuRFHKkdXnfdymiogvr
	 RxbdjStuKSIOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: phy: realtek,usb2phy.yaml: extend
 for resets and RTL9607C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260815091340.26910-4-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
 <20260815091340.26910-4-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 09:25:15 +0000
Message-Id: <20260815092515.774B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused `read` function pointer in `struct phy_reg_desc`.
--

--- Patch [3]: [PATCH v7 3/6] dt-bindings: phy: realtek,usb2phy.yaml: exten=
d for resets and RTL9607C support ---
commit 16f65d15255be7042c02dfe746526c8bd6b0efc9
Author: Rustam Adilov <adilov@disroot.org>

dt-bindings: phy: realtek,usb2phy.yaml: extend for resets and RTL9607C supp=
ort

This commit adds the realtek,rtl9607-usb2phy compatible for the USB2 PHY
on the RTL9607C SoC series. It also introduces a resets property to
describe the multipurpose USB2 PHY reset line, making it required for
the RTL9607C SoC while explicitly disabling it for other RTD devices.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index e8d0f0119ec0a..5e483c853f02f 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -64,6 +64,8 @@ struct phy_reg_desc {
>  	int vstatus_offset;
>  	u32 vstatus_busy;
>  	u32 new_reg_req;
> +	u32 (*read)(void __iomem *reg);

[Severity: Low]
Is this read function pointer ever consumed?

It appears to be added to the descriptor struct but is never called
anywhere in the driver.

> +	void (*write)(u32 val, void __iomem *reg);
>  };

[ ... ]

> @@ -130,6 +132,16 @@ struct rtk_phy {
>  	struct dentry *debug_dir;
>  };
> =20
> +static u32 rtk_usb2phy_read(void __iomem *reg)
> +{
> +	return readl(reg);
> +}

[Severity: Low]
Is it necessary to implement this default read function?

Since the read function pointer in struct phy_reg_desc is unused, this
implementation might be dead code.

> +
> +static void rtk_usb2phy_write(u32 val, void __iomem *reg)
> +{
> +	writel(val, reg);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815091340.2691=
0-1-adilov@disroot.org?part=3D3
