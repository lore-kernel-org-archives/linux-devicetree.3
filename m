Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C2D2E36F8
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481391; cv=none; b=PHNunR8B7szucCBU06fjBWe0wlM2FDuLhQr0KfS8kFG8YjDqNCkxzkf1MFRTIxEEYsePs2ARMhnycUIbLPDVjVzcIzPSXRnM4WwMzYXCitrF809ZlHHqLTZ4/ukdPkezJXpYTEzn46NdEQ3mdsTW2RltUPEhaRTRXBn65MKHr0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481391; c=relaxed/simple;
	bh=lZbRbAh+DVTE8ujkY7JeZBiPbcfbY8lNdmMSt/Ya6Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRwHKWCEg6K/S8u/hiHONL61648NVR2UKo61SUTYQFqnnSXOMEGZmn4WXixG3wQF6mUUNAUpae1Msp78IsMkI3PLppnmZxWzBbaBfy6WHmCmMCdTI/gxAo1bwUJi3CTT0zBTbvlBRPDOUNGwJRJtAP50PZ1cJT9BxKXbRcPXwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB6Cjpn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+XTCNqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB6Cjpn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+XTCNqf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4L7Wr2664177
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=; b=RB6Cjpn1eJY8kw5p
	ZboJC02bz7VBu6IlxSk0J/7NtKWeFfuo2WxNMQz2eotVtn/sAPETnKT3mmVjOhqq
	2w8OD129WJ+Vw9+0F/FT2Y7H6ewjj14SyIUhoKST9lC3yrna0mFeqrWSGmlMYSeo
	fcOGyq9saLghWvikkjM4YvAcKMItyy4c4Q09YRVhq9mPwYw+LfIDb1Yr59qSdpXi
	lwXcCjyMu+Z8Xtbe1QrhKvdF02IcFs4mj+Spbnj2x0HnwHx0gnNCyWWmbnIZyrs8
	tTtUe7JZITFyPxblgNFTH/zkHZwlnIfDBswcIuFZ4ijQ6FXyvkuizQ0wvcpuhFFL
	qiVyuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy4sxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:36:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3496057a91.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778481388; x=1779086188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=;
        b=H+XTCNqfrGxiwjM8PCHM+DVsOqiYwwRLxKm7MAlhPdyyPSeLTaOGi7rrLaL9fKPBsG
         j4TMDs0+QsSolzqugJR3NOTCNrTmMxOy3taZNIbbDig1Lvit+AHdIuK3ST4v8HP6fgFN
         PbbGYmhn8Pg4lpkpcRGBE+TtocD6TuwGYOzFUCLX0zh3AWx++lhVJBBw72q3mwRc3ern
         apT5+F57sgVajvy1a+XL38ipyufbF8rhnPEh+R3LTpp0boLyAV+DSZzbbfzldYhApz42
         yjStT9/31JxIqQE4mlPvlJk1iImIBNJ0AEiFNjD60yTk7SYDovezQQ30RwFAhqZiOJD9
         Ffig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481388; x=1779086188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=;
        b=FgH+IImoJ438xq+2fdO5ejPdFd08AcGqkpKu2FIovkenQv++10QHXXlViSbfsMkNkk
         IjcE2MrMyjKSW3KzYyFBFSPBOqAmynq+DdFdHzg+vdS69O+L58HKoh1IsnP8phnGckPK
         SCtlEJRYviSbjbKrD2knu7zMx1ym3ZEwGtv7C6ir+Z/Lt29HeWryJD31OEGJQjz0Nrwu
         qVQVM2/VBRH0cOdk5SBJm1z+hhARPm/xwcAW0UqKPrSgDzimhrtIm+jK6liHMk7wmhrc
         7iXBoCbasUYT4scuqBeggiCEf9vSgLWcUIDJe/t0FCRFpvTTrCpxZRQEXQhSudLGKdkJ
         YQ2w==
X-Forwarded-Encrypted: i=1; AFNElJ8jlDJHdQCN2PVhO1Cl3OETExIS0z374MBffz1ErTA1C6lA9rRP9gwcZx9bhszcCLYAduEKwynKQqNe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+0oJoNHjfijDYYxsIOclU0LRE9lBChDjhswm5qBZT+szGzOV
	x6d/+UuFFK6uYO6XF5wZLWxzTZEIvb1EmFSdfOrt6RJWw2pZEox5evjIjTBNbPGx7ttorDaR9M/
	fpPCLHUU/CCEtDLtICJ40rafExYQcx88C3jjug9xK+a5RF3AcRAmdc6A2FLiT39O0
X-Gm-Gg: Acq92OF/dPaoZ/fynjEem3eH9ZT+RdpcyKTOSCUTxXx1n5w+3RYfAcMntmb8lhx2Dsc
	ZPHeooXHt8qC+yGqHJFHxiJjxQVvLBGXv2s50UOTLSc74cR0xUsEYJTDOHxqCGDY8obiEZ9gxzv
	ZJLxtF76UvkrDfOJ/FhG2CafUGYQOlQKnf4huFnop2xPxK2lf8Dk2Shv8yJTgjjInS6SfeZwzaD
	qsu82WFIbLfNUr9gaeoIhwDEAV7y4YjrsEsAewrAUTL3s5a+RIGfzLKutbw64XoCBXaIJtyl4A3
	vUtN3QjvV3ipfm99uvkkbBb6wX66j//0xJtlVdC7pw0OfNV/fX7lKgsFRoOIk1FuLtdpPRJnlYL
	PhG9l42ANRiorTM6aJC/4eNnAq4l0IVpWC6agO9ZG437XN7CKk+ElSA==
X-Received: by 2002:a17:90a:d60d:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-365ab9afa3fmr22776113a91.1.1778481388260;
        Sun, 10 May 2026 23:36:28 -0700 (PDT)
X-Received: by 2002:a17:90a:d60d:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-365ab9afa3fmr22776097a91.1.1778481387790;
        Sun, 10 May 2026 23:36:27 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be23b331sm3347418a91.1.2026.05.10.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:36:27 -0700 (PDT)
Message-ID: <77922d17-69c8-2710-d206-3d2f37651310@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:06:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a0178ed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h5up4yhgnEjzzxj5UEEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _aPkroKbz_MT6bA9VuQgX5Q2ts7TPemE
X-Proofpoint-GUID: _aPkroKbz_MT6bA9VuQgX5Q2ts7TPemE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA3MSBTYWx0ZWRfXyyN/PaW7MXz+
 vOFC+IBjELrzJMCmHyoEL3ho1Tc2/twPina23IhXcQ5x9XJYhfvc5pwGKgrYZcvc7xnhQwvlWSm
 TTxRM97DHH5mcuNM2urtkEgS+DhwjS49h82DQ9KV/fx0cXVRNNXxFLhHxQTGPSOS1yZzPteJDTW
 2sLquTp4/hWZCepwNAqm1+gWq2mBquWOadXlULeYjmHwDJN58wWCR6+uMaf8sSnMcm9w+6eYwqU
 7P4KOeNZ76lvUSce4Ih0MHClzi5ZB9y4cnsfad87oCNfD/JVadhgz3pFUbptUvAwDYTA0ouUztB
 x0yZtdL8W34QaTalkPqMmgkTF/B3pt/ilGy5kj5lMO4vqtdno5ajf2hdl2IpOJmhCoKhwKmOaO5
 2/yw0Jpwzg/1kYOtljr4IfuZtsCEr1q1aR6NYQHrudrbGUNu3VI2tthjMi0KfGalISATa4tBir2
 5Q7GZpdVME6HeJalP4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110071


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index 02e100a4045f..f608a297d4a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
>  	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu4x_set_hwmode,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 7bba3b6209c2..ff0070c85ccf 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  	iris_opp_set_rate(core->dev, freq);
>  
> -	iris_vpu_set_preset_registers(core);
> +	core->iris_platform_data->vpu_ops->set_preset_registers(core);
>  
>  	iris_vpu_interrupt_init(core);
>  	core->intr_status = 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 09799a375c14..21ed4c9bd5e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -22,6 +22,7 @@ struct vpu_ops {
>  	void (*program_bootup_registers)(struct iris_core *core);
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  	int (*set_hwmode)(struct iris_core *core);
> +	void (*set_preset_registers)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

