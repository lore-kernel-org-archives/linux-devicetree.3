Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4D3955C4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358726; cv=none; b=gxnl+B37TDL0fMurDwm5WnPvgCJNqkXyMUeoZzNgukr674a0GyPNIcl5J7UE1DVRShaMRDZ5eI/BH3nqFD3jgbCv12nWytbnpJYTAhhmBgZzjz9dHLf36yaXCzAxAThL6tjU+c2RfsP4XfXjPhQqcxnwptvxj+GVFcsNTcG0u8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358726; c=relaxed/simple;
	bh=2bYB1xx2/Hr8LzyFvSIy2n94i1GOiw43zEZhsMOD62E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/+r5alshEkcxYK8chQeZ3cp2htsJSpdBsmEd+BMAXdohcJADX52qI5DxCSB+LMHzfMvDLrhQcq1Grx1/hfSLeq5e/fzeeE6EfhJ0CuTMNCxp51uY8sRqPOPiZBrOkYWdwk30yFM72QlQ1roy0T6v3qTs8GLoclIhGr1lQH6dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcxGKWTT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcxGKWTT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-444826c16ffso5316697f8f.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358723; x=1779963523; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+yLXkw2GT7LxR1Ajc513/uXxkuEC8xR05slvUKTHbU=;
        b=bcxGKWTTzDecx1ijUCLdtQw/kQzh4YWHU45UM43PloiV13NL/ewrsv01AHpn+KquO9
         D5V9uZF/IYoAi/RMDnB9T0wSk8thQnxDK0xlm9ucRqjYR7a9DLr+l9lH54mC5is0jIgM
         +gmbtg87OMh5dUm56CK1JChECZwojAytTZiP31jDkw+SXWSwt5bPq4NlrTlCqU4po6bt
         fF5IYYAwR8WG8GV2N7O32vMygifDi3N9DrMGDfkiC8uACnC/l6ddOrfePn4TDslW/kCz
         9HfC9GfiAQ0UlGE5DMFNvnZtnZxIcGJkgNxqFDk5MvrjeLuI5B5Zf6Z+2VPMpTiXcZuR
         4xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358723; x=1779963523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+yLXkw2GT7LxR1Ajc513/uXxkuEC8xR05slvUKTHbU=;
        b=Ftr2QJZYr4GcVmd1hfl7siw9IB59ZilXnM8OE+F1NQ0neey36fkZVqmyrhnpDgPdHl
         rWaXns4kHptMOYPO7AEHgkTKaOnXug2sN1g1AhBBeDGxUeG51kqUBdEV/zH2ToFdIGa5
         J3TiMSU/MEGSlVHJwKSzSEN3Rvf8FULMmtkpCtVxYSd1Zyz0Ao5xerV7RkEqpooOcZaa
         F5gW6Nc4wBKrlmVoddKS88JxH86eF2p7mWyQ8pKBPbf0mnjdDCR8aEDQ3AC75lhbguN/
         0YLNA4pHoUnHsOMHWPaabtXzzLU4mXkpaJPDJyttqL0xXJLLT/K0YCDiV332OjLGNtf0
         X+yg==
X-Forwarded-Encrypted: i=1; AFNElJ9o++NPhiDaBCuUmtto7lCJ2ZoyIZW0LhWrxiPE0lWf+uM6vYtvyV+WDhZAvGN2th+SEpwdF9VVna8j@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrfs9UbLJGfmzdEHZB5YwME4+PscY+gYG1VkYOqs3BJSUIS0n
	XJyz92YSrxk4fG45CjwWxxw0VW4C+2mWfgpdyyXjF0JTHvNSyPsPwAc/
X-Gm-Gg: Acq92OEz8NGzjb2Rx/q1VGZ8ce/vv5VXm8qDRcKbG7+voLHoteUYp7bwRAwiZOfjKia
	4L8WL28YdATe+AMG5fardGlnoGLkQ5PXCkSMwDBtfFCdlw4WM2LMr1ky4JyXt/BHxvbJa5sV9OR
	+AWEO7MiDrMcXLmEZ07bVGSxFeQc1Vspl8VksauMmT3GVGKTf7l5B/2Pa6cfZMZdG2Jl5y19W5S
	FQXdgHZlyQqV4sEXPER9yj9HWnLdQtCT5BdXzTs9QMdsC+9ClY82q/WJKHxx1onelokYWvTlYMB
	XX85Hh6nkrncLLcqeb1sxIcAjEOEmHr8r+t+LnHIDIPiT8Qby2lwW+rFnsn6PL+UiB8NGWSulAl
	uhtbEXOzO3qbTjBaoWSuL0utKDY4fCAAQyGzgQLaOnwzY7NHL1n/ZRAtdMMD3Nz0aaLGTMmH+z1
	u3R2EZRQsgP1mTBDK2IcEujmBTNEYFTUMjRtd5qzqCkknXoJPaOk9YqfsHy/U9t9zlOLBHfe5Kd
	GXKJGHvUQrXr5fr/05hgl40Y4prxLHXcJORKjOtQeJrYTL3zLUk8647qlCsxQcmIVmqDltv0Bhp
	IFTNXW2V+A==
X-Received: by 2002:a05:6000:4284:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-45ea36b88ebmr3980111f8f.14.1779358722497;
        Thu, 21 May 2026 03:18:42 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9daasm1980702f8f.11.2026.05.21.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:18:42 -0700 (PDT)
Date: Thu, 21 May 2026 12:18:41 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank.Li@nxp.com, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <3pcmepn2kr2b2gku33mriosmnim4xd7e75pt2j7i7vnt4awhgg@3cptbxl5u4x5>
References: <20260521-add-aquila-imx95-v3-2-621843807def@toradex.com>
 <20260521093854.14DAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521093854.14DAB1F000E9@smtp.kernel.org>

> > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> > new file mode 100644
> > index 0000000000000..bb4a3631af9ba
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> 
> [ ... ]
> 
> > +/* Aquila I2S_1 */
> > +&sai2 {
> > +	status = "okay";
> > +};
> > +
> > +&som_dsi2dp_bridge {
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Will this bridge fail to probe since the DSI input connection is missing?
> 
> Looking at the ti-sn65dsi86 driver in ti_sn_bridge_parse_dsi_host(), it uses
> of_graph_get_remote_node(np, 0, 0) and unconditionally returns -ENODEV if the
> remote node is missing.
> 
> Since the upstream i.MX95 SoC DSI controller doesn't appear to be implemented
> and linked to the dsi2dp_in endpoint yet, should this node remain disabled
> until the controller is available?
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521-add-aquila-imx95-v3-0-621843807def@toradex.com?part=2

Hi Frank,

This is valid point from the bot.
If there is nothing else, I'll send a v4 that removes '&som_dsi2dp_bridge' 
from the Dev and Clover board, since the node is disabled in the SoM dtsi.

Thanks,

Franz


