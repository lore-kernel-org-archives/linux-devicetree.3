Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208743A9636
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194729; cv=none; b=G0vS0eUEm0q3sh6GXM0omIKbbYHHpryj/Jl/Im29qz4fkjbAc7wegzY5H+AqWvk/AFVpiaaEKsKuRXWfXuRmMiTycEJras+RPpGN0rjlpw1Ur7KWuBRmY9tJlQnRPT8PUf/Qe9lVt5d4BHe+qE0ZTKJNaDOiN/6DLibFY87jJkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194729; c=relaxed/simple;
	bh=X0Nc3LPeP3yvoTzuOeTi8HsCjRqSR9NDjqFs9CJsHhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKfvZU803XAdG28HHr+PqbNsKgHr2kubjIRMuiLOKfDUbLqre5zZpRt8hZ3EWGQ+LhwD7icXUu6j4iAwHUMGWkfk5i2D4G+xagoYeXLWhUk2EWhvqCmAGlLf72fpkLDmLWx4FbuWKEyX8uABi1xAaYVBO4bMU+WWfDknll0Z12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHIeS6Wf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHIeS6Wf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8422f395a4aso395197b3a.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782194727; x=1782799527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=GHIeS6Wf+elUptnsVmmKG8gxpY+5aMWllPzrJzm1nHBpKehSR0/0A31/Q0WzDiT/xe
         q7nTAMtYJ/OLGg/MZCUOW8nwW138VFZE2+hU29egB1hrKPEGHoIzp/0v0xFdj/Dlog2n
         2bLe5HqmLD0T3sz9O0iamkAbKwiwLkJ8r+JeR4zUkwDX3qhSqyQHwvDq0e43AoSyNXL3
         YTxKxhVsTj79lW7WwmcqWWsjoUJZnS//GcJpfY5I0fDJlIfnJSMG50b4fo/haGlIWt/c
         G+ju5CMB/xKjkCcHPRNIW4GAyQ6gvhOiq3k3NXFPecQ8f2vPJ/2FuMLo+t6LKibJ8fRI
         613g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194727; x=1782799527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=Bb1yWLaO7jRNdheRKzu2XSBqNFyHw7a8FOHN2s96L/+WWNngJ2k0MQdRFJd3ikDxH+
         vMDwk+wiAgZpd7YxrCVjQC8Rs8db2qph4VKHnvFruBWyVkoCyLOuQKY+hl2C/Wuc+raj
         WNRzRsofQElrTxwes3MUzmr7eFAHoAQyP4G9oRzQ7Hqqwyt82+eC04HhigKT24w8UcFi
         o4TwV1WiwbQdf+a7mzcZa2q5M5309IaZmzqtSgS3pGCrcfbJIJN/wQ/UI2FYDKCAT9Fp
         OrliRLqGZI4PeQ4KEuRfvrnYqkQQ60OOrOdQFxfnVkIWjan3sMewITa2sIlg3c5GxV9O
         wepg==
X-Forwarded-Encrypted: i=1; AFNElJ+k4w41+IRQjLObP1torBPMzr/T1Xfw4/3zVSA2GbxyXXLpCh3sxL72Tx9p/gwCMMJUPYFxKMlOK4pX@vger.kernel.org
X-Gm-Message-State: AOJu0YyrindRsrcDGekrukGJRXJBrdHQ5cjUxePv7jrnsXRzfpixHNev
	y7nTzoW3DIroBEsxaKCVPgw4uWjB3MXfveNUPjgUY7preQ1cga5le6Mo
X-Gm-Gg: AfdE7ckRQFdkd7WQoqrjRQi+dBdfQ7p+nApz1j1zjCe/SZ0BNpsDpQ1KymWNFs+Ty47
	n0UeWXO9uMiO8Dm1mW/J59+0lLpJ/4ZdjaKMuWQCobEN5dPc3avxhdrcM1xz3i8u0WZAA2Fnw8V
	rZt1TlDl9nmIflrkQhjPc6+0eJdN6niVZTpph5OhpsuYS6nzjlzgaVimFhbGPwVEZ2BAGu+47PY
	XmvP6v8+zlST+o/e/lUmw689UBkV3OdQwdeI2RpfmHQ/BXlC3ohvEZU+mbK4vCGDzs0Aey7lNLI
	gVL+H+bTnOPvLLDQ7kYUtS08eR02pYv71zxERl9JKVucLEwnCDQhSMrqFu3M1dOqCPK02u1Gi74
	z/gcdyU9K+YS3RGG7GsfzNMzjHFnxEH8YBVsNPghWX5EOsKB1omg1sD3HOMKpBte5dOW4jP+MXl
	8qfuUfwgaLpw==
X-Received: by 2002:a05:6a00:2c95:b0:842:5ea5:5fe0 with SMTP id d2e1a72fcca58-84591b260d6mr2136947b3a.6.1782194727240;
        Mon, 22 Jun 2026 23:05:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a57:2041::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ee3dc2sm9160454b3a.58.2026.06.22.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:05:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-amlogic@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Tue, 23 Jun 2026 14:05:14 +0800
Message-ID: <20260623060521.599380-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617083401.8777A1F000E9@smtp.kernel.org>
References: <20260617083401.8777A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Enabling `pcie_phy` on `meson-axg-s400.dts` is insufficient to support PCIe functionality because its hardware dependency `mipi_pcie_analog_dphy` remains disabled.
> --
> 
> commit cd94d06969e9f9a23ea319f406b8e86e8ed9ec44
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
> 
> This patch disables the pcie_phy node by default in the meson-axg dtsi file
> to suppress deferred probe warnings on boards that do not use it. It then
> explicitly enables pcie_phy in the meson-axg-s400 board device tree to
> preserve its PCIe functionality.
> 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > index 285c6ac1dd613..7ba249cc3d569 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> 
> [ ... ]
> 
> > @@ -448,6 +448,10 @@ &pcieB {
> >  	status = "okay";
> >  };
> >  
> > +&pcie_phy {
> > +	status = "okay";
> > +};
> 
> [Severity: High]
> This is a pre-existing issue, but is it sufficient to only enable pcie_phy
> to restore PCIe functionality on the s400 board?
> 
> The pcie_phy node depends on the mipi_pcie_analog_dphy analog PHY via its
> phys property. Looking at meson-axg.dtsi, mipi_pcie_analog_dphy is disabled
> by default:
> 
> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:
>     mipi_pcie_analog_dphy: phy {
>         compatible = "amlogic,axg-mipi-pcie-analog-phy";
>         #phy-cells = <0>;
>         status = "disabled";
>     };
> 
> If the analog PHY is not also overridden to "okay" here in meson-axg-s400.dts,
> will the analog PHY driver fail to probe, causing devm_phy_get(dev, "analog")
> in the pcie_phy driver to continually return -EPROBE_DEFER?
> 

I'd like to add an additional patch to resolve this pre-existing issue reported by Sashiko.
Unfortunately I don't have S400 hardware available for testing.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617082239.645562-1-jerrysteve1101@gmail.com?part=3
