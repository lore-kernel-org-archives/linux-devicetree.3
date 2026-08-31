Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89A499F1E;
	Mon, 31 Aug 2026 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198863; cv=none; b=DtpnNBE9uY7h5pk1bssjxPv1Ag9puz62vdfroUYWyndLtN3s4X8mlW9agqH+CLOAeaaZz07TgVN+In22OAz1RkTPZG0IAZXA24gIVdXRahgdEzYmcvfUXsccMtHUN0MPBtcNrCePuswyZLyRzYd8fLFJpu6+VAhCdmRP2WQX8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198863; c=relaxed/simple;
	bh=CLP0Zs8FcVoLb/ca1fWkg6f+ehXCLl7jvsgeOolHfzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ge57cEbR2kGx3Vx49yfZgTgnfgBUK2dcyLIyz8bmCZqm3JJ1fFcW3s5+Mxy6UW9e7EvReKjwR/hddnY79CPvv6/iRPZJEmGaITKQux/2ATIUtmKpKU4wbXfOTIsiYO/pr4FASRbSusBsejB503DKNcTVVcj5lNmMijN7WaoaPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxvKonl7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxvKonl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396C51F00A3D;
	Mon, 31 Aug 2026 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198861;
	bh=dWWbcBwqDlx8QShY/YpuD/ZcfTs6H9vSeSmK8QgTDJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BxvKonl7AZLHvQ6L000CGjhZr/9keDAG+B75WS6em6mo5/u5WVSjadv7vSt1nD/6+
	 p/f+MBKIYkZ7wB9k0QqniNHEY2Rm5+7Hx+L8CuSs/duK+GKQnaQdeq9e6kFbe08MR3
	 CSMU5Io3z/CWNf1Kq9ypzZ2qifg3nzlaK4oHQXzmNtnRJsMfcWMokCXM/q7SgNiIwt
	 B6AyN3mjK5KkdU6SEaxUrtGj+Wls/feN9mcnFBoIP/jEldryJvd70X1jh+378gzn17
	 NK1IT3iUiWlB7behHS5IujLtYqw5+Bdj6rH6r1tlRbVXFYsB7sArfoeZXL8XYSTLmw
	 2Tl4QIABZwuuA==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@oss.qualcomm.com,
	Shujath Mohd <shujath@outlook.in>
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinctrl
Date: Mon, 31 Aug 2026 12:53:51 -0500
Message-ID: <178819882987.1411250.13799863323959632704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com> <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 15:15:07 +0530, Shujath Mohd wrote:
> Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
> controller on Sony Xperia Tama devices.
> 
> This enables the UART hardware flow control required for reliable
> Bluetooth communication at higher baud rates.
> 
> Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
> Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinctrl
      commit: cd0f33393882e2554d46e8e068ab95d00593f385

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
