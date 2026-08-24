Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31483DE455
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554321; cv=none; b=Pa25wVcmf/x3fhEYcDNjq/yYnlRdVZvGGCEy/kVELFZRvphAwafTriLoEeFU5msnM5u/pt/5d2K0rnltYLiFfMVHSdwJv2JDjmWHCg7VTTXcAxpAvxoPVwBFDOkZ5Rn6I7I939a3gUswafpkIVgt6ceKE66mIGTMZPAg1WiMMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554321; c=relaxed/simple;
	bh=QJx/x1uJdyeCQtfPDtlL4Fkzic+gvsWeXF0PqNQFmMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vke/znZAXnDJTIt20J7pXPMhHtMY0q70I0QMHvh9voGtRjyQSzpCIbsCdhr6aJVgFq11f2odhovt8NXwgcCZdjikgzer68a9zuI+GIvU2B50j/G8TGrbmH2h1gLSFClDNpxb7e5N2JCMUMtUaBN1Y69TRqbpDwzcbmDgLLSzj8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrYI9+g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FppzSKQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrYI9+g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FppzSKQy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5REw62392169
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=; b=LrYI9+g0TSy4woNd
	sq8gkjvZ2D7F9ytrI5IA6buVXq8//T01uIkKztSfoZ64VJil1T0qc6mNlByqpsbf
	qTBynW5zbsZUAk/atNjMIROIACbCKc+6JWpvBNzYmFZYVqJjIB+jkT5z/cfDOxa+
	FfZh8VpBxEWFI1ISBiUecCdutZC3NpBMGdKny2pq159LaGxZ5oklP8kfVBTlxgmu
	9zgeJjAHp8V5ZrzGAHNRo4tw6gWofqHvDmhpfO90FgQercGR4adjve5EEdT4gVWe
	IkccJ7CGwZG0ZCptLB6ebelu1NEPWafbXNrMmTRIbX9XQDlH+0EV6Tmv9eH1qgoJ
	n0/AVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a5u4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:51:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so7036781cf.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554318; x=1788159118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=;
        b=FppzSKQy8hKADUe0PKHXHqsP8H8tr7uvateYPJAS9Lk8H1w8bn3Q94v8pRoEDofpMu
         5PYMZ+xdSqWrmwtKbjJTQSvY1zgs0ib3STcGOdEki9hnejVBdzq0Ja+41zgPT7XFbIfO
         CMV9tDH/TIxo1B21eE9ex50K1dVdTc84k1qmlJ6HKdwyMJ4Wh4hDcgpqIiEL/hbghQND
         XDqN40pn7QZHanDr2rJt16Kr8h7F5ETUacOCVqNLjt1PyywnT/ToJ59ldI3u2Ya/32Zo
         gd3ZWWefYmhFGG8I/zCXX9RPWO2xDA3K9CbFs0sbfiGYHEGbohNh5Qfkyoe5F/PaNJcq
         rTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554318; x=1788159118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=;
        b=YzRKyUulTKVLIXrEuzXjWzmo1hUulohaLprPLk/eMXgbwDxkUlMr+RHJ52JmtLwqgD
         wGpbDWlhlrzghHjF4MN9jjHUn98ezVTL6d6xZlCbNR7yW4GFh79K/WukLh+pDVnTtxvE
         XBk0Q4/du4InCYxduKpou5XhxM40zrsWRSy2oZpHKfUeS4HNVelgGgUBHd0s1w68Mie6
         inWJ11ryeFTCSt5foG3gNdecjybHbs4sCPZRY3cv5TPUYrI2Jwpxkgqv+fEG3hwvsnWp
         uB9PcbxEmtpZPrjTWWR3Ibz0ya2Go4N/Wp8JrGo9Q6l+cqqYdsdhIxOrjt7dZD47PxPk
         XFGw==
X-Forwarded-Encrypted: i=1; AHgh+RrTP9VMluicwFvXCjwG+bVSPyRP/JAJYSorJmUw4ikheOuCNirsuDtvoE8hNvtHjKmY8LlEo8mWA/Ly@vger.kernel.org
X-Gm-Message-State: AFuF++lvF/BozpfwEYSPsnm7PUW3BMZOYzR5Q9LOuBfLPjO8LkNKhwXa
	ujdnsAK/bJ77kX+9XJX+iPxu/uWWtC4BRWz1tB/RdOiHi0kwJ8o2sfXq7YF6/X269OKhJITO6xc
	Vm+NzhcZDMixfNF1hxhVgknHBdLSrzTswfFX7i6OKYqCKBcq36NdS4T7nlo93dB9OoWAx1rCU
X-Gm-Gg: AR+sD12zl9ccTYu2DdJvvwj8MJwsYbzPdFZq7cX9n/WBXE5nQODHDapHL0FPGFt4F44
	JKVaKHdI0cmN+NIn8we7niAOx5IB118u4H/51SiyU+pyFTYBKK2AA0MGiBFP3Jz12iNjqUu/DlC
	xOWRHuF0OOMjrclg19cKTHr2IdeeWROo78MFjwZgOvrMYRKDVmpO/txwmIAbTlsKWlvPO5qruFk
	HYWeE12xcMevkleTUNDj4P+Kqlcd3CK97hPFTTPiykfbDxLLDO0JHN42J9QRw+HtB6MmtD9AtO7
	Ca6jpAbeBmeZxMzoNH49VtdAxIU3m6zUJbRZK65bJK+xWk4HSweUC4JJTmqb62Shn2Q0bu8SlVL
	eUxojR8zPHoAERChaY1uGgzV7
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr164652641cf.4.1787554317994;
        Sun, 23 Aug 2026 23:51:57 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr164652461cf.4.1787554317580;
        Sun, 23 Aug 2026 23:51:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b161sm1211801366b.11.2026.08.23.23.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:51:56 -0700 (PDT)
Message-ID: <e783bccf-4f0d-453c-961d-0bc8999c4bc2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:51:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <0ebdf8fd-de3f-418c-95d4-17474075bd55@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ebdf8fd-de3f-418c-95d4-17474075bd55@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX6Em9YUu1RGtI
 HZTlecNL2qeLQGUs779urL4Rj1xqplRaMZRcDDTTH0ppY0bLFZuVdKA2Ep8ZKO+FcW6I01o7Nvf
 P9SUm+PBp+bHsLZ22vUUmd5h4QvvQCGtoilDNmf21VpoAB0aVAv8+/SeOEMymPnqv/8PkA+nszn
 dWPc5gAaN3vPdLgIyu/2B0fUbGFeGvCr1thXXYqmNA/RIfIXVIPBz+3ivV8fVMrNjoxMgKEmTb2
 o2y8C5I6K60/16V5riXiXf9OhOEhgqNmtCvAuxMN+C07YX23mqRMDr81VPbDS6UJ+jKRg1OwVPK
 VTxTvtKFfGYVsMaDf4znS30+zp/PwYTRZmG0vSAEMdmRg5BsBc/VkuBtM6J5Uu1W+j8bdL0o5Dr
 NnwCIGzzPAVmjNM3lKRsGQtfwqpXWhuy2ToGWC3Kmc0L0WV7NuWepG7qG1juNNZ6ujyaZCEDKm4
 LwBPjeQ5eAJJbH+o/lg==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a8bea0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hC9g_JFbI4hlY6YCmcwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EzUpRrqALDqRUrDvLMe36qAGa-nR9ENQ
X-Proofpoint-GUID: EzUpRrqALDqRUrDvLMe36qAGa-nR9ENQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX8NAAJo3JHoZt
 jBNLt/uvBALXh7W/UunYwe2iytrz7+NcEtruvA9c7gGOCIwFa1u5PMT+cQfVnmEpWEieaPJ+Rbp
 UVbV5uVnG2D4nqsCPSAw5LHTw+zE0qc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240059

On 8/21/26 8:59 AM, Iranna Mundaganur wrote:
> 
> On 19-08-2026 17:16, Konrad Dybcio wrote:
>> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>
>>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>>> iommus list. These masters are exercised during audio record
>>> use cases where Environmental Acoustic Intelligence (EAI)
>>> models run on the eNPUs.
>> Could you share a bit more details on how we can reproduce t his?
> 
> This use case is not enabled upstream yet, we validate it downstream with the
> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
> access from those masters.

I figured it may need additional changes. It would still be really
useful to know how to reproduce that, even if it's a little involved.

Konrad
