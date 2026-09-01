Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD50478868
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257012; cv=none; b=ESRCZTQkUPnS7WrD1PnIhzaf5P+hRa8QB5tBkOftOKA8lPHbS9g1fWS/xjLr3bXlg5Zsz6CGbk2a0OIrwc9WBg7E1bJiWFPPhtDz9ymT+6xFfyNKLNKkV9I8+CW61zZXFGpigRXoFDgApEHbj33DH2LxsjDMlp1gEjqoSca/i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257012; c=relaxed/simple;
	bh=hJYKYXa8oALOftNWTJLyNbYw7Cg0pytVBzpjhJ1G+KQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R+RBXmsldZGzS6fm13nGLYesp6t4aG/QNlKpn1ydiSuAO2/MQml+5u4C6N9DSre1KcEnWaNx/1HU1BpgjsGzY1XXvySZs6IbWmjGk9rN6WRL8/2Y7BTV4gnXFthWQpIvSpvMlRk8e35yiSZjm63e4spgdb+fiRNjyEs8+Ww+vPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb5y2VsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb5y2VsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014591F00A3D;
	Tue,  1 Sep 2026 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257010;
	bh=5LLIktop48B5ERIKELEwx/5XDd4bDhbbML4kzBzuvxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vb5y2VsS2HmvY9IvvtIARcUJpRG2v7q/Crnf+nKaKSE2g+fEbViFnolk9S+DqzQxW
	 6CVBjMKpjVD7h4aYuMsQ2JKIxQ9Jj/g1nGY9Vw7mQIIjfCbGqcbieBiy9uiuc1vPw+
	 B1MHNWGmShtmkmoGGt9GUNRYcKLRftqyQw54FTueRjgs1jPB73XUwzeAinFiPV7+zx
	 mdOIjJYuFkejVajLvw8ARfZK4k8r37++LuN2QQP8uh1WgPGejgdR22YgUcbXt52GUA
	 reruW/4fTm7+h8hMka3zgK2iaFVoEjgzoEQDCu/Xm06XxOt351GKKFoJJxBbev0cSZ
	 TSc2CLg5etVWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 10:03:29 +0000
Message-Id: <20260901100330.014591F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] V10 PHY fails to configure AON_TOGGLE_ENABLE because its valid reg=
ister offset is 0x00.
--

commit 48ad62e543f72364fa66abb8ebcbc97d66127f66
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

This patch adds USB3+DP PHY support for the Nord SoC, which provides two
combo PHYs. It introduces a new qmp_combo_offsets_v6 structure to handle
the specific hardware layout, including a dedicated usb3_pcs_aon region at
offset 0x1e00.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index c39ced168d035..de82c7107c92e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
[ ... ]
> @@ -5359,6 +5421,10 @@ static const struct of_device_id qmp_combo_of_matc=
h_table[] =3D {
>  		.compatible =3D "qcom,hawi-qmp-usb3-dp-phy",
>  		.data =3D &hawi_usb3dpphy_cfg,
>  	},
> +	{
> +		.compatible =3D "qcom,nord-qmp-usb3-dp-phy",
> +		.data =3D &nord_usb3dpphy_cfg,
> +	},

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem for V10
PHYs like hawi during initialization in qmp_combo_power_on().

Looking at qmp_combo_power_on():

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_power_on() {
	...
	/* override hardware control for reset of qmp phy */
	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
	}
	...
}

For V10 PHYs, cfg->regs[QPHY_AON_TOGGLE_ENABLE] is assigned
QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE, which evaluates to 0x00. Since 0x00
evaluates to false, the condition silently skips the mandatory AON toggle
configuration.

Failing to override the hardware reset for the QMP PHY could cause the
USB3/DP PHY to fail to initialize properly on V10 platforms.

Is it intentional that a valid offset of 0x00 will cause this check to fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901095055.4222=
9-1-shengchao.guo@oss.qualcomm.com?part=3D4
