Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1193238B124
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109796; cv=none; b=qiFYHUs2zJ2y1FngxS4+eWeOl4qv0Re9E/2aWvfevx22Y4v8pWzph8PIuLc3eNtGnrEkQ9q3gB8cqZvYp8s7xWO959Ucvjgp1SBe/CMKMMPglWQS/xmzLUcGvGyNBJnhH3NYdbBQsSazQ1jc9+aW/NGdJF+aHom8glieUFA9cFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109796; c=relaxed/simple;
	bh=SN+u7OIhD8Lp/eXjOqk8WKjEXVeZap6QxajEEaEm7oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8MGFffNTBO3Uvih6ah96FL96J2ZbrwxJKq2LcAKKzo/t6MDEebSNNOEZlRv0BwGqf3ttfgCM0QTSAvuIaAxnk5/30xbzi/uoA9ARSHrbxn4ESIPqBiqRRqsLGlxWvPXNi7+sO8TZq5Eu6FyfPv6B1zlTm907lZ1ymUCd7eltnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIj+EX7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMduPMPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIj+EX7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMduPMPf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2lO4C030310
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtUkidXAHsAtf2q683tbZrQMA8Y4N68xpw5aqwFTrYc=; b=gIj+EX7DG2A9G+Cm
	bYLzeJziUIJxdojXGIz5LBWIByO+8fnEhfMBkF/dxk3oil/upPUO8JRCoIkWflLe
	lZZK1lUhQ36toIeCDGNjc8Rj9wx9Qs7+1mA1qs4PEa1aIwot2kekC1ohyBFp0O15
	yAEayAqvYvjMZrAHzjkan9bOQX+rIL9yblsP0ZUO0h+hjig+T9VdtTNK0/b0Yy/t
	mVtGESKYtHQ5Fey3Na24iwX0ywkFo6rVrUOVTic53Tg+S6gQ8r4TrwusnepceVjV
	2XRdrYjD5Ao82Nv0pVk2DJNg60HDDVW6EO0GudjpXx1iFNu+4gco/vIxpnO0C3Zz
	3bclWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm13cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:23:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso600572b3a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787109793; x=1787714593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtUkidXAHsAtf2q683tbZrQMA8Y4N68xpw5aqwFTrYc=;
        b=cMduPMPfpMb6f4nPVD53fO8G3fBixyJWkQcbTHaLLTM3Lc8Rn++qzDTxjPw4a2vtxj
         xWm8dKVzd0N4w1VfOTbpjPkEjiCT5Pn2Fqj/M+rsUsTuZJKw8R42cnq6y2jYb61idthA
         +jlO2FfepOeTZOxWifcvpGNmGceAthX7GscCTTli+CRpfrw6vTFvHOAHkCvFS7kG/9yP
         PQ80qfc63ArtW8vVpJTwpFdkggXi7EjFmaD6ZUbNdseyJ3TlLT3DjLQyC3pr33JxiqqE
         lMuJaDcS5QGRxkHZLla3ulrerdDYVni1K6dF3V+7YETOnmxbemELyk7CtKc9yo8zeoeO
         /R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109793; x=1787714593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtUkidXAHsAtf2q683tbZrQMA8Y4N68xpw5aqwFTrYc=;
        b=cTtYuNdHCecxSuGMrWrtTjfCSzRxX44l0n/T81Um/yIrGZLImcoNJPKDX3nidg341p
         +OJ7At+8ddmgHB5q8sOq7wO3mnv3exkeDGvwnBDUf6t+AFnpevBTodFsObPw/fdoGEt/
         elt22iiqS2zUAFm+Vqv+yLf/OYPMA/XibbLNchp2GfY4jqD/h2zHSlMk/Z7IxS3lwJNe
         lY1mo3vPLagLhhehzVkkSfli1BYyzDnBk+QN9oDtBzHRJZkp3Nx+L9zpHr5+9P7wbMB6
         OUPNbFvEi1CznSLK7Ss7EdyEr750/m5oPB7Y1NOdRnSRSbKeuSps1yNlzz+V3u9vfY8z
         KFZw==
X-Forwarded-Encrypted: i=1; AHgh+RrwT5B8TGgMD6p2LqtfGvGtspxqK8iGzSpNgp4FQr1ufWsGwZvJ/EGjYV7AXqBmcmHzYx+1RagEtyuF@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzN98iSHwRAoVdmQYDNbz8FtpsVzcIsS7A5U+PfV2vpIPlhkM
	lbPlUwoLhUupicqAvdE3G3zgNPEdkppSQeAMtEtFoZxh6fwvlkwyP2KVKa7n0vF2ViYSYrO++PS
	g6Lz+GBsxqndfXuMag9tTP7SYrMJQnBV2lU4GFJmH0MoPwl+tRhcqDAFzUDp0E0B/
X-Gm-Gg: AR+sD130X1wfPcSwYqbxT0BugS51GUJP0ULzyDLrxwgJvcm947al/IT0TQZ0Oxrf6+7
	lj6KvwkvV/UQOXjGndUkKD9TGYD6pQ8NC8I2RlwEsY4QA9hrINH0tshIkH+170+C0dFWUxVSqN6
	/duKWhpr19WHoFctk4JgN1Ue1aBdcNWuNvHPZT7TQppDZoRNzykNPDoOsf5v1YwgCev3tZdINR+
	IF2dRS2VpueJgLUeNg4AO/fTK1N4qkzSObzz0BLbfGKKkM9drCufURBywZxnoEfpwwK6uuf2Q/M
	cEA3SFAkMlHYbynhkzEwW8UG//4TgX12zhE3ZAor5X/ElNQ0mAUwrPLX9scNKAic1AQxaHYBPy4
	r3VLwjyMopHqvJubvM3katjRHBiE=
X-Received: by 2002:a05:6a00:1890:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-851d18a2cb4mr1785953b3a.11.1787109793552;
        Tue, 18 Aug 2026 20:23:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:1890:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-851d18a2cb4mr1785911b3a.11.1787109793141;
        Tue, 18 Aug 2026 20:23:13 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3392a96sm124241b3a.20.2026.08.18.20.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:23:12 -0700 (PDT)
Message-ID: <f4c52f88-ddaf-4cff-a235-d51cb2c38786@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:23:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMiBTYWx0ZWRfX+mFKleAHn7P3
 YGq/2/mrerPdlt7m2TbI4oDtIvfjLsBgFRWcOvQazv+nwBf2G6sQd6fSQ2uF/JOPxuJ81hePEiz
 C6J3EnlEOFurx6Rp90spxt1505aGV6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMiBTYWx0ZWRfX571+7NmuTL0R
 BWrmS2uFbKbaaepplruJ4DDenU+LQxjW9p2xGhbcO8ByDHkZ/Axj5cSw2Iz1LFcBI0fLnRmm5wR
 ibWhxq3zC+sG1w0TOVNKYAnQ9Ea545lO5Z3qDKmGvEHNizZ79vJZDjlkauJURl+v4tfwCJT1uDh
 erfv5KvhXmyD2fVJbkFgBmDpB6iHnjSXntO2VO4aDnCUSEu4uhfxwo7DgBSY25+2mQjOUehFBTZ
 mNTu8LRfXiHvVRSfdWqWooc5TdEVaABhu3qH9F8zi7GrlzLuSnaQneVnCi1BhL11ulz95Btd86l
 DPmEgaHHWxrTYMaATI2K2dItLVnRCvU9V7I4vDSk1rDIMyUAeIn/604xnSGj0/nd47BS2laJgLX
 53rNlJNrP0yNTbXOCe59pbbWXluUsFVPE3qEHIQ6uDSHfuPAoklxGuGcYL3lBXDODOqbFO3pcLd
 77z+M//rn+8LGR3ldzQ==
X-Proofpoint-ORIG-GUID: eu8_OYry-ZFcCysEJXMITh991kw35wAZ
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a8521a2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7SNk80zgYqIXXrXIq28A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: eu8_OYry-ZFcCysEJXMITh991kw35wAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190022



On 8/17/2026 10:13 PM, Konrad Dybcio wrote:
> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>
>>
>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>> powers a subset of SSPP blocks.
>>>
>>> Can they operate independently? Does INT2_GDSC need to be
>>> powered on after CORE_GDSC?
>>>
>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
> 
> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
> be enabled itself if CORE_GDSC is off?
> 
> Konrad
I No,  INT2_GDSC can not be enabled when CORE_GDSC is off.
