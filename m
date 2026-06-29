Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43E1B86C7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707774; cv=none; b=OAjXkotiRUiEH7V/yLntmpa1GPJ7Pae6HmT1aZN0ma7sYvEOJkmP4OmsfrGxSw9eB8axukCHdg4WJQMjMdMKvqfb0Czy2Mqhy3b9a1BtkD58jWga9CciGHcYTLQ02y5TBRdB1p/TaZiyVzMKK51BObxBpJzy+/mxWmBWQFkC8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707774; c=relaxed/simple;
	bh=1vWqKd3eNE3bm0tTg9hwNonUHgCRyR2vof7sgLP4Eas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPC5Xp6frhi7IUADD0bgdKS+HVRlLDufJ5l1gQgpn/PPiRwwbSL0mQbfQizyg2LMQnxeYzBS/rqmx7N80EH0f2Rk/3tkoP+PsiT76luSkNk8obo9DFY34be2cX3+p1rcfrAv6829eNd/WXdSo1+jUe9ijiD53cirTZFOG3YD32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdX/GXzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb0hVFuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdX/GXzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb0hVFuw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIml1780948
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=; b=AdX/GXzFyeCNY7t0
	uHxOsSQWp8looAJYrwkon2GPs8JQzGe/qGMaUucy6BKaXsSarjEUkxfMrtstRquF
	0k2XZ5GqVfPm07CpYTRDrBbTyYZR1eOcqdTcNA+HGTaj431LpYSkTBElOezQ1IYX
	+YvXKfKhWtn5QInJDDave3YUBllbry6iycIKDR5O4khKraSZlPKhMLr8oOx6yU0t
	xSbQr37Ko6u0dQG1jajNAVYwcpNCOLuBkI0VR1eup1l1BaWprAtz5vZjHWmTvZgX
	ApAQpnqQxK0GX9EnIvG1UYVcwf0ZWJsl9XobZmxtmyoTV1VQM20OwWhHlkdwPWXw
	ZmeKow==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u74h60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:36:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137fc6f8e9fso4926873c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707771; x=1783312571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=;
        b=Tb0hVFuwNsYGGu3Y7xV4l5YM4U3holfnuPRbeYxu5//Mc2QhBgo5S+mT2JNQiq8RHW
         157Zb00VwG3pPKBGD1zdKmYNQF8eJw2K7uMd4PC/b9CoECI4NAB+YxX1/mFfes3yGd/U
         j17khVLiitO2lCDRzSWK6NHXw5q5b6Mi+eBsxAddLaSALcWbt6cVkNo1Bd8uIYPAaT4l
         lCsSErTRWOrNZz8c01nA/Jv2wzBnYFB8LCWjnn2x0Z2xDktKCALpedmJwEL+kjU98VHe
         C47deP6UHlix5dfw073f3uMmq9MZvdYAGCTUG8Y5HjoL7T5e1zu4KOwp/E680mMcN4Eq
         pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707771; x=1783312571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=;
        b=Q5JquwfxZDLgWXHXKoJqqZLotMen0C3iBrtXgsLID2hCn3K10/PWcPFro+Eb7WgFOs
         ye2Oe4orqgp7hWbUjYBqfwnVlQ284pJToNppg/bj8tA+vDr5qomgaYMAI17mltDhqWH3
         bZmmSlxPbc4OFFJmdWcej4AnXjLfgmLgrLizEUARyUOlUNJVPbNO13ysCT5VLG1havlL
         rYJNpOEpjvytFzLB3BuxkDHTsvrVrhXfS34UngK5W12dHRCVYSiK89/qD+Ao5XkM4KnO
         aXcyoe4HhHpdI0jJiGEk6sN9u2MoE+Sx9CzbeI/I07K87btAQqLFPwThYv1EAp+W4Tor
         /qEA==
X-Forwarded-Encrypted: i=1; AFNElJ9iigNR6v+HWEpeSMhc8MTz6PikCPcB0HHedp1+AISXaMUAPOAJrBCMSJR9eZNBEsleyXZPafgxdpek@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQ3KLQBIBnAsoub7/EV60IGs69Pkgw5WiyNCFsjJ8tbrANy/r
	LV+WJCrptC1nIM0WhPX0SKqfNV3IWnA8YKYFTMUFtzI6bdesyW2CAo2EssJpQj0fOvFtMBXXlNA
	ya42XsnX9SAis+VbnfqVsYxybvrVYbdFi8rRc2ZYbqqi/VDnDRC1GluWfIJ7nEJq6l5NBjr1e
X-Gm-Gg: AfdE7cmgsA79YArureF9z8kEzAgWiOmlTa27Q64KdFE5SvXSWorcpxlyacxtJdQZ+re
	qtXNFIFZrajnnmAnZwrmH9aU33mjIhVstIoiBXXbpyQLgBH7d2lRnj6BA99/Y0w60UrQ7y4n/UK
	Yvov4DcN/XpC9tSVtnXvfYcaKAsxs97jDEHQ/5t6i6qTQZsGOq/SfSexxf8VMiN22etuR5XdZEZ
	1q/x0HZSyf37uIpzBNeiIW8OsXcIex6XvMLBkZH395RXnD55DK6Pukyyww/KLbwpRdMr1h4UTa1
	wXCBcScBIyT/GB8GC9TtDp1rsyqlv9QhVOVBV0m+4HGqBB0kw3dqqQSeMSwT/5DKVkfUHxhyyBz
	XC3ixNu0g4GmuLmbXeLAfuVtiDqA2DRXep+rVbb2Jjy30cCsT6g==
X-Received: by 2002:a05:7022:3d09:b0:138:1130:5fd3 with SMTP id a92af1059eb24-139dba2e948mr11141260c88.10.1782707770797;
        Sun, 28 Jun 2026 21:36:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3d09:b0:138:1130:5fd3 with SMTP id a92af1059eb24-139dba2e948mr11141241c88.10.1782707770268;
        Sun, 28 Jun 2026 21:36:10 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm51499458c88.12.2026.06.28.21.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:36:09 -0700 (PDT)
Message-ID: <91ce4536-b2c9-4ad1-8ac4-d7abad76ac3f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:06:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register
 layout
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX26l56XwEr8/B
 f1ogQ/RfDL7gftVEsVa+jF0r8hR6LQmf+9t0gYmyAXGSpyK8tw+H0kmgyuN2wrtdkTsZqB2De5y
 ydWi+eRPcbYVWvCyI1qONBmveu4L738=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a41f63b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=khzunKVQOklLbZjlMdUA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: q2F0GOPQQ0mnGJvKSWc-ROmzJr2fxF9o
X-Proofpoint-ORIG-GUID: q2F0GOPQQ0mnGJvKSWc-ROmzJr2fxF9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX+rv+auITOHP4
 glc/BzBDaQJnZdGd2vlNoXDF9apsd4zbVVpdE+Li0DL7Bmnme+/eqlqgM35VnkvG+HGH3hW61XR
 6g4pKtVxBhbosNqPb86D7wslu2wZ+SuEkO083DUaBZirqdoZJFjGb5TZTJGk0k2zpbLjUacjReU
 mvzDjAvn354iYUknRDpdNHIjZFcMDhqQTiF6q+o+ziN4vjQ0bw098jOeo5ZGOdTRpsZ3jFBLxO5
 PLJRw63/fa7pluLoGZZvGolwZDkciDNI78AUx5/lGkbIf2OmxE6sdlTBqyH+TcHytMAaWqkP0pe
 YjV5iJFxm9/oGtnABCAcMUsww9Wkkdc5AdGr7anCkRhGipp70tikF+huT/ezhGDp0C7FnmrSXL3
 Ss7aXMSu6Spdl8AQ33Tghow0bn/DVyJhZvXED0/4n/p5g/w8GVJ96Cy/+7MY/aekmJ4JS9VZugf
 nN+FTFHaixOnZKDzk0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290036



On 6/9/2026 1:47 PM, Konrad Dybcio wrote:
> On 6/8/26 7:53 PM, Mohammad Rafi Shaik wrote:
>> This series adds support for execution environment (EE) aware register
>> layouts in the Qualcomm SoundWire master controller driver.
>>
>> On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
>> status registers in EE-specific windows separated by a stride of 0x1000.
>> Typically, the driver assumes EE1, but platforms like Shikra have the
>> controller routed on EE0.
> 
> Do these EEs have any names associated with them, that would help
> explain why the change is needed?
> 

will add more description what this EE value and why we need this.

Thanks,
Rafi.

> Konrad

