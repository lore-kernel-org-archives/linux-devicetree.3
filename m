Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25AA35F5F4
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641701; cv=none; b=u0lnQTalZ1VzgNLKMiioZkukYxTSYBnYkE9zY62iUFx49hTEDo7is6EARUWBZ9hRFoyem2FeTzcPyGbEO3h2UmFhfEIy//4nVqbwxb2/U2S6MwqqsHR8ywPiRPhG613JSB3fVfgToTckFWraguVRh4NyCdxrQaAKj6pa/GB+uzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641701; c=relaxed/simple;
	bh=LuNedo1wz4HLsvM2wM2nByzhs7nd0s4llpcInO6ouqk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nmfVB23dY6yD+p55nixwkUU1QLyIIiqO+2L/eEH6zIWm8YancZk+91HwwMr4n8wbQTcHWVTivnWMxVhhV62ah3n5sSIPiBE7Dc7G4t2sZvBOz1wcrfYLtbiQwwIf2YdVPK+u5xM/7x9jWjxDsGTvtbSRkD2N9q5/ukXHw33U00g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwkJqtF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fR8z5Qv6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwkJqtF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fR8z5Qv6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385lMa2071920
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=; b=hwkJqtF5ONTNccGT
	QGIZ1RhIpFcDNJkW/bKXZBOsHdVzX/d06aGx+qO6FNkVhqSp0iVG0PHxLI+Szvrh
	MHgNxyQT/pcO2MgyfgNjL7nghksN/Yu8s+SatWIY+8DnbRMQ2e9lPFI9S3sdQu+6
	kxxuM37VVGN2JlDEfYIlEyk0AB6x+SrK7nhlgHb9NH+reBITRLanR+mS7pcQqfnH
	cnbdLfHBCI6S5d2+JMqsELbA5VX3vtwVq3h8LUGFLv/W8C88zoy+x7bOjTo7G/G9
	ZlJxYpwWVKszwGJYSmvqURhFt1f7MFSd8W4wTJ0cdVlLnM5UEm28EfwmKhz7qoTE
	rq0eXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxamru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:48:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cec239147so565182b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641689; x=1776246489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=;
        b=fR8z5Qv6EsNsf2KIMeifVjmP4M0om/hAThAgig4AZOMBap0KRNz4A24onL5LtXlmVp
         FzyUpWUAGiPXdxP15x7Eu94CWULBDNWX00rC60OJcyO0JXfQOXpYtH6cCZNA5zgq5ArC
         2QecirvOIm3fTo9VQlEMnWJR/dQSPmlDNJa+KMHrgN6Ln74c5FmjYwn2TUhi2kbKH/ed
         tlCQ7frbjtH9bZkS/ogpf3torJ2FrfSN0iLgCbMCz64ES1HgerPfm2PUEvxuTibgh3IE
         88c/66QkErN23wigETP4JMG7d9w2wQXW3PZE62OGLivRBrTMYrV6cCejnJzpBQKRNdN8
         g5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641689; x=1776246489;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Osn80gxYAXTeDx4Eh5y4LGMCpIKLAUt616H54XFdedE=;
        b=Rg87GG8aEEtju7MJOMT7Cnrn5cmd8toVHxjg6H3dPygQZjsQscGTv2/mP9BBZOu9XD
         nYkhd3BkxkjTjEeM1HXwnu4saXqQq2l+9yWQ3xWCyQukCZEJmml1H5zP5P3AYEJ9ONfZ
         Vzl9omjiRlsFv19UDPA0qfVYsem+mdXyGSidlUawDgJc2KjGgiXdOScU6zoupR0vPxyv
         Kr/SqPu80Db4oAdEackqabsheVn4fShVQh4cZ7dh9DWSdUW32KZghUeBczkML4FdPsMC
         cspAYVAOzm95xU4hgi1iLzixsR4qeb0bmU6c4nRAlRHzDmwmztBHjSg+GvqYsH/gGeGK
         +Lig==
X-Forwarded-Encrypted: i=1; AJvYcCXO6obP38vGVeAVQrbJZb2GBFzGQUjCS8xCG7w2fR6lq+30/ITOIi5ucNU95EmGrAMjaaNOn0fyzDgu@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwt5iuABNfAlhXbbHaz/LOu1PDPbacNfAsw0CvNVA2mrX53WT
	Q5c4/07rQ3yk7DMV2FPN0EriXN/2okD/fV4I4Glq03Gspq7kusiv5KEGUVitgJYMTjHy2+nCj1g
	9PoBxt5JHnXq6NqcoIj5NYmYADYQjyNauzaFZ4gC8ioMem/5jlqrviYkgt79ACk3/5fXHNsYb
X-Gm-Gg: AeBDiet6yKs/vfPNu9mxK6cMPmVEvWi/g4Rlf1Ie3R3hx1PghzzSNTUIY6phw3XRBPb
	LTyikYRgmeYjZVjSRaW3ZuViNGlBZgOFb0w2LhFVbK+TsG8gcPg6v4L356tyb5xZZV+r4D+m8KU
	IYjQEEGEv141Szg3qmBssnel+T04At3LWRSOVjjUWcK4QVmFuLN8V3Kba73RdOUpF8ZnrQO0WIj
	gqtqDGDeifdG8HO/DQCWRfDpGT6sa7phylALULdLVab4mRmhygIGSNXXlrvQR7Y0BKiFhoWOdak
	sfiP2381kK7NE+dKzZ+zDgfdm+/xLma3ZGxUjVcRlz62aATRf10z9CuedlUL+v/V5o1aqVLQGph
	O2owH7A04KI+lmw28WmjtoYu0iCav9U2YBAQsN7FOzgNUxqpVRySN8AtCmmzwfabJWXQbad7ZCW
	vzvjIFAw8=
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr18842241b3a.23.1775641688542;
        Wed, 08 Apr 2026 02:48:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad3:b0:82a:6e4b:5b4d with SMTP id d2e1a72fcca58-82d0035bd98mr18842217b3a.23.1775641688041;
        Wed, 08 Apr 2026 02:48:08 -0700 (PDT)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm20537756b3a.45.2026.04.08.02.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:48:07 -0700 (PDT)
Message-ID: <f2231896-d065-43ee-901a-7dc35299f264@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:48:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
 <20260324060405.3098891-3-le.qi@oss.qualcomm.com> <acp_9Z6Bhq9ngDAi@baldur>
 <78ebca6b-d8e2-4db2-8a34-ebdb6f401a5c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <78ebca6b-d8e2-4db2-8a34-ebdb6f401a5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d6245a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l-e2nHpeJZkY853er4AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: UUqvzUHeVZzG-oIJ5dTH-HodQGyK4WHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OSBTYWx0ZWRfX4uza6KXtndFN
 lgUStD4RAX/n+KX0pWn30rApF/TugoGClS7g1nVe81qphAjbb9v979SV7brk0IdNE26t5B14fHf
 Pv9yonpZ4bUovED4gPH/Y6xViJiz8KdXKMJOxGHOaj0sjLJpheliszeF85eqqaay7g/UPvsMfnV
 89QqolTj0c9VFzdbUVfN7D4THrOxsY1oUCfI1iRBks2RJ7GhD3Vf5d+QBVnhZysbnHUx37fDSUz
 4ABih6OJGlsTDFNMnAWb/8bzCooSXZFy51ODUbqYx6BVQJKbLNBwC5fwAQZUeuNnVbQy6D8R5yI
 jyQH2oWLAVpKpK0nauYU8kBe2lYkqMZ2yKnPv8sUIPdy2sBpW/BASLg/xpZNMZofkZyGlrFOQNZ
 eeC3BW7QnyQnUWQMgT7XKAJL7ptkzoOms/Vh0Wm0/1txU25eY1BiMQWvEIQaMse50I/Sitq3Xqs
 WljGr18pmcbXkgsaFtQ==
X-Proofpoint-GUID: UUqvzUHeVZzG-oIJ5dTH-HodQGyK4WHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080089

On 4/8/2026 5:42 PM, Le Qi wrote:
> On 3/30/2026 9:53 PM, Bjorn Andersson wrote:
>> On Tue, Mar 24, 2026 at 02:04:05PM +0800, Le Qi wrote:
>>> Add the sound card node for QCS615 Talos EVK with DA7212 codec
>>> connected over the Primary MI2S interface. The configuration enables
>>> headphone playback and headset microphone capture, both of which have
>>> been tested to work.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/talos-evk.dts | 65 ++++++++++++++++++++++++++
>>
>> There's no such file in the upstream tree. Please test on upstream and
>> resubmit once this is ready to be merged.
>>
> 
> Hi Bjorn, this is merged. I will post new patch, thank you.
> 
>> Regards,
>> Bjorn
>>
>>>   1 file changed, 65 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/talos-evk.dts
>>> index af100e22beee..6352d614e288 100644
>>> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
>>> @@ -5,6 +5,7 @@
>>>   /dts-v1/;
>>>   #include "talos-evk-som.dtsi"
>>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>>   / {
>>>       model = "Qualcomm QCS615 IQ 615 EVK";
>>> @@ -40,6 +41,46 @@ hdmi_con_out: endpoint {
>>>           };
>>>       };
>>> +    sound {
>>> +        compatible = "qcom,qcs615-sndcard";
>>> +        model = "TALOS-EVK";
>>> +
>>> +        pinctrl-0 = <&mi2s1_pins>, <&mi2s_mclk>;
>>> +        pinctrl-names = "default";
>>> +
>>> +        pri-mi2s-capture-dai-link {
>>> +            link-name = "Primary MI2S Capture";
>>> +
>>> +            codec {
>>> +                sound-dai = <&codec_da7212>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>>> +
>>> +        pri-mi2s-playback-dai-link {
>>> +            link-name = "Primary MI2S Playback";
>>> +
>>> +            codec {
>>> +                sound-dai = <&codec_da7212>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>>       vreg_v1p8_out: regulator-v1p8-out {
>>>           compatible = "regulator-fixed";
>>>           regulator-name = "vreg-v1p8-out";
>>> @@ -109,6 +150,19 @@ adv7535_out: endpoint {
>>>       };
>>>   };
>>> +&i2c5 {
>>> +    status = "okay";
>>> +
>>> +    codec_da7212: codec@1a {
>>> +        compatible = "dlg,da7212";
>>> +        reg = <0x1a>;
>>> +        #sound-dai-cells = <0>;
>>> +        VDDA-supply = <&vreg_v1p8_out>;
>>> +        VDDIO-supply = <&vreg_v1p8_out>;
>>> +        VDDMIC-supply = <&vreg_v3p3_out>;
>>> +    };
>>> +};
>>> +
>>>   &mdss_dsi0_out {
>>>       remote-endpoint = <&adv7535_in>;
>>>       data-lanes = <0 1 2 3>;
>>> @@ -124,6 +178,17 @@ &pon_resin {
>>>       status = "okay";
>>>   };
>>> +&q6apmbedai {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    dai@17 {
>>> +        reg = <PRIMARY_MI2S_TX>;
>>> +        clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 
>>> LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +        clock-names = "mclk";
>>> +    };
>>> +};
>>> +
>>>   &sdhc_2 {
>>>       pinctrl-0 = <&sdc2_state_on>;
>>>       pinctrl-1 = <&sdc2_state_off>;
>>> -- 
>>> 2.34.1
>>>
> 
> 


-- 
Thx and BRs,
Le Qi
