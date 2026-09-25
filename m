Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C8332EA2
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316743; cv=none; b=DcdjkdFWscHLbcCFgjJBOzn7/O09jePUveifYrJ5kPULEB09GIWf1ifceABD67fO8VPo88QYoz4kn5VkE2V47QzgMRawv/tnPuMaZ9AAgbhOzPtn/RbKOvXwBkfTqvLWRQiMkV3EClLtysbsblA1Q2TbX4lAVpr6ZVNdPLD9iu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316743; c=relaxed/simple;
	bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZYxp/h7cE2Mzv5pjpTckgZRi7GvKOpFHuNegx8rVP74lX2X/49Dig7QOWLWN72VlSaMhvzsvVrHvka1jroOi74vbnu2yMw8mb4akr/LEQH9vr5uJnkO6eazD9hLRbAeZYoXA+0OOorqxF2MJci3vjeDHWbQuUYxN9agoImfFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLlENdb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5uiKnUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLlENdb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5uiKnUQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z2R41194495
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=; b=HLlENdb2HreD8MxM
	xVFAgNT5zKLMqfiqNt4A1Lp3gs3aDZ+M+MECdG/pY13hoMR66CmowHZh+PFj8tRc
	Mpo89OABJifDZZRofSykmaYK9BGumZpHbqs+j4AzCtuFlMsFXaq0IrOYig+zmJlI
	ov/O8kWejnbGJ7+TkTcPgrDY+ghj1S5rBMjMJ/UsjQoDzo7Rx7YPOh9ffMQ06k3l
	KfUlzdXCMpbn4P4eJRZV+eWjq5wW1lWBmBWB1FNwztfu1C08LfcC5aWlpwEgJ+Oo
	KKmo33tTziC5uCnoIQaroVeCbAhvaGlHWuMKyXTZVJ9jrS7EGwkd/Ovyegll/Niv
	jEHvog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874j8r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:12:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3412efc2661so731513eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316741; x=1790921541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
        b=Z5uiKnUQ3jh7EQLwtoFRZFxPCXVRwSIu9qYBYzVAlNxyHI1NG16JBzKzKU1LyEX7u9
         74A3lMajDUypQO0TjuXYzpBfebAQTJ6h5wMNQfjMKEpCW/pBf4LBJF3Vg2/Wnh3i72Ts
         ip61P9Ti+oiCoiFgE/D8B+mmNlgpYSZBqAuboKuE+bREM75NWo5tBHhI7rb1LcnAYEk0
         RL7LFIPHqFiup9fgMEuU/oEtY/TxtDqN+8aIIedyheikGnHCOKE807zIAFDp+tVDtw7k
         7bIzE/LMzKjVPGnxixWyyHCmSbceDHw7rJ0ufIfDbwS2jR29fHw4SduZjX0XykC0d4Yr
         IWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316741; x=1790921541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
        b=W4L+yeSxBDBLLKvuTW9huVfrWqVM9fa2cPShpu8XfPbw2wxGfw6G/n3iLR42WxMSqT
         4YB9ar4pWBih+DH20gnDJNL2+nExVy/Ah4MYs5sUIi/yAuguzDWQUGSIfDnYAs0I1+C9
         tNwtTacXh/pR9VFwLjhcUEhznGpfHtdml//gpU5lziQG4PhqU3flfH3J0foVjbVp69ZH
         YdAFEnUv9wY4Pd1rdJVo7Cq3nKw++pQReVYoyb78vVB7jSxqwc8FCGhBEXmIMN/I5kYj
         9Mquhe+LOrFTs2EmpbshBReylQifNqwU9Dc93zpyHej5Wx0wvrKjEDEz3oIYd5MSdr67
         3R6w==
X-Forwarded-Encrypted: i=1; AKwUvBxdl1mQqy64Zv8E3vH5pdbeTkuOCLpQPDCMqT0QR4z/a6UUAN6ulrbgZnA4MaEgP5cGje3R+Xn5gj4B@vger.kernel.org
X-Gm-Message-State: AFuF++mHHTHutbCbjkSplXlqMlYP4xfLZs2XewKhFCpsC9Gfonkgdq31
	4yk2y3sdTS8d+mq/c39/PcMN+IXqEcvk5oqwkoZRqWDEJ5G3J75mrb6KW/FZZrqJXcGXfkrDwik
	WpdWBvVZxglPJiRGmj6AnIEMlbdsKealIyKaKCaLz/E6kpsEsxKgZy2DiuswRvrVa
X-Gm-Gg: AYBFou0ZPUUljWjRQ0NdSNnTcoG3k0GlbW3f/aMsY97XYXfLitQl+9C2zA3496vZsTM
	+K37IwcODrt8WBNCNnLR77EE3mzirf1mFkA7WYRuiTjv7kA7GJ0ECbxTauy0VzqxR3T0AU/5+nd
	b6Th8iwJPyOkoxO988M7kL2Pr7p7lscCWdDB3jhQJXY77XeerWty6t5LCc0Znl+GnxRyh3GEb1d
	lx8912pzfuuUe9c6iIt45CCMwKQRbCGvDP3ip4mS6r8OUPM+m4C2sHeGqMUl9iPZwZPogM/lUrC
	MxMc/edDGmff4hatfmoI9hOICaAd5hv091PQMw8hRHjyEzUk5nj79q9+sBFyI/LDBZw46zNOeOf
	3GLE7f1nA7mbjkdK+AwH2w/narbw=
X-Received: by 2002:a05:701b:20ce:20b0:143:50a0:56d6 with SMTP id a92af1059eb24-14504030beamr3566051c88.7.1790316740616;
        Thu, 24 Sep 2026 23:12:20 -0700 (PDT)
X-Received: by 2002:a05:701b:20ce:20b0:143:50a0:56d6 with SMTP id a92af1059eb24-14504030beamr3566013c88.7.1790316739758;
        Thu, 24 Sep 2026 23:12:19 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm4787055c88.14.2026.09.24.23.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:12:19 -0700 (PDT)
Message-ID: <8f341b4f-fdbe-4206-a5a1-23aad375da57@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:42:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
 <20260925055837.EEBB61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260925055837.EEBB61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NhiVNU5y0iQaGFGeO8x8PJyja1VInSrH
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab610c5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=JhJJWNIH0-zBFtMT4mAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXx3uoIcq6+lIW
 piT+SYOXT1+9b3wSPg5TmarH9FpjwqIsXRr2vRdr2SRhGpYCQe9FYC9HZgc63fq11eUx4Nfx+eN
 xLV4u6itb0QxRZGb7CfOm/wmfGIOIHTiTZyNKCb3D6uBDhzHCMupbjSLu9ptWZIGzEIiiFAn2I2
 UoXMpkaQrCaFTd916d/KFJOFWkHs2cJh3lacPDldLjiDZP8abyOKWcp+mXq/KZ1iyg5Mp0v9zyX
 q4ZUlR8RXRKlH12KmU914ZWkwJ0j4xx/DopW2ixVTxU+KcQTfmCPeYX2Egh0FPFG7X9BD1CY6/Q
 RMnfnEpKJe8x5f/97Mtm59iO+bZKEpWhbfl8QuNQBYnYs6ocBeOteJUY48JzqCWKvXHo3trL7u+
 AKURoaXkNgLyVEC4VOI02lIy46e2J/Qi4hoTD4zrouALMFSYVAUpyLwFWrqD+tqYXVZyQIaXZdc
 Pn/iZkD1XC+G6oP6+Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX1HHd42d3U7As
 C/M05eAsykca4g/dMgrnT0CQ1tKAbMhgXqWYRFtCJ0X8sEl9Fa+2QHrpalW4lJnCLfpqXzQETgs
 do0E7ErJvyPVuwgKPE57sJhts8tKol8=
X-Proofpoint-GUID: NhiVNU5y0iQaGFGeO8x8PJyja1VInSrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250024



On 25-09-2026 11:28, sashiko-bot@kernel.org wrote:
>> +
>> +additionalProperties: false
> [Severity: Medium]
> The commit message mentions that Glymur uses the new PHY API via standalone
> phy@ child nodes. Since additionalProperties is set to false here, and there
> are no definitions for phy@ child nodes or their associated properties like
> #address-cells, #size-cells, or ranges, will this cause dt-validate to reject
> device trees that implement these child nodes?

The phy@ nodes are standalone nodes— not children of the CAMSS node.
CAMSS connects to them via the graph framework (ports/endpoints/remote-endpoint).

The ports property is defined via $ref:/schemas/graph.yaml#/properties/ports,
so additionalProperties: false is correct and won't cause dt-validate failures.


--
Regards,
Nihal Kumar Gupta

