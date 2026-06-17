Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E316A395
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732550; cv=none; b=Mzsh55Y3FdEgFd2uBLRjormqWrc509NgTBA1MUiLQDZyWSpG+pivtn8NGDo82qo9Zaan1L9TUPyDDxANwymLQqTPVcQ0x0aSRNiuXYloktkGV2j1tCQ4u9bOvlMILbdDaKPr4YN3FYmkjhSABYWD+dk/YmEGfAx5iefci4omPTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732550; c=relaxed/simple;
	bh=WQOz/FpowsZ32XqFFETVouryEa1F/0R8k5pJuBp1ezI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJuVrSEDH5O0E3tRWhqcU8AOjh2iX3GVpAYu09sWgM2XpPMQbeoECqhYtZIVE67jMKFUetiPF+LiK/oFdYGOy0A/1nC6LC1MbMRFn0jQGsXH2oi7fFeBpQbQNakycAztKEyOGCrJzBA45r6V14sRK7dsimD7sHRHF9Wv9sG1q8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9ted4yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stk+zsTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9ted4yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Stk+zsTz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHdCoG2845619
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IlNdZzz0mcq8uXSZYVq5G4To
	YroDK4RMx4Q0MAkPfKU=; b=a9ted4yrg3hbWO0fe20SEY24yFMeL8Rg4RkSB1uW
	shllfmmXZYlUeD1weroB24Lq359SQIx1T7N0P9h06kbBnOitnxilm5gU+ADpu+Ok
	/1I9SWnrJoCwIsG7WiahnMdUFbB0awcON2M9qM7S8mnzsBjA4ztNr/B1CpVk6o1l
	jGxSryWchma4Tj1kLYUdWYNuPH1D3++IcT9bazDUsD09lhIdGAxy9vxp4F+9GNv6
	o1p7gJrfr+FxW52cdoO05BjKfumWM6iyMufD0L+wqa8l9uQ5zliY+DaqEkNgHDbK
	VapWZKAUhPjxzPtUNnfpOoGiI0KLexry0obhjABJf0WZRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt51e6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:42:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91576c147a4so93193785a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 14:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781732548; x=1782337348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlNdZzz0mcq8uXSZYVq5G4ToYroDK4RMx4Q0MAkPfKU=;
        b=Stk+zsTzKqUaFJ8XPdhX0uB8hyr8o6JaN/i0vFzOr7eL1b0ifsnqNbmLjn2KVyscqK
         Nr7Kt5rDZJcb3zg8Td/qpUqb02QyH+2SVmO6tcCVtHYZqThVso6dddzXZZfGiDw5Gt7h
         7cKYrq1WBbua+vBiVzJfHvywA001n1z7hkbjg4UjjJu1llIB7nuM04Ny9R4D2b3KmSq5
         9/9fpb19AnMpgV1pENYc53fqB/7VjV+XBBJX+FmKB+BomJSZU5NvjdS65Jzfo3W+mm5s
         zANH/mqKmHka4VP+eaMQFN93GXhEQ14PhwYn/6fRcwyl8ZeEhw8cROA8FHtZIepqV1BJ
         1pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732548; x=1782337348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlNdZzz0mcq8uXSZYVq5G4ToYroDK4RMx4Q0MAkPfKU=;
        b=ZXKq0Tgkx+Oq9S51qut0lUjU4zXyedNQuRV1wUms6SfwFpurfsAw7gBIAI4n16m5vX
         RF/H7IW/n4I7to3aNavaT+7iMMke3RTGYONG/xs6W2ZzK9x4stGubdHPnzcwV8aFGv91
         dxRmX3EAwlAF7v05h51sA2nHQERZCNrQqTJhy76YfOBELXHHulFyPSLIV6yRBloNzRkq
         UzQbibq8Be9jRMGFd5zz/g3ALINwu7SRNqHL2PRKb6/6msQFizabBy1EH9rncGSFA504
         VnZqMVcaECrck1/CUOB3yG58G7s6OW8eZF7sPRkX3xA4KV9oFd0RhcqOiGZjel9JVbX/
         w1NQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sws0XcwVAU+pXuHBFMF1wldynOWA9HACqwHDUc9aoD3AroX5jkkjK36ZDvF3VtVTCBP/dEiL5/0xY@vger.kernel.org
X-Gm-Message-State: AOJu0YxRePA0tdPgCDIVv4UyuVItvxFCSXZ1roW7AXbOdxGyRpuHxqTk
	J/+51T2dUts87BG4s3O29Wuuov4X6uYAgFZexMZyiZd9/EkAu2RIsyXW69ciZmKmgdyicwbG/0d
	LvhXcyAzz0pWJYSEMx/Ms874OHnv3OV5ocC0kTUXNScBPIaiP2a6DlajPonLxeOH2
X-Gm-Gg: Acq92OEpuQGaVLQvHvTcksMUTdP/97WJsFP4r6MnxwtajdAHXIsX0DqRCfiP+kjLPRG
	NM3iK7xy1AR3XKXwS1KqEGapUp7XJ43JKqIenC/HjCm8vn9eXB4IF27crlOWDtK7ojNRQhFgNDs
	ru/SIPcqKa2zwB0KMQ61h1VWg0Bgv1KNnZKRqHRtis4n+8Lo5zTo6o5msrZ287nrbFzScNNI9YK
	KaaqDdxc1KcT85hCitxu78IXqkWNKQuQ12xCKStg7lz8uJj+Z9a1O3uaXtsp5UYgcHYut6VetXq
	4oNNn3JumkYdFISfUwdlctbMWks64D/vK14xrIdBn47OmM4sIhkiDLzXlyNsRYqdyNzGvq1YjaG
	t6aEXTtIs/Gm4KJVTe9fnECBGwBd1fAhI5joi5QiAkbXOelsVVTPO8Wlf5UumcIg5j4fGxMoYaD
	PkIpTrHxZxaDJgnPlEQ2QzJvxa
X-Received: by 2002:a05:620a:d8b:b0:916:180d:5791 with SMTP id af79cd13be357-91f25ca5afemr164289585a.2.1781732547655;
        Wed, 17 Jun 2026 14:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:916:180d:5791 with SMTP id af79cd13be357-91f25ca5afemr164284785a.2.1781732547216;
        Wed, 17 Jun 2026 14:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a02asm4737924e87.21.2026.06.17.14.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:42:24 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:42:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] regulator: qcom-refgen: correct the regulator
 type to CURRENT
Message-ID: <y5azvga2u2hyauqrspl7zzpmblex7hwdku7l3a5gumz6o2w4w4@u7ea7dfhqsb4>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
 <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-ipq9650_refgen-v4-1-c505ea6c6661@oss.qualcomm.com>
X-Proofpoint-GUID: Yq6QRrdHHK5jKJSEFFzUPqec5L0iD_N_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDIwNiBTYWx0ZWRfX/qtq8Mjgrq8G
 Dj0d+1p+/weSFpFzHwU+99IAGNryAIF7twgjcFP6c81/AKGO0WzNLvSKRUnm4lB446EX8lCjfml
 JV9I9yO/dwkzJOLK5RwpuMogWQESLCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDIwNiBTYWx0ZWRfXwUNarU3mtSYI
 np4l7q08w1o3uGmUA0O6gSM9O6RGnfy4E/Uwsz4Nnh/rtUUuSu541E9TxOavaKQWMAYG1Q+q9hS
 n0t6O87qkQsBQRXpNjV5qZNR+8uget4csuoNRSV5Dy5HfOf0bO5JIe4CqcqwIQMghztpoeWmr9A
 AxoZIWhjNHvRn/omCIXrRk5G3UU/5KyqNdDwlZTXQiJ9S8kvKlXRfI3LXF/9KsNR/35WoEpi0R7
 eXT8m9YBWVXIV56DLbciLhyoDCq6mS6kEplx6bTZ6GerOgE7WevYeDKFcVfWOG2Rh9G2guGaCGw
 /gBrcYcfPo8xwS/M8mNKMMrbnGt6/ZhQiAxMbwhlRGT8IC2PA7i1v75ha6sAjs8GQX4UMXWCRdj
 vl0xt/0LmrKmT2vwTlxNK9nClrF3qUwkF0UbcZ2EiOnZWRgmOQNJkz8x2VSw0m4luv/huJwI3fx
 sxWN8ZlPtNCchQ9ZYRQ==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a3314c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tQRUmb5bEndE2dhV-mAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Yq6QRrdHHK5jKJSEFFzUPqec5L0iD_N_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170206

On Wed, Jun 17, 2026 at 11:08:43PM +0530, Kathiravan Thirumoorthy wrote:
> As per the REFGEN IP team, this block supplies the reference current to
> the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
> to match with the HW behavior.
> 
> Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
