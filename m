Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854857;
	b=EgoeLfxLlR81WpODF3ddtF6kAslgCtM93J2TEYL3UjLih5g3j7WTTdLGpIswyaJv3aob
	 I43IAzeVpeMf7Wz0MApWvjeSXmSXOYg5OMUwuAryYD1WaGa2qEYAgc+lUsvhQMaZn7Pz8
	 TjR53ube5MatLpuFqUX2UUQyb0JUbPYl6nzgH0BJlBrYrYZZn0qUuronXLllFPv8x6Yi3
	 zfC+LGJU+lCP6GPo20C1yIqcOImcILn9Ii2uGCWXc7yatVSNfVBen+DnfGYkANpU0FpBq
	 +3BJ4aPTeR7mSvFKj6muHlGCZG/0IV47yr/S6xuTeaU5tXiYs2GqNCLp61EFnuLOjzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
	b=3wZe7FiHOWU/eiMhn15/CVzyyHHPTfRjG8kZ9icik/HokCsYLGXqACJCCTllJToVDwM4
	 Y/2KClKaMFGoqQ4CAmMaiBeX6pYgTv7Os0veOC9eEqfM/Snsn9ROT7hU6Gf6k6phIU9z1
	 FNfYGSK7QJNUsyoWap+kwvePRCaESHDFQgTURYBgqs1jjyfsHfS1iU+iffOc6hsFUR2YL
	 Cz1RR8IdyNvNLDmsfpiQkTmX1Z7ge+Etl5RSX4vfABfWdnevmMRVeaZkYNLSwHcTOWIIw
	 7l9MHTxDnyBimiH2DD33ATmatQ9iIbaEyzQ2wtUbOcV2PxJ0BTakNbuIbEchCnDbvZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E2606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIIJ43045401
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wJnv0bUBCxxkF+5/me8K4UOG
	EYnfBL17cIYCxZ8KEYI=; b=QxEl4S5OwYMBpJm14GkNo3mBViG3j7eEQ/LGc+WE
	ytCLEnQDJL4woYbp6IQMvawY0wRDPCaG8f1OwZwJCTOe0/RhhFzYcF/cozvxBk5O
	X/mr2nuazmHjLDSofV1kyyz+sPD3UQQAbhcRjo3ecxCf5eMi8+9VZ2FCQZC9sj6E
	DHt7v5sa+p9xm85raphrjgxy+XPWab7ZL6IUkYq9IZ6lBWWoUycI1ZVtbXqEICsm
	8lEBbum1Pax0R0OZUDqX4oCepPmiqvrjpmuakI4gPbC8wN9LdIlAjn6zOz3b0cd2
	4pWbKf5SCmIReL6zYQI/MdCRQ2u/WxN8FSEn6dtrOV4J3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m96p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:47:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37158b53d06so72777eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854856; x=1795459656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=NgfD96A7ObdMBQKuZrOuw3vLEcq52bi/tzatQAI/9IFNeipRgePfCpEEn3U40xgi7B
         2hfaZnbpsnnYl2vKEC7FCpdoQgGrUVnshKmUNwJkNQaCXN7294YsUzMk56ceVUE2+bm3
         S/QJcCiXUNJ/bw9wF1+JfxBGhLCbtCyOfg7nr+TkR15qOzUZ/5crBf/eWto3YBkqUGzc
         f6pjsRMB+8Sj0KYpDb1YOY/D3TM3WNNZfa60GbMAMI4Vl0QQjSFRGUA8g7RdviwUNp0R
         7G5ty+M5/9X1cPEBCf9BR792I1oYhp2IvaWqnam+PlFDxesJPPaP0YCGwRmwQzUfUv1e
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854856; x=1795459656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=sCfws/N0nHP9xKF1rjdb4yt7HJtHcr0MDVRpOedmin1N4rIMISlH9yWkmF5YeuCyvV
         jj1GT3ZX0ICbcJR2jYHN18df+peiOVpWGOSwINBQXnGGEuYy0o4DEnzU0kPYiNNzocXl
         8hynHyrnK9F6U+21mUxV0hbFJZO6XoEEtwEIL9CoUKJx5qsSRGKyhe4iomgXWNkT3vsI
         MaHcP88qSpSWWy8NTTObEE86KFpW7U047469o1wJ9IZXpVX5vZS6iaHOyNzhd5qX5R9v
         K7O8dPe15dLJext3b08sjNY5QvVN8okE7KhjcLQ2sfUYg3rCbOQl3pBjGgTPKO+YEJYd
         85xQ==
X-Forwarded-Encrypted: i=1; AL+hErEsrQY+2asJ/6ZQphO+4vsxPq7m+vH0ipS0AyZuvaJGWe8jY72mGbQXiSKohs1z+yWoKCvk6Cbq0Pc0@vger.kernel.org
X-Gm-Message-State: APuU4Z+cR9SWdCAPW+R9GWgQgVKay4J+4n3Ym2X0zi5FWOqmbHxp6GQG
	GjBY+ZDZEDR9rxC+AcSWBTKtpQ3MHZjQlW/0Msv5yDgG+1aclWzPGD2/reOX4QMhAUKJvOe22ox
	Ne93f4RUTRAEJE9aH5tYrPv6PELbrCmSlbKqeE/E28K+1MSh8yg65fXMhq0gIJqop
X-Gm-Gg: AZFdTZcTt6I1q5xWHDAaJ3ayN5SXqKvpk72rDXMsMpLXqkfoOjiWgk0K/AVoh5ytJKh
	Y1PFtCVxVaphWcComRSc8Okk7KxaAmanE4ucPHNHw0Af4W//NmFkwoYh/5XdUbRnIwRdOEs+iuW
	zH5Gf+3RZkzHU4YBWIi6eW/bFoZCrGwem0L6jG7jNQLD4r65/6J4VEGWm/4uPFH9L+aeC4mMwMD
	h18Mp9DbGn9B9j+EWHEldUQb7lkb8Ikq7idtzjCARy5QN65/vtP7OGRYZ6w2p7saen/7MmUoN72
	iv5HqTNfIjurKIAbe3lX7s7sHpkgAujWJjtfGKI4D6zxYCcyMz1L0K3DOKaDgfp/q6eKgxS1XJP
	w2kj0JUqaub5JpWyp16sdKA/b5ZeEJJBN8kVY/plQcHUrR8lfnwykkHWy4el5UP8dv06EhO/Jq9
	bb
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291434eec.26.1794854855602;
        Mon, 16 Nov 2026 10:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291406eec.26.1794854854961;
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34761572eec.22.2026.11.16.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Date: Tue, 17 Nov 2026 00:17:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Message-ID: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX6UpvYSb4AKSx
 m2sFX7hbGLtM0QSCLiWRuji+aD+xgkubXazLB9vPqCMwIOFBLTy8WBwW60DSrZ09SJbsCuZiSr6
 gwc22oyP9qAvoGKIULd95EiWnGpQrcfwSOyflibxGKlphMoEHnr8UUcSCINJQFA2re+CLDFGMRm
 H7EuUOMmKLfkAQ++zZxm1lTI3YBCdOa8jVq/7yS1XdIt0kUEPt3OFtGRjicg4OMg0zKiEzcUYEc
 MjtPIrdpw6FBKQZDMnboXcfycL2N+QXSRqIiBdHqZG45EQMrtb6uw1ZLiOa6er66kIfI0leiY4M
 IjrxMYUmhU35TOTeO4zwsrGEaACNtrUe/fwe40XXEReQYMqBXNzZbW28YHANFtmukAZ/5xPn1p3
 3ep8HeGHWluNdZCCz6Bqv1Mt0gWQbub6NZkX/e6xgN3zxgMWtZdMet6vakrtMsEgYVkLMPWsUUy
 m7QDJtTfVIaR2QS9HQA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb4fc8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HDZkkxcUch80iLduT3YA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: edTypTQ9rS4XZc5k7C1y35o0HPZ9KPR9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX5KCzQbG0TTIo
 UPPnclUyr+u+KpoFp1qua3RnV4fJta1Ji4WeOPtjun+XizSPJMvZRFAfQ92onEJXeOTa8ZzJYED
 ECBQhj+hUYlSA06YX1bqXrw22Sjfs38=
X-Proofpoint-GUID: edTypTQ9rS4XZc5k7C1y35o0HPZ9KPR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160074

On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
> each with its own firmware, DTB, and dedicated PAS ID. Add support for
> the OOBMSS PAS loader on Glymur platforms.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 374cafd04b62..ecefc6a72fd2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>  	.needs_tzmem = true,
>  };
>  
> +static const struct qcom_pas_data glymur_oobmss_resource = {
> +	.crash_reason_smem = 669,
> +	.firmware_name = "oobmss_tee.mbn",
> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name = "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> +	.pas_id = 0x42,
> +	.dtb_pas_id = 0x43,
> +	.secondary_pas_id = 0x44,
> +	.secondary_dtb_pas_id = 0x45,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "oobmss",
> +	.sysmon_name = "oobmss",
> +	.ssctl_id = 0x21,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +	.decrypt_shutdown = true,
> +};

You can move this alphatically before glymur soccp .

With that change

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
