Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6F41736F
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688779; cv=none; b=ZL8IC/23ZzvbDtxHE/iGMC+q4di/9aduiE4IvXamkhcWYykqhD9oUV7LLI0W/26m9Ors1IpKB4BpoLFLdxfRKOLJChG8Ca0ZSTcOuTi57mx4NefOlXT1HWAloP/JteX4G6os2XKDltNs1JHeUJIaLMEme96ZMuosaFebWAu2tJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688779; c=relaxed/simple;
	bh=em54vEJ9PrEPpDnl0vnmxMcxJEw8fCkYyJApLvA7sh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxK0HdnTRiAMrcJyIxXdH3QLJONbbYn0iCrE8yKssb9JKE5msxxDdFJNLZ7ARWzefOCXAF2qrOqwNpVMHG4no64cTtY3g3MwGiYH4wr4fIIHgnVkC0Yq4faalpgdqTu3TriZa9zmY28iiTwkwKDuiL2Fy/JHdmKrEwlSAb5Mz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7rCEYM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0cxy5lA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7rCEYM/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0cxy5lA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5vqH919892
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=; b=O7rCEYM/iJpQzbAc
	qv/kJFREIvyk0+PUUNJk0WvbI0GNr2tuWLy3DaV0AcQhgMfmPlv4olRQ0lcPEPLi
	xAlK1h0I1Y0ynxWTVIzJrmB/XCPkZrw5SgNqxl9I4i0qLyhZy2LpQC7R6Sp0Xmo9
	rbCNTZcGm+5ER/0juePB/N+JlHrcjRhZORhFtDKKWCPqBGrPseg35UO0GJdacgXy
	93LkZfUAd0eatLKJZgIbv5aoF3rLfdfVRlMsKkOVlpTDKtLfaTXcPKlLHvTgFaxW
	XJn0+CXUJkUdga3uckIKouTqOJKEAF6wTml99MKPs8htBIqCrojhFZfjri8W4Gim
	2fA6jw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte36de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:06:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1468477a12.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688777; x=1784293577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=;
        b=P0cxy5lAfirJ9WixyzcBOXphQdVltYW1zGI/vUtaQU9atCoLgVA5AfnYhl05yNukrs
         WXL5Sp0yKiMnEmK2fiPybWn79OqQd/WTXMZ4ZB/RUWF2lpprEZLkwl71Q9aBgoSN3Ad7
         9Q6Gn9GrAkMmSkv0kveOPNv05X+qM0pQyDWVKRuJ/3exgSS3frmHe9pW8GCSzEIxQK35
         UxIDfGUh2MWpkFc+BTzxRfxnLEe0q2RrydOW8sjIGuxhV5LYvznWlgRb4fPytEbzXPqR
         BwEpJJuFl/oyvRw0VKoNxqtkzj0d9sgLA0eURHdj2tztbikb8KnCUDRQNMknoDvRswy4
         w8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688777; x=1784293577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYAAMsBNo0EcquyyizfpGzHs3u/JXWGcBGaC5si0CRk=;
        b=Jtg0sYOKx4RJ1sOKKVuS4ZO2FA031pQ91GBZ/8tnquTT8wFhlDsJDzrS3KDzu2Zxpp
         RwR2OuNha7vzJE/4mVlXKNsl1As2qaRPifx5h2924IQvXY3yqWme+QlcRrH2kIgEdMU6
         rWsLozYG2uhAAyH7KDobFD5XnDKKddv6vrIU+vqhZzoYvJYX53bk0FP7VO3J5tSGUU1C
         gryUlpokJvSIVWpbEWWF53+Q7p7d8Fvu0ZYOhazl5CXI7QldrcFsRFoQqkaDFG+23fDI
         0bs8MzacbfI4RkwL7e79T2X8RUNpuPIYeuSnGVNZAf3SDfOmX9Li1EQ2UHEqCzWo86Ry
         bV9w==
X-Forwarded-Encrypted: i=1; AHgh+RqRToxRNeMqnrgGa3+7Cj3htR/JJWHeGfVszcOi/CKV+T8ojk7lK7kvaz/W+R/5VwjAwOWCoYoyz1Ne@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mJnrdx27RGtFAfu6d3oEiUoVZWBKdNv9H02B4DwRiM0NTSYg
	tsLcq9JLd7LGMAce/12KucM6cDKKJRlnRyyQmJm/myTdzERBDU4Nlz7PxhgkJZuEj1QrA+ZsF9x
	3tk/8iAj9sC8aBG96DJMalVh+39qJiExSEB/5aN6y7ljLzGtgO1iaVUFPg9OK5sgC
X-Gm-Gg: AfdE7cnkyChiCHs0YQfa034C7d8l3SoTxyoVHrNNkBviCMnEwtMOu+3jKNKTt3YXeoj
	aLDGIp5KM9Y/ZFDKNqeero7exzxutkyQ7fIvT0hxG2Znc2fxIxNn6z+9BOjVCDBNFnGGBrN1agd
	ztI27LSj6AqnY6cPr+lIREEfeLF0/PCHJAWq7F/TSCmfJcxhvp+N0hjWu4CTc8bN4D0oXvuLR48
	FujlYQ6T4ETyY5viM3DhGgBAI8rkWOr9knR5u0zhn9nQTunRq1Rv7KQxUH2Cw6hnAhv+gzXbyeC
	HzIzyCYDobIskxeIqCTZSwMtkac9a/VlaTWG7MaCZIJ0ZdPXBCwEAHqmSBsUMiI6odLCDAIJwc9
	qCFo3HuPYOkXlO3TwJv3Kc/Vq/Tvhsg1tK8Bdf/8S
X-Received: by 2002:a05:6a20:b78a:b0:3c0:9c19:65bc with SMTP id adf61e73a8af0-3c0bccde08bmr14615439637.68.1783688777001;
        Fri, 10 Jul 2026 06:06:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:b78a:b0:3c0:9c19:65bc with SMTP id adf61e73a8af0-3c0bccde08bmr14615390637.68.1783688776542;
        Fri, 10 Jul 2026 06:06:16 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm45048813c88.1.2026.07.10.06.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:06:16 -0700 (PDT)
Message-ID: <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 18:36:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SIRfxPrpm59KUQ4KLflDi57ehl2X589P
X-Proofpoint-ORIG-GUID: SIRfxPrpm59KUQ4KLflDi57ehl2X589P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX/ZOfoag1DPK5
 f/XL9RMpsZUTqqVNiON6Cs+u228emxXz7cntnynTCczUj24jPtlVo95MXeBGMs7bMnygZo8vSDM
 Scjpa7cPZoXhkyJS6bhLhsBhE5jkWkGTzi7pttRslubg1Ar6bKoenctZj8VZsvyTsfot4d2gkOl
 aA4dtbXL5d6TlNhPFROqOdfNXfZhDP90Es62HqCcNq8SyuCbWKRT3BMZqH+H5AcS7yLjW6VDBpu
 HQsGeOvzTjWJE8cCbV8UhjI90bJtyspIgCfCMlL0Sm/4fz+g07Ir84G1dgwtP5BtJXvD3ZxBnem
 kWZptk45t1snYKuopWkKqqLyHPLi7lULGizcu7KeBnclwkIImsEJUrheCUDjqNEQ3gz/Aydq6XA
 H8wYgk4rdzWIycU+pYiu0BViAHam0XWxXNoV0ZBl8XoaAibBS9pd2JzgtorPoU3/4xannvz6fLi
 OHMv43zfnn2dznBEkYg==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50ee49 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=D08nViSs8J4lS6wn26kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMCBTYWx0ZWRfX+JbcMrKf/d4m
 w7QlUKeU4TmjLj0DK5pWbfua9V4kkIbAQY5udNUoy+uC++5A4Teqswz6tOTHcffaH6sRT0F0U9u
 YwMBewLLQ3SReIB8+vY8r53RGnKPUdc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100130

Hi Dmitry,

On 7/10/2026 6:19 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>> +
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> Is it an actual GPIO going to the panel or is it a regulator on one of
> the daughter / whatever cards?

This GPIO is part of the daughter card, it is not going to the panel.

>
