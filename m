Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B341D4C1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431120; cv=none; b=WDg2v3X6KlTqEJ3E98gQari7j6ZL2Kc7+GzqRrwm6V0Z5JdTXTgat9ffrjPWoN2zZ08u1165mfpEUcYLI0rlETQkNQyflWArnvoMh5IPcjx71rFXPy5sbn+cTNmADIwg5rkhl5dHAskj0mLRyW9h2pXQ5aV57ylemrJ774ARkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431120; c=relaxed/simple;
	bh=eRiu6xlRGCigoYlAt5WHX9RcoVVKkVTEbzs0xA2TxdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIb4pSySRoH9dc558nvNV0OWXuAI5PTyMcsGLjtZcJc0eHkWzpY9WiYp9/E+PZ3rIeVh6mx6yN8IIhAKBVTxH1Zd5uL0WFzJwjezql1+hOhv5dWKOLXSo/viwLGZJBfZg5GZeIAGe6U6hSRHiqa62CK+lvtoQg/rPSGu35tnOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bi4KvWky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd0749Qj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bi4KvWky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd0749Qj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8g1X3616595
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=; b=Bi4KvWkyjCYIWkkD
	zEbw6r4o4v85TAY5VHjqFOHkxPhVerGEX4bFosd6vbZklh8bu2AhZ+uF3rWaRuOD
	oYEsje6B2bP3xwAaBYyD4IzuirNL+NmuI/euaFFIcX4qSymRaXoqYcRjhQQl4eEC
	NiJy/M/Yp5viz3o7Q1C8HcuEL1MqCaFWd5ri5ihesyxWNh0hjh2IShWqwExbNI/V
	w1JhIHWO/kW0dua2epZqTnGiVfEx9l0NWzXFwPBCifSVoq+bghQeOyuKAyCHNZYs
	xMKS7+bFyM4jfXFhMp7/ul+n4EAc5J0ZajFmei7x+uMs7Q9jymxtjRvMjwM+vytr
	xEBE/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1fw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:31:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bbd0afffso88290065ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431117; x=1784035917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=;
        b=Jd0749Qjn3t9m5UZpf3y8imJYpAui7Vsau2EmXLKqWl0cJu6IMITP7bbqRBICC0lZY
         FU5zsm+rSl3f80jeiSTEgVdyeS/vCMZh0Pm9xb7bJ4066PzHVNcNFhVz0Y1uvZxgtjEw
         7aGO3zSnJKgntNB3fUmA/zO4Tq9etxehbB4mwttQeCBki60iRmCN2Eh/UhcEth1BTfXx
         38fIBR8QPk7got7suSiBTRTQDB02MmTQfEfIfg7Nn1tMAdzr9xxypQzRL9/Xd2OWGp3n
         frsYkJuU8ibrM5ZJZj+xg1bdxjac01XXzfXYYm11kSDluWHO2tcwDSuAXSAo1krVCEWs
         GeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431117; x=1784035917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=;
        b=sNZMUI6KwoV1z9w0cgAcE6MJqr1ERiAhWj1GKAeySTRTWTo+00wBTtt2ciLn+HxlUg
         VjprE06C3SIC1fDCTyf37ahZ7YKjOZXZMH9emCjj7yympxui10kXGieUUJz1VcBMLFl3
         wpc8A74I4MiiejXOZz7hM+qmlrz9u+l+Ix/1pGtYilKwPU/vpkk0SX9lD6Atzg0yuUa/
         z1cIyccnOMwoXSNwAsVxnyuUraHt6QTooHQSgToHiBLsKtrJUj/y2+IoIo8BmFkD/6Iw
         P2y5Oiqlju/h6YIkNe0Ipxvmf082CKnKW2XpLbYS3kQKGHYUkkBrE93xAU6LhGc3ZRba
         cMmA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5+ivSV9KK4xIF8UeSNvvj13Iujs582eZ18hwEC/h5Jo0HY7oApkRi2rG7djf6LianQ7kK1kbmjiWC@vger.kernel.org
X-Gm-Message-State: AOJu0YwtihaeihsIiR5xnj0RrvFT9FzspP5SSpuCeu8ljdA2vjEFXr2x
	SBgRMAZBNUM0svreYlMqe4+4sOiQPl2F319hQQiO5eNw8Aw/sLuak5IIZvh5sgwG3PPbY5muZWJ
	ins5ssqR7PAlUg4m+XFQBXFQst4YNcWLatasdLbWVZ7D9EURFWYXeGtpMq5yiCH/m
X-Gm-Gg: AfdE7cmp+JUYBFJnolhK1310dOxI6o6m133OaiFSKHvbPZA+YFmtJEHaIUmLBN/fCKN
	vKM1qMP+V7NBCfoDPWlnsUx8AZ7O+cncKMhEEBmYKMk06PiM0itMvcGMt65BMHOM13IaVfVM63x
	TN+wl+y7fCkh0VgHN3BVMNxLLmMgDrrNV17YlLCVLquAft1gaJRZUYTIYmjjcv0fj6wzVWxkKcd
	IFST9ktc9XQey9H9BuiHJKr6Dy4g93qDzvOyY9mjLvj7230GITY+CRyk3RS36Ac4B3G4VTkWFaz
	vdMjpJILdAwa6NcetWwbC8P89qxwGnJcerdToVB3V8MBxvvQqqnPN8GLJpjujm37jQQovYBqVKI
	wVIlQzaGbDygfbQVJYFFU4quCvf4XRwitoOnsL28kNIk=
X-Received: by 2002:a17:903:fae:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2ccbf0105d7mr53194365ad.31.1783431117202;
        Tue, 07 Jul 2026 06:31:57 -0700 (PDT)
X-Received: by 2002:a17:903:fae:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2ccbf0105d7mr53194075ad.31.1783431116723;
        Tue, 07 Jul 2026 06:31:56 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5fc81sm12180185ad.83.2026.07.07.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:56 -0700 (PDT)
Message-ID: <5b30d4c5-ce21-492a-97a5-2a64f0ceb65f@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXxq3NjP5ndhf+
 x1NpJl1DYIjEDysR8F11eSWsweIBWlGhZayJct4wa39hPnzTWpSVLA4IgjuBRVev2iYMLY4uEPi
 jw8+TnHDFVdON9QhIcmU+mRjhOHq1Ys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX3ys7vrCD3Er2
 iZXeVo5WUDC6qtSXSXjY5iCdUovgm64UhiUPqToixKDmxvQRlLHBWCNc/eGVbP848mkLXf38RDD
 1+fgOnBlMz1Cg8Lb7qSksVqTQV0VYi516pkeENiNjqWja4i5LYMUdJLxDNdeblABJuEbcgxsHsQ
 icDSP/7X1623BA/cUaXvtW4ZZXhItixPVSXavTBlxf2djAu7ohXSm5ZvY7AO63Fdg7ZLRhK7sza
 O6CJLcqEwoMBzyNxQCGRjzvoAAlY6AHqniOKolZb67ithdl6vFn7x3An994fS2PmJwcaD2FibIi
 s7uQYFl5YBoC4rEDezSmFo5csbEuwroJFqILEnVQTQ/69DQnqU5X08VNLpV4SoHaLA6ujlPOCXO
 IPTRhfcIGcMyf0B5ajxvnoRlNoubEWg+CnjOEFLefI0BiKgOULZ5C9GXOkSC14Bbayh92KNGNdi
 C3LAA93OS4u6uaK3kVw==
X-Proofpoint-GUID: 0ns0jiEO6-TMeezM3sHroLw4XvVDa1aw
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cffcd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PgX6_706HHJfHgd0ez4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0ns0jiEO6-TMeezM3sHroLw4XvVDa1aw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

Hi Konrad,

On 6/30/2026 5:31 PM, Konrad Dybcio wrote:
> On 6/14/26 10:05 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC node and define channels for:
>> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
>> - PM8550: Die temperature, VPH power, and system thermistors.
>>
>> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
>> correspond to the off-PMIC system thermistors connected via
>> PM8550 AMUX/GPIO lines.
>>
>> Also,add io-channels and io-channel-names properties to the
>> temp_alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
> 
> Drop, this is zero by default
> 
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +			trips {
> 
> Please add a \n between the last property and the following subnode
> 
> 
>>  		pmc8380_6_gpios: gpio@8800 {
>> @@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
>>  			reg = <0xa00>;
>>  			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>  			#thermal-sensor-cells = <0>;
>> +			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
>> +			io-channel-names = "thermal";
>>  		};
> 
> pmc8380_6 isn't mounted on purwa boards - do we need to override the
> channel definitions in the vadc?

Thanks for catching that, I now see that pmc8380_6-related nodes are
disabled for Purwa. I think the pmc8380_6 ADC channel definition can
also be deleted using /delete-node/ for Purwa. If this is fine, I'll
make this change in the next patch series. I'll also address your
other comments there.

Thanks,
Jishnu

> 
> Konrad

