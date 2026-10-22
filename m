Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659520;
	b=vxwYMolaGPP8tBXJh+773lw3ltx9pzfCKtBLPUVF456e9Q2VvF7FyKP2wF8yUphB87k+
	 ZKs++Wza9O4ZEiIvFH+OIMTmqhHnW2Dj53UhXTqhG9poaHZ7LwU41X2XKmyHiyEIPsmNX
	 PMzr0MXdZ3ZSYmqJizYsJXUiLAscgOm7GSSQmhudIeBPUupHwBRosgsxAB7LLvg+RZciB
	 Zwm5p6gZLce6Z0zYkLPQWj6/SMn7lIpzZYWab5DjVyxzUCTYPjfw89tuVxUykAiqncab2
	 LkbKhsVEsPMBvE3GmtpPOaZhdJ3iZsIQp1K+6GUno3m4vVk/7kd0qVCxCM2Gyn+Vfdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
	b=F2b+XLiaIxni6a9GWjKEJOsjEXrYqgtuO1IpMNdLFf2ZaDPwY0HgW7qQi+NYkYzVlx/M
	 f9Nfd76W6lKwOeCp0tNPUtrY4pQ0dSBsdZP6dRRln4vb2YMpOw5d9HdNqwjRiYp178NdH
	 jKBPNDUQ6oV1sLVDPEobK12Zzx8cSp4OP6yuy28rfIYyrLdex4szEWt8g3lYyiqkncyEH
	 HZ77xtMe9Mv8Mk6SdYTzkr5EiKeynBfWgNgcO1Gs1fQh/GQOsy+1vwYs4yYjlW8u1o3h9
	 WopYNaaOJPH9spFS6EpgMe9cL1dXAM6E/Ta2D+uMFVeHAiBMHv4tqm4OwTnueuIs3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78301606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78301606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4OfLAR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnh87nLP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706GM4136656
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=; b=e4OfLAR0dHMk5Y7m
	9vy3FmunungJ3vq/maAunsEkz1mlHYpsZ04UCZp0PnPEzRsYZJ2jKlpVn9SC7rm2
	FHd311KK6+gmuF1d5+Kv7t11ZYq4wFcB61uD4D9YqyGRzyAwDupJbbmHtaPy5Zm2
	6H/n3g0fcT6E2T1QFLyk4tjLy1BGfK3hqPpl7rhdewM9JIjyb01dH37I4JmYVsG2
	Y38DhuRCnKLu3eak1Nv90+Y4Al/kvpSVHGHPN1ZSD5oARl7Ftr32jrgwA3PYn0YN
	8X5/Yq2zguHH35spgXhxxZJ64YNV4exxNUuj3X60ZuetgHLnWWD72xmTF1EdZkOp
	cb16eQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9jj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:58:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso21581985a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659519; x=1793264319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=jnh87nLPjAwofu9zX9OE3+i6nCcEQwlylDaq9IlriJwBfGDNvDBD054oR4uGe2XW6g
         3btP2BjCOZwqgWFTi2STOrUzcfS0EO2Uy/5aIRku6EdYVSIzVuOP37Q5icfeAR1n+8L2
         r18VsYzKqEfv+asc5Btbjl51ZikA/OTNY5SxgJsplmWi+8SW0Rop57AWSCMY7oeg1mBI
         ngjOZ/LnZ0VaZxAqCe7+ti3t/DYOGH15DvLwxCkQiMrUQc45V+eijDUQFmmsnwAJ02uf
         w8K1HkORyAwPi2BCBxVGDD8gDN6ChR3ZoSENk3t8BEzs0unNvutTGLBeBiiRDWNqsd6q
         Oowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659519; x=1793264319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwjdmy4HQ8RIpiCkzz5vSQlEwh/mqQ3eZpqMOnYJBN8=;
        b=eCrfFAOc/GIuUNowDx+YhYBGA0E1zenwmiHEBocsaRpLMf2Sks43NwFPE0v4kKQCN7
         bz5X5bRwF1I2ICND0jioqq8K2vep/eDgBf41z5u4/0yCr649SuYGfqI6Nc4qepOjQCzh
         vwnKZifGZ8kBunBoCXexOriii6EkubnpXpOPyucef3t9sEqXu8fbTSKjeSxXeGWUoJih
         mizTvmW51xLUfak+jJYRBVryRLg/H205X7pLD/urKW2WfXGin+/DnFmghKMUCWg6TTA1
         xSjydH71vqwtDERrSLSzLWd4u19yf1FTuWE7VVMt81b469Bp1yqPO6pb06k7nvKK3qJR
         /VpA==
X-Forwarded-Encrypted: i=1; AKwUvBwrGv4kTEvT2Ba33K32LUJJfKE/yU0R1Sq5N2o0MIP/def3BuAX+RIxBAtlGkvLkT/j475khp4s4cB/@vger.kernel.org
X-Gm-Message-State: AFq9FYLDlbLCSq/28PzInDQxZb3JITuftP3wZ7jPy/LUTsgpgGUQdCh1
	IFFAK2aDUS3CzuL6ByX56kX+PoW8Q4gr8gGn/fpv7rRdBPMWKejMQJpcblVrCW1cTKO2ZYBJCme
	Av2ObjFdNxZvnPvlB1NPICPhVd7su3EbLDFMx+iZVbflBnL237PF54rrwgtdZPE3+
X-Gm-Gg: AYBFou0wB65cuOwXbVEpMaiWZjY8G8FvVg9M2avrRMvERPdNjMONfD2wTS82fM+nwQk
	ruP5Rx0/TEuGP0YX/XYrizF6BbCTfuCPwgPmf7MnyQSkD2PAJ88hYxUNgTSEjJBwaX0nkNo41Yd
	aJ46w1upc/a90dfS91+/cuVufqcG/SjppN/UGr6Xv22CGl0KXaQTnMlLWRu7K5AkFSNUGXJKFj5
	uEh45GpkZBg3/LqduWaqK+PYnSmmX1uxMGKv4czZiC8WelT+dGNPMf/hdlhpZ9CoMGfn3QCDSCD
	T873AeW8NLO8EBjOulJQU/yi/Uig5CycNMPKKf3cH8mPJgA4Jy+7OdN/HVfzHWH91XUXw4lX9PO
	eZMQ0Gxv/9b0zsHrhC0iM4A==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980828785a.3.1792659518695;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr980827185a.3.1792659518213;
        Thu, 22 Oct 2026 01:58:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm84471066b.60.2026.10.22.01.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:58:37 -0700 (PDT)
Message-ID: <58080b02-5c0b-458d-90fa-a135cc79b847@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:58:34 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-4-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX/8omD6MJnqiQ
 wDnLgITrIhtmcSQaBbRS3NchkIYkQ/9PtwGO3xeaEb03ff4hDkHxbsg1PVYn0AvCMM80HA9jmP3
 b8A6brFZYu27SV77KdKBvIVdLuy1mEk=
X-Proofpoint-ORIG-GUID: nV64PXon3QBMNnQJlxtASWoMnEGpDNFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXw7L6ErE8f5n+
 ek56P8oBawfncvVUeiR595zNKwwVq6xylKnNuW/lM9cn998AKtmZU5O9S7KG2XKkxAsbQuYtfGB
 aVAUFdJBIgV1jz8luZk+q4+2qJvLvLIRTrWti2n98jncwlfkfcKRwh2O3+0RCJrG/9wJmlGQyF3
 x+JHQQhtHJeHh+jDANK4DKd8pXf9caiSWKyqr7OFQsgLFVcOI6acXylZ2ZGim3OuEG45EwnTJ4a
 GJbkq5QRJ0LE56vfC1IzXTbu9IstjGRb0HtMh64G16GlRYH4ECjIJb8TF5x5kNr1i7ob/AVZFeS
 rqp0iQ6c3u4QmDk5PnARy2ZX8ylFDG0egRpY6jychhdE/+1Z+t1izMgnaAqmwhDkIShK6BwhEVI
 75X6ALngOw4mz1DnYNbo7X1I5rqedrNaoEvk2Q1RLaeSNgehlxNI+g/Gcmm1GDxX54bqhP2Qw0w
 QUkiH5me93d3osWbUMA==
X-Proofpoint-GUID: nV64PXon3QBMNnQJlxtASWoMnEGpDNFl
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d03f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dlizgmcMvvRP8E2Vd-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
> Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
> usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
> to support PMG1110 usage.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
