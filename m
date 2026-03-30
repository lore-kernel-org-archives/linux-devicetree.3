Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE73B0AFD
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863232; cv=none; b=nsfURcLrwx9ZBPPoVvuyfylgp62Hze5JAhXtRrKjNtd3As61RnQ1GqrbqEO8wXW85qy4IlwEdKQta4zn4RtM05mMXhY5yXqXahNnlxtvpICGBt2p6BTaLCU9myoxVdsCersD6Xa20D+evXt+1Tq+GuNbInMTWToSGQxZaLROLRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863232; c=relaxed/simple;
	bh=hFrWsIDAOV5krUOT9I2aCEMQtgjmgySJyZIQWoaMAlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxZDLWEdl1aE/sSHohLt2QMxUn/U7FKw1SelxynKjLTPFrnxz4Fi5mD2OBo2z74KTnpEluhusMDX4IrbMKwe+Gb37N32H049ZB/MTRn9nv16+YbMsSZpCnZYJ7NczGr0zyOnxRkYnwYEqAjs/q7ee02ArSXwatgmld5uhFqotMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfS1i6es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8T9jKA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfS1i6es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8T9jKA3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4OI4p812206
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=; b=DfS1i6essP71EcNQ
	MFbVHtVRMi/vOM0i1pBaGh76CTPTd/J4GabHdzBWwto4a7WUDDjrUysX/ZcJR7eO
	F9QS2+JLQ2MVSkfIPFCCPNTNLHFIsb1Eq5T9qX47LD92yeHA3AYFOhmIRBwJ95p/
	19KcmvEVt1joehZzKx+AoZyWjjcsYRQdVrzhgy2h1DyHhTf98IxWq+td4DPSxwHw
	UTNevnyutRS/P3gDczNct6S6ew687zYqADRddlrU3rSxk3irGgdfH/4Ygryucqtr
	l1gq/MFuq4hWnJb3xy2GRu44FAfOYz2X21GdJbWNErebRJW9NQaTrtPDTIDsguhy
	lA69wQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7dg1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:33:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so17679101cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863229; x=1775468029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=;
        b=H8T9jKA3wZDvNkesXQJuSlj8lP2Fbp8O8O3GJdbqF60pR55hQ2Q6Epr0fMl/KD6Y93
         2nuk9evPg5MxrjrWpBUVUufrzCfJ6R2/kHhGVcgn9n3ZXmuPaK3qF/fduzj7hTUvIQcS
         lm8OSp4LhoIDpoG/6M+Y7zFHGEtsQAGzy4Nb9HvFdyIPcZF36HiifisVhSXQBuL3M9al
         46XQABQWk5HR3BbintWEhZWBte0A/Ztq52JF6a92nKSPPfs1DN6+3+E4nopPPTOcUwWc
         SMl/p9+AX4eEVbWf4FG9qSz1ZtOFup7ng3m0JmRcVqxz93s9MzEVl+kiZJT2dXxMHFq/
         pdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863229; x=1775468029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=;
        b=YuXJzanf4lyGQHySZ8MAbZHis38aFK5+elI4OHB17O84FkNQkbSG838QfEmAUx77ap
         BGc7y34N59hwACZQsl4Asl4AGeyJGCodBWZmD1c4DK+8wa19zprDx5rmcu9XkwZziaNf
         sWrGqI56VI1OwMe/HK9SwYiA35da2vn+ZeYBrn5is7AEpDR03qcSF5BgLrdlqxRoNhQ0
         Mb3IjMhs8fuUR5Ltu0VU5F4COPQZgggARj3qDqmMsC0WzAywLRESAzPZ0NeBqVmGfMuq
         +XWfDvjg8RFDBO2cT4Qda9CcPZPcpW0J7SEjk3jj9+ABy2pOaAeiqmCMe/FQybCdZYz8
         sfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHDWW9NhG1/ydmpPJSd7LzxEgwiJFwLJZzQtIh8QLiVcya0J6hNj5ij1SHDSSsM9KHoUDf0zideEeC@vger.kernel.org
X-Gm-Message-State: AOJu0YzqM8rLUdrS9sTl0IJUTV7F6iffyoiO7RCiE5mCmjfa8qyOEgG5
	vahccgd7jaH+gclQ0R0nKoNwr+1Ssht2wofhVpIe9Wu8Sh/tB5PPpUhbqX5uKnkfoAB5C8M1CDe
	xpCv3Shz7UVRnESbnFwXjOG+7s9ebllDMj7gvYVrv+lqtslg9Lv04CkHEFVbA6l3J
X-Gm-Gg: ATEYQzxCeS/sMMsODIQMUwUJrAgYffzvTYfk0w0OPIFkPm5gXMV/15Zt7eI5/uong5Z
	JqOOmCK+Jjp7n0FaJ5PrHrDsmceBw852IaoOR7sXIgNYMQ/nKWenatX2RRZrmpCf/9CYXdpwgl7
	x22rL2ObC+mdRHEyMo20XpqkKoea4Yc7BXpmoGTAYRippM8EZDPjsVu8kZ77SyvtlDktXoAuUjl
	0FOPNaIP4gPliXZH4FZRaeIvAt4AJ4MdN2RR73YUyvoQm2xD2a7D2vdyGcW5BjYpm970pIMEtvQ
	nwVmYrireKtsA1vXZtK4NLlaZaBd5C8eNU6lzZjBsPE4FcDFh08UWOfQGDTlbonVyneSWMZ5RDd
	I42xxy6ePe/5PhzRDSnvspXX8qvLb4dfpN0c04ii0/z8wBakYb5faF1aeB+ZiXv+KvjcB00f8U4
	oZHx0=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119849221cf.5.1774863229495;
        Mon, 30 Mar 2026 02:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119848871cf.5.1774863228804;
        Mon, 30 Mar 2026 02:33:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72760506sm2312288a12.5.2026.03.30.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:33:47 -0700 (PDT)
Message-ID: <7459476c-3e21-48a1-beea-824cb3504a00@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:33:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca437e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=7LG9PXmp4f4UPxoLl78A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: L_ZEd8CAlcTq3tXQKTLm-Q-dIGJlLc8v
X-Proofpoint-ORIG-GUID: L_ZEd8CAlcTq3tXQKTLm-Q-dIGJlLc8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NCBTYWx0ZWRfX8oWeVdijGAxa
 KKewMeKadtVVhFIXxzHw08qT90jTFFJ8/EwtF6hEewLUsYwvXVpeUi+l51L1r9O/DedA40SbcXP
 DQYyLGAuzkbl8PHtqPUsgYRfFrdeaKC5Rn2uemF1VJFlxJIeBrSeGC3729pSd2C8Fjvc9Ng75IO
 CCJVds+0ItmK8f/r272kfDfJ9rV2auBux/AmapXg4pCoIraCwZ1awSBqgElYTH9guYxMq8/8ioH
 8e7b4sGiws/BALgqv+5ODsjVZmXf1IhBkghiE0S9qwhueRW5e1rrtNKPXm3SS9NktXcakp3hWi7
 fe4nJ9nL7+7eq0EsGiN/15E1HV4Vbh+r0RDo8GHU3hlN3XS+ls1SnsawVSkG4g+M8Mh6SJUU1A2
 pGbym4f+IQVMeia7Y5z3qL8m5sAnR1KhZHVjFtzEJ6y19k70soKxjcM3pxqHuQ8+XKy1piODXeb
 R697N0cuKJmqJDd5aMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300074

On 3/28/26 11:58 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> Values are taken from the other geni nodes
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
