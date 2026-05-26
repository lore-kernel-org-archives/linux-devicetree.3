Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB613C8C65
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779552; cv=none; b=XOf2GKfu/OkebwhgAAvIVnrgDO0l65bg/W2iq60dxrIgeEOTUWwTRlWtsJ+549/W+FPtqEWriy6pRBOHdUIK/HiD+gPKCgZleSVGqHtscCXzdfICLxa0r4d+idxhjVCFTHhtUHHU8RX3Kw+twlD1kIv/O8+M4MvBmTy27k3L5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779552; c=relaxed/simple;
	bh=duHgp5PU7H3VnmkXV/cKIwFSafwUE0CMTvpblVvvagY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S78sY83xbjNV3KpgJzBofICLnRpTuCMuMUfzOM1m7Pnl2IHjHiMopMk8PBXSvRKZ+LynsnXou+pvLTB4BJoUnIF/oCwI4wR0jkX+gW+8nw12nzJ9Fo0xAVkr6C4z6c9h1L0fub/DPZ68AMY0/iZOHhrPRt+aLWjcGMTL+Edbc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGk+HAUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghgrUmg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGk+HAUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghgrUmg7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5s3N42146351
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=; b=gGk+HAUHmsFiNZW3
	kDQZOWEzXWieKVCQBc+JuGtPJPRn/XgHBE/cr+nX+ZSz63EBqwRsyZBCbJ1htuBf
	odPfeghx5Mc+Ng4mCntlFurDT4iw5vQIxlcjWl4LW7ldU0IajYS9AEdlfn1o1BJV
	kRn9Z1i5HfgM3maa64DJMCd191P/QpOCEUVWbbAUALLYybVRX4/HFOIjekF3SZ7Z
	6zj+0mjH1cscblmQxVW7UdRqVgQqFfJ3y4UCuA+YgLa1JyR34q8cc4qLfS+U3XTI
	vEydTn2fc65R0XNRLLKaHNWNvZCtr11lEDOm2WZwbzxQhun6MKuzLDuV6RqcsMOm
	Ll/cgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3d1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:12:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516dd6e4ed4so75832081cf.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779549; x=1780384349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=ghgrUmg7KMm1wH5jEgg9TyM0o9yzLFwbKq84k+0G+ILZiH8hFfwJH5Qh+2TR2xg5xL
         d3It+lIJBViCY3fFA0FhQUbj9ug0ARtNJPMaoTpmbYadyQum5/CnLdQgMTT7jCElMDVv
         tjRho/oOynuxEvrNg7D/3om1CgeEEDkIXXRy/P9adrEnnlVfFU4KvjCxTWJ6KAwApq03
         shcHyMIkg1+zojeaPWz89KXRyFONQbKqbb3r6O6yvTpSKDGmzawEWtEtsqrttipRmCDT
         XEW3+UMxqSGaZY3nj/WFQoByKZz60iBrJ2pJaZoSP9YbmGE2WmCzuFh3sWX06/nxRz46
         w44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779549; x=1780384349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=dPdexG7D6L93yHLDUDX4m8STCIf4ATIxRVSy/U+mVQ5UH+KI8blDuxd26hbWfBrin1
         iz7rCvbjsAN5CoA9foGiyl4Bji8JcOblQhqFwR/h6bzHD/iJY6hO9AKRZSFFcKKJ1YIH
         EjAKvWs1x1Aqdgobv5xJSrNa+EBKWQVdvBqQbksUae/RztqpqE1C0ixXV25DuYGklcpP
         hW4GkVaIAuyAdEga1PfkYTapkA/ZoYXnA+1cM/RHk0cSgg1P7oKobJIqGJSvfX+d/NO4
         GQllsP998gFeq+u3adEhN42wHpDOlK04HwY2wW5C8AKzfbKYdkoKRt6mK6jgY7FBioz2
         osTA==
X-Forwarded-Encrypted: i=1; AFNElJ/tDb7sy1NoerMbHD/0q0Iy39RdACporj4rHcnphPapXgmGRyWEifuj3pWEsHP6xcQDXc1H8BExRWt7@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/MoAuXiC/rESNZp8ibDWW9NpQvosMq3HGdMHvlwgerfY1F+O
	a06f6uiZspFifSKyWPM+kJaQ1jm8/roBczgRKvfTdCjYs57uAUP0pVfL3/ZxNwrMf/b5/ims1XH
	gmJi2pKE/AQN4yYdSIurTUoFUx9bI3mPTndMmz7xE2er6rK7LKqfFD4+Wi5YUvp8T
X-Gm-Gg: Acq92OGzJg0zbhcoob9DPG8hH+H1s9mG+YaczWgdRcjpX3ZnG+xVa8J1YTl6wm/XIBI
	LmR8PR7ig93eDl6Lcc6npbQ1JQT9tBbz4RK8rynDbHkk/Wc1sFG30S2JDfJRDELZ6RLRyXOo+ee
	aeS5BEvKWPI9x5aEsxnR0KyaKZmzuZ0nLK2zvTsP4injDeCYsAV6YW49fAIh2n1bnkuDj4Ckscw
	MAcqeqt1tPgb7HCXKwNFHXoE0fFXYbbrEoeG3DNkttA5Oc8TVcKMLtk0C9n7+KAAIQ7fdOAPiAV
	EpCfd9LtPO9IX91ExxJvskZFsEHucNMtwvKLKHTCFvqd9kdc1wDzt4AcOJl12WOQCgXda6/tfrL
	wehJFvHWPIV7fbAgXtC9+S8YubQHTVULCnJ9ri9hsQPwt4f4LOGN4tlgNCzNGBorJ
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250026171cf.11.1779779549526;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250025791cf.11.1779779549099;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
Received: from [172.16.1.42] (135.31.0.109.rev.sfr.net. [109.0.31.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm35552477f8f.36.2026.05.26.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:12:28 -0700 (PDT)
Message-ID: <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:12:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MSBTYWx0ZWRfX5GNFujZBqs/6
 DLaop164ia2SmwFl4sGaCaDef07P4EiDVcJ/gz1c7KAKSzBuHdjpZgaxinY9IaJqTcQP9M8Fk8V
 ZYWm6y7xR6TpLVkNLM6MHEMyO9arrXDsTh8DSX73VWXy+Cy/R2MokDhyEybRZv1UnmTdvwQB1N9
 LSRPyZ07w2p6OVQD8dalc9EMm4Auu/Wb8VMe4JEGECbVt9GIP/wU/wzOWeXFqY78bMNYw2ZENVx
 9ZCVQQnZSI3kgzGjsUL/KR+lIGJYcvjBx/E+lTKBdhpPFmSjPjK8doVaPNfW/4RvhoG073z5nVI
 8xwBLA0L8VdMdydCXFsGr91bH7vkb67SidlwBnYEvgYAYNQeHL9/bF4DJF7q6Z2/hEcCsPkE4lC
 h72Lvtq6802+z34AfAP1D8bk0GpVkSkiP726i3ulWwj3Ji3SkTGkj+lejMsrgQr5KIR3+MzqwoM
 oJ2eWPEctrSvgw4QX5Q==
X-Proofpoint-GUID: joZfKyMiPRS9y1ycsSiM7-6DKN4Ko2W8
X-Proofpoint-ORIG-GUID: joZfKyMiPRS9y1ycsSiM7-6DKN4Ko2W8
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1547de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=yjcNvhZPqzdadiy9JSnYTw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=utSEQufgUorn1GdmO8cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260061

On 26/05/2026 09:07, Taniya Das wrote:
> 
> 
> On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>>> registered as standalone GCC branch clocks.
>>
>> , otherwise .... what?
> 
> If registered as normal branch clocks, they may be gated, which
> breaks access to the EVA clock controller during clock controller probe.

At least for the gcc_eva_ahb_clk I'd expect platforms actually reference 
that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk 
it's fine as it follows other XO clocks, but please add it to the commit 
message.

-- 
With best wishes
Dmitry
