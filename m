Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511736A03A
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026701; cv=none; b=JHCuNAp1zM/wHI7GDiLtnxB9zDfd+IlYbDV1sk/n47f2MG2by0vhxDqXS0RnzeJ2290glFsxhy9TIV58vbW69Gdq0MWbBHCpIhXoVqiRqCiDgfzAi4yMsu3SgGH0xYd/6S/ucwtr9ytSPNIUwExOpaJX+YsW+eIQG07TbY1+USw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026701; c=relaxed/simple;
	bh=FG3QCVSbq3Om7M2OWawg0Pd9RG7BZq2/n7Sii2vmNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4T/eOwKfXzTfGaGoE5iHnUjQ3AQSZpy5YGPB0KM150Hl4uIK59NEiL9/VkmMScb1G+UAW+roqSSwuhIOcGrAv9KdmbafkK5goQpKKdeO6Forg9D7Y8qW6T0t0t8y/fzISXeLszKOPKFYmrTvdraYQVZFtPmqkx47a/mwxfPJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O63MnVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMAkFblC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O63MnVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMAkFblC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HK5o518371
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3HZiIm5+GXi5uQ/9khASeVT
	w3Fme2svbGH3MAgGRVA=; b=O63MnVO2aBDnLwEUtjnPvu70l543reTQVGySnbc6
	y7s2JPC8jw2/7wk6tCCKVQ77Oh3G6ZOB8Mnid4VLhHuqpqQNkbPX2Mo+zdkbzQkX
	m1DqgTi7w5XmXb3a0lxCqKFWTFcqQjXu1F4n8aCjyf/DtHJB+PHnSxTT1a1x/bO9
	H1wk7uPKkOzi14Gn6s5dcuT7WMMfsg1zdBkWlaFbxjOC3FSfvGTh97yCJyoPIng6
	l3ViaTHoOsxxtRHOplnNN4Ntqj4kq1BMnPxK+Kvp9KE3c10BQODG/x6QRYL3a6VF
	cv1zp+KlzNSDH+hJJWUK4Z9ocLWZwXA3rZ4X/6EWmmL97Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhkkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:31:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f52dcdc90so5335713e0c.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026698; x=1777631498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3HZiIm5+GXi5uQ/9khASeVTw3Fme2svbGH3MAgGRVA=;
        b=DMAkFblCJUTKGNZxUKI0KupDt9ctQXc6uCyJUuCqIzAo8eDk3fQA0jrAP7QTMKzPmV
         SxN/kXcRcgMpLhhVdnBsMxSs8Mct72ZRV4aKCQyBxSYfM+ADWd4BGCdcx/PKBeYSdPfZ
         1NKw8qcL/nsPNJmY3EYVyJT5jna09Dt0TcEHsPfy20h69xHhS/7SoNZuBahSQl6v9gWR
         X61NX+zO/XgJl2eRyovhxCOPmYuHh9hHbwo0JbI7aGE3AZzIhg8QnHL13Apj1336bJxw
         EWGSHYrkm9YUkAllBtxapGbYw4Y4aOISN/wy5ZRHz8xC7aLRCiQ6XlRnnQbzMP1TyWZB
         0uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026698; x=1777631498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3HZiIm5+GXi5uQ/9khASeVTw3Fme2svbGH3MAgGRVA=;
        b=BjzH2JtWaqlizdPXOcFKEQbmBpZPktTcnmUtskUsOKcw8d5jvoctrEZatbR/vTYZUN
         RO99E3d2XBRdQXx9GQL3J2F8kF9zOPh981N+At8bgKZJGXI0PX3B1Dxfxx3t3d8kacFV
         8S40wHh0aPX2AusRADdHej0RJ1umN7wwckRpCD4UiwwG1DdDVh65OfuZSOL0Ygn5WMlE
         Befu1aJz5OTQTdFuI7EvSWta02s3HOdRHHSW8/fimBSXZv5L3A1dXPpxeKJ6AOY7t4go
         UBDuCJQLlfmnl16ISoFs3eIsazhtoRXzuKunRo46ZO/NaA6OedGZRoqr4WYAC02K8Kzq
         5wkA==
X-Forwarded-Encrypted: i=1; AFNElJ9MLJ8I11Zze1nRVKy6HLkndgfNHHOpPqJ1QAuJqnODb2uTey9Y5fluWitY6v6zEyWpm4nJHr4wwp3H@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbEK7i5/H03pWtBw4vJQZhj4qX+hw+c1fS6Q3jMMfn9C0mTkb
	Py+bFqpjiAdM/K3ItD/Xg8ZFt361K7mVsaJSGN1hAjTvaN1V1zfeobX2Mf+Ek2LOLJ5OeQLzW2O
	QonErzSP2MUGgdN4UJIIRjfHDWPHX+tsLh8jOp/XMKxbEB2nAdo1awTKocc2rdO8v
X-Gm-Gg: AeBDiesDZudto1xLYt4tKd5LKqi7/ODLLADeHnClmXCZ0YksqTMPQCVMTZ7hhdw5of7
	sm3dTyH88QdY/RaqCssIi/r04p+ViT+qnkm6pVTthRK7Ea+Kq/I9SqGv//yqD5fXTGt3xbVpTPk
	bvM+xjaFEparB7Js1JU4MPRTWYfEZzMtXNMWckYm84/YcY7OHZdR43W15WrFBSYlk5/acsteRgb
	OhCgz+3LpDNiWH0I59b2X4s2aZnquxdmnLmdczBrDchy0M/3/2xhHCnkEB5fE3LBusiaw221B2F
	YElhq1i15IeewjdEebQxju7HuKmM+NIe5M/QJsFfGlMrurzmjj8GvUzqUZCOtuFWvDvuvrfUrL+
	Qemh2jMA6zcV1tDtKpJfN5ovYkEOcTVMFMM90K8QJKaHl6Xg=
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-616f474365amr15009703137.4.1777026698381;
        Fri, 24 Apr 2026 03:31:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-616f474365amr15009689137.4.1777026697743;
        Fri, 24 Apr 2026 03:31:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm59900243f8f.9.2026.04.24.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:31:36 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:31:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power
 domain to GCC
Message-ID: <6ksxaaqyhtle52atgxudkqriztb7g2om52uhd5jmjvew7fblqj@bjavdc3leqf7>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb468b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX9Z4O9H8TvEp/
 HwDe8stETOzmjKnd0tQWFHZcX30+99QUO+cE8QXS0MAElyeL+FacE9zmjrwocitDogNiqRXxOwF
 mlBleZ0gBpVfSh2IZJ8D5gBDX6fD6Ndtae+Wn0o37VUtPk5z0ecxOkwvWnEtPj5ZrJhb8Q/uODw
 ulVUo4g/+NRr8I87Xw8dZpKUWHGgYBJZtIOC3OpOXFBZW05ZQhg1KOclpZD1D/Qr85zlhzhnoxm
 0hymyQeJTCkA2Q56Gv/pZ/SudElTUj1iWcgBO+nnxf8WfABBBcYjSylZ9dvXFAcp5zpaKSoIdM0
 SXT4mG+05wIrGonqdmLW821SpE5OLzgLknWQ0D3sCGZ4pyt9s+o7ov57umNFOpbdickquH6Jl9Y
 6bNQbRwe+9KMiBEzVdyHyPBXowtD5aUXgPoGXdJdcJTvjR5QZMJ32i3ENmS+XZBp8AzaJgZrpJx
 jE6Bt8VNztRqVFUvnow==
X-Proofpoint-ORIG-GUID: 0l8bXz3J6cRL2H1yMdX2GX2_UVzZ_S8u
X-Proofpoint-GUID: 0l8bXz3J6cRL2H1yMdX2GX2_UVzZ_S8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240099

On 26-04-24 11:07:59, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
