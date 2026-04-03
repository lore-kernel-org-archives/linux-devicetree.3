Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853042C0296
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245786; cv=none; b=QOP6AJ3MK0QAmNXwCuOLDGf6JStc7KWL0YH/z+nsjCTzS9Xz9YJyNXjdk4io/aZo2Ms/rlnlKjFz3R9XGiYSKIIwO+kW76P53rtw6i8JaxkGY4NPF6su+MPmliNIngsMQjxvyoS+i0U50onrGBudWT1lqqpA0HiJo0BWxQ7Y74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245786; c=relaxed/simple;
	bh=kSzjHpVBgLkoQBFCrkMSJ9P4sxEwpcm0MFAoPP7mSJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8s4igkBAqYOkXic9u25WzB46w1yugLh2+57k8s6f3NGwrleOk07d4rKkfbe9OyzUG5mfCkCJ9FNDEAoHAGerZ7T+u8g6lrHhV4tD8kszX4YtZzdc1sP57OIsT2O4EEWY9nOcRDFFT4l0nXMPtu/y2CZx3Gxbzld5Qj+nrTc5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW7DJwnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOtmEVCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW7DJwnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOtmEVCF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BvmkA3780331
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2Xxeuk464L395VDBZXO8f8G
	/3v748w3PxBnfz1YgrE=; b=jW7DJwnZ07QJQMTGtgh2KZgVTo/deEGkwqB5azNu
	GskyDhnnyp+KMwmRqAYlXuzAj7hzKxuXwBz6N59Z6mirxJPeCMsiG1UycqhnmPsd
	ThtCaDXotLdZV1HgCkvdKSPESPem/KGBBGOOSGvbEOPlE9wdU/eOum5u5FICjYnG
	NQlnrq5pjHzBa1UKiuDVkUjoG4PHGosdTQKleHuHR8KVVH7xKCoJjP2iR5Jd1SOb
	NkAARCKMM7xdepK1bdl6ELW6ReK+6S4GXc22nh6ujvx3yIRNSYsX/zkTkW1Eai77
	tiLs98IsHBYEI4c9FGcvu+LuGEb8Xdl0SkuLmXYvBTzzPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663jnb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:49:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so60039751cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775245783; x=1775850583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2Xxeuk464L395VDBZXO8f8G/3v748w3PxBnfz1YgrE=;
        b=ZOtmEVCFiT2il4xmRzNDctj397+cSUoM+ySxufmeaN8t0XI6b2SiwgMpk2iFHVG7P4
         jm0uet2tl0c07t5IdPaJ43dAP24QcH0WXTZMwMC9H+vxJJMnoIN02uun382OwIIiGdbL
         wzXwllSySAdf6DSKTINPG+WKQyXDcc9JBA0oLBt7vkj2jfXR9sOtIubacH61h5LNKn0x
         W0KcpR49r7I0E/EMYzBv0bx3aUfGgJz+ZRVhoXWJTeoY+pa7sj9U57oY7Q6eBWevWOPI
         BKVvlAoRg90uHuBLzA7IRfgLBouASUzW0AiLUXbRZM3y091FjJsmEQbYJWd61wI8+e5p
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775245783; x=1775850583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2Xxeuk464L395VDBZXO8f8G/3v748w3PxBnfz1YgrE=;
        b=L+43qDr/BOEToUt5Va3DKVCePUrATToH9yEHhRfuH/nlbn8E7zN50AaRcQbRyIMUrP
         /9eFTEp5cxUJqOYbM+lOtg9bzZcAPfctPVhhqM9xsJLZIqPPlJeA0TSxHuJUjSXHMKZG
         lqxJV3M+nYSri529YNh8P9OVQsQjm4j0Wg6mERmhC9+LkFiDzVi2kAuIsxaX1E8tQ6iZ
         NmHqv72NayBBorhypsPIHpZ0aT1LVVC8OpZBdrIW3khu8X9Bx927A7hpdavFsSZEBz49
         TFjEfLfmiK5hvHfk7P6xptNpfRxRNsmuNJ/mM2dacI0iXYABKK5p6OElUGDXkGsddu6k
         cOFw==
X-Forwarded-Encrypted: i=1; AJvYcCUqtroAe+HJyh13nsLp90/a8MgM8lnBZhPHPESu64ddUmWhUevJ5NfjPYLUYetR8JUMSVS3T2Wi+S+B@vger.kernel.org
X-Gm-Message-State: AOJu0YzUclfkX3wnMl4OCpTpKbExUDIam0Ul32tS23Qg92ps8XOpH2w4
	NNEOkSSAHjEHDsYOVJEJSBfsbq4IWmNf0Bl9VX/Wtk7jHSd71oCHjzoj08031pDf6HwiNwVjmRS
	6p9rJAmlX/DGL95j2I/AFGMoqRnnBNvLRH6kIQ6woWm+uz89xBY2MzG78VQj0+BQx
X-Gm-Gg: ATEYQzzzNwZ3UEVhyYDRNyf4POrIHSsHxPEMNRGnhmOsGi7+IAMIUUigWC7xSAam6Wq
	EOO3/iqTotoOHsRsw9bdM9h7CPAaUR/WqBI+Z/zDNP0iMKtdSpAdn+XitaEY45vXlbUWqVz3v0u
	DBHIb5L4JM0Zi/RTYhucP7S0h/qZIcJZ+n2qm8mfov4DUfjc7yl8FcMh7EtS2Pqk6sGqm3/Z756
	HJhATQLOvj8rctYDX7MKBGfbgBK89TzC4qD2ec9qMexTOt123dygBEaJ8nPU7oWNS7djzpXcEGc
	KIJsG86w4Ux1Ny0CKct8wPJZ8LX3YZfYJyLdxkJd4oG4tt9gNoUdaiLaS48ZH5G9gVU1hnkVLFo
	vxvgGV3ZHpsdGtsjMNYnf2CSsTZrfZl7x66cEUylG6FgIVhzw0pOw8M+B4IF9hqqQ/7cD9kI+1W
	YRxvnOWFl1LEWeXQec2DJ8miGni2rnhprP+0E=
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr57917711cf.48.1775245782832;
        Fri, 03 Apr 2026 12:49:42 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr57917481cf.48.1775245782385;
        Fri, 03 Apr 2026 12:49:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1652397e87.37.2026.04.03.12.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:49:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:49:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
Message-ID: <qqtlbvkozwcyootbnuygfazrdaevzb3wh3mrnd2igs5wyyiv5q@g4lzdyhsvwo5>
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403120753.105869-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NiBTYWx0ZWRfX7UAyKsuXOy6x
 Sn4DF7GQtBxW4YIEa0RgcCl3m2fx/0L3gtAu59S7I/kgHKtNAZZE9hLzZ0xjdlAh7xuDeY+kjmN
 VUfeeJROJ9SeGNn6YUO3vru5HImJdkUVRbpSOxqrOnob+Wfnv9vb8o6f4R7PltI3BDP/qrFqAgy
 eIbRSWEeayC6BePRjlQBRtpnszKOCz48LD4pRFGHD/xxQrgLZb4BLsLf9OUZt9vt1EwGrCskivZ
 biyi333u7rSmp8EhZWqdBq7t1eYZVEML+TAJBTnuwsJmEckEzGybyghM7dHlG3bneznDTPhmfsU
 GZL5exJCB7wocmc0lTqhjP6AFK5+AP+lYqov7dqr9eDXM+uG1KU2yReY5bPT+wuCsUGrExOGmDQ
 4C/5UGGIDyTNA+Ca/h0+wjXjJXk/sX0QucEBy4jnbKMJdtxQPcX+3Y+3UYckRkD7zhSyYGlNhBG
 1Ht+ST2Hox1Olhn17MQ==
X-Proofpoint-GUID: GTN0kIx4DyePaaUCMHVP4P__YKD0RdyO
X-Proofpoint-ORIG-GUID: GTN0kIx4DyePaaUCMHVP4P__YKD0RdyO
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69d019d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=7XC-JGpFEoj-ohNN7HkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030176

On Fri, Apr 03, 2026 at 08:07:52PM +0800, Pengyu Luo wrote:
> Add the FastRPC node to enable offloading compute tasks to the ADSP
> via the FastRPC framework.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
