Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB13A8752
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285966; cv=none; b=Zs4T4FTQHHDlfHu3qh8QK+idhYaCwWfUcr3sFFce+wtyrU8Geoz/r4WXGDdhJZorNaiiLlXAdEPssi65W5h4r4q7qIRzvwlPoVa8WhFrSBMnthg1dJbyPe9AuHkhdQYqS6Zrbw+WJdw9Ol6W4qvMcXA3O7ZSn0cEZ8NzaFGafcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285966; c=relaxed/simple;
	bh=VIH5oseomoaz2aNTCXssIM5XnulyweBpmgXeIPoAh6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFzmPJYFAS/oMeCz9EtyUr76BM84k2FOIP+LBuZxjuYd/uv4b6jCPKRhkwBVHp9WcTC8A60M+JlZDx/A7Uk3QFOhQtgQ/GsBXr1BzMIjWD9gPWWCMkzYaCDGsaC8HdN1rSkesdZN5YlVPuuiCtG3XnrAli7eIypW/J5XqQGyb/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/tYsbjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKMB4OVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/tYsbjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKMB4OVS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGaaK021528
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=; b=a/tYsbjrm7lFDkNj
	/fPpmhymZ4JWDkFqdE0Sl47BjKgdYqllgV1l1y0uM7msbJ0SzBhjj0ffeccpf7J0
	PqjDLAkiLs7jwO0534ZLrWWwuuEthvdhLmu9BsdPuEz9y31OrO3coGaeu+/hqMg+
	xbCuJTnLG0PBkh/7lPvJ+gh0LnFT2ylS7w5B1RSxI2SUHNNRH8ile402ItcdA/UR
	QPMKBcA8+ct0ngO3b19DNdfL9MH81Ejv8r87ArGPWD7XDJL+2KNRW9OcVyRAXaQd
	Bdk4dEzy2GXnvc8dltBZRtPba+Mr9tmyfr7xybZ+Ze3bcL2ZwxP/as5mKnlc8P5S
	1mhH6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k31e7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:12:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso21970854a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285963; x=1774890763; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=;
        b=MKMB4OVSV+4ZnUR1plNz+r407xIKqGfSvajgmxXncU0iXltzLLGu4Xxgh4BkeT4i85
         R/TtfD80wQIiClsvGukcOwWXP3g8iteQ9ociGiXVvOtqpXEj2iNg4gYDkfd0Skza8pS7
         YmtbB6n7Emr8dE3pCWKHFE0vVtWMo0A4m6bK39frqoHcah7UbM8o7VD2dfzBphYuIbQP
         VB+1Vkt2SAD4skZr+VDmYn4gvk/4KFdG/8dZcIMUPd4MdnVifOCasUCMvQ3YdYSQKShO
         LSy58Bgho6rcM03fM/rbT6nGwfeuXqRnulcaj4DaIk0HEBMhnl+wtHrN7y5+udh4nocO
         nYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285963; x=1774890763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3ROQRlFPBoLrDcR2n19Hmz53ktfTwjjW0C8cQSfgLo=;
        b=MbQGRPwkadTG0M+qUCmLQj6S+xVInMg743zrJTNv/2LmbyaKJN7Pn0JG9CMwyVBEZj
         lzsKspfMjAbuGwJ6MV1KanX07/lgkwYWaVkpRQLrW5tbPbGc551yAFM3xZueOZSY+oiI
         14ZYmRc78Qp3KArtpaXdLXUFR5ZdfrdA65c2c/1XFhSX4Y+VF+ZTiX6Cc3AIM0pMQVwA
         iXCKNUq8BgWlSBjxrLvTfSsziknR5YkZmiDdKm29stdiiNquO9UjdnNx9W/ydUQhHEjV
         A20ckkgSS1B+93FtBzxvwvYVbki6yLLKhcXpoImO6go1yWET7VR6K6UVFFCIGcTsm+sw
         o9AA==
X-Forwarded-Encrypted: i=1; AJvYcCVIinchPrArZ0j069ZniYPMRfDObDF3DdL/tmFwDxKeTMYiXUkr33a+olpOpdh2rZQ2lDWhzAk6gSWa@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxkuXEC8EerGohdLX7pmHnnWEWCx3/ZILnZtodqQ+D8urH9TO
	qHrkFMNncwe2Eao+CsKshv/qucjNjz5HP6gV0USZDhSKY0zVFhAV2TTzPlyOpEyn6o4JNXyg5WG
	+CMEG+ZcGTTSmenVWU+ZjnaOfyXssM/WfG2gHIhHXaLdIRIVGW6Z2D9FjCxR7/RBY
X-Gm-Gg: ATEYQzxq7s+6mhQMGmfQY4IhHLx3kfp1PNx3KmsBpZKMCahsCGCBURbLfTAXlHR8rN2
	Y2fKRaklqMu4NJ11bt4XpeLQH4gXb44ZFQH8kbHWv/NyWtJiQm56mofV+K/CdbliVF6+hu1pd37
	SRx8h4epJHdgWaIcIV7gJQ9aE/3IdO9NloSCKgTPNyCMZupbGQur7dsjcS+ESbVGoAKY2aY6NzY
	Ygv7ad7DvyHoxb89B757+zshho3HX40cAphgj5u20tclm5EF8rrFj+WEoMvG8NuRVpzXtynVuuT
	iq83mHvFDQ3dKEnnPRSM9WXvM+LT4Ul1TlmVSHoqz2Ol031oPgha71Vu4BKdSPgjT8mGkbf1L8G
	tsRrF7rZMw0ot6L1z4AT0GQWly3tUYUvXotEm+c0D8r3/rrYmqUzna1uD5HA=
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr10918254a91.4.1774285962681;
        Mon, 23 Mar 2026 10:12:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr10918187a91.4.1774285961848;
        Mon, 23 Mar 2026 10:12:41 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3d8c462sm10077241a91.0.2026.03.23.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:12:41 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:42:34 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] soc: qcom: ice: Set ICE clk to TURBO on probe
Message-ID: <acF0ggIIJFb7mUUR@hu-arakshit-hyd.qualcomm.com>
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-3-669b96ecadd8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c1748b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i-sMpDq2_rzAXM5hadQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNyBTYWx0ZWRfX7RpcBW5W6bTO
 /iz8K6wKBMWwkirXWG3qkqbeoersKuMhRNP5JK4eXOVAGK6Ez1TomKCMHQdq980unC6HNmLuDZy
 VfUVGQoCQt0WrXIWODgZdUNs6ViFilD+Se/nnLLy6gfg+i1F2n/Y28RIWEVVx8b3j6VS8AzkZbh
 UdbRykeOWa8Jzm5uM7bwN1u4CIvmjpKZ5gW0Dh7+b7dUoJNCRXSV8BLG095APL+AHi4WOevkjBS
 z6//IOYn+u1KDxrlD3av1nvUZ/SSrwQrVc3whY8TqH+KM735g3PPNpdes91C9lCKEscvpmYOh90
 EDVOc4LQcglFGs4bqRfD53v+SH34hKjGl4UUcZ4o0vG53HjeBCcRl5K1DDuMna/zJXpzmK/LV/j
 0UMGHttj6FZ5qExoSZ+7aBYM0R9Shhnm0UYv7h9cu6Ebs0/peTiClhI5hv4+03hVk3BwubzMF/Q
 rcs2luwJ+0tnBF8NJNg==
X-Proofpoint-GUID: s-BjBXoq5FbtsT-89Y0U3sf31ZLY5t5O
X-Proofpoint-ORIG-GUID: s-BjBXoq5FbtsT-89Y0U3sf31ZLY5t5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230127

On Mon, Mar 02, 2026 at 04:19:15PM +0530, Abhinaba Rakshit wrote:
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
> 
> To address this, set the ICE clock to TURBO during probe to
> align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
> 
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 7976a18d9a4cda1ad6b62b66ce011e244d0f6856..e8ee02a709574afa4ebb8e4395a8d899bf1d4976 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -659,6 +659,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  			dev_info(dev, "ICE OPP table is not registered, please update your DT\n");
>  	}
>  
> +	if (engine->has_opp) {
> +		/* Vote for maximum clock rate for maximum performance */
> +		err = dev_pm_opp_set_rate(dev, INT_MAX);
> +		if (err)
> +			dev_warn(dev, "Failed boosting the ICE clk to TURBO\n");
> +	}
> +
>  	engine->core_clk_freq = clk_get_rate(engine->core_clk);
>  	if (!qcom_ice_check_supported(engine))
>  		return ERR_PTR(-EOPNOTSUPP);

Hi Konrad

Since you previously reviewed this change, I wanted to share an improved approach
that I recently realized for handling ICE clock scaling in the MMC use‑case.

So far, we have been voting for the maximum frequency during the ICE device probe
to align with MMC requirements.
But because the ICE probe is common across different storage clients, applying
the MAX vote at probe time may unintentionally impact other storage paths.

Now that we have a generic scaling API exposed, we can make this logic
MMC‑specific instead. In particular, within sdhci_msm_ice_init().
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mmc/host/sdhci-msm.c#n1966,
we can invoke: qcom_ice_scale_clk(ice, INT_MAX, false);

This ensures the MAX clock vote is applied only in the MMC context,
without altering behavior for other storage clients relying on the ICE driver.

I believe this results in a cleaner and correctly scoped design.
Let me know your thoughts.

Abhinaba Rakshit
