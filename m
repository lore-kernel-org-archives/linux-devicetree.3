Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AFE528458
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067608; cv=none; b=O8Tw81xfLS4iWg+iKWilZTaMJnyS/LgLuH2Y+3JvD6V5YYaQ4TXz9uKFhMH390kG9xZTKXoyP2BrzlA1AVYBAroKJEYjDbXoRTmxnCZ8E3PIJZMdtT+jaRyWI6aqZXFh4hU6GZ+rnN85WHRiUsu0IMSJ7ruURSBrTHT+7ndPwdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067608; c=relaxed/simple;
	bh=QIEBB/wfztDgzWk63lQW6yvGaw7XUzaROm6NjmVGvck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDdKfM3P+xgvpqiFuYM7qtKT0IuKqUOWoBV8Q2pn985QpmvkVKlnOYL1fxX1ONVd4VEaI2LCjU5j4zZE0xmHWP3YY8rDi7iR6DQcLQxfVO859lW17SNekUPt9q4Jp1o2hhqi2KWiR8/RF/3Wa27KqTLmBwYFHbLPXxEsaMVPFvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLCVwPGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwpQrOLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLCVwPGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwpQrOLQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7N2f83186204
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7saBiG+R2RfzBaOZ+EzP2YY71J2u+Wed2D/wQsOOERw=; b=gLCVwPGg4oCZG9pr
	kQHI6Gr8ZzY3EjYC73Vd5rmvDNExGwpyityN4BV/lg1cs10Z0lQegbtxcCtpDTFb
	vx2//wGtHhwJa8F2JrFUgz+LzJjsNe4JsMdDSMhfTeAupE+2oGbJn5zP8vRzF5hD
	PbZj03RsLdOcVJOaB3PpLe2BM8Hk2uttMYsIOxANYqgDTgS3i/rZNyAmuE+k3Hy9
	I+Ta/M1ILMyCBzReO3uExK/myrPvlEgfljgeQEPUD9qzIqC1s1a3i5iX0lWDkOV3
	Uz09WYjmMjRXWHOYR/44gVJnYe1jj96u/5Cfj04X7O0wXtJda4GsoqmN8o0vSQBs
	8clo1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybhrhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:00:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so5708059a12.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067605; x=1790672405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7saBiG+R2RfzBaOZ+EzP2YY71J2u+Wed2D/wQsOOERw=;
        b=HwpQrOLQ5r/hhPByiq8CeW9vyyss/ogPzLmpvOwtgcz0jhDMseJDU+tOx4J48bQN/r
         i4XGMmzfG4/8sf2uvnpPXj8NrCjemTiDl1H/EbrWKZ31+GVGzi7iwX2y/o5Zibow7Fr3
         11QTKCeTXMvuk10njpIFci9osXUhxIqCRy3RRgh1SjOMV4C4Z08I66zDecWAmKCgmLcX
         SjWENpanD4N1uqFcVA283glq/u0+zkxzsUYCmBTgaxFQEcTN3664nxaxhub10IJ9PNPm
         fcB71tNSkx1tDAzNtHPCMNOpXZLa6Jo90+4k0lPzP3LjgvFckY/LOpLL3z1v8gCkcnWo
         el0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067605; x=1790672405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7saBiG+R2RfzBaOZ+EzP2YY71J2u+Wed2D/wQsOOERw=;
        b=Fv7eSJCgep5FfL4Z/bwriOQQitttxz2GR/PHrFkEnsBVnoiB40F1YCIqp6A6Eamli0
         LviTTiZTJaoubmV5TEJTmGZkQm2b7RQkCY56ST6mkBecDbSNpAtaC6v+cV8dlOEeplql
         pK9TVZML5oLaOcwg9sGdZyqZwD31Dy97UVhT3kqAuUm6K8PDVt83XeMWR3UafEzq7ydp
         Fb0rhxFSRkNbsItjP3mhlXa0qISBEgi4sOcxYlwA/5niHvkhXdig2Rhb1K/1H+BoS7iR
         Gs0BZcDWg1x45JzsCXiWLtG+FtT/Ep9q6Y7gvHx4MSuI0imedkJOwfimlvyIyrhzytyr
         dIWg==
X-Forwarded-Encrypted: i=1; AKwUvBxnr/RdeJLagJysC43YSYGNr+JbcLENArMWjQhyfVnmK/yD5suZgzjszJcTratFITfQHP87dgS9zPhX@vger.kernel.org
X-Gm-Message-State: AFuF++kRmR5T0vdLLygxQbYGe31gKxJfd2SjnAqN/Qg2IoFvfCVAXXav
	YZdZTpo7WX8nM7duDUPqVl9/drMQV3kcvWJ3nilTc58JAHomYC8ElX97OoBkmye2wpRQJ8IOnTq
	hyC/Q0PUK/YMcuZnzQdCz8B5EMplI8Jb9dGIr9aE16LxuOgRN8+0yjm+zAeRmNzUm
X-Gm-Gg: AYBFou1YshUtkSkUR7c2i0WbG6bfs4oXZmJinIC8n3KTzV7nYMsqTY4dkdLrpbNFrpe
	rvyd17YQREOed35EvatxgI1EFP/NqdfpcNFjIwqvZyzZNaoMSpnlcC+sJVVGNKRG9iPxzhOnc27
	d8Pzb7/YLu18yZhZKDn00CpFmzsHKzuogRkQAQSdxQxKVqYYYd8kzaJvzkmmkUa/HDmyTu5s+9s
	y+1sYm/HscvFslG9fkRf1GluG4IKqUTWypXZThcQVHCNX9GorWV4cySouYDAvGGjZHSlMzgiunT
	umxUUfugxPo1KBqmSIFV9bLsOtkxxCXRs6sJ3tXf8V3YbFD8+GHSCRik6qTbHp0SeDjxS/5LJ9V
	MfX79e8f6gu3nCV8M0dAIhjBakBniCtEAdNR0TH2/NmJFanZmr/cr1lvCSXdq/+3QkrlUzNBSPO
	AE+6zqfeUyrzBdelK4Kg==
X-Received: by 2002:a05:6a20:6f01:b0:3dd:85a9:55a4 with SMTP id adf61e73a8af0-3ddec6b43f8mr643541637.29.1790067604616;
        Tue, 22 Sep 2026 02:00:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f01:b0:3dd:85a9:55a4 with SMTP id adf61e73a8af0-3ddec6b43f8mr643506637.29.1790067604109;
        Tue, 22 Sep 2026 02:00:04 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a40e8csm3909915c88.12.2026.09.22.01.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:00:03 -0700 (PDT)
Message-ID: <5b28876d-749b-42e7-bd1f-1380613d4060@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:29:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab24395 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=apzgA-_30mgdO9RPUzcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: K_NSd0rgu2avgAelujSV-e1Wg1NWJB9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfX2tUu88MHSdgn
 HaDZpmaeh2PgSW/K8r5VnGX59LxHMTb0ENYP2N6RvWMRd8n5BOFq5ZiwgDIg5l+JO+SJ58ZpM1r
 Axf5M4DsPTVrsoWDVmcrCrfIQLhoQEUnmSajUkvHHyl2mf2nltH+Qgb77yW9IxUCQHIvfhWmZ6C
 nw2QFPhg4MVqPt8sSkrYrgcz+1RlEPDTJJjuSvpHwgbf8GR06Ufm5L8+OPZ2b8VR2bvm8K5b+Si
 THX4z79UiV9o0hAqd6xeOLsKeMYbecrPwWnBvNFzI/MsEpiUVMyTalCEL00vXs6zhFkczKz8Mdh
 nl5O4k19i3QKxsPo6gWcUeit9Vsp53x0aJ1UMvcfZQiuMstGcV6zjTPyfw8Pjczy+N0pjniIKMO
 hmn9Z+fGyVFBPhBM1wDe1EdEz34qhY4BMmrIrT9/QCSeG0jd10nOuF5dI4exvZqW43vWyAjQfi0
 PntuvYor/kmbWcfR8hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfXxCfRWhYxIRXT
 Fh0jjTr6HgPScJnA2/f9deQ9AWGLr06Eax9W8ih5LMXI5d1/v+CNfCa6ZUKDLYylQIWUIx39Yqp
 ZGmSMIaViwZCQO6OVy6wQz4qZH0Wr4E=
X-Proofpoint-GUID: K_NSd0rgu2avgAelujSV-e1Wg1NWJB9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220129

On 9/22/2026 12:10 PM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index de7c395d9c35..51fea666efac 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>  
>  					/* note: compute-cb@9 is secure */
>  
> -					compute-cb@10 {
> +					compute-cb@12 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> +						reg = <12>;
>  
>  						iommus = <&apps_smmu 0x240c 0x440>,
>  							 <&apps_smmu 0x196c 0x0>,
> @@ -8481,9 +8481,9 @@ compute-cb@10 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@11 {
> +					compute-cb@13 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <11>;
> +						reg = <13>;
>  
>  						iommus = <&apps_smmu 0x240d 0x440>,
>  							 <&apps_smmu 0x196d 0x0>,
> @@ -8491,9 +8491,9 @@ compute-cb@11 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@12 {
> +					compute-cb@14 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <12>;
> +						reg = <14>;
>  
>  						iommus = <&apps_smmu 0x240e 0x440>,
>  							 <&apps_smmu 0x196e 0x0>,
> 
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20260922-glymur-dtfix-6314526b4b02
> 
> Best regards,

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

