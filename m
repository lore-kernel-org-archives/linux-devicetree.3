Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB043612E9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446070; cv=none; b=CZzVICMLbP+gVpZq9MXdvEOibJ/3F6MlQZqexSWwO+gP93QbOmg/Y76Q+XYbZcUu9rPGiKFBxlv+5s1zFPCIttg+eePVB0Xk+SIP2PfUfVBVHQ/RL1KyuOT9gFy5ljQY4fo7RLuVUhSt3IGCmm6q1t2mTZanckCncJ4hQhTgEL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446070; c=relaxed/simple;
	bh=y3IuxWVbfihwfZfgLeBcRjY1oAwsSCax75MFWUkmmRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbksiuvQ9cqGu9iVvWlGrHqZZDw//B2nEvGQ1JthDO+MOCNSskZ7ayIDvHsLTPtfKKQx5ZOl8g23//C9+HrQH0EG3ugRnUq3zSXWz4rGqcBaDwmbTq3IPGxIPGf7X4IDRt1RAD1Wn65qe6Q9UN52PgQ8/cG4WYbQd0UFp1R6HL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNG1RXc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsbSESPB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNG1RXc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsbSESPB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4Ai73947414
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=; b=HNG1RXc7UPwT3lBr
	AmuXsLp0+r3XGXmStneaEMKZN51GHZ3qtHIVMRceA3kuCDhPa4RuEKs+i5z5HT3G
	xEiBBt3dJVqG0C4+jAf4B8WcWXe1D/nelXrdUKBy/AeGfKdQ0qcFR47eY5tEiH3I
	dmd+p194BaTHo0Qw/jur/2sfPn5b45cgOnXkSWKM/fBxncHcYLVBBKHjUW/gdNwH
	2rk/6kZlmgMdVFay+SluAUn/nb0P6AaFIIm5W3XerGSnutShGDNigKbl8FAV3UYI
	AisJ/ZZxh9ahUmu9Z6MOWyw3EY7mwp0V84gZaKnCMlLCmNOLoJKvcMyIvT2hmKLz
	OxkThw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng3jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:34:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b79adeb6so15999485a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779446068; x=1780050868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=;
        b=CsbSESPB/K1c79MbD5c/NfSooSKF9te5kwB/tTHoVhuWsyJ9jCO7jA6qnKYPCfIsp4
         7JembXslnPbGDa3b41dXeMprpI/1poM/rTsZNWOnYJIgBOJZzt/ZD4BDylpCesl7hcrW
         27WJQcNlaBT3WFr9TIEwCjxhX8RzFeUa19AYxN00FgHZCBHuPg7VbV7+03M8L276O/p7
         JNXpfVaXMYhq5sKr7ESo0hM96L918by3vcGJ4gYoPVyaLoGth3AI5DfkiWorw0DmkDrc
         vqryqWQygVEKiEnpHv0wqmSWHjvt/3hmd67IDvUF/cRADwSq0bbpw6aLlMqgu8l90zyG
         XXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446068; x=1780050868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcQe+UoAJYQdJcK+S4fBmdCwye0gDdCM9Uba839eVo8=;
        b=GBJq2L8SmZKY48b/dS1nczIpxidhNXSgWkRCtw9iVN+clmT6juBTvoTLaywlf9WuRQ
         5iUMvx9WG/S982HtcmVMEmpVJvcR3bF6XF5SRR4ay3QYZ5dppxEWQoWF803VWLgfT7vs
         RaTC/gnRhsGMliVzJBBa6eh6cF4scqGvLednqp872XBiZVzQP7/judK6FLQdsKoElRNE
         6ltXK6nJAC/Ixw4gYuJPWik5nb8ADuwZ5lL/PrN0X/MSuB58YhdohzRlhP5rIJFwe4mM
         urvMmyNNerD6OBDMWh6dunHQNoPWExPrH2P3FmNPM5vXJDSxvDrw+WsuBpKzamVj0IA1
         kVzA==
X-Forwarded-Encrypted: i=1; AFNElJ83yp7y93ssARyBD5wkr2tt9Nuq1dO/OLk9j53AK+DZxt2ss3zTSH3OL6PrvtARnp5sNwy3wIgk+TQY@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmE1flnjJZD2pG760UifjW9e4FCbATVuRneeo4jPj6fH1elh6
	3MK9K6jnz/z2A6iJdTrZtPAvkgHQYS95FIHilFZCwK+8MQJHXZnZgDf8C0z6e9xn5V6nmb+1Yl8
	4o+dkbnkPWyUXPQd2cSLTCCBl9Jo+DiXykTaOpWhFf2pZusW3tVQECC79hQFHqy7S
X-Gm-Gg: Acq92OE/kK2pSmSky5qQm+KsQc2MPdNzEBRZ3ysrkG/Mnq5Y/A7rbOTEB7iLiAJkh4C
	4A8Lr+DcktNcIsyL7TqgBoagaqEBpjVtKyYBnhuT+Z0BFQct4G2SLtNq9N500kfAn3wfsFYBWEW
	QSQHxEKf2NF6IRpbZ+78LiN2iUDGPRUQYj0PMfgXJOdpNJ7FODtlMZhELL62HnhBfcGMO3i2+X1
	VfUdfBgd6OegClK2zBol+U39kTkLif31u+OimUVPBkvcp7T/XEbnIvtLmAnDcdOLs18FZvFDtE+
	HTwNcymNGlYCO5ABgh/oYAcHHyz1fL6b3TGzrFl7E+5lIbrs2XRHVYCNcHUObV9gwG3+08vBwus
	s9qfY7nfilfCJ1i9cIijMt5pRy03YT/dMTXcP09xzfOkNXg==
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr300111385a.8.1779446067687;
        Fri, 22 May 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:911:e556:c7c5 with SMTP id af79cd13be357-914b4a3db29mr300108085a.8.1779446067273;
        Fri, 22 May 2026 03:34:27 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm525800a12.5.2026.05.22.03.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:34:25 -0700 (PDT)
Message-ID: <6129602e-6dfe-4194-9c44-b0e4fb4da1a1@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:34:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
 <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
 <df22ebcb-52d6-4a6f-852a-6d6ed376e313@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df22ebcb-52d6-4a6f-852a-6d6ed376e313@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a103134 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YeHrj-Ycd-3U9Jybuc4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: t_kycqqWdEhkKNopJrOkV2jztUVyjbNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNSBTYWx0ZWRfX6Mp1aP6yH+Wk
 n8EdIplCGF8LyAko4Lm+hr98Ib1heZpxDDoboLsX347HETm3d7n3AmOTqpLqcA4ucLdb4z77wbS
 DUIoIjyh2i5CCpAeceG4gn2EXyJG9sNizmt3GVdo1D8vWXi5fN9/FVkFzCzLT02o0yPo2onvuR2
 AXu+pitRDV7WiLCFM+vAuwWJvMNXV4cBakGE5AvEnBES1V+Oon8H3dOyANSqKkQ9Rddx1z+wDsQ
 JLhfP81t/MARhrEY+o7xYB6v9XNxJ6fJGWffqgRl2qtPKhVIEB/0paLfuVVQvGOW1LNlPzyPL5W
 ZJKDRBqgN4hIfrq+UjED/GkoAn6Y+wEArrUOT5oboNm1fBK235uYN8xJENGFQmcS+O+Mm/oMKjR
 gNXfFCEvndlXtXUDIHy3KDj/I1UmDGhjbnvQmX8eZW4rMNNU979QOH0N7bYNA4QaVGykHu0Ag8E
 mM0SLQrDcplwcekvKUw==
X-Proofpoint-ORIG-GUID: t_kycqqWdEhkKNopJrOkV2jztUVyjbNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220105

On 5/22/26 12:32 PM, Krzysztof Kozlowski wrote:
> On 22/05/2026 11:24, Konrad Dybcio wrote:
>> On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
>>> On 21/05/2026 10:46, Konrad Dybcio wrote:
>>>> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
>>>>>> Since firmware does not have a way to dynamically tell if it on a
>>>>>> debug-board powered device or a DCIN powered device, We are required to
>>>>>> add this new DT property.
>>>>>
>>>>> Neither debug-board powered device nor battery-less will have
>>>>> monitored-battery, thus again, why lack of that property cannot tell you
>>>>> what you need?
>>>>
>>>> A device with a battery will not have a monitored-battery either
>>> But why? If for such device property "no battery" is suitable, then for
>>> me "monitored-battery" is suitable as well. IOW, if you say that having
>>> a property describing batter is not a accurate hardware property here,
>>> then neither saying "no battery" is, because no batter is basically some
>>> sort of battery (just like empty set is still a set, empty array is
>>> still an array).
>>
>> The battmgr service running on one of the remoteprocs already has all
>> the information about the battery and it also handles all the type-c,
>> PD and charger configuration, only letting the OS know about the
>> results.
>>
>> Hence, unless there's some other hardware at play (e.g. for custom
>> 200 W charging), which wasn't fully implemented in the QC firmware,
>> there is no reason to describe a battery separately, since the OS
>> can't do anything useful with that information
> 
> That's a good explanation and it implies: "no-battery" is not suitable.

I agree the firmware should be fixed

Konrad
