Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9853859E6
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679124; cv=none; b=E6Nt9QrzjJSOBHmg8zJLiIxYM6svZULgdWsqRLdM/akEJJazpU/ujNIf/vmSGuPP3DX9VfAcF080Xp44migP0ZYJZfA4+qct5zKzqSGYofH8zau77Ui8BZedqdmgIIKywKd48xrfC46p6VD+2HUKvIagHLCIfT4KSRil6l+L+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679124; c=relaxed/simple;
	bh=H/NMAscdWnyn2mCzzXsvKPF3UUVkaEjy/4zJ7RKWNp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=jUoKIQCmidUxNZaaQ7eRSVaYO1Jcn2N1B5X2AjVHX93aOext6JnWp2K9HfsFNuU8hDU0XNXIVghYDqtJuvihjNQo7T7+1DP+Cgx3/lRkZ7hwl3HE8TdebIsEyFzmiMzo0nHvGkwEdsdgInADTIWupbhDdpu+6zOU1UJL6uecJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=l9Q+SfqX; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="l9Q+SfqX"
Date: Mon, 20 Apr 2026 09:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776679119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kvD2DikviA++89KX8OaJkmvE5pvGQ/4eoowpnanR1U=;
	b=l9Q+SfqX30Qbs4KOt9Td3MQlmR+ub2/x8RzsNtI1ikkuTqvGUHqL/7fQSxj4+MPO0w/lPr
	NEf8ZTUZ4MYvbPtcFkMzHF854I7iUPa+mZO39ehgSm85T6DYrbCa3wF/UtSpqdZ+3MFZU7
	zMYqG5I2ke+s7B5IWmHES5F8yKqLtickGuWLgp3wu/SRnw7ZUnY8ZN+VNDwG86vPyDjQPJ
	u4uH795JJPYgjjHH2hfcnr0aFPMtEPAaAs26qfZ6B6zdFa5zN/8Ky4FZjjSM7vLBVgNaie
	e+7+a7NIDNiCPjbLeaZlH3OMxJ4CK6dzJi2zUmpCmiQ9DNNaBKV3PpIoxEb8Xg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, funderscore@postmarketos.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at
Subject: Re: [PATCH v2 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdsedm.2ad0jjpxzfm46@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi,

On Mon, 20 Apr 2026 06:18, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Supported features:
>- 1GB/2GB RAM (via U-Boot memory fixup)
>- 10/100 Ethernet (Internal PHY)
>- eMMC and SD card storage
>- PWM-based CPU voltage regulation
>- UART (Serial console)
>
>Changes in v2:
>- Split dt-bindings and dts changes into separate patches.
>- Updated model string to match documented vendor prefix.
>- Put vddio_sd states array in a single line.
>- Added a clarifying comment for the unsupported Amlogic W150S1 Wi-Fi module.
>
>Notes:
>- The console uses uart_b at 921600 baud.
>- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB.
>- Tested on the 2GB RAM plus 16GB eMMC variant.
>

Sorry I was not clear, but the patches need to have a description.

checkpatch.pl should complain about this. Please use it to check that
your patches are in the correct format.

See the kernel docs about sending patches here:
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

>Christian Stefan Kövér-Draxl (2):
>  dt-bindings: arm: amlogic: add X98Q compatible
>  arm64: dts: amlogic: add support for X98Q
>
> .../devicetree/bindings/arm/amlogic.yaml      |   7 +
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 250 ++++++++++++++++++
> 3 files changed, 258 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>
>-- 
>2.53.0

--
Best regards,
Ferass
