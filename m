Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB111345ED5
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753482; cv=none; b=QVqQx7bvEuoQtTgWKAxPENIOaFd2qnG65YkO+IbRe4oSk6yhk7kgIUl2V9FulE6OUuK7v6p7w8fC1GUXZYKnSg6MRCZqR9m1HHSjdICVlw4beUh5jnRSV9W12mTXu52ygCWSsztOlWgUYjz4JhC83AkOqo7RN5N4cWgF4/UeY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753482; c=relaxed/simple;
	bh=wU/TAOc1TtMPYhqSHJDjjRYz65PJWykTYH6CY0pB7FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMMCqn8ke+nA8BIc3PrXVGOYZDA+uYeHezjZZaT86AnmPdODe2dr9U94Jgf5HOWxhtUAVTgvrqzv63Ro2yGGZjJ9DO0Y4Uz+IsXC6mdTr3lXkNSVNRk6RUv7GU4RepwfDI5joy0f5GTp010vGHADNTitRQGnzg/N9fl+9Lwd4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlC27PSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U82zbGtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlC27PSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U82zbGtp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67370bR03960150
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=; b=IlC27PSsm1WmgB9i
	PCCwaXtHjKfXKmzMCCuXaWbH2SRfUEFvor/MQYbmaj7bo3deVrHR7gzrZJSnTFti
	DKgC1NQLVqXrMPEWzUC1AetY40UPqTFo2YxgL7SBJ6MPdsxCFrx+QiTZHU8IXMj0
	tkiO/jsQlNhIhCutmpMwFc6xm9EtxowXndQc7IZFC/PJf+xilhvLSyoljN/wTvX5
	Dc4gL6BngvtE7tJzTsuwHkPQbTHr42gIzzo6eU9PWfP2rG/QVJbvF3EeqBYRH4g/
	f3XVtSr1Wfk0pC1KlSWYjXA8nzr6XjHEdlYrYeJ0EHMdGgzUK9S0+qjshQnSJ+bx
	sxfR2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajrjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:37:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so95153175ad.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753478; x=1786358278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=;
        b=U82zbGtp+bfdQaxTKqDoMZN7zLWJGH5Aa8Hpt3emB82km992LQCRN7QJAUqoy5zynd
         4PGRsziG2ZUITzeyZJcfGFYUL/qrVed5cs3davCWaN70iFqJz+TOhxHTY+piKOQdvPIl
         prxLPB1sRkEV6RBjXOFgmfmn03+xscyJwisb4wDM1lZ8iozJiHScQk6W5MnOXS0q+Aex
         p7DI4Vh7dythnoUfFNkfNtiu2W1TSLTiqeRFbTjMpctWNHsxWveyWhCe/yQbyjkntrmx
         erJRDnK/IZlIolGaGWKtqkhQUU3rszpCps0QIdZf8eXtMJAkxaAr26f7AuAt5hgN0yLW
         6UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753478; x=1786358278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=;
        b=B12y6Ry4HR49OVpLLUydoCG+fzU+2s5Qbg1m58ylGAjUIt+y+avykhA2zViTRk3X+n
         Gd1m6B93FL6x7uVad5mgI30zmgT8J2XIbc3DAiSbkxRkKmaQ1LfF+rJZLAgXCUOlMR8+
         oIzAqy3nJ8y02ZjbbQ1//BUr5V6xLSGrikE/XNi6uOYyhYYzUJ9SKYIM41jFd67bHOzD
         CVSH6UmzDE4nc1MMjP0eR3LZ4Cyd+DZlDDNwZ/PxwhYPA+JKs/2p1TDpGCjD5fa8RkxR
         JH1iKOdsa8gDq31ZoC3P+rBrCfBkZAwqnS8d62gjitDHMVV5uf0Z+xzoUCrNX3CRAJl6
         OwdA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9aoco76ChMJieciUsYvBQitnjY0NxmoLjtmaM40LdumBxhcKQaTni0JuUf6YO9xHvHRS+tVLtGMGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/ol9m7BTbaQdBevW6hrmjZSS7TQwotg0bKvfXkksCLQy5vcR
	SMvaq1dVNDoSWawBGy2v02yTQmCnCGWbRtPCQrhkYay5D3ucsluJDOVPer+k39Q78jWIlQK2+BR
	GblR/w80Mol0Bss5ePPF3lSrwMZ4LMtWD/OxER85hq00EpIYib49n80gHndFh3aYo
X-Gm-Gg: AR+sD116cpfkDRxmA/Mt0goj7znbA2ZNMe1m9K1OZE4Uv13+e/6M9YoU73+kQPlQzL3
	fjwtjyXyYRAkI70Bg19FxhX4Rd8pCt2MuCziTg9BN55BHJSVm8Q586i7oIneDKJzux3ry5CU1Ew
	QrLHzTljutVuSWD8ayECa+RCmpVgTsZ0XZZ3g8caJddsYorgmi3kni1dmUn8CxRfjgv9o0YvdyY
	3YK70YGb0EQG9h8gbCq8JlQOygOEjSuwl7lU6iLxbIlrqO7StqOrIe56QlzlRxxDlPBYg9S1I3l
	Y8pLLaQvzTWO4M6LuYP5TAuRhsG0/DbjynooK5XYnnjxYoYKtZk9RRVRe0StKts+uJTAEKJeiJD
	LMgCf2XrW6rAiaYBhm6cym3pz02CN
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr9773919637.18.1785753478277;
        Mon, 03 Aug 2026 03:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr9773883637.18.1785753477840;
        Mon, 03 Aug 2026 03:37:57 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm52984404eec.4.2026.08.03.03.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:37:57 -0700 (PDT)
Message-ID: <26fbe995-8640-41c5-b1a7-59ec82aa4459@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:07:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
 <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
 <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
 <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a706f86 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QjLB27GhoijPk9Q2gycA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: J2hjCwU4F9J0tWSgU3mazAvEeAlfwNg6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NSBTYWx0ZWRfXw36J+1hDaeY7
 vT6Ab8G5UkJy2WOoHmj6HXt6GlpOoMMUfJ+zAULXybCoGApg6D1Ni7SaxdFBQNUSqTQij6C/7K+
 0Je+lok8+z24wvCbrVOboQxxTwsyrWY=
X-Proofpoint-ORIG-GUID: J2hjCwU4F9J0tWSgU3mazAvEeAlfwNg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NSBTYWx0ZWRfXwUFrNDs1TVjg
 eZzlmVfQQ4XbpEzP9ra/PZUX5Ql+xZ0vcJ9FJlDxZlNT1uQhvA0jtvGgaxhqDcOGnGvwGSHYKQa
 Y+Esfj1nANdBHNovH9fMpaprdrX18q3csV1zxXkRPxgNkpUBqaDRrSCaWbwxyIRmPyUfmm0T8Cp
 DJknWFE5ym5BSYYg+r8crOSc5RCX10bYwSexRgONNq9/hsv2ucpXjeipPxlKrR9+jnYUEZU2iAb
 HFkSUiFRULxeDY0268r1NO2gH4M2Rx/NIZclrAvB8l170+B8GiOB7CdzLwbhtfhN2NLOv4HM9lS
 NfJbcWNHQa6c/RpdoZiIKAKOQH5mAb1kLGh77OMOa8cF04+W2enCdzP7SZP3ZUjDXWhjBKdmrC8
 9JEhmPreCso5tFrrI07OQsvl+TCMEPEcS9opU8GtClbGbz94wGlQTCODrC25R604hnC888twi3a
 ZqabCzaSWag5WfxymiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030095



On 22-Jul-26 6:10 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 10:28:44AM +0200, Konrad Dybcio wrote:
>> On 7/22/26 12:22 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
>>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>>>> Do not mark MPM device as power domain since it leads to idle-states init
>>>>> failure because of probe dependencies.
>>>>>
>>>>> CPU cluster power domain node is kept disabled and hence CPU cluster will
>>>>> never power collapse. Do not register MPM under it in this case.
>>>>
>>>> This is only the case on the RB1. How about we fix the issue instead?
>>>
>>> I guess it will be fixed by the MPM timer being programmed correctly.
>>
>> That's patch 4. Can we test it out?
> 
> Yes, with the patches applied, cluster_pd reinstantiated and set as a
> parent domain of the MPM device, the board seems to work correctly. I
> was even able to revert the I2C-gpio workaround, the device works
> correctly and can reprogram LT9611UXC firmware.
> 
> @Sneh, please post the series, including the fixed Agatti DT (and
> deletion of cluster_pd + related domains from RB1), I'll respond with
> the Tested-by tag.

That's great to hear Dmitry! Thanks a lot for testing this.
I will re-enable the cluster states on RB1 and post in v2.

Thanks,
Sneh

