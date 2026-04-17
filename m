Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7993603DB
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432325; cv=none; b=YrG1uDQFuInON4PK1K4salH08Sc5zmCVaDaTVljQ/r8Z7rIxew8F43pKAks0FX068SIarlWcGAChDSlNsj2mTezEuH9xtLUol/sn1ZopToBXjpt+w70PwqkSSzu7mlF/d1IdVFJKUhhHH0JfFjPXlZXoQGeSR+vApcDPlYsWG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432325; c=relaxed/simple;
	bh=TPOcdSfpvISq6EQEhPEC4xrtwJHgRxM3d5dvRWfQGo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfRncjn7r33nor2SQul/9JAVln+7aHwNFKTM9htaXSMxXUx2fU5i28b9tsiGNq6YBTuF8HdHQS59yscfvcDT2I5zg7MxYVezL+yXRe9YEuPyht+lpoBf0pqW/VtO5H8UWxIeqm1JJn4oPYRYO4c29R5PHQtAhO3STd18TAkRHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5tBxD8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl15LAB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5tBxD8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl15LAB5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8nqGV3100227
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 13:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=; b=b5tBxD8LR4NpO9UZ
	U4kjwCG2N7sqGI087ah5J7rZ9O/7R4fiTv2oDl6QV5xZOPxfAUKWNfAZGiVBgVs7
	WYGOWzmTaPkellHGTTiekWA/qB3/sFBbbNOYoHJa8OL76GM5OKBjay1UvVIYB0M0
	Td4sB7FFE/SSd5cwfKImD14VwqAx9YhbJ0wd/QT6c2R2irUeei0iddAaK00yIDmB
	8NHecEpvqDF1Pxc1Zhi59iJUpOnpJMfuTd3kX4+NkRBs8gWHxDv1JQ4zPnN5qnoK
	wFR9pT2flM/7FUd0IQDbZc7lHHX7kk6nPWPh6XbKsfBm8ymyUaHYVs5ok9v+jvDp
	AAevFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu0wqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 13:25:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso7547915ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776432322; x=1777037122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=;
        b=Vl15LAB5zT0aDzM6PSmcEyxP2ASDMLGoxCY+sNdFTSRy0YBj+yXXuKhPluzCgQzILF
         bHZrD8T9wuh0RgAkUIsolqkBnFFt7bahaUaNR52PsPSJGl1qQghXHXPGf4TwyXrezIJN
         UTPgtcEjfJ5RsGhNx1wEAWhw4W72MOK9qeekNNkiHhXW/M31swpzMSkly9Mk/ihAs0Iv
         mxPJAkM4PUVL0MqG7Cy8gQdVL9dS5txiaQZKF3cStlme8ZWouMunkJJEzmq+C3xktoYQ
         CgFpJtp9BflvLwFO8pvMjYjokV59wInp+UQRQVu4OvhNWRNbZleNgIayllH7ZdvxPmAK
         qlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432322; x=1777037122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNcL6sT7C05P+AcSNna5P+PTt/SHMOgeqU5I2FLTS5I=;
        b=AqFblLUWtSe7eIVBnIjx5sBrKDcZo/xqJB3DDRkoaP3pRU4vyC66NWrxNVSnmTWRdT
         vQ950+Fhh5BhH8Q44HrDPE4MNnRaf9l0isqwmzE5aWcpkVRddpmLTpyw1s5rJc4OrdDp
         2+qu383Slkcw0fD34tBjc5H2EoA4txBoU7DrZ3IsuQegugYgWcuj4RyaPNp2oi3ReQVd
         8tCPJx28szxuTm5nMyXy8P6KJxCRMiN3zRi+NrSeaJtLX6V+giKHhAsJuM6esn5wIfKN
         ckBLEvkexEqEXAl9GvK+yY7tAwO7/cXw7A+kXMdj9Xk+Zhkiamdvd94MnsYnNa22wyfI
         h2Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/3IS1SS/zkUIkg7s7C/4suYYhk+w2ve2ZWUks3FJR2WOd64Fyw6X44P1cigVIL6Q3M03PX41SmtH6s@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0NERZrygxxwicbH+fL68Bs04SfnOjOOo4MvSykojYDgixrOW
	JNGy8qzJWphONsE/4oFDYbC7llRH4Jqy+/Rqmlx19S6zIwQAJkFDybQKDQbt57jBo0SzrENptF5
	ssDfGgnACaX87vXz913TW78wFQRD1iPHZaWp+0CWZ8v+ibNRvP89JrV9uPtgEYfXc
X-Gm-Gg: AeBDiesE7E1ET/erwC4dxGZDSOX1lgxGZ6iKMjtdhyRHeY9V7qYO74noGlXbcGq5+J7
	Bq8kAIjiDmGMlegKp9U77kTnBigT5tHGLfF38xg1i53DBtLZNftU7aH4aScLOa2utQHLD8JDwQ2
	yueqcMuezX7ldwQnTKPCminN764RtOPgdWxstMHhE4ryS3jdhAUnEwW3i+GH7KzDnVBwFFOSCKr
	ONzkdhpDLBwGN0mbjLs0wl19vdzeKpz9eah4/MgUqM8thcfbpnb0FzB/prpM1AGpW59Mrc+LfTP
	md5Ya/YwMclpsLraDgUAmsuCHaaseY6lNKbkpVk2fNF5AMbsg7swiSLDTXokwV8r5023mgv4fxa
	HjsPgTitRXwk9UiDuk2ErIWN+weSNcTEOVYUV7yCCbC5Biln5bKRE+GH7y9uHBg==
X-Received: by 2002:a17:902:b693:b0:2b2:ec4f:7074 with SMTP id d9443c01a7336-2b5fa032a50mr22722145ad.38.1776432322030;
        Fri, 17 Apr 2026 06:25:22 -0700 (PDT)
X-Received: by 2002:a17:902:b693:b0:2b2:ec4f:7074 with SMTP id d9443c01a7336-2b5fa032a50mr22721745ad.38.1776432321486;
        Fri, 17 Apr 2026 06:25:21 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa32ad8sm22769075ad.31.2026.04.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:25:20 -0700 (PDT)
Message-ID: <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 18:55:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e234c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Y1tIbI0nCN1IA7hYjVgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Fx636sulULIVa7o29nSUIQo-lWO-KzYD
X-Proofpoint-ORIG-GUID: Fx636sulULIVa7o29nSUIQo-lWO-KzYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNCBTYWx0ZWRfX9zv0YLqwTp3v
 VPMzmiMjNP7XQePIqzY0+VL2qdCrkCXII3gxpE5enqeQsljWGWEHWvNPZSyB9N7FLRzo0jTs3Ek
 9nR44e6G7DDgQ2QOGoiTQvC2OwFNbS51D/mR+FqVsr0tuHlRcp1cVTf7Bm65yEECWhwMFaw/DKs
 kECc3rtNxLmaaYwkKeg38dAytCpHtbIgTeS49DkeqEKiYSRnClaCJKKO8e2YwrRR50iZLYHBYk+
 76lultPpMb4V9jquWWBmhCtlQLKwlg7QMU3iidgez/XU9Ep0jn0yALRKzg6aRmN8KRmT2p1ZY+t
 Mw3m2p6mOSbTHLnCdYCnrErjAAMyEfIq20y+dRnYWx5Hmwq0l5UDWct+GfL+33UJ9ckimadSKQA
 z7N8SAogajnvxo2cTlju/9douEF88J7rAZ+7ea/v9nQNFVYCraUlxmptjBO6q3i6wtHoZpBe4+o
 cEVaVvN/+vptgX/wCeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170134



On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe. Attach the OPP-table with only the ICE
> core clock. Since, dtbinding is on a trasition phase to include
> iface clock and clock-names, attaching the opp-table to core clock
> remains options such that it does not cause probe failures.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use round_ceil passed to decide on the
> rounding of the clock freq against OPP-table. Clock scaling is
> disabled when a valid OPP-table is not registered.
> 
> This ensures when an ICE-device specific OPP table is available,
> use the PM OPP framework to manage frequency scaling and maintain
> proper power-domain constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  2 ++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index bf4ab2d9e5c0360d8fe6135cc35f93b6b09e7a0e..9e869e6abc6300c7608b4d9a18e7f3e80c93f5e7 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,7 @@

[..]

> @@ -742,6 +800,40 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	if (IS_ERR(engine))
>  		return PTR_ERR(engine);
>  
> +	/* qcom_ice_create() may return NULL if scm calls are not available */
> +	if (!engine)
> +		return -EOPNOTSUPP;
> +
> +	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
> +	if (err && err != -ENOENT) {
> +		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
> +		return err;
> +	}
> +
> +	/* OPP table is optional */
> +	err = devm_pm_opp_of_add_table(&pdev->dev);
> +	if (err && err != -ENODEV) {
> +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> +		return err;
> +	}
> +
> +	/*
> +	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
> +	 * -ENODEV when no OPP table is present in DT, which is not treated
> +	 * as an error. Therefore, track successful OPP registration only
> +	 * when the return value is 0.
> +	 */
> +	engine->has_opp = (err == 0);
> +	if (!engine->has_opp)
> +		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
> +
> +	/*
> +	 * Store the core clock rate for suspend resume cycles,
> +	 * against OPP aware DVFS operations. core_clk_freq will
> +	 * have a valid value only for non-legacy bindings.
> +	 */
> +	engine->core_clk_freq = clk_get_rate(engine->core_clk);
> +

When you are calling 4-5 functions in a function, it's probably time to define another
function to keep things simple. Maybe qcom_ice_attach_opp_table().

Also, I still have issues with engine->has_opp = (err == 0), mostly because I don't
see this style used at other placed in the kernel. I would still suggest that you
make it simpler, but I won't hard-request it.

/* The same explanatory comment as before */
if (err == -ENODEV)
	engine->has_opp = false;
        dev_info(...);
else
	engine->has_opp = true;

With these optional suggestions, feel free to add:

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>


>  	platform_set_drvdata(pdev, engine);
>  
>  	return 0;
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  			const u8 *raw_key, size_t raw_key_size,
>  			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
>  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       bool round_ceil);
>  
>  #endif /* __QCOM_ICE_H__ */
> 

