Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC273CF21E
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943452; cv=none; b=lVrZ1JPd54zMU9uU1W9Br9eXegjT2H+auhZDWuJLi5bMF9XxpmY/g46AyBqhAJwNh1vQRJc42PP5fy/5oiE+5gC+7FhvafA+DahvPU2CBeN/JVjeBsL8QBb8ijfiOo8K6pjQVKcSR+Xf+QObkO0kM1kOhDeW2CRF9TVBUF8ht4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943452; c=relaxed/simple;
	bh=YujMEq/IYDCcyQvcmIyGcrQUVG3mK7GrieTZQ8bUe5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pagRHkMjHXqT42vKVRepjVlxYB1BRJUbtYITMUWZAVm/SCWHj30JFHFpjK5b4nMutf/IftrtkCSwjBWrlLcId8rzQL7uDizh9I0/Azd4bNlR/oLzBpVJN6h2Savf3D1KFnvIVeH+Q6/fR/1VuC7no37FxkcAZsrvywRmB26NMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl5QtVgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwerW8U9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl5QtVgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwerW8U9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dZTm952964
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=; b=bl5QtVgCx0H4EGBQ
	I8Elbu/BOIru3VWc2N+TuPb/F0MVjmb6Aw+mbfJgX4mhmvEyZfIeHqR6v5ekqs9w
	M/+JuJWBwpgvH4x3EPmM+D8u6tq2fYOSZnj87sX+upNew/WtTTM2Vnm6uFNXQD2i
	AtG4l5sHTEXWG2rQMwaFpXVUdKNC02/iggPRN49fOXaxCN8RDxIX90VWZkt2oaVM
	P1hGt/lISckK1zZ4cBuilzrLYYV1KgI6r7YnWloI0c0w+0hrWg7k9jSJlbR84McK
	gUrRSqIvAEfjZjLj23Yv/shhT6jfyf85YA0O7jSgp6oFa4eu8+RI6bQUA/1BJKn+
	aaxwLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3geba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:50:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4310032a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943444; x=1784548244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=;
        b=ZwerW8U9+2JjOumzwKvE4xS7DuSFjpYThMiUp+gvQqmo1uQWdXvx6xOsk+cAp5gFuS
         4tsCB3nHox64mGUyRG/xH5ZbowTcBSLXoRdT00ecq6OPvdjWfYs1yquVZwVuiym3yFM7
         pIIesphzJnVwOOq12ubrudZGwP0E+T8ZPZpN5IhbWURX1jvoAlwvtS3TCOIRCTViCCHe
         GZ0eMAp7Aaqq73hX6djcj/Ex+pAm7CXeN1t/sM5TGaYAK9J6QVMv+I5BChOf0rOGJmGO
         50neRp/alSCXtSPBbqxj+dYcDVXdAAXotYWaHvLqok6S1As6I8D8Q0/DVIrDTCasRYNh
         nEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943444; x=1784548244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32BCUGnUu2Id1Yusst4iQdiV2C4tMZvFoGEnFIez6Eg=;
        b=a7KfZyNNGscCxH6SBCieOf9ZoWUn3dCmqxn2sFst/pE+ObPTxYdJ/PXVVflBreI+uz
         qQaZX+gYXR8Yfi2MFm0fBwhcQLUK9Q7KMGkaAX1ak3GBxPcac5Tet0iH4tLMjIMyuYN6
         dQvDB76GnNLmLL7I8d8h4jVLADhSElpU2WgRMOMcivwVjBSnQGBkNnrRBFJ7CckM3PzD
         LmAkH9MIAiIMU+73s/W28FBRKF2UZ1C8z59RjXba9PArBu1+Hskwu7PyXNjANvqrVQzl
         LaGnU5K+qTAsAkuxlF0oiGRGpR1oRwyr14dmVbMuSl27bVIjXP3QA3ZxVOiptSDGIYUJ
         yyJw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5UYewXWfFJa0X+AveJlijrsvsLvMPnWM4eLkBd9snkUvKZz7sF1Y2NZ3U42beJIv9yJkWCJhuOCnq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcbo8zBQ+7nqHsib/4RMxkgB8R8g0WEHV68F/kRcTLToPepzgo
	bTrVTiHbMWACLxBmShYbEPsuhThTAYCHm2FgzTX6kjAyEjC40MOmfbu1JrirVar/dh9eRIUZ/G7
	WdDIsOYCcIM9qaKsCo0v5E6N5TB4irk9KCQBuDjjjGbeuOqGkbvL42dDkQCfZ2SRWgsF6fYbe
X-Gm-Gg: AfdE7cmvUA4foQGW0VtG/U3nOKVLL32CS70AfXS3gGtq6fcrVPteNNXJsOLCOVlqSMY
	47HCoPRiPAJmMdy25oJR+CHVwYT12KiEJVrpWW3Wo80HI5eqMJM/r/5fk23g1q61rjfo0vDNpm9
	e2ZRaGhJEktp9bPTkYCnFLHp2aZFiLp1e3W9j0rhR7rOROo37FUW+D8RrirzList1K7SzQWK/WC
	8vO6MWw1wKxVaLpyf3CL9jOHTil1qLhJtRM3OOcF8G0lxjTgzJdacpqzZmDMv/zyUNOxu6anlUP
	2Pe9JoHmSLBD6412Y/f9mkZ3MIelSkZlImwrDTEF6iRwWl39Dgq+Xg8Ybn4iaGQHQ9hN2FFvDuB
	8loxR6kUlpU5ogtT5D0JdMrDZxJvVnFtKLxJDfw==
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr7771152a91.6.1783943444004;
        Mon, 13 Jul 2026 04:50:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:38d:84ec:b03e with SMTP id 98e67ed59e1d1-38dc73bdd34mr7771128a91.6.1783943443533;
        Mon, 13 Jul 2026 04:50:43 -0700 (PDT)
Received: from [192.168.1.8] ([103.211.19.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm36700629eec.15.2026.07.13.04.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:50:43 -0700 (PDT)
Message-ID: <0c791abb-9f55-492a-81e8-5232217831cf@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:20:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
To: sashiko-reviews@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
 <20260713093919.B71F41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260713093919.B71F41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: on5wl9P1Lip7BypRP53gpmRj8aOoFiCP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfX0jzQTubv0hQD
 6+6tlBn5rs61gzlSnW2tpjNtcdBNghyYiGtf3ePT9D7Do9Lvovgz2t96Hw/LH4BI8PvTO6NF+CZ
 gpLeNxV5igrhrGN+sGghpB3M97ck0IU=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54d114 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PqZB0zJ+pwaroKfoAs2U/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=beKYP8gAV9hXG197g18A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfX+rdLmr/71LbA
 2tY6/Z+A5qWRVuwC4TZZ2//FLqNT5GyBnt/Ci5EhtRKE3DivAvB8u8bjQJk0NZnm0z8PJZYvEKp
 +FZqTCTjBYgHoDqXu5WcKsqcblgxCot+D3fW2PpdLpz3njvntyDcADfCe1R01vWDXlXSib0ecRQ
 aMwCmTdK9DM6SOEtMW/NVtGQ+T9CUDl3nubqXRA8efnCeMhuERUw+kEs4jlvNV+sqy42gXuYkSm
 7U9gyOXNCK/IlX3uBZCg0e0yXeZDg8KRfg/a4it06zJl9KC0Ja+ifDu38iYFI5O8Bvq4P482MNv
 EO/WFMBYsABgpFDrWRaT0X1q+SYIhu5775w9zcgo1H2mfAsR4Rrehkup2srngZ9D9VUir52IY0t
 8D/EEP8WoMKa42Rd0ZOplQV2fXbaFQzuKoSMkKiVUJwL0iWB0M6/bGo1GL1Fb28aUpw7heJg82e
 4lrMfnuuKwe3/UeEciw==
X-Proofpoint-GUID: on5wl9P1Lip7BypRP53gpmRj8aOoFiCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130122



On 13-07-2026 15:09, sashiko-bot@kernel.org wrote:
>> +			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
> [Severity: Low]
> Could this node be placed out of order? 
> 
> Device tree node unit-addresses are generally sorted numerically, but here 
> camss@5c11000 is placed before the geniqup@4ac0000 node, which breaks the 
> numerical sorting under the soc node.

Reasonable, will fix. 

@Konrad, could you review the DTS patches?

--
Regards,
Nihal Kumar Gupta
