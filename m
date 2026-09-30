Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4FC4C9DF6
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769223; cv=none; b=ZUJpfI8HZRRREioI/4n8Cqeq1FjAvLUHsEcfdNx3ffxanUKIX1tCuwqKsnGKtxn5BccxSqOlf/EfO5UVhrMwW1/qRu2fbp7EH0DNhGbRGlEIiGrobR+xzXEcy0NfqP5pifX9E/4PNZnjKM9dyBo5HyRzdiURZZvZj9zNbIt3YW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769223; c=relaxed/simple;
	bh=2cnELlXD+d8nHeJy2IMCMnOpquMq+7sdSSGzFyMc2Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9VuqNsOyZxM+6OancpQ6V5cWHtSKAlMhZuLVxAFx84FisvgbnsTG1B3HGJp+RsC1gNGWkROzzlqAGZL+QT92Fq8S5lOo71ulmzQF/waY1uV0aa0xbolW5vKh9HMOTlFRL0Ovpff6uW0CoiP659HeMYWN7RRrWQCEcwvM9xV4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmqBPQXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clkjEDvx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqBPQXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clkjEDvx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7j7o2678578
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=; b=SmqBPQXhbipmltUQ
	/awXWS2ERc58qQNMMm8atgOnp9iTfyegw67YPn2R1xEEG6alwJPjLCqD+3655j3X
	I1R6PAVArkc6vexEX7cpgp7tyJUw/JXWlhNJfB4SznF0sDeUQIcIdI7rrq7XJocb
	daeRe/DvchiGEEZfbNihWLBkgEzNZO/J7F6LRo+2lcx9PVrOGeojQG3Qvq6y2iwX
	ojWNPzIN4o682sIaAaxGoH8pAe6gJIC5Rpojm4nhZR13eFhktcRM27iZzmiRoNHH
	0Bi0u7d7TJXQnnkyQtfDQa9Gejjnbm5E499M78WbzhdK+pF1NF30Qw+xfNcApO0Q
	pGOljw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjjapu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso102476685a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769213; x=1791374013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=clkjEDvxuvPPSGisDjL5qaCxGyUGW7ne7JF/vqjPogH9E+ocSix1h1GQNTtN/mYWaW
         /5c5HAj7WB+cdkH5g8AdUD1rQWBTkekSq6Gtx+9fpRuGNA+My4ZrhZGI3ldnP5m/UKU8
         M5/NxSlkJmXhCDs3OCfrxWjFs8P0INGi+Cv5iQavaDUb/1ASDV9gRWTAe4q56Z2NSdbZ
         wz+Qv+fFwulR2DBPFJAyJP1Me6uPztQbQK3RoceMXnSmod499BtUoUOtymzSg4+dg2Zi
         ScA04rOyFoDw+A8uuvUDCJXvOW0KNwaiFX+sYUQwbeENbYZhaWrSYm9wXxxhizDVa611
         +C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769213; x=1791374013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=PwW2oiDvC6lxnceFbKUumBLshWQGmElXGFnwapf/jNe8UWT9gANJEQnVnulLeRvmBd
         C40eGzymM2rmMA97N69WB6WDYadXfrUAaSlmt3PJ369nv4Y+XYCPtJf6J0VsSffbFDcU
         e87VWfCnekLtIFdHF+isQXoTjrqJkA/ESvk1pOOBxzL2KaJDTs1gVvO4jfxUe0CNbsYi
         7hrRN/X2JOEK8pNjsRmfumm1tKfkpofsJ9E80UL19Xw8e7yC8CeNnAGeVEzlDVGOHsh5
         UDcJoomgRB8Lo6BOH4c8Gtilleiy286RQRlTKiPm0+vuGAjDP3huNxPB0n0avCS4pCg1
         PAUg==
X-Forwarded-Encrypted: i=1; AKwUvBwJWrmXfPd2i9kXfCWvM0b27R2dh+hqKy5kwOhMdiziBvEQxeeXdJ16C09IovX+DJmPPEFSqe25InN/@vger.kernel.org
X-Gm-Message-State: AFuF++muARHyaqZ+SD661UZZXik7/DGCbdN998T2B7R3ZzvoJK+T85qF
	1DzxrbJfsSrCIgi264Jb84rEzzNedAkl3ZPCh+oX6K3jDlWVc1jtwhtLpiQAC+GcO6QZcFsarn/
	RZh9z7Urdi8DrPxtIFup94+pG2TiXS6BEwE3IK8aOJsnQQw0+e75xOXf58bhGcuhu
X-Gm-Gg: AYBFou0CmlkZFTt7mxI840mopp/hZHUxzI6EXNmW4IwkmVVtnY6XXf4f0uzS5xPav1t
	T55nODyMGdmKDVFEX+3JSvFPPbXRW09kd0cDBAk4njqskBWDPdAwjzbwbSJuDLeR+Scat7+NSFz
	inDXsDcTq2qOe3PhGSHpBMwoWC1vi1ISrassj6Ugxrs7vEh8HtHCbo8MxPLmX6Ntm71b+TnTb6r
	cjV+Hne/qwvWIqYeN5JHnv3WgYsAV0Fro0hH2sy4sgnDTC6woZ0wf090yAgM3wMOyjLleMFFflY
	dun36EqnmMyqhNqlsp6LMvCrOwHSKcfXSyhkY1K6nPrNKmYvSKCv06rCddlors0z+k0R0Z1AQe8
	KONeFmZqoLCQ8rAicoa3X4Q==
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153881985a.2.1790769213496;
        Wed, 30 Sep 2026 04:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153877785a.2.1790769212834;
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9e8csm746673a12.2.2026.09.30.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Message-ID: <bff27892-eb57-4c94-9c47-d641e64461a5@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:53:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX6MXHd+vJNrNC
 8EsJVDqZ5CjXP02wOwUpZuqw7l5/T4rCF0uEi5r2c4WSxE/ZW/UwkYlNG0lQPnBJPbnuFWWEtTs
 qIDHKcxqok5c9xkcc915YQUvj3iLA3k=
X-Proofpoint-GUID: YR6CUG80IZCsyMvFq8ohxHm09gJJ4cup
X-Proofpoint-ORIG-GUID: YR6CUG80IZCsyMvFq8ohxHm09gJJ4cup
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcf83e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hDswOLquOSrkhpMzeLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX8qNzLGF42nK4
 bs3aSwng43lwqmLbUlZgqYkYdgtG9AyaUEWTesRJp6Jc3IY4yv1lqlEVc/6p9tzx+4/MC7IbAuW
 xgYNtAIuoQgEX7xOQwjo7co144V/GRnmi65l1k7QZstN25RNE2NGmXCTzVKXki5ek+ktBkw3t9I
 KsBOVy/KSgGevoszsZkeG+3ZkrL1MfS9TA7BRUPICJslOTQ+mFsP2Dz94hjc6tfyyewElkGLTnA
 wvCk7d2KoOVuAsjv5Ufi0Pp7tOegX/rNyoIhS7P3BfT1333zRWmK6SSk+lGRY6CBRoSmkeKkUaL
 HlhfSey1lshxLZgwbjzmdK7DbWwuLkKDjWEU3MVwhmCrlW/kQoMVVGm3hjHsgOi6sikOC0DGTHm
 LFaGzZ46BVrj5DgunXmj6GqOyU2in+aATttW2LGZRjNV8cy7KjidG6/dNem9YpbM7t0tmHPQJwc
 k2x5ihSyojKROdea9JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/25/26 10:46 AM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.name = "lpass-audio-csr",
> +	.max_register = 0x1000,

^ needs a bump 

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
