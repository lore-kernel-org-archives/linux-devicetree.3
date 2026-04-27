Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0153BED1E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294013; cv=none; b=GkQLlTSED2eZDmrP1D1BIxirmvpA9wNvWnsGDqjBmiwxEWFi+5thid4e4tOeESkBcZ0X4we7BtsQfrXb7ztYS4+rvaQTUhSjTuTkHjUWWOnqKAj59NX1tEBzo8muj/vIPNDezaK7fS0srYWX9cnOei+CRRbz0Pdwos8CVHR8GJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294013; c=relaxed/simple;
	bh=0M5kAzVXT4cXQhL9fA119smW1UaNkZkaabBAO8U7pt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSqNktOu/sqxEudPDZOSYEv7NIjvGoRnDOgQ8lab5WIOyDUsYuViZ9AHM9uRQ7MRsX0T32r7F0Ud3bP2+GTQl7Yesf2/bAmZri8PJGhWdXbipP38qchZ+F9/4rOecwMI21HXeJq7vvUN3k+WmMeO7D0n743kMJ1kq4Mx69RMU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk+T+Hb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0KBxGkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk+T+Hb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0KBxGkI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEiu665693
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=; b=lk+T+Hb6rEVklkMS
	5QM9TFj3g/cV9HlUFQKTmOSqsV+7ynVbe6K0gVxmCD74P8BTkPa8Y8P+HybWzprE
	HeBj/HTKuMKP5GTyQ9C4GejKsDID8HIgrmbZOIbH2hIU/i3vZS98hJzf+OWz7/c8
	J0oMPDMPevJHNIJt88w8mGpDhdpq7Pb1eifnRTtZuQsKPmulgp9SpFZEQKdFaY2t
	O4/P2mw197r/+gt843cToM2vAkk62vkeaeoKCyJfWTbdMJ0ZbAABl6jsm+osqSWW
	5taV1r+c0TEEeebGlq2NXfhbhrr0wHthfIZ/SRbrz6qMzaUvvp8w0pbf6mJhx2Bc
	z0E7rA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1d40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56eec094291so643302e0c.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294010; x=1777898810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=;
        b=R0KBxGkIFMq0UXu16KP6SzxngYhl0NZ6e50bEZvxN4uRZFQ2Fqem2icHaD3GUjB1FX
         FbDSyf+78ab3/SuHrU42IkFuDJhkA21tetakEefTmJYrHPVYkm0OLHNWuTA2so2WvWyl
         IebmEHpnRIGBUi5EInnJqKb1z12pMjloNR1dbvmSsz/y5NKliEeHtOJ6kGyK0ZzjKkw3
         jSJfFIlh9awKICupx31l2C0xIGSltWmBZKWIuRmWjtenDtU8FcaQvoJcNHK8QkD3GRCb
         mRuF1gvndKkHsElCL8vXlpBDX4MbIe2lFSF6UUTWw6akIOOZw/M9hku1MGUbERSU7x0P
         uZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294010; x=1777898810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9R/1sqwPTPa7QpYLCHOouFuYbh+Qk6HeP8hwDT56f0=;
        b=j0UkYNVVSCDr7qRgg+n5N2DkZeuHNnvyjVaD93FhRXV4r9zIbg/2O5WTCp77x+3CNX
         vQB4oKowFn/DWysUmrZtziuIpOgwpfHc73k9NnPtQObQJHf4AhFO/3Cu5iB4LsvYe/za
         SeHXTF2SaP4IB3UgbZWRpjQLwulaErNGzb3/ykjj9G5CFjkR4l/xVKggVMIXa6GcBwxo
         y0CjwGbFO8SwuQ62PcsOCIDvmXIT6/IC+IJvFxrIGmoM295fh0Yx6Zn1Q/KbvWLS6Plo
         89wi9Fe7NPW55TLrT6LSXGPtHFt5Hl+e/023hztThORXfLOQTfXb9QAxFKCc/S+DxDHV
         89NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VGT2t81cbREj/apz1U+gYHa4bcA99oUuD7U7ay6GVy6NkFGkGXMCa0qaTwjGGAOzmFladJwOtXSmK@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7Dg8P2YTNJeXMkOdLlabRGZgH5oVsACNjGreuCsCBzJHBkNC
	ooXMFnswXcl0ybNIpXzZEbFwClDI978xImq4bKqDCOdukSZdRYwr/FXrhCLrDtkXP40Dhne8I5b
	PfII8QwfBHxfK7W9LT/nfvqehkOqRxJwDNnlo9djU7LO34q2slYNV3FmarY4szCJWNZwSSURh
X-Gm-Gg: AeBDievm5GSOag/cQGz25BObu3U5ScXoHFaA8N8UX2zz9q08rhasLuDlLUoJywV3z2X
	trtXBNoFI8x88YUAqqx/Xzr0ZdD5dhJdNI6/h1eoYnfvx3duQsKv7SjEmT3bV0+KgAXDrCNeT+7
	Cc8KZr6ElRq0GiPj4Guc+e8RGRXbIpDtygZ0Efuvv0PsR68lp3qZu9hpbH3yqeK5kMWWOelHlOj
	v1BfH+Meh6n40J/bA8rLV4yqF6lG2ObHhjHfADQ0fBjj6ZKywpsSJZs8nl0Z9KC6ZcbjE82nx1t
	UIwHVTtfw6zRHfOQEUaDLy4EILEcxz1bN6si8kaOTFiGEVxRzPrbUlaUm5HrWnRIjHKpO1UuRs0
	36VMu3zWcAqw9AYC+UnuGPz2cZQS9q2fUOx1B0KNR0K6cXwQrA84I7fwR0KdE2OTMbOVyQeVnoU
	Ecni8lWPfKBp8eXQ==
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8096963137.2.1777294010067;
        Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:602:7589:6536 with SMTP id ada2fe7eead31-616f4c5b722mr8096955137.2.1777294009600;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm1115321166b.42.2026.04.27.05.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
Message-ID: <b9f69293-1071-498a-8f8b-3abe323d66cf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:46:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-arduino-imola: Drop modem
 support
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
 <20260427112833.1160332-2-sumit.garg@kernel.org>
 <c037803d-d33f-47a6-8db2-736c7b49092b@oss.qualcomm.com>
 <ae9OfsQI6FUvQX_o@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ae9OfsQI6FUvQX_o@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX2KUNCAQ1rPuW
 b9ZMXaWby8QsKAIfrdBIx8eFG/y7xTXLH6CPOcVWsDg+45t5O4w7mEK1MENFoy3I0SnT7Dr+4oH
 PZgBPfDrvO0rId0zTO7TGPrF9ehTy8aTbX6amvdR/VrGBDoEDkIpwPFImfNrLnk+0/xNPi2H+87
 FZH2W9ZkQ4w+9ZrdV/VlEaLVfIcMpVj4zJ1Z6HuK0X9C79iu5gd1s45XsgeMbWZV9x7yQCMaQs0
 4K0Qqa1q10a83W1EGWjdjb6wHBddbYh2uXowaiqu1A41WDd1igEFIVhUUWbVNH8hQmwXX4SsML2
 ZWQBt4VtlkqEwQ1FA2BgK0ImD7aNPOQrHWono0u1kwhIkHGnUn2PRJZbn/Z3G2AO6CDruTP4uQH
 FyazHN8ROzj9qpYRUfSFs5YioBVmi5kc7uViTtDF/kqbx2YkGEPK0PnzSIncSAghjcGjNCRF0qs
 bk7eXLcNstn/jyAfCJw==
X-Proofpoint-GUID: WbiJosV44bozLicO0phI14bbNlYYxRoT
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef5abb cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3UFkKYCo_pPH7Sg1ncQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: WbiJosV44bozLicO0phI14bbNlYYxRoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135

On 4/27/26 1:54 PM, Sumit Garg wrote:
> On Mon, Apr 27, 2026 at 01:43:08PM +0200, Konrad Dybcio wrote:
>> On 4/27/26 1:28 PM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> QRB2210 has modem fused out as it's only available on the mobile variant
>>> which is QCM2290. So let's disable modem support from Arduino Imola/UNO-Q.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>
>> On previous APQ-y SoCs, the remoteproc was still physically present and
>> served various functions (among others, GPS, IIRC). Is that not the case?
> 
> That isn't the case as we hear that modem is fused out on QRB2210. Even
> the marketing page here [1] suggests to use add-on chip WGR7640 for
> GNSS.
> 
> [1] https://www.qualcomm.com/internet-of-things/products/q2-series/qrb2210

I would like you to provide a better source than a marketing page which
does not necessarily use 'modem' in the context of 'mpss remoteproc'

The easiest test to conduct is to boot up the device and run qrtr-lookup
with and without the rproc.

Or actually, if the rproc succeeds to start up, that's proof enough that
it's actually there..

Konrad
