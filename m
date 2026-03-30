Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AFEEBB
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896346; cv=none; b=NLjbmPKYA7v3UBIrGq/ok9A6SqpfcZ5Z0bgwEUNoITbYKnNCrky1TP8koeAGx2/qFpYlFHSydg7jmup6mc+Nl4TNssJkKxOuYY2cigaoKBn3tjyMDElBFHXDbbXmu3ux4q4hwdkEOy7mn5FXsg7u11aRC1xyGPMvPmGhVhoLVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896346; c=relaxed/simple;
	bh=d/XTOWWqm0oWktvbWfuLO3lQrFQbiTUvkqPjUJxxsdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbtfJhrFX9Y/zhv3Juw1Eg384Y8noFeh36q3wKmeY8h89D87XEV5TPGQqW50AoiCJYzuKOSJGF8F5JTXievWpbsSUS64uDtrXvhujdBrXkpWgp/mj1G7/NS41adUPam2pEdxrK52zVPu0dtGsZ2Iab087BRTaeXoWnKzDTmq+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy05irhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2hs5Eci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy05irhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2hs5Eci"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOO4G1557499
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGINkZ/CzxHJcm7+tFz+ACk2
	brf74z0Uya2Q4uJAxoM=; b=Dy05irhriU+J7yUhudsbZXn8tWmLa7wIUEuFnmMi
	aAYr4iErDkjDkTjU4zJGy4tFWxRnkiwufALHBYfiS8oEEhGx6EKQyW/fDZuOZDl+
	pqEqWtz5SGkHVLrosE29bceG+FmTXVzWZC89suVlhfnwu4oocRGGA5mTE8saeyVt
	IYk1BKkdSLX6kvHgCHZGwC2J1rrruxrCy2NBWbPCQNlY4OQPsltL7AuiYl3m8t/K
	E4IeQ+6gD+fOuvNQZUN5KcSQ3L/pXJ+Mbm/+wU3LlM30EcdvL3rJcp1gPBCEQp8i
	D6GQjiljUcx3JKDVBsmqH9+8ZkXJX336bpBqYxP/jSklLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm12b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:45:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so123717391cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896343; x=1775501143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=H2hs5EciGhuhI0Vpd8i6TlEVDXQ0hAp5STn6keQl1t3N4G1LUhj/l9+ceJScGGXOBa
         x/dYKpeoC4CywXiM9AEKw639wgXL0I36ZUksnDbJ8eY45cXnHKOk9/tyMYD9QSrF0B6u
         Sr5omh1fDuAwqrnhax4Fi/ZA01NDsUEkMswqDAQ4jpkRsNIiN2yM9bgnnFOyWPUoyu0d
         HBIT1GKdINuyOkCCoKTnt5hqDsxl091kGA6inGSVYhoovAX4jfUR1wWL5vuNJlrWPfpK
         Z4O67ozyv1tGV4G63y8iNvzNQFZST2x3rNzBK4Mli9TKF/bq8x0SCiH27dpfe5qnuxBv
         EINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896343; x=1775501143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGINkZ/CzxHJcm7+tFz+ACk2brf74z0Uya2Q4uJAxoM=;
        b=I8yofmymnXaiB5kRLzEaR4MJwQVBrIL4Xjw88eHvaA/l2/Re257fDZoToeOnbmHyRi
         NsiAAprsO2I1+Smi8DkydDgtM8TUyJB4xwJ/JV07vreb5/4jVP68TsQTHZKHNkB97YoY
         kIXwdIkj90KdGMBrRBuiRjQu+rBb6cVyK5ES5ZYfj1+H4TMRjQECSqVRmiXoJE+mb3V1
         h3mWe6+5csobKnLFzQGcksQ8Nz6Xdr0gHsxhDtkaEF+Pld9280lQPmvn51CqC0usbTSK
         bo4VZ/b21YfSW6Hb/Y/GSf49oK4a7C2lrQas/ZRTIlf9xfLcXUrir2p1B5psILd3ydGz
         Ag1g==
X-Forwarded-Encrypted: i=1; AJvYcCXWwNOhu8VfvZfwuLWVQ+tyX2Mx2xFWJd2kf2XKaFQiaEzYUcXGvouLsxeqGhgeiBXp7dHoEyYbgyKB@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLgKx5URqByD+0QZMS/2zhr3TFybkNYqNXU6GtPiLx+l7eVGt
	77x4zeSlB87rwV/oaGp4wseJBOHAsdKw9s9ER5/wDtoqDXiASGL9lhjcILHUShvxtY+TSoWBOPY
	kY6qvFiAAexwU0jdHa4CUiMIB5R0CBIL9EdZERDRvrrh5W95k2Mfkq3VO8GVnk0yP
X-Gm-Gg: ATEYQzyIp8u8qOJTewwd7lhKj1vEXLm/qwqPwVDtClKxMfbVysmLBxMfJnfUjgoMHEH
	Qy23heSU8GTkx2z53EmE8SrKGJAYg7YqZCz5DJgP/5B9RNxOOW9MiP9UrW8f1Rzilm29T2a3bb8
	uC0KFgNOORq8Y1/6QS9KYUPMHiL/crlouPsXtqm9EPhwP+qRyKJ+TthnJQ8/oDixlAPsiEar0jr
	its6syeB0sRBAmojUCiqbyHRyn4aEsq0cMkut3Y6M7Xpyp0t7pBytC2ruX5sXMh+ogQv9epFQ7J
	epXxjH0iWNZLFjWy6+S648I3m/iK/LdPBYrlEjoOZ516TivCnfa7bbC9dnYbLCPw7Sbgec3Wphd
	ls8jenXwjN8tDszpLbA89tCcD7VHFD1pI+WIzzvqMPtXCJ4w43+ltQ0NLa9KJr6kMI+/gF/yme2
	rJq+J26PdZPMMFzM/rv9rf29gLpvIHmWxMTuM=
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174205021cf.65.1774896343230;
        Mon, 30 Mar 2026 11:45:43 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr174204611cf.65.1774896342663;
        Mon, 30 Mar 2026 11:45:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f23sm1910487e87.42.2026.03.30.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:45:41 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:45:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] pinctrl: qcom: add sdm670 lpi tlmm
Message-ID: <ctbz2i6k3ipqzvus7nmz4wu56dp6qiy6cqspl2tqybdcgv52fs@xqbiskjxxfqn>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-4-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cac4d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NJrbL9JRX9UYfUS_aBgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wLdgMziZFJTYFD3CjN1kLZCkg7O8ULZF
X-Proofpoint-ORIG-GUID: wLdgMziZFJTYFD3CjN1kLZCkg7O8ULZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfX3jd1cZY9lIdc
 1g8eS/wlJOKJXf0VuKvfjGgxUG+nvEB8MU5MjdKKHBo1eX1J7jhVJnE9cEazhBG1AgJYhVYtrwm
 8j6e2vefPcJpuu5NGkS9Q9YcMyBMEXh17l94DrKBbFgMGW5ctfUwcUB6HUrgekbyOKkhb+tD9Z7
 k5iPCz7PVQMz8+Gn1ZNTDC6orSVy14g5DLGlB8rI4OhMM42XVo/z45RDtUoqLh3y3/1m22HxC55
 h8tMUk+t0W55ty7skrqP4UsHDeCy6xhkEj/75oQp4ECbZimbXk4gpCusN1dHZc1YFYlD1vuBL9j
 JJmT+kgu+olcmOblO3xzkW1+KFLD7MzvmSvaJcQDCjzwCN1loXIL38P4L0fsCr2Y1/2ITSVBwoS
 ZtIqbX6QrJU/89nidUIjSnLaNEiV00mTt6XgOW9GJRowSRgjWAYYeKbm2HOTKUnRKA6BaDeWOYE
 H+WRlDF6xTAXPSRrKHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300156

On Mon, Mar 30, 2026 at 12:47:05PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                  |  10 ++
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
