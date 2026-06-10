Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE231282C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082406; cv=none; b=YIC7/Snk7eKzs8Asz2PE2XWMI9ORG0T/co1b9k7FR00b8UzYbBAr76x2uSGhq3/zZ1kozQnkyX3R8dEo8YRtglCqYe2jHFguPKkQQKCaSZ4sezuWQuEoxNq2GBeZrxLy3tRWWXCcTEXHSxj1PVewAR74fI3K4D+KvHp3PSq9odE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082406; c=relaxed/simple;
	bh=3tfm6M4gSqYKIvSICrDLHNeY0YxiB5/L+eLjmsYLxrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXGTAzBec8J/zGrSG68qL8xD/GK25Bcz32PsnPTd9Q8SZ1YunwBU6vVoKbxMTueB0SUENp8PftsUy7L4TnIS7U8HDrtQyRYGf/+h7T9xinwdkKAnpqwsKSYdqk9AgGsA5uxm/cUmXMNNUXXIpHr3LeReFrQThtktqG8XWp6ya6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTZjgmAK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTZjgmAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D351F00898;
	Wed, 10 Jun 2026 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082404;
	bh=YgagyLYSLVlJ0aGitlhd4DSBJmAn/HpyaG40d7Hlfac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTZjgmAKDoQJPwmlsnmRVwmQYu6i9cwRjBU47Z8uOR/+bReoCTgjl4XPdVmOeP5QV
	 TjgQjmY/kQG8RIH9THyPXjbpMFozXy1rngnpA/NVBkCNDIT8+0vm5lFnJru0uVKGmE
	 5vhkg5AJsO8PkWu3dqfV0hMnuFfQGUyXlLbi5ZfbjeQyoI9Ack6W03GUyE7VLrMQeG
	 GegsLKF20G3DGpGypxKjQSoklWXPZjlWjZw7G7WNKwrW44BgvNzxUKKXLgkCmPPFqP
	 WwM+IFQMS2NCmtDgDMgEOdNoYebZWqgTcGN6xK9q2iIqeyS0A8vE3dVpS1NGrSKwOD
	 O+5pIP5F0wsEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 7/9] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:06:43 +0000
Message-Id: <20260610090644.88D351F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Circular `devm` dependency creates a permanent resource leak of du=
mmy platform devices and devfreq instances, leading to a Use-After-Free of =
the `memory` struct on module unload.
- [Medium] Dummy platform devices are created with generic names and PLATFO=
RM_DEVID_NONE, causing global platform bus naming collisions.
--

commit 911bb9ff9b30677cf9eaa4d7a6794775e3393fc4
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Introduce the QCOM SCMI Memlat devfreq driver

This commit introduces a devfreq SCMI client driver that uses the MEMLAT
algorithm to detect memory-latency-bound workloads. It controls the frequen=
cy
and level of memory buses like DDR and LLCC on Qualcomm platforms.

> diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq=
/scmi-qcom-memlat-devfreq.c
> new file mode 100644
> index 0000000000000..99ae229acfdc3
> --- /dev/null
> +++ b/drivers/devfreq/scmi-qcom-memlat-devfreq.c

[ ... ]

> +static void scmi_qcom_memlat_unwind(struct scmi_qcom_memlat_info *info, =
int count)
> +{
> +	for (int i =3D 0; i < count; i++) {
> +		struct scmi_qcom_memory_info *memory =3D info->memory[i];
> +
> +		if (IS_ERR_OR_NULL(memory) || IS_ERR_OR_NULL(memory->pdev))
> +			continue;
> +
> +		dev_pm_opp_remove_all_dynamic(&memory->pdev->dev);
> +		platform_device_unregister(memory->pdev);
> +	}
> +}

[ ... ]

> +	for (i =3D 0; i < info->memory_cnt; i++) {
> +		struct scmi_qcom_memory_info *memory =3D info->memory[i];
> +		struct platform_device *pdev =3D memory->pdev;
> +		struct devfreq_dev_profile *profile =3D &memory->profile;
> +
> +		/* sampling time should be double the devfreq observing time */
> +		profile->polling_ms =3D max(1U, info->cpucp_sample_ms / 2);
> +		profile->get_cur_freq =3D scmi_qcom_devfreq_get_cur_freq;
> +		profile->initial_freq =3D memory->min_freq > 1 ?
> +					(memory->min_freq * 1000UL) : memory->min_freq;
> +
> +		platform_set_drvdata(pdev, memory);
> +
> +		memory->devfreq =3D devm_devfreq_add_device(&pdev->dev, profile,
> +							  DEVFREQ_GOV_REMOTE, NULL);

[Severity: High]
Does this create a circular dependency that results in a permanent resource
leak and use-after-free on module unload?

The driver registers dummy platform devices without binding a driver to the=
m,
and attaches devfreq instances to them using devm_devfreq_add_device() here.
The devfreq core internally calls get_device(dev->parent), taking a referen=
ce
on pdev->dev.

During module unload or probe failure, scmi_qcom_memlat_unwind() calls
platform_device_unregister(pdev), dropping the initial reference. However, =
for
a driverless device, devres cleanup actions are only executed when the devi=
ce
is finally released (device_release()). Because the child devfreq device st=
ill
holds a reference to pdev->dev, its refcount never drops to zero, preventing
the devres cleanup from executing.

This creates a circular dependency where the devfreq device is permanently
leaked. When the SCMI driver finishes its removal, its own devres actions f=
ree
the memory structure (allocated via devm_kzalloc(&sdev->dev)). The leaked
devfreq device's delayed work queue continues to poll, dereferencing the fr=
eed
memory pointer via profile->get_cur_freq() in scmi_qcom_devfreq_get_cur_fre=
q(),
which could result in a panic.

> +		if (IS_ERR(memory->devfreq)) {
> +			dev_err(&sdev->dev, "failed to add devfreq device\n");
> +			/* Stop sampling and voting timer */

[ ... ]

> +	for (i =3D 0; i < cfg_data->memory_cnt; i++) {
> +		const struct scmi_qcom_memory_cfg *memory_cfg =3D &cfg_data->memory_cf=
g[i];
> +		struct platform_device_info pdevinfo =3D { 0 };
> +
> +		pdevinfo.parent =3D &sdev->dev;
> +		pdevinfo.name =3D memory_cfg->name;
> +		pdevinfo.id =3D PLATFORM_DEVID_NONE;

[Severity: Medium]
Will this cause global platform bus naming collisions?

The driver registers dummy platform devices with generic names (e.g., "ddr",
"llcc", "ddr-qos") and uses PLATFORM_DEVID_NONE instead of PLATFORM_DEVID_A=
UTO.
As a result, devices are added to the global platform bus with exactly these
generic names.

If any other driver in the kernel registers a platform device with the same
name, or if there are multiple SCMI memlat instances active in the system,
platform_device_register_full() will fail with -EEXIST and abort the probe.

Could this use a driver-specific prefix or auto-assigned instance IDs to
prevent namespace collisions?

> +
> +		memory =3D devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> +		if (!memory)
> +			return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-rfc_v7_scm=
i_memlat-v7-0-f3f68c608f25@oss.qualcomm.com?part=3D7
