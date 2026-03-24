Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED043A3838
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391191; cv=none; b=DJlapbhynlPhJU2uuHypy70GohZUBrhqjtp1jZ3LBFCwcoaSqllAI68VoM1sm42h4ufUF+/x9xDtwzu2K46a4Ap42wFvkpmgPimjzUgxnBTvOvMQUtpCw1FD6bdNH/kYyNIFId89GkpHQjZOT/HJTj/SmHJRy2HzlAout8VQjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391191; c=relaxed/simple;
	bh=72dJxfk3Uzm/Y/ymeeIctx5apTZdXzokW2KXJg3SFzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qufa6x9bNaRuvzCvTuQSPtMNX33RaVEgBRoCkaik5djxE0AHEjtpvKF4zalYOzRfH6Fp2glQarwW+9eLezbL9l7aKoZNBVG4S+uZkx2Y+gSpF5/W4154IZjusKx+3A+OxG9D0Y5T5QWTuNxz+gafgD7rLtIy3Wl4PvMozkc0KdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4Pxtpj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K45uAwWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4Pxtpj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K45uAwWy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCs1a104359
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D1KwBMD5pBl3gSLcJ8Ks252R
	u3i2i4xJaHHe0CS6qgU=; b=V4Pxtpj5MyRXBUGXV3dfKu2LzQlNj6u+j9YxAOQi
	vA5wmQ4OZ6PETXxpa6NBEA33nJEC3Ve8iVvRQYBHgPyE12eg0sOkPOPNvYLhoHO2
	yrZXwVzDH5/SxFgPASAy/Z7WeqTHh6OnTRhschPpdJKTXVQoeKNkHejE9SDhFdTx
	FGeyL5EWUhBN1FZzVJ8H8iR2KzWCIxfj634k9TeFhYmbP4KMTb98Zmjj7fEwEhlb
	deCPNWKolqVfXDi2y8G2b/RE0hIqyKoawCT17KhcYdcj+XzGq1TuTLx5NbvSImgl
	78ERhoeiG0XTg+asdnDkE3rO8R5eAucpGPUWx5ZnDezVZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0jpyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:26:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso101425381cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391189; x=1774995989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=K45uAwWy1C0VvbMaK0j6Oo2trhDiV2BaCFRGUWr2+YtHKX7JIpadtuBCcNGymrtPjl
         WniBNuv5U0KJLgZCSbjPbE4a+giNeH+LqtPktBHPqH0mzWdz/NUxjZmWMmsBOltCa611
         Ye0khiNUBC1VCNgLjEJXy0uDc8e2gT97jPkwG7n+XUypyI5HyAsxwKgDFs8lW74tsTpJ
         R9t3HSjdIEiNgZp2/diLQObCMlD/tMiWwR0r+UhovF/IgXFQMuo0ro3ORa2K+izauwYY
         eCwwpc6k0oVayZOpa7KmWVXv4rS4NGkIfIG9kEce8ivaYlW6mEQvK7E+rVNi3Ht6Ng1i
         rWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391189; x=1774995989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1KwBMD5pBl3gSLcJ8Ks252Ru3i2i4xJaHHe0CS6qgU=;
        b=qQjeylDAGyMqgNjiJqXgm44dUtOuPXYSTeP6WpV3v0yFSeMp0enx0z1vJ5sjgXRgy3
         JE/s6CuG6zjnDoEf6T+yHyOxy+vtgIafpBHL+/AwcRzu/W67UcUZIA3SQ8kO0Lj4AEt2
         fuq3eK5f6JtyRrtl7AmOE+BKvemfkh/V2owM7e3O8zKDPIOEUACd8ce9JOyBTYCbkz9L
         SQf50hb5k7wIGNWmi4ma/sOWEHnAk5srCxD+KIfRP4wtc6HmEKUuk6hDaAIb7Vr0Bolo
         e24nKuacpfwkpdxongrR9DsrNAuK9bS8hWiunABhTwBil0gJBKMF9c1/9ksWksZPSHGy
         VWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKwykbkB69pQ6ig+2MQLfCE3v2vxV0kvWPnuAk094NlwIw1m9kc3s/SIValBeLG08TEjL35N/A3QE2@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlE6IJQRiHe9NByQ+Sxzfu6dViP8CJFMIqeiG3W5ZuUQWMDKV
	pgDnd4yaWQEWbwj34Ja+xlVYeVrnLKXyHTmUb1k6o3b0oT0ySH6ocM2RWr/5doJrBro3hq/DBzc
	P0TJQArF4+V8y4IQex39ABM6SQx8JpsNqJGOwUdInLIizyqcG7fVqynunveYZrEEO
X-Gm-Gg: ATEYQzyBOnkvgy+c//J1zsoe0AWjNn0MvvrDT1dWI1WaQVRm++kAR+oTU2g282QQE8q
	RHmfNfukdBR5wcNvKcv3DEjKSfWRg0em5MF9BBDMdinATmU6ZyxNhvetDDNU9fBhn3vFROZemaa
	Nw7jS/7jo4S3uZRILX2MrmLNG9abNdeGZeuWw6/owooCg1AVVN+hnjmf0x0D4VklhK5M7uOKKAl
	trWHUXIa9Z0LuZdWRXGrBm2NbionMlGIAsN0y32oszrEcFn56ZWMbriBbZimIGebHMcb3ZUT0rx
	T9JNxPl1KCi+8u6z627Fk+4ucZv+3NsCM9BZgc3ok12BdM+Kyb1KVafRZ1Ukm/Kf09IqWwj3S7J
	4dw6edp7gvmB3dGThBG7uugdBKP4EgCISi3lC638DkNnZQcC1SETPJEZS8ieB/ALqojiMS8h7Ko
	hAs9TUSCd3YwbBu0SqAUT7ij65CTdzHaLVP8I=
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20286081cf.66.1774391189126;
        Tue, 24 Mar 2026 15:26:29 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:509:2ef7:7048 with SMTP id d75a77b69052e-50b80f0a38fmr20285631cf.66.1774391188688;
        Tue, 24 Mar 2026 15:26:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a08dbsm3395670e87.24.2026.03.24.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:26:27 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:26:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 14/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 reference memory region in fb
Message-ID: <gikqqyhb5amajegkzqdsvxrpo2pjxji5d4cjbzukcwfhegnoez@lf5jucxtodcs>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-14-d89f07897283@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX7h8aPS2lTIK0
 WsuH4PvoeDcgfgjf0fd8kiLbpe9dTAXJMQ4my3N1/yuKDQ5HrIDJCa4tU+VnbB6cwjYz7dvhvt/
 LKHMMu/VCbe6JCjCqR0w6I4MAlabQZZpWUZbsTH3sOJzKUUGwpJB24uAv3cKtVZRQJyH1HDKx/c
 ueuwi1T6w/QLU4OF9tE+zOr1fyBiUyruS9iO8dzwsdocx6Pa5JKSZt0OxoBDG3gEylkGDCvGm44
 HZezKcUD8dw9YBoDboKK2+QlS/CUJrb2LvnHBa8MdRgZorhmLXwapD6RF+N8yGGBGL2psM0Dkn9
 2PyqWnupx4LsEJ2yK7Wcph4AFtYD3V0iaFkE7TbtzDKj7bZJ+itYSNVmcU/aIX64OAMTT0FHxbG
 Oqun8G13dpOyx6a2bF9TbLP8Q+ne3qSktMLIAuiHpRxZhCv+Xyr/L4UhE1QU+Awo/c6UcWjvrEO
 AXLbJZezRT6y3Q1rckQ==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c30f95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Gbw9aFdXAAAA:8
 a=qTE7wAw9Fi2BWtdfG-AA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: M-B35Y48ERiWgYu1sRTUOM2tH0eobDuf
X-Proofpoint-GUID: M-B35Y48ERiWgYu1sRTUOM2tH0eobDuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173

On Mon, Mar 23, 2026 at 07:42:14PM -0700, Paul Sajna wrote:
> This cleans up the node a bit and prevents duplicating the region specs
> in the reg field

To prevent duplicating the framebuffer adress and size point out the
existing framebuffer memory region instead of specifying the address
manually.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 51fc1735ff49..f42800dd25be 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <3120>;
>  			stride = <(1440 * 4)>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> index ffe1da2227f0..ae6cbd132949 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
> +			memory-region = <&framebuffer_mem>;
>  			width = <1440>;
>  			height = <2880>;
>  			stride = <(1440 * 4)>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
