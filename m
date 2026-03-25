Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80223C454C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436395; cv=none; b=X5GFiAzothsEPPTUzcKSBAomtx4ommaB7JZfvhHdmcKjTGryfsJocSUEIckYSAv1DSU9ZZigUIN+6n9WUCmZFZDbAGprp47vpS1MarS93caEK1YEZWi5Yl1OfPWQVZH17JuEflTSYavaWF4XV4xVVasydhXICrAHyJQRTtvvm98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436395; c=relaxed/simple;
	bh=MkmE8+ZDOUmHYBEfrZwhG9doqVGA88AKIfvh4C6SG4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNPlSreWyXs0FIYMaArDHatVhTOdTuAOM+rUKxI6JG1gblqK3HWWwj0AMkKRMGded+TpP6H8igS/rOfaPHlugvvlsyPwVT2P7iSYbfR3cLqRSznNAkUHj1yA6D6vRq8AH52b245715+gce1bkxWL4zfG3vf41XyaVhsOj7T7+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwziOe1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcNR3kLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwziOe1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcNR3kLf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PADkLG658578
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=; b=SwziOe1I80qb4Dbj
	eYySJ5C2OU7NV0z6l4Z+3kWsOjP94uLVSX9RUc0DLpYlYUdlkkBpxteEoff1md3q
	swVkr3MuMKgt1iiWkFme2/LW09nxTPxpQQvA/92g1TCVCyiLQpzi5uUC0fRfQmlS
	2ABgZSBHxO/Ki6JrQ4SND1EPcgqmHP5moC5BtgfbEk4DhHwgZP5i0uYfCmXQ72uy
	TpuGsY15P6OGpPGBz8SYJxrZZnyLOdmmRCYyOW8VzKzlw4uftkGd+v/Xam6cLcFL
	qT6cPQzZyrajnapLrlH74h/ygFSbCP0bf9pvj0RMtis6ffCT18OeQ9HNLxS0r4rR
	2GjFRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whdse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:59:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a1ee2a528so3258425a91.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436389; x=1775041189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=;
        b=AcNR3kLfO2BmHWfDQMGStA5hJRcsQsA1vda82Qptec41fTD7Y6wyMZYKGworYLC8hR
         La8xryrJ/9O50hdRG+n9tW/yDPR007mYgWqDnAK/Pmo3wzv+1ZdAhryJ3Sxwzi4gNMEB
         UUFNAV8kvGx9v4BUeFHnJKjm4G7+XYUo4Cml+dI6Sr75Z3ahJ4xJRmJmqzEu0e68vAP6
         4sZOgEzDT4ZHJqeGUG5wsuSN95PeL3oFxAPpipgzMataH9nbOD7GYDu6WDuXzTMGHI2+
         LuzvexogxVGTE99LmqIOaOSKsXZZU2QeCBRBmKZFLIeV+lf1PQHz/Ltg4gEbV1Eahism
         6c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436389; x=1775041189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=;
        b=g3V85LcQr0Y9wUU3B7kGQGhzn7IKoyNPkBxLGZHqqzyoS3M3KMG27npeiyBaYu94In
         LfZro64hKcWGOqfT4e5Lummvh+hb84JOjAF9u0B7nLxUgFdixtKUk23TZi2nVp1KJiZz
         jFjPsrsG9wfCXu84XNJK0o6vTsMZmMZpfA8pemHIF2a7dkNzfrPdkDdcsD4uYmflg9J0
         XVfwD6f2wp6MNK9jUB7OtHrAOfU3mChxAfNZ6qmWmRGWoXjKPOQIAOyZ7gKKd7LAGDP9
         KjYBorHyBU3KDMGb3RXKj7MtG4NNtIfLIB3BU8yPuTWr4kQR+jTWqhugESSmAGGJotB9
         iPZA==
X-Forwarded-Encrypted: i=1; AJvYcCUKkYzwSRg1wxtJvf6eLokFd/HJNRmor6bI4qwkedUEwYi2clNkzZNxkGGaMdL/hd/bE8OTNDHasjWw@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzmGZdGCQywPTXsK628E5mY7Zo37vw30y8gsGeTrSZZLwfTwk
	cdOVLB1A7g9dVKSkboUUpQbkbbrPeYBmi6IMd3R/DlVhimlYz5OMy08QwSgZXV2PM5nk+DU5Wr1
	cSDiGsCpn4uUTzZXJBtLBJKk1awg3t87hcjs8BhFM8jYUr3BNIa8Oi5Sd8l+zjzYb
X-Gm-Gg: ATEYQzyQ5ivk2K+ITNUVzB9kymNIL//i4C/XegHPCNZ8YrIUVaIpWyeNPQqHLsQs0EE
	ukqWSFy80guas2OZHXB/T2OYS1vEhlUwC4vTMdJvo87OxvzB3EG/wIoXXYXdxRTnnpbn215jXCX
	Oa8nZ70kEKjIdTu1zCb90kUpYzsxc78PR9yUqkdKOFVAoPVJCohsITdocdWGKSKyyemD2S4ud75
	axd8l2smhSZwwihY3udK1vBjsL2O+AlyKaHVINy6kvQUK6+Q7w4wfwFNgmhHfeTo3WQAgdPDPIO
	HtplJQFSRqBygAw9U4uyYimaIbwCwEhV/c1M7CWSjfjV0QTLGvxWBJeehz/Md06NKdxc9Or201E
	iAvy0Fy41NqQQgH+KIApmkBMJJfGYR8xkDZiDTrFx+mQ9BBA4FBuZac6IPDW6/oAzcZSVetY0AB
	QWPsulXHfh7Lc=
X-Received: by 2002:a17:90b:4c4f:b0:35b:a2de:852a with SMTP id 98e67ed59e1d1-35c0dbb79eamr1769816a91.0.1774436389485;
        Wed, 25 Mar 2026 03:59:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4f:b0:35b:a2de:852a with SMTP id 98e67ed59e1d1-35c0dbb79eamr1769796a91.0.1774436388985;
        Wed, 25 Mar 2026 03:59:48 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0312ee89sm6905687a91.1.2026.03.25.03.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:59:48 -0700 (PDT)
Message-ID: <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:59:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _lhlxoO9qI3vK4A3oNEgEreI33lFg7QA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NyBTYWx0ZWRfX31BKjPm6eewX
 YV1sF9NikXhtyUwFKXo1l4Puqsfj9R0t/qbk/An5YCLvEV5D4jqj6AQ2Z6wOLolV8UuptomVsqA
 DyZf4qtjwaFt2zFQwB/YViSr5GK2n2pRYcXofJRIErSyp4rpUeuOYMtBmKORTiQFyJ4NXG6Vpug
 tKmhA8KRoI7MTHshoq/735+b5Hv6nWmAVL8i2ISghyZHJU72qsyujMuameMu/skhVqJUaKW7bN7
 h/OBlhyIflUqRG6LXHKE4B1BiWosoRELiMiB+WVpuM+pPeHLxZth+Tsg+GjSACyzj0+JmybTC34
 HI/NTkMGtYlzym6pf+UVCqW5pMiZ/CESw2D0UnxTW4ffyH/TL/Wulm7IgZ7Jrfk7SHuPTZM7qii
 u34Ixhn0SBFkzK0F9KjSOOqMKdzwB8hjQlwKlHJlLYz3MwGEeb4/YLwRjZ6z8sDkBvl4IjqFVX+
 l/1swQcCYzkLet/xgOg==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3c026 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ipo3FooVQioUNJtqZscA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _lhlxoO9qI3vK4A3oNEgEreI33lFg7QA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250077

On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>> +
>>>> +	wcn7850-pmu {
>>>> +		compatible = "qcom,wcn7850-pmu";
>>>> +
>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>> swctrl-gpios?
>>
>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>> the input pin is not used by power sequencing driver.
>> just give it some default configurations here.
> 
> Please don't mix hardware description and the driver. If the pin is
> wired, let's describe it in DT.
> 

give comments about that pin in this dts file ?
or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?

