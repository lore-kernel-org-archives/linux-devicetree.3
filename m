Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A873AD514
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847740; cv=none; b=chelthy6jvQrvjC0cdXT+cCCw/4LXT9vXFKbeVp01gwbE0XGRm39ku3avmXs6wocgO7800PO1BoyAoni68ubtpwKdJLP9JTyd3oHt+UAGecn09NtNkSdnEJge3tSZgd9lchORhnwLal87eZV7F1f2WZL7RfB/IuKzNZcWnJtrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847740; c=relaxed/simple;
	bh=cSbgwQsIMiL4r+c9TFJSvgPFeEAMxUXwZf80tWnw+EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGwv44Uvh05ps6ObuZ0dAt858cr/+VwmIBUooSBbfblak3RmkpPP70n3paXVED3AovCUyX2+1BFtSSuVYAy0ZZE/tvDKyCw/ArAkAg5194AWs60oc6xF4NnSugac4cN665PecQgD0xqcrvf5NAQ6dTTUujMBOTAanlQV2GMA1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXHSf4Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxxMA6qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXHSf4Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxxMA6qG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBeCCv3797495
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=; b=UXHSf4Cm5cKa15Wg
	FCJv8H33r5CHEEvaoW3BEGGjYsMG0DwJ0317XBxPW1wONjByVR/znbBMc5lPardv
	fmgwpDUqUXDH7c6rm+K8i2KAeC+cevc9sJih5QYpFkeiP8sQ7L+s2Q/DiwtFo8pr
	L5RTp2sXj9CIvQrocyOdd+z8hj88snyr1Lcd3u3ZY7ILyM5Vod5H+Y0vLBwBqSS/
	A/hi/jkZLeHCI9z5Nk2yMabC4UWkE6ln524+qkggDpfH4/klDc0jeIHdVfTS3fYM
	su8TerxT/GNaBLeXsSHUEcHW04zK7zE3edC0buujR1cfK/saFgcNShbYaMUQpQ8z
	5BsDMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su5af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:22:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so26873861cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847738; x=1779452538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=;
        b=SxxMA6qGqnM79FU6xGkre8MzRl/b6huGd0/uUphAJCVrCO5+9/8oNEDFvMSBJR+HMe
         x4pGR5hLX09hmb4SwR+9pcX0YpAwJCTeStuCLUylarXAn4+2rtzMoasi8xLeLHT7GEr+
         7UKT6sSGkVE2aqb+dunr8x38YxAABwIV2EfALa+IriEDQCU03SFs9+SslffeYKCQEeTa
         qpzNAseCikQrgr/5iN+a1wuj2ycnlVUykU0umGd1ssjgNo+cQxxgT7+VyEp/y5IMiyZv
         4UqMtAeb0IMZcnW3TCbyixNpeuDuv0aXY/+GtxIUHpqd/k2Mji0dJsDrp4jAIgD9CHmX
         xL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847738; x=1779452538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3CKBojgLIxLibEaJ8g467kLwm5xL6u1aVmhYP8EbH4=;
        b=JBBi6cI77Wp9tEbHs7dth+CEiFWD6BfvGGZyhFykMDlFoVlDPN5pwyAAxiDqPBMHsT
         TqJk3GWfuOV/p1XxcflLhPFDOjy8Yn6K3sjQ9WoLyb4ylNGEx1DffYjQWNgOmcSG0ato
         OP+//3JCsbdqTfqcUIJXGmJXhP+0DgqdQ1BzEgfAQuad0mluaBkKNO27ND6NwQx1aOBt
         uBaF0clGMEP+sPfU8F6TvjP72CEl7a/ZfqmyQRT5S01VzCSNfQ9pEQB4raTxgfQATd8+
         1GO0uIvNLtP48x/L6Xm2lCOw4oYNiK373Hop6B3W97cV7sQvoB7rNsvHvt0Kjbsk6cWe
         qFVg==
X-Forwarded-Encrypted: i=1; AFNElJ/Woc92kGjWd2z3ILwv/mrG8kDXqOHpfriWCtvrIVl6RmXsdLBScSzTB6SDuNZet05DyRqZ+R7hlygv@vger.kernel.org
X-Gm-Message-State: AOJu0YwEDhKPUBOgdT+vZAebm3zSLDLvFAw+QJvjxx+W7XbkAUUMmdhS
	gi3XcbkFqkI8IK9vRjKTYNI8rTRXbv1Rd2tm7wxrxi06TU4ecWfVzff6DXyI8zsP0PlmI41y3TY
	wSwuolep2RWnFilUw5Dt/y/zJpE7W2pWBC6tMKZoW5OIHCwZPS6jY0U/eNHV350ek
X-Gm-Gg: Acq92OEsyzWZhdPXLX3jiiDmsz2GwIN8tqHWKFVEhz0pt5AnSUtQph+NmsfOO/EThkl
	sqOLD4/OA81scnv3Gf7Lr2jCXGVk26kYOOsAL0U2W5xiOWRa09Q5Xq0EmMlXT4WA3NnUsm2MblJ
	BrwtT2iYfkfImxUyXQNB/Q0vadGv++AnrzF2nHXBJ3JQCMxpgIhdUvraulvdUrBB4nB3Zi+N0Dw
	W+mmnX7P1Y6t9Xtur4MtxbeXoMRRCggDo+9J7wY7TkOlnnlQE2hAiz9loP5V5QR61rF5rHtFlm9
	JmL3HNeiqxszadV+Y1lV55adRUe7GC8IphjzBdjFRRMEa/CtundK9/0a8Wsafgeg3b9MlnGeBNB
	7B4eqIcx9unFM0PXFwLrIdiuANcRT8DJnZaN8eQgaI8VR3AeUspwk8fH46eHSr8M+G4a2pZsyrE
	DsLJ8=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr32714881cf.8.1778847737567;
        Fri, 15 May 2026 05:22:17 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr32714571cf.8.1778847737129;
        Fri, 15 May 2026 05:22:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6834ba6af5dsm1677738a12.14.2026.05.15.05.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:22:15 -0700 (PDT)
Message-ID: <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:22:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
 <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX4HLo8aH7/Qlq
 1bw+zjiuYoRrA3m0cauFGituEJvnRz1x+6c67gQOz4hW8GjJEbzjZXjAW/4/CARUUZhS63UKA6Z
 esdg8sotjE3qckpewqn4N+oladfJTEIa8ItNVEs5X6tH5afjNHPpiX/8zW32bL1Id6XZ8HOEJDK
 Vba3zdHLIY1sSCLpSDrpi78rbvVUxd1bbc6Kazm8AyDL/DyEkExfTQNwo8IWplR8/uPPNSZK/E7
 oa3jN3aII8lv3Csxd8GuyrW/seSKWnwwV3ket2/4F8CQihY/OTj77JOpEtG5H8CzF+3hfddxV8b
 U30Ce6q8wJb6s23IcHhOeUYFdpkTMNgAbx7Ctl5iDVpzMBFjpyLHQUAvuU9EpK4czSLyxxsiq/A
 /cKV84jis5teqpq2hWyJRec63toWJcVb4VI15xoo3atQeyGzFU7hRhYUgySU1AK5XgD1gveIakx
 TpmUnEtQvxJW4OzhXLw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a070ffa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DHS6kQ4Rh5SRIDjE-IkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZOC1myQ2av20kiVJeyzMT4s4YrwefhI3
X-Proofpoint-ORIG-GUID: ZOC1myQ2av20kiVJeyzMT4s4YrwefhI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124

On 5/15/26 2:08 PM, Qian Zhang wrote:
> 
> 
> On 5/15/2026 6:51 PM, Konrad Dybcio wrote:
>> On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
>>> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
>>>
>>> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
>>
>> But isn't that just the wlan-en pin that the power sequencing driver
>> takes?
>>
>> ref: drivers/power/sequencing/pwrseq-qcom-wcn.c
>>
>> Konrad
> Thanks for the review.
> It's not the same pin functionally, though they share the same name. There are two key differences:
> 
> 
> Different power topology: The pwrseq-qcom-wcn.c driver targets WLAN
> hips powered by an on-board PMU via the power sequencing framework. In our case (VENTUNO Q), the WLAN module has its own internal PMU, and wlan_en controls the power-on/off of that internal PMU — it is not part of the board-level power sequencing.

I don't believe what you said about the pwrseq driver is true.

> PCIe probe ordering: The WLAN module connects to the PCIe root complex through a PCIe bridge that does not currently support hotplug. If we were to use a similar node configuration as in pwrseq-qcom-wcn.c, there is no guarantee that the WLAN module would be powered on before the PCIe root complex probes, which would cause enumeration failure.

What do you mean by "*currently* does not support hotplug"? Does that
depend on some more code changes?

Konrad
