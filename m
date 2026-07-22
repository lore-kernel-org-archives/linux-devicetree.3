Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDF2F693B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727221; cv=none; b=rpdy3aGBderKtFzFxxHZLi4uP+f0adEV45NsRwFM1WuZgyM57EEeReWFiPvtkHXq+5hgpYyJBR2fwZT/DoRGFVYKqmi/BlXUsUxMHRojGoM5Uf+KdVG7lEendgC5EmJnem40qKOvJdFFUmlUe8vOk6QZguAcsWgN47leSvrLV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727221; c=relaxed/simple;
	bh=IK0nPNyVliHInYc5llgRFImUtg/oBw1zId3SZsnZemc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nu3W2LX+1Atkd5r+SQHiOVeHUcYfCd0r+b4BYnHEYjWuiBcV6bdEJ52rWsxkZcZB2iXtRskU2W11nPYm2vQo42nEeKQwbZQQlPoMmiwqdq5/lJAfCle77Wn0R8gL2jYamJVWeVrNEgDQ48X4YJOi2qQE4ElARec4yY4yb7Wb/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6jGh0aC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWsgZGVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6jGh0aC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWsgZGVj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWTBY1155334
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=; b=p6jGh0aCk4giX1im
	UEUXR3cYR9ostzr0WwPUNMeTC2ZStLqADyNqeLXAuWslFmvcLOCRSbI9C9LAtlbn
	2yD9aSRJfArOChaUI0IOO7kuNkzsxci+L1TT+skYRM6oL1FSGpu7wbGV7U0ynamm
	LtR5jO8ABsmqGhPQJ/4S41otNC6IQHC1eUULxg/YCMtQP9j6Q/AnfxYLPO8Q2h9/
	In/CeWZyFGFW985RtvW3qda/Z6N7MHZSP8XnL3n/dYc23XSc7ElaTzSPgfsdMSA4
	MaR4E2/xjjno6CV85K5uXYCx/Szg5/ql4EjAD5XTDM0NyPYKfFFmUDAxbSu93wg9
	Dn7PbQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1n3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:33:39 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a31c08023cso6523527eaf.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727219; x=1785332019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=PWsgZGVjXDBIoAGsu2FZdGs866C/Y1ixLygtb7ggADaafImueHUzIX5QAJ1cVE44uS
         dFm7KibElWcX2iJ8mJxWkX3dQ+Ags8MP5nKKov6m+kPzW6UpBJFbBnnQsdlW+e62IOnl
         NibaUXfPGXdN+KYKprcX+1uTWjlVkNHWT+Dv1SDwszVOaUuxxHHvTlisiNfN/JLDLa5E
         j4Vp/jB6nnx12jcpYXld9PtstHdNDlg1+CGZtgshQ2ysbzMutOpRBd/wJPm9R796KLAN
         8VdKnXsS1zAXuSJUAAjOemHD4KxyrepjgOF57fLVG3gdZIciHW+XFkEkBBb4m6GgyDs6
         nzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727219; x=1785332019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss0O6hRBUHxNH6IxnPNV86R5Z0G3U/HPz/CmgoZNFtI=;
        b=me27CsOejKmmw96kuEnYM1HQYRuerAzCXU0+7odi1rDuA5IfmhlL09lpTk4VzBOaHC
         Xsz/NmEf79vU5aMNkcFrVFhXv0dbMgXHTTslY78L5SIt6imrHKUUFFySWTgSwal/TOGK
         fYzD6B6c24mzT2KS8+jTCLkO5Q/KNHufSJLbLlLYH5/InWyrvRB06g96ePZiRdUzIf/L
         tBDNq98pZQSjybkLs+4l020NNMJcPLwVmPW3PzDKq+65zT1QnSIzm8gFuxR5ylsKwvsA
         UUcF15ds2vztRFtvNvD/b9XLETeESM/VL4G59wrSLR8gzLdb7RcTdzluUkgNnRlHbfcW
         fKKg==
X-Forwarded-Encrypted: i=1; AHgh+RrVN9xS5oGW1pdgAa2kAIBABGhjdIeyjLjhSM1sIZBPSyKK4NI1YWefUSqmM0NBoo1ra6Wo6qp1LPHd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7Ww6js7VnE0E9ENwBz0Al/DR2Kjx28+o0O94lfO4z4aC3PI8
	LUwvjiU/RJTLP1X36y71H2ktEYBjnQRqeTXE72RbticudN610MZlEv15EyP27andVASq5Yut4fi
	1dfsGb4Tqv7zsjR9jiVRMfuivHfvmeYm+3M4udd5Gj0qV6EW5M9ENxhIYQJFC+61R
X-Gm-Gg: AR+sD12Nvi4JhFzdDtMj6BLQT99qFC5m03AXK/sq4lCPxobPj45MPPBQHpWdT/S+ZsN
	GAuFJQtU8KM0SSSHNNtYqSINIb8HuBMKpbudJJsaENkCLmmHPJDubzhkIMZrZgQtH8hAnfP1kSZ
	4mPZqKhNanufeiHptfqgg7hBsX4hladSKbYLAi3N9bY4p4eqAtcDNFoSTo2cVQB1oWcJEYptCJ0
	wMpTPP+c8EXqo3A6shHgPitsTwpEy5RUjIEaITmntjIt/FOL5C47v29U4QjcuQvHC7C1melvRsw
	X/XYlCm4AvcSZPMv7VpCJnBkCRClP6nHSPoyc85Z1TXfjVB6JXAqU7rLPaftbCuvQbENGV+eApS
	vZkH985Ktc6b05Rxr035ywWZrTS/63CDfZNs=
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653247eaf.35.1784727219000;
        Wed, 22 Jul 2026 06:33:39 -0700 (PDT)
X-Received: by 2002:a05:6820:16a0:b0:6a3:e0fe:c4ef with SMTP id 006d021491bc7-6aa4bbd56c9mr1653117eaf.35.1784727215447;
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa79a09cbesm1395149eaf.12.2026.07.22.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:33:35 -0700 (PDT)
Message-ID: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:03:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wgPaH7KLHv7SF-ITFUl69MdvEP1n6atJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX2Z2yPpz1+w1r
 9Fb6zXabmCRkj7JiofDAK7QFJdRN3p1/qzUvCHfHuqedd8wbeMpu5jiv/v4IjY+FW8fpxTVJPvu
 oGnC/oaPN0IS1NKr7ep838uM200cUcn4nwf75KNJFNcyNP79D81or7dr/80vQ1FeuM4tD0L35Ch
 awX7Pcy/4lQM5HVuys4yNNskIp5p4/gBk//WzODq2XuP1ydPIRRIUet6WUO/iMimYb73PKTnm3b
 RJJ/p0AUWkji0Eeo4ZlhuVDOY59I+X0oXdLwArxJ2JsoY6rGLxzmogQn44mBtSk0WTiK9LSq0hs
 svHc+/orc3NwTJ0muNMetYzTtv0htqgSApSku5wRpolsyCCeU9OZ/7lZReyoDsKOsRrE+ELOOah
 9+RIWmmGxz5QvlPhbKMRmSoorzDjZ79SRH+AY2/qMUUYcnSbyORoBAf0bdl+P2UEDbw1DqbXb/o
 IYRqkH9pDfw5ynDKdGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX28UEpiwmEEBL
 MtzqCpyA8sOk8AF2OFP2lAl2tfAPnJXHmYkt0iNuSct1c24Amf7xEk6aSO0B88ZlqezGfhuk1WL
 jLptdTYa1xx62Itd7BoWtfeUJLslloo=
X-Proofpoint-GUID: wgPaH7KLHv7SF-ITFUl69MdvEP1n6atJ
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c6b3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Fs1vR9WLwBkDfa--pcoA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132



On 22-07-2026 15:20, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
>>   5 files changed, 46 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
>> index d260715fccf6..ac69b5f39fb4 100644
>> --- a/drivers/power/reset/nvmem-reboot-mode.c
>> +++ b/drivers/power/reset/nvmem-reboot-mode.c
>> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>>   	struct nvmem_cell *cell;
>>   };
>>   
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>>   {
>>   	struct nvmem_reboot_mode *nvmem_rbm;
>>   	size_t buf_len;
>>   	void *buf;
>>   	int ret;
>>   
>> +	if (count != 1)
>> +		return -EINVAL;
>> +
> 
> The count can be different per mode. Because `struct mode_info` has
> `count` member. This single `count` check across all modes may not be
> useful.
> 
> Either drivers need to use count passed to them or drivers needs to
> receive `struct mode_info` in the callabck.

will add a once more write function in reboot-mode to handle the 
multi-count support. If a driver implements it, the multi-count write 
function will be called. And no change in existing drivers.
Does that address this concern?

thanks,
Shivendra
