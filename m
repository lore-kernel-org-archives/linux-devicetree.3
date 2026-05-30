Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4617555
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165557; cv=none; b=RKR0GJMA+Ngv14jv7V2PdCca6IKGE8ZUMHCXurpn6rVgWdSrdTwP3MYz4JtNtV8GXcsizhSn2EkDvvDS1NpOAfmJeAYJkPXDyPzwZQICTv5JV8yysshVvQ/HKrLa6HDIrl6MyITs3EJLSYZnsEtjlmeUTXqLqY0LIcqv8sy1ixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165557; c=relaxed/simple;
	bh=XNmqWPCjkIT/ZliCL7TlGnWUU2zGS6zXacCYJ+HC6OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHPyGgsVDKGNf+T6h4jlglvMCShyDqGXFsbxyZyw81JQ2JQwKchPGXDu6A47J5oUItom3MUyXuUrShtgXlEipt53BgkER1fdnp1Zn1iQaZwWSIeEfRMsTPwnx49FrwmvSQxB2dNy71npJY4ApaRwKzOsphHlp5ENOj85I9qIAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TijMDtyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMrpiXMs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TijMDtyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMrpiXMs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOS8r3071454
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTxwIUn+I2XU/1G/Q+9zkFJOGVGZUeY2eTBv9rFsEpI=; b=TijMDtyUksXbENx4
	d+aImu6vsUm6cKeF7jyCAeFqL34FQtwHNmXWsztJSJDV4E63VjGzkCN8tROGRD7B
	t70O6Xu468DmiuvBhDX20cKH6gfbAGGAQRlmbHBdid0zVRE6lXK5C3Ado714W2Q+
	wsnyCiXVh3tb8HysTNNQVqV4WKeJ0Fvi1y8saliQ4t6ea/j5lR9Dq6rgSb/6JUv2
	KT7D6Uv0IqXHTMEDd7vVIBZy0zMZA8Fy9pXtPEuxhkelEhPjPRcLCrrlu8wWkSso
	SCslM+laEDjUySQBc/EeSkmxBh1d9sbaViq84AdSfKxCX55WX0BpJMMR5bmvcUkX
	1oXaAQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pj9hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:25:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8584e80bfcso533261a12.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165555; x=1780770355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTxwIUn+I2XU/1G/Q+9zkFJOGVGZUeY2eTBv9rFsEpI=;
        b=FMrpiXMseTRN7mvGbYQ+dHd6l9PK03xoybZUtoD0/E9BKOe+J/PoC1hQcaQArdy3vu
         jxVpMAxvRuCwVPHGq/UAZYNzAcfmaA9c1f1q512ceaZfhYmQuvo7TRejRl3AQvrRRAY5
         GyBlaJ9fdQt9/k+5sGwM5q0GWakR+wqC9Q+6+ROL36E18SbB/3FbDQprixVZ4Qi0f6uY
         vqmwzAnx148v1wChtgjLZNXaFI58xI0X9sU+wwa/UMP+md96x0XBlL7xeeuOD0sVHjPE
         sHaKEE9MYH9rE0U4+aehO+GSvkXvfHnp+KjFp0oYn5K02NqHSuecM0MOjrzEbrzCKvI6
         YEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165555; x=1780770355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTxwIUn+I2XU/1G/Q+9zkFJOGVGZUeY2eTBv9rFsEpI=;
        b=eVM4wdsbE5xD4/ZlRQ3P8d4zOLCLT83/nsqnIDR6rk74cyT9osa9vZLfDrzlMGS0sf
         xzQ4yDF87gnu7UC6hC3n9Uv4IhZmxi/9pLz57B0XcTYQ09x+XKdmFBlwmw6qkIoYTBFC
         S6zGTxxFVJIhq2oDzTBEn/O++NgisiZEvN+bP2NDcVrGT4OVb/GPIYX4zEGmiCF4ynGE
         b/Cv/DjiQluH7T8cKRSmRf9he1m/nwgkyWnAUVsAeBPvRvWxh0UEtTDb+9sgEnx9ByxW
         UTCyLuPPWmmDKs6UYnw2iE0im0kBTNzb/2NBzRdNNttJYhGtBjG7y4tno65eGGEkD8hF
         EMLA==
X-Forwarded-Encrypted: i=1; AFNElJ8tQK/jxArCftuXZTOVBGMuTL0pJNKgj5aRzg1ZbgakGpfvEmKBL04OjRaoX1KmvyzURGZxJk81Uo1/@vger.kernel.org
X-Gm-Message-State: AOJu0YxXknQ5Uc0XnUiE0liBxB3ZYAaOC85MaG2OpYOwC7AqYvdbDveI
	qb/iPAjaZ1NjwYzVk0PJkdDBrBqxVUzxM9L9JuqIyIeDEr9jvtdLyCHv8M1JcTA+fQo+p/CL+n1
	IJ5P91VnYOMrtCOMEps02cg/pmo6DiaiVaVQcQFMX9Pb/1FH9qEB2Rl+W1VuXhoVh
X-Gm-Gg: Acq92OGoDX1NmKKqxhIsdzGgEVvSnXDS1OeNOD8A2izb80iaDzfB7Ph5iR5DcVM8Q5b
	9SKTDHi2vdWjggCAmTfQVNJ8wylTRMTBKMGZwsB5RNNDvCoqnRNI+k+UwPUAWQh8LsUFoH31B9F
	8eqXvwIPoDyIVQZ0U4DRggYO5tnIZEY47A84YDRciC+GuUMvntbZ8ARHWUa5S3RXHxJytNtdI7N
	UnQxymqXS5/X7rp23nRz6X7tkHN/QOvq/gU3cZhXExLfQdR8uwsZSfuqxFFkq5BGRjtOTcga+Oi
	WGMZnZTvHyzOwH66KwPYrZrMzQ63cdpxfoDrMW5/66abEQn21p/LQoJMTJaax1Sy8oMnyeIUhXm
	tZSg+9RbpR8Jakf5CRyNYJbXuf8mCv3fRt3ScAPgQz9c7R/9fwv+Lb3NSlhC86Co=
X-Received: by 2002:a05:6a21:4e01:b0:398:840d:39aa with SMTP id adf61e73a8af0-3b427f7611dmr4719730637.29.1780165553993;
        Sat, 30 May 2026 11:25:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e01:b0:398:840d:39aa with SMTP id adf61e73a8af0-3b427f7611dmr4719702637.29.1780165553443;
        Sat, 30 May 2026 11:25:53 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm6057818a12.15.2026.05.30.11.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 11:25:52 -0700 (PDT)
Message-ID: <d4fa00d7-306b-4aa9-b599-945924c381d6@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:55:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
 <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
 <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
 <urft4kklev3palxzpkrbif3jx3fuwdzlj7weyjtodl62vbbzto@v3tpmfvsrlku>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <urft4kklev3palxzpkrbif3jx3fuwdzlj7weyjtodl62vbbzto@v3tpmfvsrlku>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EXTtBpbE_E09dGUMwE3riVkLbWusLBG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OCBTYWx0ZWRfX6qK5An/+WrCT
 gv1sSIY+v/v4ikvGDZM6OT6DxTgYeG8Ipi+MnSuvljSxxICcW7xKzVD2H2bZhNnxYBzIbwR3q0o
 8omJJziXKkqNfWHbpp09dkItkMoAOVBkWVEdOeBc0Swtk4a4w55ORMmIvGaw6e09ddewql8ix+f
 4otdGFzALhCYuRaD/KfI/LMRcsufChhB5FHLH6i5Nf2VFmPiq/X0G794qcU4MntjU6yCRboQdAq
 8QnGWaFd6bmdb5v/WgB6Sfzu/dv18VGdVhTK0NPj8IwgLzOeRTIsIlwffm+avF1TRrvyJ0s5dzi
 bDxaXGs6S+P4L4/JKFnYb5tPPBZNT8Mxvmvn92oz1zsZRGl2BgBIlcAymTBlcSkUv2kn1M+2zG6
 Z90gjjfO71RgozqbZqJdVqeb0hQ3ZQhwfi/X4rIw1QTGbvPwx70Ta4iifw4PrnUyjxWnRlOULHV
 GGp2h1mWtd226+06O+w==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1b2bb3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=VhQgrmAlsMqV4Ib2O9uomA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PA2aZWPzbia8iepHnnwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: EXTtBpbE_E09dGUMwE3riVkLbWusLBG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300198

On 5/29/2026 4:47 PM, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 03:41:50PM +0530, Komal Bajaj wrote:
>> On 5/25/2026 2:57 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
>>>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>
>>>> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 164 insertions(+)
>>>>
>>>> +
>>>> +		remoteproc_lpaicp: remoteproc@b800000 {
>>>> +			compatible = "qcom,shikra-lpaicp-pas";
>>>> +			reg = <0x0 0x0b800000 0x0 0x200000>;
>>>> +
>>>> +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
>>>> +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
>>>> +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
>>>> +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
>>>> +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
>>>> +
>>>> +			interrupt-names = "wdog",
>>>> +					  "fatal",
>>>> +					  "ready",
>>>> +					  "handover",
>>>> +					  "stop-ack";
>>>> +
>>>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>>> +			clock-names = "xo";
>>>> +
>>>> +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
>>>> +
>>>> +			qcom,smem-states = <&lmcu_smp2p_out 0>;
>>>> +			qcom,smem-state-names = "stop";
>>>> +
>>>> +			status = "disabled";
>>>> +
>>>> +			glink-edge {
>>>> +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
>>>> +				mboxes = <&apcs_glb 9>;
>>>> +				qcom,remote-pid = <26>;
>>>> +				label = "lpaicp";
>>> No FastRPC for LPAICP?
>> No, FastRPC is not applicable for LPAICP. FastRPC is primarily used for
>> offloading audio, sensor, or other DSP-related workloads, and is not
>> required here.
> Which likely means, no compressed audio support?

Yes, it's not.

Thanks
Komal

>

