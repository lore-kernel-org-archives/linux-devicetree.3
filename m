Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088713E2767
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733169; cv=none; b=i6DMR+9ckQxWg2S7bwSVdULLIJP1VTPCXLecRr8YmUCmRTxDNVFTK35XKIFInrrt6Ei9g6cCRHttHPtrSztv58jyEShq67rO7odbZqx+sVVGxZvjSvtslglAg6X3FqvkUP+9N2QEVumtQqWL7KxjbYGnIJI3wv3bGYiDG4nQKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733169; c=relaxed/simple;
	bh=J0XiClPXF/GruK7GbwNvB/VtTanY8jzcS0ooQKpc7Ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHyXh06P7Naz3tGBmKSaQIkEdlglaLu57sv1ugoh24E67Ym35u32Belzxlqgdmu0Gs/Jaqz3zqwDvprjxZGYfv7CgFAUmCPDaup/IUciFuF/HcxJEwA894bnzzD+gCCn0NUcKIpEqFzBJ/8n8cbqIxFztafT2kccbgz9pG1WkQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVRVM9tO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQBi+otD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVRVM9tO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQBi+otD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKhv2656122
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=; b=oVRVM9tOF16idNaG
	B4DQiE5aHsTo0A6PYZtdyI0VrJQFEIhECEMSAmob4OEIxuF85uvu4ka0jJ9/7F+T
	ozDUTE5XVaCA9KdMp7K3owSTbhFspQ/j6/FXQ3vai5buimqEekc+WsF0yB8B08m4
	VhmDWsTmCf9EBTuEv0F7eBXD+U1Ufzw1gH+3J4bI3KUAdu3NlycJv1c2TZ/TMT7A
	zntElCKvs2ztjqkWfzl14A3vHnzvS2j/g3Lyn1qpbiKNqg1yZ0Ld1oW69oPvQe6s
	kihIhohDzqwfNdkZ1YJSdXkyam3nF6sGhPPysna5yMM2+jd3ciCy2wkycn0AYypD
	bMaquQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gk8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:39:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so4762235b3a.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782733166; x=1783337966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=;
        b=AQBi+otDvCluMDv5OXDsVVkYbdklgPtjGjNazOpavCuI641/mooMk/vNCOsA/SEWY1
         wEoKl6G1+iCB27Qgj/IHt15qlH44Ia4COkhIh9ItxR468Hw6ugmcVVCPtP4ELm5+WsJd
         lSct3J7LP9oRA2P9mFB1dTpHS6rhONZF1LCBNUX0dIkHmseMMfIIwp4K99/JDVm3AzWN
         FKh6vAmU5KopR0jGyyCOsNCXJsUmglHiyfMaOIl7LcPgoePYNYuRe9R768ope6SaIduH
         0zKcEit0Z1SWvfJFmo5ad6zbBphOh/OJuSO17Us3Nd134o52mIB9/QKZvwVjlQ4a6vRc
         7l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733166; x=1783337966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R/KYOAgAacKor/IUNB4vBHVYiEq5b+dXGG95mHRtvA=;
        b=B1xNsBP1fEE5fAGPzmuQoXbVukPR0eiKOn36pUMYXJ7qiwMpKY3bkx0KCsjfzk6KFf
         VnLaY4Tf9hZL/dSsyU/wYTd39K7wbTo0pjbGMMzSWkV/98kTCkiOdA73zHoNffsDGtq7
         fBL896/VKpqBTDH0W1X38k45bQN3/h8tPNaiZDLEHS/VlsEX0XrPbb/cgeFGxKfOFH/I
         slKiQtvF6WzmSCgHpLTBH3ntGI/1JJFcbcZf794QLxEEPQXEEyGFTMnd7+Nf9rZXMPMH
         sNYVMx56nRI0Mi3sg5fl6o7J15baJqeAD/Z6kI5OPMUaium7wmR+mlXI1iyKKPSOo/2N
         YP7w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2vpnwlAFMBffRke37RiC8+Sf0pcWG6/0Q26RQ3lwdWzVnXirKuCMQTVguawQI8DznmYV37Oa9ZpEX@vger.kernel.org
X-Gm-Message-State: AOJu0YwqubB4agyyyv6W8c00qn6sMN8H9HbTIRX2/6k+m8rTtsLBLUkw
	h9jzC029/LiTSsKnyOkaQnL6OImuw6r0nc5+n24QZn2OmQyPQZj70UPzEMP58Y/2scYd3rM7KRI
	NFD6luIvUpwRWHhFZPab71dd4XeiqrMW4hFsgeGuyOsCz1dd1U6BZdmlAwG4oZSPF
X-Gm-Gg: AfdE7cmlNDzyGVr7Q4rinWep9MUJtjqPn+U1lUOq8kLHWlefrDozq6Q0pntKwF0rYPd
	LJAQOcCFDzp/Sb1xBHgm3o8FSwWGfT/u0vznhlYRn4iS1zG/bYHRQ27AGR//mTHrAaUghPO4N4G
	928Gi3AGEkU3c5Zxih5BAM6fhMlatsZKZgBwcg3B8cWFlVw91FyUXhVeYL/OYre+G4S6JinMyX1
	Sf3yi7Y8MG3JrN2VUM6uCagVoOlq/94FRyT80K0tB+boHpcfTAVjDkPhaPQwX/qeWJIEOh4PR6e
	H4xfCnYjDdVulqcjWIYw0VYt/izZPE/+1AMZsktuHgDOZPGBrWrA9IhzxOt03oRPrUzODwt/F+m
	VhkNfWLmvOHx9z4co7L0aWDBxDamO9nmF2MPkqzwu
X-Received: by 2002:a05:6a00:2d2a:b0:845:c662:2be with SMTP id d2e1a72fcca58-845c66204d9mr11620948b3a.42.1782733165867;
        Mon, 29 Jun 2026 04:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d2a:b0:845:c662:2be with SMTP id d2e1a72fcca58-845c66204d9mr11620926b3a.42.1782733165387;
        Mon, 29 Jun 2026 04:39:25 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm12360132b3a.36.2026.06.29.04.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:39:24 -0700 (PDT)
Message-ID: <d1433484-f793-4e03-ae91-097f8d48fa53@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:09:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
 <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <6qf7fau4yfmyl7qaecwxbj6kegyawq6euovi7ewwuki57gtepv@57vioqyiladd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX6jYTD96PiySF
 QZZwGoOjr56diY8kfNUflTYX8uSxyE6qpOjQDkJ5xTAlewlqA02QHFZQbHXuEAJaeX15s4scjUA
 BkUaQ5ce/4Yel0rdvXGeZqzRCX9eXTqxDxHKnWSt3tLWQC++zoJgsy4fU4DHKsSAEYys113txg6
 /GMx4CGMCPmv08yZ3x4pa0RIG1WbFE9sGlY1/s1F36Um22Q2lKMnCUHfqSlB+OcM6J/K8xgb9LP
 a0ZZreEK419SDEJ73lQjFhURdfxpSXJ7RxtyAVVHrhwThlw9u3XxXdY1RGguXDC4xS88xpf73dF
 119sO5gxpntag2Pgo9uOJWJ6XFnC27EmC5OdjdpUg7xpmhAaABlM0mCuj/AN44fYxK/qIM8vd74
 fRtSrvwxkSDjCtHdC+KdkjkoxMkME+vYjmM3goUltBk3GrTO9ZL/0ykKspst1ruoG7Hp9QAn3XE
 0hqFGVlMxfc09DpvUgA==
X-Proofpoint-GUID: 6XeC-y76A_p0w6xJANntXXbTG4kbiHjZ
X-Proofpoint-ORIG-GUID: 6XeC-y76A_p0w6xJANntXXbTG4kbiHjZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfXx0r/qu1f+cYe
 dfaAheto9ljDW8Ul3sgeUdW1yS0PfPYssYh73EbDYmp29A0oMWUoHXFWxrNhAnHhop/uX4m+G/P
 wYV850/7lswW/qbvtlq+S4286RcuuYY=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42596e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=m8bqIFIvbyN3laQ-QhcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290095

Hi Dmitry,

On 6/28/2026 6:06 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 03:31:38PM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Missing SoB.

Ack.


>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm4125_l5>;
>> +	status = "okay";
>> +
>> +	panel@0 {
>> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +		reg = <0>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +
>> +		vddi-supply = <&pm4125_l15>;
>> +		avdd-supply = <&lcd_bias>;
>> +		avee-supply = <&lcd_bias>;
> The same question regardin AVEE supply.
Ack, will update as two separate regulators.
>> +
>> +		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
>> +		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
>> +		pinctrl-names = "default", "sleep";
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> @@ -116,3 +174,49 @@ &wifi {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&tlmm {
>> +	lcd_bias_en: lcd-bias-en-state {
>> +		pins = "gpio151";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
> Order by the pin number.

Ack.

Thanks

Arpit


>
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
