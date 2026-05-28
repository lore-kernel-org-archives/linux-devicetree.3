Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2185328B56
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948270; cv=none; b=ohkOkdmFs7PYEgJVUJQhdN67sz+lb2V46y6MMWRvDeLlOZiMkl0FvW56/Cq+ZhtgYfM3rT+kvt/oHBwkU4mlWovuOHN0cE2FmQSK0LawAEVhGit5zurHh6OYuJ/zbOWmzDdnqiydAWYRgS4TaDtI7OXGy4k0Q3MdkWW48uXbxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948270; c=relaxed/simple;
	bh=qyL34sxEoMuBXeSfDHG+RvyR+Jjoy5L8ACobH5tEfaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOnZ6PZgj/xjYL7CnqE7qMfB/Iu+re/AuYD2jRwAg/SteM/SVP1h+5as+hdePFG6n3WP3VS07FRLWrQ4nFlho1Pu0NcNUwrE7aMcBDEmbxIXohIiUVoXHO/PVMWqnkj5aTpI0hjibbcIcSBd2rGJFHafz1Cw90V5ejVmBtUiGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCuXretJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/2BR/OB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCuXretJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/2BR/OB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKnJoC3010186
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q38iL/Kl5bsfH6U6c4BfPkvl
	nIA5GnSzXnuKo9Th4mA=; b=bCuXretJEbIsNR9VHFuRbflh+3V4Enl1z8jdX4ZN
	GpvInthwhIbtfc/0200eCrRGdEd/1DxP01G6a45JHL7yvwYMuubfC23JVGMrFryS
	2yzh8YsVFOBrClJHZEWWjXvT+LXT/gyKtK9qh0nftoElDC9a5PnsRRcXCH/Yo4m9
	KlKxfgs8JtMB6VIawLrYUaA6IVQr8udAIyPJwZaizauSFx/Edv7pwa35u0bR1uUb
	zNiLChVbPQhOHw6gdoBXn31i54cwWnbG+Br1u/6nQEbep5MLp27mDixyTj2bKJaq
	sOAGg7UvjZO46d9guC0EctuASXGido321IdQSlVTaZOYzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrhh8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:04:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516dd6e4ed4so120372171cf.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 23:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779948267; x=1780553067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q38iL/Kl5bsfH6U6c4BfPkvlnIA5GnSzXnuKo9Th4mA=;
        b=P/2BR/OBPdP9nRV2lFI8ChYt1welVm3zyp68WD4un7P/dPd1qCm0aRIG+uOD7QvwiI
         TIuTmLo3ftOTzRFN0cAcGwrXzMpX8xhf+Bg1tLdu7GvRnFFlN2j3UHpodX7Yt16Hgdg+
         IpH3LodXRMmbPdl5Eb5pT7JPqxRSikGbvAqpmLSKN/LAPLV9E3VS0nyZoMU90KWqlRpV
         GlvSHV3IkvyrSzGH7mio3FpEeXctOpbbBgRZsPpUUY4/3scVa9VdvBV1YHz1oMPhJoW5
         F5l1BqyG2bWlcu4/xrSrK6C91+hdm59sZ1wGTIAtPH7X/ZG0YxLR+fnMrYXl/qx8M3tR
         36GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779948267; x=1780553067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q38iL/Kl5bsfH6U6c4BfPkvlnIA5GnSzXnuKo9Th4mA=;
        b=Q+sX3fimPAdplPwWBUT6qhtGOVDrLu/srQxhET6BqCEhusrVyraXvPHzuYXp82G8dG
         IeE0ZMj2x+zbctYRWo+Egm5aN+2lQJoSDnkJzRQ7q6cWpbOUUWtS/CtjwYG0cKe38ZsF
         2kLaNXRlDxp2HItAstDba0ronRU+m2fCEeHQBOGAK6gsGvBMJ51Wv1qlVWfpE1XLSmZF
         WEOSYuhdm5owZYjbwghsB86CGPkw6SkkCY4x2sNJZ/UCNuak0wsu005mTALfY0ZUe6vH
         iwqRM/EUfrmDqkQUv0+xt09soHKE3m9hO0OJx9//uobHPsRwSxsVO+S03p1AwcKf7QTf
         l8aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fPwV9wP0c2aYS5K8dNv9P1rTe836xBUbu9TNfqU8bk1CXFUL6bWE7mgT9XEUE6VrjcPbl08AnFzJN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdcr6/rug7EsGWKBLHbxtqx6VDGzrsRV7ahM7l1D0CUBC4ZdML
	2HKe6r+2qJweiUXOYj/m02Ugy30uZoKYtASoYHYObTyuz5MuYP49ROgqNLI/LgWAkY1//0uuB1A
	neWHZfsNkPS+2VNLfodBPqA3dLu1lCW3A1CHZxxbYauadyZlaJr+bdNzio8msTlZL
X-Gm-Gg: Acq92OHsgSW9Zxl1y4JDcN3Ur1tGYErUBwo8JfyBCz1BVo1kEhFiIpW0p8G4oeiMNu2
	MtizXsxGtn1t6SXUL6vsHGk7Qe05cAITN840nJ6u6yaKi9cVc2K1uIcpYEWVikftQKtADEkzAzE
	R9EPrPq+Zgcn96cKIxfBzR5IC6fvOMH9KoVvsdtAxO60Wb294oLpoe1zvbFnlDzSCzpollk1wvI
	Gk6QtrMFpL8ZIXJk7jrVzJuAFrVT5uMEKippz6DxKBW5fhLvM+mjtFKJm3yOmq3PRzyhqcHU0Uq
	Q/SZ0ghi+jBYKo8bZjktGLBMTc3ZJMJQlGl2XLkKwr9kOxdXkOJiulylf53NSWhla2Z5jkEBE5b
	lFKOHeVfFSp48jGWVnbAje55+jgnDf67RRDHLuUn0pTPob35c9z8EgYn2xhUWFR4gaoR3oDl80U
	WiftizfgGjFoBHJlnMzMJMjbxXNy4RkOLZJbYT7+fyDmc8WQ==
X-Received: by 2002:a05:622a:494:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-516eaf9fb0cmr258205791cf.13.1779948267079;
        Wed, 27 May 2026 23:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:494:b0:516:eaf9:f6f1 with SMTP id d75a77b69052e-516eaf9fb0cmr258205281cf.13.1779948266455;
        Wed, 27 May 2026 23:04:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4632282dsm1710822e87.41.2026.05.27.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:04:25 -0700 (PDT)
Date: Thu, 28 May 2026 09:04:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
Message-ID: <iqydzm64gmzqei6sya6p7ntonrswpjcphubfnqyvabaaaiufif@ts7iuvol6o43>
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-expressatt_cpufreq-v2-2-b9b7726ccb6d@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA1NyBTYWx0ZWRfXxi/NhJCdJ5O8
 PjxfiiQvAdkESC8tFsYw2AJlc/jXZMYE6wGfbIyz7vsDPba0k4yBYGEUvIsBNvaAY1pAkYFhtp6
 lBlUmsc1ghTFp/6DpiZtZjacl4kkk99GGveDcU1L38duslHc0lhf6RmYew6mq3bwORXjqjo7qlL
 1k9PZ0Cn9ej19Esd8hBPZvXCaYXqNw/6RHvHaaC1EBvGT3kAyX56OHLzxy0351suXVHUw1EZxdG
 KLQkYgUDzOXuagJZwSd3Y3r00bHvgtfyY3akYtHul537xTOAcK7nUYqHD9rtQr2nU+heAyp66cB
 78tGOVO4yuEVUqC2s6FRq+QgOeBELQEkWeEbe0KZqVvPKYxKY5aaWgECwCOG/W46Ore8k0jy5dT
 Nb9QKW4KdyxZx0vxwns7VtGuivYutVZq5a+iQzoEaWV1VJaRjHonP+mvVEaQGw1VxntbAUETtA2
 s2RkMLbHXmMZSVitQFA==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17daec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=oA5LrNwOAAAA:20
 a=pGLkceISAAAA:8 a=uAGLYOZ0FLdk90Ey5qUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: ZTL7N4AUC0ZPgx-xLgx2jJqnn4PEuoJb
X-Proofpoint-ORIG-GUID: ZTL7N4AUC0ZPgx-xLgx2jJqnn4PEuoJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280057

On Wed, May 27, 2026 at 08:39:29PM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
> Add SPM register data so that the SAW2 driver can program the correct
> SPM sequences and PMIC parameters for MSM8960 CPUs.
> 
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L3381
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  drivers/soc/qcom/spm.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index f75659fff287..fb3ec8aa42b0 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> @@ -233,7 +233,7 @@ static const u16 spm_reg_offset_v1_1[SPM_REG_NR] = {
>  
>  static void smp_set_vdd_v1_1(void *data);
>  
> -/* SPM register data for 8064 */
> +/* SPM register data for 8064, 8960 */
>  static struct linear_range spm_v1_1_regulator_range =
>  	REGULATOR_LINEAR_RANGE(700000, 0, 56, 12500);
>  
> @@ -253,6 +253,22 @@ static const struct spm_reg_data spm_reg_8064_cpu = {
>  	.ramp_delay = 1250,
>  };
>  
> +static const struct spm_reg_data spm_reg_8960_cpu = {
> +	.reg_offset = spm_reg_offset_v1_1,
> +	.spm_cfg = 0x1f,
> +	.pmic_dly = 0x03020004,

Except for this value, the programming is the same as the existing
APQ8064. But, APQ8064 seems to have an error there, it also should be
using this pmic_dly.

But#2, both APQ8064 and MSM8960 should only be using this table for the
SAW2 of the first CPU core. The rest should be using a slightly
different config (at least according to msm-3.4 tree I'm looking at).
Would you please fix that?

Please make existing APQ8064 entry use pmic_dly of 0x03020004, use it
for 8960 too. Then add new compat (something like
qcom,apq8064-saw2-v1.1-secondary) and use it for the CPU 1-3 on APQ8064
and similarly qcom,msm8960-saw2-secondary for CPU1 on MSM8960. Feel free
to propose a better name.

> +	.pmic_data[0] = 0x0084009c,
> +	.pmic_data[1] = 0x00a4001c,
> +	.seq = { 0x03, 0x0f, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
> +		0x10, 0x54, 0x30, 0x0c, 0x24, 0x30, 0x0f },
> +	.start_index[PM_SLEEP_MODE_STBY] = 0,
> +	.start_index[PM_SLEEP_MODE_SPC] = 2,
> +	.set_vdd = smp_set_vdd_v1_1,
> +	.range = &spm_v1_1_regulator_range,
> +	.init_uV = 1300000,
> +	.ramp_delay = 1250,
> +};
> +
>  static inline void spm_register_write(struct spm_driver_data *drv,
>  					enum spm_reg reg, u32 val)
>  {
> @@ -501,6 +517,8 @@ static const struct of_device_id spm_match_table[] = {
>  	  .data = &spm_reg_8974_8084_cpu },
>  	{ .compatible = "qcom,apq8064-saw2-v1.1-cpu",
>  	  .data = &spm_reg_8064_cpu },
> +	{ .compatible = "qcom,msm8960-saw2-cpu",
> +	  .data = &spm_reg_8960_cpu },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, spm_match_table);
> 
> -- 
> 2.54.0
> 
> 

-- 
With best wishes
Dmitry
