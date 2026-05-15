Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71752B9A4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854974; cv=none; b=dIUwQnXgT0kb1UFOfgIUqBMiAoxB7nK4CbFkKgIxksSLnO210Z8Y9qUJSF6CsINaFn83X8lKmi0qvdliMlNdzuC3SCByGuRrOelBL26Ct9OoihLU+FObiwoRf50W2lXrevUK1IpBy8zLFL1gbqzNpEEtgWiAwi4dSi6VZQ1WCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854974; c=relaxed/simple;
	bh=vg7rsFdmrkTWiZNtp5qMnR7zjL7mLG8s1Cu9e/+xksg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFujWOwUgXmgupmy22g7Okq/L2isokPxE6vuQyEtfgyH9okuCDpwfJVONtD6tA/ePaXDruCr+9X22cMMsGm3lOUUX5JscJa/BqOaog8lEOWu8Uc7fZG+67EV+A35J0rfxSKL+NQa1sTwmi0OlCrPrJ+w6+7rrk6j0N5vbX4qE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+HNLWx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H92ewZ4z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+HNLWx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H92ewZ4z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBRDof3200288
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=; b=g+HNLWx7lFuEr2lr
	i2DRUJKq2O5DpXHZkJ6ciinfLWRpDGCRe8YzfUjc9VF8Ln5EPlpXo16OcVHbAAfH
	KjR/iXDEVPVK2VY7s/QYODuMwJocXFS5bEEpZQvtibNCGFwKiGS7jgqgJdsRFUtw
	FBy6P1zRCW3Q3zG+Pz/qSvsTaUI60YFJ3qpUQWk8KfJZvwaMlowmNQVVc+ACszrd
	1B/bOdCR7dfns/JoBjaf/Q4Gkz5zLS0067f3qzqTA/cqFCHQVxkMrH755O1VH5gT
	LSe3eS2BGA+//s0hSHlpKTIO07CI1rcW9VlGZxn52CFCzu7knCRyz0+2B/NGIzNH
	PQI0iQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1quhy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 14:22:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ef37c3f773so10700648eec.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778854972; x=1779459772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=;
        b=H92ewZ4z0aPj6/xWX0yJrEYONkoSwpAua8u0YkudEMO6iIt+YCI1nGGB3M9gFyeTJH
         6cCu6kzZbnV9Ka6ypyifrginshInwA26b5Y1i25ggMxbUcBI9ox54qZGN+4nTtnbNjp4
         ieR2oGiqVB+QubGqRi6WD+kuRH+kiG5Q2Wj2OUwa7Py7T670HT6CJQA2lag7357XWow3
         oM3H7o93fWWklSPXijlOFbK8T167bKDB6522sqMOP14p9jt2teV3gjwO93PgenPwQfJ4
         0cdux34jmBWd0apKFlQH31sEsw1makJeGEYVsOVV7saZZUzuhLSNSKmR8gMED9n4+pNs
         vZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854972; x=1779459772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwgI4gCOFcfcSUDdRJPuf785r1N8oM5gm37xd7VD4IU=;
        b=nOeV+ADnFcyKFYXmfsZqYWQZs9dr7RDT6NO3Y9N86l4bzx+liZlgH0YDwdgKC5rvMT
         1F1RzW2Pos7CFlSCaqU5P//SbeZw5ysBdUc5NmeGQuR9adBYNimBNo1QMEG5xPwyTz4q
         K4nnFQO7pHTxWSyuLw3GxB7nzU2LdhBBzIX635EsL5/LkqZf6hLE9mKgk4E/mSeXFBuO
         gS3dfptUxoqNhb9MmJbd20Wix1qtWP/6dBYV9rcB3vxYeC3O37/5Pa9DUn38F776dWFb
         lUxJKs0hi390DruMPyigD60+kn9FotJ34zI54sW5CgGJ7EjzEhSjhfNwRFqj08miXk0A
         TnCA==
X-Forwarded-Encrypted: i=1; AFNElJ+fahLkeHTFomiIa16kYcCihTjIjGLi9RIxEzMYuM69d3uI28nUdNisF9xQ1bslYY2Cir6c2esTUyzh@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ+i01ImcBRdi2Rk0HMtZOZ5RZqSrwhTsxTuPIFsP/BS3fW4xb
	KPq3/b5XJ+PA1n/GmQ6ryf4Rc8nA/fDle0z58+zO8BmtGohkF1gntA9zoo0yBQCStx81OBOS50s
	5t1vbxJNSaz7JSa5xdxI5R0vCkTRp3hSPzp6vExePVZhjzCLpUjrp4u6GfTSXtUs2
X-Gm-Gg: Acq92OF2Om5ug4uq7ywiEdrBWF1V1xyyBXt3JVpAEYqsD7wAo2VxOw+mSo/s3Y/TIp9
	KYtlm8K7X4dpfYhtQ16ZLhRdiDBxXJ8y3UgHaBrFyC6gp0QtRE4maipbPJyoPjAfs4x0mHbjl2V
	tmDUPFMqJgYBjLC/W4a/QTOOIZk99x64GgUr1F358yoM4l2fgg/mQ9CwyGDB+ZxqJdzFfNPr8/a
	2diaFtpAeUGAhWkmkNWLlXBQFo+69TmXBnUPcyHwKeNN/eaSHPODy4+ewex3IdkeefZEiQ/3u/9
	8p/Nsmt51u01MAmQ1GR2Zi3mjOPTe75QR/v6fgU6IO0vNc3ueAHJbDPCoGRb/w/7YDY1vp/9wpU
	nkaMuA60DCr3dwwloeLNzKi0YqdtByRMvc+vssjdakWpfKFNoDXqCknmihV2JA9by/z2GbrE5T7
	W3Utn7
X-Received: by 2002:a05:7301:2f85:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-3039869ffffmr2132111eec.26.1778854971050;
        Fri, 15 May 2026 07:22:51 -0700 (PDT)
X-Received: by 2002:a05:7301:2f85:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-3039869ffffmr2132069eec.26.1778854970441;
        Fri, 15 May 2026 07:22:50 -0700 (PDT)
Received: from [10.110.108.188] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm7956995eec.9.2026.05.15.07.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 07:22:50 -0700 (PDT)
Message-ID: <01578e6a-d10a-46df-bb32-fd45ecb365d7@oss.qualcomm.com>
Date: Fri, 15 May 2026 22:22:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
 <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a072c3c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LBsR1RIUYHBeOwdxVikA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 5kxnZDE3izCDB47DNZ7PgvrTdm_7CPmf
X-Proofpoint-ORIG-GUID: 5kxnZDE3izCDB47DNZ7PgvrTdm_7CPmf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE0NiBTYWx0ZWRfX0fkiOcQ78f3v
 7DSjffNAwD90t8rsgFZwEbF41Gk5/Mn2dHhi49Sm0FapGukkjpzqK/MyRQWoWUjGMSeLunrbBmk
 1co4+iQuWwy4Ec0gtVY82J8JK51c6nCNAS05o7bj4G3FQFWcvN6roUbQ2VltDaaxWZj352M8Zip
 miyAQUpAXCFmpHSbzfd6cgVa5ErysdBFTaNOIPSBqn/ciDJPmz41lFmDEKgPThk4D6f8VBBAP4G
 OSOwGlGWydMaGP7FrTdh1cLWBRsqs7IEVoJzbrAsIOYLCTFtotYbgO7G4c6yPTI1A+NJ5l3fsQT
 nXdE3CKSGXb1Cdi8PJMjOYjhW8PpPv63FJP9S1aXQgNziLG2sZRQ85c+E/wOFXKCGKROpUHh2z6
 ZFydWt99sZztoulcGaQysoeUVmbiJ+vE/s796z4glIvDlTduBLS6+nFlhu7iStLX4mX4qV3hT+X
 uNE0crk2zS/9dN4bm6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150146


Hi Krzysztof,

Thanks for the review.

For the SCMI-based platforms (e.g. sa8255p), the ICE resources such as
clocks are not controlled directly by the ICE driver. Instead, they are
managed by remote firmware and exposed to Linux via power domains. As a
result, the ICE driver cannot use clk_prepare_enable() directly to
control the hardware clock.

The intention of moving the clock handling into runtime PM callbacks is
to align the ICE driver with the power domain framework used on these
platforms. When the ICE device is attached to a power domain, invoking
pm_runtime_resume_and_get() will trigger the provider (remote firmware
via SCMI) to power up the device, which in turn enables the underlying
clock and other resources.

This design follows the guidance where the runtime PM framework is
used as the common mechanism to abstract both:
  - direct clock control on non-SCMI platforms, and
  - firmware-controlled resources via power domains on SCMI platforms.

In both cases, the runtime PM callbacks are responsible for performing
the actual resource enable/disable:
  - for legacy platforms: clk_prepare_enable()/disable_unprepare()
  - for SCMI platforms: power domain on/off handled by firmware

So while it may look like an additional layer on legacy platforms, this
approach provides a unified mechanism without requiring separate driver
entry points or special handling in the upper layers (e.g. UFS driver).

That said, I understand your concern that introducing runtime PM solely
for clock gating can be seen as unnecessary overhead on existing
platforms. I will revisit the implementation to ensure that:
  - the runtime PM integration does not introduce regressions for legacy
    platforms, and
  - the design clearly justifies the common abstraction for both SCMI
    and non-SCMI cases.

In addition, I rewrite the commit message as the following to make the
intention more clear.

  On some platforms the ICE device is placed in a firmware-managed power
  domain. In those cases the ICE core resources (including the clock) are
  not directly controllable by Linux and are instead toggled by the power
  domain provider (e.g. remote firmware via SCMI).

  Wire the ICE device into runtime PM so that a single pm_runtime
  transition is used to bring the ICE device up/down. When the device is
  attached to a PM domain, pm_runtime_resume_and_get()/pm_runtime_put_sync()
  will invoke the PM domain callbacks and let the provider manage the
  resources. On platforms without a PM domain the runtime PM callbacks
  continue to perform the existing clock enable/disable locally.

  No functional change is intended for non-firmware-managed platforms; the
  change provides a common control point that allows ICE to operate when
  resources are owned by a PM domain provider.

Thanks again for the feedback. I would appreciate your further review
and comments.

Best regards,
Linlin

On 5/14/2026 10:06 PM, Krzysztof Kozlowski wrote:
> On 12/05/2026 05:37, Linlin Zhang wrote:
>> The QCOM ICE driver manages the ICE core clock through direct calls to
>> clk_prepare_enable() and clk_disable_unprepare(), which limits integration
> 
> No, it does not limit any integration.
> 
>> with platforms that rely on firmware-managed resources or platform-specific
>> power management mechanisms.
> 
> Nope. It's perfectly correct way of managing clocks. Adding runtime PM
> ONLY to toggle clocks is absolute killer, pointless overhead without
> benefits.
> 
>>
>> Replace direct clock management with runtime PM support by moving clock
>> enable and disable into runtime PM callbacks. Use
>> pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
>> and qcom_ice_suspend() to drive power state transitions, and enable runtime
>> PM in qcom_ice_probe().
>>
>> Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..6f9d679b530c 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>  
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  
>> @@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>  	struct device *dev = ice->dev;
>>  	int err;
>>  
>> -	err = clk_prepare_enable(ice->core_clk);
>> -	if (err) {
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0) {
>>  		dev_err(dev, "failed to enable core clock (%d)\n",
>>  			err);
>>  		return err;
>> @@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>>  
>>  int qcom_ice_suspend(struct qcom_ice *ice)
>>  {
>> -	clk_disable_unprepare(ice->core_clk);
>> +	pm_runtime_put_sync(ice->dev);
>>  	ice->hwkm_init_complete = false;
>>  
>>  	return 0;
> 
> 
> This is pretty pointless change. At least by quick glance. You changed
> nothing here for PM, except adding indirection layer and more locks.
> Clocks will be gated the same way, no energy savings. But on the other
> hand introducing runtime PM subsystem is huge bunch of code with its own
> locks, completely unnecessary here.
> 
> This itself is poor choice and has NEGATIVE impact on all existing
> platforms without any benefit.
> 
> I am surprised you went through SIX internal reviews, collected two
> internal review tags and no one suggested that using runtime PM ONLY to
> toggle clocks is pretty pointless and undesired.> 
> Best regards,
> Krzysztof

