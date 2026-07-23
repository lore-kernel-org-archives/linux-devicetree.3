Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE793471D12
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812800; cv=none; b=qf9H4Jd0Nqs6SYNIENURkS6Q1VrFSzGo4AOtIAlvBtNTYRibivr4qGngqF33i3o90Wy2TsXoygjmr/IXKkpoFeYapQju1FyjQ5+Qy9EEV5m5X26SPqKiSMry/ddLcEqBWAj9TUCbSEMBydNG6eeiQKq9dN0h+yMBfMxQ6D1ObQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812800; c=relaxed/simple;
	bh=c6BQxCFjsbcyHgTSiBOKL/g4m9upcQ8kyR//1iOkoEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHyBTBFv5xdPGekPC7OhMeW3AZbAP3N+1u6rH3n4Hhx9xmGQ/M48FOGmorhHsN7HLTvCA0l3Nh0cXF/YUpafTEp+qeP0TNJQ1boyJIwKXQhhgaXs0EMCHi9IPJ8EithofYi9DWPNX/eetwiYG9D89wIut0+oqyUNxoQQYEetbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5egJPdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xdx7ujf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5egJPdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xdx7ujf0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvTgL1030638
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3dE9OzZ/rzwt8j6nLkCuqlHSB3qGh9C6eEaVZkiINU=; b=X5egJPdDsr3myCJN
	dOs1xHNHmg3reShYHxk/JtbUMh2+5p4eSgCXBtUAVN6mzQK3A25AillVHriYQ++J
	U4RPeO9TpEKRfoaz0sstYQ8IH26gPH67D8JbM8aTemZeuL+LtGHY6YUoiACGWci1
	Dyfw+c5/KV1S3bzR5Vh5jtg6bmrCm7HoP6K2CM/a8mR1lZtsMBXib8Tit5RF2IIN
	pKl00CQiNqcaF/tl/yH2tYeKc5XcvZ4PbGFw93NpQAmFjxc36mM434TIr8xHZXQR
	FpXBxPDTmCSj5z+4evoCnc4OFf4dW91P7mnVGbsZGC6y1aQhMuOoTtqBiiVjwDSV
	CMcUGQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv8jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:19:50 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e7624e584dso925811a34.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784812789; x=1785417589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3dE9OzZ/rzwt8j6nLkCuqlHSB3qGh9C6eEaVZkiINU=;
        b=Xdx7ujf0PoV/Jycg/4eGvj6NfnFs5ENZuXzT2DV5vgzGraC5h/DqphTxnWQbKVnmMA
         XKJ5VtGGcEk9nxKtpeJ1sHVWp7mj2lTrUB+AEGW7k0mowCULRohCBLL+iob55tXnmKlV
         a4nNiE1EPEu3D5X1boeXbocgy3cNVXUBVdmkJ85LIsb0yVCIJIce31wGB9E4ViFSbQrj
         Tzmwsoa8QkuUbq1DeRTypJs85uzjarX3e1KsGPL3FuU48NCzdR5oDFa5RzP82sHbe0lP
         Eyrr7/4GvajGkNRzOLPs2Bqbri8jfM8YhPSANXx7/1spRhJ9xApAwm5psIymq0MocB8N
         6AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812789; x=1785417589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3dE9OzZ/rzwt8j6nLkCuqlHSB3qGh9C6eEaVZkiINU=;
        b=cmB6pDZ/3SXBbSpKS8PM+z3RdE8IyTprr4YVKvczgN71DmgK5BPLORIL272ty5o7qp
         QhI4+x6Wznd6rlF61ibJz3BgbOLhJlGRrdT1o676bU86Dr5NKlFwf0D0u5HQgCvSkdGR
         21jfHJ9ihqGAvjtkFKmPWqZGUkmw5hUOzbyWjHTN2oTvN28dZUK7cV7/CoO1Sx5+z/jc
         Ezz+6MipvOZdBei17Bt5XI3z8fjfjEHTObzCvdmK6Uj1iz+z5xPaxDsi6Rlbh+vUBVTY
         s4tM0XK0lO6o27YoGfaLO9DLaXw/Ihsk8nxCEri+xQ+m17NMirHcS0hwZ53agtwGTrup
         phfA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8BEyqgStfjWM2t9Lq3z6jsTL1689uH4ss6MgdQA5XZoh3qF0D39EfzW+1fOZ6GDojmoDK1q8XCCAI@vger.kernel.org
X-Gm-Message-State: AOJu0YyMUTekJ8qnDAcxwvjQi9uCgI0Dk+XK7byPIPLIKmeOjScz7gZY
	eXURtcbwE6tp1Jwf0hOam3XjtW1x0wtwKznj7xNgk4kmGci913qp/1e4uFl5i64PkHjQEFp8VeJ
	a7NDnedQy34PYGaievj+a2SF1vV7M/q0yNydCuQLjwTSQb3FZQpWXAORHeSUHca0r
X-Gm-Gg: AR+sD11+bBbpbCZ/1iyR6LF2nvi56MdUAFjQHAj5hAlqdHk0kAadkw5lXJUqMv7w3O1
	7kHq5olQt5tFSFwjkX99VkReSpexdhMTNAms7XotMYFmfvhanV/6v5H2LtMCl0Fm8RkFUWSNP8i
	+McaOtnTSG8MDIp3UX3fMvnFw+meb/SO58cnTdcyZ99X7IRfGvZLx4US4Cn9Pdd6vU1hXCcgcwX
	hY9R0BWqbLQoeHTPl6MOTEKQx6s8iB5Nc86eKqR499FT2mRGYZJ+Z67SxNPWA/3k8nCayakxoWd
	cES8uZcHwMqZdzP/twC6P50Nq2T8PhIUWU3ziX8fTX3poqVSeSN5GCplTfkuj23PabDV6LYAlxv
	LONsoXF+bXXtHWgYbw2wd28HOblmB0BO9zHExhO3dgTo4fXMosO4=
X-Received: by 2002:a05:6820:4588:b0:6aa:dd97:235e with SMTP id 006d021491bc7-6aadd972e42mr408778eaf.7.1784812789430;
        Thu, 23 Jul 2026 06:19:49 -0700 (PDT)
X-Received: by 2002:a05:6820:4588:b0:6aa:dd97:235e with SMTP id 006d021491bc7-6aadd972e42mr408756eaf.7.1784812788812;
        Thu, 23 Jul 2026 06:19:48 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.203.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db0d23sm3366767a34.1.2026.07.23.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:19:48 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:19:40 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <jv3decgeak2scdtatu3wfqlkiyccm25q7e5l3oe6zfttbs7oym@gxerpqb2ldqw>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Q5m9BJ8d9YXzvti2Ifv2lBNteY0Znyyi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMSBTYWx0ZWRfX+yi8jfzJJmMR
 2vgapqGxaEYmW5wC489Fqend1NW68qZjXif4pAtY4te5ZwXNDPJKkGNKI+6daohG3OzEh03F+A2
 dT8cRSOXMftaCoL9bT0A3/XxSlUjq7M=
X-Proofpoint-GUID: Q5m9BJ8d9YXzvti2Ifv2lBNteY0Znyyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMSBTYWx0ZWRfX5baSF7eUQxB1
 QoXRJ2WxEfvyGtoW7yDI6/uP0rP836NBr70yPDKNJkqAyvvgmLc10trWSS9Ig6wahuSQPIBmrpm
 IdNwIWtXxR1e7D7JjCXhWNpUz1tAxxr3ieaS9am+e4uP+rQI3QG81/r3XztrgmSpN4nzM70qH4T
 871ckqLSihg8CXFTxWN4TwKeVV8pdztARUaZToSMu96cjTwraUKVyi7a2t+B/v4I8ngx+KTuJW3
 6gIJoyIgt1H5i6zA+G3i0AW1jnTJoMOibOg2gDF+UFXd/i2GiN3lLSkHqU7fONVTrP8l/rc+qQ7
 ZPONPIKryuGzB7WMwyFnvUCUJT1bBzUjzn4y+syVFhUxiSrR33/0npzeEavJJRX7VkjUyKB2RCn
 +JoHuwYGnPUe6h5LFE+ae7VugYMULw9eDirEk+uu40QLoqXcwxc1tUwEK+L/GQ+Hi7MOdAztJHQ
 DPdRmSixEHHrz9C6Q6w==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a6214f6 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=vzTbXj32ivxf3WCeigViBw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NxaR96XOF_E5us54xYEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230131

On Wed, Jul 22, 2026 at 07:30:19PM -0700, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> x8 or x4+x4) selected via a TCSR register. The existing single-instance
> QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> DT node and instantiates exactly one PHY.
> 
> Add a dedicated driver for this class of PHY. Match data carries a
> per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> required by that link mode, registering the clock and #phy-cells = <1> phy
> providers so consumers can address individual sub-PHYs by index.
> 
> The driver inherits the phy setting and link-mode programmed by firmware,
> so only the no_csr reset is used and no phy setting tables are provided.
> 
> Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> operate as a single x8 link.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Some nits below. But overall, the driver looks good to me:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
>  drivers/phy/qualcomm/Kconfig                      |  11 +
>  drivers/phy/qualcomm/Makefile                     |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 770 ++++++++++++++++++++++
>  3 files changed, 782 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa..31241d1bbef2 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -77,6 +77,17 @@ config PHY_QCOM_QMP_PCIE
>  	  Enable this to support the QMP PCIe PHY transceiver that is used
>  	  with PCIe controllers on Qualcomm chips.
>  
> +config PHY_QCOM_QMP_PCIE_MULTIPHY
> +	tristate "Qualcomm QMP PCIe Multiple Link-mode PHY Driver"

s/"Multiple Link-mode PHY"/"Multi PHY"? link-mode is just a TCSR register name.

> +	depends on PCI || COMPILE_TEST
> +	select GENERIC_PHY
> +	default PHY_QCOM_QMP
> +	help
> +	  Enable this to support the QMP PCIe PHY transceiver that is used
> +	  with PCIe controllers on Qualcomm chips. This PHY is a single
> +	  multi-lane QMP block that can be configured either as one wide
> +	  link or as multiple narrower independent links (bifurcation).
> +
>  config PHY_QCOM_QMP_PCIE_8996
>  	tristate "Qualcomm QMP PCIe 8996 PHY Driver"
>  	depends on PCI || COMPILE_TEST
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index b71a6a0bed3f..8bf887d58ee4 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
>  obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
> +obj-$(CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY)	+= phy-qcom-qmp-pcie-multiphy.o
>  obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
>  obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
>  obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 000000000000..4531570b6fb1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> @@ -0,0 +1,770 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "phy-qcom-qmp.h"
> +
> +#define PHY_INIT_COMPLETE_TIMEOUT		10000

s/PHY_INIT_COMPLETE_TIMEOUT/PHY_INIT_COMPLETE_TIMEOUT_US

> +
> +enum qmp_pcie_glymur_link_mode {
> +	QMP_PCIE_GLYMUR_MODE_X8,
> +	QMP_PCIE_GLYMUR_MODE_X4X4,
> +};
> +
> +enum qphy_reg_layout {
> +	QPHY_PCS_STATUS,
> +	QPHY_LAYOUT_SIZE
> +};
> +
> +static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
> +};
> +
> +struct qmp_pcie_offsets {
> +	u16 pcs;
> +};
> +
> +struct qmp_phy_cfg {
> +	const struct qmp_pcie_offsets *offsets;
> +
> +	const char * const *reg_names;
> +	int num_regs;
> +
> +	const char * const *pd_names;
> +	int num_pds;
> +
> +	const char * const *nocsr_reset_list;
> +	int num_nocsr_resets;
> +
> +	const char * const *vreg_list;
> +	int num_vregs;
> +
> +	const unsigned int *regs;
> +
> +	unsigned int phy_status;
> +
> +	const char * const *clk_list;
> +	int num_clks;
> +	const char * const *pipe_clk_list;
> +
> +	int num_pipe_clks;

Remove newlines between the members, here and below.

> +};
> +
> +struct qmp_pcie {
> +	struct device *dev;
> +
> +	const struct qmp_phy_cfg *cfg;
> +
> +	void __iomem **base;
> +
> +	struct clk_bulk_data *clks;
> +	struct clk_bulk_data *pipe_clks;
> +
> +	struct reset_control_bulk_data *nocsr_resets;
> +
> +	struct regulator_bulk_data *vregs;
> +
> +	struct device **pd_devs;
> +
> +	struct clk_fixed_rate pipe_clk_fixed;
> +};
> +
> +struct qmp_pcie_multiphy {
> +	struct phy **phys;
> +	const struct qmp_pcie_link_mode_cfg *mode_cfg;
> +
> +	int num_pipe_outputs;
> +	struct clk_fixed_rate *pipe_out_clks;
> +};
> +
> +struct qmp_pcie_link_mode_cfg {
> +	const struct qmp_phy_cfg * const *cfgs;
> +	u32 num_phys;
> +};
> +
> +struct qmp_pcie_match_data {
> +	const struct qmp_pcie_link_mode_cfg *mode_cfgs;
> +	u32 num_modes;
> +};
> +
> +static const char * const glymur_pciephy_clk_l[] = {
> +	"aux", "cfg_ahb", "ref", "rchng", "phy_b_aux",
> +};
> +
> +static const char * const glymur_pciephy_a_clk_l[] = {
> +	"aux", "cfg_ahb", "ref", "rchng",
> +};
> +
> +static const char * const glymur_pciephy_b_clk_l[] = {
> +	"phy_b_aux", "cfg_ahb_b", "ref", "rchng_b",
> +};
> +
> +static const char * const glymur_pciephy_pipeclk_l[] = {
> +	"pipe",
> +};
> +
> +static const char * const glymur_pipephy_b_pipeclk_l[] = {
> +	"pipe_b", "pipediv2_b",
> +};
> +
> +static const char * const glymur_vreg_l[] = {
> +	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
> +};
> +
> +static const char * const glymur_pciephy_a_reg_l[] = {
> +	"port_a",
> +};
> +
> +static const char * const glymur_pciephy_b_reg_l[] = {
> +	"port_b",
> +};
> +
> +static const char * const glymur_pciephy_reg_l[] = {
> +	"port_a", "port_b",
> +};
> +
> +static const char * const glymur_pciephy_a_pd_l[] = {
> +	"port_a",
> +};
> +
> +static const char * const glymur_pciephy_b_pd_l[] = {
> +	"port_b",
> +};
> +
> +static const char * const glymur_pciephy_pd_l[] = {
> +	"port_a", "port_b",
> +};
> +
> +static const char * const glymur_pciephy_a_nocsr_reset_l[] = {
> +	"port_a_nocsr",
> +};
> +
> +static const char * const glymur_pciephy_nocsr_reset_l[] = {
> +	"port_a_nocsr", "port_b_nocsr",
> +};
> +
> +static const char * const glymur_pciephy_b_nocsr_reset_l[] = {
> +	"port_b_nocsr",
> +};
> +
> +static const struct qmp_pcie_offsets glymur_pcie_offsets_v8_50 = {
> +	.pcs		= 0x9000,
> +};
> +
> +static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_a_cfg = {
> +	.offsets		= &glymur_pcie_offsets_v8_50,
> +	.reg_names		= glymur_pciephy_a_reg_l,
> +	.num_regs		= ARRAY_SIZE(glymur_pciephy_a_reg_l),
> +	.pd_names		= glymur_pciephy_a_pd_l,
> +	.num_pds		= ARRAY_SIZE(glymur_pciephy_a_pd_l),
> +	.nocsr_reset_list	= glymur_pciephy_a_nocsr_reset_l,
> +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_a_nocsr_reset_l),
> +	.vreg_list		= glymur_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
> +	.regs			= pciephy_v8_50_regs_layout,
> +	.phy_status		= PHYSTATUS_4_20,
> +	.pipe_clk_list		= glymur_pciephy_pipeclk_l,
> +	.num_pipe_clks		= ARRAY_SIZE(glymur_pciephy_pipeclk_l),
> +	.clk_list		= glymur_pciephy_a_clk_l,
> +	.num_clks		= ARRAY_SIZE(glymur_pciephy_a_clk_l),
> +};
> +
> +static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_b_cfg = {
> +	.offsets		= &glymur_pcie_offsets_v8_50,
> +	.reg_names		= glymur_pciephy_b_reg_l,
> +	.num_regs		= ARRAY_SIZE(glymur_pciephy_b_reg_l),
> +	.pd_names		= glymur_pciephy_b_pd_l,
> +	.num_pds		= ARRAY_SIZE(glymur_pciephy_b_pd_l),
> +	.nocsr_reset_list	= glymur_pciephy_b_nocsr_reset_l,
> +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_b_nocsr_reset_l),
> +	.vreg_list		= glymur_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
> +	.regs			= pciephy_v8_50_regs_layout,
> +	.phy_status		= PHYSTATUS_4_20,
> +	.pipe_clk_list		= glymur_pipephy_b_pipeclk_l,
> +	.num_pipe_clks		= ARRAY_SIZE(glymur_pipephy_b_pipeclk_l),
> +	.clk_list		= glymur_pciephy_b_clk_l,
> +	.num_clks		= ARRAY_SIZE(glymur_pciephy_b_clk_l),
> +};
> +
> +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> +	.offsets		= &glymur_pcie_offsets_v8_50,
> +	.reg_names		= glymur_pciephy_reg_l,
> +	.num_regs		= ARRAY_SIZE(glymur_pciephy_reg_l),
> +	.pd_names		= glymur_pciephy_pd_l,
> +	.num_pds		= ARRAY_SIZE(glymur_pciephy_pd_l),
> +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> +	.vreg_list		= glymur_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
> +	.regs			= pciephy_v8_50_regs_layout,
> +	.phy_status		= PHYSTATUS_4_20,
> +	.pipe_clk_list		= glymur_pciephy_pipeclk_l,
> +	.num_pipe_clks		= ARRAY_SIZE(glymur_pciephy_pipeclk_l),
> +	.clk_list		= glymur_pciephy_clk_l,
> +	.num_clks		= ARRAY_SIZE(glymur_pciephy_clk_l),
> +};
> +
> +static const struct qmp_phy_cfg * const glymur_qmp_gen5x8_mode_x8_cfgs[] = {
> +	&glymur_qmp_gen5x8_pciephy_cfg,
> +};
> +
> +static const struct qmp_phy_cfg * const glymur_qmp_gen5x8_mode_x4x4_cfgs[] = {
> +	&glymur_qmp_gen5x4_pciephy_a_cfg,
> +	&glymur_qmp_gen5x4_pciephy_b_cfg,
> +};
> +
> +static const struct qmp_pcie_link_mode_cfg glymur_qmp_gen5x8_mode_cfgs[] = {
> +	[QMP_PCIE_GLYMUR_MODE_X8] = {
> +		.cfgs		= glymur_qmp_gen5x8_mode_x8_cfgs,
> +		.num_phys	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_x8_cfgs),
> +	},
> +	[QMP_PCIE_GLYMUR_MODE_X4X4] = {
> +		.cfgs		= glymur_qmp_gen5x8_mode_x4x4_cfgs,
> +		.num_phys	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_x4x4_cfgs),
> +	},
> +};
> +
> +static const struct qmp_pcie_match_data glymur_qmp_gen5x8_match_data = {
> +	.mode_cfgs	= glymur_qmp_gen5x8_mode_cfgs,
> +	.num_modes	= ARRAY_SIZE(glymur_qmp_gen5x8_mode_cfgs),
> +};
> +
> +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int i, ret;
> +
> +	for (i = 0; i < cfg->num_pds; i++) {
> +		ret = pm_runtime_resume_and_get(qmp->pd_devs[i]);
> +		if (ret < 0) {
> +			dev_err(qmp->dev, "failed to power on %s domain\n",
> +				cfg->pd_names[i]);
> +			goto err_power_off;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	while (--i >= 0)
> +		pm_runtime_put(qmp->pd_devs[i]);
> +
> +	return ret;
> +}
> +
> +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int i;
> +
> +	for (i = cfg->num_pds - 1; i >= 0; i--)
> +		pm_runtime_put(qmp->pd_devs[i]);
> +}
> +
> +static int qmp_pcie_init(struct phy *phy)
> +{
> +	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int ret;
> +
> +	ret = qmp_pcie_pd_power_on(qmp);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> +	if (ret) {
> +		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);

Drop 'err=':

	"failed to enable regulators: %d\n"

> +		goto err_pd_power_off;
> +	}
> +
> +	ret = reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
> +	if (ret) {
> +		dev_err(qmp->dev, "no-csr reset assert failed\n");

Print errno in all error prints.

> +		goto err_disable_regulators;
> +	}
> +
> +	usleep_range(200, 300);
> +
> +	ret = clk_bulk_prepare_enable(qmp->cfg->num_clks, qmp->clks);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +err_pd_power_off:
> +	qmp_pcie_pd_power_off(qmp);
> +
> +	return ret;
> +}
> +
> +static int qmp_pcie_exit(struct phy *phy)
> +{
> +	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +
> +	reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
> +
> +	clk_bulk_disable_unprepare(qmp->cfg->num_clks, qmp->clks);
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +	qmp_pcie_pd_power_off(qmp);
> +
> +	return 0;
> +}
> +
> +static int qmp_pcie_power_on(struct phy *phy)
> +{
> +	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	const struct qmp_pcie_offsets *offs = cfg->offsets;
> +	void __iomem *status;
> +	unsigned int val;
> +	int i, ret;
> +
> +	ret = clk_bulk_prepare_enable(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_bulk_deassert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
> +	if (ret) {
> +		dev_err(qmp->dev, "no-csr reset deassert failed\n");
> +		goto err_disable_pipe_clk;
> +	}
> +
> +	for (i = 0; i < cfg->num_regs; i++) {
> +		status = qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
> +		ret = readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,
> +					 PHY_INIT_COMPLETE_TIMEOUT);
> +		if (ret) {
> +			dev_err(qmp->dev, "phy initialization timed-out (%s)\n",

	"PHY power on timed-out: %d"

> +				cfg->reg_names[i]);
> +			goto err_disable_pipe_clk;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_disable_pipe_clk:
> +	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
> +
> +	return ret;
> +}
> +
> +
> +static int qmp_pcie_power_off(struct phy *phy)
> +{
> +	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> +
> +	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
> +
> +	return 0;
> +}
> +
> +static int qmp_pcie_enable(struct phy *phy)
> +{
> +	int ret;
> +
> +	ret = qmp_pcie_init(phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmp_pcie_power_on(phy);
> +	if (ret)
> +		qmp_pcie_exit(phy);
> +
> +	return ret;

	return 0;

> +}
> +

[...]

> +static int qmp_pcie_multiphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct qmp_pcie_multiphy *qmp_data;
> +	const struct qmp_pcie_match_data *match_data;
> +	struct qmp_pcie *qmp;
> +	struct phy **phys;
> +	unsigned int link_mode;
> +	int phy_index;
> +	int ret;

Reverse Xmas order please.

> +
> +	qmp_data = devm_kzalloc(dev, sizeof(*qmp_data), GFP_KERNEL);
> +
> +	match_data = of_device_get_match_data(dev);
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	if (!qmp_data)
> +		return -ENOMEM;
> +
> +	ret = qmp_pcie_read_link_mode(dev, &link_mode);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read qcom,link-mode\n");
> +
> +	if (link_mode >= match_data->num_modes)
> +		return dev_err_probe(dev, -EINVAL, "invalid qcom,link-mode: %u\n",
> +				     link_mode);
> +
> +	qmp_data->mode_cfg = &match_data->mode_cfgs[link_mode];
> +
> +	qmp = devm_kcalloc(dev, qmp_data->mode_cfg->num_phys, sizeof(*qmp), GFP_KERNEL);
> +	if (!qmp)
> +		return -ENOMEM;
> +
> +	phys = devm_kcalloc(dev, qmp_data->mode_cfg->num_phys, sizeof(*phys), GFP_KERNEL);
> +	if (!phys)
> +		return -ENOMEM;
> +
> +	qmp_data->phys = phys;
> +	dev_set_drvdata(dev, qmp_data);
> +
> +	for (phy_index = 0; phy_index < qmp_data->mode_cfg->num_phys; phy_index++) {
> +		qmp[phy_index].dev = dev;
> +		qmp[phy_index].cfg = qmp_data->mode_cfg->cfgs[phy_index];
> +		ret = qmp_pcie_probe_phy(&qmp[phy_index], dev->of_node, &phys[phy_index]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = qmp_pcie_multiphy_register_clocks(dev, dev->of_node, qmp_data);
> +	if (ret)
> +		return ret;
> +
> +	phy_provider = devm_of_phy_provider_register(dev, qmp_pcie_multiphy_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id qmp_pcie_multiphy_of_match_table[] = {
> +	{
> +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> +		.data = &glymur_qmp_gen5x8_match_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qmp_pcie_multiphy_of_match_table);
> +
> +static struct platform_driver qmp_pcie_multiphy_driver = {
> +	.probe		= qmp_pcie_multiphy_probe,
> +	.driver = {
> +		.name	= "qcom-qmp-pcie-multiphy",
> +		.of_match_table = qmp_pcie_multiphy_of_match_table,
> +	},
> +};
> +module_platform_driver(qmp_pcie_multiphy_driver);
> +
> +MODULE_AUTHOR("Qiang Yu <qiang.yu@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("Qualcomm QMP PCIe PHY driver for Glymur");

s/PHY/Multi-PHY

- Mani

-- 
மணிவண்ணன் சதாசிவம்
