Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C937DADB
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707253; cv=none; b=JzEMJlYf8aDG6jFHVkAr4haJ1hbacrkr67AgmOzse7YMwM9KPNOBTyZZe0rlkbTVYyuPYIwToy2/Nycg4eu+oRyMQtFRK0d8xEZhOw2LOwjolgnN9XbnS2+Z6JxYtK+3bA+KRqoHp8AePTuIzieMl2HIJJxp4+0bmkvaSPpfdfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707253; c=relaxed/simple;
	bh=Qj1Llq7OC4zvhr5rArx3ZwsQHeqZMEqHrESIwOmoW9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAoGZR0mx8+grlvAaFNxpDZK5kHF6HP+oy+2ekqB6BS88yaUyEFNogVAWdmn79SOy/sgL5s7X62C9wj4Pvzk/sPcpX1WY3nPZwthDPbk0TlUdjEiwWpT+n0n1CeNPMK2zjRtfFxLyUdL5ikAQFUcOnMyVaXpNf85iR0Bq5TdL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGi2RGmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2GsTHYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGi2RGmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2GsTHYK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P90KFf2002726
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5NQfF+ZUa2lq7+ZRulYI6A2
	NsYPt5ClBqhGGJ3BoYU=; b=kGi2RGmBw1JUMOoGdEou6hvnPDbPITcGo5Mt/uJu
	CRBahgR1LKFIrw/sgAokxejEB+4OK7Wsu4gDmyxuLP3N++LW/9Wm2s0DAAX+xQGH
	qGXzjDboMFXCPairiM9W8UsJbigEQORV2O1mAD/s4lKSe8UXgXvmbxa07kE0xOXV
	Q68r6KwQkuZo17+sV8NdI+9ZQn7QcO226pjtD5ENpz6qKCahEgUQLTYzVienfz0H
	8nfGnQ8pAcoTEWijFzl9EYYXwwkPURTZ9R8nBnnWithSIdpZrHt0Am3BVeS12VSo
	w7ZZKSCNEF/cb0ZVSmLJrH5vyCOnq3KO8MclI+P/e7zHtw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmps5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:07:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314220f28eso18825595137.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707250; x=1780312050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=i2GsTHYKkpRGRh0EhGCqa5ttHIUzhVqZqOVQyg3O2CizbXTThjXo0YQMt0k1nvFc1g
         UU8gdPPNwhEqXRwM2Eo2A7SGWjr0Kxn75L1eVayWtWZVq75KtKKUFehJmNvi8sbG14Bo
         48UE/eoKvcZZ7yJGV29VFqnywKp8/YC2ZsSUn5FfV0Dg20vMPHeGRfgN1s9wq7NVMaSh
         K3cKf76wjcROSatgEAQYmDylFfgdl5DymurI1vbFv66LIYMrDm7EB2tWETV8N+44WLs6
         8AmTQ5WuwdJD88hFTQhgrTH/RAZzoWKEQ+eNOD+Rxor6K5yMYlzA4SC+808bmdymILRV
         8h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707250; x=1780312050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
        b=MLG2fUw+RDc28coDLA39i1Qavq3tViMsHt4n7yr9ZgWSbqv0JEZld0ZUuc8wvA2pTS
         fKBlQlXiMT8tEHg5FjXh5AFjgsQIwb0We+p6WuF5/5SWUfAKcLnVeKZEKCbOUrx6fFnL
         dnc0BetXoHQv/ZpRsBd5ZCKMsIEB+yz2Wds4YeNTZ+8JoQYQlQ1YUYW6OG21TWPY68aa
         VA9G8H+BstHyGEMyBt35c++GgyfYuKSO4Hb5Z+2MpPULbRz3JYtt1rn/K4OP6FU+0H96
         YLZ3aBNl1joJSZBzKZfBFDIz9tJcbz/BQiCYZhI9C05Ug5YvMfbztsCzjEqHvWmGeHNJ
         1Waw==
X-Forwarded-Encrypted: i=1; AFNElJ9+W27W4xQxzwApntOHGxzU17RaZpYiFYLSFV9Z0D7FhAQW0y66YBZhBqm4VJXE+lQF4X8O7ppUXWtp@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwyjmqOKNrtRRbyrdpMPbnfWc8AnNNOPECPRMDEYLs4db+MTo
	p8a2KpJIqqXtcK8hyPzNE4l0U35ODhCZzDtAnzSw7+TgWFTCc4d3btUAQ5YAcIwG4NoNpKRdAYS
	eqt/ADAXHg8F5sipy26m1NXAaRCaKlneJ8+uExseZnQL3j1H3TzW2X7DF/6w0hD9E
X-Gm-Gg: Acq92OEe0dGeUD5cppeWe7sZzg+SM1ICNfeUXSj5Tr8oCuq/3bT2f6vxrGwV0GvXcET
	G5cDAVIg1ch/hNLfuYoHzmWTefqxeh6lFFLAlp6c5L4a4TKVJHondg1xF2fSlLRHTmheVW7T3yH
	WdfVlSy5k4CTwht0yySdgSwSNq7euB1/fGjIH51tQ7vYvtR6SJ7j9Pp9UmPUsy2JUgWRxCSRDLY
	0wA0f0rLCNiz3qiLrKQsTU6gKDBDVySpvYXDEP/QDsSsB4ivSWbHE4ffUEwtWvoXirQaTg5XJsc
	QWgip8oUbQAtbXf89OtPdnWncHRKAU4ssm14Ta7OEF/+e9EqEiSFX7/hQw0QplYi48pBhWV7hWi
	VhQPsjWuvYsLsOsgoM4OGNRqLMMOfE+jOTjvvSgrcmB65AeRISJvoSkxKbV7E/xvoRCG5EsB1Nb
	W/bL87HDQlnHwYr7RTLPTh2Jf40uhbLDByccE=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780127137.27.1779707250293;
        Mon, 25 May 2026 04:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr6780116137.27.1779707249899;
        Mon, 25 May 2026 04:07:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96b3sm2600950e87.80.2026.05.25.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:07:28 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <bnwy2srhmflo7drgavqonka7wrzbiwas5xjbabei2b6wfzci2b@62pkd4dr23j5>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX2K0vgdh9j6C4
 xhpmmevk+eOaJdmbQXR0fRIGjVXD7kY6zYLwGU3F19q1VtotkwN/tSBsGQ16W/jOx1JDBNhrS9P
 0gPNDEzQhFBbBEjJssJIT2Qn9u5qHz5IWDOFKpB+nilGTqvgrB/OSno69i9RkLzAqe091Tffoaa
 OFfZBGs/lIzju0cFW+5CGQi2vtC1UJ6KTIJiOTtjzs8O9oI85DvdHCjG2o3f8THNy7rpt6XMtO8
 XtL0mXP5ihyyEVnRNNgnCV38J/fwbqki9hdTsbWk37PMjWySYELrpFdaCLF86OHPU+h63E7Qe7R
 r1OtkM1g4AciK08JjylgWMI2tclkJT26bm+Y/k6aZC2ffhl3aiYCnUznmsu/y/vyIrmE+U3BPsE
 eMtUH/trKRpx+FPQJmhNUdBTjho5LeVH6B0spt2lF6vIKiycKQ2VEbi+fGCBPMXWT1Y65IE1Gvy
 QXPzcPReEInuYVyUQzg==
X-Proofpoint-ORIG-GUID: yAHdX6GzL_n8Rb_vHtY0C6zWRevzk9kI
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a142d72 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: yAHdX6GzL_n8Rb_vHtY0C6zWRevzk9kI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113

On Mon, May 25, 2026 at 04:16:06PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
