Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D54CDDE3
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658401; cv=none; b=FzQFoawAoYnHEOJEKQfdtHXpNBiOe2RCsuFAFYOF5KmUREjzVtDzku7LhpITyl5+zEICj94WIFXNhOZmzifUQBMEVgvBJIoDOlnJvK2QMTzK3lJlZbjp71nmBtRJwa/rkqkQmLr015RMAXO9FXVmJyHn+f0W21Y3gJx8HBXLCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658401; c=relaxed/simple;
	bh=zOMmC06OkIP74H7DFOabF+/thO4Pnpmshs6ryvpXMFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCkIS7eZQTrT9MYldxBibAgRJAR0DfR/wg3uPYv7jZHLAjPgSSXixIS8M172joK+z4P+fSDU/aJFy9lOaXcguijZvOqdQi3QvRICnaklM27GHENi4rdojKXqbAPa1AF6HkcuYW9xHs1+ImmdkzvphRLckLP7dB+e2mTXjAWarrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsATsM6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY/NkdEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsATsM6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY/NkdEm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3ah2777297
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LkA790cRq2TwLYlSBrEjEfJ
	DvHMNuVtDFarizUSwDA=; b=nsATsM6E2sw/hM9M6Uj9JQrrnA52VAs0eevnWhgw
	WOaDaaRawKAAsSSPylfA7/eKVmLlnhhWd5ONxJEQaqeAdC8H727mUIhxQbtKlg4w
	bh2cKXc4KDyWjVXmI0oVvIOsubKOyjBmEm+F7+33W0fHt7/Ghzk564Rt9Cetp0o5
	XlfkksAi6H7JFCwaABTetQbNoPYKeTPyokXuliexlnf10fPlKaPmuOY7wCcVKXU9
	4dMdybKqontNW0AQCS4Wu69XpQrQeShueRSs6HUgZfQiDzzg5hgV6tDcNoHnx/mx
	tgZbI3a7CaQod6g3QmmW4MwxbU4UDCGGk3PkvVd89PnROw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m37bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91213a1aa68so13889926d6.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658386; x=1790263186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=aY/NkdEmRniAWwQT2aC0khzqxG+z2fPXjre4EzgbckTmzsPJ/2qekEQHHqtm3uybcp
         wox13xTBpyu0C3AfjlwZB2t9nghAC721M5eajUE9BNzkl1k3Pw6aq4YYDFoOQbj8bcCy
         cpL0Ji6oZc62lZuKUPXGrcytW8Bz8toxn+vpjflh9y1G2o0V4YrT76Le5xN6mLlmIOT9
         Ek8Rc3KqF63yGNkp/HprISSo+KcanjKl0v19YqXKEm+cAN1xRJxsg554U8gSQtIQz1Ae
         bGFIf8yw/DPu0dp83B82OkzsimU8QXs4oahQc5Ppsz7Q/b1t2i8MATooAwA6fe5DtLhv
         rgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658386; x=1790263186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=2V7mUwr6XQ8bmRPXFlyCd/Oy4HK6b9wE3B6/FO+mON3LTn9OYS1+Hin0eUbHsGabxW
         CxhGjpswydyF9FUVODAie9E77WYSks1c1vJc3/bknbsSSrN4UvGFcKbuH2WReogBxKZO
         DfR9/7kGH5Fe23PJngB9LsbKV50HPUUsArFIdY1zfir98fwCf7EoYycK23A3PThzsbXU
         xT3zO0vZns7pW8Eeyk03AejZF1bu5eVE/NIRlL6mlyhkvquQZVR5eGOFpoCBQsh5eoJH
         4etWWup4RlnUZUnHALEim5fRXqo+fW3Xf7IqtFJfL+KuOy/koreEzGtl9fkZ+O5aNODh
         XVNg==
X-Forwarded-Encrypted: i=1; AKwUvBwNM5QTWigfKJxxWaYcTNbhH/JBRolweDa0eYbqiIzCaBhDPDKp4/HgWClllX+x3wMY59dUrymuZOpB@vger.kernel.org
X-Gm-Message-State: AFuF++mf0nkCu9bWCW+TE9w+WBrT4bNYfoqqzJ+eCI28yvq13ltKIP1U
	yuDKXXy/MUdTPi/yYT44lkhWpY4ZW49ROoEK5BuqpYhd9FJmE54ElZOvxpxDrN02+jY6sTNi8xF
	Gwe78j7klt8i+VywSK/lh7j2jzGx1QinnuNZaq2VyM3oS1E6UG9qW/FU0i/wAInQS
X-Gm-Gg: AYBFou3NFtqOISFKkJmqDZ/7Y4eu4ENT/3bK9HVDr4qzph3vsxvudmFHEiWtXjUKnWK
	wkwaLmwy2KbMzfE+n9wWwrjkZDyKFUwV+DGI66VgfgCaR3wcf62Y6YMDdBc6uuvbv3VMxkVHlHf
	3R/fEMTd53fOmFqcNyMdT/KWO3lc0wPCCtDT4shZXV2hTN0mUFaQtSESY7Oq5F4PbUrq1hTANRS
	5HGOntHeuV+lATc+Hu2RZkDHcavYIkQ5fIl2dPFNXyD/hyFTkAiLJmYyOIBGTMzEjSRITdGdMG2
	Bihow+9BqhtA1C+RSg5y3fcemAN2D3W1w36v4pTM9WuUznelxnvrHHIlu+5CZLHGvA5QVrGUYfi
	0CFRAG8btmHtVa/w=
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13032146d6.50.1789658385918;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13031506d6.50.1789658385382;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16359336f8f.35.2026.09.17.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:44 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
Message-ID: <nv6q5d26sreeh5psbtvfcodqfrcdnck3ramzsum4m7x3hop6pk@eoq2cun5jhlp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0513 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cH9xBD2LFj_pH9S4m3kh8aauOCRlp6Y1
X-Proofpoint-ORIG-GUID: cH9xBD2LFj_pH9S4m3kh8aauOCRlp6Y1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX9uI6o4ex8nMB
 /qPBjIIdtmR8KMQnMAKF2Pq4iKhCPFX8+IjUuYex65wVVbLT28H0FlMP8NgWiJia9tKRf65Vt3B
 BBncXk8qviCQVCrJtC1aoxg5o5+Ua+xNXToIjuC8kCd2xxVAnldqQnDKRciYXJr9iG+hp14VY2a
 DM6h0ZPFviiEp75LhRJi7oDUrP1DZCCA+EaTUlCsyKE0pyVMfmonztH9VV4s+Jm/Mz/0Gd/e/e4
 d/2stdXPHO/EKuRoZNhyzAaS5qZYi6lyf0XjVwxRVSQ04GOCVyW0054yYD6XgNALewipA5SFtw8
 58hHWL+eaFsD6xM8Dq+Y8j1EP2k8GQN5btrzuCKtAwlFWVo7btQre/bUWCAakQLGz5SFcBZjeW+
 1hkHzgiDlWmgJzN+af4xKu0PaBHWngUBJNXWjuMuTzcLOMnFke8Pv9VlZ/4Qh6pZGUdQaa0NM5w
 pOa5QeWeGok/lXC/Ixg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfXxmh7qCjrKiDK
 dkQ/n0WL/awSxIpFiDsXkAidGIFaMVers4/zQgXEiDNflZQ7A9AhrETbLgefTlOjK39soZQiD1I
 FxzNn2EG8mNL6Q9rYivvJIGu3Xua5PM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 17:55:21, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
