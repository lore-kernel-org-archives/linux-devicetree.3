Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058DD3F4139
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010917; cv=none; b=Bogmg+COdU+tOr4/Fb5kXk2BPfo+LwazhYYLSwcALPcefdRjuzDJNhaCL5DKyyx7z6aJrivoCgkHtsURcKFuspghwAnp09avJeaKs7eDC+O5Q9yGuNymAFSeV7sKoHXnhlwYZ0eNPgOLZnogWxswQAmTaTFBrm+hYbpx71YEdtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010917; c=relaxed/simple;
	bh=xCxUMghW2Xyi8faCH5QpwDEU1W4G+MMm2rfwWySl39Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8Mn7Fwk95GUPureLbVCuGB1uhfMDb+/OeVEgAipT/Qq1ZtRHt5wzTLKRU2fWoDFTfGXozyOCozubIlH5Pbzpa8MjtWCZgB5ozm11tOue6DwAnlIzWmVggrU2ZtL8kNxfqlQ+KDxGBM1XxLUhNmBfR71iJ7032/Ipy8hOhJ+8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw0BfDb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iq2jFpH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw0BfDb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iq2jFpH/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nf782724665
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=; b=Uw0BfDb3WPVliKgP
	JCWmPWixkfJdB0Ste3TtPH0VXlkVC41xuBL49//2EweTIOuqqEahmsE0FH+XIzjm
	+LTB7/wQxHv286yx/L6TwXq1Xg7PP7xqlMPt4kKSCHDdLmqhjgeKqElzLogUiTdG
	lztSsFVqQBSMQ5bng9x54SgDeg44CIcPPF7sgBnmBdiWg0dbhh7ZLXJakC7JJyUb
	FYPJ6C2EmyJ5dGPc7Z1x4xi6hT+k0JwVK6KbmXPNgHHy+38Z/njaot4+kLm30IF0
	Ru4HK4kBhpAeKQmc7ZbzvLMh7b5JfSjDyzK+gBOLDJ/q67WkG/sNK3rIeHAH75nM
	NgnDJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkmm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:08:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso2925137a91.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010909; x=1786615709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=iq2jFpH/HW6WmIn8igySZCc6RaSS6Ofivxv9kxoqzI+Ad+SArYeOHCOBgaTRdJbPFw
         Q1rqNc4R+UzR/5lirWBn1f5syHq38YhdCXl2aibAZw68QVXxI7U+a1/Iy4jcGFLexSk1
         rN3ts2Q1yoAqbicq6S5Gujz34UCkD47g+08N5lKSKxrOBPOmKd8nTw+W57STStDuUlCJ
         R/omUjhgnom3euZ/9NJF78dd9gQghds2v1R90kciKoCBi4+Z+OShUFcznCuKLh0NEuCo
         HXGDG8e13uXM9k7eFCU3gBnHolofFEKQsFQRt4QxzR0kQBktqQdji3IGpLl8g4slwO6n
         LxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010909; x=1786615709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=cev+EjChfxr0oQ1Bc97+t8jQOeN4da50X0U3gP2eD2aU3CcKjoBQYfpvXNDhiGfYZn
         jRE1LPOY8fX/Md0yFOZiBHfCBRicQhe0xIaO2bPiw8wLdvLj6YzSjzGn8Eh/y+0dc2xL
         TEn2KcmDhv8OIYR00EjyeAQYgXUf1aylcBgQT30quMturayMsxIIrqAft353itWrzEYW
         a0FJaFjqSkiiuBwDXDDgL1l0uytstz/eAT9r9rfWafhozgCLYukjfNENqCU5zd0ORxPW
         TTpLbpLsgoJ8Uu1vuYRVjtLBjUfdmqOehZbatoeS4XmEfDVBmbZ5vbsbC9ZxydlsNmlq
         Xw6g==
X-Forwarded-Encrypted: i=1; AHgh+RqPBOKVuqGmaOEvsb8jG7Ex5/q2H90fac5e6hgeXekCAPdHHuyPYR2S0okFXcLv8D4EhtwJkegXjsPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZt1EqRpcA3nQGTwzEd4oxDoVRkNkMxFPPh1FMQhqsc29Gvsq3
	Jz9oiPR+xoBLMGf6S7DYOmTLpp566s1ghs2PY9eN89LvWWvQH6xQuo771r7QYuNDvO94OnPIICn
	jXl37pL6Es0yzPNwTJonVpVvuChaMYnU04GYDMZPNl9pxfeuv4jSudnn1Fxce2Xrq
X-Gm-Gg: AR+sD108J4YAv3aF3DgI9DsbmPL7oe+38RpMRd9mXCo26lA3scjmeOyF4DQFpgcTJ3F
	ft6TRddLJqyTatf8FAvf+8QXXRmwB9lh3qXP03RJhTdU3o3ajGvz1+8MEA5L1lVS97bDbbTjZ/F
	AOrbDbrvTmQ2+15MojKXVSEeLRRofd8HmDuTWxacG61+tCod5Rm20Xt5VTWNCxReF6FfabM262p
	IhXzqctooPa1zsISCPzr9GwIF+mnSPbHo4TZCqpQTpejqiNLJ2S9r7tbnoxdV4x97JzHuoxNMAI
	eHyTNReeNjSsd3c8tIET22JSQxF5WUIpKVLTCSJz/51TmDMnWycLMY3H5XMhoevLejFHH+0ebMw
	1fmUGtONV89eNphmEZJuWZ+oj4wbQA4yWB74=
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953589a91.7.1786010909507;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953531a91.7.1786010909098;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm38533481eec.1.2026.08.06.03.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:08:28 -0700 (PDT)
Message-ID: <36b53e0d-82e2-4fbb-a2b6-3fd7b9c98663@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:38:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] media: iris: Add helper to create a context bank
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-4-da52b5228dbd@oss.qualcomm.com>
 <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a745d1e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=4qxhn-3g-SBwpGBp1HsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: SLCLgMUhzPGrMqSIVYuY5ss-kCbV6teC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX0xa8HCMyacvn
 Jf5a0tB/1tGlZpFJSzXx4wjOj50FIPCGFUo7InLuDH8QbLz0En2aoTD7TLGBDGo26HYDceoVRse
 U0dF3TqPyKPXDV1QL/CVQz6FW1cJJYQ=
X-Proofpoint-ORIG-GUID: SLCLgMUhzPGrMqSIVYuY5ss-kCbV6teC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX7K49gB8b1Zsa
 yRjcOpOvFb1PypX05bO2ome4PTKIthTEzffKjhKXvHFG6w7+mxCIXIQ5I9YFSdcSHdM694p4Vul
 DnYt0xEHB+S5X8wWh9pWhcfK5pgeA4e8ijlSvnRIu3wmvmO1fsPUPLICUR/1gpr4mwvxLUjzlmk
 Vvuo3OGh6oEFdvlceOW/OmuMbbIeY00f9V7QGirTr96IP6+cyMlHyuqqwANFlwXXhYUzxWlWvpn
 vICbpfFa0o375sarPRg7b4wsKmB4rdITiPQnmF7llLtv3qEMQfiwHPf8MzkFXLW2LsxJuGVYS38
 t87RmHD+vtI6LB5MVbBNSbo26BX7wOumDLlhtc+qWufn/USj6rLhZZS0NwgI8l6Mc4yPbbfHyEo
 /gUsHHMU1Eod5fn7lQPf5eHHWSuHBkaC7tflVvYVREa2vR3bkUOxfWC2bA8zEOznqWysZ3FBB0h
 gtOF3t7xDZClpEjXEEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079



On 8/6/2026 2:27 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:19PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range. A stream can only be confined to its range if it
>> has an IOMMU domain of its own, and the IOMMU core attaches a domain per
>> struct device, so each stream needs its own device.
>> Add iris_create_cb_dev(), which looks up a named child of the iris node
>> and registers it as a platform device parented to the iris core. The
>> child's fwnode is handed to platform_device_register_full() so the OF
>> core applies that subnode's "iommus" property and the new device gets
>> its own IOMMU domain. The DMA mask comes from platform data, and the
>> segment size and boundary are capped at 32 bits to match the addressing
>> the VPU performs.
>> Return NULL when the named child is absent, so callers can treat a
>> device tree without context bank subnodes as a supported configuration
>> rather than an error.
>> Backports are intended since the first DTS of 8550 binding schema.
> 
> What does this mean in the commit message?
> 
>>
>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> 
> How can driver fix the DT?
> 

The idea is to backport the driver fixes till the kernels when the first 
DTS landed. Ideally the fixes tags the commit which introduced the bug, 
while in this case, was thinking to keep it for DTS.

>> Cc: stable@vger.kernel.org
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>   2 files changed, 29 insertions(+)
>>
> 

