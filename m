Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98139A07B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575956; cv=none; b=GsxL48ZCnwf1lRrAZCNkbp62e8OydjNlwXkMS8dCDTUSPIJMfcN5bdhT25roKVaQdx/m+gJh/FRTykMUKk6IRBiQoy6xqh9HIpqB7Idiluok3pqOQjYL9I5n5/Nxs2/9D3o38CZcBNycbiE9X1mCEIWlslhOQc46aLwfBf84CEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575956; c=relaxed/simple;
	bh=aQmHLV3KCZ+nX07DoRiDb63BwVeOxt0UBUkcs+cdYXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kEMrNsGra3qMe0q1UeJJFG/RLWjtO48X7znB9NqvLjNyDD8r3nX0WgeXAxaAvVWL9njH5MKgfyfVhxBbAlRSMtXinQOmiF4T2uK05ddfjFA0FBvWgRbKdw1LsocxHDjeHDW4CO0imcb318bWe6beMNID/XGFYKvr53JLZ2ZjPnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8+gyyVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3Muf5U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8+gyyVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3Muf5U3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BdeO1183975
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=; b=f8+gyyVut5AKopKd
	mSeXPq9Nj3PlBCRZf7BuZy45g7tkwBcu/Rq6OQys8VzEF6OFTqbVtKIcVhLgxW9P
	eukcMCqtmgcuwSEts7+PvyJ8uXDBzzPYvA663cDrguDJ4EJ+lJW3XHRoF3NuE6cq
	fR8BiSXabb8G1rqPKdV7vYN9MsXzv3FdipovBoj2BBnrFYHrBDNUf05y8pBpQLmR
	42DuQ1iwcSxDchhp7pDxWYqaNBb7t1UJTZ4f1oMmS/2BkbabNIkUhSaCDJBZSbb5
	q3Fky4FA9DfuySLnEjo3qd6zxuCKjMXFTD6AmB509wRhvkr69uKLIbXovteDkg0T
	y4opew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyaatm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:52:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so3786140a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778575945; x=1779180745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=c3Muf5U3v40ymkBYg/rqO87R/MFL3ioA+mK0t8Up2RQyDE0TQRAaWnIJa2eX77zVcB
         pI+tumLTCKzgXHGeSFP89umLJ5Y38GE96cwGfpNZnoHJ49q1jGh/R0Q9klQ6XpzXL89O
         JG0UE2XXPRPGoz/7IzgwbG+vF591ldYVg2H3K22PFLIlcLqdTweYZeeogKdITtiBPH/c
         saWOMa2whVjqaJ46OssluopOyd2ZhYfnjK1ftgDZC9Pqkts+wEaowFzaR6I4CAyuGbil
         2f8f0eEyQ59bezS72aavw+Izo5w2bID0PAKtb6U1+V3ic9P/okVAnXxzVIqNt7RLC1Dv
         XfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575945; x=1779180745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=YXxEjk9XSWUPKmQP1fvT97TnMRPR4Camh1d0esslwuvWnjqNCDAwsuywELqunss+q7
         wWrFmET760c2SomvVg3IFL3AANOsqZNFHX2XjOcCIOtqhsHTCrgn2RY/xjsx8vSyjrLF
         2kfL9grqQpOEf4LwM2kLM3PQg50QtkmbIVg6dy0LGLzO30nAivXYGpdy6RB2BRsOfnuL
         bUH4czv+CzoFJoo37rj6gnRYmpftkRgf1daxiju9lt/DrUzi5tWfk7KKnJelW0EIt7Kx
         +/3nf1AdaEsj/X7qyyLn2LGFsg5bbo18NF93irhO8PtY18qHLrSJmZI+XW+lVfQqX7Lh
         0Izw==
X-Forwarded-Encrypted: i=1; AFNElJ/ODLcm/i49hayPvxkgo+vWA4qP7dn3+KGxS3KeU2JAn0qpxV06ioSeru/35DztjvEWKYvdgq2GHipu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tavmik22Mi75QGHDQUQbyPMTblamcZ5XlbZ7ASkjHizBMnRM
	ygaPR9X+Yi/MHu+TndqUjqyDxMzAOl8tsieYIrnIUIg5gBAhmtCKvaiFQCSVOnDeBF2iBCQr8Xp
	/N3SXmX0o9bqUju/rfe2gHzZHz00RQWShzEJOaQ5qOrK+Kr9A2+mwpN7Ikfj8wkLg
X-Gm-Gg: Acq92OH9UpHlUzFN5GI4Zrzzqx3JtVuax+p0GKfdLWNpHl0DCRC33FROt+zfGv20eIJ
	4vqj5iIyoaOfDTcmvbDroV0ltR6p+VKNeoTmSVyqrl1l8JEkPpZ8yK91Z8ekibJH8LNs+1eJqd1
	2NAzaP4q4Q8FbLvMJVH1/R1et6ZKfTfVdV/VwP/WkMbWFhUBDSbZ7CuGwG+BsNn5X13+I3zxN5i
	AElVjUTp7cGPE/rM7yDwBJtdICgZ4964FOdhLAeoEKqHsKMARHrsMV+HvxFzVUNwsklKwxFas25
	N5omXDi0IHn9ZpT+zFGTHhpV3NOFRaomaX6XTRvK4qX7yljOBYs2A6ydqEQ/jZKFhxXIgtIhNEb
	0jlq8iBu2v5usOhV9YeeTyBNbOU9fBis7xBCEsNbk3eb0C4do
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012150637.14.1778575945191;
        Tue, 12 May 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012121637.14.1778575944726;
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm11432629a12.8.2026.05.12.01.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Message-ID: <f649f4a8-df16-4fed-b1ca-4362680252a4@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:22:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
 <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _pddFrcL5NVHkn5t3_lklH0mJcTxsQ1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX5CS090OnmyPn
 cswe7b8PClceADcB0MNWHhRk0vlTF8a2IFLcHKNUEX9mPTPbJ8vTLEZzbiDjJHMXn5jDuprdnbR
 bDWuuZtLDIc8YsFhIgOJIPL1JfxaChgWO7w50Bw2rlvI0eTi1AtsTnFu6RX4Nd1gBOWSQH9zoJ8
 bwr8CFN1zos2IbmXonlDI+Zbk2iCCGKzSdMa3U1GmhXb3zAz+70Dcq0Lfh+zlKWq/NA1vSpwuW1
 Ysb8UEj9rgB2JqAn7AtXI6I4ExbazrjSfmUG/ER7QADCPTzHHMDiNWHhGVzMYEIKBnbQgK4BSEq
 XSEOsQU0X67LETnjLx7oeeLKLuOVZZCl+sOyYYr5Gn2JyN+QtZFUaUICrIj85KwgjLENEZbWHBI
 W/5R9x6OoXUy9QADN572ioXQOfQ8jCi4fk02soaJdGpG2GogZuJfA7dBdvx+VwVusvtFHzUHcEw
 OLXH/KPyTabIlDAHl2A==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02ea49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UOnGL9-HqUUrvkLjBzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: _pddFrcL5NVHkn5t3_lklH0mJcTxsQ1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089



On 4/10/2026 1:56 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 04:55, Taniya Das wrote:
>>> Why do these two controllers have no power-domains ?
>> Bryan, on Eliza the videocc and camcc are connected on CX and MXA.
> 
> Shouldn't you at least have:
> 
> power-domains = <&rpmhpd RPMHPD_CX> ?
> 
> And even
> 
> power-domains = <&rpmhpd RPMHPD_MX>,
>                 <&rpmhpd RPMHPD_CX>;
> power-domain-names = "mx",
>                      "cx";
> 
> Konrad's suggestion to me was that MXA should have a vote in my CSIPHY
> series I think he and Jagadeesh discussed it but I'm not sure if they
> _concluded_ what was the right thing to do.
> 
> Right now I'm representing the dependency. MXA is always on ... and
> there's nothing to do voting for it @ MX ?
> 

The clock controller drivers only request the minimum operating level
for the power domains. Since the cx and mx rails are already at the
minimum operating level when APPS is active, explicit voting for these
power domains is not required from camcc.

-- 
Thanks,
Taniya Das

