Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233AB345CAE
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155133; cv=none; b=piqroni0dnYY1ooU3PwUxQapG6r/9DCGBm1+JUi+kuIL14VGPFNAMJj66TDrkTfzZL50ZUPHAk+V9eNecHBDvRBU5bCoE3ZNhaBLE9Eon0+ymxOa4XpjQasE0pDzTP8HlfTs2cbyIrjAjMu7SpqlMr9a07nuZgjuB2RTziZPDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155133; c=relaxed/simple;
	bh=PaBigCXSV9eUDTvml/c+vLYAF7O1yKZhZXqMTUdedLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLx4K/JE9ZePP/VHPZvcKv1PW/YFAzCapxV9q7j0OgA2n3OIo6X0ssynR3DT5ph+a4ydPxf12FerHDuSJUvyY55MPkilNvunc/RyqLdvnm60Guxbm/d3dqZn3Cn4+tVSbC7Y5SgisKvgHZrX/4E+rbFfOZcQg7nRIAv5P2z4Jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNUDSLVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1VS+WxY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNUDSLVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1VS+WxY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4ZSJ3486023
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=; b=LNUDSLVgUIcXvya/
	zWZIFsBMCsN/bRBMhJrU7x8hMg/Z67l1Y5/FoYuVPER1k4t5QAoYDK92NhcHScQ0
	UDuXxFtYAIUWqfotqoVDWWFcGlspviMxtczSkVsA0VLPeTk8NDHFnTWTLIGZbwy1
	Ylyrmo/UtBbTlAvABsBKwn4u+H8XzIUpQSpiyuqq365qFTjCUC2JvJan/ADvkf5G
	fhjvZFtVfzMjTt+lKi7zJx+o5x6NozPs39lfyeJm5ruGYsnV3wCYzLgGeNc/baP/
	Cq/+YfU2wDMPO7SU6Wvs1gUfVk3uL1nUXlzxhZbI7FNtqPE0g6I/EhLE+gEzsdeG
	Znv/Vg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heeuc59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 18:38:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da86144daso1036704a91.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775155131; x=1775759931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=;
        b=d1VS+WxYyUInz0b5fVK+uOcPV97PU2/rDEoUOos47KvmrXQQHLzmm3elzO8Zj6yjkJ
         DDQJOyloF0yBp7ohrjN5ctQ+dYnWaOLXM50IghLqJ3Oj1Hm/FMczvSABbYjUgkTcRBiU
         5AeoRoxzYjNVhO45/W79V/u2/lRXE3fN9y2KuBvq58e7rOq0f4Et8lw2qC22him+Sti0
         wpwMrs1CO/4K2JfiMTt+XD5nKIRsTVoQRlCZY8H3ZKEejGYFKeo5pyN82A82ISyg3ZDD
         rp395r1HzYKWrVlYwJZA5MAl5ZhjhiqSIZAEYCdtzfKfjqV/wrQuY6VIC8t4wSbTaHCp
         Jy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775155131; x=1775759931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=;
        b=arsawxPW2ySrJeh90fbqXjkK7fhindtNWN5pZANyislTzjKrYRlWsufcyDuVlIZhvO
         11NiErEtsFb6g7R7pjryHisPqb58QoAwdALB1GAuzuo+DLoPwq1GTjx/H0CVIoUvTHTa
         ILshdoxPA8HjwSME0+ZfiaFsGv8QTbr1eV+eYtlgD/HtB87z/uY3dSooQ+hhGfPkJNwh
         5t//sPwomr5S66YTM5JvkcNuiFY5JupFEvNtdqXmvt4wrR4X92VHwDNCrJI560iHght8
         xGaoR4HS9fMSmQ7lJlLfhvhQJXXv+TrRCgjv+JSSqs4yVHP5p+Dl8G6ab2zel2L3HGVV
         pFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWznHk8YWJWY593egQXzuIE2Q3aVx+2y0DG/gc8oMBd6MrJIWipx6iedjvo/GCo6Qo0ED77Ca6/F+/q@vger.kernel.org
X-Gm-Message-State: AOJu0YznqJIhCQWQXNMuErWFQ3bHU/BNT9R3Wr5GrdD1L0OpXvVZVNAx
	vLbw31BGGBp4iXcaIJqelAp9WhxqdgAsa+VtuUTLJhjEcBaVDmGStpN5jgDyAw0tdVayr+I0pGY
	HFbCPf9U7OazGw98x4HGjoMp6vVLpvfO4RwLUNl5WDEjE0Uex5xgLk7PS4B5VmGt2
X-Gm-Gg: ATEYQzxTaofDqgXnWfterPaTWSEdltYUeHXDIY1VU79ZJBSBqX/DwOurFxVd5kBiDqN
	oyjyYu6MHZ0/YqsGGpIxZhDaVG+4O9b8BY683OxXpkSQdcq517Feto1cYhRueaxtSRATFJN7Yuv
	Xzxd/K72PCbXQhTuW61kHh0nha25K5CDne+WCf/cJd7uVKqMPm1gESsgtFT/064Yu2bPr8K7NUM
	TaxftYdraxEba05tSm8yy6UpF+ONpzgWInUwUkZ4gQerc2iRq1Sx0z18hHiykZqPdun+3Bh2QJM
	MmofMLz7BlsZFqjAezxoUxjxrP0YI86XJxZN4WGQa0aBlIf29wqcdsRt+guI4SIt2wpruR2+FmP
	gjKEpEuVIAfjgfrDM9XVIGWBs1dzD1oiXVgPkULo6psLHVrove5Lu5XuK5w==
X-Received: by 2002:a05:6a21:32a6:b0:398:6b26:dbfb with SMTP id adf61e73a8af0-39ef773e5aamr9643366637.49.1775155130797;
        Thu, 02 Apr 2026 11:38:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:398:6b26:dbfb with SMTP id adf61e73a8af0-39ef773e5aamr9643328637.49.1775155130283;
        Thu, 02 Apr 2026 11:38:50 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76d2684b75sm192469a12.14.2026.04.02.11.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:38:49 -0700 (PDT)
Message-ID: <65c52a56-9c2f-4afc-afa3-a574df0aa045@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:08:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Arnd Bergmann <arnd@arndb.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
 <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dwgHNpXkai4s4CK7aTZDbzTCj3RefPjC
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ceb7bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xCZvIt4Xq4xTzMb426/Gcg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wAd9VK4cKAlaSywWKTMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dwgHNpXkai4s4CK7aTZDbzTCj3RefPjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NyBTYWx0ZWRfX/kXbKDTWqkfd
 Z/5l0vo4FAajRgkYQCX8co/T1De+9wEUf4EJHSD+fXJjAPpnPhBq6TUpFrgEliWyCbD3fu/GSwy
 irETPwWtatZxiLz2uhnx80SD3iiRhyPiCSfKKfkkxVJY2mo02V/MvbUxhCQ237mSQc8pZg7mpZt
 f+9sskrIa8zeJD2D044VlvVyUHsXw/bEj5P1AWhkYpb0Daxb/v+4m//ZdX/vAtgs7/oatlRxcAu
 a+IdiMcefPX699ufa9jeJWx5OYXqVyRJO1gp1kYH748Dsddl+JBfqFTZzLfwjv0l3bBX81IZXB+
 vZgfWBkof2KKVcDv3L/Qq5a8fZk4DGS5rrbzfAr6MQFmVFQ8MmtdN4Tk72PkzBn6JaNdFIEtowv
 rOJhL0yneXjDp9gMbFpDno5qIjFpqVTQ0p+YX3ap6gjmbq5gNuljSNGvOUy8pPDYv4/QyuZb8be
 PCFHCSEwl6D8KQZHL8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020167



On 01-04-2026 20:26, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 16:37, Lorenzo Pieralisi wrote:
>> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>>
>>>>> +#include <linux/err.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/psci.h>
>>>>> +#include <linux/reboot.h>
>>>>> +#include <linux/reboot-mode.h>
>>>>> +#include <linux/types.h>
>>>>> +
>>>>> +/*
>>>>> + * Predefined reboot-modes are defined as per the values
>>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>>> + */
>>>>> +static struct mode_info psci_resets[] = {
>>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>>
>> These strings match the command userspace issue right ? I think that we
>> should make them match the corresponding PSCI reset types, the list above
>> maps command to reboot_mode values and those can belong to any reboot
>> mode driver to be honest they don't make much sense in a PSCI reboot
>> mode driver only.
>>
>> It is a question for everyone here: would it make sense to make these
>> predefined resets a set of strings, eg:
>>
>> psci-system-reset
>> psci-system-reset2-arch-warm-reset
>>
>> and then vendor resets:
>>
>> psci-system-reset2-vendor-reset
>>
>> at least we know what a string maps to ?
>>
>> We can export a function from the PSCI driver to detect whether PSCI
>> SYSTEM_RESET2 is supported, an equivalent of psci_has_osi_support() for
>> instance that we can call from this driver to detect its presence.
> 
> Sorry I've been out of the loop for this series for a while, but
> can someone refresh me on why we got back to mixing in
> the 'enum reboot_mode' from legacy i386 and arm32 into the new
> interface?
> 
> I don't mind having whichever strings are defined for PSCI present
> in the user interface, but this seems like a mistake to me.
> If at all possible, lets define your own magic constants that
> are not tied to "enum reboot_mode" or the legacy reboot= command
> line argument.

sure. will remove usage of "enum reboot_mode".

thanks,
Shivendra
