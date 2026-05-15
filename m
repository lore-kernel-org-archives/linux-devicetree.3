Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB883D0C18
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840697; cv=none; b=PAcM18H+Mt2eqD8wkRRMuUUam6N3GotxW0NIJLlSSHGIevJLkayEOTi1NfrBKy/1UNKSOFyAvcApYKPyxMt9/bnLFtUgxjPSFu9FW0VRjHFgRFRrvlV/UYxKPQvVgdkq0sZpV4AKr+SnZ2bgogOw5qNnF9E0208+g477rSLe7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840697; c=relaxed/simple;
	bh=mvPinM/tJfxm+rmtDR2dA6pZP2MRjfXid39J0izyZb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoA/E/V1SB7TwYz/CLDp0xaf6yArTxC9zn/w7/vP9t6rHKhXdLTfPPkWZe86W9PrNEzYkitXSrn0WDCbt165yf6Dr2ygmtB0xOjj3381tT+0YrEqCTjXBt5tALZHllwWClwqCt7EyFgIC831IXmLbCeZCMx65fuheuEK1hY/0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl4Jxtr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj9i8G4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl4Jxtr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj9i8G4i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8kZCB1714932
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpt5WSbFp/AI9TGMZc5Fn3Wa
	uUNLzeYaoqSqN1ldUj0=; b=Gl4Jxtr6THbDhk0GkwCs/cA1T6ZBL/U0XFNZU/59
	GiQoq46MVjWHu3oqE/QeIXTwCBDJ1X9XlYgj87MtlGPCKJ3KqaCTx99E5URHvxRl
	v5bXBil1TomMyFxqKYNfsRnkS+6PiVk8ynN1mWnlEPDO/XpZkUA0e8p7803qA9Y6
	HBVIAvXgJY0KJcIG8089YndMFoIDrJcTKwWhKaum1LwG5Sm/dxU/WNLLs4hPaByf
	CO0E9rbuqN7dWcsRZCwCvGItOqYdzFIWzCF0uofaeGIdzk1DLqedqrm4aX2UCUkF
	P59Mx9owC63TMiJYOjhvFNIOMKwhI2/FNVMSx1SUPyyKhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxskye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:24:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso191690791cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840694; x=1779445494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=Nj9i8G4i9oor+fFw9GIZ+N7cv7UKySrQwM7aNRWctfNNkdTULmP9T6TZdC/eynkcEX
         cFLX1gus94MakHHN6F30C59aqhdnhD3dFwSlvEl9nf5cVFx29ioXGLxVZjOijNlET+AC
         qf2Vyrey09HzR4iJDQp7ou9R0ZMwSsVOzVOYJwocMHf7BDGebKYGyW7QY3BWXWq5ScKy
         HWoZiaZXdb7q9ye1/WFcqfijPbOgTr9H5d17iAm94qOk4DmU45OdzY7E0LYmvi9AG3Vm
         8ZK/HsfkkLGKiKrY61ND35VjJRW/bwlHOz14gFgJIZ+DhIVAb2aKY2sooni0Tep4XkkT
         xe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840694; x=1779445494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=SZ/MSnk5MIfV5p1viS/rVtIfgP3nBzRRxITXUL3nrWcNGiZeZeyChr9YDiQ7H/OYk6
         htHTZgL7u/Hpzv/O/M7Xay8mIalVBZRYMkAP4iIsYnrMBteHZgjh0j9zxZ4aFuV1axpt
         dGyX7fNk+UjpH7jDsjpiHIZ8ZOKdsg6avFTAo3Qsj6W4t2yb8sOenGihL2rEzNBuvB2z
         UiOX1vWs/TyYmgLpiozHT6nZ3wyR/XEv0y0qV2yEM4DqvliIlJg+p12n0DZXnr39/qru
         vdumFEujDUpRWK1BzHz0GRrFRxp74RzdZGHK9cHRt0MFvgRNmtdhn4c1C3rwLWG+KyxE
         VI9Q==
X-Forwarded-Encrypted: i=1; AFNElJ95wuV1PUZBOwHX6J6oTAxE/TXUCn7Av1nS/bop5fZdnBrdKOiS+QYKlO/x6UAuVDDDraisOMPgfToS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IsDcNI0eA2mb0YUCrRfy503xEOrfGoFf8rK32eA5GqTBwpOG
	pW+cVI2oXvWhu3lRa7GWRV8ghrJPy8x80jFgOe26MGvfoL8nuaZ3dRXdmaYNPw5g8uBbCoZdYoM
	EJkTQva72BAty0rGXkAuo8pg3GkaGeXiU12N7rccbhxPnvV4IvBjk634GvL86q+Aa
X-Gm-Gg: Acq92OEWlU7Wu7o1tFeQJDKgGY42wrCzF4lngYjXpdmtvbhqj2EsOb2KPQMet9NEpkD
	tE1xiyiiozCjPIktoY/v/ZDNCp63v3CQ8zGxPEdXp44iUuuZg4oQVnYCO3G8TjSkGCSzy4G1vre
	uZanfjBxmdLjgcop4x0exA3lRNzSA/xaaoI0QgXdKp/eypgFHOF8Siv820lxzDnPrmvjsljs/9W
	1ZHB73V4A3KbKZH8KdcQmQzz5VscJc3zdWoHsCxwU0a1v2eny94rUeCWGobMymWpfUoru8cPsoV
	8mneHo94t6GpvYoAP1PJUpgjqbb7XB2Flx+9V6yZW604roamNJARQR/H/Kx5N9mxeGYIm812OD8
	cyI1Lx20IbT1k5itJiPaNVXa2N1o0fBCqpsqnQ+CYDxUTc9ilz+5I1rxJ2lTcEn7Sly6eKXzriK
	OLHRSmjzbXmRB1V3o1i41gB2eSlLx1RmyG1JU=
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185861cf.3.1778840694140;
        Fri, 15 May 2026 03:24:54 -0700 (PDT)
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185541cf.3.1778840693695;
        Fri, 15 May 2026 03:24:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8dc7afsm14585621fa.14.2026.05.15.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:24:52 -0700 (PDT)
Date: Fri, 15 May 2026 13:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <biphbzvvy55qz6rnqpw77taxczeuitmkrodepyfosnoxafvsxb@swme7xerynlz>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
 <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06f477 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JLCR6Gb03Lu4_UV5QcsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: APD8miBZWp2WCTDhh_VMa3IMiZ6Jxjai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX6xWlAhKDsOdn
 cOnCJNT0EC2Ddn0uC5pleXXVw4+RFhGdo2D3MrbdM3gRLVq9HK/GrqATVQLXoUgz0qXIvNOlWaG
 JHPBIx7zvK4tbkRKRi7vA9jHohOsdFjNrI1g6w4zhvw4R+RS4eGpxEHSfTlKEOAYle+zqjG7TGs
 5olXhfJ8YvAxerwN0YPVUiyC3Agr8W4UlgppYu7qWurlhxqw+XXC0dJX+2kqsFn+yT1xKezmT1b
 8irQKZ7OZR1n8FReD8KN1NzLqy2u8zJ/9a0Jn0KrCNF5cgtGO3Q0y9Rnv0lOqg0nOY8AUlCmf5j
 40u3rYgDQFPSMvteb5+ZPSdUw9j4qgysumsX2+fSvipjOC41Y3AznRZTWRolQmsiJtlCQk5WZFl
 21EJQufRHTlwVuMC/4jDnNIiGycrFcqbQ768LlFRtbcLOyu2pWNK2UkM59H6LVFlQjQXCxsMPMa
 UKPvCxeGmae7c6237VA==
X-Proofpoint-GUID: APD8miBZWp2WCTDhh_VMa3IMiZ6Jxjai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104

On Thu, May 14, 2026 at 11:15:39AM +0200, Konrad Dybcio wrote:
> On 5/13/26 3:47 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> >>
> >> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >>>> The current clock and power domain enum names are too generic. Rename
> >>>> them with a vcodec prefix to make the names more meaningful and to easily
> >>>> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>>>
> >>>> No functional changes intended.
> >>>>
> >>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> ---
> 
> [...]
> 
> >>>>  	IRIS_CTRL_FREERUN_CLK,
> >>>> -	IRIS_HW_FREERUN_CLK,
> >>>> +	IRIS_VCODEC_FREERUN_CLK,
> >>> Can we at least group them too?
> >>>
> >>>>  	IRIS_BSE_HW_CLK,
> >>> Is BSE a core or a codec clock?
> > 
> > Unanswered
> 
> Is it the same BSE that requires a new clock on Purwa?
> 
> https://lore.kernel.org/linux-arm-msm/20260507-enable_iris_on_purwa-v6-2-48da505e23bf@oss.qualcomm.com/

Yes. But not that BSE question is simply an attempt to find a better
approach for naming the clocks.

-- 
With best wishes
Dmitry
