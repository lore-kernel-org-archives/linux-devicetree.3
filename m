Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD55471D1D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307263; cv=none; b=J/msJAILGM1rlTspLzDLn62eyg6KF5NREwYuW1I7HmULR2owEB2P2Uzl6u1Gb38hBnj4+99qEaz5yzxBeuJoauYZfElVc5N0/rS8nx6en0wsOTlz5u4fj5AVIXO5oEc2an9QD0aAqWNYrbp5pl3FnEzr4f/cQr4bMNmZJXIuW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307263; c=relaxed/simple;
	bh=ogCP2A4PXSgYixCatTUIw3PNEyUgcCxbSFOAxmJM2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI/aDGHqMAkDWKfaUx2SohVZXizAz4D4ruRLuXwqFzzIfnfp6jlQlJVj9m9rqCZp8QfcrepDS0BIWYhnCtK6CxEZiy6K0P35VNRqRmYAJ7m48CxucZ7nVp2Sks07R6bHTpYkuVx9S2PRefRltN/rHAvNoq/VJHpmwPgIXol81Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ah5FHfDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDKR5UlW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ah5FHfDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDKR5UlW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LqbE1025255
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnYVTMkS+WWlkVK3zBqZDkx8
	gQZG7fuc4gpwBwK4/PM=; b=ah5FHfDfgf5DXF/hSIAUdVtDDBG7XH2AHqlBaQ9x
	3i84OwumBXM/po6PlTt2oZXDe8OGtrJoVZSMsJ8V9/zjS5qVavqt7al6CZoEemN4
	+8qey16CJ52DEx2uYWF97GdrNR2eO+LUjzq7/gZ/2M+w+ac1h9doRgN+n7fTGFIf
	+NADrnQRX9PSIOA9s7HDvhnQMIXiLnyzbRq96g46vQdyeh8oFi4QXF4k281ztgLp
	uHaIOgjkAMKzJTOOx4BlA2MSO+3Ntn1p9IJwtHySRCrVnae155PFaLO2nYcy0FWs
	Sid8pUfKrupwJdMnKmPQLQVeFckXf7z4c7Aj0kksOOY42Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gde90qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:14:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d9cef8d15so13935851cf.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787307243; x=1787912043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=PDKR5UlWjD+txUMGZXYxg/InNRardcHb0CPhtYcoUvw0wcYrYgyClIMrmhLVo06WqZ
         qyNmaLFGA7+uSVRnXxY2aCUYYoZa/dn1ez/E0c3BjrIDfOvNb3aev2NaXl0RoA1h60Mj
         FD4QKfq7zAvpaL4tR37jYGopfGgWpAT7jEHwJHNyblUTmrnT2DNkccg0eLluUZSLgdKt
         mgtDZHBkqJWdBRO4bsGimhXEnZ3P/CdjTFtT0NV3iloAzecu/oZwDsZhisMAOhTCxS+k
         b7IUJYixyq9qNqu2sjXDmdEWS8WjXALXsOJOt0a81GhuA0YWLQW1Fq339p2E2KMD1B+0
         ap3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307243; x=1787912043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=HAlHqYOr3uqwYTo8Dajy4za8L8GnpcOmeJAOBuLNxVoBNbLPI32xHrieJiOFQb4fmz
         g+1TA7dpFgTp+D6hebtIz9l39zODkS1UqgpFboHzAg5kaw03s2TmXp4xzcqEwZZRD0IE
         xy1IJzon5Ufo3XgFCqmvEmqyTHzHlJe1LlmgJmf6u0O0LB/jpu4XnS8uRiACxbZGP9wA
         pduv/xHCW2iI+55CZr6PopwIeaVnEhcfiP5FmkGm/sEsU+fMPBx8aDVBX82u4F9NyejS
         tGemyUpi4z5YsJmt+Ng8Yg8LYvpfLKQOSv4VpYkeZAgBZtDWfmgcDgTdPraDbSn5s2/w
         oFng==
X-Forwarded-Encrypted: i=1; AHgh+Ro1eb7ekLBgdjmPqKn4R7L4qro3+oC6MLjpAu0DaU1BYmoPTNkWPL1WcJwWr/onJCjMTaX2qn7wCHfR@vger.kernel.org
X-Gm-Message-State: AOJu0YysYQ0EoKc/bRRYUVxqhRj2Xh8MobTO8M2sAicQ77qfV6fDxlCa
	ssUrkU4i4og3nosvW0Sui4Q7KmjR7Li4BPmAr+L57K+6FdZL5OLGWdPIM9PzPrtjqZYX87xUHA6
	p2EituZfdSoR7UwtIap7MvvVOqfMjnFjhwCcllbxA9vg5jL0GDgaNd9OaMrOoaMQu
X-Gm-Gg: AR+sD10ZqxXZwzJ0nx6zdTufU/5AhDXoGSgURW/4g26qPvID94aqeE/X2THuJzD2VDO
	CdEH6cvC4wsutG5y+XZAOiDbTbZ6al8QLjEb+eMjK2VVGJp+KKMB1bAK2tht2znSFZi0LdFjU2K
	PB92MyBjBRo9fisubWTAN7+c8yxMP1L4v4I7m6OkAxg/s62upctpHpkEHxXQIyuF77Aul1YBN6i
	vm40brJwrS6KLefBVJzgyYalJy0Lfyqr8U5YrK4bZSjuHx9BRskDxR9w4jD6uLR0QK8LtrboBFK
	6udF7YvnrO9X+VAOFPq1QQkGh4SuxGqKGM9oAMfhvfVdQx8s6qdC/k2YvcbUvU1r7bKRFsinRf9
	8A11AJ0ASo0w3944=
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44018101cf.37.1787307242808;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44017741cf.37.1787307242360;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm466632966b.20.2026.08.21.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:14:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:13:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Message-ID: <ftucic3bz5kxsamuzryt2l7xeikbbefetslatnx5xvbtvnle6t@adhwu7nxzabd>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
 <20260821081125.4522-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081125.4522-3-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a8824eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rSoAExJED0QYgwLJ6goA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ea5pEaf903TBNlKaGusePdM0CFnTCCug
X-Proofpoint-ORIG-GUID: Ea5pEaf903TBNlKaGusePdM0CFnTCCug
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX23kZIJfodMgE
 x3u7GNaTvb6GdmzGYN5HqZKdepNmRDDxiDbPn1K2zgmU7tCKo8Itq9aBWjJzDYAnS5wAAvP652S
 /yAVzw8WdCznWxNwohPFzIzJHzZzwAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX5j9bMu8qjPZC
 a1NQKTGX8OZA/ShGEXsQnegemrvgqaxhwAJJroH47pBkR5FzF+rfuw73e+ZX/tfJ3Yiq5l2I8xf
 CfJVbLD/aN75Hfl/h7ymrgYW9abLpoioPfZsSXoE1j1pocxZ29VIqelu9tj1n2s2Ava9z4k1UY1
 gId5xce0/FSK5yGwf+APlQBOKuc6gqlilzB9VODZqjwcYwq4RzNbIp8xZXDfd+Wy7Z/OeVQFr/+
 1Ldq8hFPDIxHnb5962Zz9grg7usx/J07ElMJGiOhZ0X3g/Jw92pjR40x4u7Od4hJ/7PrigVtKmi
 QWKMM95RTeHDw8KAfF78InIO/LL57H8No0qGUbRTat7hmsJXXbX/DJA87l0T2m35j2a+P0GlaQx
 1yVtKkWihCtFDMJweCq0KSPUdvAxeAyvzsHs9q/V7dxgt80ZSwRFDiPRhPVsWww9j5KMlaGmAPr
 92DGT5PS2yFZ14qEEgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210076

On 26-08-21 08:11:14, Sreeshankar K wrote:
> Add SoC ID for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
