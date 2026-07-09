Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFE1C5499
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605541; cv=none; b=SyQsov5EKH8U0zrOa0ujlbY6gkEk0ysIoXkbsUAet46YI4Bt4mGN3nD/eujCM7nB4T9+I95TvLQzU7G5IkNamULbqQO8jsEWI0m+I+uOffqBEr/vRUTov5ozEUe99Qo/L2Gm35LwK/b1MfDruxO1XW294jPETqsWYFJ0aKSszxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605541; c=relaxed/simple;
	bh=+w8+MNY67NnEZOU2fY/0lQZGe/cA71Z1Z4sP9Sop+e4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCUoM5rOSqME0bUetEPRs81VkYJvkaXs5o3P7raFxMtPm6mvpniSpwl9P4IRI9Gy9HabXHOBuQliwhxWwNfFvuGJWLWmv/+29u6sqn931FDUtBfWoGeM6QAODS8D7JaE2wYYPfJrt3zZbmbJY3fJvAIIvLUBJjFR7kkpkTDKR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOmkqLqe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOmkqLqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9D61F000E9;
	Thu,  9 Jul 2026 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605539;
	bh=eX/bMcG1Y7+xUg9oCJe8EufDdHsNPoHpa2IHWgZz9yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bOmkqLqegx3OLViplXQfYykU/eKxkJV4F6Mo81bgJAi03xbamfzpnGmZx8MF2dJwE
	 R3CChoEFtsXPc+9lugc1hWbNl+tRhno3mYT/ZU0RCwmSm0rL+Zlyl+N86JpadZ17Fm
	 PsHPBvu3z+WFhq4xRLsa+8d4UH+THK4HKbht2v5yCBUZap/2FAIMyr7OiVctL+lPNd
	 O9dluYcLPRFdvrxhE3KzV5NF6HGV5hfxIJ4sLdrVLFilMCZO/998BWEx3NjBxIsskt
	 Nabg8ZRT6gWrwTKftkfl7fmoeIfqJngphq8ifdgvWpuNbic4eypRAhGpPTjcqvHicr
	 8uKIkRWJg7YKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:58:58 +0000
Message-Id: <20260709135859.0F9D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Firmware generation detection fails for split `.mdt` firmware file=
s provided via DT override.
- [High] Firmware generation detection aborts on the first occurrence of th=
e marker string, risking false Gen1 classification.
- [Low] MAX_FIRMWARE_NAME_SIZE macro is unused after the patch.

Pre-existing issues:
- [Critical] Lockless traversal of `core->instances` linked list leads to p=
otential Use-After-Free.
- [High] Possible NULL pointer dereference of `core->hfi_sys_ops` in the in=
terrupt handler.
- [High] Concurrent open() allows userspace to issue ioctls to uninitialize=
d or failed firmware.
- [Medium] iris_add_session silently fails if max_session_count is reached,=
 causing ioctl timeouts.
--

--- Patch [1]: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect a=
nd fallback ---
commit 895d948eb718207e479cf98e9811c2b53fd39e23
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add Gen2 firmware autodetect and fallback

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 52bf56e517f91..6dbe18be5b495 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
>  		goto error_unload_fw;
> =20
>  	core->iris_firmware_data->init_hfi_ops(core);

[Severity: High]
This is a pre-existing issue, but can the interrupt handler dereference a N=
ULL
core->hfi_sys_ops here?

Looking at iris_core_init(), iris_vpu_power_on(core) is called earlier, whi=
ch
enables interrupts. However, core->hfi_sys_ops is not populated until this
init_hfi_ops() call. If an interrupt fires during this window,
iris_hfi_isr_handler() will unconditionally dereference core->hfi_sys_ops a=
nd
cause a kernel panic.

[Severity: High]
This is a pre-existing issue, but can a concurrent open() cause userspace to
issue ioctls to uninitialized hardware?

In iris_core_init(), the core state is set to IRIS_CORE_INIT before waiting
for the firmware SYS_INIT_DONE response. The lock is dropped during the wai=
t.
If a second thread concurrently calls iris_open(), it sees
core->state =3D=3D IRIS_CORE_INIT, bypasses the wait, and returns success
immediately. The second thread can then issue V4L2 ioctls while the firmware
is still booting.

> +	iris_session_init_caps(core);
> =20
>  	ret =3D iris_hfi_core_init(core);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..a3aa41aa1e66b 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,138 @@
> =20
>  #define MAX_FIRMWARE_NAME_SIZE	128

[Severity: Low]
Is the MAX_FIRMWARE_NAME_SIZE macro still needed? It appears to be unused
after the removal of the strlen check in this patch.

> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw=
_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=3D<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >=3D 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker =3D "QC_IMAGE_VERSION_STRING=3D";
> +	const size_t mlen =3D strlen(marker);
> +	static const char *vfw =3D "vfw";
> +	const size_t vfwlen =3D strlen(vfw);
> +	static const char *vf =3D "video-firmware.";
> +	const size_t vflen =3D strlen(vf);
> +
> +	for (size_t i =3D 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found =3D data + i + mlen;
> +		size -=3D i + mlen;
> +
> +		/* vfw =3D> Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;

[Severity: High]
Will this prematurely abort the search if the marker string is encountered =
but
the prefix doesn't match?

If a debug or format string matches "QC_IMAGE_VERSION_STRING=3D" earlier in=
 the
binary (e.g., "Error parsing QC_IMAGE_VERSION_STRING=3D%s"), this function
returns false immediately instead of continuing to scan, missing the actual
version string. Should it continue searching instead?

> +
> +		found +=3D vflen;
> +		size -=3D vflen;

[ ... ]

> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name =3D desc->fwname;
> +		if (has_both_gens)
> +			ret =3D firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret =3D request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc =3D core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name =3D desc->fwname;
> +			ret =3D request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		/* firmware-name given: load it and detect its generation. */
> +		ret =3D request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		if (has_both_gens &&
> +		    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware=
->size)) {

[Severity: High]
Does this code fail to detect Gen2 firmware when a standard split .mdt file=
 is
provided via DT override?

If request_firmware() is called on a split .mdt file, it provides only the
ELF headers. Since the actual version string resides in the .bXX data segme=
nts,
scanning the header will miss the version string and falsely assume Gen1.
Subsequently, qcom_mdt_load() will properly load the Gen2 segments into
memory, causing a mismatch between the running firmware and the driver's HFI
operations.

> +			dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +			desc =3D core->iris_platform_data->firmware_desc_gen1;
> +		}
> +	}

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9ba..33edbc5cab8f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
> =20
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"

[Severity: Medium]
This isn't a bug introduced by this patch, but does iris_add_session() sile=
ntly
fail when max_session_count is reached?

When userspace opens more instances than max_session_count, iris_add_sessio=
n()
skips adding the instance but returns void. iris_open() continues as if
successful and provides an FD to userspace. Subsequent ioctls will timeout
because the responses are dropped since the instance is missing from
core->instances.

[Severity: Critical]
This is a pre-existing issue, but is it safe to traverse core->instances
without holding core->lock in iris_check_session_supported()?

iris_check_session_supported() uses list_for_each_entry() to traverse the
core->instances list holding only inst->lock. Concurrently, another thread
executing iris_close() can call iris_remove_session() (which holds
core->lock), remove a different instance from the list via list_del_init(),
and free it. The lockless traversal will then follow a freed pointer,
leading to a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D1
