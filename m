Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FC397925
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986796; cv=none; b=KAeawpIT8USP1eKkWNbFIYtd9KKenl9FgrA5lcyNDT4a6KthzV/evFdx6S3TrYOU89NnSlQUKcS1inRikiikt+p44SbXsUUDtG6QWPnFekeqX/TkZ8uCP+TQdOMenBT9h1ydKvWeTqfpmCipbHDMkfgoQxE68PG7/zgRKFiSIvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986796; c=relaxed/simple;
	bh=Y8b79y5XCtZlernPwxLw5KD0jSJxpZoqTdqKWTaKyts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dXsMPKkYy629RGVJc7faVlQqRo6AuxbOlS8P9DbhXOkmo8fchgee6VU+CUzD6wVRFmfmxZygTo3ylK0OZfaFjYibVzYat173UfzHrNszKgC3VYL1gSDUh9orEcIaNlbmPg/M926AqZaI1ltFhs2mIZYSHh7YZJBOs1XLq47YSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3a25rUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3a25rUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5E91F000FF;
	Wed,  9 Sep 2026 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986785;
	bh=rE14afaGEUMx+se97FtBVIJKxJ8S9rD9lckvL0Fo1+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a3a25rUy8WzGLm4XEEgtlBnvRaDKFKIcF+KldmoQXGEdK7co9KSGliVc0jBwo2z/O
	 lYujBgPZN8hB1QkWJsbZoW43jADEscBkQ/3Pmc8nIK1YzuODFKV0DzihQ1AWqy4W1a
	 Xipa9n+YxgArn0gscLVIa65JDSUf6LRFxO0queNztejbTNOJhLLuX0vMVJSuckWMKH
	 +TIv/rXAx1TfEamexAZ18vz71hlJ4w7ScYHHqmtBq+BOgXkQu9GEE2974vyQCKNDkD
	 B8QkSSeHb562PSizDUhX04d5lYb3Ovf5+E6ic7gG4LNFPC7NFMmAchq2/8E4tqrs+k
	 r+q1KBcr83N0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] media: ipu-bridge: Add Sony IMX681
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909203717.90605-4-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
 <20260909203717.90605-4-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 20:46:24 +0000
Message-Id: <20260909204624.9A5E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling secondary fwnode pointers upon unregistration leading to =
UAF
--

commit 14048fa470e12c0fb57d0c87c84bc92c1497b100
Author: Sergey Lebedev <lsa.uz@pm.me>

media: ipu-bridge: Add Sony IMX681

This patch adds support for the Sony IMX681 user-facing sensor to the IPU
bridge. It ensures the sensor can be properly connected in the graph by
mapping its ACPI identifier.

> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index 7e65491faf6dc..68c2eb326f1dc 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -97,6 +97,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
>  	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */
>  	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
> +	/* Sony IMX681 */
> +	IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issue
in the IPU bridge setup and teardown path.

In ipu_bridge_connect_sensor(), the ACPI device's secondary fwnode pointer =
is
manually assigned to point to the newly created software node:

    primary->secondary =3D fwnode;

Additionally, ipu_bridge_instantiate_ivsc() also sets the secondary fwnode
for the CSI device:

    set_secondary_fwnode(sensor->csi_dev, fwnode);

When an error occurs and err_free_swnodes is reached during module
initialization, or when ipu_bridge_unregister_sensors() is called during
teardown, the underlying software nodes are freed:

    software_node_unregister_node_group(sensor->group);

However, primary->secondary and the csi_dev secondary fwnode are never clea=
red
back to NULL. Does this leave dangling pointers that could lead to a
use-after-free if another subsystem iterates over or accesses the secondary
fwnodes after the group is unregistered?

>  	/* Sony IMX471 */
>  	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909203717.9060=
5-1-lsa.uz@pm.me?part=3D3
