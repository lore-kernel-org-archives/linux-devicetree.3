Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6537E310
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166651; cv=none; b=f9iSKodYVx88r1P6nmN8qf+0gKo78ykutdtRMKjqAUDWQ5t2nbivBCU0IJE1yA558j3s1Bvy2gTkYbMq5VWz2w4+Y33S8lI9y/Iaj5TxtkoExZWnL8niAYRB/JJNUm1AAtpgm/xLfaql9ceG2aySGA7Uxz7vI8dAquS+XvZ7gv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166651; c=relaxed/simple;
	bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7fW+osH6peJPrWu5AIHH59ldT3F++Y1Jgc0+StDQ/QwgfiUK3r/1iSls2VNnK8c8nWcC1fr5DwKt8C/0U6hxSz8fF8RiKvpCP3n3AVXdwDmrU5prZybPDxty+1YFrh7qP4E0XQsYAn1aIwGTCDtjKPtClGB7Fiv1fqum7aDKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URbtABXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfQrf2aK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URbtABXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfQrf2aK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbViA4144503
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=; b=URbtABXvmexx3sbp
	0Iq8Qy7UnglB1B1wqM08d+rIFKiY/wGdbmVLlMafKrfnaaR103Mx0gVDYPhatMGY
	LAtfStdAycxXjyqnMTkjUgZq+1KUiJkfnAFPJh5PI7fiGW7fld8OXsVELQze2HLE
	T5DLSPQMek4d2AW4JLxccKdoClCBgWGZYrW+Kkjnj+YJDrupl/EeA48rRZ5TSz9e
	iHzg50j+Q8+QPRFzbUVr4M7BEyvIr1qrlVtW9lFn5ODzjBt72CZ9Z7saMZIrqp5G
	DjOahZ/LyT0VZ+7oWmViwHt9i80mREtW9PocNnUvVdZknwKVQIQBKFyXEvJ5roEK
	HIUipg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428tr3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db87f759c5so8489545ad.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166649; x=1790771449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
        b=gfQrf2aKR3kDN5r2KnnbeqLYm5S8FTpB2VeBr1gamyolpjUeeUuC0WsVlexrWCiYFe
         zrmfsg9YXJ7nm53MrD/QlxvGtVQjQBKjA/W8tY9Lf47ohevnxQHfw8YueVlMdP0LsTlp
         dhf/cn9oRPJMvaxD/JTqrGtXbOF+JVrggM8AcEBe5TS92UefbyZhDdxeN38ih53NiNCZ
         tkrsrMPueUBxAXsNwaa/efplHhMSMqRkE8EelAx45cuQ4z16y3qMmcHHiXuRC6NxzWu1
         QMAeD4fZna43PSP4fHoqnKnP7C9/Ck9JE2Lkq2dXIkrYJkiXYdyFhkNZ8xEfySJSHZ7w
         616w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166649; x=1790771449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2KMjpECG8nbDMf/4txi0vvfgQ4Eaw95S46ULcI2wFM=;
        b=1eLAeKxXNqK9Wh70Cc2Cn19y1sh6It970nj62Zz6Qx7Gv2suV5nPE/Ex9YfZOzVObC
         qLry4bSK+lamW1y9s/waSkxWEb/byqD/Z9GdZ7oWVtFaIBxeWuO743IwbC8NLJnsUN58
         QmMVdmk6fFIphNZA2Y3TYjEziS2iZW+KOn578hJ5Db/4vXWzsBgz0BvaWIJvL7vAKJkz
         5QQq2mBkIkHvdP7psfZiq95boK8smVNCvEGp0cUtm4YOeHO30KffDmm+FFa4iAJVkQEQ
         kDLQrDfEPEtWWmRZg56RkG+WA8l3wK2PDs3eZie7U6ppf/kGHG5xzRx5XcdGpc5OCdOz
         FuRg==
X-Forwarded-Encrypted: i=1; AKwUvByXSsdGWTKevZ9FQ89PRCSqeO21hnXcJW1jPeyKSDUJ4SUtwpq6JUCif0zFj2vBtXdDdIc1cD0hAV9t@vger.kernel.org
X-Gm-Message-State: AFuF++kfnyCrjThoy7jtsHWGnS+3q7+UD1DebWzokpJNdq3OTTWFOsqr
	fp6C9E/3EF3lsLKUBTWS3hVg6+enzuESEmSMe86p9MxGZVLVb7c7mRMN6V2ovb2UtqfJ8hZhbww
	I3fx/WOtcb1JAdw7A8rBgRxchwtRdR9Lx+JFQmGEQBa/coMxrsbGVH2q0GSVplHyD
X-Gm-Gg: AYBFou3qs8Q2RD9z3WkqrWBmUYqMgSLBGNo+EAlWoG2F80xoxn6Pr7UlcXmvlxFtb4t
	vc1b1LT8FzAGxLxGzHxPVgOwHquwrHOrb0n+nxZrAATFGcYHjevP1ST0ck+/iv7yaTR4jYOHRpV
	dP+hiD7srHCbD9ibRPCTJ2U9UAby+5gMrqxEydCsvr49FvO67OH7wwz5Rcegcev+OzmTEsGLabt
	1Qh/QUX9r1sEppzggbYiIbZ+dkBS3UDg/adKmXawrkDG4/fv7/gjfh4rpQwAQ8LfquZFeXT2IY1
	SC7VfpL8TyPWHZpR7QWh3wqHLYyIB+/vfiL1RMnddpDLaJsq/A9J9/VLhhObXFqO10+b88xnHA7
	RIERtL2GBysHiKWlh8vc1eI/1uwLnZVXN
X-Received: by 2002:a17:903:46c7:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2df69d6bb3amr23165315ad.24.1790166649093;
        Wed, 23 Sep 2026 05:30:49 -0700 (PDT)
X-Received: by 2002:a17:903:46c7:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2df69d6bb3amr23164885ad.24.1790166648501;
        Wed, 23 Sep 2026 05:30:48 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a69f7sm9548575ad.16.2026.09.23.05.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:30:48 -0700 (PDT)
Message-ID: <91ef0d74-2168-4bf1-b390-98d3963db672@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
 <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3c679 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Rbhxv05cawg-pCmlirwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0ZB8aHcct5hVnCoFyKkTbxZrlnB9mohL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX2ZhzpTTyvA2Q
 UC+hMw5bzyJNWn+OEDunOJ4wFpSSD1Hy5UyZhJzJJb85uFTyeglZUQVgeScQ73Mspa0ryffSYN6
 tbHtKu04+r1R6lvSDXWGBIsxqvnwycWsZeXo1WLv8/I7TPRv/ZGdT4IJhm56ePzewSrUTuACX7+
 e7WGKS7cQTdPTwiC7MpL0ItP9+kWsNWMPQGURiiWAxi+HstIEqnOtHg8h85iA5R0mHbQocVnKg6
 00HFZR9lWiecxYmlHtHe2j767NyWqCiXxeY12BbbkhOT2DJSk2WnNKMYpccprl/zukIS1w8El+D
 Ym9p5Vj5QQxew9mFrcaPSSZNayvoNg6OikFLwZ1fIUaJpWabaiPKILAoRAXx1QjseUrdjXRDDEw
 FukaP4XfuwiaahB3RuKKn/ItQUqcD4xmDgSk9qfbhM6ltrkS79SihR9iVmyNM7pQDPjCFLb/w83
 32PSfv68+8e9+WCbokQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX+/tYRdRPSVH6
 NgK0CjIk1QaniYi8LE8D5DYLKGPM5oKJxQ8BxIOBVv6phsV0J8suu/ezOUUyXNLmPDihZdtDlAq
 skkvBB0Dw+v6ZnqR2ib9tv8VhW6zF98=
X-Proofpoint-GUID: 0ZB8aHcct5hVnCoFyKkTbxZrlnB9mohL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230049



On 9/23/2026 5:49 PM, Konrad Dybcio wrote:
> On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
>> Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
>> the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
>> add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
>> tuning parameters.
>>
>> This allows both Monaco PCIe controllers to operate reliably in
>> Endpoint mode.
> Does that also apply to lemans?
Lemans and monaco EP phy settings are differing.

- Krishna Chaitanya.
>
> Konrad

