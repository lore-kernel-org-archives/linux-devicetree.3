Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B83CF21F
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687895; cv=none; b=KiaePW32sEN17afGnPkLnDCV0cEwBb/JmIlekE46h8ASUjcinuNqRFn54d+qM0CmtdAl/fvz/BLpOGdJLpPDVNNCU4nOcAp/KLNJOlQe1l5On/lpaC2MOT34AaeP6tlyy/XKHCZCy5dX9u5z3E76inN0bnT/JQIT7cj4QtgNirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687895; c=relaxed/simple;
	bh=zxlynqi9fA8FlivDnTAJLSnkFbzFLM6PTRJzA0vvrQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMSyESK0+htY0xjcfMhPwgSro3qGPaVu+cp78pgfIvC0LETEIp/jLmvJQcqsUazHRznUUfhb1ff6FmQZMam+xwQ6d7fGLSCSpl3DImoLStr7qzhOkXuht9DPbycLKaMSS5XnvnjmUFiMWvCeX1TZZn/uXFLYDRzLdJmFyN3xvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMil+mGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBId9aGv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMil+mGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBId9aGv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhCm613458
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iPBVhcUH178RCfdDLu69SKN
	FsRS6mvhRrQFeu8efrw=; b=KMil+mGseY6xEm7eHWWv6S2XW+SZ5ztlbecdyUKU
	UaOCljx9hInVasq+uOM/H+7U0aXW484crJWmizv8LtQFXd27Qt8JLJuB4wdE5bLW
	Kh1irypBIOpRPddBIkFN8JdUap/kv3c25e/B9cScsM/6ofUt9W9vE+fzWi8NejFF
	rIBex24AlKsDV8prLcUQp6i24ItSc7pewZjRA8WXagr4W43rFnYo248m6boV5/dZ
	ppFmD68bqcga/3icp9430da7AkO9DKvXGdyFWiSgx1iZ7PpDLimil3hpqPqqB3VC
	b/+qDSO2rlXnfoLZvgH4wsVs1RpO0iq3sa9g87B/0kQ8dQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2muh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b3beb638a6so403644137.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687891; x=1791292691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=HBId9aGvdBby5KTP/ewuNd86FmgOar/L1DERs/n8QLqI5VrRxqoxbsHcfbEAX2ZBh1
         HY2fPiyPle/m7CLWBAqT/qJWbjF/f5KTEXGuYdO3XY6lGtSXPX1gl/M4gdQHNtPN2kuy
         9pA0ovRsZEf+q8YVy4h7ow+o2WWOJMgH1vuzf2o/VOo2BOrjNKNie2OGJbW6wc6jrm3Z
         oc0h53ROKizp4bkfd8ZhqBYzCr5Nyn+q3DM4+7e3Sp7kOLNcSyzcRRX4VH3oumAZl5FW
         7IUQsb4/vECjIvOOXkW8MRYS38YSoJs4E1p7Lh5ybNSJ0KkBIi0Tqh2LEZLBsh1DXVAh
         0AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687891; x=1791292691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=MmZuoLDl66Ylp87gA7rtAFdRnbCClmJ6zd4+XzZ02N/cqnpfpmxgIw+kCcuLFA74EC
         ccSxbZccjvthqDVwiPZChieZ7+J02cts0WVXaY5PDHREfpPAvH5dqP4pE3SBoUi+vmZh
         XY00fg/ERh9SvfE8Asf8JoPp56l9EREmfDVEP181SH/T+PmiC+ERz17Zydi2dbgQdASe
         rZ8xXZogakppR6IWXBHwApdZDlHi4LtvpbCq2ytJPUJM9lezn6dTkNAdk7dCHe+y7cLA
         OGm555hDPIc+7Jfr3tWdf/LODYbxG1L/6ygiwsUMv5iIhlEUP94Rq3cIcjXiKmyW2zns
         YpKg==
X-Forwarded-Encrypted: i=1; AKwUvBxJzeZswHseY/+DUo4Y7ZYNKUIs5rODP18zpxZo695d0VSO0PhpAoK2R2HVmNayQDsyShqJO/r9EHm3@vger.kernel.org
X-Gm-Message-State: AFq9FYKGogrnHn2WTauc7T825qpL1kvKbk4u6iRu/dYS3GtDbZMgc6eL
	fXmDBxWyQGl0yTsVniFsvggksnrsM1QJjNVt6l6zN/JZgq58iUd+yXA1dTV04zVFOkpBHoiGpcX
	AgZEwqOHeUeHuyF/v+CNI0ABth5Y8lI00FUA9NBNzJYhmZOFPDv+ZyBRo/ymIDnvDawLl+fG2
X-Gm-Gg: AYBFou3V1i3e00GkowacaVTGu7p8yTXFye52n6IsxwZP62t7dXUMzT3yG3TKXKWNX6m
	vdQeFVe1IMaTA/Mwhhy+5nNHA23h3fPSee3LwlPqGUW+1M3t2HmyC7qhMX+IkxJg2MKXKqTVeO6
	aGY+c8AJClfjFLtIA0se/Izj3NbYNJnSjWE2ZfZllFvrvdHCEbSeR9DE2jipYLb4ZgvBpsDeYEr
	BPH/qPNbQ5i1kX14/YdIQTZ9IZ1ZDwjqEJ5MchDCaiRpucfHa6Xe4PdJKmr1v/rBGXIHL9kAIqx
	unnYuzVRf/lOWhVSQysfl+uY/UNiHtKOewRAdEJ+I02tUQbMEmP1+zkRuwpq94/jBjphCi60Psp
	qoDI+db4RcE3VYzQ=
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849926137.17.1790687890905;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849905137.17.1790687890247;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm77089755e9.15.2026.09.29.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Message-ID: <xttngc5acpc4bj626ekvbjcdwswnh4wjp6yiej6kbwxz7cdcv2@cj7gxywhskep>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX8Io9N/sUi5dV
 XWDTawgpWHIzMm/dqeF5HUi+tlJaNXKFwFIhhmV5qqD4HEdcQMgfypq+eJIimstuIS1HqZObvUh
 niba2coVYAlsi3i/30Ro9Yl27eCt8Zg=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbba93 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX+SV+wOm03Ysn
 jkT5YjnHmCFB0lr9m+uF2VvALFjENZAfKRNofxvS96JjdzFCyU5qvzLMO1s3Wtcy//AcVW4gFkf
 cWSxuz+zg0b7YdlnDcLLmCjCIkXfsrpQtjN1stIFEQyvaJkjJrKrqTOefNMZpMjE5ivKl6XtIar
 QoUC2O3EJn1s/OfmBMr27ikrQtur3uZJxS2DoCAszUYWJHS+KYlORo8UMqUXZsLIz2u+YSyY3OU
 aAUEATaE18KEywZNy2nlNHn7xOvW7Q6395h1M/nveMzSCnQn8VITjzeRwGjLuR8wfadH5rzrC2c
 HyS/DkDyv1hCDwN4y+LsAFI+gsBoOHPnIlcaCqp0g9F9K/kBw3h/kQZ+ABlh3floeWbPipZ9DmN
 T1U8W8sgz3M+ros48a4hzWEB76G6XCAZQSj0fA3mo3vpO5WyhVuG9ryN9iKu/YzIMTU2xHvJIQ+
 0onik5mzt+zTdwA6Mjg==
X-Proofpoint-GUID: 1YcF1827QlqInJ10U17TvO3YuNzaGkXx
X-Proofpoint-ORIG-GUID: 1YcF1827QlqInJ10U17TvO3YuNzaGkXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:37, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
