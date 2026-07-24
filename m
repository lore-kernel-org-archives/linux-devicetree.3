Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799C3DFC88
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887430; cv=none; b=MAATJk4msrHyQL6GpErlnCX27eZEmN3YKmvIl6FPDBN5/ePI+0efBc3wRPADN5F4Qp2sfOcNMS0XHOTm3p9elwhjQQ6gVlxdN6oD8mCsrUhxv8AJlyAL1yskTapDjcNvu2Mff5EGxxmi5PLS99uqD75uJyG9vEMQAMwUtBmRU4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887430; c=relaxed/simple;
	bh=rvno8wd7jIFL+izZKRCFp1lPzwOg8SuwP7osdX6UAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeMEGeMUjQeUJU+XthdnIq9vGRHFQ6oK+lnoqLq1oxbruNKDfU7/YnLcwmCW1xnVV9ZCP8DtNt5Rar1XTjgpavtfKIa1YsWDBvBfrs00Lfg5kkpPxR5uR0RHk+LTkzWRfAyCiLDJr/+KvWXWAoUM/Zjy62d+IPz3rsFlqdFcV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMM+x7Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7ah+/1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMM+x7Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7ah+/1g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9M9iv2754843
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=; b=nMM+x7Pe9xUneoxq
	2osQ8FiWSOvihYZMin4BjJ3ydjqHeePs7JmERcqsKtsC1xV3U7JIVnZAK9aqpWFj
	7MiVDlXpRjYELBf8L6nUZibfYDrZo2LsKjNaMw+hYG4xWUDJ+wekjcCJeDz6Jw2T
	zPeJCyTtjvocaxIDp1fSaBN5gyiW5M8eyirKEB03HFb/NPXeuD+vfyZ1Snc9eT+t
	WcuAXutTbFSbs6KSRPqVUgR927d4XXSr81bWbRyjZzbJ6Hs0R/jt+OzdxW1VqNvj
	ma6741iP5RA+W4PddjQeUvbkUrdbHvTkA9uUZr968/JxorxYmDwP5IK6ZBK8pOXH
	H4lXKg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr51h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:03:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1664315b3a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887426; x=1785492226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=h7ah+/1glPClToMtuechsmwFN+DsEQyJhqDTp64kWxjielW2AcIsqFkYJ6gg8gLick
         DBO4v479L8bBOfB9etengdnvkhdkKcdGI4PBgczqJfWi0CG6olbIuyR3L1uSJhnfA2yx
         Amgc0IrY0k62MWigAU8ipZMSASP+taTtX2Lz5zc9zKklUiovnLZ5iLfFPtseiPRVJIa5
         lsPV3AqNAv7mGQQ/zmdKfP7fmEaC+ry9BO4LHr/ROrnQb3G1CX+a1rRgA5z4d3jhenqW
         ErEw5yQmPz3qQUqHAAr/HlM+FjEGlrpfSp7o6H4kXhlGloR/Frh9blSx3WWN6m3ZYPgH
         RDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887426; x=1785492226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=FjkFpwCi0VVYufG4pCjazjZc/XrGlU3kubOkWQNYrbEWNsdO6IedGWZ+3SaRoSavcF
         Hnb13R5z5DWV6W/IuTjv+vr2chIcvG9dL3xI5yzOe/0GuwvakSTjYUwTB1H9QJ6xOn6I
         Pzy2JYCTp6UmDbY2nwD3d+TGQYiplwE3r7Pbnl8fnLLpUdV/RkCVh/HbZrz88IKABgXB
         JyJJpafANvEBzk0b7ykpLr16zG1dbjnzOra9NMMEHT4jjTkhmB0EF4x/Rjqj1LQ/fu8o
         HRlCG43KJVJKE/rwCoR3tFst6nNn6JT94X4KW2YffBha9sFYM4k1lZMD+TvO+io0P3sN
         hTWA==
X-Forwarded-Encrypted: i=1; AHgh+RpFhwGlCnO/MucZE1YGpHWDGMi4ftx6QPqpbCPoOZd7vrGsaHW3tqcXPRJ8O0znX96TFlX/jsfoiM4A@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFesi9WNj/ADy4jiBHZmgd+GadWdkKd9jJDCiBYRie3guDcJn
	7IjNB6IwMeXwoYnuv3HpUAN2TybmGJLWocUXHn4crYwZjM3lIXxGTqlnJX5eWyDyliz605MM3gv
	FCPgD7MQFHg6UsgD8WhiWjIrSNuwyvAGHYQ6FjZ5t1Kr1a1VW1GjVsI4sy3Ah0ucb
X-Gm-Gg: AR+sD11Xtkwfeuchqu6KTi9y0zTuVO44Nvg5LiKqO1mIZb5c4h7hsByIegTFkXq87Ya
	aZnydilh3pu9IQnNeoeEetVCEYCr/BPJ/ut8C7a8CwXLhmJtGunnkEpeZI9KfjYVZbSYkHl0/Oe
	7dXbib54XYhsP+9JJmE1wPG6PuATMsjjmLd4RebvyKvkQTDc48b1b6xUsSGFdjw5nKSTqNBII9P
	fZfs6zubkpdRB4OZOu0qodqz+8W36H1LDOJxDfffVVrrB1ED5Rkoin85XRf0MVp3gkaflh3Rkcb
	X25pAksuRXQg8sYJiWlBe8HCvXqW8xI5CkE6EqZQXBiq9N8Hs+jaLRDVHxtShFLHCpcTe6XbSVv
	DycddGE7jOcBbVFwjAptdkbZqOu9I
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754033b3a.22.1784887425566;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754011b3a.22.1784887425152;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237704sm4435633b3a.2.2026.07.24.03.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:03:44 -0700 (PDT)
Message-ID: <d34ff329-984e-4ced-b87f-f57863ff5d18@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:33:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
 <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bd6XegLuZtsct1cUvKOU_YK9bVk8yKfZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX1ZlrLUSJsStF
 kNiLN3rALKcVTIZPEZ0xUw+VoHrfRmFf1B/KORXOJwC7naQztU8hU9O5i6po+oJ2TFuYA+D2U34
 ohxDlo3B2klSO4wgr2rbhO4OSDXdkX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXzawNLkOJRSDA
 DVENRdLS6NbhqqCUSO6vNAZxTEwggpbV0z721WEgXX59/NcUPB/whOW+fiO6F4tOt+Om0IlQz8k
 mNr7wkfj+NYY/Nm0htmSgYwFhEhVIt3i6WyHcFaotQdzfqXdYvlOhYbcm8DLD4DOWZ4uIH5b7pj
 yXAryMiV730noK2epZUU13a2TxcoBwQ7PdwqAqXuzej9Uk1jl73bdvhJ8hcZSN0I3TLXACYezBA
 n+tZQKxl/5UUtdsQkIyT2PFenL4KuZTj1mkJh7oZN34Kc4XBEiIByY0gu1mVmYq73UUpkCjOeEi
 lvOWF8nvjZV9H5EnHArn2Ty/m8ZBJ0bLBk5h4ln0WPdcXfpIzS8KJZOWqfZd6W0INzMEGNLLqod
 iS1c38PgSxusaMltFkn67/4Thf9XrBYgaBY52pr1rFxVSEw+IZj8ISQhfO78M/uJIjKGl3h7jZ+
 fSpv7GF1UIx2vo/zzTw==
X-Proofpoint-GUID: Bd6XegLuZtsct1cUvKOU_YK9bVk8yKfZ
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633882 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ieeZjMSIhZrtWKQ3Hg8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240091



On 7/17/2026 3:41 PM, Konrad Dybcio wrote:
> This is unnecessary/wrong, as desc->num_clks validates the index in
> qcom_cc_clk_hw_get().
> 
> Without this, we'd get an -EINVAL, with this we get a silent nullptr

Konrad, I'll update the comment to clarify the rationale behind this
requirement.

/* Maili has more clocks than Hawi. Ensure the array is appropriately
sized and assign the additional clocks in .probe() */

-- 
Thanks,
Taniya Das

