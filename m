Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF83A9636
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580387; cv=none; b=m0kPfFr8j660SpC1v6W7uu7HBJia2mye8B+3F7wd2IxNszg3cruyACZ4HFRPrRxhyzMuIcsaGrqQzx5FWY8ICxExaWFcAMgLotSgkNRZmZSEOVv3WyrAiq0c1uOZCNwiIDquLcnYec/JCiVPL/mHAb7n4ooa6MBV38KOnlbNlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580387; c=relaxed/simple;
	bh=c2fDzd4x1FsLocXBH5HRzatZTdsSBovOyPm3nwD2R3U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikPkPqWWG5O2MM1sKH0xQ61VlfedEZ1noFEmpvYPqqbmTyjs3U6ykqL0Bh2iOPG8x/WbF035sIwUmHTOMMPLfY7EzxhqS79jkCPLPpurMF33ZxsL49Yba4z+vZSC4AxNPj8XIkljFiOSPABRjPh/8bQsaPhe/V0DU3+YF3LYgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2KJ/QwZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2KJ/QwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D36C2BCF5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778580386;
	bh=c2fDzd4x1FsLocXBH5HRzatZTdsSBovOyPm3nwD2R3U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=r2KJ/QwZZ93C7cnXZ9aXEdlIu73dxnvZ0dnrR5vy0frJtRCjaWTVYUtxugnJq/U1Z
	 NVpVkemMglRlGeb6JfQSIDguI7nd3BkIb0sZfmI/YAf18/xBbPUMOqgRBhWu0L2GX7
	 gIK9aj/AXOWyXBVeoCGqvTaxDeR/t7SMkOdL+6qZZNiIi0U1qkXJ2tvsTf4qO1cuOo
	 iQ+61EdVMYIzEfzoVOwuiJ11aHkIGcCR0v76iEUwNSSIM1El6HiJjixktHOmvj4WdO
	 Tf+9rzTya9/+FbIbY1x57nVgbcRGtgGBKtm0R577fkJTtafJ0+4aOZ0yvHwnRXXE8Y
	 yjcUIZXAVWCZg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38be5e86918so66435821fa.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YeeEkxtilHetJ80pBQnqNaqsUzUnIAOrOlK0+TZgzWSx7r5RbKbXtsEay8wDInXPGxG/ajzlclQ4J@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpK3oOumnSMLyo3vgZiMo2ZdgRAo7jqavTTZwYWVR0sqBb4Rv
	T9r+lAI+H4+tB5kKtPn2q9mjuiVq2pAbgwk1CK1BP9jxgAzwa/R1cnw7U0WvIneguUgdL8ueU9Q
	As0uXOa61lRxx04NF22Nc3F2v8TZ7TGuOsgQC1iL0cQ==
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr8570434e87.4.1778580385278; Tue, 12 May 2026
 03:06:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 03:06:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 03:06:23 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
Date: Tue, 12 May 2026 03:06:23 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+27Eouotw18Ayw9GbkqPLN5g25gaBc_DyR3rrDOP-rw@mail.gmail.com>
X-Gm-Features: AVHnY4IRViCLTV3_BvCH2BmXcl3_2W-sA61609ccNXge5bvIhYXSsMAvuuHcZWE
Message-ID: <CAMRc=Me+27Eouotw18Ayw9GbkqPLN5g25gaBc_DyR3rrDOP-rw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: convert davinci i2c to dt-schema
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 05:00:32 +0200, Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> said:
> Convert the Texas Instruments DaVinci and Keystone I2C controller
> bindings from legacy text format to modern dt-schema (YAML).
>
> During the conversion, the `interrupts` property was made required
> to match the strict requirement in the driver probe function. The
> custom `ti,has-pfunc` and `power-domains` properties were also
> properly defined to match SoC-specific hardware features.
>
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@intel.com/

The report was on an earlier version. This patch is not a solution to a problem
spotted by the build bot itself. I'd just drop this line.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz
