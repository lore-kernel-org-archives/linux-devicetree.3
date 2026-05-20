Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18273F1AA7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288918; cv=none; b=Ci98ZT7bmqedicvDzyWROdoHckodff4RWcX5Y5ZCF9BUWSdJ1k8eCSUnZBfEHvZobTHJV9V/0O43PwEChyGpTbhxyyq9zXCAK++s2NLxMBw41DlcwQCnLpR2VJStaa9aiXCEqrqu6G59QEfxJfkW8h3eY0c8igm06bxd/dUzpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288918; c=relaxed/simple;
	bh=bsKrfT19/Dg39eGI2fJEyocjyeUDqPaBoUeZKAlTGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFZHm6UUx5UTJoTOmvdUwo1o0nS/hiyeontW4D5/EJPNMvmdSpEThSj+KKgxzun/RllstrhW6R9DHhqjAlzdaOXK2bWZooT18gYpZ3eyGbqaBNxD7AILXs+IYJxCy/CGo5LC0+E/5CXlPubQ6wUUqWOrfCpjm7cRkPf+SE0ztL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QL7ttgxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfyR3Ch5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QL7ttgxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfyR3Ch5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9ls3e267212
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EfUowemClkkBeFHarqbGwft
	5gIE1tGNjeNlEZjZHi8=; b=QL7ttgxpY7pVF73M2MCwtN7yEXbvSuwEzZlxb54c
	/cg71F2TdDRUT4fTm6azGpHHsdgrhIIfzcMqZ+ho5HAKvZR5mcnTDNSyLFAZyEPl
	8Pql3vy8gNiG0rOrAIojYEENSZLpQEhv35qX0R/e+e3IVBkC3eOGfY0dagNSCWPo
	9xPXuQI7dzI1dSjQ4erb+9yoEXh9HQ8U5TfYwh9iTFj9btPRK22Y8+WDaxa5Ltay
	TLNUf6gTfU+GTcC8ila+ss5KN+nPFp7YZORRiyb+iAODxjCZa9R/bYNl4mYzYmZK
	9R5cL4AiZAoLqi4NuP8F9wyK1iiUKptZ+473xJ/r4lv35Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxs4ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:55:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso111119571cf.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288915; x=1779893715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=XfyR3Ch5JOnFvcDnxHpuUqe2yb6d235zQTgbVUy0Rs5laTQgifQJyYMO+MNXDzu0mi
         afsg0D8Wg1sq3chMWVuDZaK/DaupxPCyCAAS4gf4DXCm25585QKEanrbLkRpOAuSXGtE
         rZh+lEkUs+VNsqO+r6OD5jhe1sQSYDARkBfnLjZT/Uk3subFNxDEfhZ+O5UthCHh4Qff
         X7fX4UJTTrPS3R5OYIFVpmIHq4UAbLUGL+uknQLIz+/dmoSaDdQkJphv8FofUTO5nbks
         hiFymGhBOTukYFfhNZgTjezQyxuedySUMZAUl/DzsQnK7bQUSOG0SIgtom2Av+5/EKrm
         f/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288915; x=1779893715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=as1flVcXRzFV/WhtyrOAtgDawAN50ELva7KwWWuqQNw/UajZAFAeZunS4L6EJDLOfo
         uAqVXzO2KqjnlpHdq0GwOQF899cue4A2H5r0oD7ectvVp6jTJ0kszCaktov8mC2eRr2p
         wyfb1IJ7a5qhSdxAzooUwD5Dcr9oLcRcMUqu1lr8ykFJM0z8fH0lMLkPIF/eVkfJUlXN
         o/5by4bKff89y5h8XZozjojae513bftrlksxhe66XQ8RJ021gcoWLUYZLmGpnXSFJ0tU
         JT/L3I5DqOfZKZYdX5Z9liMdMOndXan8nuOxZiT1PADGNVriXPlf64A4SM44TphqkgEn
         bwpA==
X-Forwarded-Encrypted: i=1; AFNElJ+LdJ2a70PEfQUlR6vGU4co3y0vEGlKiA1bq4s0j19hEjEGtoFbPcjfGwfMAGTAy/VOG1fKF2DmdC4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzVH0n+Tf69Pz9sCIhCmFygSNso69E/r5tBOCQDfJaMchuMgubm
	1g730oRFDFxC6L2A2kjp0oOvNTgZBsuYZ4apf+8c+PBVY5awZZHW5fiDykFV0DktOVZ05FYCGsv
	OwuyNXSJ/2ko6v0T8ZyyOJs0r2aclDz2SBGuDmP5CghsT/9h4x1FtkKVGWGK9dfyV
X-Gm-Gg: Acq92OFt5/LVwBS8qmTaj/quCHk5b83xhks1zzxuzqMcHbH0mZFe9Y3U5+2lUN/diuc
	zTwcnl9UhfsqVFKcpBqa0HpDMdX1uPxmE51VVUampgaEiyH/ZVKJBghFRvwIsPysSbF7utJKY1p
	wGVfublq1ix87SXGK5f1OSj73BKQ6MI82c4oxrTqWulo9ScZ81f8qwR4dcDbg30pHKjlk1tvtzt
	se3malmKT9SsGCN8R1U6q6jlv+aTZEGeyj09l+E1j9iNg/WkRDkq+cb/w6ldsUX9O5gCU+j/3OW
	9mIrlOYahQ/e/PIyIXTj35i8QhPD8eIyP1XhdF2lKdstZEIcG96S7oFBhENFDaRtDuHlyd16NvN
	XiI4dQTCLBh0rp64f4QJdEPFl3/ute8vZnNhd1UN3/BOlz+sKveHq4umT5R74RgENFEDaZAZrhM
	iu5HjYmlxV9T7etqHZWNtOjn4hKbpYrZvr3Fl7x2dNEmrSyQ==
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353075261cf.46.1779288914884;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353074691cf.46.1779288914396;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm5049114e87.41.2026.05.20.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:55:13 -0700 (PDT)
Date: Wed, 20 May 2026 17:55:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Message-ID: <gkawm2psopuodlmv6kw2e4hdud67ahgnpha6jxmyp2bvwob5ph@7uv2jkopp7z4>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
X-Proofpoint-GUID: W3QDp3R17MrlSNdPs5HiRZxjQrC9D8fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX6fPCyIaWrQX6
 ugGohvBtI6x8RI22M4jP6DkYAXuEGhF54DzgPyQ0zRlvW2s5jzQrKaROqvIIgMP9ESvCCvDTx6P
 XwnDSxlhYAP9+c/TI2UT9AVgsmAnnzgaSjJlK0uhsWosSP1lsqohFU7ZmtZN32TFW9YhXfPdey7
 3j6axkYdcL59VCoOgikEJF/WQBb3iym9ky0mWDg/UPU9jYiovC+H7WzNG4PzmM0tna+6AIDepth
 G80Q67QzMLoYPVIqi+vAkX4GDJVvu1cNvyPXXDRWTHLPar31QfrZoGnWaYWlyehWmsGb/sYuz2n
 GEQYl4c7k1q3KDQfj/PGD5/2AtXHIC6mt25lhy3GxDSLsY+n+5hP8QWwtoxanWmGTiUWjBsxfQn
 LAzqGuqeblynJI69+FcMozZf06qI1ywibwGgslXaG4yYqsAlvEhRiENRMEF226/BNuc1ywKD0+O
 EGXppC7SXcNS0aKUd/g==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dcb53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: W3QDp3R17MrlSNdPs5HiRZxjQrC9D8fL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145

On Wed, May 20, 2026 at 08:08:06PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
