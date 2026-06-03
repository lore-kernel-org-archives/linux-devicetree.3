Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF74DA556
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528495; cv=none; b=fuZMbZXJtjnT5FAfIwtAoFC12Z17Bgcr+obATNwYdoZ8r0Zgyy3JAXpoG9+tWnskfMG53N57Nc4yUkWRGsZrRSHrfMK/t8NLix/Yb1kxm69BctntrRngtnGfvPBPq3fbTGp0uCa2TACGsw5XNpjE+zhV/3xd2C8Sa3EX+uRKvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528495; c=relaxed/simple;
	bh=wlIh7ewMrK39uAMTUXhpkLTuGf2SAbn0ZjgyC9KDupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl6dNAdDEbpHHpihXKC4q4iQy53S1ebH563Z+oZiBGhRfsRWLIxqTKrthZlZfmQz/lns9HUvsa8YWCZ3jCjzBEOic2FIpF+cZvj/v2AKL4Nu+izmE+TwZIrbPUT36FRnc5dtv6FdqutyxB/tl/bJyk3xPX7Vt1udNALOkwmnolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihtIxLKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KE/2IU0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihtIxLKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KE/2IU0h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Lf1uh3241141
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 23:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2G//XKBrQs0e6JBzYc1oOjln
	PuaY2eGS1/i4qJ/r9ew=; b=ihtIxLKYM6Yo6nNNaTB6zIT3Y8K/AXl9EhQuzt0B
	X9wMI92HrqljgfadLxCHYB6oyWTArtp5Fhovowro6J6UNwrLPWaugGM+/z7wASf5
	tv1WVu+j3LaEgGlI2NPNLOsIk9lF4SeoPjUw5iqMdBfKTdoBXfnvE+wtVR0+tvtj
	oHeGuXedQthK3EbsZg0Ib9v/SUVwJKr2BLeDQ/x1RLolDQfb7ZK8fUqIYqyDkWPz
	2JfcQJ/xXziBD1J0DmNelO1WpFmH+rEN0RoRblzMtvMznp0sGZY2W7gXyaUsGE0C
	6ctllqCJ6WQArQ8JkGEXw2pIYyn8iIGlefvR/JuJo+l30g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd088bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:14:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ebabec151so153136e0c.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528492; x=1781133292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2G//XKBrQs0e6JBzYc1oOjlnPuaY2eGS1/i4qJ/r9ew=;
        b=KE/2IU0hgtO5cv0BKndepFEQR+T3pWO5T6qg3F1aRU652W7lwSXKNOATVo4ANfa5Pr
         5I3VvgC4IgcpMMBzDS9hKzSR4YHNYQTvdL/XUM8uXvpxzB6nn2rGWb0djslarhYDA7pf
         +YKoEPkxDLO4teYdfSm0rBwbHQX0ODiPCZrNDLNaeILdcO5Yc0AYM04HswjmHwOAikBV
         qhtnQc31cPkMjlwrDFTAWgbPHeYkYiVljX1YuwILzogclPhOqfVmfYU7cLe5++5nP2IM
         LLkqDcO3VCENfqgepmTBsrIUkM/Cb7z93HncCHJT5StbC5CNWimP5bVR1LPCt/57VRp4
         44xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528492; x=1781133292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G//XKBrQs0e6JBzYc1oOjlnPuaY2eGS1/i4qJ/r9ew=;
        b=VbkrmfIuBqFKtUpPd8RfkL0FflZQpy9AwF87hMkZzNvOaNy6IEx+6g25wXkW0MI6TL
         gKbSnLzj5HESZBIZiRDclvzsSCJCWlT+Bpx0lC5gGxffm+vWFaUT6ArQUk+4OBHIue2i
         pJ+QZ2ZacvVdSu4ladV/ra5e0Uoj0JGN+1yVM7FOy+FixA9DTPzrNsQ6EYcD1qIzjFz9
         sDIC9dCUsFoUxQdn8aFMXdJKLAnpfE1qJyXpcMK9dV8z+0IyiWdJMtEd1XdFnwrtIYKx
         WubHtaVGzO8UwkjfHawX/QJWov03alaXiKI2fWZZKQLT+PihT8jsuEZ76K7ofD+nk3WA
         qdMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vML+nQNTIDwg3HQRNIQwRbHfZT4pfJwdCCSU/je8dsh+u2SuFNfFfm9x3LX00kWuFdTQT8dNhx2Vt@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUcCoEltJTIaa2HW8CU1K2bQcFomvjKHPkFhyDGHSNj/Bbm6x
	mFkPrbiZH6DOo9ufvyWFQHyIm/MzrVb274ItONYvfzDCAH5fXBaeZYRS7xSgqk0CfdbQPDJXd/0
	fLIUns5VBgkl0IbPgyefts8q+CpnBDpghWY5AiL10N+ZSqbeXjMlIG31P/pj0v/Us
X-Gm-Gg: Acq92OGk1oK5SqGo3WCrDO/iKxuNtP/4rt79Yj58xN1XdbGVY424e3yhQkS2mbqed36
	hOl437vjueB1R+91xkGQzSOAxyTtqClluZs4U5cId4xn3BegyegG2bGYj/AWWx1aXNO45f27qwB
	nIgN4dqfrBsbXEU8M/RhN4GyMgr9qw6Qm8YOXy/kg2n5X6MmotsevEF3lFaoQn4ACIrQdFanDEH
	3ybI2mSCrBp2iY9vG45SR5RVSPli/+sMYkom+GOg8PkU/3Dba86xyW6RsiokslV4Uf26PgmUUuX
	1rQV37KEVrbS6jWp1SYW73yWg2CL0guX8mXM+2OeYxuEDc006X+sZz8977v1Y833LOfloK/MKVS
	MAHJjGNlb03LsuyjrgmkpIruwnBE6v1EiLpJWZqtT/vpniv8DWqP79FBO/0ypsaRJQNcBjLJMb0
	rLD2Ksdhi8E8sMPX1ccllcT1DhDliq2TaQLTGgXG2sZJXE+w==
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr3875128137.1.1780528492348;
        Wed, 03 Jun 2026 16:14:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr3875118137.1.1780528491852;
        Wed, 03 Jun 2026 16:14:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc426sm886358e87.26.2026.06.03.16.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:14:49 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:14:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 01/12] media: iris: Add iris vpu bus support
Message-ID: <4daogr5a6mcuksuszz6io7msh33lut25jxfbltr5qhqij5idhn@ztizw7mf7bhy>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-GUID: fEJfR0nGJ1Iss3d4-FUi0jiSBMgpdgu3
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a20b56c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iwIdmoSuwSNZiPAV1xIA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: fEJfR0nGJ1Iss3d4-FUi0jiSBMgpdgu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX6K/Dz2doTYa4
 JmZceNzVy67FSMYkn4p+1rw9kJL67rkxCRg5uh2Bql6HYbDpCit1CjKeprZi06TILWtd9LkOcKF
 PpQwC69+ogovyuKXof8qTvb/BcISFivl3+NM9TSh52MuhigowlTyxBHwKR8KdNc6Av3Eiytafkz
 eLwq7l4qZW61js1tahw4ykvQGwrdwSE9HynY1+r41aODBBdPWO0yTz1c3/sSlS5AIO+foN73ZOR
 qdw9Pg+SOXDgslTXAavRDABG2qdAV3NhweyULejBvHB0VVgw+gm0Qj7Ti5+OPryVIoYhmZDPUiY
 fd/TRiWL+QFaAazVPMnQuPbQeEbf70cOhMzJhaNx5APkGVH9w5T4hfinyBI0kv+z6mmVOXQa27J
 T/uYm1M8cMEVLx2OGDqK9bpNTsbCtbIiCHbKnpLSLNBp20xmCCb8g36mhjgBT9JdesYn6wU6kqU
 wdQOqKSaR4zGmBRx1EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226

On Wed, Jun 03, 2026 at 07:48:39PM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> associated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  MAINTAINERS                                     |  1 +
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 ++++++++++
>  5 files changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
