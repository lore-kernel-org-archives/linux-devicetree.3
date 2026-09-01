Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AB372680
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264152; cv=none; b=T1cyYJVs2O/WEnpdSEisjKeKtpaSvkNEc3s7WkchW6mvgH9pmzWVpFivsfu19n0Jw9k1HIOas+xlNlkvafeuxPDUFB2hkiDPBdJAxDOq7QS7170KjC58YFOvfKTbBnLpk0E7zUwoOSH0sFkqGIfOBBwrs3hL7y3NXOfJv8zyrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264152; c=relaxed/simple;
	bh=Y+YY7fuD9LrO+Sd+3rCyEQKeYw2Y27X6Y7IIOYZzetw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEqkhK+KeYKSz1mP0pBMi4+JRzqcAJJPn0DpsHjN1mn+LVFEuFO6u/InbWjWhJbhvX/BPAu8Ueigy/1fCCJ25RwqQvXW2GF2mqp3G1IcAVM3maV6uCzIxNDK8QEGCWJO4U+lD3XgxjdB+muLWi3QOrYuvPf2ZfHqIxMrW2iyXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZESKSub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyakDGTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZESKSub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyakDGTH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ95X1641293
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 12:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xrSaMuuxA+xEooVjCUF3b9ip
	BwSv1171iBrFkM/JXB8=; b=YZESKSubBWnr1uIUSJ0VB+PzUVtwyreIdwksW8eY
	5GKXgeX8Pf9Q1pXkm8eosFuu/5oE3W8SrJK+W1uIw8o+vcQzmqNa4hHf8qXGUu2d
	DbYLjKLlXjLuq0ajvWg+NeVnBHy7sovuCWRe0ar/9myDh5zr2gHscS8/nAyTcDmN
	Xf7F4roMl3S3/INTqSgaLJNmLMPyGkEXw+eRc+KbENx7NRqUSI3FNIOEkS9+IS5G
	dI+mkMEIvq3xm9R3mDVuORyVeU7DRmeU9sTuN3/AiiVpEeLB/DOfni8kks0eJLK1
	f2n//Og94CFv/ejIr89i2IinnEDG4ucyQ1cOP2mXg/fd7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tfr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 12:02:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7866c4ed349so617418137.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264149; x=1788868949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=jyakDGTHrmkqmD3SHHCvCu2lUuCOktXMTZdM1PPLN7b6IpSuzwuTSHvIw8K/4xDGjU
         86mWr3JnLpM143Kzf95peWtFdQ/ajuoFDCnDqG9se32epdUAgtr0GC7SB2Shk7y1GxBE
         TrRY/d1z36I5QTwLYfvDW/C+LCfs5FAmkanYTyX7RkZO0C7zm/B0p0UWMbex4GSRRhc9
         nDRpgDs5aGC4Lb2i25ahYcCa9N3bSIo+Nb/v7ReKg3VMj58orGkVP5ZIRZtLPUuOEc6r
         WD+ZbJerRanrfEQRZyoYj2R0orWJbBP3bufVPR3+Wbcph6v+KNTKkeYsGJJqJiKGjNfx
         QPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264149; x=1788868949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrSaMuuxA+xEooVjCUF3b9ipBwSv1171iBrFkM/JXB8=;
        b=CptOnRMv35bxsyAxZL09FKhNcUgOW1/6cPPxzTr1BQ0OXhwVufqHJau29ua87+5LEO
         dw82NUJxJ+s6kn64tRENXYITF6gZ0Zt3Cy0eFAg37yMVhRGITUZWdqqi1e2WorpJrku9
         PuFZSmFHka+RBgxoaPN8TXSQaoL+/V3UL4nyCngsWFWRd0eujTE7d64i71V9az175C4M
         /4J/gVarNR892ebr6gYoBgZKMyONVvAq9B46seUup1LQuDjCnKxHFS3PEHFSdmEZ/uJZ
         Z3vCJtS5iYLhbdLU4zzAFC5LZsnwS372QOBuAoVD+SaQo/ck0E5bois8d6Fj2R79p1h6
         L7Jw==
X-Forwarded-Encrypted: i=1; AHgh+RrTTG5xdFFbjEWntUVl5fWVJ5JZ4woPaPlc5emp+t7jocQztlwuRsd6h4nsL7dDjd4WcG4mGk833KKO@vger.kernel.org
X-Gm-Message-State: AFuF++lGUIYOCxf50j/qcslFcuwdftkIl0zG3yAEUstzntBBaJvVTG5P
	x97I7r7wzhwReveqnYau2OY82Hwa4y5c0pqDeERNUCT8Qt8mzQcL1851TZ6znEh5KZ4zYKM5h02
	QgS/dEpUH1WWm9AYFYnC8cLef3wPJBYyQYisb443o1tZ9OGN2ZREgxv/cEM7Y3nZS
X-Gm-Gg: AR+sD10jgYDGPvCxmk+NSSZQaimRPYCqRNzpLvYz+/Mv1W5dH9vPC1LJu2ZV99zaG4T
	dvxGLXMz6MBMV14ZRf1SPjOPb4phZts87735HzMBKbnfGxhV2POIt1HMgLKSKkS1UNLDDYnojFp
	sdOjr2W0hVCwPntiGw2mdbvkplgzbGtxxYxgkG4lwXa/f+s+YecmnBGcPlnQWtcmrWlL8gIJpmw
	cD7LeVe+SOSxMpyRt+VxhmFZQ9M5AlTk3SpAKnHvgFD+vBcVOBZGl5LnFxBFzwr55667K7BJCGO
	YYloxXtqPZwTdjtPxmuGHsM/uYP9kpWrS73Q67JYKsDeEpYzR+u2PwB7dkz0e+L9JRu3vazTNQt
	s13VzNqe8SPfaL00=
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106822137.1.1788264148113;
        Tue, 01 Sep 2026 05:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c10:b0:77b:28c1:210e with SMTP id ada2fe7eead31-785967c8f7emr12106780137.1.1788264147437;
        Tue, 01 Sep 2026 05:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm18891085e9.13.2026.09.01.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:02:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:02:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96bed6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfXyIrkNT1gqDT8
 R5/T8nfHkJG9Wx8uvicasSGJzjUDpa4HlQNavwNfEu2WqNSVLix1xLvcVJTDETDsIa3VD2nGPme
 ycnzDW2q3nIUVuFKwqVKqRWeMd70VgaSEItECxCrUS0It8810K2mXmYxLb8/fSA3Jz27BWJYR2v
 rMniw5ZWOufe6rgUw+MuM5bwBHs8Aba1jZxLw0oq+VC2WQRL4Z3fUOmYwNhuLmOoXO3cgzF0gH6
 WltCyudcWOTu2U434T5FTExM2oShvwRkLDLmuoLRbLIxNoR3KLdYe/iy9Csbm0jKchvhxJu9QkO
 l5FDZvvJZ8O4U5SSrJk5EflngER0rAXNs0DRVaEeoE9L6pJgKp6AhjQikG6zA96McGf/IPlM7qX
 50jBkHTZ5AgS2gIwJJ4bvX+tT4xO43sjjTHBrr9Ss1YdnE9Rrh8tgfEJoux2AzR2cMa5DGJe/gS
 vYDjPK3ibxMUt6I9Clg==
X-Proofpoint-ORIG-GUID: WwMBcuzSpYs4Wdxain7inb_zhd3ykXWl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX9zsbky4YJtqQ
 e8cjs0G/HjVxUO3OBMBjiuHaGj0annTdtr1jtekT4r+a9fszAMNiG7wpOApO5hsBWSgD0ZW2VTb
 dYaib32A/fAn5LUc/pFFEzyGa4z3JJA=
X-Proofpoint-GUID: WwMBcuzSpYs4Wdxain7inb_zhd3ykXWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010107

On 26-09-01 09:24:35, Sreeshankar K wrote:
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
> 
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
> 
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
> 
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> 
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   Make all clk_init_data instances const across the driver.

You sent 3 versions in less than 24 hours. Please slow down.

Give a chance to the reviewers to have a look at each version before
sending a new one.
