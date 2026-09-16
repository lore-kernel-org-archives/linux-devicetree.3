Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299C44E64C
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549762; cv=none; b=TOS2KvjnmJMjU6seBJ3/jjfOhRwsmRK7LMiBa/15yOtcEghNFKgB61WBTBj4ljVLqH9crHV7bFIFSQWda2pE0wapcbfYoRoSAMCYapqICj8SYOfRxINozrLtSvoGrnMZXLaDhkupMTgXZxpK0T0LNzMHVSBpW8OFUv1dwiqPghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549762; c=relaxed/simple;
	bh=Qu4pqTdu5epD17+lJeflRRMUkQe0SF0FCXVRQBn2mRs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MEE2ROEUmhzSF4vFWW5WS+GgfTtz1P/hmdjBFVTTo9gnTypNv+EurVAmWDBcKQgHlK9TKiXU15DGvcay3lJCRpWRj9iPAZzrMP5xr5k9FmG1sc0IE+u8BebTNxcYAwNoTCqS1JJBDEmtpAStKegDIhJzcOQnA+Om8PnhldJ1npk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6lTN0yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcffbFxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6lTN0yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcffbFxj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AQv2823494
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=; b=A6lTN0yr0vhi9xil
	rIMMNM7gXr/opFbNtA/u+SMoNnm96JhgQTYe7tPt+1MDOvw9c/XGNJeJgDH+dg2r
	F/RkWSxSpq8mkcHuRchV3gZntmGHFi8G/R46Zb1WXbn+CHga3U62iJ2D473vhciF
	U+oD8CQK07UCOHhkhho+lB6ruz2wqKlf4g9CERexCQdtbLjFKB0WEDCaZs3i9chN
	ciQ6pptS4tDp14uayljU5qvsk82IW3LlYJlDf5lTPwv7ht+vGfYiYLrjG2SnyhPC
	JfB4d8wMkq9HjI1YsPLMvsCUIWdEZ55wKqWn0oepNnldvTkdrA3YQPBHU3tEMC7U
	560UCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfj05n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:09:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so11896202a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549741; x=1790154541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=;
        b=TcffbFxjH9yGJPcjBRhACQ5bsuKPcKX80wHard5+ewz9QM1KtU+oIO5bYOvMCGq9Xh
         1tQPWIDZMOmNe3CMxFIfzjyiYV2jpYwZTvmU3vH3MzGLckzmvs6phXdhc2x9oES42joL
         zg8Y5aqNwHo1RqxmuFMwwpZawtcqTFQx09Sd6h4G6d8WnNnQXUig5vN17mCRufR4S8J9
         uEAUkm3vtZRLP9+iLTJOcQDDVp8GWoTcAgDwa/dCUBQH0oMdze0ODqlNt4dp+ng14iKL
         Segx70MPXKuYUrZ1CA9QL5bTiKUNtAOc64AE17Oidz8Hk8YFI2cZiUzMog8JPsA4pILQ
         0ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549741; x=1790154541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=;
        b=Z4ad0dD170usmXQacz7Z6zjEMO962SPVXr1ZBHDeJ2VXxo5nIh7bVgcgiPM5bsy3lM
         mSgDd/XqKqDeckL1H9hsDyQShisl1o5V5rpsn6xuMS42z58K5VGIRQQHZWgru4iPfX5t
         d7aSky3Xhq8TiVvodb7V/R5r4LUtKhS8qYQwD/2ZMhsrfmaCOWNS+OhmotzK0Y6Rmz2c
         M+p/2MioROiB2C7nNh5O51fIV7aS6xYbY8j6gbd3hLEYm7S8qaOA0XUFJ255G6lEVDUi
         hRMWufjhTenmiM3yf2V4Kn9x3TURruE+Za22hKRzHZ9JtBurwKJcuw/xSk/UYhU2SMQd
         L0zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUF1be+DOgAZzgPaHMf/n4x1nQp+NESnLK/NM1pGYK9/GWLZrhOiAxDqMvp43EiJfY320UHCjgaW6D@vger.kernel.org
X-Gm-Message-State: AFuF++nObQfKf1iYhgOK9kJu+X2HfORm8xDTgjy3qqJCsqEeC6JYBHer
	PGFDEaFu06GESeL48/LLceYkeCw7c9/SbNVR/eYp3ryJ+MqFI/SBGQdx/8M+KjlGS4Rsd16vMy8
	OUeHzl7+vAKp2oMWIDOhZ2G/+U6B/3XMkGpNhDwzfYFSy2/cPi9Yxfjc4RCmVjmBh
X-Gm-Gg: AYBFou2MZ8aNX6zWHVYLdo+tldD4cH9o0c0pC9AX3aVwQhSCg0BXlRL5bjw8xWO/F7v
	ZOrjS/sOeXOnEKEyBnbouz21s4ONPLvhRuN8vy/q6k7SmTbM+b6aB4z25/7JClRr1b0SAJ9ZIOc
	j1tr2qsKgApt9y4bXnaHOPDOhqpgt+GyMHFyZitVCV4RhF7kYY3tmRv3aHyR+tkFlx273MjcXmS
	d9yfJUhtGbIYoYLVu6Ie+31bdIJW3jZ1xwp2rsdzJfwPhKh+k3Mi4V0OjrXnLp2h2M7QGX/K/Dz
	A3mMTPG9Ka57v5MhCDGoYpnMpl7ZQG+4s2dCJWdos90WjvqUAiHodgWVd1emg/TI0i9S3nu2KQJ
	9DPAK6W7oZ20FLADEzGvFcpI5KR0PxKM=
X-Received: by 2002:a17:90b:4a51:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-39e1e27a33amr4109126a91.4.1789549740544;
        Wed, 16 Sep 2026 02:09:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4a51:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-39e1e27a33amr4109014a91.4.1789549739189;
        Wed, 16 Sep 2026 02:08:59 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm3419343eec.10.2026.09.16.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:08:58 -0700 (PDT)
Message-ID: <19293fa5-3a7b-4496-83a1-422b385fa36d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:38:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
 <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
 <7d78ea3c-3de3-4f90-8964-18a962218fca@oss.qualcomm.com>
 <d27d1c7b-72c8-4295-b308-52541348d1ea@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d27d1c7b-72c8-4295-b308-52541348d1ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa5cad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2StpY0YwogJTyEZmcEIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX/LXLT7jyyaQ2
 Qmv/JJi4Iv4RFxzax/1GyJopv6aOuD3hv3nP8n3k3IsW6hmDpnq4I5BAPEALsdNno7TDoAVcZht
 1HUrclKRYH9YuymECQ1wzZlckQ17BMEPoveQ6RYQfP4fcHBz9JfW+arKpksPxYJAVSt3O1yzt/k
 OKFGgIAK/qqucFYq0jOiwfXZ5mVvJ+TK7L4wfwZXIqSm5cCA2/ME+w+ouqWReR0zvpf7DJJt/14
 U1RRRw4A/ZETUonuhU0ISAhQqBapqwPMm9H71yH6D6DOqLAE5XSDwMXu6LlrMxfDIHWRXSG1nV1
 G7KkQbD46ZRAkFc7BISRlku0ZtDaViDsrofV4XH12CcoXioBmrLLWfpEpjaY5DHHNowylNCw3Zj
 fRHBhq1esIjous9BrsCZ7dkUkmPVUQIB7SUjh+83yTBcrGSEtuyPGFupb36FhoMfhX0oJ8lepkg
 SfXn9mz7FG7Q2veMy6A==
X-Proofpoint-GUID: Yc_xLd7ymzQj_uAaJEdUATnr5UGQsjzP
X-Proofpoint-ORIG-GUID: Yc_xLd7ymzQj_uAaJEdUATnr5UGQsjzP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX+2YMUxxmpnuH
 qqLhSxY8Q8FAMqyWlFAVs6C6x6TsmmWvazDfwF3tdFgFs+1dXBFVobfkn7wQ/CbUpLZy/2ZAQLH
 9eUkuToDMpQw3APHykkRquZpmhtQqgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160116

On 24-08-2026 15:48, Kuldeep Singh wrote:
>> I'm afraid you're unfamiliar with the release process and have
>> mismatched expectations. The feature development of 7.3 on
>> maintainer trees is done already and the RCs will only pull in
>> fixes to the new code.
> 
> Sure konrad, what I am more afraid here is that patch was in ready to
> accept state but somehow got *missed/skipped* to pull in maintainer tree.
> 
> I think i was well before that timeline but still couldn't have this
> patch in(for v7.3). Not sure if something to change at my end.
> 
> Can we atleast pull in for v7.4 now?
Hi Bjorn,
Can you please help in picking this series for v7.4 if there are no
further comments!!

There's another series[1] dependent on this one which cannot be pulled
unless current one is pulled in.

[1]
https://lore.kernel.org/linux-arm-msm/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/

-- 
Regards
Kuldeep

