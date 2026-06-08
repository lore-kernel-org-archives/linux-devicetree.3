Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9D37A48A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898149; cv=none; b=FnAEPa1dmyOqBEG666K76nvIzmLibn0FaZEEShM5SiXQTsRHl0N0DgZBHKHzE8tnkiuU8F+Kkm7TCH41nFO+Lk0EXqLNMz0yzrKxMVoMAgGKwiCg7SWzetFwf2cEJI7tD97faa4ZwxUqpHwTLFziLAgow7PI1/znF6KsqAnHNeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898149; c=relaxed/simple;
	bh=lg2DgbPwBLHogtvNmaTCgs1u2gHUDZnx0Yqh6XoBWnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKsW5X3rhp7M3X1ZzV0bhAfF1Vu0FIpUjUHxiS+LBIArDeLoVayXsAgIXh3OaBhQW+aL3bzLjVFJ2a7wi+1X1vmlowGetnwt8MzLyxOMG/wan4PQDwCUAwP9v/df9QTD7XiKmPbWoJkHN8ONbdq+7uc/TuoWcaNA/6F9cI84L7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaUSHASV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsEGMhgG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaUSHASV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hsEGMhgG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F35C1471433
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=luzPiyxgZAG14iAJcnVjDkWg
	HoqsvHzvRtaW6X+R/so=; b=WaUSHASVCqICihMkuQJ/O6Mh7HQilB+NkWIfd6IS
	rj/7etYN1IV+2q1PBBXT6S0bU5bjX58VrfBCOy+7uYMfUCRpPCkbmyBwgSuTV2ud
	d+tAKnpaWVZwEQlhlFbmns2i23MibgvhvEw00B2cxdeKnm0YqNCGXHQHX6nS9h2H
	KAMJVJ2buGNnGZU5KAQHvbo4ItbJxAbRr31WLltc3m5X/QXpUBBtg4aEzUCAUuEI
	2T6Duw+aXSh893NDsGexUj62E7dgm9HWmFxAT3kUMWvkBNjhVhvTPJ7+YRC0hwu/
	PPkKA+p27zJ/cIAlRabPFzLQ8lDYMtIlUQ9Fc7BCfnNE3g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwv48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:55:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so2459124e0c.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898146; x=1781502946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=hsEGMhgGOCl6C7Gq3GiA3s9m5KKGmYde+1EfcQNWh3AgL96xGYHfivwfg4Oiai5ZTT
         pMGYLgC3qACxYWM1szfqN04u6ykgGwdFjwsAlH19BV+W9rxncSm2gZAcqtqkOihS9Muv
         Eaov2tlqMfVWqMGcdehyTiNCH9u3ne89bcPpXw4+hXJOlynrKoSEqG6V2j9/1DAxthZi
         Ra6hqG94YxtkgIoidljBKZ6Cvr2i+sE23ODaYW6e2V0XgsoBEuaMNQ7ulicHoVZ8RyM/
         GmEWL6h9QqhyDXN0CVUxDMqDQF7dQhrCwIIfISryidFSOH+Ba2LbzHPLb7GYOAJWu6Dc
         xuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898146; x=1781502946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=Lsd9tZ5/O1hEEEe3EA+gdnKjlBIUJzWfFzzAucXlYYtQh9Ltrd6lsFZW96MMw0hsB1
         csTuULPbg8Z6jnkamk+mB8ekC3Maay7YKBeVDUkNWKlHPurKx+BxkhzOESR0us82thMT
         yeYRYWg3PC0V6lfzk0cxi/LxdUk0EXFRjJm9fAZB92S+exayLlFstzzMrUwk2Dj0SEn1
         TdtKW2TSEeRvq4JkR7f6buFA9Ng9HYAifRlnNe3cfYSKR+ch5qh2D1Z9TrmgQ0Kq0XwQ
         3lzddg0fkstfX6p8PFSon9bA1WDoSKEFONKEcslpnRaE7qLCPS6Us7YNUO2kFp3S5A18
         221Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wj3RJLTL/AJJTj4fCFIukk6a2w443IweUStaefhspKLHGS5JQVwBXhCLRAYlg1bUSEJY2vRQnFSL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy5dP+r0lle+o8z3lkzgkJXl8MSWDmKJNMOKqTX8mTNVU3ggY0
	6PK9q0QNdON2AuzK/SY3GYPHZ+kv8gYel+0HNBIMVVPDlsOkEEWU+drE9JzHNi29JZWwz0SgVH9
	oiJtfFcrZNrJwqFatZMK7YUd7DQlROAMAAvYLKrtY/4iAHQ7ajMwe/gT4/qPSSmeH
X-Gm-Gg: Acq92OHggvYw1/13kLissQxtPokOY+C590cR5GCRffuavPGLNLA9J03JjR/vPe4LOhY
	MH+gf78oIPa2N5g804nORS/IN0jGhg3MyxEzrrjSsmv9EM5hK53NMN6a5aDX0rNJ0CQk4dPzDLw
	ZGTLfnebX4ag7H7KqeYM1YEYdO68Xs/5vWaD0ImSnFYbMlF8R720hwVc0kG2uZAzeJCoKL7sbrz
	rxSLdqRwiWssfe7pDJGcYxqAzvxEeBbe44eeFmkraJ5982Sx+jFx2EsX5Yfpr3M/jcLnE/Vr2J/
	G1y0cb7caAu/LBmHQWN0ZjRIJ8SLlh4OFKpyCMXLmhwEPNT5U40AcCAC0zvMLwZc9YrIz6mfoYL
	MF5PHkDfHtjsIQ5X3ZQgtdFP53g//tQECjYZsdaUPyfR1lSC2diU3WjJ9eP4UA/Mgr9WILVsa8Z
	D6iUQotqBIr993b27RAwxWPSuWtDFVhsi+/MIJ4CDXPYa18g==
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355200137.26.1780898146009;
        Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355186137.26.1780898145570;
        Sun, 07 Jun 2026 22:55:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm3656975e87.40.2026.06.07.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:55:44 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a265963 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OdMo0-_2X9zdE8NeE7AA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: njvCGpupCJyBjogq1wbEGdHcaEVir7kP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MSBTYWx0ZWRfXw1cmtxuJJK1n
 +CYQINl4v63mCuznhWoyjA7zzujPrf/UHb2vQ+UOW0Kjn4aFaxF6mD48/fs7hBkyIlnFO4jW6tf
 8qbQJh8csIRJlpfNtxWl8uyjFcop9kXAttIi9yY7QWeVjh0Rk21P4YvrR0rnLUcvhJ4VHrYyLsS
 CerIandldvhxuoX7vzl5tOdWFj1WgaUmsgVHgyJDVAJA79Siik5ZdanbgVGHddqgyKk/9Han22r
 Dcf1ojm7aZ9YukvyumzUq38eWVsNX1J5JRVBnuZFiAUVnb1YOuRjuilGwCFK3RROHa7WhUn/B6a
 phiM2iLyf/AkWGDqzQRjaqAL9l3auATAN1o2/HGAw8FwjdVHED1ibxdlUp4/pEhRmk+gzb0D4P4
 DhyJHGihZzCkB/d/rRp+1O3ujgtYJyLNt577IiiWitUv6ggC9o4s9OBdgTjQmScWGbNnskJ3rEs
 BrtKipLnrFx/UTewqYQ==
X-Proofpoint-ORIG-GUID: njvCGpupCJyBjogq1wbEGdHcaEVir7kP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080051

On Mon, Jun 08, 2026 at 11:08:35AM +0530, Vishnu Reddy wrote:
> 
> On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >
> > New issues:
> > - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> > - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> > - [High] PAS metadata memory is permanently leaked upon every firmware load.
> > - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> >
> > Pre-existing issues:
> > - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
> > --
> >
> > commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
> > Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >
> > media: iris: Enable Secure PAS support with IOMMU managed by Linux
> >
> > On platforms without a hypervisor, Linux drives the firmware loading and
> > authentication steps directly. This commit extends the Iris driver to support
> > Secure Peripheral Authentication Service (PAS) on such platforms by creating
> > the firmware context device and mapping the IOMMU when the firmware device
> > SID is present.
> >
> > Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> >
> >> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> >> index 1a476146d7580..8bdc9273036ce 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > [ ... ]
> >
> >> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >>  		return -EINVAL;
> >>  
> >> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> >> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >>  	mem_phys = res.start;
> >>  	res_size = resource_size(&res);
> >>  
> >> -	ret = request_firmware(&firmware, fw_name, dev);
> >> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> > [Severity: High]
> > Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
> > during repeated iris_core_init() failures?
> >
> > If a subsequent step in the firmware load fails (e.g., request_firmware()
> > returning an error), iris_core_init() returns an error, but the device remains
> > bound.
> >
> > Because iris_core_init() is called upon opening the V4L2 device, userspace
> > could repeatedly open the device, failing each time and allocating a new
> > pas_ctx without freeing the previous one.
> 
> If the dedicated firmware device is not there, will check and skip the repeated
> allocations.

No, the path is the following:

iris_load_fw_to_memory():
   devm_qcom_scm_pas_context_alloc() -> succeeds
   request_firmware() -> returns an error
     return

Now you have a dangling PAS context. It will be freed only when the
driver is unbound. If user is persistent, the driver can eat memory and
possibly other resources.

> 
> >> +	if (IS_ERR(pas_ctx))
> >> +		return PTR_ERR(pas_ctx);
> >> +
> >> +	ret = request_firmware(&firmware, fw_name, fw_dev);
> >>  	if (ret)
> >>  		return ret;
> > [ ... ]
> >

-- 
With best wishes
Dmitry
