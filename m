Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBA4FC32F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055899; cv=none; b=Ktlk3VaJ/BkZl0OxwEGKI/6lGzLhqQrirjH4+kyAXqP6tfaEFfktevEUPgTY/3eLdQn9brqZqq2rkZF1E5GhHijUHH7SXP1YaPdf6Dc1FpIXFdaYXbp6eTfXU0z2QW6xesSXQwBl4m6dLnsrxclFESCEK/a9yCET2NPHK00bDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055899; c=relaxed/simple;
	bh=Sd+z1p1eIGcL66guWgmMJjfXMJAZHEQ/jZYzkERfiZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DskeIp2gNdkyG8bToSpPKy+JJXWMZFjbIQRlpoRmX1NBohho6uPGxQVUQumCk/DH5M5eW6DnQB12KDX0wso4OXTmZ5nxVkDK/NeV7iFzUH43mpNlzfHpXZSwQGMR761E8BlqBUiEWs73VfMYNzghwb20JOs7u+7Tw2IC9HUFurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAAXBKHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zfdr2TPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAAXBKHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zfdr2TPy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6Rf8w1682634
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=; b=eAAXBKHGbHsEaIZ0
	ZYI32s/6R8DbStEZubiumXpOoNN6VzmLcS7DaL/64Z3Btg78CeprorwEnpK7WxZM
	IQrib2HXAKR0LJDEZXBL6crrIDXBBOHP3tC1qAXuCWZmvDjcd6+zjNj+ZFiD90iw
	wG3onEF+4YJ/cFgqmwHfp8j/ShxRSy7qWMkvySwwn6dEnlE2qI+GGNQsoP58Sxp5
	mVlZFG1y2/G/GWYP+olvAfREGrChMORKBMbxzjZsyYyiylovNfQG7tNBsafTqEuN
	pcaKekGfR/E5gM4KH/3nIx2kigRTMTuRwkqLZ9tYW8H6mKywj7kjDbXlKTxy/ACB
	mRfIqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03s68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so71202825ad.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055896; x=1792660696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=Zfdr2TPymXYzZzkKxsPnaVLkUqKPkEVAcdJFih75ppvxCycCI+s+z8CLLwHVF3dHKZ
         A/V5QgHFl8q3NCfyb/vvg13qK3Rx5I3dzsaUPfjds8Mu+HJfJR0tjU3HF52STTVo8Xpo
         uawp5UXdwNJPeJ27e6PIKwfU4cuLFbtNhTMtn/HMaoC+9eVP1C7K0TJOx42cgvSflwl2
         dbtQEG50nSG/JDjTp2PYIzEtDy3DXx6F6pMFjUtcG7IWIaUPOPh8ehgwf0RXxOuW9hvP
         xuexRUAyRzOaSxnyvpw7vvXeVQMTOhlMQRGO1gAomF33ZIRorIg/Xt04tsSxLqrln3GM
         jnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055896; x=1792660696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=Yt2NqcT3yNxCDbTgL9TJmeez9mTX8ItxS6aNnKoZMe8kpjJtTCpg1niiJOK3NobMN3
         xK+OkVPztoyK5NtCX8j/m5v7QD+9S8W/mOSpHH9XWf7mIwHhXGK6yn1St73UfKBO4ozn
         js+/lQUTafq/uOSbVARMT7wcT/FmAWKHBWpQU4zp6affgXFDJOCfozvXjGugN0hh5UkO
         GRpIwV06Z9Lox2+3N3hCDf9swMGUUe9TGvmmO56cTZw8puOzw1/pnhL+ST/4iUdl/ZUq
         drDVGFt0l1XypaTd5io2XBj2EhOTHCgiMqzVYcuQ5RXyY3SC0yKPSU6ULSu/vnRZk7WT
         sXng==
X-Forwarded-Encrypted: i=1; AKwUvBxdIY+59oA7L6M00Yjt5/gP8KlI95sAcZ+4NClHkCAKHQkuO00xD7tSEJqb+/TuCFcbYuo8VbdI4lhR@vger.kernel.org
X-Gm-Message-State: AFq9FYL+tN5wasJAwtLlL9krIgSbNwkwa+aTSIYDz/F44kpgwuhBZMIu
	aJVxjkekwcMuSIooWBUx41MtXkZqtSz9oT/wmgbgVHti85QlPnTpIA/MXVuSlJQDJtZdkoNF7/k
	iWP5K93K5EE3o45wKy2WIudij9nZRG2sQT0AxN6m3Qy/tpglqz1/pLiNw2EAV1SN6
X-Gm-Gg: AYBFou3AhHx5dxtbR1Ggutv43Ug/fxY6Lb5hF+gmEAPYXZRo245AwTjfbZ/oTx4GCF7
	QTG9QAqiBSjga/57FmjKI8ZmVDPBH0MWI23zGApiIkuN+qB0yHlOVWVVwUm5j43DB1UBMfATYDP
	zcVgOV7+/hIeQ1NhJVqIhs0yAyjDBV/LUpF5kppDo7qXHHj3PEiu1yh25xcb0xily/nOwkAeQKi
	gHGJyoIXIT27cdWU20j1Pe5c8HLwy7+NNWZhMU+44xvQZeO3sgyOm/ySET6pbuvjdkdNTlywtps
	Ejb6vDM65UjYnnap+ZCHt4+rL0NQEQ24nqeGJCpGnSdAscxAKSSBDlbyZj19j0kfl6m/QegD7CH
	IIcEOrHpeQdrCMY5za++VmowyRaj7bA==
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24795835ad.50.1792055896362;
        Thu, 15 Oct 2026 02:18:16 -0700 (PDT)
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24795605ad.50.1792055895911;
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Received: from [10.206.102.180] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm79142365ad.43.2026.10.15.02.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Message-ID: <2744aff8-9b33-4244-86ac-6fa70c052dd2@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:48:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
 <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad09a59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=N5pWYOkdc-_Srk-SZrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX7zvE3NRfC0ma
 tMtrpCyeCKz3kNSO2dCWNyoFw1KxNRMt3g7KyAPosZJU/BzBbm6tXrQpwIy3s0vF2SuKuYu4iKW
 4ZY9reqBd3aStxC5NsDRF+YcO/Cp0xQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX5uA3U7Nmu15R
 aDDS38wgP02eOk73PggCc28mvWECs3ipbdXbBPK9M7Y2XFJ0DUkwnfof571a+i41nO7Ai40w3zL
 QUB4cKJL0qd+8qn+lgZI8bMQ++Oxi8t1LEvlb+dsS7qdLk5gCUnvru5jMGjw5eRUw8oVVoQ5br8
 KapOQOyuFhPlDR+qj+dioiYsZS02C0GP5GK1C+pFANs9g3BIMsvb8ukQ71sqU5BU1QuI0kYZlSB
 N4MjuhFJt3AvTW2RwXWzx8/HTRN2kbxGpquE/2fUPcUuk3F84G6g3Mm2czJLvfbLHHFuKeKaLbb
 QnIoq81QkgAhdtT2EpMB84tmxmzkn+NLu5gIoqQY8QeNnVGzCGChwVzsvt44/FM5OFlo8LwW0fE
 dwtA498TBDieqgw4EYOdPAYbXMLP897wXvyhjgSTKEFyPqzolX8/gIpEj4rmHf7BiMZsrK2s24k
 xp7NI9psQ8iJTljmL0g==
X-Proofpoint-ORIG-GUID: AP7XGueoH24KVgPusldLT0BRHFDHJOPR
X-Proofpoint-GUID: AP7XGueoH24KVgPusldLT0BRHFDHJOPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036



On 9/24/2026 12:39 PM, Shawn Guo wrote:
> On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
>>
>> On 9/23/2026 7:17 PM, Shawn Guo wrote:
>>> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>>>> The nord platform integrates the Qualcomm iris video codec hardware,
>>>> which is compatible with the glymur based iris implementation.
>>>>
>>>> This series reuses the glymur DT schema to accommodate nord iris
>>>> support and adds the required iris device tree node to the relevant
>>>> nord device tree.
>>> [...]
>>>
>>>> Vishnu Reddy (4):
>>>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>>> The binding should go through media subsystem. That said, this series
>>> should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
>>> patches.
>>
>> Are you recommending splitting this into two separate series, one containing
>> the codec binding patch and another containing the three DTS patches?
>>
>> I can certainly do that, but could you elaborate on the reason for preferring
>> that approach? I'm trying to understand whether this is due to the expected
>> routing through different trees/maintainers or if there is another consideration.
> 
> The routing is one reason. The other one is that the split will make it
> easier for us to build Qualcomm Linux topic branches by pulling patch
> series from list using b4.
> 
This series adds complete Iris support for Nord and contains only the
binding change and the three related DTS patches.

Previous QCOM VPU enablement series have kept these changes together,
and I don’t see technical benefit to splitting this one.If separate
maintainer-tree routing is preferred, we can split the series accordingly.

Gourav Kumar

> Shawn

