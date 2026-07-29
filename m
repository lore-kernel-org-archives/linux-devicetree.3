Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510C455189
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339636; cv=none; b=Pl7jZXtURAYyN6VoeJELjO4fjVHOCb83CiY4gFF1O9EiJxn4BY3fn+i/2BJrnlFzW3j+wQq7U6aXsZo4dheaow1FkqUDmDxTnhbKUZO9Kj5jRTQRGEZMiGqfzFlaz650XUaBzae+Zd1NBhKU1K4xWCYS5ldGOylrkvGIKXGhtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339636; c=relaxed/simple;
	bh=boRM9BbxydKBTqZLcH1IrPeu2lNwFuFv/YoQ17FReuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd2pymtvNEaOXLQ+P3GeBJnZBovNKm0Pln2h83T5XqYvg7hZ9qoWTmou+hsKij6oBq/2EOBf4uhzot7AeozVICqgy/Gt4X4ud9FHPmUoa71W0GKgFFNqwqLgnz7YgmjIW+lkcl3P7qgJcm/hmQiW4qrIGnAYxmXvfCxmR6xlBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/soHykA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKo6zl1T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/soHykA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKo6zl1T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2I1x2193079
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wbEQBWqENtkMB1w5Wyv00PZg
	odESykVMvKXI5bLwugo=; b=o/soHykAtpHz5PudiP58I6tZCLfgikfopz2ZKEPj
	b7jt4zKk/fj2U0xI+7jqPf9sU0ho/bXaf6mdHehqjhrrIJZaWA7MEO+7TzbVa2IZ
	Z7KKetGWanu/WJnaCNYbPxy2BHgb6CvlhZ6U/MGdX2T8FqJASXLzBZfncT7Hyd+8
	zd/O6PjLW6U4MDPwb4E8iLerDRldTaJjkWO1ceiSIh1hwFabrJPzRRRejFGR3qBN
	3M930N5cibnF8Lg9h1Ebe1mkDpqkRs6Ak4AM0KI4M5W87PqXs5BwofoGkcAmRAit
	u7EyCp3qk/V9tZrS1GIvV9c44F8YhDuBeg0xDeR/PTXpDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkfm8csx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so12029511cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339633; x=1785944433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbEQBWqENtkMB1w5Wyv00PZgodESykVMvKXI5bLwugo=;
        b=hKo6zl1THSR2lyMWZXPHjmTrzjvrU8izh3iQALOJmGG8hWKgB14ShZVcY6SMnogB+B
         L3IZ2NcCsCrLgymjkkL6Ob4i0iekmty1Dq5sVAryTa1AnmH6inK6leEPbcVcZq9cRz+9
         zMGdCdW4rgV+x6Kz5kH2PIBBNW8N3wiog+GTKKl8OsCK8mPpJsSlQb1ub2axbD7GTIt/
         5NSkbOYuta7h6B4RC2xFA7VgG5lCoWgwR26o61HA7bn/C9mIxY3RXrgJ7tTJ82D0/aTi
         65TqPDLRCL3+AC9uLOZQjnuLWDWly1dDSUbImkC6Y17J/SAxHZPr3LQSt6QuAaJ1J0jJ
         /7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339633; x=1785944433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbEQBWqENtkMB1w5Wyv00PZgodESykVMvKXI5bLwugo=;
        b=W5RU8fbJEgNilrzl0P3VdFqQB2WEcSyd29hlRgEAPle3fTH4lbm55jEFC4EWLo4qu/
         IQtjx5C7bEgsIcWGxfZ6I484pd+7Z4lK8dut3qja8lbU7WXMN4g5647Qn00OiiYevsxL
         kQH5MRWGrh34P6wBHwLvrr/IXi7EQDtixvBICF8/nH3oO5umbji6jsRttyeiYqfJ/pCf
         9OdenohD0bJsuqfbSER9zWv3GrrmrDl+/Xzcpyj8dfoldeWw776HcmOZmAYapR27Qm8d
         cVcBJ6H4xMxU2e5uJV1WsjYCLqaUko/Ub2DX5Nn8rFgZnet5UOnKly6Ywusz0oedpZYh
         3YSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNWa0AYCpC1t0MLT8pBZOYv1bRvjavwC3cNho5bGJnDPLuTJnJVAEXnT1tya4h8kdHG2IZs3E2H0yO@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHP7C1Kd57evjtRZgdn83Eu9s32q6aCHoMqr1xg+tZvT0hmMC
	1kZICYicwfZitFVxjfRd3pi+VhdHfHGPkSGtGfqnl+FaZcd3XTXu/BKk44FIYDTc5JJdfgMFDmO
	1U8to06FDXoA4Ao4qPq5NxfH76Bl7ihqbWFJURKrmbEn0rXHE887jWnKGnc7ezzfq9GrXu17N
X-Gm-Gg: AR+sD11oZL/bdng2ITg7FIpsTId5VCHf62usF9ZECDKGphwAg/kbh1ChF02LjxzzhvT
	+Cx9o0Rb0om8F4qVHDw622y8BiIAoVxBC/xT21iIbRfGB2mZqvrG1BR+rVvD26pl3BRAiqL1Sql
	/s7eE1YrYNu2d9vvIJ7bbQrGt7CrLAkRV/Z6xoptKa/oUilppzA1XvH55au2Sz8FaTtgGW6YDl3
	j6k6l3daJTcVThANxdPZLWUfQuWmn/3fPHx8oeRJM9TrnD0Hv4xZy4gCmQ/7N1ClPK57cnIZ71M
	t9EgrCCWDW2ukcY/voxU0r2Z3lgPKivs4j7ZJLgnmep5XQMu+wDFy6jCT6F2chGpKN6xhipPc+n
	VTRMW7XysqO1A4cQ=
X-Received: by 2002:a05:622a:4117:b0:526:d946:fc15 with SMTP id d75a77b69052e-529d71408b5mr64073841cf.66.1785339632807;
        Wed, 29 Jul 2026 08:40:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4117:b0:526:d946:fc15 with SMTP id d75a77b69052e-529d71408b5mr64073261cf.66.1785339632098;
        Wed, 29 Jul 2026 08:40:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d72d9asm68554845e9.3.2026.07.29.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:40:31 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:40:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY
 description for USB4
Message-ID: <lmchnasnykn4v5nxnucrlmhpxubpozhydte4qzotao66rgch7u@jtf7jn6wzopt>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D6p37PRj c=1 sm=1 tr=0 ts=6a6a1ef1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qXetow4D2dObSurrW18A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PNXzjOnlwlsaR1-BtivOqXy3GRCLhVW-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX66eHbbJLm/6L
 i9nKJQhwqVebHSbwl9HUhdJspRCJfi6Aiygrm609eRgDPBP45Pr8Wwfk/XQVTumU0MytOIiu2c1
 NqULkB4HUFirQL+uJwBMq0lz7HWWIbY=
X-Proofpoint-ORIG-GUID: PNXzjOnlwlsaR1-BtivOqXy3GRCLhVW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfXztTHPvugMhIn
 zKLiXP0gsRDrJJZ6dHd2UXFfmkcCazj8p1Nkjc5FI/RCKO6FYFVWKjSsckJBH6oi4A/lpHR9uSM
 31E9PP6OcuWIvTtPyk7ZtGjpKuMD7x/v5epj2jT6GBZZkTqfMJmxqLjO0NBmzJmOJ/pt/Cg1KYf
 jqRO7xshon86XturKWtB2pSn5IIUbRn+8w7QLGaCWSi1BX45c9Fh9tyPGvYakXDH7kqKGgDzTaq
 aJlxRPAe/mTz0021zU7g8EuzGfj/Iz8X58WSse5ryKnTJdHdM7jKmMSaUGI6W2K8n4lsSbAc1/k
 7w09ECI5O9I+qAerfT7TMzn+iEbFsmwXPZA5oDpYn9HvrOI2twKhROpIWcbN8RPOqqknwJekaty
 LoXr8VBS5wWon/gYHsch92xSgIMpHhvFEsvfohBzKunMek4F3fyS5UW3Xoo4zUBCKDV35LSaT7M
 xeplHrQ/7sHIWTC15MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-28 12:10:16, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
> successfully. Describe that.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
