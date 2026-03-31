Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D953EC2F4
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949034; cv=none; b=uC7CLbk8ct7aMrX7dnvE4KzkzzKsayR/EhndatiBXkzsMmXcRCqjYcG01QuqtkByZ6ZjYEJjcW5Tw1NMoPoIL4v7ZyhrLmc17yAx9IR/o2MKP6pr6pAZlvUJaxOJ1BLghYbAw9gNCR+GRpuIVM3bnUyP92kkf/XPa79a5xOyhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949034; c=relaxed/simple;
	bh=iz/SJN64s+bT2vQ5zMgr/0dxMe7Mb9gLmpbZUXqJF8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPBXZLuQ6H1wYB8zGEaLSqYht45yg5d4JYL6lGMgvQ/TvnOcdJAeyCKHuwlSOReA0ZfGQVKSM05kkxVotQ73kYjQIh9zN19rwuqRyARaqdivMjQuaf5W2is9nkaNcg4dbSbC8R0Tk7O3/Ku6qUCSTqYFfN9VmMKrYrtUP3aSQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgDjEYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en58lRZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgDjEYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en58lRZP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6K3tN1090787
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=; b=kKgDjEYV2nwPCyRd
	mPLjJcxBkpnZCFfh8t0Atks4IYH3HhFlB6Xpa68fC8f18wPTECZUZ/5sJrM1oX+e
	S35FdXz8mIn1KZXhe3bprKLplCHT1JYQFWTwIdDj3IVWh8bQxg4oQ7PATAabnihk
	cxN+bb1598xpGfNywMOhG+HAKVOgDXtAk4MS79QzIArQD9tcERIOTTa0drbAcm04
	/sRHGVDF5i1PnKnQ13h1eRJbhJjYL1HdqAMAh4omymh2ATeQCuli2tCjXsco46eL
	dZpIwDP7R7tpLBwu8mBfOTVrDgMPKlV9VDsEjR1LTSiznOyDHzRGJHEyP4s+XAOS
	A0sDFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd40en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:23:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so64560585ad.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949032; x=1775553832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=en58lRZPq4z6CX6X66L6nm3CcE5dDTvFcJYXOxfFu5o9Lrp0EH70DJzhPItnwiJmvJ
         dpK+YUO3uWhpycmglOqeEWgLlfuxq2cbUQ2WhwK2ATu3Mto1Qu6KTumI22Xe9+j996Pw
         1i6l4JyO4AxUcyv7D0ichCPheePZu/4EnMXwJIESeOpce08/ykcKAvMJJraFYHjG9+aC
         Bf6RMvBwufUJIcKm2r+tow81Dk4jzQy55UC3hIaqARGvsd6vq5kGHaCFj0WBm/BhjWmQ
         TRkB1VCm3HgHjGKA93+FiAIpp4WEPv5N8hRiPneGsGsNyS3rZ7vmZQL9a4Eq/nrKOhQL
         2SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949032; x=1775553832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=c0qWsaI9KUfKvznn7fnmuPvn6NmdJsoE5J33B01vWlRrjFWa7EL234fJFZk+TfcdKM
         R/OwIeE9j9sTAxEaC50EqeSlIs8w/3zG/GrPoI6NrF3CIo6QpCuoPF6ejhkMRrebGcmB
         ldg0SdrsCMA9C5aRDLwXREB8IwK5/aWfIvRs9UrJZWKcS8JPCDdZeVjVZl77MEIKT3dD
         bXMb/zxMDe+9AOiZwxF0G4DQQBdLvyhMgPKMk70G7mJoFEtpZntDQ9hQRmHUL6ycU5E/
         HWkXMT/oE+LQGerkVy2Nb8RZuqaKuFDRakz/PtoRyJufhbuHLRSqlYVBoI6PUkzXslT6
         j0hg==
X-Forwarded-Encrypted: i=1; AJvYcCWuFwqbpLKyYrDkhv+Yv9K1QzRSGNeS1S4GzbIR504NpOnUbug3c83xL5nKCzKn3S4cpYxQiZhLhAdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKBo33rHOwpC6+itz8Z3wCH1HGenERT2fdXnOBL3IDE60gGkc
	doHN02Sp1pBYcIr/reRgbS++bWVu8TKbfePh37KTJHHX69HceLlCUXyeHb2RTHkJqSVkHB7fHXQ
	QXEm2D9T9AU0OsO7ifxeJFtFprlp7PM44aVDXkzpe/H/mYy0yZCeeIJzv3pXMsL9N
X-Gm-Gg: ATEYQzz1ITMVSSDomUIE4bLeb7Bi1G4G+uu+Vrh2f1M7X7GKS1aEwkxGlsT/l0QOFO5
	E7V0/quKlyvK2+aadEl+gFt7gGABpqSdhG1hlb/fxPiOYP7pr/H6bgZK2CX8jnxKdmHXHB3VpZH
	t2urGIcXQlYn3nMj10W3eVUrxKkqBnR+Phdy2luHu0WVNjN5J/8T55PfJoAT601no62kfbBWxKo
	wnJ2lWgBGqyRJQUec4cHLdy+nrhcK38XO5Y+DPHOmlURpii12om3nmTMvNT/6RrTMjYCkWbjr/X
	eI3bflkqQQKzHQpaz5aE9OZb6v0VEKOp8IKKU34/r2QZiBhcpHPFPaU6gmuPT59VHkjVie+oIYZ
	JEjCnWWV1oI6TocGIrlmlhssOnRqWlVpQAXoo/WhbDdwyuAdHPw==
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66423125ad.23.1774949031868;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66422905ad.23.1774949031392;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm103836315ad.10.2026.03.31.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Message-ID: <1b729b69-a7b5-4a88-ac25-091839e40d24@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:53:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QyOmEs8OpQbo3QmPpt0cR0jhvmTu9qOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OSBTYWx0ZWRfX06Deh/0u3M6X
 54NHn06jAgCxMj/u2AjmqAo0GNvwkogbu/dOMOMDD+lk93JyS+2cvSD7zdQicsEzs1vvHBgUejZ
 ZWRMy54be9V3qjnS1NOpZroscqu8TevzpDX7EeCZAkn4WCH023vtb3xUTyk7ZJrgUvPdBFkI6HJ
 Xo79vwbJqir9mXtr8806j6z8ZhBwJVK5iLcmDsJeRoz6O2qMN5e9f7IaxGV3oUFaB/0eoMJ3kqD
 zemoyY5OVI7JKi9ZUQptEbG9c/hkEKaDoSnxQ6vS3TALmIlwT2Hfg28TMc6mkZFKTARlu1cFhs9
 PMAfxlPP0z4DsLcyeMhuqgkhsZ0QsK/szhbh+1def+3Yj8N4ZrMwjHOFS1k9ixbY7C+kj7cxve8
 4OAsWgmRjPcAfYlqLHw7bOoukctWTzR3bxAn8vxnGBMdp4AF0bZc3sIdbwxcdjZuNtIlkUJZNwh
 fNuew/m8x1BFXLXBYXg==
X-Proofpoint-ORIG-GUID: QyOmEs8OpQbo3QmPpt0cR0jhvmTu9qOZ
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb92a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310089



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

