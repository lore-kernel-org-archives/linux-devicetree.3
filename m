Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC73932C9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069330; cv=none; b=r2Gs1bcD1s+bIuyfHS0f59158UPKNr7CdD4YPgBAnMNas1rMlSrN9P4ok/vDW4GWmNCdp/xnx5kuXpWgjon2TtL8XsJJ/qJnRd4gSLyTpauhucvXf9hm57xrXer9qGLYRBVCa3DwxppZ2+2vMocDYhQT5I8wlg+H2G6PYASJn0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069330; c=relaxed/simple;
	bh=9IrDLhsIq5pxMA+Xyj7gedboJwc+A2jzTnMvFrrHZrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keH22weiczqIoyWOHGQOnnbyoOodMzN9hLOHrS7vq1+j7MWQeAr49RyQvL9EAa8uV+gohY2cBeLD6rAHrOEggeG16k1GAI7KL6nk721Xxc3IikP8WLrotjLFvzpTrW5GpcEdEd9BCQsBb50SEUTqcFTV17vHnMPfj9iqoNhhDIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nngNj7Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgLtCjEq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nngNj7Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgLtCjEq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Iq2F3195670
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=; b=nngNj7CzYxeTmYMG
	TF81T2Q2hEfwfW7HU8ssyMycqqbpofTvqzp4NLOVxYbj3R4vO2ne4VEcWRPxnVcJ
	t7+c37NlQPL7gvPwDmBT6M1Kt6jjDiRLhIP89+TwxUqoHGdrgqy3sbtjXRbAK/qP
	fymevA+TTgYYvLdKgO6UWCYrRheAMUbxryV9SNQ9NlKzOgSLZV8l5uIFuxpXQDlm
	il/gBwxaRkwJKjMhEuQa5cKIkkLtEsPeb0bKFkpbTEVgR/19RV7ScpuSPaxalRoi
	tBD8e5TAu9QCKs4xqXRQjVnd+nnhlvcLXnqQ/08FW7WZaX2NOrHtu++VgqGJRLSZ
	dtsH1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrcay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:01:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380c178acfbso396496a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069319; x=1783674119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=;
        b=QgLtCjEq+YmAikXS9megB/kPD54P6sbfA/7ChxpOi03dt0pzx9G51mJ30j0NBM69HU
         MsqmsJP09FcyZHH6GAtCohDn0G6UU2ajm/d0JOVIHJU/ymFLq441O1gZAuV4O6jY9jiY
         aTES0wVYbJTxabxebQ55n1v+qWh3R9EoAB7tpD2+Xra6OVHSbKa/EdgVUHSc8yJxoGon
         +uhl5qo2+VqkfE8ktzD//66R3K+Dr4M1LhQCg+Fa4xV2boZeSRoUVdHr/eSrC++Ndq8O
         NsA6CXHNpcZsn1EzgnddFwW5wmJ3jpdJ6Js/Zc3RkdIA6xpDNqUp3HisQW9PvKtVSNcw
         ZPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069319; x=1783674119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh/lLxGT/43ZnY5veH+mk6rwqDnxwCL/BIwTp3/F1QM=;
        b=JdTiSWWPeyBqINKYwU57t76PNS5tQ1f4II7z2XbjZNl+029cCIZ5V6eMZu7gqHCCL5
         VoNeAlMlkZA6uFmfWI+T+NCke+at3DBzhAsH64JNpzbLnlo65blNk+CsLkLtmC/hWErM
         UGQpn7V6rUunfSetBoNoF2cx1B7gqI3DvhYGx+mZg91re4HKatBE0ZFh/4CvIJ1dUiWA
         Kpj06H1SC2dnGS+kp7mTZOLAUbNokrGq+fJGzcPmFIGEb9NuPOvHBLsOkQZ6kYwDevX1
         x0/NK45VE4cYN9iupfLw0GiX9WkH6+rdDiB7No5Jt4k8T2WlZuRBlpvBpMPAoDaf86BQ
         piWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVeJyMDY+22bIoT0KBBj0U2f5aIsqlCU0VDHQyS/eGkpXQatc0Wyg8N+XAhoNmBL8PtGcDuYIyI3Be@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgqIpfMnrEnVYDD/YKBw+rxgmcXr6SsNU2cyewntzaQRxQL+M
	kyXGI4uE64F9eQUYDEVNtAIlSiACLlzXf0U1kWNYT1uEs3SXbDELtsdxIkzy8nvJnosyz8G3r2H
	BXsnaPZz13btwu3AY5hBvClem/noi7TYRK3/wo5j8aZndAPLCVMd8PAtpThG3/ycu
X-Gm-Gg: AfdE7cm1tIUj3iXiglnv1iRIBjm/3DU2LybeuD8BA2BeaXFP7IVIcw6cDGahisy6ZqH
	mTOXAMah5LaD08taU1mV4VtUyFKnrQL9Ckb7GNUPibUl3k09/+QPQJK522S3l3P6Ev6shSxVrDm
	7ZwyQ4b3Hg7iFJ+Odw40r55zzh6jhSxHBv3cclE+Ms60jq0zqjklBiFtV9A0D7dh2lmSggqGAur
	6FVhE3hfDJdjCNF54xpyZzde+G2dcSkVtKel/62gpVe0vc5EyGgfEPVFHVTl+qPEahLbPwPtJSZ
	6VH4CGp3mxGjIjHdwr/xyvRhCMSOdvrAMb/e4NMMlhxJ4nWunFqGQ8ZNMW+MncozYRvJajcgO4Y
	pQ+Zqz+z2QSc4OPbQOKJE3JOrd0zXtTFB9jETDh7sw60=
X-Received: by 2002:a17:90b:4986:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-380baa6b3b8mr9269663a91.16.1783069319311;
        Fri, 03 Jul 2026 02:01:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4986:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-380baa6b3b8mr9269581a91.16.1783069318454;
        Fri, 03 Jul 2026 02:01:58 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815d3e7sm631015a91.14.2026.07.03.02.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:01:57 -0700 (PDT)
Message-ID: <bb8f2283-93b6-4ea7-ada0-875778c89b3a@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:31:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
 <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX1Pz4BrlMNrCV
 UEKcHuUHN1mELObB5/Kk1BEGVnDPgrPOVO7pxdKPIhl796qwKRJzfV6yGVxFkE26EOdRCA16CAx
 DcEcDRKARGGlWaiZ47l/DjVeMDLvUBKOYIfjEHYdQyCnCkvGCt5t9AOQVelBWdkpK65rAn1v07X
 K/4IABJfeuJQiUa9PQxhV56nxfkHctYBHnGnB/HRHHRsBn0PfmyKVirGJRC/1Dqu2kMXtEhMOMt
 AwESXcyz7sqUDZF+W9SWDYnH6X+UtM1DGcHEFLwXURBsqKKLP9SZRQLLrk9DnoRqWwiN33j331v
 BzB2E4iZCFafs6Zjcbkczc4xTDmgW2J8GNdSNAHh13djESN5kVfZWfrtAAQuXinCIuPPK6tzjzH
 bln5tIACAr8rC3FPQ1iX+u4lyZF2daBz7WqII7Q6jD5jjsaBqRgUUqOsmX37pBIFFsVJqrom26F
 /II3CLnSeBDoEyPc7bQ==
X-Proofpoint-GUID: hS9nOjfmmd3yozQpeL-Irlv89BOpl--T
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a477a88 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=jbDwVWhXRwVoBmlK3UIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hS9nOjfmmd3yozQpeL-Irlv89BOpl--T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX/YkzawnXXWK6
 q6GcNIVZ0uj0PzhyiWnl0OFVoHu6annpV8jK7C0SUkDvrjRiKFO0jZ4HSijv9JaDUgGPjBsoYkb
 P8CtffWkjSCm24VJ7hNWB9KuMriUCEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030085



On 03-07-2026 14:27, Konrad Dybcio wrote:
> On 7/3/26 10:38 AM, Kuldeep Singh wrote:
>> On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
>>> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>>>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>>>> `iommus` maxItems constraint.
>>>>
>>>> Fix below error:
>>>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
>>>
>>> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
>>> which do not exist.
>>
>> Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
>> describes and hence, updated bindings before to accustom this which also
>> helps in avoiding rob's dt-schema bot error.
> 
> Krzysztof is saying that the error doesn't exist in the tree (because
> the offending DTS hunk is not merged), so you shouldn't claim this fixes
> an error, rather that Shikra simply needs it

In previous patchset, krzysztof ask was to add error in commit log and
hence updated that.
Maybe some misunderstanding!

I get the point, in that case I should simply say below and drop errors
in commit message.
"Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
`iommus` maxItems constraint."

Hope this is fine.

-- 
Regards
Kuldeep

