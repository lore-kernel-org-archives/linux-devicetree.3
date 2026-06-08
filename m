Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B630DEB5
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897111; cv=none; b=LkoUg5Il7bGhS5WFiRB7QliF+/+n8pi6OZL1Wlqh51jkudpKA7eMHnXjJokvWG7XcWa0c6nNkLSymTpdjgSEu5ewpONJBnRE+7E1+6akSsmJScUvce0GTEgX+Ltc/CnFrJCiHnHQDAPytlbLpfxz4Hpy30i63hCaGzs0I1K+5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897111; c=relaxed/simple;
	bh=BppOv9GzsS/Jn7Nr8+oKKCF7ShPsa0n5I9VSa+nm0lw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NfScpr+sgP0YS2NrOipq1exntVBCGaW13gHPceHHnCoqFmDyZzyriKXYmaK/ObinguthKBa0XKmEARdISAI2IRi2/CNGOK7EYhS9Prtso3Aus7XK/R2IO47c6yqxrjMv3w8LDTI/coTLmZa1k6QSFjmetmhEKY0T5r5lgDve2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgugIydG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pit1Oo+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgugIydG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pit1Oo+r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EBrb1575134
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=; b=XgugIydGheKBpvu2
	ofJnJVr7zPdeE7ys17kDktT4XjStr5uSiH6diK76tDaI+GMKn581gDKl92p6lB52
	IReTCDwhBPnuwc/z6QXLesFXlwdtb4P9uQJFV475cffYhqnX5T/YI/WZBWq+w4zo
	yJwAWkK1najdvB97BrlTBmWuYz+Z0Ze+p678PMdQ9oEFBdFrJ6A0tQ1GKp+Gd0qS
	pHGJO3AMXMACVPNuhu0nvWntKBP47TOsxxjfrutTI2ClOD5RO/prCdS7Msf7iS/2
	V3Zx8dYBcr/RZvRPzgJUJs0Wxj+sjbvu+ZvENd/XQcYVFh5lfsHoH4ihWw0krchl
	Cwlo9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1duxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:38:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc02d28b6so2968329a91.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897109; x=1781501909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=Pit1Oo+ryOtHRk5QnSKiotcP7BoH38VI/V0Dw5G/1Cj+zZ0XY1EWRFueXjX5c01zfO
         8/kKSaVdI1TMKIG3YC+M9h3kT5m/kHZRqyO9+SGjW0DQCnwpblwJ0tvPZP5qA2Idb31b
         /GoJO/9UqECXOPLs3U8DH9XjizXfAQF3I7gfg+1qzog+OESB6IC0NN03gc30Db5pCWNF
         IuB8MlwAxxWcNpb5vfUn6X1A2qdJLL0HZr5mJv6W6HZob++oUDo2b5bWtLrOAK+eaDhH
         CVENhFEagZdpmLxPzd/l8oMeUWydHf+dpvE5NaXezGrlA18Eon/FJIDn/rKdW1ZwFRUV
         JTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897109; x=1781501909;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=PfnpbyLgX+n1J85dVeLEhAUAb8vrMtyxUFa5QRdo0vUeENWYMoUKHuICB7KowRhrZd
         A/+iaShgXtimo6YLEUxEUjTk5piCV3Ur+0ux/Rfgv+oKJQG0e4tWvcgPSC2x4mbrMqvF
         6kCFbMjvuei7dMg70EITV5CFb1dxY3uckPQfQn+HMCbP5UZKnEYbbPWuv4wYpsQBNY0/
         tVHK7PDJIEXsK8f+JpxGYdp8wlSqa+J748WnnAoV/We4OWsLzd6qYwUopI6+hYMDuRE1
         i+GCgN200Q390p2RlJXH377nZ59Q/vEQRjUIldtUG5fl90ZhhXD9+XU8tzq7e+vM5/qp
         efXg==
X-Forwarded-Encrypted: i=1; AFNElJ/K17r8uw2yjx/CzPLlI7Oti+1xTFV0a/acuuzDvPw25WuPRDy+9p4y4mOl+u9wPyh1s04VbXoOY9vb@vger.kernel.org
X-Gm-Message-State: AOJu0YycT8gRecqhWXnAUyHp0rOH5I4c8hKVztEmp4GgPZkS5FLABZ94
	Kis/y1AXJ4z5oXQnD9fWC4WtZ4jXvKsV8XIZLNH30v1AKLfuf/Wi+boIdbNVt+tn3rXL2fpSk+A
	/5wPTIh4yoZyx4xwzb+WQsDGvCs7wnJ4MaMXeNeLjDGFe75WgsvHVc4TTokKtNKYD
X-Gm-Gg: Acq92OFVletGHRfEkEBA+H1E+iLIGKH78DU5fg9IqPvMDFpwyHId8sadlzLeLZae4ys
	ToMk+jTU9P/11Z/BsQob14G1I/yYWRA4JIxjn31pYHksiXouyBc/l9zWXkt6nYgZRjDveH0WzLH
	f5sKhmvMfEej0R58sQRhFUxAoQatFA3RuX3nyMCyJVaifxtHtITaUHgnwoHPG/C6GKNORnSNhRA
	06Q8tIaL0PN3S+i7ZDdewRPlxJKJXj3mugTJgp7bpUBhHYJOwrFj8U6aqLCi8i3k5MO/9tzUdBy
	eKklwwinR7DVYpmy4ha4Lh6zBzt3URUcxOleEIoek9N5OZmQ8xY/R9QIUzXoQDRohMtir+rSZ/b
	/QNYl4xor5jvfEBkXOTq1RBXFqE7K8s4YlAqW6hQS90bbTYlo8nKy4H+WxuBNrRd5
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843871a91.22.1780897109140;
        Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843847a91.22.1780897108663;
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm17548029a91.1.2026.06.07.22.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Message-ID: <4f775a8a-ae97-53e8-f8f1-8b37e200911b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] media: iris: Add context bank hooks for platform
 specific initialization
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
 <20260603143600.87F901F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143600.87F901F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX4MmWdD4qdku4
 44RICVq2eBwyurUBpDNrrFxwu3F2IIkRFS1fAgbCdAElpS9N5ccXcNvak+OUZr2RVvm+z0mf8dw
 8RLS8pgI+LzDtxc/9z8kh4mWPavs/GpOKE+xPRF6ewTYPV3VtTPnFu7WIbSV4KBRA/ztzCBuCaa
 3rCm1Zi+WL23aE4JbPOahbUpb8mUeLf0KK/Gc3fHjYZoCrOAPZLNImP0t78dWIHJCNM/RC358jF
 OuMm70Py5mh4sODfOJ4IR76k4xGmJuDLwmKX6a2BqkBEpElYN/O9PSrTqmfhEad4hPbAtjwAMrW
 Qcf7L3ctx2nbB0yCNSP9wc53Vcs002IqSz7a5QWtRPAZQxH1I9EJBNLDfQgPaloxdtNaD0ey+3b
 Ar0Kv3s2Pbab6QIQWege9q/RZaAxA42e3C2xY+WSHAh7C4Fw+lIrMj6ozmnJJBgpXY4AXeM9qaE
 DbfmpA/Eft6uLVXUHGg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265555 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FEqDrzKljyI82_xno7EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ell0CfrZvpyn5v3eoyX4wYPSqonQHTW8
X-Proofpoint-GUID: ell0CfrZvpyn5v3eoyX4wYPSqonQHTW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049


On 6/3/2026 8:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Concurrent calls to `iris_core_init` can bypass hardware initialization and use uninitialized hardware.
> - [High] Failure during `iris_wait_for_system_response` leaves hardware initialized and memory allocated without cleanup, leading to permanent DMA memory leaks on subsequent opens.
> --
>
> commit 378c8a359d3ed3242ace4eba3b25ac54fcc682b5
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
>     media: iris: Add context bank hooks for platform specific initialization
>
> This patch adds initialization and de-initialization hooks for platform-specific
> context bank devices. These hooks are required for the glymur platform where
> Linux runs as the hypervisor and the driver must manually manage the firmware
> IOMMU mapping.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
>> index 52bf56e517f91..89dbe9bbf6b0a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> [ ... ]
>> @@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
>>  
>>  	core->state = IRIS_CORE_INIT;
> [Severity: High]
> This is a pre-existing issue, but does setting the state to IRIS_CORE_INIT
> here before initialization completes create a concurrency flaw?
>
> If a second thread calls iris_core_init() while the first thread unlocks
> core->lock and waits for the system response:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	mutex_unlock(&core->lock);
>
> 	return iris_wait_for_system_response(core);
> }
>
> The second thread would see core->state == IRIS_CORE_INIT and return 0
> immediately, bypassing hardware initialization and allowing user-space to
> issue ioctls before the hardware finishes booting.
>
> Can this cause firmware crashes or unhandled hardware states?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  
>> -	ret = iris_hfi_queues_init(core);
>> +	ret = iris_init_cb_devs(core);
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_hfi_queues_init(core);
>> +	if (ret)
>> +		goto error_deinit_cb_devs;
>> +
>>  	ret = iris_vpu_power_on(core);
>>  	if (ret)
>>  		goto error_queue_deinit;
> [ ... ]
>> @@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
>>  	iris_vpu_power_off(core);
>>  error_queue_deinit:
>>  	iris_hfi_queues_deinit(core);
>> +error_deinit_cb_devs:
>> +	iris_deinit_cb_devs(core);
>>  error:
>>  	core->state = IRIS_CORE_DEINIT;
> [Severity: High]
> This isn't a bug introduced by this patch, but if
> iris_wait_for_system_response() times out, it sets
> core->state = IRIS_CORE_ERROR and returns -ETIMEDOUT. Since the VFS release
> is never called on an open failure, the queues and the newly added context
> bank devices remain allocated.
>
> When a second open() attempt calls iris_core_init(), it sees the ERROR state
> and jumps to the error label:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	} else if (core->state == IRIS_CORE_ERROR) {
> 		ret = -EINVAL;
> 		goto error;
> 	}
>     ...
> }
>
> At the error label, the state is simply reset to DEINIT without freeing any
> previously allocated resources like queues or cb_devs. A third open() attempt
> will see the DEINIT state and proceed with a full initialization, allocating
> new DMA memory and overwriting the old pointers.
>
> Does this permanently leak the previously allocated resources?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  exit:
