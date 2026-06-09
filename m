Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E588E3B9D84
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023211; cv=none; b=ZHZgTX90OQn6m44UCuwokYCqA7PZ7bLI7Rc7wnWoHOo517j09Gi3wP8EIaKAP1ynYZi1OUdS1WcUvR83JJVMyHeVRMKk9HvzRG9qpaCt4/Nz44MQz8uWww1qGxu7rKgh5Ckc1B/YYoaSOdKD2PKrGwzXmKrW6LjEXyw6jaNY3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023211; c=relaxed/simple;
	bh=sDfq1vtXhioPO2b84JnrIzAPkCJuQ21qJTl42WP9G4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfaodzNnQBqRjL2P/INvt0QBxsAVaY/awifoVOHiNv3x5JbvukcBjBlI5cgi3CgPKWp3KwrgaMkLAsKbrcPkOYBriChgL8Fq3jDA+AsOjhgfNMVuu7WPSDGEHG01nJT+W9TbEGGRp4CXoIcAKHZgG8hbCgiMWNjGWpdWjHp9gPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqMSYHZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWPvG3w7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqMSYHZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWPvG3w7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOOeY3196576
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 16:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k42BRt5mCgVnIguCIwmnNjUZsFgQZyAZWCU/X68MpMw=; b=NqMSYHZK0Y6P489t
	lVLLbw4h/ZZkyMAc53NQiCld4ClHDQ90FsdyZBLOzZCXqCy4BL1aTwN2IThAr+Os
	mgijNB3cjs2f07BAsIa5+RWcA3Dgh7Ss9jBwNLCzeIKABY4ckumxY5et1bR3dK0X
	dtK3+nDVIqkJJiKtQXaXj1IW7mXGfPgAtfTDPE2FZcZpYRHXoelKhrrlNNp5lxZZ
	uleB1N6fqSLuyt8YAFPOv7RRv8bgaMKT3LvDzVGApUiEnZyCzr+GB1rHC/zJk256
	e8h3nUcM3viKw5wIAUeKfyb4rRFAQbPohZKPhboI+W4oohZcw+0bXg96o3MHm+/s
	gDZomA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v2517-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 16:40:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so5470745a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023208; x=1781628008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k42BRt5mCgVnIguCIwmnNjUZsFgQZyAZWCU/X68MpMw=;
        b=dWPvG3w7bPBHH9ioB+rXNG33Fv37YrLA9cTATcc+233upW3yg3/Hk1Ej3VW62ajmS3
         0WWa9GM8cf5qx7xTdFX7rj9Eh9wl+HplcIMyLMkFx3QH18kFcWAeEbJqdsK20ntiqZKR
         H2Zys8uc6nZ0/gWyg5+2Tfax5KYzC4EbxL9vzv45ZzBMCWC6Eh2MtOA7V/xF0zj5igiJ
         5Q5B1FybZEU190DNeQd9ik0MPBbCMTVBbF2y78l91QNh+7wvIJxAtIX0bx7UOIb++jPF
         99tr71KHQCCbH10Bzqd2ISuy+MlJhURI0+YH83UrqohIu+T3xeipriUeuwbIUKYkqL1j
         7wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023208; x=1781628008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k42BRt5mCgVnIguCIwmnNjUZsFgQZyAZWCU/X68MpMw=;
        b=HWrEjbgmd2OpM+W/Eq3K0nRZb/BGGhSL9GwqiSB1kFl9DVai8CTCL9Dx5FUCW4em+K
         huoGTx7tWPfSckSzwCAzVQKT/Ck8O4aTLv2Ky9Ej4kzKGlAQk5BRJbWotj3vVlCCUIio
         IaMonpTT0V5HJg4eVfBszcqgJgGIYYLDyNr9P4q7JzvwKLJKU+bBrQt+dLiQRR8Q0gIc
         VY+vxUIHorjFr7ccSDn4Q3cEC2iFV1MDo18/9lEBhM1flOWnGuM1Nus3UDQaxJz8klBx
         rF7G5qBWs9wbvJVSl6GSypeJIc6FV2aITre/cLKOBjrm9MQAAml1XoVFNlm13ewXJvkf
         M/hw==
X-Forwarded-Encrypted: i=1; AFNElJ/TchZld8Lkb2Q02gnEbrAftrrl4ih5WgPJHsTPW92NHwUvYUy/a0ITxGbpEDY7OAviYPd6D8m8Ev78@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjgITX8WkgzpkQV4/9/A6142/eqNTQ1aoYE9/tjl9ejl65nVk
	AXxyqVLIaZSxfpGLDXVq1yXjXiAlsY9aYwhMrRPRglcS3k2smZGulgcrK+HSXBrQ0f02Bspo3kC
	zqzqfuzqdU8re+FW+eQRfyA6dw22hpoL6XXXfBK871kxL/tlTT68GZ00acanz/RHnF7dKcjTH
X-Gm-Gg: Acq92OF495Ionyu9fT7F1HtxIgW4h9BO077KOsO3I0Ze5OGJToV0AUMc6VnH2IkR4Zd
	q77PbJr0nMgh+9Z/LlL0sMOP7TopLihkAPGFTLTbPGy5pzYQNer1YokFvLPqj5XRji9mwVQz2xv
	t96iS2uQ/uDjzd6NaEZlj16gDCOUK8n0KHbqC19xpO+JlMSPSaVE0mgCzbZWLicuCf7HF46Oz+q
	HbyJhzxiEy+6QBpyuz1UtD8MPBdRdrExcRq6Ce8y3XRD1Cx/p/QD6+qpv+cpfW9UswweIGUmqx4
	aqxeRo+dUz+ckjbgmiO+PJr2dQVU827GiUpKfPlnHvypp4p0CcitqhkbyZm7D8M+354tY+0kMRm
	9eouaIhNYH8VhHNihj0iDvjFoC3eHKG2OTC3neztFlESPWfotzYhxZWKsoWo=
X-Received: by 2002:a17:90b:4b87:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-370eec1272dmr22366389a91.8.1781023207614;
        Tue, 09 Jun 2026 09:40:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4b87:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-370eec1272dmr22366358a91.8.1781023207024;
        Tue, 09 Jun 2026 09:40:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d1fec67sm24654347a91.11.2026.06.09.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:40:06 -0700 (PDT)
Date: Tue, 9 Jun 2026 22:10:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: milos: Reduce OS PDC DRV span
 to 0x10000
Message-ID: <20260609164002.vdnhieyfghsajldf@hu-mojha-hyd.qualcomm.com>
References: <20260527094333.2311731-23-mukesh.ojha@oss.qualcomm.com>
 <20260527102515.EC6BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527102515.EC6BE1F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a2841e8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=LxbbYitYJVqUhMHIb1IA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 0tOgUqgOWraHALs_H_qT9lMRSbMFkLzu
X-Proofpoint-GUID: 0tOgUqgOWraHALs_H_qT9lMRSbMFkLzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OCBTYWx0ZWRfX0bF3T/7EkFX5
 RjDs04jWjrOP3vzDnjewGEfMguV5JX2D/HfIWd6nawC465Ofs85+VEiv+ssQEk8QX8ukSBXJlUj
 d++2jzC8AS/uoaNI5IKfFa4YF7YwWh9XyIliUKqN1yTRc7GQyig/ty/yOf5EpeRQ7r4R0pEwhH4
 YmiLliuflbu9/as8AKSmkwEFpLH7vaos41QABOsHg8PcAa8gF+9x88KlvK41E1PLEhvYB29MNw8
 HahOXgh+67FIDqs/rB/xlsGRKkSMTP31vj2cZEK5gGwHkyYksV+0GYv6+HMPmTnRgTT0vziBCsf
 LWoHRFqd4sZhpbOB6X/xm69wlIdu2bHZNwdr4FOoP+V228piuQ95v33IQNmwtfhkz0H6CIT9FmE
 qLmBFGFxTY3Mc4dMLq+TkMLhyCIb1wioGBf04hQhyXTchu86RBdwKjfgrpCSEcSO1vhJSyW8Z1p
 cIe3rFJwMynDmJnIVkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090158

On Wed, May 27, 2026 at 10:25:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Reducing the PDC `reg` size to 0x10000 triggers a boot warning from the `qcom-pdc` driver and fails to reduce the actual mapped memory size.
> --
> 
> commit bd9d32425fcdb7b1f806e074d8d4e1621656dc67
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
> 
> This commit reduces the first reg entry size of the OS PDC DRV register
> window on milos from 0x30000 to 0x10000 bytes.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> > index 4a64a98a434b6..c2b25f0dec0cf 100644
> > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > @@ -1948,7 +1948,7 @@ dispcc: clock-controller@af00000 {
> >  
> >  		pdc: interrupt-controller@b220000 {
> >  			compatible = "qcom,milos-pdc", "qcom,pdc";
> > -			reg = <0x0 0x0b220000 0x0 0x30000>,
> > +			reg = <0x0 0x0b220000 0x0 0x10000>,
> 
> [Severity: Medium]
> Does this change trigger a warning in the pdc driver during boot?
> 
> Looking at drivers/irqchip/qcom-pdc.c, the driver hardcodes a minimum
> mapping size:
> 
> #define QCOM_PDC_SIZE 0x30000
> 
> And in qcom_pdc_probe(), it forces the mapping to be at least that size:
> 
>     res_size = max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
>     if (res_size > resource_size(&res))
>             pr_warn("%pOF: invalid reg size, please fix DT\n", node);
> 
> Since the driver expands the mapping back to 0x30000 and prints this
> warning when the devicetree size is smaller, it seems this patch will
> pollute the kernel log without actually reducing the mapped memory region.
> 
> Should the qcom-pdc driver be updated to support the smaller size before
> or alongside this devicetree change?


Yes, driver change is  merged
https://lore.kernel.org/all/20260527095426.2324504-2-mukesh.ojha@oss.qualcomm.com/

-Mukesh


> 
> >  			      <0x0 0x174000f0 0x0 0x64>;
> >  			interrupt-parent = <&intc>;
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com?part=22

-- 
-Mukesh Ojha
