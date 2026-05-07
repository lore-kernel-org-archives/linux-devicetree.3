Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608324E4C4
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161673; cv=none; b=qrZzgsAO39okRRr71XSpm6PAU83497qBHLPEPWFv4t6XiMZ5hUvUP/fLF44ZOmXhGDRNCwpt0FBw4IExsrzcD5zl0/Qi4ciOvm+V63gfx+BJeZswBk2IoPSRilvfDd1lmwO99G2i52eIxwv9KUVVBcVofcDKVexJlDSCCcmebqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161673; c=relaxed/simple;
	bh=8OS5gcBu8m4VfIuRumMpyBOGfiiulkHjoVmZmwblqaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrvy2H9Omsipk9n4jyhLItSNgs/nKV20OsBpAxXeWVQ7vqgtAjn+jmavvJq/uITQV0qOHbTa9wgKY8Az9fZPilAwknt7GwtlFTV5AJLxNJZwDGRsW3PyOhwCfdW2s5lw8mm/gA8Pr5SHhEGgQqdIoSGB8q1nRhswSMcKVC+5ozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LctS8S3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVa7Fokj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LctS8S3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVa7Fokj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647ADTQG026485
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqpUp23VOHn5YOYm5ollIwpR
	X6JS0f/sJFyml0hKjWE=; b=LctS8S3NpxPKOItgkSmBevJE36oW/VP1hswOm8uR
	J6AT3JzA4tYS/qjkv/q9b/of80955lA+fMGBdyjNrMwhEMKDbWCX6Hi2ycy0j3PO
	CkXTIfIENNyNmvW28BanIU0Nqtzln1RgxgA2I1TN/H0syjJQdhB1hbA4opGnIO+f
	iys3662/QlDSLPAF4UgtBv7KR/fTwTpYASb+pISShm6EUm+JPU02AHb2NePBH31k
	PRHO9Cr3emS2lyrsASpeGAMj8lZvOJW/OHuQAd/82NgLS+0j/lxSSHE4sJiJL8hf
	GLmJKfQctXuFDWM1VibxTH63XIMLQUFXr3Nbk0j0wRyGHg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t25t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:47:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b4bebd2b2aso50329446d6.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161670; x=1778766470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqpUp23VOHn5YOYm5ollIwpRX6JS0f/sJFyml0hKjWE=;
        b=NVa7FokjNEkbZ7cLAkFQtkZQc35AlOBnI3gzcDFB64ELCTH1jW38w/wV7bPbyVtznp
         4pP66nK8Ez8d1v2wd4jCZvQ8iVKTOiHoWOOuIg4N9Phwe0zIJatSmnkP/4FM5mrhgQno
         W1ZNa0HG2wENIkNDNas+Y9zPoNSLhfTUYTxR5bkKPFc2M6iLcGK8LAlGDxxTyWliqqch
         3r3TzT4YwQHdhMG1gyxZje1zKuSxgsBX6X5XKd/SaYt/ZBKhlIgZ3dKkPTLCIeqNn3n/
         fPxakHfoVn6y61I7kki8RTrg/be74c/tABth88qrYSlSrQfMB2+sMsTdJOwnMIsBO9eX
         E5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161670; x=1778766470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqpUp23VOHn5YOYm5ollIwpRX6JS0f/sJFyml0hKjWE=;
        b=k2oBocbJ4RgOyl/a7DrIZ7fEaLk6Gk//dJRyWARC+gyxWQhjVMIvJspryAkIBso+3j
         QUdx0HRFFpqRX1wKg31xXtvCtAVIKnJx+M8DzBGpdrwLO/b3OhC5miU3eRNCxLDhzsrf
         g51u1hFhMM++xZ259jrlOlrcTpx5AFJzi1YZ09QBxgEbK5Fy4K0l3+GrMkISkcW+5MH9
         RIj/tChwNNMaGsDfKeZk6lfx5liTldd9rI8dKw04Tk4jEy0PgJmoE8343/bf4hxAiTCE
         Pd1RPa8whE0DmIRrGr5KEuxTH+O1zlk2TSSymL29IhOLxwqM/omigj/Vkqm3Z+VIAERE
         hfWg==
X-Forwarded-Encrypted: i=1; AFNElJ9cCzdryMJQwLyk5qcyiRI/x4S/+irOfh2NL+0iA76JyTpEt1aDLJXTLbq9TXdxpayvi2KrGbNaW8XU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/FvBqBmzZ9kmnrPcSIuOkvhdwhqDXeXtkQb3DMKwPvNfa2ET
	rWvSi5ghPh+Lz454QCWpYWH+ov+JxcJ3K6uNAle67cHVStt7oa1nPNqrmLNH5aHE/reEuZAf6IW
	E5RBNou8TiQ7xNGWCchb2Xkwp/Jg5DxxOyLdAuKddbKew4ZnHvgZLao0ARN7fT31E
X-Gm-Gg: AeBDiesZ+unnfuhDRGvDzhZMstGU91NGfAng6mY/kH4EpgIvH7B1B3wni13aLQgh8ae
	9/qNORUGKDm/xg8KZFC6o2mk5URXWIqeMvTk9TzSImos3MGn0GWcIN/LaExUpaFs8OxAkOz8v8G
	bswPt0pHALFUs4lY2FpuqZ1Dd4I+dqU5RodvspD+jV6mAob8vSYBR4Ip13994FQq/yZRjBbYByE
	1yJsjv19PiGzY50zFcz6C4dsrrP0+j/zFJE83+4NaPFiIAQgCW3HdB46RoOXOI9J+mB1JFiOGwn
	qax2zltVI+PKKBn7A6nisMch/jTKFNc9TSvuo39qe2jSjjdRb3yv3fNuO3LuHodB0v8pasbK6SZ
	nTga7Zi3Bof2zk/UavBY9yG+3ylrzK04LXzj15rlQ5Zk1maAu37sxGeipGyALOanN+t0huA/w+6
	SqKpjWEccr1E4f4oU4fLZpHG43rgH3FuSv5Lnz2JX58drPD7Umhj2KoCNX
X-Received: by 2002:ac8:5887:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-51475ca3204mr35949791cf.39.1778161669886;
        Thu, 07 May 2026 06:47:49 -0700 (PDT)
X-Received: by 2002:ac8:5887:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-51475ca3204mr35949201cf.39.1778161669248;
        Thu, 07 May 2026 06:47:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300b58sm57853311fa.20.2026.05.07.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:47:48 -0700 (PDT)
Date: Thu, 7 May 2026 16:47:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <lei627n4lyjxsztg4fcjji5xvjlp3ppbj2rii3uvowoqztsca7@t5jfgkx6itkj>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc9806 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rixed9tzK2MMLKL13XAA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: LpkQz3Bn2Cx6RxAzWoLS0-H9WVo3Ygd9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzOCBTYWx0ZWRfX4Zodp83g0P0z
 RCMiS+Mr6mw6wO1VbnRFnd2GsInhqroBCObhirMcDMvGRqLZWrEP+vIohZufSYN289BookYY7WA
 pEvW5Lo/Kc/o31++blUm/xFyaOV/tsj+vexoRZ6Gw8CnvCpkSqB0KQxvddfxCGpVdyDITHvaX9F
 7uAD2jKJd2D1di24FKdXOhua4uAEjGy8h8eMsARY/YLMUHZ5TK+mV0izVAyb0085NgSc7IqXyyk
 JCXOKl2IN8QeqWfNW3FHxtoBqwhC7GaQjydjn1pVq4VHnw6VCTXAc3/6Ts41Th4NTmQbhWG8E7H
 GMetdbi2yXAPOtg025InQJtXYQRJHuTeg4oLHbVah1CGoYGvbFy0aBkORFCmH1yxUR9hqPy/Pej
 RFXGaRD3Ek/OCw/UUkFuPkbfsADSKzAFoQw+n8R7Bing9JkB9Sei0YW7zbmoaPJ+0A2uzchtB80
 uH/ZIFGelVykPAsOdAA==
X-Proofpoint-GUID: LpkQz3Bn2Cx6RxAzWoLS0-H9WVo3Ygd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070138

On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index d9ee180388aa..f65b132004a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	scm->dev = &pdev->dev;
>  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to find download mode address\n");

Maybe 'get' rather than 'find.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  
>  	mutex_init(&scm->scm_bw_lock);
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
