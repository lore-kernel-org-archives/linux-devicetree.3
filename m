Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA2346FA5;
	Thu, 26 Mar 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774507662; cv=none; b=QvIllxv9TcoeWz7EJf5hi0/cE2pRxivsQNeZzEQT9+mb+84g9E2/fbOozJvrKhr4Cu4Xepr5l+XqpRXtV46ETJG5oSTr16E7+Xz4JyTHmNVQQK7O3PZmgTo152WSFe7BhghgODOY6YWRIe+vRTlZJIf7TU2x1ZHXOf5QDs3UhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774507662; c=relaxed/simple;
	bh=uuO89bXipoojZ5oWacJBzynhJDJvNYok686rks33Smk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUZ2iJrYcLeuNQo71XBQ3z8TSB7WPR0CHF222+tCQdTG2EYZSVHdd+ld8lw5Qx3FDbshV88AW16sqM78q3oR5pzsnXXHXLh0IF/RYWwQXI9yO9QWOq/To9W+b1jf6WpGmrKIAG2/NBcQ5JRhdY6twWgWZmjZZ0vM/u/KYEDGh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=fffD0qEu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="fffD0qEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774507658;
	bh=uuO89bXipoojZ5oWacJBzynhJDJvNYok686rks33Smk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fffD0qEuIDRqpi3IHyTr1aG2sgjzLTaVV/UVnCDIyZWhOuB7eKGFM/IbMty8f1BcA
	 WxjANSn/Wubl97tUOZ7iF4u2fp2jci6qESwk21xqNHtXV1jjTcb5GjE+0+HNzYo5re
	 WcYlzN0gK08wg0l/1hZpaX4AxJIMgvqDl0xYLYDbL/0ueBuR9ykaosOS/whUWyqCuC
	 gG8bX0VYwm6mmMfgH32Rl9UEGH0oBK2jDbAj5UE5RTJxeXyQnmxumvh6jIyRdeJNJ9
	 mbKrv0yvPsxztFkwOmHiMoplqOtepCX4m5HVeMflE+4JtJMqcIVYFzmjf558OvQp7w
	 77ZMuKGa+oyrQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 21ABA6597C;
	Thu, 26 Mar 2026 14:47:38 +0800 (AWST)
Message-ID: <8e93868a7f15596f1ee2b758d1743b51d6491486.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>, Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 26 Mar 2026 17:17:37 +1030
In-Reply-To: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
References: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Potin,

On Wed, 2026-03-11 at 14:19 +0800, Potin Lai wrote:
> Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> devices connected to the AST2620 BMC SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Changes in v3:
> - Update the model name to "Facebook SanMiguel BMC".
> - Remove CP2112 and downstream IOEXP nodes as the upstream driver
> =C2=A0 is not yet available.
> - Remove the following EEPROM nodes until the bus numbers and
> =C2=A0 addresses are confirmed:
> =C2=A0 - 3-0051: HMC FRU EEPROM
> =C2=A0 - 3-0052: HPM0 FRU EEPROM
> =C2=A0 - 3-0053: HPM1 FRU EEPROM
> - Change the compatible property of the following EEPROM nodes
> =C2=A0 from 24c02 to 24c128:
> =C2=A0 - 5-0050: SMM FRU EEPROM
> =C2=A0 - 9-0050: PDB FRU EEPROM
> =C2=A0 - 13-0055: SMM EXT FRU EEPROM
> - Fix the smm_temp node address typo (0x4e -> 0x48).
> - Remove nodes that no longer exist in the latest board design:
> =C2=A0 - 19-006f: RTC (nct3018y)
> =C2=A0 - 9-0075: IO expander (pca9555)
> - Update linenames to match the reference design:
> =C2=A0 - B0_M0_AIC_USB_EN-O -> B0_M0_CPU_L0_RST_IND_L-O
> =C2=A0 - B0_M0_BRD_ID_2-I -> B0_M0_BMC_TO_GPU_MCU_I2C_EN-O
> =C2=A0 - B1_M0_AIC_USB_EN-O -> B1_M0_CPU_L0_RST_IND_L-O
> =C2=A0 - B1_M0_BRD_ID_2-I -> B1_M0_BMC_TO_GPU_MCU_I2C_EN-O
> =C2=A0 - IOX_GPIO_P16_TP -> USB2_BMC_HUB2_RST_L-O
> =C2=A0 - I2C_PDB_ALERT_L-I -> X86_TPM_RST_SEL_L-O
> - Remove unexpected or unsupported properties from SSIF and IOEXP
> =C2=A0 nodes.
> - Change all status values from "ok" to "okay" for consistency.
> - Link to v2: https://lore.kernel.org/r/20260203-sanmiguel_init_dts-v2-0-=
6a5682c32b38@gmail.com

Can you please discuss these proposed changes in the context of my
reply to Kevin below?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Thanks,

Andrew
