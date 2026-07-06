Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B733ACA65
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359549; cv=none; b=POA7Ce+94HNFq6dq+zZJGvunXPW0KnpttOtql/KK3vIT9Jl0LppGypQkyctM7Esx4gG8/x1aezPmPkD+AwNXjTo6DiuhzPKrUxORCneV/GD4vpkGWq5zvIXtYI8E9rD00/D8dCwt4z4lRoFmajPGyjhkqAKHzqCeZNa5/L5cP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359549; c=relaxed/simple;
	bh=xre1ylS24RKmpgFEAZDl7Niim2XnBTvW/DrmPOJ6a9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpmjbiDLKfrVBjpvL42Ikob7ovw/eXg3DrtOzxHtvlbmZ4PdgfTBtvHg4jA10iOVrU7gq4iQBofgilgHuYgjYfOZ5xktsivQ5IZBxvLJ3787o/Oeve3GIhI2LYSBNqBIUaITIkk2ciDNeXr+FnKKfxCLa9IqD+09KFoSA/Ajm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WH0qJUeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVvuJ4dK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WH0qJUeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVvuJ4dK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6BP825903
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 17:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YGOdWSibWy2J+WMzG5kjYx1/
	GW5ewADeIBUplqEh2Mc=; b=WH0qJUeNVYS7Hd/3LByKsTPskXpLO4fmyO/Y3ydE
	IqVkCbncnX0WmHjSLfMyDdk6T/Zy6uuVUaSSY9492sNMmvdaMcFtLFd0xPvzzLrc
	rsouCxI6KHCQ0MJdYSb4ILsgh0qy2mSoz7D7+Ly02Ee+N+D/hJ0sIZ3d1F7s2L5p
	qym5hMMAOTODns2f6b2r/lcRmvwTJLxJ2fMRngyLx6YwR4Of/7OARmvm7R8EENq9
	fwBGw2HAo219wcBF0Uyn807adlS4Te/FLJ9iaXC/2D94MjzWD229OgBuO8kT2Xuo
	VhN9KWNNMqnGdoCvN4BcGYBpdfEcjsXOIvTlQR6TkbjlCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8ag7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 17:39:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so373975085a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359546; x=1783964346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=CVvuJ4dKB4cNY99MEp+VpI5r98fgib/7V5R3bw/ejhIVTMJz62v6lgyi+i23cEc5T9
         yln7qCmE58RgXGapERo20idASmdI6uU1hsFxt19esaWMHkpM0nTJYvZ1nyEbU5K6qAFg
         pllXa+9X75YeCoD8XADiPN0GdtzRAuiObYE2X4nZZOmYNyA5rRwekvszZNPAL9J3drPR
         Aun9dlm4H4qvgykIQbD66rsGcJIj6Y0HU8Utm6OhOOpAMfRQdo0TEw+uu9SKKZWnfLoq
         2RR7MckpEapEIQRINFMuEeS2FeU28I5hNmKbB33ks9Pscy5rV12hg/4T9N4rVJrm4y4b
         5RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359546; x=1783964346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=fmpbre8ibqENNBWrEObQJQN41oIk762ODnGkxSQb3rqAAfrf1wEkzX5VcUXw8O75GI
         AvPUqXEpuXMFB5QsYVZNWiGhyQ8t8AtSCZWciEizPBFGpjEU7hwYsBtnJGLrQTxWdhZY
         zXBCbYNshUf+yeiVYLcqZk2t5KIifcjtyvIy/oJ8nHgu8PqLyaX0Qf1x3FAKVkYUJyb8
         UElaGwrS2Qb0jTHackirAYEET+qnY/WljmELUfDGlru0MrmQ7t5e0p2kCU6X1EE26uaW
         wkDeKkD/rtEvdXXZt7ht5XlYvB8bNYmugeoO8qD5W9+mgTGBwC+SEGE23SpNHalfUTjc
         sXew==
X-Forwarded-Encrypted: i=1; AHgh+RoKtw2hvg1BbwEvgfZDi+SmfFdlH7oNTS+qzepK4X9AxeLw6mtYxbaogxmCfwmfuLnM0KsGAdKf1gC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTjmxpYvVggschFzmmzLzjgWzwA3e3nJItDaUsUdwU3f+shv3
	85Z71aSSn/XKmpYtF89w7KVBCbXxDO7PgE/nWJLSLbyEqs6XnjV9WZm6p6E4DmDpB+HqhGC0eog
	6Eo7h3PKupvjwyH38/zF2oJxxAwu0l22mgax7/KkNJ51Xf6m7+9/J5kRYRSFqPO0S
X-Gm-Gg: AfdE7cmHKxS0a338BAJc3b3JtmZK0eECal5oa7v2v/AEkNkHLlPkvRRNFmX+YQ/2n1+
	qBQjqo4t3B2CWc+MOel6ikI3XjTSNAElx3gMBUerkPDaLmBvyxRsahop+mhe9G3Jkrpq7GLLRFd
	8pKZWck1x0GA/dE7VM9XuG0eUegenbrBsBVgSJ2nrP8KX3lPreGWi/wHclyyl5eA4ILlkKhFN8s
	IJltE9qIhpIuRvrwbTtpEJ+0kjehoQJSiYPoxmJrICR6yyVTT3m9PfXvzmmSN1DQF845eTwFvWK
	+17to5/bvpDc+aYwnV3Xo6ZaT7fSLcIlpHt0upd09Po3wStS4xtfa9rFALKVvXDAufpzA969crH
	HjRDF2bW1HO1B6cok8uGpWoFNEcjDLryQ2jxH9w44YfdxN0eQJl2n6MEA4rmikoO14S8Vm7E57e
	QCc3L+B+0786qqHDG1BfEe+T+3
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232274085a.15.1783359546176;
        Mon, 06 Jul 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232268285a.15.1783359545628;
        Mon, 06 Jul 2026 10:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18af2sm20869461fa.7.2026.07.06.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:39:03 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfXx83g9UKXR4by
 lHFP95aw0M4i3aHTnFrq2PE3js2kvqoSGguGXEC2g0XT0K/jpEDsdNS8FqJyPhyWBWtw7llnOtd
 Py8v8muOCdq7dqEfrTaMkAGFxWJ8KHs=
X-Proofpoint-GUID: x4h1IDsq-61qKgG077BYVtXhB7O9VMLO
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4be83b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x4h1IDsq-61qKgG077BYVtXhB7O9VMLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX2x7egIMjHF55
 LjigXZabDsBwSsKO0dNp3IA066UHEmIpr3iQXLvCGljfPm9pS18QHMk+FuWiGS9QZZQflM5D9jc
 bLOPhXe0gh59AkNK6P53kpVrMNMB6CCdA1Thz/wE3oxnfXJMtVI4brpNTn99JRJ6dI+dVnO6bb/
 AuU8QPReK0uvh1ZjB8uDO/HShq93ls85TUIMToCAoxxP9/ZCEmTEr4bxMfHof99N4qNOlrpeaLq
 P9Mg1q3fNJhA/f/R/IN45KEwcC76WrgdJ0i0FC97gc/zq5krjyS4z/+BayAG1Y0hcxXEkPzXr4Z
 kXo4rQk2lJYA8mTCwYy7tr9/81zJpOtv0p8jonhJ20Bh3Lo/WszHiEfEZ4jq6Z3FfVLlY/vUExw
 XwyYopbunuEWXpQ6BNqPqMeVKaXticPgiDE4VeuFX7ze/rQzxqF1nR+KDmWBWhbPJi7Q9I0yFEu
 3b6uFEVwSZ9A8oND+jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060178

On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional

Why is it limited only to those SoCs? Is it also applicable to other
Qualcomm SoCs?

> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a..fab8944d7b63 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -246,6 +246,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -644,6 +651,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500
> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500

Can we be more idiomatic here?
Something like:

if:
  allOf:
    - properties:
        compatible:
          contains:
            enum:
              - qcom,qcs615-smmu-500
              - qcom,qcs8300-smmu-500
              - qcom,sa8775p-smmu-500
              - qcom,sc7280-smmu-500
    - properties:
        compatible:
          contains:
            const: qcom,adreno-smmu

In the end, we don't need to list the full list of compats. We need to
specify that it's Adreno SMMU on one of the listed platforms.


-- 
With best wishes
Dmitry
