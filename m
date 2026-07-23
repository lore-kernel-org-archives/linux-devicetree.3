Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769467478
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770459; cv=none; b=DlGywMn+5WeyojO73Dzvrtbc29IpimaDEvkLapLRkhq3AuImm4dN5IvV3mzcyYoJlyHR6T98tlF2FC2e10sOB/e84PMpRnNbV4Kli7t3cSZWdH4YUgvra7Ba0x9ghseM9Ixx6bKrhyfEeCn13dq3hA9mPOklnyxSXLV1g1/yAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770459; c=relaxed/simple;
	bh=gMvOGwo2GISRSxBEX6u3cMW7Ie3XAagcCOE9FNvAX14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rHqkdcuSZLWqegM57U/xechB0VdPOa5MrXWVZqWf0xsqYybMCwcCRKxEVHGSf3dlsPE9fSMIy9mK2Zdg/47L16sAyxZMzLxBzVxEofcwukRfbJs3/BT9/fAqtx9xMcuCvnAxhCoJ0W8QjWxAK+OXV/ChTIEJpPzcK0DRA90Sja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME6rVm+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME6rVm+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DFA1F000E9;
	Thu, 23 Jul 2026 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784770458;
	bh=W0d3ZxhRLO+a3IqrPho1tRPxUMvDsFO3oph/Qi9L/YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ME6rVm+yrxNesDKvgoWtWsT29UDzftcJthV7Z0ZAHgkPkkkmHfZNCy79hYDi4XPb4
	 ra4sW4+0fQFU6bn8MLJepyqHHZzd+2WEzWDC1S/aFYVcQleFeZ0YSYGL8/0d3yrZyq
	 RSFF77I5bppojT77qQS6nVDBHu3bgTXQpWJpDdMW8TM1rDFDouPbYIzI/4jM91c8TL
	 AbKkqoT3sB/pIfTH8rZS0KFKtyqMlzUoFa9TeIOTYWov4FgAwnGtSsVyH3uOigEpxX
	 bk2u+DmNB9+OQKU3oCRKflxYq9YcNX0yiOphaZm23C4j1OI2VGq07CXvRZzuD1480A
	 iWgzUPcgnwR6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add initial Motorola Moto E4
 (perry) support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aneesh Pradhan" <aneeshpradhan2004@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723012431.48499-4-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723012431.48499-4-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 01:34:17 +0000
Message-Id: <20260723013417.D5DFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree blob entries in the Makefile are not sorted alphabetica=
lly.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: qcom: add initial Motorola Moto E4 (=
perry) support ---
commit f1e9e7f386e094ca8238575174ce1d5dde0b3f6c
Author: Catherine Frederick (coolguy) <serenity@floorchan.org>

arm64: dts: qcom: add initial Motorola Moto E4 (perry) support
   =20
This commit adds MSM8917 and MSM8920 board files for the Motorola Moto E4
(perry) sharing a common dtsi. It includes an initial subset of peripherals
such as regulators, eMMC/SD, USB OTG, and touchscreen, while deferring
peripherals lacking mainline drivers.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index e05414290d8e5..d92bd2863ef23 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -109,6 +109,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-yiming-uz801v3.d=
tb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8917-xiaomi-riva.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8917-xiaomi-rolex.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8917-xiaomi-tiare.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8917-motorola-perry.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8920-motorola-perry.dtb

[Severity: Low]
This isn't a bug, but shouldn't these new device tree blobs be sorted
alphabetically within the Makefile?=20

It looks like msm8917-motorola-perry.dtb is being inserted after the=20
msm8917-xiaomi-* entries. Placing it before msm8917-xiaomi-riva.dtb would
follow the existing sorting convention and help minimize merge conflicts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723012431.4849=
9-1-aneeshpradhan@acm.org?part=3D3
