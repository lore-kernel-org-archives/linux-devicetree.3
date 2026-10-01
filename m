Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1863352C54
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829036; cv=none; b=nFkm7lrEbVfsGSi5NDOt2y+2bFNQcyjP3iiCpefDf8ltu4OQMs6bxWgeGIMAhJ/crgbVVJKFv+xDCSA19nGx1Qk0HSQ9pxUsa8zWCEUCXGHEqdhloNB3QULYY/8wmdc/7YLyLJmnfXPYVOPyySTO0sU0Y9yBNxyKsimQjKOyVK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829036; c=relaxed/simple;
	bh=A+HAuPGVEEtFzzKIx71J1O6XHYUXXh3Xiiqvz/WV3es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmaP/v0xS+TCAd5OSyk8zFGnt4DSsttIFMPaEUs7wNTQSQt/zGjn3m3EHh1DdFCQ5NoG61tUabxS/WK3posxTAjej6Nt/AlyR1Kw/xq2WEzLqEwa8nEAr0wkNvyxcvTSvc/FhaFdNRc/dIfaFsIbMoVBYH5k4HQzJYkLTHi0xp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2DLjMEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Og0WSxhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2DLjMEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Og0WSxhW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gGSM542196
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 04:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=; b=F2DLjMEmYfSjhk2X
	dxrAswtz4KApnEFFKw39luKImAWqHKPw4tEggoxkSQhe5gP1yTsW/CxVO5ia0mSS
	Qog083o9xcs8b9kX4d7rZL6w2QNQtXvUuCXy4+c0Vkonl94yIfIldcQy6fQo/JOX
	SM5rQjFR7kg+zHYxvflmKBlQCZTF4i20rHBIoeS5HvLRym4rJrBkh/xWP2TJzIjQ
	pMtnnDVrNqaY6/7CIovA8QqshTP/hxGxMJTQUibQIU1m3l4Q09Rt1iCLvbqctL/8
	UuPyF9a5HEGDS4tp8SG7l5TsB/Tc3jnedS0dNeHnqLI0KSjHxhaUoILd8oWEtCv9
	BnGiYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wct670-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 04:30:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso4061438a12.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 21:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790829033; x=1791433833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=Og0WSxhW/ttjBRdrz3WxhCr+IikCQk2wXDODG1bBxQh+mOf8h4L57UuZksweD0lrmL
         IzkKL1VLbxlYRMiUUydzzb13ak6K1fphOaBCIjHXtVWNTXnOy7QRmE+B2ooRuDppJ2eQ
         EDfKQYI4bActl3vHsDbNwcOghQbTtz6M1VFT9lKYxBkoy7eT5yTHwJf8s9XBxjgBnMh5
         +SjKcRjDxev8A78Xcj3oASmSCrJss/S0kIVl8PTlABEzYJb5jmYBIOW0apklI+KSJMdX
         OnqOM4i7lyxcQj/zKly8HIYjjEOpit2Ez4kE6pZEoZLHkWsN4E6fHLa4k/l2jrpiG3FS
         i+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829033; x=1791433833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=Oirtak+AQAF99RDS8X0qZQ8Sp0FfE56GALuJOWUWxzeQsCXAyA6rRTWf4ykygdVvuo
         OQZTL1jn0I+34i9YectgMufyJT5vDkAs19oMrnsigZskHqS6HEplvoYb8LxtqMS35LN1
         +KUE+0ALnE0g4as65s6CloOxL5ZumKt+ZEKZZPqoLCSU6bTmbJXOhQTqVXQCfPNd7dIJ
         z72iqhEVyGM25GCcoxGVIF1wtv4Qy7s2chMaMgs0pvsRaS5Dr6VUCZJHlLyrnleLPW4G
         UUUIpNX43Y6MtVrlUG/jOEZTvz4KR2n02R25CODGB/hSEtDWxlJDcWFE4NElD0f2BonF
         WaoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZirSjs620ZepXHNmCko8Wwddi+ssLkBMe9ofZHPuSF+s9Ee53mUwrkqZcf5UHzHOcYdRvWafHwHhs@vger.kernel.org
X-Gm-Message-State: AFq9FYIha65RBYCtryW3jpjhaPlmNC8Pw1jR+YgabSWRynL7ogOxImcw
	2bnbwblDwTpIJC4iU91KydraBd8yY7ZDZjYxoIWQL1yORIm4yjt3om/onK6SK1h1K10Hn479x7L
	cbKgIFMccg1E3Wra6dG6Eh+Jvd1m+WHdJQND9bXURnSw+kxOdwlnL4DJKY1D3BGsL
X-Gm-Gg: AYBFou2QBX05XP8nbFoONPkjfHkB3vSOy0sElbhiT2PWsLtd3CeF9QCDDWT5e6Oz+AI
	CwURbKlg7Wp9262cx81HAfc71khwMatIlyE2YHA5LH5PIewFkGhbHkY1s+POdrAOfCripXfq/sL
	MS0Fh6BKzgD/LTkN8+Gat6VywOI0CHJnJoKU5GBkZcGRNejVtSUMu77eBv1aqR49oiLkQe2YSoC
	1OpOgSbc1dtBUu/6T1OEQGj4HveP6mN+FH254N4ux20yDVi9Ecza6AcL1JjuF6zJRm8C53OrwGH
	NMwAjLD1L0UN1JgnCx625vkPFtzqyBgmvOz1jEB3T5hl4zHh9LQItvrkz096oOkZMfPJaVMWpIr
	PawPHcVHLB93S7ZkBmc61ooV68mahXw==
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358387a91.67.1790829032495;
        Wed, 30 Sep 2026 21:30:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358336a91.67.1790829031165;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4372f81sm2370864a91.4.2026.09.30.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 21:30:30 -0700 (PDT)
Message-ID: <3b766c9e-fcb5-49bc-9238-48caa085b5a5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:00:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling
 support for Shikra
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX3le2xeYIRpx1
 AnCr9zQUyLOoFal/mH+h1zEUNoc6zjdbro/XPhfm8ifwsBPIwL+KQrPkSIAkrkZxZij8SzxRNHt
 DyqLCJKy4kDvDSRnQROX31COHqvTjKCYUKyoy8Pn2B3UMADGo+StsSawAsp9x6PykxaJRoxbxGp
 5g+e9olslvx3kZWPgyIuu3RnY/jsQ1oG9vEZoHsJFCADb+gbZ7nXweakiGkU2ncLvYiY6p3V6lp
 sHM+hADsaZ74ZFYjdZb4CJWcgvkV5HJ8jR05ki+nZcnSJYGw9o/KCwKjequ62S9byckNPuG0o3R
 +idoR0R+ksKX/crvooa8Qj/pbVEsheQGW8YoQWDgKnkeo6l31EEY3yLwdcqNJCLSuapCceqNCy3
 bgShB+wrv98ZxX+cIqBEE/jowWSdtekzZwDltIxEQpKvATCeV0XNQOgbvIeWmonKnKNQlnGd0ed
 +NonmbxiMsurvW4cviQ==
X-Proofpoint-GUID: zHynMjTBsuSh6428elSr31FJM5295p9q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX17FLXc3R7k7M
 SMQXGJHDLSC2wTnY65sFRJqZG9UkkAMIhK2bQRehPiY1+XuCjveff5EuRo8Qoi/2vQRygyRhfwp
 vsLDmnk+xZT1BC+AO23mKfD7T841KpA=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abde1e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=K35ozmOADcEJOmzUQUIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: zHynMjTBsuSh6428elSr31FJM5295p9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010017



On 9/11/2026 10:33 AM, Dipa Ramesh Mantre wrote:
> Add QMI TMD instance IDs and cooling device name arrays for CDSP
> and MPSS subsystems on Shikra to enable thermal mitigation support.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..3daaed6ca596 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
>   	.smem_host_id = 5,
> +	.tmd_instance_id = 0x43,
> +	.tmd_name = cdsp_tmd_name,
> +	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
>   };
> 

Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

thanks
Gaurav
