Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109838;
	b=pyYF44mY8RThDpqrqQJ97Ud8T8c0kF+G4gP78af0tUC3WTDQnsRsCp0GgIbK6QtfYKPe
	 izULQ8JV5Yw56xNir0YODUskFhLAgWAioctk3JL99mQLGdE2VpTnK0el/4GEVl1ZCo4jp
	 qhPGvV8m6gsKOgobqsPy5zyGCaJbi0EZ5a3c4fOx5HqjI7zDNTCfV7KIyMJNYRVC57GtY
	 ZOFJMOPOMM3NchVZK/oEvnMTvFj7pML1G/BK5REuNrpf+UQ7IepZeLOkZVNLYPonjKrJv
	 EwLfe88RMtmEhr1VphgSNz+AFWQTq60tgJtSWdfWu/Y2No2JSIsLd/xwkIRoYlqpLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
	b=U33IDmXisZ79HVeNfvd8YAENcnS+7A7+qulIunYSpW/qA4MJRY+0LxSzmDCodllaoqbh
	 i/KCSC5XJ0NCuqU8oY+dBvFpoOQz7OboM4IwZO/UskZtX2fLlrIu6NoNcafsmAy3quLF/
	 Lmr+U6iq2lY6mBq/xlsM/mMCUOLc5tSfQ8FZrh0EdwoqmCaP5qPsLRUq6ZImKOvyWTbv3
	 u1S81K7zJTPCPUY69bZgRYo/hv7S+4KF1Bt33+MMO1M2H09rXNETD3YVhWbeGlkArvjKd
	 Er5Fw6ag1PB0yJ05Jco3aiMCwsW6Zzd72N75VByaRJFKXi/933rwzAaFzNDPR8AxAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AF606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoOB82397342
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=; b=UYdyAjbnGesBz71W
	iVQaXe8qeCZ0Rupd2jondt88J1qH9S1pOo/qi3Z4EuXB6lyNRXzynxQMQS4pVt4G
	drLcMBce0anTIO5En/zvLs4tVGWXIY9NjPTFmWHu8yb9glvFqF0YdMZOwnIgjZDH
	DnaTN2t1g6LOMH2FluAsLrZAnoaIHpG9eKxpD4z9ssZZU3FnmrnNXvmep2BSucZz
	6OcrJGb6sN6X1W7IvC1hXQfjjmSU4f+5wjrtlddaZhSN5hBIRFRHqhgdxY868xvu
	L6PsCLS0MF0BP6EyUJ59pD4i0tGfM60Kuc2nenyobOB/cR64DuliVsIpEm8lcVj3
	I5tUTA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gx60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ccd1bc538abso317700a12.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109837; x=1793714637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=UPRljlt7EyYoa+04TX97q9IZlsTHb6EV/0IkDooKwfJxL3PPxANG2ydSDh+sctpt5t
         TDr6yZevQquyAtbwhkqW/BIqI0snRS2C93/hxopSFKsf325nJ3A37nlww5nviQVxWuNl
         wV4YOkFvz5snBnTIz6JlslWkO2hHyIEzok2C7avVYh53TM6SKhv6Bj8Pj1kTrLSQ0e5f
         pP9diZlTFzXvve2lQpndduUwNv16XcV9Gqh+U7vOspzbOGdFtNZBHhoslTS8C6uDD8gn
         Np+1ZBxcv29Xl2EvUBfhl1sNccvQRc2lYTSz62QEMLFhMqpRA3OmGO+Tr7WXnO+5cxyt
         hlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109837; x=1793714637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=hrBkr8Cg6bMk6H5UuqLIJNZeE9h4Lae0PwINGKRsZlx21YWm0V2N1HT+ApZUS9DbKU
         5VagirSMEjuVfPTAzE/Ux2Mw5hbqLhuIBRINrkaLdU0wZff2UkKtKrT/GifKWIRKq7SG
         ezr5EDNklg35brQO6VSJ5Is68SY5up6dUNmt24mR+ke+VXiZLxs0L/xrn49kuSuM8wME
         p59pEHjwIHMC3hkk7e9EroUpgGdMbeHLA7P1r/HFb4V94GnZFsRsl2qSgjJj1T4GSbJ1
         Qt2P4c7T+hQr7ESvKRzC03K701bppsc34YO2FVcuLLSZnR8QMD/b8eivNqZeVPSrDz1U
         lJrQ==
X-Forwarded-Encrypted: i=1; AKwUvByh0I3zfbwFbrWa+0vfZPn6oxJ8cI/iw2ERKdbN7qaSyY4LW864ctFhZqBczvE+Rcdi+Jx7Qr4rQ3et@vger.kernel.org
X-Gm-Message-State: AFq9FYKKTvYIJTI47FIe/LdtKdTJLlNpUF0DOFNXqWpnQSPF1RPw3F5K
	BgGT3zP5Z9ZzWiKaZYaF/MqZ7Rjv9IWAUqn4O78PuExmgcF4d0RF8BjudG16Ge0UfZywJb10PQT
	5XxjXJnEaOdpJYfEov0dySuau8wT5iN1SSxQ7Eph9nCmEfg4w5WG6fm1fZVjtUOOO
X-Gm-Gg: AYBFou3GyiEa86kQzbpLY8EP1HDTvBjHWgwVYgyyvT7GufK1CVH2NrjfhYYtxfc4fhA
	zzngzRad2lZHlCfe5vmaf/orfHkK5mKQPKlg7mBMejw8P86GqTO1ukNDTjD3dHb1lgO7v0DhzzB
	zniBLsHU4UOwdruiilNAucpuznkU+pIdAOnLkR5mBfrw0Jr/RbTbxdQTh45LSMHYX35CiX9QoKB
	w0E/S8Es4/sWH08NNckVvLD5HBdXyZ+1Pyuezs+YAzanguhMsmpr3jW3gLWoRq6Jppr64K126eZ
	Es4nZUrE35mCoWDMhxXIGu4cUKGFBs70cX+xUm1/4UcwmQ+S5BX/jGQWNcsPWShiyCTbQTwIi2U
	TarmwHwNyhM+CdBPAs/5MnA==
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146875565ad.3.1793109836878;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146874635ad.3.1793109836298;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca563ca9sm28627e87.17.2026.10.27.07.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:55 -0700 (PDT)
Message-ID: <b5f0ea6f-1048-48ed-8df7-2502e7b452f7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:52 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
 <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
 <atYtSXF6QeTkF6pr@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atYtSXF6QeTkF6pr@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0af4d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=Jm0Y9y7N4wH0DHTafQoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 4hNq5j1o2UbVrlsoAvwmXnwZfYZx5H5D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXwLmLh/XZ69XZ
 A5y4ZaQtXlCKuKxKWeW7nFmBYRsURhjqOS2xixK5R/njzn1z5CSWLuIPp82+BY89oC0beuCHxag
 ykX0cFiICn50orTXk8MQsOnmvXPNI6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX+Wc/poKXCScw
 jLf6huYoOxQThFPKOr00iq3IwdbTU7Ii9XzM33Af7ZywzR3t+u3ICqhpqdCJnQWbCW+zzgMwhPN
 pEdrXL2fbGNPxoDq7figgc/tTy7JgW3zUqfGzTJ0lOGn99LitGfomdmLgLAprQLu3MGCAqEo1BL
 +theAdpEEZYAeIECpT/74HwkdFdjF8qqMzL4lrC8IPRb+6wUyjXxY2OUsHoyF3tYUR2lfUXVbdT
 Zy2XFDUPSmlr+pZqnh9fAa5PuCr1BduProluwNHQ+CicMdz50TQauKhV0v+2vEWVnSZcuy2Hlwf
 dgRNvMmhfB91AF4rbNQKRBE5pVY9pkDvZjqeaaW9iD2YKZv6xJfonnjPPzLDFofizcKx/+LUPzs
 4Y3i+tSXs9WBpjmQEv194RfhvmSeOnQEIMA932F11v5+5JqpNVRFtqtK2vVZ0UpDZQ7BYKY/3Y+
 lREyL/qLFnhJHc/gvdQ==
X-Proofpoint-GUID: 4hNq5j1o2UbVrlsoAvwmXnwZfYZx5H5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270055

On 10/19/26 4:46 PM, Richard Acayan wrote:
> On Fri, Oct 16, 2026 at 12:21:10PM +0200, Konrad Dybcio wrote:
>> On 10/3/26 7:56 PM, Richard Acayan wrote:
>>> Add the digital WCD audio codec to the SDM670 device tree.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> index 038ef0f73ea9..91188acd16b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> @@ -21,6 +21,7 @@
>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>  #include <dt-bindings/soc/qcom,apr.h>
>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>  
>>>  / {
>>>  	interrupt-parent = <&intc>;
>>> @@ -2541,5 +2542,19 @@ data2-pins {
>>>  				};
>>>  			};
>>>  		};
>>> +
>>> +		lpass_codec: audio-codec@62ec0000 {
>>> +			compatible = "qcom,sdm670-wcd-digital-codec",
>>> +				     "qcom,msm8916-wcd-digital-codec";
>>> +			reg = <0 0x62ec0000 0 0x400>;
>>> +
>>> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "mclk";
>>
>> This clock configuration is forbidden according to bindings
> 
> It is corrected in patch 11 which is why this isn't caught. I'll move
> the fixed clock to sdm670.dtsi.
> 
>> I'm not expert in audio, but an LLM points me towards
>> LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> 
> Does the LLM have access to schematics?

That LLM has access to more than just schematics..

But at the end of the day it's just an LLM. I don't know for sure
and that's why I wrote it that way.

Konrad
