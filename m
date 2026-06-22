Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58FD221FB6
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150696; cv=none; b=sRctCLvzB5ESaiTMGYcm/CwHbCwkAFtevmGDbLud025BXaY29uSAcikH3/7yrkke3nrcZIZLJnb+TNXaVbjsW+3T5L+/sfg+a1bcwd6NY9txiAwG5dPdi9Hl+cE/d9Ib/nzft7fhhPPbmcwoJM5QADOkMLKzfkwofL2rzK5FWvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150696; c=relaxed/simple;
	bh=rU66pNh3eSQsYT3HOOaM/C4NT969liCxZxRQ7WDslT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEBJK5lXwcy7CufkOH3IS1RDL0yAkzvTy8Y2696vmGtPL3+QeI0qdYVPedViGoyhAhcneYBnLwVCjtvbYUewhmOWBDtWdoVZ/0qwf0FSPXbAwrtDQWCbnhHkV0if5Do7O8Eu/q6Cda9w16N4PKdLGdlbwc2q9si4OZZW0dClBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OO9HTXEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6XXPEP3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OO9HTXEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6XXPEP3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXFXL1675287
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=; b=OO9HTXEOxIEIIcYC
	kf514nYXGtehIG9U2CEeACRC2QsKKZfA1CwRVO+RSPzeFihmrbTnnuFx0URXowBa
	TW3tspECGsqsNkKoW+XkUO2hu/iiHusICluQpKqEuQoSInG+aGV8iTz9vabvaYUj
	lGfkil2VlDGS1EKwJd6cV05WZ+wBT+9rwRalKqwir9NSOYnXyy8BWUbiVRiHWJjA
	IvXd6uzCWbtyKTthHzn9zgjK4gpOaYRmLGLtFihfltSToI2mGzsK9MfCQzYqPq48
	nGlOKp5CxvUWHPtvTZ3UnMoYan4i8rs2QgKPy7KXaRuFERMt8gMGlPGCTGy8FDy2
	Dxp8rw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmrtny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 17:51:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8923722247so7072379a12.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782150692; x=1782755492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=O6XXPEP3uX4e7eXteiV10Y+subYEonpYsTY2vzvkg9/lQtKnynhsljqb63y0lYfu6e
         kfZli2dAfGYw2iHW9DqHUQO4Pb3QtytpB15mt+RiWq45vVao3PTV1J7LdGQ2iZrldw0v
         k29qb4BA8cW+BXN0GG2CLWejLSPTJrFcQmbnGzQYaZxsaJIvWzHSI9ezZmPr4U8Yvy6P
         xUaKiiLou4ZqCXnwf8o6RjDZt0vXHBSVY//uQPvtwMBMVMwCHCuk0J7/BCWUi1LL0B1D
         wMDNxlXmt//ITEz6QHbjIpuEtXbLT67qHvbRs/9iGh7bpmV3H8hQG4eJTnK7iPWMSaRN
         Gi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150692; x=1782755492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dLP+TVO4tZ92+I0qsy0dTT+zkkqGwfMz4MJYSPYxO4=;
        b=XMIigpLUFvSkGxDhKY4UVtfwklZLow2R2DHKjnPFv5yyKPGAnOzMm+VOlQdmFvSMW2
         qXbhpvoV2Yiw/VLCd4p9/qVQWW+7yJ1KDh2jNHDG2VHPLQ1YJolG4gWdx94G7B+SPhok
         9hmkpqmSSBPPaHmuHbw8rc8Ugve7KQ3xAr06cNLl8g1+gh81d3nZxs8UvVbGAN1uUFAW
         h8c0YsF5Q/AHPCJrBv245sA0Q2o2DVVBdLQ7VxS2qe9zUYoVOyqkjOHPA2GqrfSa8a/H
         AWwULNdIdWIyfGwYp6KcwkzzA/4uub8wdtdanDmUeoW78hite4tfUiuBDo8F8nvwqjEh
         QHhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lN94VaqJ434qRsWJHTfSSVXIp+VBMVd5waVnL/gRIDFS6dK/6VhbYumbTUx9UIA/7qLeErZV272sV@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDcnFoUKO92b5BabtB06VjF5DJn45++HGwepQmY0TLWW/HrNU
	E1bDJZCsFFoduF0FEm62IjPpbOOaxJqQC62F/rziCfSKSRFRSm64rk5kQ0EQHBivLg9mGZbU+kO
	HvINQPS5Bt4jJ5+uvIqC9pupMgQmZfLlsUOT9gVyLRMBUH/VoBcsgz1mQ7k48jKUP
X-Gm-Gg: AfdE7cklRfjawkBg9Z3vodDfmaF9aAhIFgUHfPQ4kdFn+IucV0fBSF1Q/b1h3vE7Ixy
	rKgNiT2CynLro2E/PZY8edZLy4JQrF7/sOg6zcG+tfSvUBfhoX6KZSAF/VKuYgo5dVCy1bJklSM
	obzDQihanXRJad3dh2Nl5hgHemh6p4hIHoBoYpvS9xmNUX9XLxVuPncorh6hMbGq5twXlgqHvRU
	lf+j7YFGalg9+M1fe98DKrGNnUFCxzZKlate9Kw7SMP8D/MN34T1I02vbzJDBskIQFXK/cRqXsO
	+/onXMPIRAARUUYq5TI4dRB87QXTk8SjRNd8MDhPDKzdmFPtxh6xd1NPPr1wKwH36E2YM8v9fyS
	/B71FsgqQOdXSKwDYMHGZBnaW4iaD0MF1Tkl5gAU=
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737994b3a.9.1782150692326;
        Mon, 22 Jun 2026 10:51:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2789:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-8455078a336mr15737963b3a.9.1782150691759;
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d89dd8sm8300360b3a.15.2026.06.22.10.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 10:51:31 -0700 (PDT)
Message-ID: <23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:20:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
 <WdjOMNZ2o-UF6xXKW4LiVgNZB10ZaGze3YWNriL-f1jf7LgBzprN9bqqMYcvMJH8KUF5wtRpyOB0aL_7HEk-yA==@protonmail.internalid>
 <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
 <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <1de2f9bf-b48c-4acb-882c-9e35a8582d0b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfX/PtlefY8T+te
 lxV4SHTvM/NrUiHVeV1e834MW8TkSB+vZ46mIbTc0008hEroHK7jRoyp9Btp96tUqk88YkrBNAe
 amz+iCUs+zwqh+RJBeX8S8pyj++HHdA=
X-Proofpoint-GUID: E9GJO1EJOnCKEbczq1W2qduRkvielkGW
X-Proofpoint-ORIG-GUID: E9GJO1EJOnCKEbczq1W2qduRkvielkGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE3NCBTYWx0ZWRfXzUiM/f0LTr0T
 9/drFEOyLq6QOE1W77Fm8h+Qx3Hp0IQ+s7v1f0pZikveQ2BnE+y7R6RVeUFnRiNb6CuiSxz+GsR
 yTeRCXKsCbXUFtKRmvFW4iCUGnLKIlCBVfbVpba85geThLla+G+4qz/iiMhD+j2MDOvH2XUEKgt
 U6pTfF4pqJueANtPBEBcRDNFa8ZkDO6Cj2MxLnAo8qHLfF7Agb5E965at7mbEGHaJiMOgYRWe0h
 xO7hy7JmorPB2rCb8VzqS91gx8J07tp9tFkpudW9pXia4ToQ8AJZxdCsSFb2reJHG1z6vWRvKUS
 QB0jCBbAUdFNH/Hlm2NlVcU+4CoI3AKo1xT9tlLcgnufQsk7PgXD4xDbceI0I/Qrv+rsqi6BOMc
 nmcb3jcYjannrNbocw57GIymtiYsIOjZqDBE2AotVRrC3VVjpZbZM1+z1U9tOwOqkjxcS0NB/UD
 QjfhXPL3HWhPrk0XIpg==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a397625 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=QCTWhj6wmzAtHfIuGYgeNA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=oDMe_2bG_2z3vvWk9CsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220174



On 6/12/2026 4:44 PM, Bryan O'Donoghue wrote:
> That's an argument against changing the values, not naming the values.
> Hexwork in upstream code is a public black box and should be avoided
> where possible.
> 
> How about, take these fixed hex but someone on the clock-side in qcom
> agrees to update the script to write defined bitfields not hexwork in
> future deliveries. AFAIU its a script that mostly spits out these clock
> descriptors so, it should be possible to fix that script once @ source,
> without committing to fixing everything _currently_ in flight.


Thanks for the suggestion, Bryan. We should probably skip adding these
definitions because the approach just doesn't scale across our various
PLL architectures. The bitfields vary widely between different flavors
of alpha PLLs, and the SW driver doesn't interact with these fields
post-initialization anyway.

Even if we generate them through scripts, it provides no practical
benefit. The field names aren't meaningful to the end user, and the
software never decodes these bits at any stage beyond the core PLL bits
we already have defined.

I recommend leaving them as simple fixed hex values. This keeps the code
straightforward and perfectly aligns with the format our hardware team
uses to pass these values to us.

-- 
Thanks,
Taniya Das

