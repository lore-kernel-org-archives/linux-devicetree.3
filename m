Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FC3939DA;
	Tue,  7 Jul 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=WOZrHptP2atVe6bUBVAw0di/8pO9a7vQIL1Hng96qvZWKqcI4sGO34K7c8wM9VxPm6go6S3Kid/b1AlbAYOOF8MSyfRtJcClg4arDh62FeEfMvvH08cMOsDHXClzJ9PdVs9XV0OcNizv44dc+ZXrVmdfCWPG+F8iPhp+2gj+L54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=jH2KSoGlwnb+2n2hXpgwLcEBCQpuWsL/KznpRqaCsW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VF0acUGssFi9otXHCASCcPtj3u+xOHkiIqcIDZiFmSXzF8KpEb0W6hEADDFf3R6u0cjIbguk/CT5acUT8jrnrs2+NRmigiTweyN4gNikCsPngq7xxxCyN1zVsU/higxODE69BPIrKOJjYSkyMFka5AaXLgpbpn1PGpooULCPi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PexVkn9L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PexVkn9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE651F00AC4;
	Tue,  7 Jul 2026 03:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394521;
	bh=PLTsJsluPqWdcVZWiqxxM8b99Qw43iYIQdSbcCGV9/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PexVkn9LzZ6W7oUC+bG7w3LRtevbFq9jIt5u8Qb6gz7rAEIk6KPSR2HMqmv9UrLSX
	 f2CMcYDfA17v5gIXTuwBAsIZwmIa5cwUwbQE02vnEXxpfcXOniJKAHr7Kkogr+KCpy
	 DdzrQGOsNkoRc0chm5e4eNInn9nebn2jV/1xpw99+NMONkf95KTkqi7lRxDNwpTHNa
	 NPGCUlrUs+TLxlZYuhRq6v3aBC2CekP0ozkAfJcNzwQY2Ot4lA1lYnYw9d7TDbDiKX
	 0P5T98k2/CQO6yrPYXE9eHjSoegerpu0iD4v/d7VImaL81fMlBB/vBW/5+9Iq3US+v
	 RSiw+vOqxxVKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
Date: Mon,  6 Jul 2026 22:21:34 -0500
Message-ID: <178339449920.1938770.17492438555652133562.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
References: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 May 2026 15:26:39 +0530, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from the one
> used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
> Without this in place the reset line will remain permanently asserted
> during resume leaving the device offline and causing all I2C transactions
> to fail with -ENXIO.
> 
> Error Logs:
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
      commit: f64ef325f1d9ca9d005b7124c2bf065bb0b99c3d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
