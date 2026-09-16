Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF03A4DF4D7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555265; cv=none; b=QKX1uDe13xx8uOe2cNUHqIGe8SjCFmyn1pGPuAcfAFRBQGu/Leq4XsNzZZ41pNTbnkgGb1wNgpyJXj9aCjyrPFclEafRx/oIxzsFeC/BHRMxIL2Vydo9ucGf42kOcNBj5fT/6Fsc4wGXvd+SNjXVXSIKmDNglRcW+G1wIzNyqnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555265; c=relaxed/simple;
	bh=yGnIUjthxb6U3IZAyKNaNb2TbGvUsCcXifAWxRFjyK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+Np4DKPbjL055ar6rqv02MpXOhz5Lj6KEfn4MSl9MvpxZfmLe09dwhn43SAHvcGWaiCJ6Zf7i/QuOwTwKVzd6Uerpx9VyL5Ikxwr2BWGTMMni30WzEoveft0yp1oCWHTCCAYlzWcr/Bj7aKaUnfSFAfIoE71IGHDLGs873DPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKqWlXSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVj213Dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKqWlXSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVj213Dp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92uLp1553083
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sPwZD0T5gkXfc4kxDoR6r3lP
	6oUeHG9ZuOKOLS9rEHk=; b=AKqWlXSLblazvsrBHvnilIv0zLqZiWAVMpl1wuOy
	2Q9dCtzFaZb8mjem70clV6IkpzAWwAXiYa2mB9ZaJkviMmM92XM4lSfyaA78LGS1
	8dof28FPQGOAN08LnTtGplxaEb4bcNjsw2wPNwGcKcAJn1phjjq7JFVAoR1IgL7X
	C7rF5ETKGiY2ZUs9mZZ7PIDbIl5V4tjdrJ2NQxxbYcM2fkZ8J+aqhiyyxzHpTKLF
	L1WlBhR/1vZXg1tkI/91bNFqVrYUIuQsOhjo25lyhDucO9vHj6V0X4SASth4F+H5
	hH0AFCtS+0/sykHUij4VtxPKK3P8+xKtXSG8zooCSdE5KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n6468d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so381489285a.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555233; x=1790160033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=AVj213Dpx7pJMJXmXWEYu30Yk7d+K0gU+GwGE4VI+86PxxsfroYH0ksCnufepBnrCv
         d3BnkG6clev85CfL4vMoXprD8sOfJYicAq66ylolkW7e+nXvbI43WRWSq75yRb0QlpWX
         vv8RzGG3taHjyqSsKI7djtfeBwaYF5yRzPYIItZr6fZ0TKruOxuWrw3CEFLti9tXmhWf
         eY3AFQMibaF7kQbyCpjWWK8mYnxMVbV3X99a8MpGu0ztMY/R8jsXF0O+v9uSQeSwqIZ2
         DksqxH30gSIEkr1xQxlGrI9smRRJRk7d2fgaE1NeqgdJV7eHs4ck0a6Bmky0Ib+seXDT
         4emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555233; x=1790160033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPwZD0T5gkXfc4kxDoR6r3lP6oUeHG9ZuOKOLS9rEHk=;
        b=gHG73hlHkwavwdtocZlO+wxTZ6cy0mZo8tte6odoLTByWzSTtM7LpFMjkvUe1Cxq4P
         JI57vM1YUpccchbEXT/NcNlCiepCs6Q3IB0D2Sn5TwJVY3otEbhKcf6A+NdfRhNc2Dgl
         luTxasppSyw2AQ/ajDxQqoHv3lIN1gxqzMsHK4FTGRFOrdTLkBjNqZh58z3S3sBZJGU2
         gZG0EDeWR8BpkmzN02DZoWQYT+wx1lVStNFPoR0Ox0+Ywb4d/PLEczVMnFpHvobAXTuK
         mWObms8zo03BErCCgMoVHKzZpjzcSa/SAzZUnFHPQP3uEc5gqxtQGHIT+1sPdZsfQAmJ
         UbKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDSLXYgg6wjxmItZNCNertWxOvjVM5rpou2DP/2joI+ClVZLs/La+arW/+Ibp+wuZfSkcnNXHJ/c4b@vger.kernel.org
X-Gm-Message-State: AFuF++kJGVoLtmPQjwG1RDdT3N3k+KUIOQ+dLIoonj57LY/pWZ2RSnWi
	XpzDxD3XTMcBeK338oGU8omBW2Szj4Zg1L+za9lSwGg+uh5aq8aHa06NmQvubEqFzc70K7BgRmI
	HZljlI6Viq0Jj9IaHh+WVgQzB+c7IKjZW3/qsPOyy9J+s68w0JJzfNPRiip6fI5Qr
X-Gm-Gg: AYBFou38oBF9E1Zz4WTaQPkCecIiXuwhlu8zWcm5DcIel9k8CrEC2ZN73W5Ppyv5AVo
	0cARRGK2Fop6RX9NKiPmZ5ytuKpYAKloEQvRrQpphApDcZS6c1cd+yvlcNVGWApELdIHW3LXve0
	lBXJ0hSYFLBMkNV5eW6ldMezEOGZZaLCdnKYaoHHEVZYt8YR7tpmNEmER9vr1uxZFmKg1eduATK
	to4ipqY4lr9fQhgVX2rQSFL9ozqj7qgw0dF3D5p8gsBL7KW2eEBGyEagUzRPBVvH1cyr3K8BKdx
	IZOUvcjz1sLEeV6dwacYaLiVD8CHNWUf2K7qcdmXzmfEVGWBshxUWW8fBgYA+qpp+MAKzwP18vF
	79LP7M5msExbq9Q==
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939027985a.39.1789555233121;
        Wed, 16 Sep 2026 03:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:8d3e:2979 with SMTP id af79cd13be357-93a34749cf1mr939024085a.39.1789555232607;
        Wed, 16 Sep 2026 03:40:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27a36sm5963586f8f.17.2026.09.16.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:40:31 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:40:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Asus
 Zenbook A14 (UX3407NA)
Message-ID: <ai665my4qklqqceqnnniawxaua6w33onyytmsjjp2dx734lkfg@ggpfcz6iv77p>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-3-41de8669a7a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa7222 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=djCmDME5OWOriDNImSAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX9qOn80hAhpFW
 m2mpKfCmUO7LvEumBPgDaRR/on7lqfXT+VmPchzb5Q+fMgE2o1w5LIttrzvr7dNNX58+E3KZmj5
 C8tRoRxAuy8t0F0zT3VRPX3JwRWp1ANgea+3QZviqtGKHo5C/KyoeBZ46Wvkdt+ZAhLbsoIqiPN
 Rx7kEqhvhX0iFLZlJkNfV1C9LbVUryFGmirT+ls4lHT+o3jFpvegkUSRj9WThCLofVqByuRgXK4
 3XViTLCvyaQvM6gV/vkEnJFp0YuL8pdeEzuv2GN3CozsfQsdpXhLJqeizfUacY19+7R6iVRV/F3
 NryTmRo/YJdOM8VPKACr4jGCSroGYFMfZG/L+pPk1QvaMA5Y4evB8XsGmnXGHOzvlbjm1tB/60a
 XYeWlRUy425wvjCoCf/7/sXoG2TKknMelPloJaMGi7qOIghz/rAYMEohV8ygF3SsswcJBjmDgmh
 FvBjtK88H6CjSjDUg/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX90OdrTPvodCB
 asW4g6llaznXl3s4kdIefdGCBi1buP0Wal/pREJMbXaQnmlduiLX4F6993L4Lt0gM/7U9Ar0I9i
 cG5nFPC+tKpESoO6hybwXsZWe4oMhVw=
X-Proofpoint-GUID: NmCaRWS-7J9cjCoVmzwZlLl5CHvnRvOO
X-Proofpoint-ORIG-GUID: NmCaRWS-7J9cjCoVmzwZlLl5CHvnRvOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On 26-09-15 20:54:24, Bjorn Andersson wrote:
> In line with other Glymur-based machines, the Asus Zenbook A14
> (UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
> QSEECOM allowlist to enable this access.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
