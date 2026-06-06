Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB63859D7
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745523; cv=none; b=emqYIQ5UIn7FcYbtdQ4oFqyI5k9l57rFgd+KhzQf1p1AuztTuAI5Q13KHujtGC9/vQ1msPaeSra1FyofGGouEozkuMhWqD14BrtzUOk3+IAPKrrUsqlN3pRBd1ZSNg+r1boEa1jxKgyq2wZoGu6NAI9/bFof1cwfS2v8L0VheA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745523; c=relaxed/simple;
	bh=qzKzfJNwhUcmU4gTj+upXOKBJeFWIsGwBWcoGZfnOuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzLDTOS594Nym2u0aodZaswaOswFg6WekQYv3Kt5eOUoZKcMRGBoxUogRQbwrhFW5f4dMz2NvXYrEE/J59vzZwKBEEgm30Nu2xtm6VXT9b/XgsFCZpH0muJR/uxSvDc7UsD/WSe6UHssdAzvArSLe3fIsue7LFr0Rmpicblo9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRM1kJOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOCwKpVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRM1kJOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOCwKpVF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDqVM1231326
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 11:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BsN99lzTPiEul/ZpmdaPw+E2
	/yyTMZ0opEwuAf8gkRU=; b=jRM1kJOBGeMRvnW1jkSBKYnf3geD/V/4NuA+uY1b
	YVIaXbBBzMTm2NOENtRu/xc0F+ng6WIIHqIL+PHyJdeVO27dY39FFrC9dS+pG/wa
	wDuvusqzYb1tm6kByd8mfxDH6urtIyv3+D51kAhgiJO58M3OU9apMHr+PauyeWSm
	FKL/jWhQ+hBsVPFgvwochw2lErsC1OmXhtOfieq550xIca6/0cmsHwNqrFi5x32m
	qouuhsC/7tEBrQUTWO9ZH77VyleH4pZ+hrH+Yds/g9rw18bND5lsQMFs4M28SWfy
	2Mq1hAqygO1t74m1pQDmJdOXxlgNE3s6pziq4Akj2eLRFA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgrqsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:32:01 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1773355e0c.3
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745521; x=1781350321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=ZOCwKpVFii6zR8VcUNw2IKNQ/flDus+L9fXMx8p+YDtJ6ZkZw4CYGzu9OaJcExKBov
         q22K/6ld/77ULbenvLFZdvtPGYwHD5yHBrBusYbaxSip0r2KVs513mYTdmYiD8LUKHv5
         9KxV/LBKz/LeJlbTViSY1k/JhlX5AUZ81QKCL4fYom8ldareQPVKgbkXKgVqkXqWBE7/
         z+wyi/4/9jB+EOXw7FXASfU6ELB+5we8MKVY3Tk4kzA0yjhAtO3wvtjE6xaAz6+Ye7eP
         Pi/rzQxjxtj1fAk8y6PuFNhDOrz++kALJuMgixNADhPTrZEBTY48UNKpGhw+kmIyc7eu
         kvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745521; x=1781350321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsN99lzTPiEul/ZpmdaPw+E2/yyTMZ0opEwuAf8gkRU=;
        b=V2FlJvc6R7hNT33R7jFl9SnhqKg+tz5LRRAQthiCDGUtdD5R8XTklQzalY0RmX2Ow5
         7/z7zAheOSrfk2Wp8yp1LKj2iZZ2sQGEjm/3V+MGI6BXM6FFm3xnxRAsMRA9GprJv4RP
         7eIqefXzPoJbfGwm7QApUujx7+pugPuMr5W7vhNTVyHc87HT+l+yk3QVTN3neY9Vqp78
         VtySqu8SVn+nBcaJr0hZ9FNJDz46ozn1sg2UkZ2hp116t2FfZFEDIFeXnX7zCoSrBOAy
         5Dnp86/vGlys8x7MCBFwiEhh2jPM67qlRhs0X/Zo00X9Dvuc+OSfogD/V3EJ2nz0hq97
         e2fw==
X-Forwarded-Encrypted: i=1; AFNElJ8egGx2K0XnOAIeiOAn5a3L/Se5hloNBBB676KnzEv3Q/yTXrV/NwyLmfsCGWXFFKhpZzXrTvZMdUql@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhf4c8SadDtivOsfmWy4f6V7ZvrzfMYzN0VFIpwznPoD1ShmPO
	/UOkCOi5lN98/hjpVIltIcjdpjw1TdAVwrvO7fjqIf5FflBHL2xOuYmkh0jQFUZTfV0MMqw7pxz
	qaZXjlCoe3anTNz0gp/X6aeVhkjh+oudS6TmtlDfKWtzAu/JwyNIP9456Qy6Wbv8U
X-Gm-Gg: Acq92OEL6eNE3HuTzwkmKRyfaO8NGYmVvI+AfRFWnRptjoD5ye7Z85jSF/kqpeOqJs+
	ATwZTrl7pkybPVmoSQETdKftcKQdFWj2dZHhPjKLE1oJvSvQCWOANh0zzyvi+fWf0/cO22ZRlZe
	MalVhl4GNPY7GEufPk9OX2OyWLaPYt5YyAUKM/TSisYahEdkg1kQ6PdEOhtBBLd2PTcBIagDj9u
	o/EmXefxSCfR+tNlRTaq4S5oQyi+FBIL65/TGj8PMyxFcT/gikVj++RkaXkH+bv114C/CkODicI
	sdPj17hp+fmqVH786378ah3ixvvrF+GuQUeznddJZZGH7JHaBnP07v/PpmJvsMIdeLwJe2GXRPG
	pEJIpVhNHwfXqjvUjs2p3HsRWsUWRsLs365DquUPIR8vjiaOWCxiD457P2MhMN6maeZxW8N+w2y
	X3GAM7tnP1Cg+K+2ksWLe8v8pQwb1Y2fpenmVVJ7yhcbgklg==
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588585137.28.1780745520791;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-6feff81b7bbmr3588573137.28.1780745520387;
        Sat, 06 Jun 2026 04:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm2415672e87.75.2026.06.06.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:31:59 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:31:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Message-ID: <aqthrh2kj4rerszww4vf4gp5f2f24wdreld6ot4w4kmzujemya@ftoyzykhkzmd>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a240531 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Cln0oqHP3b63J93R4qH6HRXxGrLNob9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfXzs9a2kECFg4V
 nwunf6HOL5cOqY2ng+Hnh2lCrhs5Gt1eEd3ugnrvSthVDLp4apt2WfgyTCvJyJb+iB3iSNiJPpr
 wdyKRxFEFb6vWXbi42NQbdi7/679RaPBO7Kpf+nAUbR5dS6Hs7txjGgcATtzqgyOOP6p7ifquAh
 xuEbgWfwzsdrZbxBpOAH7X4JuWmHrUDNaVmvLYLHqNReUW7DncXKLNnlp7pBN0mopttzFLyBndn
 +wfuVYqjGZaKsVU+2rG2XJs8tOk/IDhRqrFrW3W11//vCLNwBUqjMNNR9NXHb6hDOqqxUBbKaMV
 jcIWhGyDhrmIIaia7udAj3+wvsNvaRLXiRB9KPD+GrWNU9Utdo2UVkKrJSDyYQI1GtJm25Y2XOb
 bZLvt8tg9Lt7DwkSTeEHFKEGXaCPtFsWbkkBpms9aADR58uhWbSgSfy0CU2ua+ezmUGUdsJUk80
 PLRxl0CJHQ11mu1e0Vg==
X-Proofpoint-ORIG-GUID: Cln0oqHP3b63J93R4qH6HRXxGrLNob9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:17AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
