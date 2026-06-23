Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0172DF15C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240514; cv=none; b=LFihWTty7g2x4EDiSU0dDprWUTEagl0hIv5ab3fcDm15iFc/8R/WLKzDzL/jLVE02kjpzg+bNmj0Kj5QPOW0Ev/qTXRnZKegAVZ6hSTW4rzCCryF4EMjwjpF319VoGgphf1hsBNMX7JZbDt3p9DPU6QeksiMqv4BXuluRlpIMxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240514; c=relaxed/simple;
	bh=xB+piFK9rChXo98GlVzZmB8QL/6MDMksx3FSZYRC8KU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a4OvhVBG4LKKOTpO7mwHNFGdUxtOkz6kq9kYvq5f/shhTU7N0Rzmod2Vg3ghK7dKtdsl0VUHZOt1meVMFP0FdFyXrHPN1FyVsrSBBDsy0+HVNwUvx4B8VzJX33hCjnSHP7PzUqROROXGRTpKXQi4LQj54CkIpf4f5txNdq098Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T35OX1Da; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T35OX1Da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55ED31F000E9;
	Tue, 23 Jun 2026 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782240513;
	bh=An16+9gFPVdmEriUD/NwWwogZopoWPTNSh/OChaHZI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T35OX1DaKPQn5IP8SSYjB4v9swM9syDpVenzEYRk6gNDBF9WQNbWo6r2MqSqg8niy
	 h4tb9gvMeyKongDpTdCzHJxWyBEVT2glfD+4Wo0qrsjLy1pTjrgJvPi3xCxC+cKYuZ
	 ZmIg8zNu5bUpJupCPDALv/w/7yPHl1GPSNCMGHgNtO/zVvl9r9xzw8xSMr5wcRdI9e
	 /9zXojyRXojk/rytyjtNk1SUcFjrHFzLfEPeLqRcQA1WYOaQKe8RjfGU1zAHoj/LG/
	 X6A0jljJyJ/iazpQMmgFrIoi+FhtGAMwwnxfgIDBuaSLYwyQOLOYZbtu3HvJbbrjMC
	 bK+kzEO7o8BbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon
 SDA 850
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
References: <20260623-sda850-v1-1-ddd8e62c85d8@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 18:48:32 +0000
Message-Id: <20260623184833.55ED31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing SoC ID mapping in the qcom-socinfo driver causes incorre=
ct sysfs machine attribute.
--

commit 40f8c20a8f811ef4d99535abc1be00a3d96ed7b4
Author: David Heidelberg <david@ixit.cz>

dt-bindings: arm: qcom,ids: Add SoC ID for Snapdragon SDA 850

This commit adds the numerical SoC ID (348) for the Qualcomm Snapdragon
SDA850 to the device tree bindings header.

> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm=
/qcom,ids.h
> index 1af73c0ad41cd..4b3062f57eecd 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -184,6 +184,7 @@
>  #define QCOM_ID_IPQ8078			344
>  #define QCOM_ID_SDM636			345
>  #define QCOM_ID_SDA636			346
> +#define QCOM_ID_SDA850			348

[Severity: Medium]
Should this ID also be added to the soc_id[] array in
drivers/soc/qcom/socinfo.c?

Without adding qcom_board_id(SDA850) to the array, socinfo_machine()
will return NULL when the qcom-socinfo driver probes a Snapdragon SDA850
device, because it fails to map the SMEM build ID (348) to a string.

As a result, soc_device_register() will fall back to using
of_machine_read_model(), which exposes the device tree's board model
string in the /sys/devices/soc0/machine sysfs attribute rather than
the expected SoC name.

Does this regression break user-space tools that rely on the
Qualcomm-specific ABI expectation for the machine attribute?

>  #define QCOM_ID_SDM632			349
>  #define QCOM_ID_SDA632			350
>  #define QCOM_ID_SDA450			351

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-sda850-v1-=
1-ddd8e62c85d8@ixit.cz?part=3D1
