Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14727080D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337027; cv=none; b=fdMrMIll987OAhKPAwRIzB9iPWYu3aWPz2cyuaPi/7m8FNk07uLOhrP7j+kL2Sp4/rnOdH6kUgaaubAspPEoQprd5/MyYtD+Oxh/YuQwDAmydTeWDnIpqOXxzr3yPtXX5ne7WVV7xyrgfNI6Uzqy5C0RXJ3epS2eQ1tQ8SmWzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337027; c=relaxed/simple;
	bh=p23hFqJGcTgWTa/01dPd7BczwjE5QKaZG9QXGLxgfCU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UIg5MmPXr8t+EBlhHAAIZ2Y1BJx2ZyLM0mVhnGzHCic6DVLlsJQmj590B6ed6IJ8+qwWKX65Tt/uZJvu2aR9Oapav0mbic56TlGUnRpyyEPjPbEoZHzURni13bS0WqMW4DJSzh8FXdFZPAfxvAevGutgKB5VjgbwSaKfEKFuQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRGYhWdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRGYhWdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026D81F000E9;
	Wed, 24 Jun 2026 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782337025;
	bh=njfO+CcedpKBUpX3mc0noAN8nc4i8+GIcMxhC59YJLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dRGYhWddWA2YHDbXAAAZpGuaIg5H4JeJ5TwFehDfEQDazU3+RpIgfhFDOtQcGbuRb
	 7y2fYa4hLYspEL5e+tb8WsEdlOrbO5quORA5BN1qVnZN1N74xktYMY8zdpV+h0RzJu
	 rBcFOqKFcPS0Vs0Y+t6V6NBGCYCgpJGuaBB+B7KT4dhrXonKkz3vFieaS2eab9OtDQ
	 mz0G5/Hhk+BonNLZLSTs6umAMD9Q/FJeOXeRULGrdJ9kLu51LrQd/Pl+d1MtjV/PXH
	 VVmivisYjjv0dFItiG5ZWuvULtdKb5S0kbEVvRXKrYIIDpQxZ75adPfb0+eiO+uF83
	 PtTtAiGVa6OxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] edac: xilinx: Add EDAC support for Versal XilSem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rama devi Veggalam" <rama.devi.veggalam@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:37:04 +0000
Message-Id: <20260624213705.026D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Passing a 64-bit `dma_addr_t` to a 32-bit firmware API paramet=
er truncates the physical address, causing memory corruption.
- [High] Missing 'semrtca' resource breaks driver probe for older Device Tr=
ees.
- [High] The sysfs `store` functions use the virtual EDAC device for DMA al=
locations instead of the platform device.
- [High] Error paths introduced in `mc_probe` fail to unregister the `VERSA=
L_EVENT_ERROR_PMC_ERR1` PM notifier, causing a Use-After-Free.
- [High] The error event handler uses an `if - else if` chain for bitmask e=
valuation, silently dropping uncorrectable errors.
- [Medium] Hexadecimal prefixes mistakenly used for decimal bit-shift macro=
s cause undefined behavior and break CRAM frame decoding.
- [Medium] The `xsem_total_cframes_ssit_show` function mutates the driver's=
 cached CRAM frames state in-place, corrupting data on subsequent reads.
- [Medium] Sysfs `store` functions unconditionally truncate the last charac=
ter of user input if it is not newline-terminated.
- [Medium] XilSEM fabric and interconnect errors are incorrectly attributed=
 to DDR memory DIMM 0.
- [Medium] Failure to handle an unrecognized `family_code` causes the drive=
r to register an event with uninitialized parameters.
- [Medium] Lack of synchronization in sysfs callbacks causes data races on =
shared buffers.
- [Medium] The `xsem_err_callback` event handler performs unprotected read-=
modify-write operations on shared error counters.
- [Low] Copy-paste error in `xsem_scan_control_show` format string causes i=
ncorrect output.
--

commit 3ba94d35140e37f0feb1403bd80442cef2ad8ed1
Author: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Subject: edac: xilinx: Add EDAC support for Versal XilSem

This patch adds support for Xilinx Versal Soft Error Mitigation (XilSEM)
to handle and optionally correct soft errors in Configuration Memory.
It also introduces sysfs interfaces for XilSEM scan operations, error
injection, and configuration reads.

> diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> index 5a43b5d43ca28..024ddd90f6996 100644
> --- a/drivers/edac/versal_edac.c
> +++ b/drivers/edac/versal_edac.c
[ ... ]
> @@ -11,12 +11,88 @@
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/sizes.h>
> +#include <linux/io.h>
>  #include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/firmware/xlnx-versal-error-events.h>
>  #include <linux/firmware/xlnx-event-manager.h>
> =20
>  #include "edac_module.h"
> =20
> +/* XilSem CE Error log count */
> +#define XILSEM_MAX_CE_LOG_CNT	7
> +
> +/** Maximum CRAM error register count */
> +#define MAX_CRAMERR_REG_CNT		14
> +/** Maximum NPI slave skip count */
> +#define MAX_NPI_SLV_SKIP_CNT	8
> +/** Maximum NPI Error info count */
> +#define MAX_NPI_ERR_INFO_CNT	2
> +
> +/* Maximum SLR count */
> +#define MAX_SLR_ID	3
> +
> +/** Maximum number of cframe types  */
> +#define CFRAME_MAX_TYPE	7
> +
> +/** Mask for getting Type_0, Type_4 frames */
> +#define CFRAME_TYPE_0_4_MASK	GENMASK(19, 0)
> +
> +/** Low mask, High mask for getting Type_1, Type_5 frames */
> +#define CFRAME_TYPE_1_5_MASK_L	GENMASK(39, 20)
> +#define CFRAME_TYPE_1_5_MASK_H	GENMASK(7, 0)
> +
> +/** Shift for getting Type_1, Type_5 frames */
> +#define CFRAME_TYPE_1_5_SHIFT_R		0x20
> +#define CFRAME_TYPE_1_5_SHIFT_L		0x12
> +
> +/** Mask for getting Type_2, Type_6 frames */
> +#define CFRAME_TYPE_2_6_MASK	GENMASK(27, 8)
> +
> +/** Shift for getting Type_2, Type_6 frames */
> +#define CFRAME_TYPE_2_6_SHIFT_R		0x8
> +
> +/** Low mask, high mask for getting Type_3 frames */
> +#define CFRAME_TYPE_3_MASK_L		GENMASK(31, 28)
> +#define CFRAME_TYPE_3_MASK_H		GENMASK(15, 0)
> +
> +/** Shift for getting Type_3 */
> +#define CFRAME_TYPE_3_SHIFT_R	0x28

[Severity: Medium]
Are these macro definitions incorrectly using a hex prefix for decimal shift
values? Shifting a 32-bit value by 0x20 (32) or 0x28 (40) bits will invoke
undefined behavior.

> +#define CFRAME_TYPE_3_SHIFT_L	0x4
[ ... ]
> +static ssize_t xsem_scan_control_show(struct device *dev,
> +				      struct device_attribute *mattr,
> +				      char *data)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	struct edac_priv *priv =3D mci->pvt_info;
> +
> +	if (!priv->xsem_rtca)
> +		return -EINVAL;
> +
> +	return sprintf(data, "[0x%x][0x%x][0x%x][0x%x][0x%x][0x%x][0x%x]\n\r",
> +			priv->xsem_rtca->scan_ctrl_status[0],
> +			priv->xsem_rtca->scan_ctrl_status[0],

[Severity: Low]
Is there a typo here where scan_ctrl_status[0] is printed twice, causing the
output to miss the last element of the array?

> +			priv->xsem_rtca->scan_ctrl_status[1],
> +			priv->xsem_rtca->scan_ctrl_status[2],
> +			priv->xsem_rtca->scan_ctrl_status[3],
> +			priv->xsem_rtca->scan_ctrl_status[4],
> +			priv->xsem_rtca->scan_ctrl_status[5]);
> +}
> +
> +/**
> + * xsem_scan_control_store - Set scan control operation
[ ... ]
> +static ssize_t xsem_scan_control_store(struct device *dev,
> +				       struct device_attribute *mattr,
> +				       const char *data, size_t count)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	struct edac_priv *priv =3D mci->pvt_info;
> +	char *kern_buff, *inbuf, *tok;
> +	u32 cmd;
> +	u32 slrid;
> +	int ret;
> +
> +	if (!priv->xsem_rtca)
> +		return -EINVAL;
> +
> +	kern_buff =3D kzalloc(count, GFP_KERNEL);
> +	if (!kern_buff)
> +		return -ENOMEM;
> +	strscpy(kern_buff, data, count);

[Severity: Medium]
Does this silently truncate the last character of the user input if it is n=
ot
newline-terminated? When count matches the string length exactly, strscpy()
copies at most count - 1 bytes and inserts a null terminator.

> +
> +	inbuf =3D kern_buff;
[ ... ]
> +static ssize_t xsem_total_cframes_ssit_show(struct device *dev,
> +					    struct device_attribute *mattr,
> +					    char *data)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	struct edac_priv *priv =3D mci->pvt_info;
> +	u32 temp_buf[CFRAME_MAX_TYPE] =3D {0};
> +	u32 id;
> +	int offset =3D 0;
> +
> +	if (!priv->xsem_rtca)
> +		return -EINVAL;
> +
> +	for (id =3D 0; id < CFRAME_MAX_TYPE; id++)
> +		temp_buf[id] =3D priv->xsem_rtca->cram_total_frames[id];
> +
> +	priv->xsem_rtca->cram_total_frames[0]  =3D (temp_buf[0] & CFRAME_TYPE_0=
_4_MASK);
> +	priv->xsem_rtca->cram_total_frames[1]  =3D (temp_buf[0] &
> +					CFRAME_TYPE_1_5_MASK_L) >> CFRAME_TYPE_1_5_SHIFT_R;

[Severity: Medium]
Does this modify the shared cram_total_frames array in-place during a read
operation? Subsequent reads might apply the bitwise shifts to already-shift=
ed
data, returning garbled output.

> +	priv->xsem_rtca->cram_total_frames[1] |=3D (temp_buf[1] &
[ ... ]
> +static ssize_t xsem_total_cframes_ssit_store(struct device *dev,
> +					     struct device_attribute *mattr,
> +					     const char *data, size_t count)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	struct edac_priv *priv =3D mci->pvt_info;
> +	char *kern_buff, *inbuf, *tok, *kbuf1;
> +	dma_addr_t dma_addr =3D 0;
> +	u32 row, slrid, dma_size;
> +	int ret;
[ ... ]
> +	dma_size =3D sizeof(priv->xsem_rtca->cram_total_frames);
> +	kbuf1 =3D dma_alloc_coherent(dev, dma_size, &dma_addr, GFP_KERNEL);

[Severity: High]
Are we passing the virtual EDAC device pointer instead of the platform devi=
ce
here? Sysfs store callbacks for this attribute receive &mci->dev, which lac=
ks
DMA configuration and could cause allocation failures.

> +	if (!kbuf1) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	ret =3D zynqmp_pm_xilsem_cram_ssit_totframes(slrid, row, dma_addr,
> +						   priv->xsem_rtca->cram_get_frames_status);

[Severity: Critical]
Can this truncate the physical address and cause memory corruption? On ARM6=
4,
dma_addr_t is 64-bit, but the firmware API parameters are 32-bit.

> +	if (ret) {
> +		edac_printk(KERN_ERR, EDAC_MC, "ERROR: XilSEM Status PM API failed\n");
> +		dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
> +		goto err;
> +	}
> +
> +	memcpy(priv->xsem_rtca->cram_total_frames, kbuf1, dma_size);

[Severity: Medium]
Can concurrent sysfs store operations corrupt this shared buffer due to a l=
ack
of locking?

> +	dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
[ ... ]
> +static ssize_t xsem_read_ssit_status_store(struct device *dev,
> +					   struct device_attribute *mattr,
> +					   const char *data, size_t count)
> +{
> +	struct mem_ctl_info *mci =3D to_mci(dev);
> +	struct edac_priv *priv =3D mci->pvt_info;
> +	char *kern_buff, *inbuf, *tok, *kbuf1;
> +	size_t dma_size;
> +	dma_addr_t dma_addr =3D 0;
> +	u32 slrid;
> +	int ret;
[ ... ]
> +	dma_size  =3D sizeof(struct xsem_ssit_status);
> +
> +	kbuf1 =3D dma_alloc_coherent(dev, dma_size, &dma_addr, GFP_KERNEL);

[Severity: High]
Does passing the virtual EDAC device pointer (which lacks DMA configuration)
instead of the platform device cause DMA allocation failures?

> +	if (!kbuf1) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	ret =3D zynqmp_pm_xilsem_read_ssit_status(slrid, dma_addr,
> +						priv->xsem_rtca->xilsem_ssit_status);

[Severity: Critical]
Could passing the 64-bit dma_addr to this 32-bit firmware API parameter res=
ult
in physical address truncation and subsequent memory corruption?

> +	if (ret) {
> +		edac_printk(KERN_ERR, EDAC_MC, "ERROR: XilSEM Status PM API failed\n");
> +		dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
> +		goto err;
> +	}
> +
> +	memcpy(priv->xsem_rtca->slr_info, kbuf1, dma_size);

[Severity: Medium]
Can concurrent executions of this sysfs store operation result in data race=
s on
this shared slr_info buffer?

> +
> +	dma_free_coherent(dev, dma_size, kbuf1, dma_addr);
[ ... ]
> +static void xsem_geterror_info(struct mem_ctl_info *mci, struct xsem_err=
or_status *p,
> +			       int mask)
> +{
> +	struct edac_priv *priv =3D mci->pvt_info;
> +	u32 error_word_0, error_word_1, ce_count;
> +	u8 index;
> +
> +	if (!priv->xsem_rtca || !priv->sem_baseaddr)
> +		return;
> +
> +	if (mask & priv->xsem_rtca->cram_ce_mask) {
> +		p->ce_cnt++;
[ ... ]
> +		/* Read CRAM status */
> +		p->ceinfo.status =3D readl(priv->sem_baseaddr + CRAM_STS_INFO_OFFSET);
> +	} else if (mask & priv->xsem_rtca->cram_ue_mask) {

[Severity: High]
Does this if-else chain cause uncorrectable errors to be silently ignored if
the payload mask contains both a correctable and uncorrectable error?

> +		p->ue_cnt++;
> +		p->ueinfo.data0 =3D 0;
> +		p->ueinfo.data1 =3D 0;
> +		p->ueinfo.status =3D readl(priv->sem_baseaddr + CRAM_STS_INFO_OFFSET);
> +	} else if (mask & priv->xsem_rtca->npi_ue_mask) {
> +		p->ue_cnt++;
> +		p->ueinfo.data0 =3D readl(priv->sem_baseaddr + NPI_ERR0_INFO_OFFSET);
> +		p->ueinfo.data1 =3D readl(priv->sem_baseaddr + NPI_ERR1_INFO_OFFSET);
> +		p->ueinfo.status =3D readl(priv->sem_baseaddr);
> +	} else {
> +		edac_printk(KERN_ERR, EDAC_MC, "Invalid Event received %d\n", mask);
> +	}
> +}
> +
> +/**
> + * xsem_handle_error - Handle XilSem error types CE and UE
> + * @mci:	Pointer to the memory controller instance
> + * @p:		Pointer to the xilsem error status structure
> + *
> + * Handles the correctable and uncorrectable error.
> + */
> +static void xsem_handle_error(struct mem_ctl_info *mci, struct xsem_erro=
r_status *p)
> +{
> +	struct xsem_ecc_error_info *pinf;
> +	char message[XDDR_EDAC_MSG_SIZE];
> +
> +	if (p->ce_cnt) {
> +		pinf =3D &p->ceinfo;
> +		snprintf(message, XDDR_EDAC_MSG_SIZE,
> +			 "\n\rXILSEM CRAM error type :%s\n\r"
> +			 "\nFrame_Addr: [0x%X]\t Row_num: [0x%X]\t Bit_loc: [0x%X]\t Qword: [=
0x%X]\n\r",
> +			 "CE", pinf->frame_addr, pinf->row_id,
> +			 pinf->bit_loc, pinf->qword);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> +				     p->ce_cnt, 0, 0, 0, 0, 0, -1,
> +				     message, "");

[Severity: Medium]
Are these fabric and interconnect errors being incorrectly attributed to the
first DDR memory module? Passing top_layer=3D0 and mid_layer=3D0 explicitly=
 maps
them to csrow 0, channel 0.

> +	}
> +
> +	if (p->ue_cnt) {
> +		pinf =3D &p->ueinfo;
> +		snprintf(message, XDDR_EDAC_MSG_SIZE,
> +			 "\n\rXILSEM error type :%s\n\r"
> +			 "status: [0x%X]\n\rError_Info0: [0x%X]\n\r"
> +			 "Error_Info1: [0x%X]",
> +			 "UE", pinf->status, pinf->data0, pinf->data1);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> +				     p->ue_cnt, 0, 0, 0, 0, 0, -1,
> +				     message, "");

[Severity: Medium]
Does mapping uncorrectable XilSEM errors to top_layer=3D0 incorrectly attri=
bute
them to the first DDR memory DIMM?

> +	}
> +}
> +
> +/**
> + * xsem_err_callback - Handle Correctable and Uncorrectable errors.
> + * @payload:	payload data.
> + * @data:	controller data.
> + *
> + * Handles ECC correctable and uncorrectable errors.
> + */
> +static void xsem_err_callback(const u32 *payload, void *data)
> +{
> +	struct xsem_error_status stat;
> +	struct edac_priv *priv;
> +	struct mem_ctl_info *mci =3D (struct mem_ctl_info *)data;
> +	int event;
> +
> +	priv =3D mci->pvt_info;
> +	if (!priv->xsem_rtca)
> +		return;
> +
> +	memset(&stat, 0, sizeof(stat));
> +	/* Read payload to get the event type */
> +	event =3D payload[2];
> +	edac_printk(KERN_INFO, EDAC_MC, "Event received %x\n", event);
> +	xsem_geterror_info(mci, &stat, event);
> +
> +	priv->xsem_rtca->cram_ce_cnt +=3D stat.ce_cnt;
> +	priv->xsem_rtca->cram_ue_cnt +=3D stat.ue_cnt;

[Severity: Medium]
Could these read-modify-write operations on shared counters lose increments=
 if
the hardware event callback is executed concurrently on multiple CPUs?

> +	xsem_handle_error(mci, &stat);
> +}
[ ... ]
> @@ -1094,6 +2365,10 @@ static int mc_probe(struct platform_device *pdev)
>  	if (!get_ecc_state(ddrmc_baseaddr))
>  		return -ENXIO;
> =20
> +	sem_baseaddr =3D devm_platform_ioremap_resource_byname(pdev, "semrtca");
> +	if (IS_ERR(sem_baseaddr))
> +		return PTR_ERR(sem_baseaddr);

[Severity: High]
Does this make the "semrtca" resource mandatory, breaking the driver probe =
for
older device trees that do not define it?

> +
>  	/* Allocate ID number for the EMIF controller */
>  	edac_mc_id =3D emif_get_id(pdev->dev.of_node);
> =20
[ ... ]
> +	rc =3D zynqmp_pm_get_family_info(&family_code);
> +	if (rc) {
> +		if (rc =3D=3D -ENODEV)
> +			rc =3D -EPROBE_DEFER;
> +
> +		goto del_mc;
> +	}
> +	if (family_code =3D=3D PM_VERSAL_FAMILY_CODE) {
> +		priv->xsem_rtca->sw_event_node_id =3D VERSAL_EVENT_ERROR_SW_ERR;
> +		priv->xsem_rtca->cram_ce_mask =3D XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRA=
M_CE_5;
> +		priv->xsem_rtca->cram_ue_mask =3D XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRA=
M_UE_6;
> +		priv->xsem_rtca->npi_ue_mask =3D XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_=
UE_7;
> +	} else {
> +		edac_printk(KERN_ERR, EDAC_MC, "Invalid Device family code %d\n", fami=
ly_code);
> +	}
> +
> +	rc =3D xlnx_register_event(PM_NOTIFY_CB, priv->xsem_rtca->sw_event_node=
_id,

[Severity: Medium]
Does this execution path fall through when the family code is unrecognized,
causing the driver to register an event using uninitialized parameters (zer=
os)?

> +				 priv->xsem_rtca->cram_ce_mask | priv->xsem_rtca->cram_ue_mask |
> +				 priv->xsem_rtca->npi_ue_mask,
> +				 false, xsem_err_callback, mci);
> +	if (rc)
> +		goto del_mc;
> +
>  #ifdef CONFIG_EDAC_DEBUG
>  	create_debugfs_attributes(mci);
>  	setup_address_map(priv);
> @@ -1154,6 +2484,8 @@ static int mc_probe(struct platform_device *pdev)
>  	enable_intr(priv);
>  	return rc;
> =20
> +remove_sysfs:
> +	xsem_edac_remove_sysfs_attributes(mci);
>  del_mc:
>  	edac_mc_del_mc(&pdev->dev);
>  free_edac_mc:
> @@ -1173,9 +2505,21 @@ static void mc_remove(struct platform_device *pdev)

[Severity: High]
Does this error path fail to unregister the VERSAL_EVENT_ERROR_PMC_ERR1 eve=
nt
that was registered earlier in the function? If the event triggers after mc=
i is
freed, could it cause a use-after-free in the callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624212545.2850=
787-1-rama.devi.veggalam@amd.com?part=3D4
