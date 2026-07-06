Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87842F6F1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328107; cv=none; b=oFm7Jio7+YE7veSIKddtw89OvfUi5e4CJI2LkJRHH3AtEjwiOaybzc8KFhFr5hWug4ZUmWPEhbCp86GWn3u2zKLz+VpsKC/G8DCAHyyyUtVFW/eKwEKESdgmr2JXYQC6pi4i/QHyCravhnqs0FOM8SDdREEzcEs4R8E5yxLXEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328107; c=relaxed/simple;
	bh=iT7dINpJVOh2dnT9OZX5YmQdX24EQqrwcxdPeEZYf/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEqxy7HxpE9p4hqp7Eqt8xCHSB12fs7tg3GBS3UvPYRV8taUNTwyEGs2VIpWSewUNdogRCqQnmykAfHxCRemDssjb6OZIYn1MoU83o/11gMXQqC3dpKZL8Sc7rk3hbt3iA9KkaB2y1bXUqIV5hpyaObu2NnjSwGvuIHcYiSc+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq9Pmryv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFocm2ys; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq9Pmryv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFocm2ys"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641hRP3470558
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=; b=Zq9Pmryv1R2hTpuA
	7NP7TZzTXj+6ld1F+9YOLnEG8lojczZWd4/K1osX1iQRfHJUV7NNcIC3v6ptEOWk
	MkygyYGotLgjb0LK0wS0aM6V6WAjn9gCim53kSVn0e2mdAwHFdJMiwFkJrHu3mMP
	xXy+rPqynGI+J6dB3K1JdrpP+RkO2oJcL3kMfTlYGAmSyUytH4tsZw5VMCF5POrH
	I02VOE9I15CoXjQ7VwdA/I+MdFSGnPCA8Ag1mA+0Tdp5E3hqhH0SmSUo7XbvNt8k
	rMgtsSepDttnTstuSH03wonWasCoTKHgFm7LaWn5RtSenztxpb5mZ706G1S79SPm
	CuUWBQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen8ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:54:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c891ed872ddso4309180a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328094; x=1783932894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=;
        b=UFocm2yslXO1CKGnX1V/eKZX6cxRbZesw6YPUOnGPU7zIfskCn8dtdGu1kkPyvLcy9
         5TkK3/nt1zSqiZ2oPxp63kiRVxHb22JaFwJPCokv5Q/G8qCBNdK4iziR4MdmXpzbfiG+
         cz/VSH5DAY+WiUeOROZbMIlNXFnqpho2DfEBT1inuvJ8HElawfvKe8uby/fk/ldtHtsQ
         t1XOX7qgmBc64Uy+FuFLlK+Zun0DsNT4oss0vcQvoVLzo9vXkcxVJ7ZMsg4fcqObD2Y0
         /3QDSFhsg7WPTXeY1WCJEMMpjlgV+/xovaVyVM0ttosElpyW55aOOt2ujxXi3oTkjOYv
         h1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328094; x=1783932894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ScZ9SElj0/0r3FTII32o7CTDaNscOGNeQ8hwS8N67g=;
        b=LDgBCEbQHzMSmQI7A0bFgrpW3lDVkHAKHBIVUx2adLIzxtTePTAFIQbnJsnVjyA60A
         1+4SmFBv0IqNnNMX1gbdJJZRndKYHXuFZLeGJ7mxtfbHvIoxlktq5/2RT/m3Oe8ArXxl
         5wwZo5R9+fiJE7DQcYizk8JLsmOSZ4+JryuxUZ5dd2/480tfaOxZJbmr344Yo7RQLOML
         MarqMtkOd2wuH19htnOYZc+YQEKGjmNVoGBuSckb7ifiGibvDjcARysqaFMnkqI94rCA
         EeucSGWQCahZ4U3LPSo/W7+aVGJcN0Wqfrrg251kldOG5ZckyZJJf9EsXx8MOoZPKk1v
         mdkA==
X-Forwarded-Encrypted: i=1; AHgh+RqEt2U2+0G453wIUsDVFs8iomL81rqS/Ey/wIiiP8fKob0G2GMEn+w8R83q9JYl8iKFqjDUuqK2AwVO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0QFBwzUUeT2owa/WIAi4BpnFmdT1kBQ/5uctfuu4fnbJDxaQ
	P/vQ56InG0VfHYzl+OM5afQzYvRpAk14iyUsoA2ycQY/pf1UeycNKZ5sDM7363aegRY8cAVL1SX
	HFQQ2qyAp5q/j+q/LCqp+eS5Jr880jGxBbcOx4ZKfV+Ofd0Ta8e9kW/VxNKoyJXxt
X-Gm-Gg: AfdE7cmf5fa08Btdpn0kJPTkzGcYwdQXdYvXWtKddWhBi90lYyW6YW8xKafbdaQgn/I
	8/Ry1Cp5ZRmz3dCReujqNG+NTB7mP3w+KV2yyOFAz7aVzS4Q8qw5hbHZah6NY2vFMWxwYud3kN4
	X7jKBVhKmQ+Zi3xnku+XGoiHLfr6MWw4T33LNHFtQ1lUpq7yuzu0edWMCVqoJbMNFtAo04R0kEe
	VgqqgCSfyG0w82Silp/Y8VwXfIULBY1OVSwpCZnzfOx11gsfHdhGErZgaGn4G9J91OxQkX6/B09
	bKPZoPI2mojaIbGGirIRHkNk77i1oDri8w7TRcIi641CI9gkZOkKLrE2Y/iFnuCrVAMO9RzQIaK
	nGvQQkPi3URDOk2Z7IphubARKT+5itNNeOgNQWTol
X-Received: by 2002:a05:6a20:2d2c:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3c03e1f89d3mr9858808637.9.1783328094156;
        Mon, 06 Jul 2026 01:54:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d2c:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3c03e1f89d3mr9858785637.9.1783328093722;
        Mon, 06 Jul 2026 01:54:53 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e926a6e85sm5490383a12.27.2026.07.06.01.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:54:53 -0700 (PDT)
Message-ID: <a57cdb37-eee8-492d-aa1b-6aa1b84e28e3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:24:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-4-56fcd1659ea4@oss.qualcomm.com>
 <67fa53b2-b412-40a5-8bf4-b47d370525d9@kernel.org>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <67fa53b2-b412-40a5-8bf4-b47d370525d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX1vwJtZq6+pYh
 TVapjgi6FzqdQm9DjIkuHF1knav3+mu613iY81WlQS1UbKtQhZuagwWGSo0W00n2639Fp3VLEQD
 poDNNNeJJSrQQtYiQlLu4TkLsxRfi3c=
X-Proofpoint-GUID: hN7fOE60IKCfJn0S423jbuvTScI97oDQ
X-Proofpoint-ORIG-GUID: hN7fOE60IKCfJn0S423jbuvTScI97oDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXzWxfSSr+IN8w
 kNFkwCwWx4+rqRY1Ubf4K/YCtSaOcuRWEGSwHWo/sAQ3DfVE2YUMoO4gGGIkgmKMdrSg8PQ2FYD
 Gv977Rd4NfUGEY2GcnH16/fAkXOKvNOt+LR0ErEUL19MXJa5FFdidIWDi2kXSV88H9KZdx5sBo4
 u71wcm12xbsGvx2yYJUzvg55CNJl6jvQt0ZMWYryuljE+Ft2ezy9rvunHEStUExebuWQQv9ludU
 Y33Fk9r+pvGhSjn07yGCJlF36xNAuBQhpPwYyl6Llb45duFEt7S0GmOhPytvYoCYuud+uSXkU61
 iG67nNm1c0N0Tfbli5j3ONwtaXPU76sS0fmdMPBgDTpReiLyopahby33/zlWLXmEQt7Pkm6WAhj
 Pa7cmpZJA+TWd9KRNcVruoaq+HPkdkXCeoysuyU+Mr5zmQXgHerkt1R36Ajnk95WTD8ru19wYt7
 NMCtFHq0nFPZeL5Yqyg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6d5e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=a4Ib5NwJqoKdfpgd-YcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

Hi Krzysztof,

On 7/6/2026 12:04 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 08:04, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Qualcomm Shikra
>> CQS EVK board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 126 ++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index 26ff8007a819..8c4a8bc01595 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,39 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		vin-supply = <&vph_pwr>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
> Same comments.
Ack
> Also, please organize your patchset correctly, so some other work is not
> in the middle of DTS. Splitting your DTS changes suggests dependency.

Ack, I will add the [PATCH v2 3/4] arm64: defconfig: Enable ILI7807S DSI 
panel driver

after both the dts patches.

Are you referring for the same or something else?

Thanks,

Arpit

> Best regards,
> Krzysztof
