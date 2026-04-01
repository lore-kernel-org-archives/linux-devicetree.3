Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC72224D6
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047058; cv=none; b=oTei0gUafpjqtMnbZFHH2Pn2b9Wxt4lVCK6YRqa9kV1VQdIVIcKB7mADtTLbWquSjZnCsIUHmfruRF2b809Sx41MGtAOvzjGS9ko1UwPHm4yYuOo7fGUc17jTDrjOhyLnW+AuY43EuG7OU32aWnd2RQBq13K/I9Lu2NkspWkqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047058; c=relaxed/simple;
	bh=TGA5aCMXaSAI8RMbhXiGZEtXoIu/pxzT+2wjOAP+y2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KC2dlvtaKyU1RXow9/ZlhncNFjVc+87kW45yQR/iTSg17siYCvhpT1lcTfpU3bdKm5HnYxlz3uFU4TzqKxLeB2D/Ep2+6n9ptyraD9DhF+lK2hze4+Lfq01G81TaJcZPjzlnq4h43F8UfXacoSrvZm/nDrb53m6VLV6HO2Gku2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxwuYgYs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNSo9Edl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxwuYgYs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNSo9Edl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171bM71285870
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=; b=CxwuYgYsHLutlCxJ
	i0HsKbQqmMAfzp3aWUZjYbxNGpYnRt4eSQE2lFqESpPVllQKabCsTJsicLZjyZeZ
	YGMsiXMmBI7pL9wb8qY4QkHhkTIKFB6ZFzEuJXPKu9xri7VzaFjFEuPm6sjTcFm4
	dQTKGJgzzSlS5JOg6CoFcU7Fy4ae9pUKCVyyz/EkltfwF1pb7FARAdfBCUKO3UvW
	mju7aICOlIOplUtJLZjCl3D3BXdT5RkNey8WWRZYi69C1jAuL9l3snEob8Mfeykg
	eRt4At6g6N2hQPCg76cah+D3hnQ4mOsyngsv0QD28FLfB8GUNdfR3Uv6BeYhSl4I
	RP3QKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3sa1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:37:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so39591205ad.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047055; x=1775651855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=;
        b=PNSo9EdlcAdR7vZTZmHWrHdSOaCUWfmDbFANOoRsV/IqmabxonxK0wc5iEt7j/fTdo
         OJZuLCqcHLbBYGS4jriaNpSw69blsGOhV/QmgvwBUCouHd0WcgFmJVdxj2j8oCy75HCU
         RVobL0ao2hfxJUhOReGiYVTXYvaekw05Mv73QzW3ARpkfMtIlxooBmk1s7KQzgB0LWH9
         WS6r1xdZczoSZrG05Xnu+BYdpAcGDUsORvlDpWD92nMthkn8oSIcpqOtJMX87WKrZKI5
         vjtfyH6JtTDUZmss7hQ2CICsH7e79IjPIZ3d9nNsJkvRReGTVbhBcxKTjR+EWhto0/w8
         CCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047055; x=1775651855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHmrayuupAbWR1nXTuc7V5jAOdSiiDscuyTOuUjPB/U=;
        b=EDT+vEZH9H9eE49wONB0NpUrA1lw87hCDR7UDptOgutbj9mHlU1E20OFjfRBrDaNwE
         BehwrDT4Yg0xFPcLJhyOyczf7BmjidM6o6YisakkL82Xo1uWA/MDaDgETdzDb8N3AWpE
         S/alwYemInUhduUIsw3gUwNkgVivitCmpEUBe2SBqnqad/HFY39Sx2D12ITU/emihpLS
         IeQ9RLncIVtPxcLi7/O56ieqiJ8voVSW4ZK0ZIbZRMfFaF/uSnRfQVGYVRq9jb7N64nx
         aV8dULmFH+Kcv3iiYaiZiebDIDzgLxk+UwjvH8lJ+Mu5yon0ohCBkSd8CEQ+wI4ct+cS
         Qgag==
X-Forwarded-Encrypted: i=1; AJvYcCUFd/I4vmR7O3r+znQVpCVc9L+xZiOSuydtJ3dnugwrOQolB4JnO9JPALfI704yPBanYjEkBZ/+4Rkv@vger.kernel.org
X-Gm-Message-State: AOJu0YwOvDf0NUwXIYbpHh+q3R8jDxT8OnTbxG1rHx3XS10YmnZP842D
	9R7B2w+j4Rt+m1rWe70tGMyxYdJ6ePEjcIfLA1+kSQm4Eyo2dexKpPpOqJjR1gz0xQ0rIvmgPHx
	BPFCIazXXJAUmCzvVp2TCzj5DD4ZOEhso4UdesDyb0ATFrNvouAuqhXCLZWfL5n0k
X-Gm-Gg: ATEYQzyl2bfC8PRwvUKT5esP4bQNqy+StdWOLnvCRQgUxPYwNph0M2IJ/WwUVFtsxW/
	0vcGADvrFy8dayejD8OuIfKIHEYE5JSYu3Lipx5y0VvyP14pDJNJWbvKFQyo7IJMafWbCQ2yXx3
	G9jnvqNEPqPYnl3IfzehLH7PqN1QNU9j1+cN4LVX5MH6QmbV6ku48b2aRlYRNfWqLm/FER1rntS
	/e0lgpH053aL4kKMWkuMyG/1FFT2KnxW10P2TUyrw745nHPqxgLSeDzE2fcKQPNplyFRtyndS8h
	GEguZ6yrVSMgX9JXAO/oDHkeNkoA5YygRvmijx7whUjyNATD/lR8lfoLViJdnohNmcRMsPctioJ
	Et5mFgWluyFysIhH/yOPJ/a9ZjxKgwmpWEO7Ki5Wzb+DM7UfbXILBaQ==
X-Received: by 2002:a05:6300:2189:b0:398:98f2:743d with SMTP id adf61e73a8af0-39ef77862bemr3431648637.57.1775047054234;
        Wed, 01 Apr 2026 05:37:34 -0700 (PDT)
X-Received: by 2002:a05:6300:2189:b0:398:98f2:743d with SMTP id adf61e73a8af0-39ef77862bemr3431607637.57.1775047053723;
        Wed, 01 Apr 2026 05:37:33 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e30dsm12438450a12.20.2026.04.01.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:37:33 -0700 (PDT)
Message-ID: <9bfaf15e-99c8-a98e-d0df-9df86872bfe8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:07:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd118f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dXMAQJrOHHfgTcScUBoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: sydc5ASlGz_xR_Yp4_4_EiPruQ3f8P2w
X-Proofpoint-GUID: sydc5ASlGz_xR_Yp4_4_EiPruQ3f8P2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfXzvWDJsYCEsW/
 aB0Dm8+xtVe9qyCUb4NbJGUHH4naNXJEQC7DkF6nEKprFmZsf7BbDNM78ce4DgudGB44UuZ2MQW
 7aPWzNDmQgTQAJq+/Q4+6exII4YjQSCSHraCTAWM7W+hujYvtuFrMCZ9KkN9lpM7Ooi2X1ZZzV0
 JCVXxCF10zbIFsFGn77dycM6WP9qREH+jhmJigkXp6EZLBHKBKudcaixEUkP05pz0DYtoV5kULe
 SQPR9EHMIXchPHsJWO61YNoZG7Vw7qBcg2nUxvCPBAlPh4poZFDledIHL8zrLli3MK2YouyMBC+
 85hwORbkMXibu3yrU3vu683aZkiLHIbYb2aFLm3tm26vEemT79Ihp5rf55RwhrztgmJeZTBHh1p
 otM51bSiqkC9Hi6a6G2nfHd2dnpFpkq2iD/G5UKMT/fM/1IBVP3RU0bLGcaQRf93h5YPKH6nIHh
 yel2+hMbxTSRs3AeD4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	iris_vpu_power_off_hw(core);
>  }
>  
> +static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_bse_hw_clock;
> +
> +	return 0;
> +
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu3_purwa_power_off_hardware(struct iris_core *core)
> +{
> +	iris_vpu3_power_off_hardware(core);

this will eventually call iris_vpu_power_off_hw which would try to disable
IRIS_HW_AHB_CLK which is not applicable to purwa I think, will that not
create any issue?

Other than this, change LGTM.

Thanks,
Dikshita
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +}
> +
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  {
>  	bool handshake_done = false, handshake_busy = false;
> @@ -268,6 +306,14 @@ const struct vpu_ops iris_vpu3_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  };
>  
> +const struct vpu_ops iris_vpu3_purwa_ops = {
> +	.power_off_hw = iris_vpu3_purwa_power_off_hardware,
> +	.power_on_hw = iris_vpu3_purwa_power_on_hw,
> +	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +};
> +
>  const struct vpu_ops iris_vpu33_ops = {
>  	.power_off_hw = iris_vpu33_power_off_hardware,
>  	.power_on_hw = iris_vpu_power_on_hw,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f6dffc613b822341fb21e12de6b1395202f62cde..88a23cbdc06c5b38b4c8db67718cbd538f0e0721 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -10,6 +10,7 @@ struct iris_core;
>  
>  extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
> +extern const struct vpu_ops iris_vpu3_purwa_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
> 
