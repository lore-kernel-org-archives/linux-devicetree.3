Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A263F4110
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679740; cv=none; b=uslcR+q1GC5I28n9CjQvLPOKZVqHFonCh2FD7mfZUDNKfa4tGBINw659k6yDovVIoaygw04UAJV3RWT/swh4ccqMh6rZGprJ3w66bmtvKvl2QmaLx9kcYnkBwjx5ioYIh5+WjE4gJatARyFM33bDotMKjncb6RY3dB6CXRVpYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679740; c=relaxed/simple;
	bh=zZKNBlC8xilBW7h5Xy5kH5FOhafB6+ZvGZEGuX6Tsjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP2mBwyok8q5Dse8JgtM8PlXx+DTzyfurvs8ExZ7PSyTii0H7GQ+IFwGGjHknVWhgQgxl5SXo0sXWz1HkyQ59AkfTXeL51+/Yvs/9W0ZxJm2mEt7rR7zRWfsalsZPIYTtKr2JChGvUArPPn8HYHqEdWd4dmGRiiERwJUp3YYdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maIKG54s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/H5B11n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maIKG54s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/H5B11n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBn8vk3326359
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wRAyE1rvzIaDWQ+RxvchnyD8
	UR33n1c7hVtXAq/JTAQ=; b=maIKG54sAD9m+ygC9YpZq4eqrJ9UIq8zWmV4FF7e
	YTe9yf6VndLIYCvpjSwSu3NbVUKOCv/IgHa5jzdOl3B9xRmfiPEQ7B+0WogFcfEE
	xxU4VF+MJd8P9Zlpl/tzlLFj5fba38LYdkPlCxsX3aZDpJD3Dq6cVmuh+ADl2wpG
	zKT6cpTrQn2uzYeAYbdwfQIAxXYBfxiM+MRMKhK9gBObXva8Dn1Q4i575hjFCzQg
	9nmUeW5DK06BAbeWQwB6nN5I8LDuOo1J6r5OvF0rH1NgrYnydoErj5bFvPETgStE
	ffIiMxIJ5S3jyetoO5i5E07yx0RMrgmGHKbKerwX78TH6w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9p0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:42:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313385ca1bso3083354137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679737; x=1779284537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wRAyE1rvzIaDWQ+RxvchnyD8UR33n1c7hVtXAq/JTAQ=;
        b=K/H5B11n+bV7pYd8W0xwFQhfbMcCMKjh2d2K+Pp4qNtMgi/fJLj7EQPP1Ar5/ITHPd
         hImSVP1HQPi/RhB0O+RgEgNpJrZaauLw20Nfcp38I9W8pRhQOIAK9e8KqJ5k+e++nK7c
         pdlo9KWHlx/nXcqy9ZchIaerXOQi3RQDqZo81dis8hSQdUo/gfgUZFOztzNezWkV868D
         RNXVWr6fyWzuEtwgFVAY1vO4ke6NdJQ5Hji8ulEu6CQ97RMbui30MtFIaG1mS0Wiffjl
         NZI/RuixxfNJN30o/7UxG+XFKIYK/UgDmQJMxHVtPbw9meIUF6GO2vjd60izZo1h+8Pd
         IwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679737; x=1779284537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRAyE1rvzIaDWQ+RxvchnyD8UR33n1c7hVtXAq/JTAQ=;
        b=cqztfE4TeWxPnWgv4b6xQ1/kSBgeCpxFcuiQ5gLtFkB1yR5Wi1G51w5HFqVl7khb3a
         y0ma81aQnseuBGmRn2VfUhndiwmxcQcxaVlsK324/QLlJXtkCCHhTYQVeCUcfI6D2VrG
         Qkw4I1t2bIY6+US1coaz87HWgNRPAtx4OasKmY4MPVEMQQwQ+RKpLAd7M9eAVSEPmKO2
         FWCImskmqos8s5p/qrwl0Cp1G25VVM7+jzHrNfaFZUAOBufEDMqhxvq3ZZWmT52x8kh5
         6Pz2P7ZWG0sYXEr0LBey2BYk/1rva+ZBBD6mVv1wpvKDxYSg5nUNTFW4gLp8GHRakbTS
         pO1w==
X-Forwarded-Encrypted: i=1; AFNElJ+fl4pEwlW5BUpXnEPVw+CR/oxYeUEPBGFXBv3K3IBIcjOa+BmW7CGmoXEFCHbcKNoGeuXDYTCSbiKL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpn+DlFxoQsdPMgKTHxfuvk8N+CAuCWzsMGJEqjgtsuYizNB9O
	d2nF4FPaezsNfTQrZ8I46ZdGzBkQVg1sEdfJOdhXu5zEpE0cKa+GlWcYtnkOn9Eidyg4uZfT0xA
	1Qf8Kr+/PfUUQYAyJmdL/g9iQJnyTr0ltmQTXDLaOxmolNN1bTyA7+vZ1ur8HXwrI
X-Gm-Gg: Acq92OHiu7FEsJGrY0X5nuzdR26tTdUjiGBens6DqFToXG5jEk0pgd1xMfnWDF2zA3E
	GkPEM0DtFtmfsI33e1ImoqFSeBNhGQU8+UAoJlYKIzs3vJjMSssUIBblhXqmONAMiPLizueM6V6
	vrz+ISYcyRUp4vw/JB9LZ3VNFnnkTqM/53c7nkFbzTFAl67yc0GF1GTHFlfkIQuTnN3Cgo82zsj
	ZQGbJ2ZgqbgQ3N6lLIAYHXA8gQtK0WWn5jzqyI1sC0Mt2gU285kvwhqMG7dLfKeBQN7SAfpNqC2
	ULQamLWc+lT+p9B8RSpx9ocDXoBvNF1CNzfUwjBv3Ecr8g23ZDKwERqfVHqIEr/7LQOKKChcGCC
	xByIR//NwNgmtzekSO/VWIXbDkr0G3WLTAUbuvvWCUrse43+bw1hCO2VZ4EXG+kJ+QOIVey+XmY
	KHdXlhgLx98deQMQwqvl6xKsAbeYuWJRFy4Ck=
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1123891137.6.1778679737121;
        Wed, 13 May 2026 06:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1123853137.6.1778679736046;
        Wed, 13 May 2026 06:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3976983e87.71.2026.05.13.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:42:14 -0700 (PDT)
Date: Wed, 13 May 2026 16:42:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
Message-ID: <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
 <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: 5VnCiN6vfIa0iSAjH8cgnsoiUdwR8bZ5
X-Proofpoint-ORIG-GUID: 5VnCiN6vfIa0iSAjH8cgnsoiUdwR8bZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX7quz14eLTDzh
 5N25WnGSDlD+eH0BpQUVehG3a+rMNQcCcNhNcvMLEoCVQI6BCV8dLjojCvXAKv4EMJrY+PBmXkQ
 mufdqNG1pmK8SciX0vv8DL/tLo7ly0/5CUWcQjovMMpJz5u4h/yEtM+VfOlMI5+6JbO505HylDM
 ZkaW94GdQmy9Dt1h+lv+m5H8kNALWiXG0tSnpbPOiEiD2wkjNgAW0NRogf+JR1mhg6i/aaP96q+
 8pBHab8Waby8usr0BF6VoyagAyyzliq8c09jmLGlPEqjHXua9x/nwi4qDuWmEPEE/ibYQivk5/D
 y5PkSzo54ncpEwze6AHaIndBE+3TmzoaElWKZ0A7E+i4RBCCd5cUprCbKvlc+pm930KMdqm3Ynq
 9GHLOknoRZ7SFF+pDX0tUKXtO03pyFvul3xmrdmWQQZ5nvYRQixg4vaimZF3wo1zMDqEYVaiUl+
 OhXPCy+zyQMmCol3Ufw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a047fba cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4BjjeKLzrOWpEDKIceIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

On Mon, May 11, 2026 at 01:31:04PM +0530, Mukesh Ojha wrote:
> On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> > > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > > or QHEE), which typically handles IOMMU configuration. This includes
> > > mapping memory regions and device memory resources for remote processors
> > > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > 
> > No the calls to those functions are not intercepted. Doesn't hypervisor
> > simply implement the SCM calls?
> 
> All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
> and in most of the case the preparational work for the TZ like in case of
> qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
> so that the TZ can access the memory and then calls same SMC call to TZ for
> authentication and once done it comes back does mapping the PIL region
> and call bring up sequence of the co-processor.

I see, thanks for the explanation.

> 
>     SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
> HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 
> 
> 
> > 
> > > later removed during teardown. Additionally, SHM bridge setup is required
> > > to enable memory protection for both remoteproc metadata and its memory
> > > regions.
> > > 
> > > When the hypervisor is absent, the operating system must perform these
> > > configurations instead.
> > > 
> > > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > > is now in place. Extend the Iris driver to enable this functionality on
> > > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > I fail to identify, which changes correspond to this description. If
> > it's about the PAS context creation, could you please be more specific?
> 
> I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
> managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
> part of [1] are in upstream.

Ok... I'd say, this part of the commit message might need some
polishing, but I can't give an exact advice here.

> 
> [1]
> https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> 
> > 
> > > 
> > > Additionally, the Iris driver must map the firmware and its required
> > > resources to the firmware SID, which is now specified via iommu-map in
> > > the device tree.
> > 
> > Why? You miss the most important part here.
> 
> Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
> commit text ?

Yes. Why are you using iommu-map instead of listing it in the main
iommus entry?

> 
> > 
> > > 
> > > Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> > >  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> > >  2 files changed, 66 insertions(+), 10 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> -Mukesh Ojha

-- 
With best wishes
Dmitry
