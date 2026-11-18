Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979449;
	b=gJKqi7gVBqqrRGFG9Z281CoOJ1sfHZv0MBV1USlqHzbxHR8lUXRoTHP+2nZoNZTL33JA
	 XYJErR/Z9gh5g4/WQkSQ/iC62X5kZBL04KZOxDh4haPQET2ANQERq9bEji98fyGTDSpuF
	 n6l/0LiEKPizwcjc72TUGMkwfklCoFnIhU1or+yFGwkK17JzyvexPjSD6ts43ZKvonPbi
	 CVpgV44naL1NlMMCe3H3I+EikKArjE3ut1rhcWUYbKmgNw10qgFhK11MjoQhD4564LLWt
	 vJkjivSKUF+7Prw7EdZByTCc7Ey9U2ODyCL9DPngZaWn2a6hQzxoDJYNTh7ALZcStsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
	b=HGwyRRqeEgDWxijrYQIhfMQ73hQ8QgFkQCzKOBll/Hnf4xaQUELfRzzqLltMEU6+gQAn
	 Qwn0Uye69RAly/hSjYW5tx6rkP0EX/AHLLa6ImxWtVHZ33oUmRPE/AF7wU2zi8V3jvZC+
	 QgTjAzEMUgtfSj7JtGF/aiG2An9150+bZKcBSgm6kyK2/+BC09/kmy6MHxibogSZb6tux
	 vxLsha8mBXZGsIFxnopYjSYIGCimUWDWXxZXDo5miJkCkSJR5svYZNhVBvTRIOxWJ2Ngf
	 /3QtLlYTZ+V/CqXF2MNisKwW8ArCv/chAwesjxgH5lVQcylpIXkm9Yri6+P79q7HalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfZMNmGR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g1amYSOl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CF606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfZMNmGR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g1amYSOl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvRH472529
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=; b=HfZMNmGREAB/rErT
	axxJQfVDCfhmTakEJ3d+IksA1UlvLlM9brjWa8sSmuDlrhfGwRCkpMuSVS/iTSMA
	yzhUXkckG0NB4NBtLZAPze2SJv4C4nSSSaeTS/ttqZQzGcxbOz3zC4T8ySblJVYt
	4hJUVf6JYTlYgq8fWr+5ovBhc4e2VZvOj5yKhmz4zdSx+1dG0bPdY0Z7tl6lPoQ8
	jNvt8PftGfcza+nZhoD65Ci5KUO2val8y3u+nPYg7jJngOSAH2qIRsYwB0oCg2Cc
	5kFm0xm13Dt+21iCYin6P1huS2J8Foyz9zHlojnF3R5d5/I1qT7F6Nx5RvXmPT6n
	bH+wcg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89ae7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so5410015ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979447; x=1795584247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
        b=g1amYSOlC/pB3bQu6Kw4+a+ycZB5YKSnpkIT9PwZnRXPDr+ecD5kX4y1N0VyZJWf3D
         STk9S/giW3u2ztYT/Lk5D00XVatoBfalDtUd4bhSi/DJiSVHLmFqAgwHZfUzHm+8iY9p
         UrqLHWty4EEtYTvEZsi6t6EgYbNFCMUoJwUAkCB9QFjWgO1WrGcCIWjt9OzLQ57ZEpj0
         NDQzpbuz6Mu2xxXpZ0qBoXTXmsa2BAXKVyRhIx18uic8B/ud6FFhpBmS7N8QVfEPTUV2
         QQRALbUsGkgs19MRfbgxoY2TYLkL+taUGt1k8bspIVw5IIAtxcpAlKjvNTn/DV2gU8jV
         AuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979447; x=1795584247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
        b=A8rr0B5QW/adeNZLR8q5aTvJjoJkE9c1o0aqiXBNN+9rFipON4IFNIlMEgNwgIIeyL
         zbCLxpmtLNvW0xUWqHkoTSCWTeGVGLi/tfWdDDCa6VN3LAvKzgTwE9EVT1hxKle7wF/c
         aJiX6GnIqSAPKCrlqW3mxIcwXBcUkzTiW1TP8uC5mu5HZBy4bsfNhs3Q/doxTbR8XfJl
         PHzOmAhofqr/in2yvaOSSJeWfmU8OGZga1mBxYvCnS7VJgOKIdQOs4wNnXljBAHnilkW
         97smxjdSkliCSgAlDjdqQbfB58Iyv2WN0JFMvK8TgKYupNC+RE21nVyqiDiIBETbSjS4
         eVlw==
X-Gm-Message-State: APuU4Z8B7v8X92tHHeuE2rt9UZG3RanxD5Q1WY9Dz98eaa8ixnL1SClN
	QpLRZl5NPe0zBd+FOmiG62wIsZR4ntK5Uq1QcLkNz523HeWzYXkKBbTg9X4zUKb6iZyGvkg9Yd1
	ibjZn/4g+6cpLufzAZOfDigyNixreQJJOsmMDAsOvcBt91YiqjvtNoNWGDd5J7wL1
X-Gm-Gg: AZFdTZf+ISNtQcpmshrQGnFiNbVa7BEG8vLL2pjThzFqbH82CMqQ/Nhxik6GUTPQP/w
	i6AURIt0owTTAKr/mMAtobgYAAzQYyJYV/lBo8k+t/TkDRFEsze1Ve9acEwMudWPZzrqnN+sn7b
	vsqOon2lCWHHOxZMZ8yGdjx+0A/yDcThyItKN8/d6I1CvM7QoCfR/seKoK3l7FMYNZdMbv34cTM
	axhDuwT2+NvnpGrOSnbzsXKxhaX4ONYNwfEKXv7uBBeCcwEVfGmsu8i4QYtDK64p1NXhjpFDr2r
	P61z8geI3A/xZeWGSmUTbQqUCpAx/TpKlG+wWo1CXJAO+d3pJg/okQKVSMWe4wbfODUKcyzUr+q
	CuqxnV0vVYdk41eDxvbU4242+ycWRgMdrVIqtSnp8gu6OTu/6yr+RVeGqtbNLsNcHkzW5j1B4l8
	ZzIbhD60u0hg==
X-Received: by 2002:a17:903:a8f:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2eff75255d2mr16056035ad.39.1794979446626;
        Tue, 17 Nov 2026 21:24:06 -0800 (PST)
X-Received: by 2002:a17:903:a8f:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2eff75255d2mr16055865ad.39.1794979446097;
        Tue, 17 Nov 2026 21:24:06 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115452sm6784635ad.16.2026.11.17.21.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:05 -0800 (PST)
Message-ID: <d98bb7d7-f1fe-4e25-939f-5ca247b32e44@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:02 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-9-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210895@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210895@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D943Lk2_4lgwuFm4xPw-cxpssQ6fdZxb
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3677 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SEhTcAk0GhFVYD1jnHkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX6v/YPxB2Bgu2
 HoksklIDgfMzuyfolxUm1qGeYbyvgsH4ZC6BDCkZphFvOH00+0Pzozrti+dYje/URQrEQOwEgN0
 ETqMTKMILkLYlRstG4zrzhybvRdGPFQstr9IotrvCc4qB/xy7q/iTDg/NRbbzb0IhX8j4rNO4lT
 YyQewgnlI0JEKuClftt+F8Nbzq2lEFhg94i9mt+zQaIh9qCRCnY6RU9Y5UbGqgFHZX0aJnSNTrD
 Yk4zYEYcC4RoBW0NGLyLc6MUjVdXRF7ZW8s2Jd6Ytyw4qUpmlyJaddqpud2KEv1xTVEyhEg8EH1
 9fXyYwk2zZ4g0U86CtSQp8gLIByaCvqpRiLQ69UEVSFUcOkuBsbMgBQFLxlNpt7R9Y9oMAvfdV2
 HpyrLdJhCX77OV4LZZP5ab1CM71edmu55q9W2CS0l2Lx+Eurhx8fUlvPLdjSCzka1it6vVfoDz8
 6+qGj4ZL3iUzrv18QGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX9gxkLZI+3zDr
 EMbBnoK7tDE65L97XX29NPzjU2h9oBJSOaPwFEWKOe1IVdC4FoVoMzVyPXMJmSIq+mMfD/EzoDr
 v/2V2h6gAJzuDTC/1X1zxrIomH1UnbA=
X-Proofpoint-GUID: D943Lk2_4lgwuFm4xPw-cxpssQ6fdZxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 3:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] wifi: ath12k: memory leak of mhi_ctrl->irq in
>    ath12k_mhi_register() [1]
> --
> 
> commit 7e637beba6af9aa8998e9035d9033a359dbfb287
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add unified firmware image support for QCN9575
> 
> This commit adds unified firmware image support for QCN9575 by caching the
> OTP board ID in ath12k_mhi_register() and writing it to a PCIe scratch
> register with readback verification in ath12k_pci_power_up().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
>> index 56e697fbdad52..90b7774ae6e8c 100644
>> --- a/drivers/net/wireless/ath/ath12k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
>> @@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>>   		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
>>   			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>>   				   "failed to read board id\n");
>> +		} else if (ab->hw_params->fw.unified_fw_image) {
>> +			ab_pci->unified_fw_board_id = board_id;
>>   		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
>>   			dualmac = true;
>>   			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> @@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>>   		}
>>   	}
>>   
>> -	if (dualmac) {
>> +	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
>>   		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
>>   			/* use MHI firmware file from firmware-N.bin */
>>   			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does ath12k_mhi_register()
> leak mhi_ctrl->irq [1] if mhi_register_controller() fails?
> 
> ath12k_mhi_get_msi() allocates the irq array with kcalloc() and assigns it
> to mhi_ctrl->irq.  If mhi_register_controller() fails later in
> ath12k_mhi_register(), the free_controller error path only calls
> mhi_free_controller(), which does not free the driver-allocated irq array:
> 
> drivers/net/wireless/ath/ath12k/mhi.c:ath12k_mhi_register() {
> 	...
> 	ret = ath12k_mhi_get_msi(ab_pci);
> 	if (ret) {
> 		ath12k_err(ab, "failed to get msi for mhi\n");
> 		goto free_controller;
> 	}
> 	...
> 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
> 	if (ret) {
> 		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
> 		goto free_controller;
> 	}
> 
> 	return 0;
> 
> free_controller:
> 	mhi_free_controller(mhi_ctrl);
> 	ab_pci->mhi_ctrl = NULL;
> 	return ret;
> }
> 
> Calling kfree(mhi_ctrl->irq) on the error path before mhi_free_controller(),
> matching ath12k_mhi_unregister(), would avoid the leak.
> 
> [1] https://sashiko.dev/#/bug/linux-7faf2081-d31b-4759-a736-dcc2f8a00de5
> 

This is a pre-existing bug. I will fix it in a separate patch.
