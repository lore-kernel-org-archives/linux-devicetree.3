Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D22F4A0C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711043; cv=none; b=DtprJx8XhpYW5DaN87HXZjhcWLeyo6F6Yu3/mTtj2EtVV73gk8g8jvZB/n7mYKA9ENFSlypsUIw0ZFy278h+1iaodWkxHH2dGboJXg3yQyq1RcVUEwXBkuXHOuAVHDMb5ml8ljtjA2rJgV+V48NLzzxXHlZ8qugryVZftkcGfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711043; c=relaxed/simple;
	bh=BTcamW8GZ/hEv32U2vrDgn88rzWxa9uG7P/MYxGEJOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5AeW1T0q6kJ8OdflqYuk8JnnoKRHbBU1vBPcU6SUpSF3fPISSMqSEGrWBesktcMnuf/NoCTRQQMC/xovS0H3Wcu7mzl6cg6J36X2FLLgjROmZXSO/PvBvTfnpUV/4GOhYEA0aAXG3BkLyYVSRh3RAEQ50I27l/LB7c6iVkwSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcAw7rjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADqX+CLm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcAw7rjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADqX+CLm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIE61730029
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=; b=WcAw7rjBzEAhOcrk
	tHuMPqSApmwqRNWRuxLpQkzhOaqq7fAq2x1bLM3scJD+t1zfm53DCzSzrdq5VzWs
	IoSxs9C7mXZx0hjLYOb7OAf3eLTTOtoW31w9DOzm3hHrqjJ6eNfOMrFz+1qrVU2L
	9kwg4wc0SgJAiDBC66Ue88gQJs0a1k9uPw21NH9/BODXwOp3vWBz3oQMTCmDECXP
	6qhcDOJhxVEsJEbHDY0xEr2OAQVrIrsHE9lkTSSW5yy+7dcrlTrkJuuLH+4i++TH
	ZdXTnxs2ZLTuUclffiV0WYlRbuj9hl4TKnX7KoYVlAwfxDKgGftXMntZpEMDkQrj
	vBc+cw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vh9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:30:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso3244266b3a.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711040; x=1783315840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=ADqX+CLmIsqt2lge+Zf/NgXEioh4LGeOEuqugGYRF1cpjzuI2y4Hi7EwIPt4HvLcNs
         YbTCg0rNZVJbf159ja4Cu1Q9LkHvAJ11HQBZ9AYGTj0ocH0lxxlANNqSWc3xqVS3LtFX
         IZPYc/wRXDc3CcygBat2K2qxNMKg+RcWGFMOxwPh1irjOUqEVLzM4Mk0VTErHAqd5fjr
         DkRM5F3NvPipeoViEpuj9glKqEYKaf1UyF4Cvmg3eGcAj04FNspn4cW1Tq2uIHeEfB4U
         OPnSh3rfaeGqYplD8q207Km69TfsYCLf/dYYzWzX7GrfsizrrCU0p4AcHb4HI8YPuL4B
         QKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711040; x=1783315840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iYaZQiVwCPWspFjX5KeDzhs18wLFh8Mq7dB7wCjTXs=;
        b=c0Ahvl2DV+BSXPz2CdRzAWW6REqS7jiT21miNyjQGA3aNPdrOzFneokjo2xd7XlWNu
         qiS734sOvOddqtoX83XvSGfTL0QOKZKING6ub5HpcNy4AlIAHPranJ0f1flq40VK2/3h
         k+qRBj/n5qrziIu/FflrYCAPRqp86v5dP5uibjj6YbTVnVmn6kk97z6W0a2Ve+GrJt+V
         1tOSc+9prL0IF3Xx2XbWbng18JblNrE02N5xgKwsMCY7ylW4DiKxaJ9Ttce+Hfw4S7Gl
         5tL75JEsxA6vof1Hv47yiXTfjWCaz9DfEeCCdQlU/G4xNj0iQfbxRVYe3O5seEbCEJ3F
         kzCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/cc4M10fz6Gx2kqDhSM4Jf3EOTda0RJhWpKgo7lm8AUprnHya7kWbwpMy69p03/0vpFTYCNvh2INH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7sXQCcoRp0iPyAtECrvtaMEdqeAHWqQgNAB/WbyyOFtlZc/m
	5TwSu/2uXJUHffgMtM+4HQXuS2bPGASK7/2a5jrCY/iggA4rXqsDjwuQfu/TTgazISiA6nj3Ap3
	B9hU8YMJSjYDtJiOMkLTKXOF2bTd2gVFAb8yvuwSYqPtij9pT4Wdy1kcsmrq+weM5NNBiz3rI
X-Gm-Gg: AfdE7cnt3I/NZva493aUe7GG4oiELdwx/s8Lf1ruZ2aFsKfMZY46wAXfMtPUPJw9fdV
	lNaz2NoP8bnZFHogpt0JjPc6gu8luHWkjM5FtAiM4nnVEtPq+RN6u+/vt1CuD4TcC+oa4CGuXuK
	CBC7XmPsbBUMSnr2wvi1IDLatSSY4yy+VM6HDLNVuN3rcBMB13fnUDupk6sfqMXI1FMxahEmsHz
	J+Gu+OlqlOznP4tiBIgPa2aYJKNgaoctFqBmZaNDMf9f6/pOrB+1CLJN+AvBOtahxFpZoGat24t
	c1ZmZERQ8hRV5x3FTWMyznmUDEE95l/9wmN9Hi/04JbslbLEO0ZDqBVcoNzWl2mqcbMdn8KTWel
	hnfEB4K/iC2CEbQKOAq4GxHEccEBcY04YD4jm0Ffrp0Y/YuqFnQ==
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313666b3a.37.1782711040399;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr16313645b3a.37.1782711040031;
        Sun, 28 Jun 2026 22:30:40 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847864a5775sm1017254b3a.48.2026.06.28.22.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:30:39 -0700 (PDT)
Message-ID: <03f6c057-2d67-4292-84ab-566565ee4a20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:00:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] arm64: dts: qcom: shikra-cqs-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-7-mohammad.rafi.shaik@oss.qualcomm.com>
 <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <f92e8c9a-1f70-4f94-874b-c247f47c5af5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXzxuffMfjifGf
 CBoM72nWJv0VcOMdD+yoc0SEChFjJIP/G99AKtkxu1lgUpcPz6oHFAVMoehWyo3VsrwJy8+/PDz
 Ck8PSNp5+DTMfLLFMFsM7KvMXANMC62eWvICilYLd5zSxLpTTX0qlZYvI4lDvAPpqXY/rx8vfcg
 T6Thf/HpSqp4JPMkPy/q/mSX4dZDGTiQApN6RGr3ReeccMoMcNK62g1NptFdf+nvRmwE1UYS0G1
 wkNNsLKWHhxPz3RizQdN+JN60kIkmDM7aldoUrKCU6Lo0HWH9kzuFU6OYl/EsiVIuZK+sczjLd8
 hdTCIiJ47PMyOxZSEY8SW/xWeUI7yetmprXATGMhkUJVI+P+4ucmWv/sIfrfPpse4ibRF73C9dh
 iJvTblAykfk9Y9ixRiTqZ3paXIqVn6kEVWcvjzvSHD9zJGt9tV1NRcfnUjJYqtoGJYAFjHrshsk
 f2ZwZ0S9M66MQpwmGrw==
X-Proofpoint-GUID: yO78uyAXxurRjJJWmX8b-KrNmjnoIFO_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXzsdb2vYBhYGL
 DBHcU+kiYmJFIdnvK8rSZF6x4dPVzRCxM3eCdkEpum8Plf4zglFSRQ63cFf6YY/anwQb2rHNL4t
 q2Wkba7cRxt/rbrlTwPF8bicU03QGVU=
X-Proofpoint-ORIG-GUID: yO78uyAXxurRjJJWmX8b-KrNmjnoIFO_
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a420300 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VUSdPHTc8rOmLbK7xEcA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:17 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>>   
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> NAK.
> 
> There is no such compatible. And there will never be.
> 

Sorry about this. I will wait until the compatible gets proper approval 
and is aligned in the driver patchset before posting an update.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof

