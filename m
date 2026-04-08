Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972F37E2E0
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641754; cv=none; b=eFgqvrhC+LG6QjveACgfFCUUM7LMV2iTvPlTiKyK4mJiLphRh8+U+WXE5XkWX3GNceDcUO1S/w3UxwqmBemcl+AHbe0XrVVU362Hr6w9S+nfWbTVX3Q6Mx66IyAni+WiCZCtkKleUs7C3WAY4yRyj6NuiABOITfMOMysvv7yrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641754; c=relaxed/simple;
	bh=rRtBr6F3yEu4yEpn8TTBzkvk/47V7L5nppA0sLfN7Fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgYNDrRVDa88Z+z6aAOl19x665yKnYC9sHv6DaWz2OgRLFaH8GbWBkvtRYNeoCH8XnkC7INOEkbhmAbvVT9fFyB2OumgR1WHqlwGVWSVd0bx19GKF0QQ/rBWq1VoR/P9MUvTBjJcy9d9srx5UfEROnXaQIy6BFm8VHUB9F0QtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZNOmQxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTCvE0E3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZNOmQxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTCvE0E3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6388I1nx1796777
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=; b=bZNOmQxbVA59PEBQ
	DvuUvffkKaQ1QSIvoWhaISuxuZUXhk02Z0mJWLCJIwTN8ZzTeyeTOL5zBJ/ASgEH
	4WCx9qIdClG5NF/8DIo5x5zHZkAfkv7pkpIJ3HiAZVLQJeYsLKJnklKxqkejZqwE
	PPLBYMqPPKoSKL8jMQ4BUYydLQTeFhXCRSYvABrFEfxrIk+Bc8ZPlruJmY75ajhH
	9d1Ox8Ghto+OxprFZx8UbRDE02RCKjSFPcnFc1y2dL1Gf6r3Ek1gTbh2bU5iFegb
	J9BlEsOwxQFHIQqepKosAKQwd2zYPDLwXdT2NKgfndknBrl1rz2R6S8A7KIUxweJ
	z71Z3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dbgud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:49:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so6280281a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641739; x=1776246539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=;
        b=fTCvE0E38Vsyp327pyuQKZndCncm0fnkinnUlmcTrr9HUWZ4mm4XR2hDhRcRmbdtzA
         ZGfvwkqak5vKRROM8HI51hlbxCn59zUKugJ3rG+mWD1GQt5id8ixbFU2zuj++7fpt8R6
         vt2o+/S4OfWeJFFvO9Oa/ZwDb10NNOy+wBPYt82svUw3FFYcqbmWHxMpbPolj+/q0HmR
         IiE2yt8g/cYsP8RH0U4uAPW/1xRnWlgUrXY8ZwAFyt91lFzFgGv/+2sz8CXMsA4575Js
         0AKGb6ahqWyBqd73FOgqYqPGO4VLMN4q/6FKxdVwsp0nNXM/MZXzxHz10UWBs/Qe2t3t
         xMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641739; x=1776246539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0EattPZiljGg2YeOHkGtyokv1NfgAftzs+SnnNamVo=;
        b=rIqhoCDbEF4TDtnakaAEuFsf/lLRazrmofpw5G8A3oawUtrFMuE5vs0ND7TVWhwH8c
         FieRY7nL3cREaGcg8i0DJShbQaQibHF3GdwM5xcHomA+A+EI43AmrB2OGL0kL0JNy5NL
         OB5YYII14icb6uJ+vBxuPidoJXitVsFBKBalkNxgrTDrSs+MO7mkQ4Px4deG6N2Ha1gI
         1mRNQi3kII7Ez8ICL4xJBvNrGb1xcsR/nZQsYbXHW6QeXvTB0bXtUVLLfQXGQm0lapNE
         JmqodSM9l3+bYSrzz/v+N1qcOH7nlKewUyaCWDtV0MHgu7pnUV25aYVY2MNrJKIYgBOI
         24zw==
X-Forwarded-Encrypted: i=1; AJvYcCVfWtsUQXtjwYuT6WeQlONpg5rBOIngpaz77qMVcxIK6NUeBGfztpW111+ZzTcaXlGF66lAs5FbCD1+@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhcoMPWErOZ+82AebxTi8bZk2ah+AVWYxPy9+yRfIHn6BTzbm
	FlRll3xoStgvKnKmSu6myKiAksHWMo9LDOpTv11ZWwKqxqxPdWjSU3rpESYd5HrnRctf6uDN5on
	F+NUwYVaJZj57ONOD0U890u2ruAxH6yDkZ3BPyVBg0VTq36DpoVulNnmm9zc6yArl
X-Gm-Gg: AeBDieu44u3YFLpCzekPeMjym87+kOHo1OV/n3ewyB/OeABccN9ZT6ZSsH8cvbwiZVB
	aNqskzOvM7HyBhn5jHGYgSlcFD6onl6ir6CkY32/hTnZiQvBamjKjVOO2aMo9qsSjafwTjeAmlZ
	IGqcv8Y8ZIon3ypwLRMISFP8RUr3Oo4G3E1htIC+CxZPFkQaIinRhEFgWTmjT/M2WmlPjynzXFY
	bPM0MLW4HFWzXkvJZNHutOCqrSd+ZbK6/7lT/QxHKuTIfj1ueWvrU2aEG7KMzGRXoRLrT6WZ7VI
	6fx+rgGlQQgZNxbw+YCRSlfXfURlGAPtdtqy72xhYAefdseW/b/7Zn6uolpWUG7e7Qq+YZYpkl5
	OeymAAvA9tRXSdIE/9vinam+ChPc2xE3icjtkMprRCfmC3LFeZanUrR38NDfTzz8sTocWlKZt9/
	FZ7yFLnj4=
X-Received: by 2002:a17:90b:268c:b0:35b:9896:cbd0 with SMTP id 98e67ed59e1d1-35de69d7e15mr20332278a91.25.1775641739164;
        Wed, 08 Apr 2026 02:48:59 -0700 (PDT)
X-Received: by 2002:a17:90b:268c:b0:35b:9896:cbd0 with SMTP id 98e67ed59e1d1-35de69d7e15mr20332258a91.25.1775641738687;
        Wed, 08 Apr 2026 02:48:58 -0700 (PDT)
Received: from [10.133.33.34] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe623d94sm25936037a91.7.2026.04.08.02.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:48:58 -0700 (PDT)
Message-ID: <f74edff9-81cc-4d47-a2d0-e4bae3231881@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:48:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: talos: Add GPR node, audio
 services, and MI2S1 TLMM pins
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
 <20260324060405.3098891-2-le.qi@oss.qualcomm.com> <acqAf9fCi8GPxjkM@baldur>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <acqAf9fCi8GPxjkM@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T4SuFO4jaihbO8PL8A4uiOEV52yQrQHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OSBTYWx0ZWRfX7c5HhPO6chB5
 OutRT98Hjcy4Fg1r06hKLQJRiZIBaJvGJwu9to4R+TKDeAipi2Kl/9yDcEEUxxzX/oPdd4rJSea
 5UE1ih1yHusOXnIU8qKrKUDlgch19AaXZG3s12e6o0Fx3T5OopFkMLiJvJ6gfkicdJoWC3YNNhd
 bDQGy+bHQ1Da9FvbQfyJfdOiWzLsz4AwUsFOotHL9tlzxV2VD8Hiofiqm5Rx2x13bBsbh43tvTa
 i2ao4Ky3RFuhK++fgbg/LgFwU0V6efKi/xVhLmFwDlbHUkClp2iV+6fpBnKzwzYrflQAdMRfNnZ
 Jv0tUFhM5U9+yz9sodPjcsmJ5vw0TAud4n1+lGNWxa1PvOaJvFpLD9gCG5yc56XLQJiJ+fQSnYT
 H6NUUIEPANPnSonNOZZ+8S0x4HW+tN4eLbGVU5Io3H6RUz8kk6XTrBW1GuZBWqYf/+QlL0Rfnf4
 U7uqq6ncDDBGZIcGgwA==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d6248d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ChDje6Agw_Lkia0viD0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: T4SuFO4jaihbO8PL8A4uiOEV52yQrQHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080089

On 3/30/2026 9:57 PM, Bjorn Andersson wrote:
> On Tue, Mar 24, 2026 at 02:04:04PM +0800, Le Qi wrote:
>> This patch adds the Generic Pack Router (GPR) node together with
> 
> Please avoid phrases such as "This patch". Start your commit message
> with a description of the problem or purpose of the patch.
> 
>> Audio Process Manager (APM) and Proxy Resource Manager (PRM)
>> audio service nodes to the Talos device tree description.
>>
>> It also introduces MI2S1 pinctrl states for data0, data1, sck,
>> and ws lines, grouped into a single entry at the SoC-level DTSI
>> for better reuse and clarity.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/talos.dtsi | 54 +++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index f69a40fb8e28..cd451a112573 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -19,6 +19,7 @@
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
> 
> Keep includes sorted alphabetically.
> 
Will modify in next patch, thanks.

> Regards,
> Bjorn
> 
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -1553,6 +1554,20 @@ tlmm: pinctrl@3100000 {
>>   			#interrupt-cells = <2>;
>>   			wakeup-parent = <&pdc>;
>>   
>> +			mi2s1_pins: mi2s1-state {
>> +				pins = "gpio108", "gpio109", "gpio110", "gpio111";
>> +				function = "mi2s_1";
>> +				drive-strength = <8>;
>> +				bias-disable;
>> +			};
>> +
>> +			mi2s_mclk: mi2s-mclk-state {
>> +					pins = "gpio122";
>> +					function = "mclk2";
>> +					drive-strength = <8>;
>> +					bias-disable;
>> +			};
>> +
>>   			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>>   				pins = "gpio4", "gpio5";
>>   				function = "qup0";
>> @@ -4696,6 +4711,45 @@ compute-cb@6 {
>>   						dma-coherent;
>>   					};
>>   				};
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "adsp_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +					qcom,intents = <512 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							iommus = <&apps_smmu 0x1721 0x0>;
>> +						};
>> +					};
>> +
>> +					q6prm: service@2 {
>> +						compatible = "qcom,q6prm";
>> +						reg = <GPR_PRM_MODULE_IID>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +
>> +						q6prmcc: clock-controller {
>> +							compatible = "qcom,q6prm-lpass-clocks";
>> +							#clock-cells = <2>;
>> +						};
>> +					};
>> +				};
>>   			};
>>   		};
>>   
>> -- 
>> 2.34.1
>>


-- 
Thx and BRs,
Le Qi
