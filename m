Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B77250BF2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726062; cv=none; b=utEDwDHDM02RxAazlBWFnZcO0rkHJWyJEmkobp+rHKa/Buq/SCWSwlmY0VDSqP40OaEFhUQSe5hk0XfLo/bSBfE2TSGmCQlgjfPbTHOIaAlTJ3+gUfQpZADW5FUn6t03nEI1sdkGpU3T3mPWpXfH95T9Cn8OMFY3vWB8gNpV4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726062; c=relaxed/simple;
	bh=sXtgV8XIR6GTJEx5iIjPWXzdIUReRNQpTPU9/R0McPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkOUjHg1vPz3pUy8ENaSiaISoo5BUFWmJf9Jyawr6nioUgI+zFk63+YfZ9DgssOKHZqP2F6Nywdx8OseQOtJqlgIrqSLV4pWhqAodEe8mEHRd4UQkfkVP7i1sLEtet+/D5d9tWuniyhpfRWSsSe0KgzOrI+4pB6+C7M0rXD2Uvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVuMsVk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwlmQd7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVuMsVk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwlmQd7h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dV713916158
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=; b=lVuMsVk9uP1WfMif
	E1VDzNRvbs09IIFxDOm+TLCQLnkYGKE9pzb29KEMJkbYJGMvQAVq6BmtUwiZ/U73
	+rosOfuy0ExE7nMz/T44XfjlGvZUMk0xMkPOb3mjYD26x/VHaAVUcFHrNsGIGDHJ
	SZ5TOUY6NHm7JvVVC1ndYmGr3qh7/XU2jmUK4c9697TUqy7u0HEpvaDzrHssGqP/
	3PBtAse4iP2wQ50Y4UQJQhly9ACcUnPR3fX0WfPwn8dnqcStNp+IEPkddfkUDBuw
	zKJ5mZrwZGzqnLz9bJHwB5i8KY6FYhhuc/pvI/Qu0b+N53m2yfFwY4i5nExn9ggd
	LSWfrw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtkty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e921f84a2so1267106d6.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726059; x=1790330859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=;
        b=PwlmQd7hbvDlCT/mqIrUhLrFkmxEyTTnS4EQKwMBrMIPFZGivnImdPFxO44DA08I1O
         5jWJc1KxRdMSGMgD+FBOXUWebDqbq70s5LdLFPMPufE3EXvaaxANVwLnhuXYAdCBlNCQ
         3fzQeVtqKuZ5tuH3g7BxEoZgcqj4dNtxY62ChEZr16QhwcbFQrRZXEpCiCCDPhjq9Pgi
         aKdQYvfvnITkZjMTO0ZvcGMlQEU45YO9WVVmd3r1jTCv03FW+YNOTDqOyygJk1KijoAM
         XrzvXLAgOq5qDlLPdJH6Ee364F2ayPdO7oYN01SitvEUV0IcgEC2pA7og9olUzbaf5UQ
         yRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726059; x=1790330859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTJkcejpzyl7UHyeLK4klNTLMnqbEC9yIm+DzH4e1kY=;
        b=TqWRXZFgkKfJeLwUgc/hzl1xjr3grNNFsKQyiOhQOaEaCBRYOac/bcQG49mQgRbDCL
         cFA2GXA8PkwM8QslYfTQfAiEMZLS3WG+sPZXgdidkBcejnaFatNeNUfDwXpIE6cIyqsM
         AM6B9ZL62k7gwj7AaQXZhCwZU34EmbxiSi0DxRW8x46q+jE4YNqXroW19cqfmCHBg1db
         k8hznUCU9uHyo68PcZkItARSadfeVq7eDAsUw/yIx4yLYI+e/3zsTE4hzFWE6bkbQKbp
         2cV/j3nAZ1SdN1B04isQrc4pxiYDEkRumbG+Bwx6h1MVI77UKN6WKKBtoyvwUZKy0V5b
         EWoA==
X-Forwarded-Encrypted: i=1; AKwUvBxUbRu6wEIfiMiJi1+TuTF3o3DexUrj3f+BP6YyHhFDqM4e1LHV3xPmy4K9gMf5FqX5DuUNtrUtuebu@vger.kernel.org
X-Gm-Message-State: AFuF++m3CzXPo4Q81Zyd4YokSg5poc1IM8CvphRhJXbEUCZBHDFSYp62
	GPv+HwsojHvW0miRAzHxcwBgx9arXE9yDWFtR0aSa/umhS+HXhc7f2IwsuyTbr/ozo2SwypyT8I
	rfo0mZbAZqnwvQQtwgdhYtinJMBY/y7U/ytqv+fAp/cgBgfniFCnDy6lKelT1YHg6
X-Gm-Gg: AYBFou3MFXXR9XRHe5GAKzRvi5RVF1nYp4gY4ZYMNRBM7V1cFEGeKbeDaPa+6YEG8GF
	b0vgy1JiFjvt81WeyGMosWwzK2mHaiQcHueZGpYuZ9vZPaT8sd/gaTkrNt7bLGzHdB56jzbg2A3
	IHq4jJHk1Caz2CSkcoNy3dYnRiDOqEFWn7eCN/owp28/9nlPemvRqMtFCcoipWcNNBLYuBCSprB
	Kv07h2ycwCVG+2e598tM9PlRPk4xmqxrV3cYP6VTh/L3qAowpJ9xsk+t4KmAqZdfWDw/fBeqwQi
	xpm4gd9qHbhf/FN6a/zHiHmCgn7Bt6TwGqnB6w25hDyHpC4ax+7G2pETSknG3BjE1uH7YPWQ3tk
	mtdr4ZW3iI2SkKgF0KQ3RQg==
X-Received: by 2002:ad4:53a4:0:b0:912:c74:ea6a with SMTP id 6a1803df08f44-91254c2f01emr25542476d6.1.1789726059437;
        Fri, 18 Sep 2026 03:07:39 -0700 (PDT)
X-Received: by 2002:ad4:53a4:0:b0:912:c74:ea6a with SMTP id 6a1803df08f44-91254c2f01emr25542146d6.1.1789726059027;
        Fri, 18 Sep 2026 03:07:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58d56a5dsm650749a12.3.2026.09.18.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:07:38 -0700 (PDT)
Message-ID: <a744dd21-b957-497d-bb45-a0cf0998f52c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:07:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfXxe7c8jxbQB0o
 Jna3MPbOVHkU1+V13rhKzVEV2CGFs7IUzFlqwgVqpGiJ1mmBcDJPGoSsFUUxwM2j7QP6MTYDrOI
 rpr4B+Sp5L7jGeNE/WivHTN3XthnFPmn/6F6/PjfFzqPLTT8apVdjtwCI+Ly3dvgwmaZPrTBQ9e
 w9V8DePWSY9gY6FbOCfbQrZUfIERoMHWJJRWpSsd0qt4etxxqlMfb4JHebC1XRMmhW3LVuou/tf
 Qe94X6/+xR99DXXi9qq/eaUlD3/Zab4YEz7CCLFxgmd+ELhu0tS8hiEaSY2oFK8/2726zttOyTW
 fsydpcyHITHJmJU1DthWbkfPWrVFAs2M4m7zadZlvsJK5eIifKos6RdG2TsQThFJRheVaVn8z0w
 HOS7ajrglnMb/F5SYXWdEhC9uWhv6UuVbSUwdF8OGtfUDt4F+lkxhPfPug5z0yDmGu6PiTncOvg
 yPwyb+sCqs5ekFer1GQ==
X-Proofpoint-ORIG-GUID: 00eP-IiH51sHXhENc4RzNylCJmRnZ3Ez
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7Z7NdcRFmvHT
 /PBuQvKA7eL1hPoW7B/neG+GT1ewqVC/gjAP905hDbjeF6WHs3sYNI7xOeM+v7V+rVohNtMpd+A
 Mpyr5IEJyxed9kXjYT86I0WmEC3JKcw=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0d6c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 00eP-IiH51sHXhENc4RzNylCJmRnZ3Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board file,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
