Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB22E11DC
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881601; cv=none; b=Kx26r8Ml/vXKxexOGnkPa7sksjoMp6VutI8BazN/CiBj1s8/vI16KJcJjS37xhoB7a7EoiqHtaoqVYRc18dp8SyPotol4aQ2qM36devqbK9ml1h+Iyggz/QZtIDQBqMDByJ4juFBT2D+R5xqPC/jHMSV5h/wxdLONF9bT0UNpOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881601; c=relaxed/simple;
	bh=74ntAUr7NapuW8nQdYTPtYuOABRG0syCWtfXjwYJ4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGmP9LhLvk5Uj07fzDTSUSvvx/9Fr5RBngBBp4o5zVB7CaEDlyKp3j4ozScvTYLp9C63aRCUHXD1+nW4wlWeAvs5pzOrbiLbeBemmnZTPWzIeqe56jtUTzwPBoON9XvHtsEPujDc6H5ODL0PO9KEL+LKd7nBgaDek+O/QFVS5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/fjlZaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzsPU/Cn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/fjlZaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzsPU/Cn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcPXX3194918
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=; b=E/fjlZaXcxfiOVq/
	eeeB4AJzBXC3iF90UDASj8DxRWkSLnz87BrWA4Yj7eDWgc9T6GH0FpwZQPfLNhWf
	3RJCoUUVZZDFW9bpfT8x6ffAqjfEqE57FUzFx+SE7Q3LKuWLDZcjYlC+1YdZsquJ
	D3tIGBiJRxKNu3zV4HlrvsVEYzztt+C1p+gyxD0NFLAZyJz591b6/juTkml9qVFM
	buJCfm2sagR5Dq+UcokZTh2toTjv+VpFHoOXT6TnY4G2VvTWsuDzcYyIMDpTexg1
	KrS4KWrz8qM2RnXSGkYNaiSNPHXiLg61HJq8/rPai/2cdcriDD8riYE9RykH8YnC
	eF+2rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwgf4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0be75dfd4so60382435ad.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774881599; x=1775486399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=;
        b=bzsPU/CnzIihJN5fa7rlwMvMZL5XobDiUJ56+h+UpPDjCX7yiF2DN1QiDQpR6KU0xp
         V/k51lZ+YaDlW9td9dVkC5hsVlqgozIfIjAAbok12sOHMZ3c29SvJb/xcWgBNnSqaoBh
         fiHrOb8+zZTyXqL2Y45jQpdc81LLdWv/ene9x7FNTVZSayozdvlOLvXvkhGjGl1k6i0A
         8oPusggtrmErXpFcMBc9ValkSZUP3hmc3WwUTXQ0Sw7bYobTbtNEhQTTR9MgrFqn3f6w
         wYNFLejK4OCBBlqUO95jkD0n59pmnol6zRQsa5w3mT8xqKB7Iu5G1BWj7md+cjxr9B9P
         g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881599; x=1775486399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=;
        b=rFie4a6nUmVH4UzxN7zMgFmuAHtRCjOjjN0u5PpXVvwSsCunQMK4YPAS+XMRmeNuFj
         Bpg7AjR3lnUF7/jfwPILBfylKZjqNCXn4Kq0mLROQWf4ycChbWeUMkdvLKIZRKPLE/2O
         RQwJpvU2zATxOYNtibGztUEwJffpVuxYqGeMg6Wnt7LjOO5xOg3qNmNxJmtkJvPORtLV
         NArtm5KsEGGzjn4YkvlkzVjCgEi9QB8jC8eWMCRoCsZpS65wUVtvI8LTSJ/byZsgn/Nj
         727NQdYN/P6QJ6QMFjS7L5V4am+evihyANhnbINCkmBpFj7X3DKYaa4d92IH1QIRnkyf
         5FSg==
X-Forwarded-Encrypted: i=1; AJvYcCWK3I8GxBYaNyI3dwQ2p89MwrZjhzO0eb0+qDk+7DnNfVROZiBc8jMosck7ADte3KayCfbPw5Y+ccca@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6UU9nOkQZIFHFuMMQjpO83W6ef6qT4BCyo8YWZuEUutw3TVB
	gAjcrdUIpapABZY/BHG6oYroiokC5H2CBJy3rcVNJpC84ryS5YPOtlouWg+3DIcRwLSxw7Y3q4M
	fWTagc+wosTLycGcxe02QRdV58AgAC9YhzDrQ2v+X4d4ER9pEjSGhrYx6Q9PRE97B
X-Gm-Gg: ATEYQzzFs6T30YAxBNu1p8odtxBg43QdfSu8oKkpaUeFknhr9iFG4B614HdMeEOb/kZ
	zbs6AIWAIuxED0zyj4ICphti4MgdH175JarOovc2DNqqHXXHZKPQsVBtW7M4FpETlDAjn1bzwDv
	hf1cvtEIkvkqbLoczER5/x9qPdpg142hx9ep6AbidCe8tfMpL9X3XRuPh6ultEc0792IrRDqAmS
	NBetx29qnjkJL0uJsTluA3XaEU0tzFEtdg2n1ZQ+jpLPwdxfLk4QZhVZd+fyv0oasdABnHzTcOx
	vbc1E9pfL29FXLvNr/dNPiL8p/3dO9fuhIBdJnaeFiN4lwiSWBgvxfuOcU0/0rn6xfrFkBmBegC
	pwaPXvYO1rCwKDaWLPfo1Q6s1FcNJhIE8EMwBNFzQ6ChwhbF5G6M=
X-Received: by 2002:a17:902:f542:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b0cdd7bb09mr134148845ad.38.1774881598574;
        Mon, 30 Mar 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b0cdd7bb09mr134148525ad.38.1774881598074;
        Mon, 30 Mar 2026 07:39:58 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm86567855ad.4.2026.03.30.07.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:39:57 -0700 (PDT)
Message-ID: <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 20:09:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zjw26oZOQN4R_4gZKAanYyoriyazpMQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExNCBTYWx0ZWRfX3hmK0MmfEwoh
 msFowC/0pY0ijcxyTGh/0kay5LkFolNPVMBQCJA6jXW40IONmr1zfU6LVHimHuMOFxddioKmiOe
 1enz1pP/rUg4dM3tJ4TQmhXb4ZuWoh6IShOH3lrjroB30T631LYP+9H2tMz/elyVqRziBqrpz1T
 rrvGvc1DFE+zogN3W0foeXiMZf343Ry2DUMVFLQxUtTQj+10mIuHbK6cv5syi3ivlnzkqQci/BD
 zwD17KNpIIv9hP9FSTIqxW1xLhmqrYO6QXej9Hm35Cz793tYBx4roA2EXmaEozqmXryUXpTEKC+
 8OOeluThwAd8aLrpjQ8B448Mq/8Q8S9k65rXm7roXXi+pcTdQW2Q6TevY3Ek/blRX3N5Ct2RUqF
 XvdRBaUmgSqzjfqGA1UyRtgPRk/EvGqxIobxHaMEKFyCJtSxxi4Q2M4klrb7cm3K6pyNc+P5xwr
 43phgWA6pnYZfZvfP2Q==
X-Proofpoint-GUID: Zjw26oZOQN4R_4gZKAanYyoriyazpMQ9
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca8b3f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vKCOo-aWrrhi_IfDXuIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300114

Hi Abhinaba,

On 3/2/2026 4:19 PM, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> Incase of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8d119b3223cbdaa3297d2beabced0962a1a847d5..776444f46fe5f00f947e4b0b4dfe6d64e2ad2150 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
>  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
>  }
>  
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> +				  bool round_ceil)
> +{
> +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> +		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
> +
> +	return 0;
> +}
> +
>  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
>  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
>  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> @@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>  {
>  }
>  
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> +				  bool round_ceil)
> +{
> +	return 0;
> +}
> +
>  #endif
>  
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -1646,8 +1661,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>  		else
>  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
>  
> +		if (!err)
> +			err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
>  
> -		if (err) {
> +		if (err && err != -EOPNOTSUPP) {

Using -EOPNOTSUPP here works fine for now. But anyone touching any of the lower APIs called by
ufs_qcom_clk_scale_up/down_post_change() needs to ensure they don't return -EOPNOTSUPP, otherwise
hibernate exit will be skipped. So this carries a minor risk of breaking.

Since regardless of whether ufs_qcom_clk_scale_up/down_post_change() fails or ufs_qcom_ice_scale_clk()
fails, we exit from hibernate and return from this function, I suggest you handle the error for ice_scale
separately.

>  			ufshcd_uic_hibern8_exit(hba);
>  			return err;
>  		}
> 

Add the call to ufs_qcom_ice_scale_clk() along with error handle here, and let the above error handle
remain untouched.

		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
		if (err && err != -EOPNOTSUPP) {
			ufshcd_uic_hibern8_exit(hba);
  			return err;
  		}

Regards,
Harshal
