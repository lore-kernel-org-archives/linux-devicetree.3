Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A42D7D3A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718311; cv=none; b=oRnFotE7IIKYb/azQeDgESb+JDDpU8G3XTa/V2cr5xzIVQuZxn9tzqtJL+5xRX3NaA9qxIp2Kto/zWFxGtTPDCz441sauE/mGsKnNiz8M9hHksoi0+Gqjc8/6A6DvJJrjJ/cllfggCiWX9Key+1B6mITlqSzR/ftIkYh5EN0HAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718311; c=relaxed/simple;
	bh=HD5TVKcIUA3Vs9kUbCC9h69ccSAxTBy7PSs9IMhxjQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er1BnZS4MsLhv8z5+5TTnzl/OoxR56Qdlq6XWSPFoh+SzFbZU356KGK49czXzegKj2fJr/tjPcsNqfbJTsfU6W/M6shpU2aiA93vTtWeM5dHA1kD4S3NlEJd8IyFSHRWZXgzSQ3wFFEsC0ZtoPhADyPIFrV5iCHds0lVlofShYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDi6ZzAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtiECJ/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDi6ZzAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtiECJ/S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHCqZR3015371
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ShdYyf7UWppTknPbWPh0egFT
	HdBn9gJPWfCvL0VBpLE=; b=YDi6ZzABcdZT9DvlowXiuNcfmZ9MRpKcyDxYTzV9
	6P0BK//xT61sQ3KPqwE6XK2+6Kh3qIYa5Jk5Iws78Pg0SJ1EnHCFirLer/4KX1E2
	atRtT9cFAc7k2S3AxeKhMyEBN3vftgwIOAO00Jti00CJzbdqr89Nc56msZMo9+bA
	92of584g6/TUS1tFZohBEOn1WsHisTjClMOBzRbcXmPWuhgaAmdNPHqCv38skUe+
	6Rj0xrfq6pbBkHOAO1S1Lx4Vgu/p6DF7kmJIKCNZVqlU8QWoWan0hWNL1NNnGtur
	IC3giAxMRo5p4YXIygbnVylqTyI2wujFfQ8vMm7ruuXofA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukt48u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:51:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso19559901cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776718308; x=1777323108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShdYyf7UWppTknPbWPh0egFTHdBn9gJPWfCvL0VBpLE=;
        b=BtiECJ/S9P0TznyaiYnIYMAo8sqIyRdNqXx/BSgiWd7B6aHKsmLmYmT2ZijF56bINM
         BZTJdocDM4Y+m8qhHj2iR2jV6ZP7SYWXXFLYtLdlYLDq3Epx9xmh9c0QILEsSi6XadCb
         mvimxxHHfEt31BYNr/t8iiT/C9r0UH1AGUitZE5vcCAP0u6P8SVS8bq+AOs32YcFgkWU
         ZNGv1mjD2nSbKZTl9IGrNH86FnMEiQmtTp15krkVp4qiYa0gQ73gm8MFvWjX4IKKy2zU
         Uvw2cyL+JQebdmayKFi7ub6GnNRwQUh68OToBqXwwZwKgc9SLO5ZWop6LHlw7FIrMpNC
         yKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718308; x=1777323108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShdYyf7UWppTknPbWPh0egFTHdBn9gJPWfCvL0VBpLE=;
        b=AsPGA54cpisR8oZVRqP+f3KH2z7sSfnUMz/sBfMwHINVWOT8/W1V/S+JQAhAySvUJE
         xRduG5oe0TvpJgYZW2fQLid93mLuXUhj+ve++qsMVFzK9pzj8fnHa2qRf3Jsyy77jA+w
         0Ey8Ug1O9oKGNPRW1Cp2QtNyhcd04hwYsXNmNxk6VuPI1RIeAk57Ui2Xp6T7wxWxHwYW
         63w+VaZWmfMrY4AJAcEHdA0MP/sArMraoYhs1SeBwo2rF0BWENZMDUtQhbzpxIR2XUCv
         isrKqJjBqGNgTjy9UT1E2jS+q/TOUxqoQIUVNjFC3ppfIDgRpPW2TslOmmmKl5vrylHX
         8D8g==
X-Forwarded-Encrypted: i=1; AFNElJ+3cCPgS1+aouhys+OQ4IF7OasHMMTgA6vy+NaR6L06fvhXsrDZsHm/1z3hlvxD3fDJD1qotIbmL/tE@vger.kernel.org
X-Gm-Message-State: AOJu0YzFo4PNj6DFDw7MnU3m7qrH3FN+H8thLCm97FdnHDr6K95/JHjn
	izAGD3VN+0FlrQ6jtoPKSDlP4E+MIHQ4B7o1REvO7dk/UEpydIWO0MSZvtNZ98oosshoHrvtpq2
	5Q/yQf5SlQ2vED09bH7DagvYKhl8fNuSJLuzHgd/MegLkjPjykChozDC4+fOZCqZy
X-Gm-Gg: AeBDieseei3dqXdA4VeQAhTxfmTPmBacHbARML1wOkr/TY99ScwPthBjJWADZBkN4Q2
	f0a1ZU0wD8zHq7AoDlJyPa/R3J5aIBjOd2VjfFlk0wFaFcaP14iI3DdK78T0GC35Jlng+4lkat7
	wv372wpv9P2N1XwxXGUnV4Vsyt47ojQybST2c2pUpXVRBYrIsS17XgCoZb19dmi4BsXqo9IoDGc
	t+tix50XoNnlKrZRS2csweWMEDJ4nTHz457i6jlPm2xxrRblt93TuFr3zEdHKUpmGfx1hBDwZ1D
	mahf7bEw6RIjELEheeC/GIz0q/6iSxHcz/XsSDVkpnvI3g8GR66FTeLzff6jFR0t8fByapF6qUT
	Wq8ky08GwskVTbo7EfPK4RB4Dwsa4wI8lKZqcKyd1/etzpLJUC9DTASb0Gf4vYOH45rYlDdgey0
	B6nZBbc1rBZLbjQvmVB/z514OCi9RCNOvXJl8PECcvtuU9EQ==
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr218495401cf.6.1776718308068;
        Mon, 20 Apr 2026 13:51:48 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50e367ffe43mr218494951cf.6.1776718307623;
        Mon, 20 Apr 2026 13:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm3231005e87.30.2026.04.20.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:51:46 -0700 (PDT)
Date: Mon, 20 Apr 2026 23:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <rajdw22en2r6tfbhrlc3x6mhblxlz6pt5bfkxusfu2swixlnj6@4l4ejrojlq7g>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
 <20260419-hawi-spmi-v3-2-b04ee909cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419-hawi-spmi-v3-2-b04ee909cb87@oss.qualcomm.com>
X-Proofpoint-GUID: 4RoPl3MhUU57JEQSZRzKL_G2IbMIR3qu
X-Proofpoint-ORIG-GUID: 4RoPl3MhUU57JEQSZRzKL_G2IbMIR3qu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIwMiBTYWx0ZWRfX9GFAJmk6jifP
 JPVIZg+yc5vFfR+mRCTt1mXwwnZ7VJ8KiNfefJ6YdTLJ5d6JpTQYSxbgLCL0h4hl8Faizf2S+Bi
 BdKX2i15HVucetRnY/V6QxDosQTEaEm9ALg0n+aRfOZkfYxTm3IWAA/vuRa/WOVzXKe0T6swooC
 l/jdFzhOtz4LNi8yHtCnHfMiMeW5SJmU2fnltiSzz1kU740HZjMZYrDC6AcOXLuqvaj45x2kc4i
 qgjiD8fs8qYVdpaN4HuQKltsWlLR33yCMMe70K6qYOw2l8RGYK4w+roufTYf9EBwigaLs73Cbs0
 mUrczXvMareru78Psixyvg3G8zJ+kNlwRAdfNPLx341H4o10roW9uK6mVLz+jRA4rLXiRn6q+wj
 Rud2BSpEPzZgAvIJ46AE4DE8w1DEhWGX+z2fW0wwCv9V7Bc+6y9Avi6+kH7rygkxpCd8V8jAkfq
 hCskKUKN08Hz1HTCMUQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e691e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4h3_F-PqDEY_y8xvUNAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200202

On Sun, Apr 19, 2026 at 07:25:53PM -0700, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 142 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 112 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
