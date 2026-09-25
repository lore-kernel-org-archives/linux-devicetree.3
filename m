Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2E47F789
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328085; cv=none; b=oJNW/fl8BRKlHObrTCHbuDzAiryFf+K4DvsPHWpJlaGh/JSDE9kO/0+yx854KEk927eCZQVOak5EvYN1p5xWP1VDWVPIzZpmY1byni/fhN67hQ9D0k2nsIhkqtbyUzzI5YMBUsIO7qAQxukfDpfqG/51zKLoiH+u4XyL6p6txSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328085; c=relaxed/simple;
	bh=mvedpIxak0Fnzj/mZY4251qn7YJgCBi9zAfCHtRMKVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgCJ5nPc4/TXsPq+lp9awMJ/qh/tFqGUVIh1Sf3sTopMEyEy7XcPbs/ko+3G5xlSETt7/p2yypbNS4rqeZ0ILtV6oNgYWG2k0fvvg5q6EBHabJlHXWaiyEiRb6QDBN6dqLIk5asJUtk7z9MjLPwHg4loXoA/prS+gDzlUDWBzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRTYy2jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFTTUUqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRTYy2jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFTTUUqw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YQVX2911318
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=; b=fRTYy2jvZM+gocIf
	Anjg/IjTKq5zbwrdhfH419Jt9409fi3VgGXtPuFwOFCnhHnXB/O2OMFELzUd+LGU
	qidQpL17GbphNSW2n46rTQBteVN+Fd0wWNmJU82LS06qVnGSC4L5nyMtdsYiy4sw
	3hdh0/99kT4e4y2WluAK8vsczO9uDilKk1njvv9dkGBwlVJJUf8PSxf3+3G9hSCG
	6UTveLjrwCTzrMVmTNBU5IPZW9P1X2pytvwd531JXQ5yZrX4WHxDzg/oTiCYUJzc
	jvf0XzQU1Bpc59PbAptplKXqsKbU/OlGF7xlk5j97AWuBSsP2jl/c/SBJwOAv9bP
	4GgaMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm50wyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342217d8d53so444276eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328079; x=1790932879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=kFTTUUqwjVEY8/XHE+HFNgEeFiMHaDPyLCWpD+4H+4ENCYdtEn8/U2v6HbpaInWW+0
         pkIf4tgRvXUIhT407SBqnfuOnNdFpYjcXVPcY19DVlCJg6sQxB8q1yGN9zWp7XpGbqNg
         bqgEUDm1ZA0iI+iGieC1CUiddSMMuVu+0ZUyCiJTRFuPxCiy753gTplcHT99PG35kdYy
         BoVEllDeDRcwsc7kUFrafucNBYkk0+ht72SFjpBzjXL5sa8waOIaAkxeu2jO3Vonz2Yp
         x7hGH6LTIfyPacrfh4A7NAzi/v16qNictXsqU40hGqqZZkQ8Ns/gvBctYPXcirLk1oz9
         xtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328079; x=1790932879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=0g8Ae2N9HP98v4cIgIsKWSjgI0hw3ImfpwejZ12okC5REGoUhiBx2wPB0NgD1IQQsg
         EVsjou39Eu3iYeh5/Jio9gHHZayGIza2zi3gmKu6QRgxixHXvi0rO6VNcxA/Y5LfGsC3
         kP/2b+NUCitNaSMOboSmyOY1PlOZG7KikVFOohbVssiciEfuVO9fNtZIJ6GCNKP1KrPk
         9a8thiNRu5Djxe7DobkuALCHcopLfiOKDKdGjgFcsWWg5dcMNX90Agvt4fuG+l/g+K7K
         79ErNHZjt53rwq8E51gOSIidFLTvpesuVdtz7/24eqLrBn8n4VTP/KkonAJJZ8DUdU/f
         fMsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzThPu+TphdxM/u5SMBhNkHp4tAKD9OOOL0ZA1Vbfr09mVnfGqwZ8LeIYpgVTQ9Rc4Wk9y64k+qEKZM@vger.kernel.org
X-Gm-Message-State: AFuF++nUYCYKEy+cy1b1XR0cSFLLPonZL5yTyDR75UG6So0pcGFEMcYm
	9FCNyV036Xrj3/IrniK7/HGHjWCV4iB+WOILP0fTB8TJUxHjdzW7MO2C9cwKZ4SUZ5S2gTtf0tG
	GVsxn9FXqhKb30eww5nQ4662VFUI0xSMHGawxPlfxEhH8pU3scADMRq4ad/JmvnZM
X-Gm-Gg: AYBFou1q5rTLt16Ft/4l0+8+RTRlq+07561NHti8y+rSC+ZOoLKgjm7pfEKBP89a6tb
	JQuekys3YGwuiSitrxTbvlk6v1pVE2Oapwqeph5S6jP/7WWNmYWCz6w2efapmvbvWrCurvbL+GY
	aldWhk1rGiIvhEjlyAlMxX3IXuJKNzWaYPR4n+S1YSfYKIDu9cuUq+r9KdO1nI1g2WV7iwf/5wJ
	kHC1/lKMWWC8YZfMJfziL3P9WXfn4QMxPY1I1Jn8MsU9FWKi/LopwcqlMwikWnyGD/WdOPXrdMB
	6z3Gze111izwDFoTxVgSLT3vwfaaX2X1lddC9L9H5SZxhABOGxLb/HsTc9oGPWLRqSXzubTF0jn
	3ncZ0kOwqP3yCjhyou7xnW3mlCjgR
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810775eec.19.1790328079267;
        Fri, 25 Sep 2026 02:21:19 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810746eec.19.1790328078540;
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757263sm4813814eec.12.2026.09.25.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Message-ID: <8ea976cd-b012-4ae6-a74b-b5c2dceaecbc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:51:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mZkRmIT6PCDmQw2TBx1zFB37ScGqtzza
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab63d10 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ohAgsov0r_a2WbmJIscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX8X4meQlxONBl
 UWAnoo28C1X1z03TDuSo18jjROgOCtd2bTaYWOda8jAnlUACVyua7WkXZYZz4ih8jMYw06Ap1Gy
 Ve87gzYSjFJFvxD12J3qgMFYdBNVQIDk1KpV/as+A2amzASSwbYrzt7YNBmWsVdkJ+BR5oX6VZf
 SFr5x6Sfnir/pZ0DZo0nkxVvE8udzJyPB6qXW3bBI1dv3d16UTPIXwsIh8mMjn+hIwPJtHD2JRf
 gdsi5g7gTPFO87Xmc/q5V+H/HulVnsZ5KZY5Udris7L8LBpZqqfNECF8hKFRx3UUXK5GG9a0oq2
 KLgXJ9PSsNLlrFi4UP9eaZqT4mzATtvv3Q/OwKV+fsaryAtRszwfDnd7EKEdeSVS0v3/8aibEcH
 W8fQ6ZwDsWf5nEWmXNZXlgDM7i9P++uVUkfpkGJenE1xom+kh3fgaElA7QLHS8ccdRV14GsN7om
 6+M9GEMCiEYOMrCJeDg==
X-Proofpoint-ORIG-GUID: mZkRmIT6PCDmQw2TBx1zFB37ScGqtzza
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX1cTG8XBwje4B
 gpKnxwa5itdPwgEIVie7huu3UMRuwZHxYPpkdyDbTbwS1FeCXm2FWKiquVxUnMDsYwWOaZ8Rr2e
 Eyt2mJSofBHsSprfOWbSP3mo7iQa5dY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250037



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
> 
> The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
> the SoundWire mic mux, so a mixer write to the mux that is not part of the
> active path can leave it stale. Program it from the resolved mux state
> when the decimator is enabled, so capture does not depend on the order in
> which userspace restores the two controls.
> 
> Add a helper to detect whether a decimator is using a SoundWire microphone
> input. Use this information to skip DMIC-specific HPF programming sequences
> when the decimator is configured for an SMIC source.
> 
> This enables VA decimators to capture audio from either DMIC or SoundWire
> microphone inputs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> +						      CDC_VA_TX_HPF_ZERO_GATE);
>   
>   		usleep_range(1000, 1010);
>   		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
> @@ -1046,7 +1079,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>   				0x0);
>   		}
>  

The commit message says the DMIC-specific HPF programming sequence is 
skipped for SMIC paths. However, this only skips the initial ZERO_GATE 
write; the cutoff programming and the later ZERO_GATE clear still run 
unconditionally.

Is only the ZERO_GATE assertion DMIC-specific, or should the whole HPF
set/program/clear sequence be under the same `!is_amic_enabled() condition?

Thanks
Ajay Kumar Nandam

> -
