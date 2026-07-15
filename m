Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6243634C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108831; cv=none; b=VSvX2Kj4YQXSW4ZWdUi/TB1jKji5v6l4RlcJeBh1FvU4sTk+j/JP/4gZIK6ft67QR9ygYUBLNVBx/thPY2f2F5dR2MvUNEr0+nJ/S1z/kIZShEz7pHWGBmJFviHwNaYpYk7U6mX2bNYHJ/sKO/w0PKscNTiy7lv+24Xb1equoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108831; c=relaxed/simple;
	bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq+MVuB99rB3pIQPZ458008XFm/9PR6i/z4R5mqzM2pmQk2Bbx+1YbiYu/HUKY3PvY69lAh7vU34FViof6ZIauBsgh8ZJoM9twXw9ldxQoZDTamMHnqoVIIM9CejADo4wxSyeg/bxMRlQcQXpTxZcfdc70JDoxb2DKetLgoRWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dmddtxtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGzXOTuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dmddtxtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGzXOTuc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGsq2555482
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=; b=DmddtxtjAoRWSWZg
	8dHlSqWjmP2oZJtVDmgsOGq2XduC13N4YcSEPM9qQzhbiaeT5iEKUYy0KLt5ywcD
	khzzmn0cTzzieiyjM1UGFUCz2JvnGwL6SRdT9lzDNks+9+kxdNx0nrcZ9hjIMqo7
	R6VMzz9yGCLSFfc9zGB2I2ChB/Q5HXUbtd6uN9NEcvUF1fvyeRqAKFsP3qKPkZfo
	xzM1LrIVaDX27gM6Kt465cmXC2NVqmcOQBTCeankE0zVeQj/Fq2a4+9GxiW+5WcV
	kStM1YsF9Jo41FM0qF+exD4uQEQLTY0cZ8kBToqCFqlPsniTUfQTNgk+mdAxD64U
	ryY+lA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ku1ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:47:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso17469046d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108823; x=1784713623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
        b=GGzXOTucsT87B0xpzu+LajRB2wskp+1a+mKYVvoxZkRUcSgvmduthyUCUTjBfCPepq
         ej5r9DtqFV84gWJVYmJfDbjFRS/z2ifBip9wm+YLl8mKirpahz7X/EHgmDoG1sF49+2l
         G5AJe56roqnfIjC1Z0tKUCbBcUl/Kdn3FzzxjPb4vv2TnLGzNXF3ga37aJPZSyj4pxNq
         KBsNJwCM/loQA115xqf8khvbqNUeJBPBP5kXAdx2FYGm1TpMzhC7o8UgqOblDHl8M1oO
         W0Hs8Rggx3YPjj2Wa8D8656svNyzOiOyLXZAS6GQkRLsG7OGji3u9inwoNdulud1rnv+
         SBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108823; x=1784713623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
        b=BNiU61yiMWpLz7M/lYGBoqjk0YT5cLw0Vn986n7xTcOa53qtVOD1KyaybiS2mP29Or
         rSXdcrp9vqOAQPyZ709+4+hFN9qSL1J95T2iyBEDLwoajwfNYAz2TvuGz1Qpz/lalhbs
         HMp+Bzgbw35UloyrNolUYbPCJhWYvbsmcECOCq7qnJSuymE5YOBhT34BxT3lOGbuBfRo
         82e4PXr602b3XIK+L7DVAmyb2SBn+CF4vD7sMOInU4aM+69VK7baKqpZcUCS9m2RuCVc
         PM9vYZ7/AM9m7S/PZdIcnD/zObspPyxZ5SQezVcH78KsLS1H/rfYqljFvYMwXMgXs1M8
         KJAA==
X-Forwarded-Encrypted: i=1; AHgh+Rog2qacoM5tbO8gSKIahK2SaxtXEC5OQKPfNie1IZsfqK5gvKk9sz1snXlYdbI3tI3MZ+UDFFLb2a0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ioMC4yALeAOiHzTt0gOx6eDttctr7W3auBQp+COG21XypWav
	/ChHidC+ADq+9ki/97wN8HJL/fJctnWYMVLWHG3jaTIOf1jy6zUb9ku81SLbDzAWmseE7YvpPJD
	TgZDJOKS95GjTl9UIn564eI5Nlz/1e2R5XE+d0NZvIWkFKetITw4OBYwGCMDDbPzh
X-Gm-Gg: AfdE7cn1fSA5eC9r/CfM8i4/XSuM849bEI8KkE+GbB8Tzaai4cIshcMIOkZZcXAkSrH
	XhByOz60Hp4syHhatvyWo136QQcv4wJ/TEZlE7Gd7GOF0UmlzGJg9KDqUIa55WRBC9N8jI4hTAV
	l3NQMcrBvv9C9LBgJ4+zJ/V4fsXvVx6K293N4Q/mpRQtw6a3la2XF5Zu8eCZ0PkUdb8nrHs2/cx
	MOgDfO2oKyumGCh5EbuZi+79qPj714sewiOq69oHzC/rWkn2MIKFk1NGG4zRB4wTgGE+X62/f4a
	5ZhnsMHHaoyL7hP08NzAL2FUACnjiHEpBOpU5lVG1WAz2UrJqPcL8VmcZuiNa3N6wkkBJSKSwb6
	DucJmQETaoWWxBxZTULsLakdGeYSNjdmDv08=
X-Received: by 2002:ac8:570f:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51cbf086adbmr143777811cf.1.1784108823592;
        Wed, 15 Jul 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:ac8:570f:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51cbf086adbmr143777621cf.1.1784108823148;
        Wed, 15 Jul 2026 02:47:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm2696576a12.25.2026.07.15.02.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:47:01 -0700 (PDT)
Message-ID: <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:46:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a575718 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9p2gFlySMKisLTOENoAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: t3ocGFocbf74ZSuI7Eh7iC8Va0yUT0_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfX5mFMEZRavHd2
 Yp5oZUMvCA42vthKuKs6TQIrnK0XfWFlncATIwYDA76NYlbE0ulBMpfSpc4nSwGM34/OEOiP5qb
 i7V2Eap2+SEbAn5lJuEBCqk9Tntl3ZA=
X-Proofpoint-GUID: t3ocGFocbf74ZSuI7Eh7iC8Va0yUT0_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfX5UgjRP750PV1
 z57ubYqM342I/bRt3p8DZnnNb4pY/YqkN7xC3FuBppZhqZuirE+VW/joyFDKRW3xIlPyb7TPHBU
 2rwoOFrnO0ISj7D+OL2QdmRtHb+x1a5XGVpZBnKXxoGrOD62lo+2qaawlH76NHcH/GtGsRS9EIU
 q0uKNe+iqp9SuOX7j+rRanskySFqvBUSsD8Yf9K8td7+Aai1ktyl2ji/v78RQYN2spqZqN/36aV
 wCZcnYWBopLm4fwwVaAE3qn4LSjCjciA2OMVtOqZNly6XqhY+0C9fXvJgAOUV+3tGaWjwtsbJ7w
 HVIZqyu58RTTj8tV/2o3E3qD4YwXYUvhaPh24NQGxs2SqlXv/OWBargUd33etFH7OnQ6Tljt2YH
 atzE+3SPnZ4RbfGdAPVmhoLcf7VKfhaVJemE/KzxF57B/wtl/UCoGYgd3QzY4mFWZjLlz1sKQqA
 aOf8P84kQf24fQzFkbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150094

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

[...]


> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> notifications to manage RPM communication when the last CPU goes to power
> collapse.

I have mixed feelings about this case. The RPMH RSC driver keeps that as a
fallback for platforms which don't have PSCI OSI mode specifically.

On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
all of the arm32 platforms) that don't define any CPU power domains, so
perhaps it's necessary after all..

Konrad
