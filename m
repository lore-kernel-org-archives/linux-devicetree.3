Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F35449EB0
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168560; cv=none; b=faIRz3+IJgWgwN9xQOGdW1Q13AoQZ+Gxnid7Js7AlauGhJfknFxfvAuTJL1U4nzKDOXp4CI5HdzXfyxj1aghKDyoGdJgo0HfQYhLs97+90yoTffRLye3Nx6Gl+1DZhb0cn+UROQ1H+1GEDFOLJ9PDaCFT8G6CapPk5gRP/zGGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168560; c=relaxed/simple;
	bh=bDEGHpJJMjUGNpdrm6oZzLvuAqWrXFR6LT6b0FoyShY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSntZV7+wkc+PXKBgP9lLdJP0wvsrjlYJWngP1Ccc4RrgiUGN8NdTdQ8LEfcqdqh2EX71Dn2xC53l4gVd9bCppgN6oKDIqR6zDZuy1SDRSBm3oTaywk6YLdOVlu/ycc0vfSywOo/xNutLf7V+2ty0t7jERpxbKp8MEqAo7Wj/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/mPlGnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCyPKZfw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/mPlGnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCyPKZfw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479pAA9026511
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=; b=Q/mPlGnWs0ZtyFhW
	Sv6EoVqU+Vb9Yz6d++gXgtCGfZlVvdzSPCDyzgF3TQaZ1fW4hZ7UJz8hW+5DfE/i
	wFcHsgOGBSramZmcQ2fcQXypaC15q+WBkaX0zi7RWSjz0MQDnjavBXW8jSGtnX2d
	3Uh+ihQ9XmI/IGDKPa9LYZiZqglFU2Tnda19CcdDpNKY59zLzQ9+kXn8LcIRGKpC
	nkeiTKXUWiP98lBN00gHA9NXd7qLn5cRlApcM84XtLtrQ1MWxkfnZZfNBCYFth+G
	gPlTAOKaf1ibpTiaBRGjy/jFXt9i65JBSfynWHejUeFdyRaSbB//a5efNsmLPvvN
	XMthlw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t2p3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:42:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7c904d476so12237155ad.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778168558; x=1778773358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=;
        b=MCyPKZfwzFf5fiZnkC1nrieL8NFo/J4VC0NoPebQkFFC42YWsR2+NxFjXV4IcVm+2u
         8M1sTrj+5HOdrh+tRsQCCe+6tglVJ9bjQUNz/wIp5Jj5t3eRFWWrmDLRnso7RZDIS2r5
         tiFSQ2ut/QYrsz9lcS+xA4HSwe440oza8kVVwHJBG9veiGIAFNRBeNrfWnO6qK99MSTa
         57VhcvOtha3zuIUW414YwGuqO1VIy4hL6Irp7eoJ3+3LkGu7rvYWXg00vf8byOJjYQhJ
         6dQ+J+Hu8qkVC9qiQrm3gAbr0qhCxeS5Pe6relEkXGL+oOJDMHm1j8XFGO1DSpcZlDdR
         KGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168558; x=1778773358;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK8JA6xLLQG4xNqFkeo5i2J3M8AwE6anH5GguOVZrjE=;
        b=RLN0QWAsH1RPMvCscVsdS+IejeSuemjS3fD+mZ+gv3mEt8m2f1/2kJ/Ho96wrKa4hz
         sPA1MLflb4yfOFpd3cRLVvxBpH994ia0toTh7hQWRLgLO/tfZ3D5z1eToLiRPbzGzk8R
         AzppacE9m8NcihZpbKLtx58XHQ6tAs0bsS2LJBdtwqoHgzroDp8ZvKXQAIOfEjBxSNl9
         IJCV9O4yk043SH/HgAE3Tqxgy3zNqqfrphOPQFTZn8dWYhkmQOQZEmpUiDnUS9o4HbW0
         pffOZr4OUqFpI/7e3H79ilyFuU+WkwxcSM8LHZ1LwwnbcCKLabNcPmGxzooGbRGSx2k+
         qedw==
X-Forwarded-Encrypted: i=1; AFNElJ+dpmLRSbotWsqslFhz/tw81sUCOVwujHSz0t7TOLAwSy6qAJzYxR1wBz/YUaLlknLOn/QFk/AsSYul@vger.kernel.org
X-Gm-Message-State: AOJu0Yydrp1GRDQQXwL1HtNFSLJSPZy+6yQTrZrLHpPqFpGBXdsRABIJ
	LUJQOxpugc2j0KPV+HRl3sxNVQSvXei4v1v0XkoA7UOcqfBaDBGKB/O0VSvJapIEewWYaq1RGER
	gL+IMRGOYQMxDPFFnELMzBPmJwDLYay62jHrG/HiJjVTEfYunNUZMJbf2esCDYza/
X-Gm-Gg: AeBDiesGfAoRihCiQTZgL0kBA7CO0mZ+TjEmO+B+w+I7/M97yPZ0p+6W5xrcM8rpBfQ
	DIbHFMm3cNRzun+AX6ghv5ljAhQR54R0wFLIfw4OY30nNMn7k4naCUbVpG+VTwipq2ubEGgMz3B
	g88mQmaSpANgMFZnEjHO8a9yJ6ssDt6/fiGR1lzlcQbLDZWNXo35bGtKMhi0FMcchPeRkwGbpeB
	/6Y6C5FjuuUmMVEmte2Y8sGC5jgok5GmqLY0pEMl4UNTqj+mYn8iA4kEhOOGk4bTZkmhE02lIs7
	SaGopsdyQeDUrtd8PThSKmIXjoxl2BBIAg4JsSiQVxvd43OT6YOAZn0FtOPdrNNYxZK347NNpQy
	jXox130TA+Vc+qP1SuO0r2NHmeZLFPfKnASUGI6/GZg8qGfmProZdtfHoG8lgEKcimQ==
X-Received: by 2002:a17:903:4b0d:b0:2ba:4749:c9af with SMTP id d9443c01a7336-2ba79ad0c52mr82610405ad.40.1778168557619;
        Thu, 07 May 2026 08:42:37 -0700 (PDT)
X-Received: by 2002:a17:903:4b0d:b0:2ba:4749:c9af with SMTP id d9443c01a7336-2ba79ad0c52mr82609665ad.40.1778168556426;
        Thu, 07 May 2026 08:42:36 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae75575d4sm1173565ad.19.2026.05.07.08.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:42:36 -0700 (PDT)
Message-ID: <a01f4b67-847a-4e46-ad35-856a437adbe6@oss.qualcomm.com>
Date: Thu, 7 May 2026 21:12:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
 <20260501-glymur-gpu-dt-v2-2-2f128b5596bb@oss.qualcomm.com>
 <ecf6f144-0873-4f75-81db-c11f4bbfa679@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ecf6f144-0873-4f75-81db-c11f4bbfa679@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fcb2ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u5UU4oGBB7bzvuaK6rwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CjGEL6fv0ZINnS5XmE2cNS63NYBU2Mq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NiBTYWx0ZWRfX50+xu9ENyNix
 Oy4JpusWBAf78dio3qINEKRpqrWXavTh23SAy71GFM8HV5wZoxFhs28gxhNnrWyX31YRo3j4qCD
 pVOrlBuG1v9/zfOV3FOZl/gk+GcomJ90KOL+B9H0jAS8jZ7dVzgLLmXBl1hGtqpjkcqJ3J9xg9h
 HPoGl0H5/x6kV4dLNwLSK+VIV0GB+FqpaHhqeaMtE3a+HAieHSR0MRorwX4voFnMUovluMAizSY
 Pt9NajUqOff5gkxw28HsKIdFRYTQp08ztisxbt5I985IgX2HIFSO07AVUpRE2FwI/C3bO+At6j9
 Ajg2Uu6BvhMcnA4L7g1JTe7JjZ2O+IhzoDDDoVJlCVyxZGxtk3tT5iFPZMKdLcn3Xfy7X2rBqMU
 XBUwnJQbTJMXFu2qR9AawGMbNdvN5boPjkV+hycrI2eXoTlIOYQkpVoaFJxXp0rMG0w3sYWncee
 PCbJo0xeGuXNDzQnybA==
X-Proofpoint-GUID: CjGEL6fv0ZINnS5XmE2cNS63NYBU2Mq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070156

On 5/3/2026 7:44 PM, Krzysztof Kozlowski wrote:
> On 01/05/2026 19:10, Akhil P Oommen wrote:
>> Add the interconnects property to the common SMMU properties and extend
> 
> But why? And why SDX55 (or any other device) has it for example?

I don't know the reason why this property is used in the recent
chipsets. Most likely a recommendation from HW folks to address some
stability issues. I need to dig the history.

I just realized that this property doesn't have a user on the smmu
driver side. I think we should drop this property from DT for now and
bring it in a separate series along with the smmu driver support.

-Akhil.

> 
>> the sm8750 clock description section to also cover Glymur since it uses
>> the same single "hlos" vote clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> 
> Best regards,
> Krzysztof

