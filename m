Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064613B0ADC
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041983; cv=none; b=RLs4ran9GkU96CAJo5sakItheZNxcVjcusIBhM5JWke+ZIbD3OO/0BD0Ek2EAcncFip6WttFz2TIqExPuC+9z5ddMiwL7O20novXYegXw/7vzQHQUOAhhrBJ/4PvRoCqlTJq8mrE6Co7W4q4Amsn+WPSMoqhfuAf5IDsrfI8XtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041983; c=relaxed/simple;
	bh=CrJtiZSByV1ruTZyteR8UZkww5m5n05N3axrILeFLCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZf+l32l6VQKlIUIhO0CrlGRDoPl4CkcLpcgYtYKrsFViO0Lspgl+P2uY7GrmUwZo987D0qzljAUB4pQAKwGWhkjp1dEtmFMpY7UUSZfdqFmb0b8FvPbHMFWVCgdUqGh1/UmUc99vRBRbiMULCIiiViHzarTwKbiq/fFvgtmy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XARgwUnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhO2mBJq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XARgwUnI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhO2mBJq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHkpX2476327
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 18:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGzGd7KWv89/ZWC1ybyw1tQUi56N8SEPChMtYRMb+1M=; b=XARgwUnIfulBFz4/
	3V3iaa4b8dG32wAwRvpiQxBCj0BxpbbWYGZXsyRcxQbWSMJqRBb+9EFMNAzrAfJO
	zoVB5JjUxcCEA7A3XbvgATuzAAiU+iX7yWb+Tvgcajgww11HAXez8x0Ht/zQ6u42
	2CnA9AUJTel8JaMNEyM74s5prLDcTn2P46mlLveT3IQ10byLrE5soQddy613/0dz
	bpYzRpvZoOKK6DPSHUDD3gCfN55AVUW8sQgm2V57HBTsb8I7skz6fSkADq0uQ8z8
	C1oMs9R+0gdpHpEWcxsEaQDJnlLuFAsZAUDhPFFPN46I1+uW+RzeV+F5ZTNfpUb9
	MrgIOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k07y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 18:46:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d0563db6bcso8009675ad.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786041979; x=1786646779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGzGd7KWv89/ZWC1ybyw1tQUi56N8SEPChMtYRMb+1M=;
        b=NhO2mBJqiKkLMK1YbT7WwKLbYt8s+tDhhVZ2XtcuchkkK+2NeaR3p8XEG1hwQQDU8a
         X8sM+yYC1B5DXnAujYpMZvk+REYjbbDBz2Q2r8OvyBmualbjtbxqoyYhkLNGGss9oYg5
         /j67nDc8D3WS/FaSPSGi6bIdnR3OP2UrZqmb+WlISp2AxKeX3EATdYq3u8A+YjJjYmaG
         AWYChvebGgDpGMO84SV4BHyUKqdFJeyUrSnWggeR2aNwU+GUaBW11bzHmBF9J/jgFKVB
         SsDahrdth9LDxyESS5oHv4TLNkr7PYbUOgXpWbroUjjhrI31/LC2sckzRSKnXcpmnUXX
         XE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041979; x=1786646779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGzGd7KWv89/ZWC1ybyw1tQUi56N8SEPChMtYRMb+1M=;
        b=H/CFlineMVEIEaV/9bpT/xHXql8ViAegXAiWfizwCH37KLMuxXQ29Wh1XQ09pic+OV
         JeMFO4TP0hFa3x65iVVCfxD9loNO0ZbG0KjDTpoUS6T7Df5Xn1lckgbKTTB0ZyrG1kW+
         GzxnUFACK1rCK0jFZxD1PI7SJ3QBmNgJKr9RcliPex58Iyhx+vhDly5B9JXwzD6jw2E0
         VZjSwhLrBsumcA6C3YiUdQcP5vJ7uxsxX/XPX4FoomU5fcW7/O3EZxm70gTior1zVwOR
         rF+lHFK9Y2Zlj/sOUPAA9mins9CGN2UWhhUyjlOfLlBdynpp0KNCewN43IM6rqVALCqA
         G2Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrEf2reW/DBLXV6MhGYrgBt3yqGdC0vJJmjzBsnE1McPXrEyEjk9VMwKONgwQbgUkCD+UiDc4A2Fcat@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsZM6i1G2kKa5qkP+6sd8Xb5b1sd9MnR5g1Q0UupD525VVRhF
	utw2svk0Zg0zF/5Ca66a7ZRWC6Q5fyTyDqBWjQRnpwRy/hJvkIR729SQNQad0n10wpH99rNDZ/F
	B+tly0cOjmS3Mw/HaiDe7urtdpiSyCIecMJYROZJJOgvcz3yBseFRCNRQdh5RESKY
X-Gm-Gg: AR+sD12xtC7tnuK1ovieq05E0n2c7AW+P/f8Dx0hrcDohjQkD/oIoaVX3O0mgJir5iB
	kqwUK8ws29Iv/t7bIS/8/lHDCYsPoUKsThIhijTig2eT737dUARE2ClLsKRF3/y2dESWjN34qlr
	cs6OxUp84l5c1jAtZ0lwFOQ3XBe/oUNWphC/+0gxsGjNR8OQQPOZycswytaMTmQPFoBU3a2vZpC
	xRbszNMHY6up8V0Wh0OBAqJqb3NbYhfHCQ8gOGPwJ36ihyUHKiHgJh786ogxspS9Hc/pvzCFMUv
	umH+jl46XwMjNg83PcXGiCZvnodFTbMO3zD2V/aMadw8+wHNvXTynksQkU1Ct8HlxpcxNKThfyu
	naM4uXSUzo+KFiVh9dkG9RjdoaFwQhghmlM8O2ZhGytaFrsVHrrFXeo+DK2+/vw==
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d0caa0b9a1mr132823295ad.3.1786041979397;
        Thu, 06 Aug 2026 11:46:19 -0700 (PDT)
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d0caa0b9a1mr132822605ad.3.1786041978771;
        Thu, 06 Aug 2026 11:46:18 -0700 (PDT)
Received: from [10.110.96.87] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm44458302eec.11.2026.08.06.11.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:46:18 -0700 (PDT)
Message-ID: <b8915782-d11f-40d7-980b-52470db76ed4@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 11:46:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
 <20260801-iris-fixes-dma-pseq-fint-v1-2-aba0cb22f6ab@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-2-aba0cb22f6ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a74d67c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J7Er906AdXdpP4zEtWAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kBt_yzqqfoZ0kSZyDq5-zmQDSokGpGz7
X-Proofpoint-GUID: kBt_yzqqfoZ0kSZyDq5-zmQDSokGpGz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0NiBTYWx0ZWRfXxTKsOQFepbRZ
 2XgMvgXFAvbg4HQhEwa9GMeiJZ4NZ2sntfVqg7/ZM1kS9xf9lOHr2sLZe6Q4fgRKGmstldfl/2U
 PcouyX70jGal7VFnAQV+PhbA2hREsGMp9tZ2iHnWBEY1HGxBCxuOoyhDYOslF44Tn+IRIkTQapo
 Ktlj6HLo0eIf/dFdg3GCogpfBunfrnSiVcRJbTy/pWIdZxED++zYxjvWzJaNUcbagdDOI4NDXdg
 UgnFS14j9P3E0pyl1roRT/u+iWA9ceXpN/9hyCS9J1hs5+DzRRj5SKo3/hfpGBkbrDIuJgB0Qz2
 Vw7SOgbCKfanAkIqfD7lqL+FEs5kaB2Ws78w7sUOJmXChwKCnku1QIQuXIg3iCX6fGYeOn++L68
 6Jne2rKWUnBjVhUJAhazwlAvcXOF6gwWdV1zCh9TKjD0N/q0Eq242Ia0+TM9F4h+cnpBr6jwys4
 5QBVc1hjd0nUl86hMog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0NiBTYWx0ZWRfX2i8+l5cisCgi
 oL3Te7clyKI1OBR4SczBAiIQOESgvoanjsSZJy23RqU5OtygscuaxuSVOeCV2unFiCqojxlOS4J
 8sNsm8mwzzO+RNZdbdwvODZO40//+RI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060146


On 8/1/2026 12:37 AM, Vishnu Reddy wrote:
> While testing with some higher resolution clips, the venus hardware
> triggers a fault due to wrong input data being received. Corruption
> was also observed in the captured output when the client dumped it
> to a file.
>
> On debugging, this was traced to the venus node not declaring
> dma-coherent. As a result, DMA buffers shared between the CPU and the
> venus video hardware/controller are not guaranteed to be I/O coherent:
> CPU writes to an input buffer can remain in CPU caches without being
> visible to the video hardware when it reads the same buffer, so the
> hardware receives input data that does not match what the CPU wrote.
> Likewise, on the capture path, data written by the video hardware to
> the output buffer may not be visible to the CPU, so the client reads
> stale or partial data, resulting in corruption.
>
> Add the dma-coherent property to the venus node so that DMA buffers
> shared between the CPU and the video hardware and controller remain
> coherent.
>
> Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index f74fa66f1a67..98184760b4bf 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5024,6 +5024,8 @@ venus: video-codec@aa00000 {
>   					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
>   			interconnect-names = "cpu-cfg", "video-mem";
>   
> +			dma-coherent;
> +
>   			iommus = <&apps_smmu 0x2180 0x20>;
>   			memory-region = <&video_mem>;

> Is this fix applicable to only Kodiak platform?
> Or are there other smmu coherent platforms that might need a similar fix?
>
