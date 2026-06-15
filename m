Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6443A9639
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501796; cv=none; b=YlSeFxBPTUx/4BGJ5SS3S25XzpW9T7vML5JcUDw+Uurx44SSeoNRV1qwfcsJK29y4a1jHIv9ALTheWaadZ+es6777D0gWwGggEJRCXaia3QtPhRCBfcFukBGLVbLachLqscGmA9pt1HALcj2VWWuWSXJ5cJ9O4S+lq8EuQN+aNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501796; c=relaxed/simple;
	bh=dNP5/sUUcTWoBKBcTRy694X/+WgUZE4EIoX88E+08J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kwh6X/zpV4N8MvxWR9uRzI7fuvLPzlp9oOkWaZSWVlY/DtUNOW9N0UIR4AAho9vDsEYFIETbCMt+ElJ4sS82s37ko6c8YDtaE5EX6TFXODyD0U2hq6NNPRykqGLzGV1bU+ChP+T1oQiGVxHZeC3DFbZq6mTUWARKxjVqnq56/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osoMbfcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHXouZaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osoMbfcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHXouZaQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kRwj3224624
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=; b=osoMbfcQzSahrUNT
	CvGeXpZxqQEAoYKL4/YqmDWDD4pH9L30lKXrjRgO9ua6ofpF57K8yDH2oL0mf4KZ
	KPZHGLxVuTIBLJ/de7/VG6IZN2HHwT0ZLwcGrRMrwMtRbTRouJPF/wkAE7ZXwXkg
	d13gZkmSUpDjpZb6KE+BRJe8QKBRfMY4Ooj4OAj+fAg539eijnMgasSWo/kxGDai
	8/XlkbOBq8hC+LtBOXpmhBFgTgQ/VW6eYzXbqSMrzyB3p/SYL+qy06bgI2sM4RtR
	UnQSHZwCxSXkTICs4h7ugbDGpKd+8i4HfcymRVzYrBk3R5FwqW8EUjuZ1S6FBtpx
	VHymCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5pqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97415004so5627056a91.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501791; x=1782106591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=;
        b=HHXouZaQlmActQZ308tHnHmjPOeL4H+DfZRvxPWMmLYB9poY7pBmy1uxmBH++iwdS9
         r1Y/9PvimdwuQCwOyoGpkbAZplZgQljkol15CjY0R/pZuMaOYsgsGoyQCpyxyaPR9RoZ
         784/OLpFjvY5Ts9pj77nRzA40EMSbARh0dV6RwW7ZoUcqbFkZYgcYzm1Vvxy/DTpPx2Y
         SvbiQnML9Z0l++kpfnDMQLMRh3NyN3LVuZ283DA8I0iqL/5xo0kZ/m6KDKg/Njn+WRu1
         0lz2Hos51hfPZTD9JNTcc9WKkWLsmC97ITbgGVSJ+jwB7jGBt2D53Z1+ywn/x8E1x9p6
         faxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501791; x=1782106591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8o0It/OrdXLPNueLkoJTCzag1qci+lqYellgsJwjJc=;
        b=RvLrWFUFPJzb6sJvsMwZAlaYBM/NAwMDpDcV0tXUCZRWDIFpxQW+cMyDE8bG9kx0Be
         ZIccs5LeBjk19JnIDXzk2P3P+Pk827Ol4OU45WElj7ya6REq0e8OBmRyTVDKqBspZpFi
         YMkXP3pcUdU5Uaq2pWXKPsQDbQhyOjjoE0v3cbPj6X44zLLJt4kCP/1vFoc0XPbkwr/1
         MIuwL5u5VxgiGlunTZ+dlqOJhExJDcL85XUscKdTBbEdA6gUjEgBdOXObl9NaQEEwvSd
         vAQdyRbzPy4LP+kgCCWFu24ZPLZryIdGbv9Qz4udqv+8IV1ScS5tvBetVnqaDSXy2yEp
         X5Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+k4SiZFhcRBY8jP8WEoEjHSKIeNJvpnesi5TutE4roRPM+VtFrx2avBUiqTwya5MWbxTph1GPxIyFL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyal6Yq24hhbO+4O12HT8hRP0ZMLaqM96wv1ochMMSrU2q+VZw1
	KDxy3DSipZJO+sXeN7vHYjsWHF8i8uNd6sTHmZMUH+oMkFq3JI9DuHkfLMOsujHR+VRA0IIBHPW
	yaY5rpg/uB3ayMeH3xEzovUD6a8ZFXi9n6Vxv1RMKSxzSsmPIlebOCIsib1Lx6PmU
X-Gm-Gg: Acq92OGnoHs4WY+MZG+ZIfbSWm7xDytEBMro5AGzO6Zf6w/ps1Su01QuoAmGR5FjhZA
	NuachPBmEfqWX3/3dkXEDqVcSFVgaKwicEVBROSRjOpD+iujP7G4Ns9CNUpVaKveycAvfNNcfQW
	FdsSzQnX1lSWNxIj7oPe3SNL/EDaiCC457Ba4uq4xbJdxg0d0RgL43qUf3U0efu+l1zlYGbvVHY
	cOExi6K2n+GrZBJzwhwLrVO2uzr/au7vBlWO6W050cMRF5Q3/Q26BVl5DE5XT8qc7WB8vWZr2v3
	o/Hp1HkRzf3Ps/jvSsp03rJLup37zFq6EHVmION/Y9X0vjUXVV8EJ5dPgdemsjcokWNKv/mqbU+
	2gzcu4diIvxaxZO3XXdBGia1DeFUTtEg2M63jiuE9RvdPjPSAl+4=
X-Received: by 2002:a17:90b:1b08:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37a01847865mr13294922a91.2.1781501790994;
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-37a01847865mr13294873a91.2.1781501790544;
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:30 -0700 (PDT)
Message-ID: <c7a84000-f67c-42ee-9589-ddf57fff0f1a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
 <ahWTZj727RCNZPR9@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWTZj727RCNZPR9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f8f60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2aojqq8GJz4wwv9pKCAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: UEeqzufpsjKKwJZLIYMtc1AkXNiRdYJH
X-Proofpoint-ORIG-GUID: UEeqzufpsjKKwJZLIYMtc1AkXNiRdYJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX2yqtxtybAj9G
 yY+QwQ/21vtQu/uvqIRfMNBWZmWDY+vB65pL3SvE8XYdJD1BvgjW6IXrOxsuNRoaUknmorDOJTs
 Eh2m2hSBWidAY94JMBDEzymCVFolFRgEmdW+LueP0y1kG1r2l2zBPq8ahuWcLA+HEwsRQNz3b1H
 XH+F/H6UjMZAJUVg+Q1NKmVDP2EZXmsUjn0UX99HIPtC7qX0EDWO8spOu7gDWUyPE8g2dQvpqax
 GgrorM/OGHzwhWDlXDCrUjnxOTE/z9W6ZivyF0w3a+t7TpDngTXmKbwXFVMe0mzA45BZ85lKD62
 CxIg2cKTtm1DQxawmetU6bwdUYP3DeHW8wYvaSe0T3uIZuZdl+rGhf/ib2OMDfh2vHQiCLTBfiE
 i/OwOr0QPHrL5VMItA8ZE3xZZLJQ2R4Nnr/+rrU0n/+p/acxqFB7+8J55cYxQllfzvAUsCgU7IX
 zhhl3y1Ho2XMjEKwSQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX0Y5khNoOSnpH
 o3nBBGZJjDzavMjFzNV7S5Y69f24Cld+rVpc43KY3lXEjvAYL7CpGM15HdUv1bCbho63Xh3QeYX
 A6D8f4a0B/5kp0CgRWF4BOTkV2jb5jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056



On 5/26/2026 6:04 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:39PM +0530, Maulik Shah wrote:
>> pdc->enable_intr() function already points to respective version
>> specific enable function. pdc_enable_intr() now only kept as wrapper.
>> Remove the wrapper and invoke pdc->enable_intr() from caller.
>>
>> Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
>> however its only required for pdc_enable_intr_bank() which uses
>> a shared bank across all interrupts. pdc_enable_intr_cfg() do not
>> required locking as IRQ_CFG registers are one per interrupt. Move
>> locking accordingly.
> 
> Well, pdc_enable_intr_cfg() is still a read-modify-write. If two CPUs
> read IRQ_i_CFG at the same time and modify different bits (e.g. enable
> and type bits) then write back the modified register one of the
> modifications will get lost. Can we be sure that this won't happen?

Two or more CPUs can not handle/configure same IRQ at the same time
as the irq_desc->lock would serialize all irqchip callbacks for same irq.

Thanks,
Maulik
