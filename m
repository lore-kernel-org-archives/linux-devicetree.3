Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40B363090
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283741; cv=none; b=PafP1Y1tZ9cgw2OYPm5raE4YDx68njBrD9qLKmeWoELVUG1JzcM7osANTDZDSlCZrNas9wbjXlw9zzB8Em4fSHZ1olVZKL6OAlAchGkzkiTzihlUzwNe/9p71RF8R0xyR52tcNp8fmMD/H/5oTXfMLdkzZ2sSsJj2t30xVvbQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283741; c=relaxed/simple;
	bh=JTnuYimd06oX8Ev8lzEYZUWrsmEY/HbCt3EjDsVqvAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gNKCL7bs4/GwAEUcOU/ZFCgNRO8ECt/M+ArfHn6052njMMv+Gxm/vIOW9lnpF+hJ0OlvCCEOHHXHH8AencAm3EEZ9n6HHi52RBbRr4wQbp1iG0em7UlC+okazAFPvRdYY3Iv5wC4rUO4L93qDiPWpSel5CUoRc/0v5OIK34kVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtKjslFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtKjslFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D7DC2BCB0;
	Fri,  8 May 2026 23:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283740;
	bh=JTnuYimd06oX8Ev8lzEYZUWrsmEY/HbCt3EjDsVqvAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NtKjslFjBWSCS5hnFkMYEL+pdG0iD81fyefGP25/hEhLtHk/cbX1xzL8a7iTUuMYY
	 b4wGoN3MKwq/SeCt17bT1hhBbCYJ187YW+klsamqsRfyVIogoz08HSTsbOgpp/UiPF
	 hmoL05t4lQ/uG8VPB1uRLFKEc7yEk+zuWVS5zZXMbbk6aBCef7nCfrfRj42P8CFWRC
	 EWNVPGUNkTKNzY17asrsnNK9aUGU5wTn20XjdkSh16OJt3tAC+W0fVJwhyc3Hwfd1m
	 RFLOmTynp8l5XGYY+h+QgXz2h/QhUs49Td77TGnnjg71xFlXNrDDrzaHDntVqi/Z7N
	 W/jfGxSixmgLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Reply-To: sashiko@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:42:19 +0000
Message-Id: <20260508234220.A2D7DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Improper Abstraction and Architectural Violation
- [Medium] Technical Inaccuracy in Commit Message
--

commit 61e281d574bca776edc5305b6c70e207b44fa3e0
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

iommu: Add iris-vpu-bus to iommu_buses

This commit adds the iris_vpu_bus_type to the iommu_buses array in the core
IOMMU subsystem. This allows the bus to register notifier callbacks for
device addition and removal to set up the IOMMU context.

> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.

Is this description of the notifier sequence accurate?

Looking at iommu_bus_notifier() in drivers/iommu/iommu.c, the
BUS_NOTIFY_ADD_DEVICE event actually triggers iommu_probe_device(), which
establishes the IOMMU group.

The dma_configure() routine is invoked separately by the driver core,
specifically via really_probe() in drivers/base/dd.c, during driver binding.

Could the commit message be updated to reflect the actual device model flow?

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index fccdbaf6dbd57..903a8bd118be6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c

[ ... ]

> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] =
=3D {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
> +	&iris_vpu_bus_type,
> +#endif
>  };
> =20
>  /*

Does modifying the generic IOMMU framework's iommu_buses[] array to include
a vendor-specific bus violate abstraction boundaries?

It appears the driver creates a custom bus type (iris_vpu_bus_type) purely
to provide a custom .dma_configure callback for passing an iommu_fid.=20

Could standard Linux device model methodologies be used instead, such as
instantiating child platform_device nodes or utilizing the auxiliary_bus
framework, to avoid tight coupling between the core IOMMU subsystem and
vendor-specific driver details?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-glymur-v5-=
0-7fbb340c5dbd@oss.qualcomm.com?part=3D2
