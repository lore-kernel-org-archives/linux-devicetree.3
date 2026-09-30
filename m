Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F54DD3BA
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773297; cv=none; b=R05WOx9ARCPHMmOiwHGFKkEBm9KIRqsyfTt5WkUyZcJJKAwVNcMLSkVyOwv51OBO7MIW7wbIEPPAAqF3i72nrTSKtludPXbiHeYaOKsuHRTWxewLh9fTv5+576PRRuKaE8veRkkq0BJKhqZJAfMLyuAlp4EPdTa7BdwXDDKup9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773297; c=relaxed/simple;
	bh=OgRnPYhG5RVwco5xDgzPiijMOeZA+SafNb32PTzmQ4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sU+HkG8amGROs/DUVdZCYbJp/EV66SIgK+oD/NkPoIuZK7xVk697WYg+5v/j/OAHrhlzpyvicq1nLwA68x9zU/PR1J6KtMidZwvJekDkQzRxsN/upI6sOiCX7TNP7TZ5yxXRlQqbpn+FsmdvRCRHMPfy0gxQgyPuJXQJb/S8cwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxAhCEIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvMAmeXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxAhCEIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvMAmeXr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7cmI3547325
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=; b=pxAhCEIU4tZ8CeCj
	naQmxTO56CJPNfJj9QnATe0w09h3VhyaCC4SdQhnzIUSSdBppDFBSff3DD/zhGCW
	JpZqDB5xFc1T0D9cOnhjDIrLUzics3v+qFJx85RlZxhw2dcaQYB0UMTxuVGVJdze
	sI4d07vwVadMJBMe8r/rwL5g5f67FZwpE4uiTaH99fFXbKLfz3mIySBTVkS8Qc+U
	S3SSYh6kkRK9aolda720cqUrV7Exvi/+M4fPJl4utrJcxiVJEA4ymYGHxsKueUMC
	VBF89E6cQvpxPUV7ltyutk5Pvob8bxyhlAKLctknciYOhdH38jBBlbcSwX9j1k9i
	20269w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141p66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:01:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88551591365so1313105b3a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773284; x=1791378084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=;
        b=bvMAmeXr8Xc1Wys7eYLMSP/TsKi20JLbepwMmRxuMh/NOxPW4RPxppNVphG9zLm3k9
         jk2T+flcc2j2+LdvzOr1L9/4V/heHmuFhkYHIubAApmKFDPxdtuW1zFpwFlZtRnTQvYd
         Y+7gKkKn3pEwQbafIrdELaFyDUEmvPWlAErPn06nNZdR1wTCVXCRQIW3uH39v2F2ctY6
         qN5zcyUKMMn6c084qNirkr1VnK9f2LVxw1qBI8WLUyr66hQpdK6NO9kQfdkZ5zewVoHP
         kLl6p04o/a4LmE3Vs540LdmkmrsmTsGjbZ/1f2EHqOVLfFPVr89MnigjjwCFx+MirkLG
         APjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773284; x=1791378084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=;
        b=mevIJ1rqJ3C2owMOc22nrNRQbjuVkzDh1zoJBkwBNRsuKsIr3fHrKkebhaMVg6WMGQ
         T2HtlN/L9eAA9LQC6CC0+fWV1Y3zymzywhAq7LOQRTrH25lpFY9pAevomDhvcs6or1eK
         x2tYdFgkX5zdrDwyOGoIDs0nj9YMVB/DmVhvuQ16txmUNXse4r58GJ4aCSXsXlYk66Ye
         pFSxbSSdWLEGAcU54mPQ4muOoRgy3IS6rPRvYiwohvhPJPkxZxuZs+nbjFpoVEdGvwp2
         c1Maau4dRDIOBRH7kHxmpLqUZLPjbHXEpEXhgM3fFVBMzDLcxdDlxrxgr3CaPv4GGjkN
         NKIA==
X-Forwarded-Encrypted: i=1; AKwUvBw/8yigl9sVrPUOCGqnea0LTfyezuCzYo5Pkr9tytwZzpxHZmm1nhZa33GDyU6Ivf6whtHLOT5NKPhP@vger.kernel.org
X-Gm-Message-State: AFuF++lNjVUerbIxK7lJKtU22ARTxI5Esq3WO89nYjxSJSpNFicI4aCw
	pBKOHwm0rcbzWcUv8JJMEkjmRK6n4iMK6TE+gMbI2pOWWNxEhxBWteQQShDYCLV5GsPwwsObcMb
	TJfQWIZRYgf1It/r1KcJF4s8mJhhuhZaMPkSqUnYSxgQZW0d+NYsF+eoIcX2XFREh
X-Gm-Gg: AYBFou0imrJcm35gA8/1Az2Y5/M5N+qKr3Yo5tLBNloF3YncTfBRjeOPz1Sl89zmpj0
	fOux4aOdlcx3L20iFaBKAOpkoQDSmRbK3+RRLpzEHXnMw5yZjVwdKzUnEmAyJO2s+LyJwFrHQPS
	fEYhvdEycMPc+XDhbild7MmTGiEH6ut7aX9Ggh4ukCWZEVn2ttu0vZDyfPX43N8ljg/1wsCxRLw
	9AX8Wwwe5PhmpOk4ix6G4EJMIF/zusG9bMjlB/Z1bqKZGnWcypS38R706MymcCDOOJlpJYuiSqs
	ReBtTCOzketeI6+GPpnJ80ifYGYw0OuIHobgHcZUD9BNyWuJDpAmEftm1/r0AJwkiNWGeWvWH7T
	4NdighfJ4xSsTYiiRptO8dxCwsalPaVaG+tqBHwjgkdZrW9nP3lurQ0FPHIyYRtQ=
X-Received: by 2002:a05:6a00:2d0b:b0:872:a4fa:381a with SMTP id d2e1a72fcca58-887514f9b60mr680663b3a.2.1790773283736;
        Wed, 30 Sep 2026 06:01:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:872:a4fa:381a with SMTP id d2e1a72fcca58-887514f9b60mr680633b3a.2.1790773283190;
        Wed, 30 Sep 2026 06:01:23 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88768954f4fsm567114b3a.56.2026.09.30.06.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:01:22 -0700 (PDT)
Message-ID: <76154416-bd16-4721-b7e8-035aea1457a0@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:01:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
        robh@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-5-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061712.083BD1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061712.083BD1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfXw7QCB0sYMntE
 FF+JqhG9sXC4q6U5H43PNTDHMWc2dZCm7v78YcoL2WL4ZIxOiwXr8KDOsbZPJj79D572BBPk9V9
 g1jQrD66khT5py0044WW6kVp4B7QOdU=
X-Proofpoint-GUID: -FcRe3DWkHVcc24ha6d9hr7kaHtx_teb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX3JYdhIsJ/6kk
 k6GSWfHAVAsoMXQkGH90rDfov3AEKSRKzKwz03GIuAuQ9AQ7DxJLKPLLjpRjuMH9Uh5dspFDpek
 sDwVQlQORxAQL1RTabMyXQqlzh48/SXOqDbOM8ijA5JgATHc6zX458hZZsFXtjXupI68Pg1xzBF
 o+vErlT8rT47qe+iktQtRf6GRPf8oJviFB8Xokk/zhoWBgVvXVxLZZPddcfQ2ATx/bvetOnNQ1N
 72mZRBuqYdsdKjdSXL8Yx9XtMenM5VodgmGP9BO6Ujpy+bk4kYdGvBuk0XevxFLPx7ojxf4jeBw
 prMa6+EQk3DC+eAi4gOLOBcUaILZ1Z2/YHechmxITjh0aZAM/PyYUwFqmhjKwImRpAor+d6u+f+
 ygIxYWtMsVEYynmMFYWJqpLYbJTNum5x5xo2Zk9qfrzOFF+Oi813hDJu7xNtdoYboB4UPFrvBME
 gocA3T941DfwfgK6GiA==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd0824 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_s29Hk9VdzetE62z_GMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: -FcRe3DWkHVcc24ha6d9hr7kaHtx_teb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] media: camss: guaranteed NULL pointer dereference in msm_csiphy_subdev_init()
> --
> 
> commit 3c87101a27e8d1c1d3a64a10ed465e1ed433c549
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
> 
> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
> which reuses the x1e80100 lane sequence, clocks and supplies but selects
> the v2.4.0 common status offset, adding Kaanapali power domain and
> register the "qcom,kaanapali-csi2-phy" compatible.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index a528760487bd9..a0cd839c9948a 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -34,6 +34,57 @@
>>   
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>>   
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +	/* CSIPHY0 */
>> +	{
>> +		.csiphy = {
>> +			.id = 0,
>> +			.hw_ops = &csiphy_ops_3ph_1_0,
>> +			.formats = &csiphy_formats_sdm845
>> +		},
>> +	},
> 
> [Severity: Critical]
> Can this result in a NULL pointer dereference during device probe?
> 
> Because this Kaanapali resource definition completely omits the .reg array, it
> implicitly initializes to NULL. However, it still binds legacy hardware
> operations (&csiphy_ops_3ph_1_0) that expect MMIO mappings.
> 
> When the CAMSS probe unconditionally iterates over all csiphy_num entries
> and invokes msm_csiphy_subdev_init() for each, it attempts to map the legacy
> register space:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
>      ...
>      csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
>      ...
> }
> 
> Because .reg was omitted, res->reg[0] is NULL, which propagates down to
> platform_get_resource_byname(). Since Kaanapali defines other named resources,
> evaluating strcmp(r->name, NULL) with a NULL name argument can cause a crash.
> 
> Does the standalone PHY need to be consumed via the kernel's generic PHY
> framework (e.g., devm_phy_get) instead of retaining legacy CAMSS ops that
> assume direct MMIO control?
> 
> [ ... ]
> 

Kaanapali use the re-arch CSIPHY framework so that the resources like 
register, supply are now handled by a separate PHY driver. We don't need 
to declare those redundant resources in CAMSS driver now.

Best Regards,
Hangxiang
