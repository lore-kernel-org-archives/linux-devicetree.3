Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682282;
	b=hUvNItoB5vC2w57aZNoE6ll0ksNq3zPrGVSbo1n8jgx+nBpZPAFoG7AJDrC4nPU+dN2S
	 tFqvO/sp3jKW3eCIj6jZFeREZNSM2Uovr3NHF6f31vJYltZuoa0euGfaUglH1mZhyq8rN
	 0Lpx4h14Z28KQ+sDxdDvNI8llEsR1wHg53eoqF5C6H5ZcARcJAlStL3WHViF/6aYqcshV
	 D1554mtDooX+5geugM1RN1zTNKBbKiZYlWe+1O0gEU7AdsBpJX3hLfATnrdb0sAyLvduT
	 CV4tYMgCyxRctqjniyJNmxUVKC/QkQ6NtejFD8uID5lIeP181gNCVE7Uzzd0U6LYkXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
	b=arVQ0jC7I/sRE5dsRAsQQOLMAOsXlNj1WeaHao6p9GmqUtO7iLtZ/qa0A8zPyYdDORYp
	 UioDMMNnQwFZ8Eq2mx4co+OzwMp/x+0ALTt+nZgq4qVdRUBMh3ig5r3tt8teJo4ot53La
	 alTsBTgJBZIiNIlaNP/2i4PSFptX7u+EEqSbqdXQ/80u6f35D/hSHaSFpkYebMIi6i8iK
	 t5xzGAQw0k5pIADps6j5rJE3gL40P9tzO5SeZKIdamIe2nKlNxw6Uq3R5Jyj/LEHI+YM2
	 THS3M3mh2ZZAuGUZgveGk2raRBRoHYQXSkaFG2M98iUTONyYZNGdz08HgjII1nYpvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fK/KNW3J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6628606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6628606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fK/KNW3J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B1u82175705
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQPx9qKiYiOC+Qu5wRqDaiDP
	oYwCF37v4r4ojrWgYNg=; b=fK/KNW3JrLr3ekiZDOsKo3oXpjL6zpTkYQlblXef
	xJ/JmLp4vUmHcpOqd8zl52ccM/FCqDidbdI5/oPNjfSE+6k9idpYFby+sMvGm5j+
	1aDqoksZvM0QxOeC78NTMVnGoLkML6qrqiOfJxVmmQMl4Xi8TlLT6p5waAQFBei5
	2wK/2cnDYrjZwJKb+38gy2vWI6uL28hROIDoSx4SK761qa/e1bq1IVypUo1zq/CZ
	3NFH0VswAQfCvOq5nyXdn3/r29GPKGdyf2jnnaM2aIg4fpmLJmyMslL+2HeHIPrB
	qIMoI3mMLrHya1BvJhdwf0NX3C6wXzIyEAzsxgKZnyci7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuhgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:38:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so17029026eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682280; x=1796287080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=TOq5g7ucgxhjxObt30jm2lqKyLr0CppaxoGxkuOwP7djCcnh6vTbrP/kk5hQNGjbC3
         xQmQERjAt3eBptW7yBbsNXk3bfjP2G2MAwTINYTcSSC6ceoCAHbX5rayf/nu2g0pmvyU
         mD8aAA6eUmnjEbjfZ16NVDp6mhmUfrFUM+Dgewh0ml2IXLB/6MQw98zSBDuKGB+UBfEe
         ODDO8ASfC5/2J1uurHjfGQENyvPrk0KJ+mQKYpbX6QmbsmgC+cIUWZicOadBov14rTFM
         ibX69BGZJU+Jt6EDopHjNjEKkDtdDMIOwl5cT0VCxftGLwP7NpwBkeZVz1w+fnrgRV+P
         hDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682280; x=1796287080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=nKqi6UtxOUvMGnAVk+6azzrY83/k7033Evx3BLixIB7zqLZlvs/SnPV/3ixzp4r3ye
         U4RfFkRRQ5gv8yVDeVXSt55GHF9G3s6smY1vt8h1adVagUpZXtDFHSwEYD5ipoAOvV5E
         5dCuw4TEa0fQgzogW+pBQvFwf775g5deMD7KOECqrQ4vBeQs3DNK0DTyw6yhvw4aufe7
         fo122FMCPRVAnbRiohQ86MTPZYA+LbY7s0KQ6XaQpIrt6CbJ1rVmbe8PnOqrXcoeSzoe
         C+/Pncqh1fJOm4vg7EhiRMcjKOlAZNY7WJy/IkZaM2+NtVnRjxZ/gTbYq/ipz7nA0L4F
         Fm7w==
X-Forwarded-Encrypted: i=1; AL+hErGsHTx0tgT9L6GM/f1SLiyDWOwYByLosqtNmcKXnTWyXJOxHJoO9M43Xt6pFivoRYAHC/oD7YiY1xGr@vger.kernel.org
X-Gm-Message-State: APuU4Z9cdLVFy4m+cmEpyoHtIUk0Frta405CFMa82jTXkymn8qeLtnml
	krjcuWVnXv95egVtg+mZlfTZb9ilj2QuUDo7f9d0g59aWOLiXOSlvxj4L8r/jFWIsd0gw9ln2Vw
	LaDQUNKUujsS9cdQHoZtja0IiNOrlTMPCcUxHSOXZplpwFpGz5PLCroS5ysj8RJcc
X-Gm-Gg: AZFdTZfzCURgj/KLW1Z5uxRgbuZlyQadqFUxOrlOUdVJSRo5sNii550HQPvgn85O+3V
	jffEDHHtHsw3ASrszlLbgVLMzT9jG7BbP/x2Ktw/QDB8SIuOV3I7s4cjUUHUQRtw6IOTebNokXI
	Wape/L/XCIvyTLxEFiy0q4rHMIQ6dA22w4FhBMFyWaOZ73gaY320fUhRq0vDvK7ulb6u9SJ3vHu
	JAaUV1d6D+Joi+USnuxkRJk2sw9ZCJ6/R/TajPF166H1tSMJuiF6JnkSo/HjJp/ZuC4L0/mVa7g
	0tR6RuOkVroK7Nq1/AVAuAUgMitQ41wgvwFkT9HENCuVjVfdkkM6acXczAhM9f0fjiegDHNNd7P
	dHNT/8RreC8ls9ppOMcfA+ncaymtFmniIzK5eiCUFIQeadCwQ0p/UkzxuVKskW+lPpKDMxysKo1
	Ocsq3qD4+HJe49qiDNT+D9ow==
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18801001eec.26.1795682280053;
        Thu, 26 Nov 2026 00:38:00 -0800 (PST)
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18800971eec.26.1795682279493;
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm27849473eec.9.2026.11.26.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Date: Thu, 26 Nov 2026 00:37:57 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <awfv5SLoUnYlJUWi@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: RAlvEy6GC_d8KuCI60vETnIdR4oM3sro
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX9HJdnGbDRDNj
 AVyz4YmKBjVsHybquwjpxvLjgA/TZZsO580Vv3/vIg6Dkrd1JcJLPkK2NB5dxOlLuPpT2JMVyL3
 AENpA9mJ4r7z6vBYUdsSqiFqmGE3TrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX+lG/eLtFUXh9
 EfA2s38olRO0I2Vn9TrhUOO+RnbzwGxsjFeszwfGS/KBoH0I8HBbG+WmRXTSxbcXTGrWTnZ7YT3
 rm8GQee8wESg7OZwMPdIvV1Gu15FvmBSck9ZmOUcW9UKCUHawZJj4rb/N5r4e03MTLdy//Q/eNq
 2HCaihUBFFvuEkIWFkOW8tNfo6GaTSoqOBmvHo6wy3yjTzUYbA0pW8UqA36wXYCfOX63BQd4M5L
 3UFVIltnO9e7fXb0DFGwZzFC3MjPBX+m4vgkF5enD4j9AKX2EcFvmfUbBIjTxvUK43RJ6jnPufC
 XgM6Xfc3PpVmrJOwIf8CBOtUi3L1vV7gw/LbM0xQa1b5wguGhRUDc9dhE4Jsf5bhfFpkgnsiC+N
 lKe1xQZmOUOG+m3WGJWYsmwBKlbSJ3ckU/39KXG4/yRKGW1v5o+3OlVdJtRksUmuppmNCtLLUM9
 5XTukuivw6Hg+ZwIq+w==
X-Proofpoint-ORIG-GUID: RAlvEy6GC_d8KuCI60vETnIdR4oM3sro
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07efe8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kPxKJPT4JOKwAKEPVQYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033

On 26-11-23 16:17:18, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early

Have you run out this sequence at hardware? I find the dwc3 core suspend
(dwc3_pm_suspend) has not guarded for is_suspended, it should run into
some problems, eg visiting register with clocks off, etc. It is predate
issue, not related to your patch.

> on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>  }
>  
>  /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
