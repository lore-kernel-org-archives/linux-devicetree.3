Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7D3B5854
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486495; cv=none; b=gMZlj2S1CfbVz2BGGyL7bXLA4qD798j3nVBAJIe3lWZxyHHyoi2yy6x9TFxBYCy9I1ob8CvN21upyLDRe6naJ3IHeD9zN2wvz9Esvlh0Q2ufrGsRpMGu4k6oIOyJe5qbiTkXuDDPAK3pTOZqVw0xhs6ulqbace9T3ZbkvwKCBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486495; c=relaxed/simple;
	bh=9At6bN/HQOqxg3TZidbgne5rrgZKG4x7j0HUT9ppzqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a28Eh1v9EpHj8SsCEMGLtGN6eW+i9Dez443NVRs1ihVLFK7HTFNkJRxv5oS0ENcHwh6AkGHApaLFbwOWwp/S5slCmvsXwqzkH8QMpRQwzpSv+4BJKcDFm8j5dRP/W0Q5+eFDVH6l2/kw3Xt2MuZerhdmgzvmqvRB6e5+NAfm6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHGqlV7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAt6uQFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHGqlV7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAt6uQFP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B60EiE3118001
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wTnLLM3bNR0ig+1jIwsqUgQH
	Tql4t8I0K2Rs/RNYSTs=; b=NHGqlV7bdneSmgiHoUkYtNdrrfJhGYPO8Kc7tJyE
	t60BBdC1OACJgYvTOx5bMS+2QeQeKOYU0uiFq8Mt5gQrYVM89GJEfsREC/yrvanT
	kwomtX4dDcMzwFIqjP6hevdd2PW6DsA4L45bporqi9lo6kj5GuRz/b4n4G7kDYkB
	s3mEFUpz+jRl+nhIJmGwp1Zkt5nbTYsaa9Wtp3dnT9/qsRQAvpGArbWwB89y3t72
	1C8kB6IccymXwRFrAKaUprYHtd4fHbhHarrvoOvdJJPFEhcLRvyOeYzpH/Ss0zZx
	JCGRJiLjskLNChBK87AL5TEgiyMox+wLaC3i+IlK7lZYIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h48u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:01:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso47863565ad.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486475; x=1779091275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=XAt6uQFPY53qOGf7nhm2Lze8weSlh/FgPWdYhEK8628jrMl1LcCKT1mnN4O33ouSXj
         Hn4YKPiYxo0pn2ejX6xmTFhgSTzcUYNC39kqvY+kOaqqU2tYI2/CjAOxwHpm8K7CYHMg
         QFjcUcB/jZZv5bBhKsYM08EFirS4aBxFppFlQqn9d1XSqLI7Diy3NFqTLN870qv7H2fV
         gjL6B9Vy0iQu9bnHGyuU5+zQjKormRvyzw5pLm5on1v9/HtNT3pcvvrx9d0fSzIrXGUE
         isIr6AEFnSoBJPLbVh+vqonnqjOOvZYBgqXXaUfBM6wmh38QIX+JVy6k9JbiIawRbviJ
         O6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486475; x=1779091275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=XZ1sCZgEdIVAqWAXFP6lkX5invwYtwh2cUNCy/YtDoO9W9Ct9Ww3ftSrxG/z+kvO5c
         M0UgjP3Ar7aZgOfIvHqAYjlopf07ZqSBt59Cnj+YJhGPmlY1HpPiuj/qKq8taqBpd5Bo
         0bjrY3xtoezxmvg/w+NAEs/TyydxU64XpKaZ1VQI8PKbRJPQANkqrwq+Yey99gp0dmhT
         sBfkX/DtZGs9zA3z45YJiMTkk2VeWmNS/qXkqRVXMecNOlPJaWLJbuGAyI6QBsPKyIQa
         mvJVmOPhpPii7u0NAZO7kzRPM7zLQxnkkP7f9+4o9xZhLJCoRji4L8AVRVfEIriIpLzE
         kt/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HxoP3QfljOSiLnydqA1SdJYH6Hq6daj1dPk5RhCuEGx2BYO3xHG7McXP1crstsgDpdHf7QjS4UBQj@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmqnilEgCLu2ofSFaOW9e4SvzZFoWg4/cIK+wIOKajAqQHwPa
	xC+oMRg25ERLx/JxYAecPxd0D/0+KlDGsySBY3s084qSZA1M0v7JN0uSwC0pr1qqZdQxVSrPo3a
	hfZkRlHFAoXhVQ8x71jePO+0BMY041CAQHo9sZ10BsG9Xj1rgauvcLhd6mmBdxMs0
X-Gm-Gg: Acq92OGNAvlS83ejzfvfy3G9Z1NMO6lxpsA5o/DrgmDJ75T39jYPAU2CP4Ak2iEUCQP
	CNMjIcRuThQmf90gE8qJS+/7ymsm1UXlqzm8lG5wNe6gdfh7bJawnHgn/tWZ9R5s1IQxL7EVpWk
	9O5oDF6IHjeDRfXHHClqwM5EtO9IHpZAXFwB+O3PHxRIJgkYIp1Q2enBTRMMr7TzzwbnfwCIS7F
	9pX5hXfgO3R10tejgSiTqBvZeTsZI65dDEXZ63xtno7VfZ9TC62Pxt0Vl/QS5VxTgcPtMnO0NF7
	O6gcSec2HkB/ecc1sRL3L/11H+1kJWpkrigwSI8PkmoWTIfQZCgu+SYDTLCTqM6lcAV9hASIhlM
	W5FXdhT5kVB7SvEl98ufescKynE1lHgP6+NZdNTW0PnBNd9Cf
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081745ad.17.1778486474723;
        Mon, 11 May 2026 01:01:14 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081065ad.17.1778486473994;
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm98532815ad.47.2026.05.11.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Date: Mon, 11 May 2026 13:31:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX14bJ+2qy1fiZ
 9BjlmbfTS3XmSLXjSJWcW7inixfGvFZXFkWVutj/0XkJ5cUAnYxMEpmbNBD1V8rqAONUg3Zs74V
 2wf+5CjnITVD7RfBUBrxikSd9JaT2EjAw7A7+yZqD3eFbrM12L1ApFB3AlJQNIJd210/+Dr8k1e
 V9fKungcb50JTgP7AIgNB9j+9xlasCe5yr+44gUloKFOSjUOWu++xhomUTETVRRmnHHetNEKiWi
 AnDFVzZV2AB8BzhDy8ZlFREJnIrzhWgDWpzORhQMe+7dU/sDrpDNTiONGhmU4pNg8pumiASCMWW
 0Pca9VjXcTvavIIfeD5bHaUV/DHLwZL+AfYWnymTSpRpBsT1tw2BdKeepIkfem/leZT4t2Gyoz8
 T5sJO5oe8qzm0ExO1c4IlGdxpRdmgtRcMXzurKgusPiIdBE/EiJ+asD78PwfmiIEQbhptXh08e4
 s4iw2HZw+ZnVMQRndAQ==
X-Proofpoint-GUID: xlvgkF7TRiZDc6alQkt52iOwLz_4fgjL
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a018ccb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DTHjRCbF17pgsZGT9MoA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xlvgkF7TRiZDc6alQkt52iOwLz_4fgjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110087

On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> 
> No the calls to those functions are not intercepted. Doesn't hypervisor
> simply implement the SCM calls?

All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
and in most of the case the preparational work for the TZ like in case of
qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
so that the TZ can access the memory and then calls same SMC call to TZ for
authentication and once done it comes back does mapping the PIL region
and call bring up sequence of the co-processor.

    SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 


> 
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> I fail to identify, which changes correspond to this description. If
> it's about the PAS context creation, could you please be more specific?

I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
part of [1] are in upstream.

[1]
https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

> 
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> 
> Why? You miss the most important part here.

Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
commit text ?

> 
> > 
> > Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> >  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> >  2 files changed, 66 insertions(+), 10 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
