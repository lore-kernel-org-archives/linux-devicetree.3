Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AD3F9A1E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147563; cv=none; b=YM5qC9zatpuTEK5mWRzdDt0hM5QIBEzoLA1TDN5Hm9unovEsezbppUp/FnEjyxxknXTnJ/jEKqG0yu3jBx2ZhizWNsqHzBH8ISOLIjkM0MI8a5POG5Y8EYWHHiEuHlAA/OeCFqM/Qp1fNhVutyo7dU2Z3eV9+3RVeImI592JL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147563; c=relaxed/simple;
	bh=mRnDU11dT5vxr36UinnGYhY78N0KmEwfnFRcvyJODck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvFXgzYF+WBqBg3AJu+Xo9xyo3rxxSNT2TAp9ep2o1T+mHeA5/wwG4AyS0vLscK9BvCbqB9/VeTMzS9Nq2WYD/HSl+ETCyHNqtf03hjSVmFclNYptlyQgHDFgE53T3fb8HsHFWuGo/whON9c6uQHhenBEXoTK69f1g8JNSONGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnRRLQfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GclurnX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnRRLQfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GclurnX/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAANZD2496890
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=; b=KnRRLQfX+76yDvTu
	86kAqpsiWrf9wfhwsbmwhPJMWr/ZVO6EHvhsmW/+n2wyexRibcZgLsLFoJgjdSCA
	t4H6Nv0j6DzQyYymyxjWLVIAJ1qprt2eWCYCIX2SrZ9Z3B+SzUE6DLVESLVbsprU
	SL2DPPqNShZiDlQd/HNimBnFhlqa0bd5zj9n/6MtGmRLUCzIuPP6teX0UIfw57gP
	hIbEMrAR/4ghHe/wGk1FJAuCFrsZXctgz6r6Fge2wFjWvqFMv9dZZQaZ7VL+ixtJ
	IBoo77XzZlRcb+Jm/DF+t54UB3B6ogmE09iuzN9Yigz8LDf71JLM1iEDku5kXs46
	85kZsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3bmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:46:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so4212721a12.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147560; x=1792752360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=GclurnX/rAD+7TRAOT+HzlaB7f87IIvZKuoN/3D41tX6jK8Vt1H1SmiDXbKa7qBe3p
         xGwpST2BgCdRf/pkpyJXG2VkOzvUvUJN5d+rfpfLcnxrzCS+cQtEOabm+FwwuMkwaiEj
         IPIgmvXYqnKThBqLyPIx1WYKDigeY6+/Q3WegZhwYztJqU5K5S/N8trJ3DWqqXGx9V1Z
         nDf2xTdGBu+r1gcb7Vimhr0naiC6QsJ1so32WF5T/Dwq6R9LxJZpvXIUQQfEvYfcF8O4
         0BQZVj0WnVYxu5LLeNC2kD2VjLTBdOp+8w0ArjkQdv+NCFVJt2N5EiEUmbUWP0e4VmQQ
         Urjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147560; x=1792752360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvFpvdnlhihI1ZUb6KRj7mAVKG5697jqjITdYPqSxq8=;
        b=HpGAdq4uTWZOR/oWZAsG4548kRFQh8lmPdi/EDWaigseSoE+sUIA+Xusn8WVd4T1mW
         FUAd3H4PLkV/MsBVRlLr6nYAX8A9uyx2omPeecwyW/4AmghVlrJLFanX1DD3pOAcT+oc
         1fZCjyh3kfrJo/+OeRO9XVh29ULwoNpqq3cJ5/SzZvkMXJRamxwZwk2PPHq3Y3AuWBQk
         los7DX83ymzep1r35kptkEPymJgchreM5UOc2qhJOtCcrKtHkVOoaNVg7RNRdTclMBel
         6bwUQKWReAK7EJFZziH6k7DCPvC7KRpSqy+HYF0TlZwemNxfOZDxpPOL/rXgAAn5CzdC
         34Tg==
X-Forwarded-Encrypted: i=1; AKwUvBylP3plCRncs7chpKzFhPFktpa9Cji8D35E5B47qvMM+UQTGQB0dEv0WL6raR9Q3+stlLJqdFGf7En7@vger.kernel.org
X-Gm-Message-State: AFq9FYJpQpUa5bo0y/4mALgUqYaLoy5A7GKDbFmVUIzSeOc35C1jFpQg
	LZVmzuCREgyICtGegCX4vPOOwnTjNKLzMRzLXSLohhLPuvP7WZfezHhM/vqp0cRSTo04nVKknDG
	SRfzXyxF5gJm4+45/tzOFF/aOparEs/zl8rk5qbRCIJZNbCaBAffw9uEV+rlTzr5P
X-Gm-Gg: AYBFou3IoY+b6NHhTyHkAWaAUA8cbaIw9+8mT5VZh8nSd9L+Lm5xSaE3hXfxQKB4ZhM
	hbObihEWOq1kmKacmSnzUeKy4G3Il2/2fhd10HNhSnC85CgixKEwgg2T7p8zenqbkOUJqmCFO18
	tZqKEcdg3XcJz/9TOg1p4MnWbBbXloN+HfZGGK4VAGGBMAQFKEEYeQxomLSLdRlHGgo0uwg+QCM
	VDDIRRWncJhd1vHYXNRLpcKAoNqCTevLa0DK4eNJygqGSCtGQL33005QrIVN6wvYSrMbVI8PEY9
	3FOVPf1xOfj+kZzcCMOgVhh+HzWf5XlMUhHKfdyoYY4UyVKo1D3BuIaIt260Qh6VsDu0x26YUHF
	dK4qHFZeCiJrlpZPKUQ3HQ5rvMEFLb9cBEpY0Pi50sI+qId5lvR538ZMbwTXtEd7OSWZrfWTSQv
	JiSNQ39oUQaHPOy7a+/SsYLIf+Qxw=
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991598a91.35.1792147560193;
        Fri, 16 Oct 2026 03:46:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4a81:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3ac9d15035cmr4991569a91.35.1792147559753;
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm8694482a91.0.2026.10.16.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:45:59 -0700 (PDT)
Message-ID: <05680cf9-eb58-417c-b976-027fb6267609@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] arm64: dts: qcom: Add Kalambo SoC and CRD
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfXzLzXdolSKilS
 ULSo/wxWaUKKX9uMsEj2Sw94Vy91SZYZbaa6YNbjovnDuf7XthQjHCW55KXR1Yda3FfQUG89ljM
 YRvEm3NQg7XiabXuqfSQ3z1unZkY3CQ=
X-Proofpoint-ORIG-GUID: wdNa6EkU8YpMzL6s7cnQ8E1tMp-pIi3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX1WgTKdD88BUn
 RvEtSXaN/Ng7rTISftIVhAZEFSVPiDKH9AVI0E9/sQxPuLJN7vSX6QJ/tquFvWUK1fj+BUUn+X5
 hFg49uXMUNQYX/iodIk7N3vYwW3p28viWzltpu/UKd2wPDJ9mhHAYLhHNeC7mcYBjg1D7twx6J/
 2JQWYKSrPOLb9mtvfmydFTDrfpjGE2eRCI5LCUS5DmExZOQ8nALAZXiPkAbSB5Nka3nbuDeD83L
 dLEshp6t1I1d/w8QepmNt5R8k/OgTAvwSii5Y3VK3Kgc0XDrbGTtpwPRPjzG2Eu3KmmAMNUoKt2
 vtSzETdtZW2AyiDOF3M3IS4ADV2V7fHtXEORdfwLqqcqW8bdhGb12yVfWKFL5dH37Mlu6DL596r
 FFA2V6St/3pS23h+dPrPKdmO6yRex2tDRawY0S2sfBCIg/dmnYdLYfdLz14j/8bC+ZoFxqtHTw6
 oY3Lyan3G1msFers49g==
X-Proofpoint-GUID: wdNa6EkU8YpMzL6s7cnQ8E1tMp-pIi3g
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad20069 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=94Q9wnbR4VJZ0VN6m9AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042


On 10/16/2026 4:00 PM, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
> removed, leaving only cluster 1 present.
> 
> This series documents the board compatibles and adds the SoC and
> Compute Reference Device (CRD) device trees.
> 
> ---
> Changes in v8:
> - Rebased on next-20261015.
> - Dropped the DT binding, SCM, and UBWC patches already landed in linux-next.
> - Retained the Kalambo SoC and CRD DTS patches.
> - Disabled the unused bwmon_cluster0 while keeping its shared OPP table for bwmon_cluster1.
> - Link to v7: https://patch.msgid.link/20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com
> [...]

Sorry, this series was mistakenly sent with a v9 prefix; it is intended
to be v8, so please disregard the v9 label.

Thanks,
Gopikrishna
