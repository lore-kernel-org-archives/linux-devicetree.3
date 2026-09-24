Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCD3FBB5E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222293; cv=none; b=EQ1d7Sso0K7uiIzViEPL7lwoOpwcr3/00Yr/T9a8hQuGmfPIl9d10FL+e6uPmbMCEImJdE4pz85ROYp2TkFkme/i0g3bCwiQbAPE5qhWJDh5Sr7taDOXJONx4ivZxFxe6ew3ZxioNsf5E/0YROxGBRv6pTo5klYJHh0CmymxiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222293; c=relaxed/simple;
	bh=uulX5FGojWJSDtZc7ii0G+XzCHyxRxCELQ1PGoS8gtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi6hNukUp6qTLLZCfI9EKdEg9tEhbqKOtD0YK6BpwRXBpSpEJxHsijjP15JPuNa6cljfKBWRQRmvFwR+hD3Oq2rd1sSxo1/jTmcS+2q+r+CnYQ56bEnRQlvTexCd3vsur7oNZR+DP2YhUGDnQWbEM/FR0ATpXUnqQxaTVtMbCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ulvq1dS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJV2ummp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ulvq1dS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJV2ummp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36p1Q1953159
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=; b=Ulvq1dS5hG3t0r69
	LPnsC/asfEOyowRlKcpvBzpihFsnx9obj/En5dgaGggMsxtJ9md9qCnL3dOkJNEw
	2gEumHzN8BnKsqRrV0dyYDQAVyoz1RxgTcFFHe7+/PwCZmteZFB7SFif447CSG2n
	JIAFF5Nt7sYN2QH12vk+X6qqe7gS6GVFBcRNuJDi/hJ9FDoZIFWr4g5vWTsplsZC
	CNgYw/gs4FsOcEhg1+0gVvwyg23jVx2/k+jyo62IyyWRpfBcCEKEHh4izOMZGzmZ
	BpqCT32iLicCi1o0L5e8QCPSOMQiKlsBWKGDMHktndwtnlrx9MqDpFck7HF/h9Eh
	ktY1Ww==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxu4vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:58:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso697476eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790222290; x=1790827090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=;
        b=IJV2ummpAmN8fB92RX9xJE3XxNpp23mBTg3Pv1utQxnbc+DCQksmGtcJLBEGPnAo4D
         IZK1CKrIyGORD+wILI0TjSIgFDfOMiAXvC4kimyOC21xTyUlcKZZ7LWFxAzoXUq6nSGB
         GAdh4XyygZghU+khpLaMPL419TYhe7qVfZIiZea2MPx+ymqdMXm7kD1InWrsKCdTitJ/
         iP//3qk7Bx4x5VMWRLQH6hcf8PR4nzfDBJqAMWmyIXAvgFLf0BNeVHw3bI76tOcxOXxR
         SUVGFrg4QCVLsXpb/ygi6onjfX9Fxy4L124gAWkhA8qrPAw07nW+Awa7hk7zvRv+HbmD
         vgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790222290; x=1790827090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=;
        b=mGP/whGzi5qsVOdLQHZx9Ux8EeleeWQwwy32AEc4rFjyf0Ga2XE0xrXCq+8Ns+orDp
         4Mc2LFMozQzxS4w/vDbTjWAO2jfw85GAx/CLZEFe74vnW496JJvbIryThGGoxFVDIHOx
         3XNgj9V2Gh0x2T0KG/XqnTHpebSdx0hWbVXTYGtDlmpyokYANSIXyuXvr/2vkuntWLtw
         ce+B2U8uffZDiJwPIz4u3UGSXpTPWsBHBz/5pZLgV/SsZl8/A29YInyeQtv1ArS1HVfQ
         IetQwLz5XMlyEXX/u35txqtksdwoQTeVuyK069RIWET2eBdhrdJ9ECHAz0eIY3JC0yiv
         6+kw==
X-Forwarded-Encrypted: i=1; AKwUvBwdp+ON4ibwSPDTGLfEl/uykVILEhWVnn1sPZo6zAlAfJBDr21ZCHm3mLhy9oCfnGjEq0M6QsQhdVax@vger.kernel.org
X-Gm-Message-State: AFuF++lnUHuEELibwZMRAEpUQhRgeStb1Eqhczj9/QFVGMa6294jiZjc
	TnWI1N1M7MSkysca4qe2Ejpaw+X2doSB7QeuAD73XXZfVS1i+xxpPZRTkjhSSVG2dBSb+r/dVVR
	KcFb98Kt2Fu7cNvrCosi6hhc1uf/DbDzvPYyZFcc88bxfWY12FLAXFVsnR5vqAO8u
X-Gm-Gg: AYBFou2AlZKxO+8GbdbOAwG9mTr3VK+TWXK2VYtDOGhaB7phS7JdfOgvxh+ANDncGGY
	bIjU2qWKWWbzzm+eijEr3crVQM/yMK0n45AQjs9qn+AsqIE4LhPau6hU++LIKxi5ws2mhK20Ak2
	uc2INuWJh4cME1KbCdIcLKgznen1peTGQO328ES7J0abF0r81RgKGS2Rsf7ztWOAc7j/e+uNhdu
	mJOwa5aVG8Qv7I078j16bexCRpV0MW9RXseguITxDOnNc5+zx06LaxD0p6sVjIAFzLYAkC1UjxW
	8b1c1KE3R9FnSfhYkE2fA6vzDTJH5BLMHQCZBCGoerUAr7F+xt9ZbOVjjdLbcldqiajI0XkpUMK
	yP0BL4Blr/ghcelBnmpYg0/k5jjpgAy8=
X-Received: by 2002:a05:7300:c019:10b0:334:7f2a:1188 with SMTP id 5a478bee46e88-34004d8689fmr994534eec.14.1790222289891;
        Wed, 23 Sep 2026 20:58:09 -0700 (PDT)
X-Received: by 2002:a05:7300:c019:10b0:334:7f2a:1188 with SMTP id 5a478bee46e88-34004d8689fmr994517eec.14.1790222289134;
        Wed, 23 Sep 2026 20:58:09 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm11090061eec.26.2026.09.23.20.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 20:58:08 -0700 (PDT)
Message-ID: <9b39dbf2-dff6-a2ee-0164-03b82fae4ae9@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 09:28:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: byY1p3H9IQW_zCjkYiWFYUqGlBo1jjmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfX4AQiyB/4BZvX
 CqSgro2NCjLBsFHzqClHnPr1rKiSCB9KivMk//XgSBHu8be1L/SEtL4LI1giE+0o6D8ZNedxZTJ
 +Yf2zKXj4GOsCqTkEuOexHw2X00ULnuF2vhw8q9BEcMi05bIcTcW4A4BKPzi/ltMFusetMRA7/x
 wOjGXRSzGMfDeodS8h3d6yQTPeKg5C3hy4dAjFI71kR5MSo7kde7xdynyHamIR/854BpvO1Gr4h
 2b5peJCUzkQg9BH5WMrIXaRqRwqIKzKXOD/ZQ8kbrf+ityXyjXf80fMhCmBhgk61EAc46HeBnVb
 qmk9iJZQLHjlLdVc1XeLuNDXECDNnn4cLSlvJWXIYXU67uR7WwMUFII9DanGvKkqHnQXi/KIqgQ
 qgD4wRubWDrkf4IN4kd66lYTaM7PHJ4aT/zBV031WYgidqSnUm8SlDoodWxLDiwuiv4xoU0RmSK
 B+FjNf00Q4vcCMKHAEw==
X-Proofpoint-GUID: byY1p3H9IQW_zCjkYiWFYUqGlBo1jjmM
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab49fd2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JaYJuxMhrG_Ych6-DJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfXzk4z8gWj+xSl
 HF6h0vmyV57czVSkwxIBY3piXTgnQ2fembiQdWTCU1ufmIz95E8LmGGndwAh9lV7Nx12bZKTdsE
 wq3onRXYv+Z8PhAspwiN2noOfNzhPVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240017


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
>
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>    descriptor when present and attempt to load the corresponding
>    firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>    descriptor is available, retry with the Gen1 firmware image.
>
> Loading and generation detection are split into two steps.
> iris_load_firmware() applies the priority above and returns the loaded
> image together with a candidate descriptor. iris_detect_firmware() then
> runs only after qcom_mdt_load() has succeeded and publishes the chosen
> descriptor, so the driver commits to a HFI generation only for an image
> that has actually been loaded.
>
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the candidate descriptor is only a
> default: iris_detect_firmware() inspects the loaded image to pick the
> generation, before authentication. It scans the memory populated by
> qcom_mdt_load() rather than the request_firmware() blob, so that a split
> .mdt image, whose version string lives in the .bNN data segments and not
> in the ELF headers, is classified correctly. The firmware is classified
> as Gen2 if the QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
>
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
>
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |   2 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 188 +++++++++++++++++++--
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>  7 files changed, 188 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8c335dbfce16..676baa8087a8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>  #include <linux/pm_runtime.h>
>  
>  #include "iris_core.h"
> +#include "iris_ctrls.h"
>  #include "iris_firmware.h"
>  #include "iris_state.h"
>  #include "iris_vpu_common.h"
> @@ -85,6 +86,7 @@ int iris_core_init(struct iris_core *core)
>  		goto error_unload_fw;
>  
>  	core->iris_firmware_data->init_hfi_ops(core);
> +	iris_session_init_caps(core);
>  
>  	ret = iris_hfi_core_init(core);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..ea3b3a9793e8 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -14,22 +14,175 @@
>  
>  #define IRIS_PAS_ID				9
>  
> -#define MAX_FIRMWARE_NAME_SIZE	128
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	static const char *vfw = "vfw";
> +	const size_t vfwlen = strlen(vfw);
> +	static const char *vf = "video-firmware.";
> +	const size_t vflen = strlen(vf);
> +
> +	for (size_t i = 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found = data + i + mlen;
> +		size -= i + mlen;
> +
> +		/* vfw => Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;
> +
> +		found += vflen;
> +		size -= vflen;
> +
> +		/*
> +		 * video-firmware.1.x is Gen1.
> +		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> +		 */
> +		return size >= 2 &&
> +			(*found >= '2' || (*found == '1' && found[1] != '.'));
> +	}
> +
> +	return false;
> +}
>  
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/*
> + * Load the firmware image and return the descriptor that was used to pick the
> + * file. On a platform that provides only one generation, or when no DT
> + * firmware-name override is present, the returned descriptor is final. With a
> + * DT override on a dual-generation platform the returned descriptor is only a
> + * default; iris_detect_firmware() inspects the loaded image to confirm it.
> + */
> +static const struct firmware *iris_load_firmware(struct iris_core *core,
> +						 const char **fw_name,
> +						 const struct iris_firmware_desc **fw_desc)
>  {
> +	const struct iris_firmware_desc *desc;
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +
> +	/*
> +	 * A platform may support both Gen1 and Gen2 firmware; which one is used
> +	 * depends on the firmware image installed on the system, not on the
> +	 * hardware. That installed image does not change while the device is
> +	 * bound, so the generation is detected only once and the chosen
> +	 * descriptor is reused on later core bring-ups (e.g. after a system
> +	 * error recovery).
> +	 */
> +	if (core->iris_firmware_desc) {
> +		if (ret)
> +			*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		*fw_desc = core->iris_firmware_desc;
> +		return firmware;
> +	}
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name = desc->fwname;
> +		if (has_both_gens)
> +			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +	} else {
> +		/* firmware-name given: iris_detect_firmware() picks the gen. */
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +	}
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	*fw_desc = desc;
> +	return firmware;
> +}
> +
> +/*
> + * Detect the firmware generation and publish the descriptor. Run only after
> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI generation
> + * only for a firmware image that has actually been loaded.
> + *
> + * The generation is detected from the loaded image (@data / @size point at the
> + * reserved memory region populated by qcom_mdt_load()) rather than from the
> + * request_firmware() blob: for a split .mdt the latter holds only the ELF
> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data segments.
> + *
> + * The descriptor and firmware data are published exactly once, before any
> + * session exists, so the lockless readers in the ioctl paths never observe a
> + * reassignment. Later bring-ups reuse the already published descriptor.
> + */
> +static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
> +				 const u8 *data, size_t size,
> +				 const struct iris_firmware_desc *desc)
> +{
> +	if (core->iris_firmware_desc)
> +		return;
> +
> +	/*
> +	 * With a DT firmware-name override on a dual-generation platform the
> +	 * image on disk decides the generation, so inspect it and switch to the
> +	 * Gen1 descriptor when a Gen1 image was loaded.
> +	 */
> +	if (desc == core->iris_platform_data->firmware_desc_gen2 &&
> +	    core->iris_platform_data->firmware_desc_gen1 &&
> +	    of_property_present(dev_of_node(core->dev), "firmware-name") &&
> +	    !iris_detect_gen2_from_fwdata(data, size)) {
> +		dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
> +{
> +	const struct iris_firmware_desc *desc;
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
>  	struct resource res;
>  	phys_addr_t mem_phys;
> +	const char *fw_name;
>  	size_t res_size;
>  	ssize_t fw_size;
>  	void *mem_virt;
>  	int ret;
>  
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> @@ -37,9 +190,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_load_firmware(core, &fw_name, &desc);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>  
>  	fw_size = qcom_mdt_get_size(firmware);
>  	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -53,9 +206,14 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  		goto err_release_fw;
>  	}
>  
> +	memset(mem_virt, 0, res_size);
> +
>  	ret = qcom_mdt_load(dev, firmware, fw_name,
>  			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
>  
> +	if (!ret)
> +		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> +
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -66,18 +224,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>  	int i, ret;
>  
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>  	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>  	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +251,7 @@ int iris_fw_load(struct iris_core *core)
>  		}
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index a9453d539fc2..974809509146 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -292,11 +292,7 @@ struct iris_firmware_desc {
>  };
>  
>  struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>  
>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index fa5bb143158d..bbdbf21961d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -29,6 +29,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  };
>  
> +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>  static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -100,7 +106,8 @@ const struct iris_platform_data milos_data = {
>  };
>  
>  const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -129,7 +136,7 @@ const struct iris_platform_data sc7280_data = {
>  };
>  
>  const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..74626b35d9cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>  };
>  
>  const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   */
>  const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>  };
>  
>  const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>   * - different num_vpp_pipe
>   */
>  const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 81cccb756b94..5db6398433a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -253,8 +253,6 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> @@ -273,8 +271,6 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	iris_session_init_caps(core);
> -
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 1c052ca235be..84d70beec350 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

