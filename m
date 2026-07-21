Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F134415F1C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656905; cv=none; b=RaioXF8jM5hGf8ss8y4OjceP3YRi0utKPWWT0Yufs/ocI5BwD2/w3Ht7HfSaFhhMIxkGLKaOl5cpXMxSSifF5srU/b2cWRlNWp1lx3+eNx7byCnDfKh9Jq8ukgAFqdkEcImgImIpw4BcmidTIN7hl2lPZdMGjoHYhH4uOpdRTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656905; c=relaxed/simple;
	bh=aqq0bZT/hXwWx8UmLFddb1dgw0fuBz0WtdUMce/GDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8yBQSqs65vL5HreVExNgiCrVoKbTCw/MPknihEGNFeEZx9VDk0QG7IbeuQpFb4TWkGwWL7g38m6G/lbQEGhT88eDsDHbQ8WmsK92NLscC6qbXrljqcoTNnIOBmjFTOk4ULGR+pBvpSqOljxwsd56rgzpR8fZpmhKWajt75zUko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLQXOczG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhDADiOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLQXOczG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhDADiOw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2ggX2449165
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6k5png2EebTSIaZVxRWm8CM
	pbRPFtbdYVyNuYkr3Bc=; b=mLQXOczGSWLql6CaoiBRiSt2MSd/PEkDyEOCPiO9
	Qi2BBfj7JoMKyL6h7LFo2V3JMxJQTywe2i1oTTKpzKC9q3Hz0Njq4d7bboprE6CC
	iWSW2bW74uDvso864zQ938lON6ywA1pYuTMVm+IFAkpOCmlACRB9zQr5GOBmYv5x
	ZHwK8NP5yC53S4a5Rh3FROK/zOlBOd+7aG9uvZUGdN5id6Fg2J4uf/UObCKn02uS
	MYcrAKzMTPI6qrUhjWk8Bzwd/Hv+HHbJZS93p75EG9f9+0fwl5H7ytjhh55AXjQU
	M1MKKRM4Pa+Bf38JL7Z/TsQk/dh9Z5EsdNXwda7M7jaDyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862d3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf27789c79so68190885ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656897; x=1785261697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=UhDADiOwKS0R8Thb0Fe72PsdQAM0dUeoxN1G54KU2BNrPw0EJh50hut+PrFZJ0zDly
         EwsK7+sQXPB9f768naXlqbxVHmStw6750VkInzVPN5PXtWN+5GtIAcIxGJ/x9HsWASXM
         Xk7ij5CHWsRg61zHcwcCT4kemEtt1MYAPvc06wshsvljJ0DEucfMSDzdRnfH/Ucx0+IC
         0VL/9S2XJnXeZbBX5yn5keRT55LLUNNFXV9JB4JLaUYKfGW80P6E+0WWaVJAXrug/rid
         GX2J/GkXoUDHLxfGYRXY4tZ4zQTjyVxkoM9pt4ytC8+JOFZWWY/bEtJyymPBmYKVNBxQ
         gfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656897; x=1785261697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=dIByrytCcRzA5zndQP/sUtGUtbwUiR9IR26SQC8zhs8l8nDVMdCJIwfj8lmQSSCAT7
         7a/PyJyksGmpOl41FrwgPumWwdyBL6OtRLc7K7adzfybgv2VG3yZemW17gDNAAgDxgnu
         JeDuvOtozAileGZBFioU4Eiv4BJKAweZgT3hxRKfpjc7ETqxJa/injkiMv31+/DhnA8B
         TtQMu3/2RfUj00fEjyb9iSbDcNFiH8XichZhGEnJ/rRE7XOge6uxEOO434AbDPUpcuYU
         XFH2e+66OfK2MjXZOlQLrNEgIbuxW5b9+aYb2hIuhsT7j7KLnb1Y9m+Xhb81mtCnlBHY
         LHSA==
X-Forwarded-Encrypted: i=1; AHgh+RqJfzf6kfQnjUzfcrgpytN3Z89KyYihBvyPEr7F5vCNWJXDEUWY+RE+nFCyS0LckYAmGvRhTSbxYJ03@vger.kernel.org
X-Gm-Message-State: AOJu0YxGp14CaCW0gnsH6edr3jeh+V/ydX4AlU5gezUlBXcDqXc4RyED
	x01oDJXFAWC/dV4frgck0UbyKdX0VARhRfmOLF382tkl0q4vrv6cfDgpLHHVcTd3D1ckIJUZWzr
	ctwe+BFnNXxJKgj7kyyHO8Mwg6dvHI6T9f9ptDtJMPvzEX6rBYlNSutRVjNcGXAfG
X-Gm-Gg: AR+sD10zyLh5D3jdR5ejt9c2AzsddqanKeySZwww7+PSaTqJk3x9HVscranrw+WWMOf
	mTLJcXnHfrWmlMfB4cm3PfpXRJDVD07HfSqjvLnUA+JMu9mczgSn3EXW15vhStXr0Jof3zHYVuf
	g3kmY5kf1bvX2Hv+41Wl3TyJR4AbtdrWf4+JkemGjMLYOCZQ0FsO9PwObQ32hHbN0xtnoSIcHMy
	3SSJI87K0iBLylMH9yb+SycihSMdlqwJhnuAbLphhj7PsO1TPf4Jq8J7gXb4arZ6aQ8aMxgR4Sg
	d7KJ/maPzY+8erY7YOhM8k13ATGLrdi0p1jMojTW+d3Lb11o01vAyt24/jy+dKSB6MoJ3SqTtpq
	WFZySflcn3HQRZlh4hAKeh+b6F29AzKOaSg==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205347325ad.32.1784656897475;
        Tue, 21 Jul 2026 11:01:37 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205346725ad.32.1784656896901;
        Tue, 21 Jul 2026 11:01:36 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm1021861eec.8.2026.07.21.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:01:35 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfXxeVicv7HHhRP
 G0lBIu1eH9SA4a+E/L1PzlVsYN5iMqWT8/jI+OP5VxqxHwla/FeXEeKl+PQ8YXTopg6laNaxTjb
 abio/ivxW0xgzyUZBXu5icVHKzkyemI=
X-Proofpoint-ORIG-GUID: RbiUtgo9Q_jKPxa_lBlwcBPnd03NNNlO
X-Proofpoint-GUID: RbiUtgo9Q_jKPxa_lBlwcBPnd03NNNlO
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fb402 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GxRVn01Nmxo37F9Fo38A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfXznzB1mChD5Dr
 x2LEWHSeQeQVf6a6rTVhlsaqXe6f9HabRsbE4juUPN+UmNJIm7UcwtOT6qLKcn0ZbiLrUY3iuiz
 FAadtevNC5+BT/HGf7voq5VC0j5Bcc6hJ/X/T5a/nREbmzBwGSYAVfswcJDdAbP7LHycQzPS3iW
 ivGOLKfIEE72PHpooQJzwzoniQ2UvmW6y/VCo9k+6UImP7lulbYN2KJGVNln3a6uSSu5qrUX4gn
 wpaeL30aHb9T6IFUWOn1ZZ9iwgkUnDGLUJ+/WvWgnP4ysuh/p6/5IKNYFG5efitig+SdV91vHDF
 /pRX1pTxC6RSRYTNE5LlvUKOVW5+6yoD5B2kmsa03s3VO57qp9WWu9O/378S6ZNwKxHfr/+CwPb
 M4CJMsiCdS9nPHooSPMN4qnYeVeXmKV2StR6AEYMtDA2ATWn2gskkHcQbki+4LKi7C/nszcsVoP
 0KuWGIKuQOkeMfpDJdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210190

On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that

You mentioned driver may not be attached.

reboot_mode_register()->reboot_mode_create_device() is using
`reboot->dev->driver->name` directly for creating the reboot class
device? 

> they will not be referenced after the managed resources have been
> released during driver detach.
> 
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index d20e44db0532..7a74f72a8313 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -10,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
>  #include <linux/slab.h>
> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>   */
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
> -	struct mode_info *info;
> +	struct mode_info *info = NULL;
>  	struct property *prop;
>  	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
> +	u32 magic;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);

Any reason for converting dev_xxx to pr_xxx here and below?

> +			continue;
> +		}
> +
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);

The recent commits to this driver adopted kzalloc_obj().

Thanks,
Pavan
