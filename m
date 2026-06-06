Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D6D3947AE
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746137; cv=none; b=JSGL1JzCNWc2yKXWEirrcc3cjfrr1J/kqh6nrhk5a8UD2PSRw/wqnOYf0X0j2qAYpgg2Q+/2y5dVvoq99sUtud+DjILObZWb09F6T5VLWsTVbvz1WNm0vVXITPD5KEj2QsYCGueaGf9Hmq+1qvnT0bzq7Kzkm7pIDaLp3x/5HtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746137; c=relaxed/simple;
	bh=+6QUERHgEfhXYcAYNZDxqv4pAxoO5U7KVL8vYrGMq4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyApM8jYwpw20KIzYkbk6XyXjpgZ6xlRgYonvi2fyXc1glhscxAOJ4zMBgKFEY3VD4YBPai5BsBpEASNxAqbSa1Zh7l99jCTyv6uYaxJo+6m+QI/10UvOhUYwZUpvBb/Ok50cj8DVN7E8XYRqQSu9ToFXT0hRRua1l1KaZZxgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NscwdcSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLsByZ09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NscwdcSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLsByZ09"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGh1o1291148
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 11:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jThlbYq9gcNtv4SDC2gxLb3F
	Rc4MdnuJPfMHyFkkw34=; b=NscwdcSGNie0XO42RiR0owSD+O88UwbWxa7bkdPK
	zR61tcy3fxxN6FveCCJaouZWxMhLTI+cVotWnkwiH39kX6U3Cb+ihu2OJuXnkh2O
	xOhm9og/T6bnKh3GnKq6lG0sbirf6vMDmrx8ZrjwEuOrrumiMg5CTP9z76Q0xf6A
	e4oEoR6NjiZMR4ERcAOZZDBDzo+IM/PhbynO76fG1WzDhzxOzLEHtLGvhWuIk9H6
	rCx0c9b/EFaqVEbOw0isNaxpx9Bs253dvOO9IHlwgpZzXKDacWdrehGJSQYReIZV
	/GAeqggm5Rl6EcYQ7Q6/Zyhk+ol41xCIMYHpSKyB9q9HFQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr8yk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:42:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1726508137.3
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780746133; x=1781350933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jThlbYq9gcNtv4SDC2gxLb3FRc4MdnuJPfMHyFkkw34=;
        b=PLsByZ096ZZTDMpkhC4Qiu0oAHNOsE+SwvP+zIOX/NH9dDLsKIhKox++Tgca/1x7PP
         R2DL+Yvgbjcv0WmIYYFf1/voS6tRn77ur03U2Y2MXvHpWs0TW7wqbNDrOT7r0LvMBipk
         OC1KFPi+RmReF1JyB86PaGQT7Yp9cWFZRRN6wIlgEwgXGRVP+4V3c0jOcYiiWQUJ+huB
         ALIa7BvFg93K/v0ReEJBBD+lVQn4EPF5/TRfclfhriC+PM8ZGHghWtWWBmqGmzfm72ha
         8pOqIsPXHP8PMH68HTcWxvhE/bsifTZHZYf7vkFfbQCQZxSPb2ugBLPA4xw5KY45O6G7
         3kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780746133; x=1781350933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jThlbYq9gcNtv4SDC2gxLb3FRc4MdnuJPfMHyFkkw34=;
        b=RJnnrSOPVulCon+6xxkdSGulealVyDQnqjq7ZySvEUnVMJ0Ms5hiEoJCfXwuz23JWU
         OiTf1w5+5Z5ylqKWO1c9L4j6XypYi8qVg5iSeANoiWH8f0Rtj62Ho3NRHWBSINFnOxi4
         cQCGvZIVkmSKhmbYvyXISdlPjyXgpZMYscsZewoMAK8+OPQHG5oJeCYAxJRMZZFyu1KR
         AZGjXARfVYnBzij40NUQIjFlhK2YVE3FwtZ3BNCZoDP4y+FHo+llQrKfIizCQbL8Od8c
         svw0Hw+U+QcVPD7kzJKAjneQjpvJvRRpoWN07GNlSMDubJ9JutsotP8Rixym0v2B/LFe
         wPSg==
X-Forwarded-Encrypted: i=1; AFNElJ8djyTeXhPbuJ2G7hdeHBUwwq5Spw4noa90c8bstzZGFVvd0V05flRVXIZwTDdc6Eyus6jIau9AhDEZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84Fv9fhaYs3vPaYHA3huK6MLh+R1b9UphaGIrySBdE5zp8toV
	22PinVQ7c0XElIrtWxxRpdQYpgcCsSJXKx/4A2yR/lIC3LBZGRiU3O5jcHPeFnzLFY8AVb+EPNS
	sMK/Awr2LSgIiwSLMnAykLUE38JvR0UR0E/7HMk0pf/t2oTAewZ6dyJV8E89tf9qE
X-Gm-Gg: Acq92OFwgE7m+lSLoy0ZdFN+S+8EHpGNQOErUiF1OavWUYyIDZdpLov2/FYSPml6G4s
	6ds+88fg/NOiRDAHgr7jKm5CZw9xdCPRv5QsfhGwfc6t4Lf/STwZUiduqnvDJabfbfYWP7Y6PG1
	F1asrk4KNel4wDgmLHe9viZ0Go71pcftIRuA2T1QLAye1SFnBm8eV01gYAHuM0K5/XthzNhRH2w
	LP+/du0+XYfo0Abs4Mmfb5a+aR1nSTybMYBxZxMdOn4AgR5Efyz3SLVkwDShKssq5r/+8sY29Nb
	qiiNfdhnEqLhfhmZtM2LbaFkHRHOIYJ6ivUN4Ep3Dx+1KgKr27qaBknnllKhVY27HRTFtvs1LYn
	KofG6yMYUp/AjQQgSuqH32AokD9IjWL4pzILExG4vSZahiGN7HJOLSqWAroKQi0D4ZM8ap5Svdr
	8gvqaLljnLKKjLNnalusv3tadLJt0kW53xQSIi57DsRVKxzQ==
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr4223232137.20.1780746133422;
        Sat, 06 Jun 2026 04:42:13 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr4223214137.20.1780746133041;
        Sat, 06 Jun 2026 04:42:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990d37sm2436994e87.70.2026.06.06.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:42:11 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:42:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
Message-ID: <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNiBTYWx0ZWRfX3+LV2/Dqpae0
 ylvoxBF2rAewR/IWglQxiPKBxtm3i1QyvVjxR+FTiqkKaEE4XQvm2tIsN5J8cbqRSrkgdVoaEqL
 kk/tnIOaQlJ94UYP/2o69eGSG6GJOKLUQU6laoJ5cPjmw8mgd+SfaZv56g0uBOJkh5qbBCyO8rJ
 jWI9pPs7bGvjKHNa8TesWAzKnm8iRx6uDMIF1bN+8l9yI8o7NXEyRprd/OZ015tpTtTwWmFBtn9
 zEuOQjwtjjkgIv+z4Z1dg7vLnRlh/6pGI8PSDeZXXCVCcVfh4wbEWLq0iMrpFLtL/gtNMdlB5RA
 5Fk79ZT8mBqyZ6E+LMH0fj4Sw9KpqYEbtHObUDmxy/Y4tbw5DEmRV5Z+2oiskefCqYvAyVLsNnF
 3+yu7eIlLnLAs3To8L8NvH9sCmvFXmz+Gr49Ca0TlD9jyaXY26PvZdFjPxls36FgDCX1onn6cka
 +qD89VN8PI6nE3FB8VQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a240796 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: xp8jSQ7jb-UjrpHktUoNwFajIgNZZUAA
X-Proofpoint-ORIG-GUID: xp8jSQ7jb-UjrpHktUoNwFajIgNZZUAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060116

On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I know that I've r-b'd the patch. But then I also compared GCC on Shikra
and Agatti. Is there a chance we can merge those?

> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 4442 insertions(+)
> 

-- 
With best wishes
Dmitry
