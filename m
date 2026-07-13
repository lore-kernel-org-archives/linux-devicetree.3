Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CF395AF5
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929034; cv=none; b=kiV4SAiaOs2yK7kD5CWc5HQYGCj4ntEbtapXd2fK3Jevw+o+LtV9KicqqfC3deMpcFW73Lse5c22qK4nN4EUAAI/T2TWsP11fi0Q77wJqXqr/kyOWhpi9qWX4eMtEXr6j2m84o/k/tF4mAIH7QDLr7L+/BxZdx30FP+1O/EURlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929034; c=relaxed/simple;
	bh=9WSmn/b6XZ/rKpFHFanb6R/3wcH1iGeQ0twNm4G+Y+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSpq4j0rxQt53OCwdA+J8eK7FuseBORDE8UZNQAOQ5nFzS6OHGBGwHgB+ci8dCV3faLLqD32ABOW2m5rqXSLiWTUvKtUcDxxRV0O+mTT2kWFXrCcsVh7A7W28VfjEE/PQTJ9EC3OxcNuDTNXbIc6zwrj+mFYRhWHVQSHl5YpY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6ObucGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXQVfFpW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6ObucGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXQVfFpW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77TxL810602
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=; b=V6ObucGpHLDK7H8+
	so3ZIEcBmfZtP022vV8IlGOQ6QWtspPWIfpEjWIcG49KAXS0Pe2juE6s4YJFmZcM
	gyJKkY4QKmqwkZVNAj7qecG6xlKRDnHRV+RygsSGDw1ty+s1ABDjizgNiasmxVGy
	kSszLOh/8/CHhSfrqQxDhi8brpSV0mfPPQ1sbx9sOU+I+HbMlrPSUKO0CCvXKOWn
	xe7axzRJ5liAWmtVQi8Hzj05P7LkKAygXiLCkViFkrQ6vGa8+8BGUN7TYytHYfxX
	5/4hwpCeB+zRxndYe19A8PNUR3s3Nnj5ZAoAjV4QJrTqhksQCttvLPejboD0aW/m
	PVVTKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr4wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:50:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso50061521cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929028; x=1784533828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=;
        b=LXQVfFpWd+iV4pXKRmNw3SDLUPc3Io/Puaxk+uw4vcVAVujOxaDUR7Di2qcegqR1gG
         GgUSRPtz/skUc96w04TcHcQelyk9+FwH1kCGBJKER5RS2Sfa3WYxbM9a9qtf+yHCEXIs
         Zat8nRpdqeDpqxmITwxBJyvDMhzKhdLKYRF7SFO2z3Z1R/Wdx71MxRODOmEpfzpfRVfd
         XcJfIuX4h1bbaaUCWXjGBd2XBpUvQJkSCTPz+IKgGT7aH2M8VrJ5YFEFB0pLZPSchcPa
         9J6IRkTWWLoxVvfVupQ9T0RwcUIgu0JS/Xq6NJaVEbVx5flrgnmpn8x2JsgO9GYqhf00
         GAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929028; x=1784533828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4o+jialbkoqpluPCQl34rTfle13EcBIZSENOrUkTUo=;
        b=AssYIEFpDBFTBwYXK3zmmMsNhENXC88BoSZleQNPi1/UqvwK7aWovNa3CjvNiNSZUS
         ZExbnGSyijYeNreToSxC3ueKuA3xgCN9563h/dpm5mRALFbg/kCQXpmthJrZcL+Xyb6X
         MER5GzDXhcIJ8jbbsKuYQ2C/zdJP3C/KCwA9h2f8JDPnekcm5vFwIdi/QksQvCqwC1C2
         T7cEhV7S0Z4wF+NDm+ShpoYy8zezKaBHjEJIFJDB7r4BmCIz3l6zHxrfModuj65kjywr
         gz+zxUx/jXSj9qdsjvRajm6N6LfXdOQN89I2+M5HLBTzVEGbrOwOjke2i6W5aITu580V
         Lnpw==
X-Forwarded-Encrypted: i=1; AHgh+RqZ/MS2wTUqz6Hc1U/nnKIi9NnF7k0PicsHWdZgz8vxzZty98MmcRNAFidM9M3E0VQ/5LixAjg9YXQV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IXLRloH7UeG9Mw+xFEvWgNqb+8NKRS8JlCrjFAWNiyHtnYNh
	Jr3c/qgKAJBK3HLlhQ780he88GeFAqM5mz0+SGtCwydPcDRPwt/a7n81SD0tC+YxpKL/rnJsDhp
	cbDcSeO0QSoKCSntPlKAdC5lIjUDAQLGb1ozUpQYIapvRYsFWOOcfr/lCI/fVs2b2
X-Gm-Gg: AfdE7cmjdMhS6z7QSnfvgZ95iUajAVIPgzwMHhRw+MFIzK1gT/JrrCENt0M+coGbroM
	5GdgTf7yyVaoBdVK+yPqLK8B5J2pU9J3NxosjxCq6fy3CXjMA5W7t0CoHNsULTp7v2hmwgsYlM1
	5s4EaUbORy5tAkaehEipxDsZsWrqxYzWkDPLPzW6dOh9IQOR1kQscr578JY36GzV8zt33h/RG9P
	1WCSju+Ex2xxNSW/ovi+RPdUQf5GLjEMPVinlUBorJziPbgJac1bWox+YP2sCYdknJufe74i6la
	mNpHZKbGoybzukXI08jskMAurRBtNWLTLLfj3KPEX2zAVWF0gBgZqzNfF9fB/fv1EGSagd+cah7
	VQkv0Jm7gJ8doRkmbJE8stKpzj3MS+LKHvNqShx1M0Wo=
X-Received: by 2002:a05:622a:5592:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51cbf381941mr79733661cf.88.1783929028126;
        Mon, 13 Jul 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51cbf381941mr79733471cf.88.1783929027713;
        Mon, 13 Jul 2026 00:50:27 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm853021066b.29.2026.07.13.00.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:50:26 -0700 (PDT)
Message-ID: <d25a574d-35fc-4a68-85bf-ae1aaccc2154@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:50:25 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
 <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a5498c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jsUs_A-8PPVw6gTEMXwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GA8tTCKggj7JvlC2ggunz4Gw726XXTvn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX3t2vbv0xxBAi
 gL5YOOneHhEIvfTq/Jf5qqLHYOYrRbcaiAoGLcNrRENPpegk1zjYv6S2boJFVlLM3KzwHpu9ZlL
 6AmEQ3Z3eSTtPyPAnRa2QerMLSg0VIk=
X-Proofpoint-GUID: GA8tTCKggj7JvlC2ggunz4Gw726XXTvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX/aCSEUBuzm2a
 Mnb9NrQ7Icum9kVRsbPb05Uokdvta1ycx/NY6n3SegRXdHhEEj9CLNiVTeloPuxvvtd+0pbATrp
 Zf60ssTdxvhit1fkyMxdi5fxQH0Fy6fuMkix/sQxh0bw5ODF19tIw3PZL4Nrx4VOdwlSU3JBa+F
 AMYh6B0NpJT6S3+JLuuom9pnueXlxY5f5rx2U4HscVJMGccI/Nun/YYr0vxCRbZgU9YeTLoMZtp
 qMdwfNwno7vRd3zREdfVV1HFxKO/k6gQtStZeWwkm54fFjg9jhe/5lvVbFKL98UKbzNjUILRnIY
 HBfepWzJEztOIyMnuYZ4vJHRbpSVumhLpPEG4QrD+gftOCYI8YbLAr9fNFtNDxTlgOl5NQJ4OC7
 VVj+vXYZtOWaFc5XsSPUmyRyGP9dqn1F6aE2h29rFSGvv7H6QjwomsdPsIMtojW7b34kIz4Lh4X
 7dznRAoZ3h5PzNQ3E2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080

On 6/13/2026 9:43 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 10:44:17PM +0300, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> Initial support in this series targets SM8250, QCM6490, and SM8550
>> class platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/Kconfig           |    1 +
>>   drivers/media/platform/qcom/Makefile          |    1 +
>>   drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>>   16 files changed, 4848 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
>>
>> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
>> index 4f4d3a68e6e5..f33d53a754a0 100644
>> --- a/drivers/media/platform/qcom/Kconfig
>> +++ b/drivers/media/platform/qcom/Kconfig
>> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>>   source "drivers/media/platform/qcom/camss/Kconfig"
>>   source "drivers/media/platform/qcom/iris/Kconfig"
>>   source "drivers/media/platform/qcom/venus/Kconfig"
>> +source "drivers/media/platform/qcom/jpeg/Kconfig"
>> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
>> index ea2221a202c0..30c94949e9de 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -2,3 +2,4 @@
>>   obj-y += camss/
>>   obj-y += iris/
>>   obj-y += venus/
>> +obj-y += jpeg/
> 
> Same comments.
> 
> It seems you ignored entire v1 review and just ask us to do the same
> work twice.
> 
> NAK, please address review you received.
> 
> Best regards,
> Krzysztof
> 
Acknowledged. v5 addresses all driver comments from Frank Li:
- __maybe_unused removed
- RUNTIME_PM_OPS macro used
- devm_mutex_init() with return value check
- platform_set_drvdata() moved earlier
- pm_ptr() used

Additional items addressed in v5: mod_devicetable.h removed,
defs.h cleaned up, usage examples removed from commit message.

Best regards,
Atanas
