Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB5358387
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336728; cv=none; b=MaaIX50j+ZT8aqePT7ukkW9pESC8k72tgiXS8XY5mfNmtVRjvjLZS1ZdFIt7Md1l8MWs01YJhlRLMC2LaTp4KAVzZ10XmZdA/5vEz6rNcHDG1yHsCNnzMQ3ZejyDNbxnzZjPGVnw2bhinQiDGdHiTmWxnYXTT/FZ7IQJqSp2SpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336728; c=relaxed/simple;
	bh=8q02dDRrdyTD94HpqI0u6vVbKWMlAYt+TeiQ19JWcfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cO7RHZDZi76/eBcxwlMQ0nW8F7T6KubXvAARBiGGiJKrf0sYG3/QfHorkV0WJczAEt0nlLyyFVLF7Dc8EM/JEIMuWvxwnNvzkzk8csCALTRx8HrIeQoCg+nJYiDbo/dxPhUWkfJP4kvhSLALOvy9vlE6TdeFkPjphnoDn9rUKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuTAVG77; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuTAVG77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1371F000E9;
	Wed, 24 Jun 2026 21:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782336726;
	bh=LQd9MP3q+6n3MSc41Kyg9DXeKiq7uvtR9AYMjqWofPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuTAVG77b+Xi5TUzx890dO3c/dX/JmuHsFyIxP+A4MNJIsyDzFpa17T08wW6CnKNz
	 MQFgXC2L5UarAIBTzO1iUftVs+A4vwKGRTaGJi064+7Djq/MJXu28FGDyQW1Cc8/lt
	 zUHIatLwlut/E+QMfegUeHGFGnTV2EIihgbPcD6Hngpo5agFQL9oeGZKhqt9P9tw5+
	 j8y1Vxidmp08odel99InjBJDwdMFuAKAphdCmZzgO0eU3mEcI2f5PSbjJ79M/LsSce
	 aEo+VW/dFZecP++brN9eOY2evhym5ZN3hDmgzZACkfnbY+RoD/VZmhKZ6sWy4cLG4+
	 O4zey2oq0OYow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] Documentation: ABI: Add ABI doc for versal edac
 sysfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rama devi Veggalam" <rama.devi.veggalam@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624212545.2850787-3-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-3-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:32:05 +0000
Message-Id: <20260624213206.3A1371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The sysfs entries implement a stateful RPC command-response inte=
rface, causing data races.
- [Medium] Multiple sysfs attributes output complex, multiline blocks inste=
ad of single values.
- [Low] Malformed ABI Documentation Syntax.
- [Low] Duplicate and conflicting entries in ABI Documentation.
--

commit 9760cee2db24f4eb5850706de75cd24db0ae078c
Author: Rama devi Veggalam <rama.devi.veggalam@amd.com>

Documentation: ABI: Add ABI doc for versal edac sysfs

Add documentation for the sysfs entries created for
versal edac (XilSEM).

> diff --git a/Documentation/ABI/testing/sysfs-driver-versal-edac b/Documen=
tation/ABI/testing/sysfs-driver-versal-edac
> new file mode 100644
> index 0000000000000..c35d864fcbe2c
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-versal-edac
> @@ -0,0 +1,303 @@
> +What:		/sys/devices/system/edac/versal_xilsem/xsem_scan_control
> +Date:		What:		/sys/devices/system/edac/mc/mc0/xsem_scan_control
> +Date:		June 2026

[Severity: Low]
Is there malformed syntax in this documentation block? The second line has =
a=20
duplicate "What:" definition inside the "Date:" field.

> +Contact:	rama.devi.veggalam@amd.com
> +Description:
> +		It is a read/write file.
> +		Writing to this file causes the software to initiate a
> +		request to the firmware for doing requested scan operation in
> +		Configuration RAM (CRAM) or NPI of Versal mono/SSIT devices.
> +		User needs to provide scan operation id (init, start, stop) and
> +		SLR id (Versal SSIT device) details. For Versal mono devices,
> +		the SLR id should be 0.
> +		The scan operation id values are as given below:
> +		1 - Initialize the scan
> +		2 - Start CRAM scan
> +		3 - Stop CRAM scan
> +		5 - Start NPI scan
> +		6 - Stop NPI scan
> +		7 - Inject NPI error in first descriptor
> +
> +		When read, it shows the current scan status with error code.

[Severity: Medium]
Could this stateful command-response interface introduce data races?

In drivers/edac/versal_edac.c, xsem_scan_control_store() writes the command
result directly to the shared, lockless array:

    ret =3D zynqmp_pm_xilsem_cntrl_ops(cmd, slrid, priv->xsem_rtca->scan_ct=
rl_status);

Then xsem_scan_control_show() reads from it:

    return sprintf(data, "[0x%x][0x%x][0x%x][0x%x][0x%x][0x%x][0x%x]\n\r",
                   priv->xsem_rtca->scan_ctrl_status[0],

Will concurrent writes to xsem_scan_control clobber the shared buffers
in priv->xsem_rtca->scan_ctrl_status before either process reads the
attribute, leading to incorrect results?

[ ... ]

> +What:		/sys/devices/system/edac/mc/mc0/xsem_read_ssit_status
> +Date:		June 2026
> +Contact:	rama.devi.veggalam@amd.com
> +Description:
> +		It is a read/write file.
> +		Writing to this file causes the software to initiate a
> +		request to read CRAM and NPI scan status information in a given SLR.
> +		User needs to provide SLR id in Versal SSIT device for which
> +		XilSEM status to be read. When read, it shows
> +		the XilSEM status of the requested SLR.
> +		The format is: <Header> <SLR id> <NPI status info> <CRAM status info>
> +		Example: Read SLR Status Cmd:[0x1030d]
> +		SLR ID:[0x3]
> +		NPI status:[0xa01]

[Severity: Medium]
Will this sysfs attribute violate the single-value-per-file guideline?

Looking at xsem_read_ssit_status_show() in drivers/edac/versal_edac.c, it
generates a multiline block instead of a single value:

    offset +=3D sprintf(data + offset, "Read SLR Status Cmd:[0x%x]\n\r",
                      priv->xsem_rtca->xilsem_ssit_status[0]);
    offset +=3D sprintf(data + offset, "SLR ID:[0x%x]\n\r",
                      priv->xsem_rtca->xilsem_ssit_status[1]);
    offset +=3D sprintf(data + offset, "NPI status:[0x%x]\n\r",

Does this complex multiline output break standard userspace tools that
parse sysfs?

[ ... ]

> +What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_injecterr
> +Date:		July 2025
> +Contact:	rama.devi.veggalam@amd.com

[Severity: Low]
Are there duplicate and conflicting entries in the documentation?

The path /sys/devices/system/edac/versal_xilsem/xsem_cram_injecterr=20
listed here appears to conflict with the /sys/devices/system/edac/mc/mc0/=20
path documented earlier for the same attribute.

> +Description:
> +		It is a read/write file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624212545.2850=
787-1-rama.devi.veggalam@amd.com?part=3D2
