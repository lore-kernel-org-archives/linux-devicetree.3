Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3E63812D2
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248465; cv=none; b=OQNp7qEBqXbP2Www5JdGuJgoVPNOyeM+zxlsYeJtcHfjABtLhrEBKMK2ICjg4v/7enbe7YMxQyRJt2+PCwYtERwg5M5wfUKVTaXyIQKpgPwrj+4ARjv8fmiSSDNGV+7B+1j5otXx96KJ/OCXGtgZvidX/iTPWd1KPPrDXI94anw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248465; c=relaxed/simple;
	bh=VW+1netLSKhQaTgm9OLeU/ucpn/ddm2kFU4rfwnFmAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkvtJgMNYHTzEdXTaELwkQ2WDDmbWF0d5WEsSyoyivKo4bGPQ12aUU+pQ8lxl1Iv6vVQHK69o1n0J33V+YoDfJOdjPII3qgTWBJTvVVUYxaGha73GsUGEuM5hjRFCPncialCw8BV30gOt+yAfSJ5FO6QU/pvznULBPqVHQ4aq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrXJtdVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqFXewll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrXJtdVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqFXewll"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3A43c2476935
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Bk9sdgznjU+BVB3vMLKky6e
	a1c5xyuTD40o8R4uHrQ=; b=HrXJtdViv/saCAZUb4qyVI9lRZFG1T6VUd5jYFdE
	McDeP6YSNQIPf0STiZTlj8/rZlJa4/r+bOcCjfotmIgAeRFN0yNGZ5KEUNhW0X8Z
	P+1w/TG5EnKuPYY1jqCoF93G2lxQ+W5a3yg9udq3nxWCxxvIOAixQGTVmQ543ebV
	I2annhRWlcvILh1ypniJPqFvdfpHDtXx5MsoPA4NZAE6BFxTHyDsx3MfCA1JUEvh
	EWtvx4XG9f0Eo1uxDxYkyAPsExKafVUz5vvvyriMUpIOXKy7MgsgjHSjuUgWs6t9
	uTvTIQzts5v+Hjs6c55bq30BXybPYqic4WWI67zLMt2s/Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5t0gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:14:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c40601e2b2so636908137.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248462; x=1781853262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bk9sdgznjU+BVB3vMLKky6ea1c5xyuTD40o8R4uHrQ=;
        b=DqFXewllWG751QLcO4iOXEsh8+U7XLJZ0Ve/Dkg6POm8erN1Nt+svtCVaXXFCWOK5E
         AvcDsQnOIhF97M8halvNt4HTOMt33CwDRkr2A5BAa2O5rPpC+U9UmcwzpyVlukQmdSj6
         NuqRoLliYl/LvwQn6/I4jK1UA3cfgRbnQkDhVuKE2e+/wbOtWrSQ1i7DK8uwjIT0dsWD
         1Sbu9IPtC2efrEJ1wPw+ykN+YlkB5VU8TI5oVDA8XiNupL6aMumEwe2+XlPIhi9wPhxE
         6EbRTL9Fmff4v+bImcIYzeLT9Hq9gk6G9QQBblSwgMrquffFjgTnZXVW/2giEJ9daz0b
         45eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248462; x=1781853262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bk9sdgznjU+BVB3vMLKky6ea1c5xyuTD40o8R4uHrQ=;
        b=FjJTLmV+AbNCqjzEx31rxVOCO5T4WxtJeSHwcXyEAhEPzQsYw1XbCZydyPnkoJAMAt
         edvfgmA0uhnT+TFaVtS/YMU1dsce2hyUVDUcpuRRL5Loi6ZvibBxed68lwYpsswYMWAV
         Vt7dt+bgCeQhahYuAL2FEX7FEpoyDD5eRlz6PQsn28mAHD/QqJXSVow+y0q98vnYVqCs
         SB1JZMCuV+wkG3h1iAAOJq0Nzw+mHabno0BSCtvqS91kNCxI+Vc5PrajHbg4dsuouJFz
         ljbfjbJr7dgq/dSQ3m2mgH7HIS2C35oKWwfAN2btvJakF4X0r8ORjkPpNU2+NN3nRkfp
         h+tA==
X-Forwarded-Encrypted: i=1; AFNElJ9L9QEHx6wW3+a8uKRRJ0NTtmd5RRJx4f9X1/z2FMh/a43T7p4QRjQnDZnxDsdR43+rpPwZaIBtL0kb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8x+JFWol0/gZV6p4I+BHALt/hUYDqPifn15YJyAmQQF2ZppTK
	hL+bw5ohrhm7og6Fg6KzpXFyL0K/odiK5SUFvUD+APgjHPCkNhuUb1qI0d/Bfl0z98Sd8j9Biiy
	GO/rNJ9Geb5NJDunxoC/i3+hWq7ix8ydaLSB5IAWE28c3yTqkwYLWs/GxV6xSW8Uz
X-Gm-Gg: Acq92OG+5HWRhDdx/PDtQz6ShCyGjlGQfhh520akWf7bo8gB8IHrISJPy6pfuqf6YWK
	FR2118CeD6hOTlwSuweKy8/ShqVUKJC4FyYcVlzHCVjdapxWfi52KMR4Agrle6sYJ1TltqoNcWo
	dTm8BkKgdPFn7HJEledVcjYaS+/ZZGPy/J4crOlqIao+deyLRJ/Ot+RBcqWpGU8T3CGD5Q5fY62
	QmPIVyCZ43SDD52RV7gZjvrlnciLn5DsyyAYD0qU/njnsf9xXHaGtaaFoD39SPESgzG7ByzJ8Si
	DKj8dpD8hAeuWDQOi8swcwA3aboH+5fpsJNRYB+cK8R+26A5nhkpr0gOC4dk7iIbcUgku58YB5b
	Ci+Im754ydLjO4CNhfsHargSgpH6E+9/o+3xWH0DUeJjS89qySXLroBuOAbvxd0mEWF0R0r5zEh
	UsCs2XN55KMP07f9dAMV5e6G/Qo8oie6O8pBU=
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr832348137.2.1781248462415;
        Fri, 12 Jun 2026 00:14:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr832331137.2.1781248461928;
        Fri, 12 Jun 2026 00:14:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6abdcsm3826591fa.13.2026.06.12.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:14:19 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:14:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Message-ID: <knl25r4g5xw5zkjat7e2kffdhrthgln3mcz3hlic5u35srfsep@stoetxcewzom>
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Gp360zTAX1ZwSkZLFeOeNaQ_WSnNBPbs
X-Proofpoint-GUID: Gp360zTAX1ZwSkZLFeOeNaQ_WSnNBPbs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NCBTYWx0ZWRfX6bEKN2bYcwig
 GsVW0EQqnQDFhJgML0OBtmahpoNsPVycCkfNJU68XfqNf9lncJLoqM+2u8Aea01VWSW0QW9TxdN
 FzFLhEPVdIvK7uIO/ejFvBxsN7eXs3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NCBTYWx0ZWRfX+x7X7zlM3ris
 +UtG4PL0T7tYa2/pjodvEd/Ujp+uRho1K1FhT6Rok//ykPw5/ATmgP87oWoTCTHp8GMzVA234rL
 x//VaNSRbXjrfvtoNheHG87Jme2B3mtET//7uFDGnWZTEB+0g4qBWDN4vqJXiGoUktPCZvVKYpd
 IwQezVZo1klRviAuqe7fi0wYSLVvulbfQ4LubwIM1Tz19HLt0vn+NpOhDPhRfHF8rxgrL/Mlnk0
 8QbdBO+RYLHFnYQYNbrYXpYakeft3d9XYNqewGU0hKRZ5051KHs2h5XNrBkOWCaQlQtORqlHGTm
 96gQVBA4a/ToYNL/AnzeMnZbU6ItrN3Bip2wXOBOgOcnJLvn8zIGEZ1nUu6CV32vQyNiM5AJ+3X
 Z0/JZmf70jS7m4CiacdJ86baHFSUt25WZm5wNypzmc3/mYSDzlctrYAGWmRNqpF8gG1aQKx/P75
 t4HYMlGsmztC+2/VhpQ==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bb1cf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jCeJVGeWWU-kfwvKBo8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120064

On Wed, Jun 10, 2026 at 10:28:27PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
