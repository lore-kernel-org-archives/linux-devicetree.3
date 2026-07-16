Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D2386C22
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177041; cv=none; b=PUDim/bffg0+UNIzqrQmWugqOFAvMKdgrvyTDMhce7qVE7xlsDZocxbfPpxdAwI+dL/MbkahPgTlh+VP10U3jZirY8ScGaRDYZyKFmzRwDYU0AIktKZKltOPxt0ww6gl4VIhMd9e/aQVrN7z5YAqtHzFBvFJ8bVfTN0cUQ6fssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177041; c=relaxed/simple;
	bh=yZF7fS6IdtumDl7mMVpKhsYZHrNqLn+v57NyMrwim+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCTBN8h8sERcF9w7JG/hOD2ZC5h9BtSS8dID2I4tP0hYrI37x5uO2vQ/l/jpzeHSabuAhyySGKmG/RjXuA+Z12+GKVvV+FyzrMqZsQS3U1Moy6QEdUSaEBBZ/gd8dQduqLgEAqwL9VSt0uXNnzim3oLkXI0dH1VZuLZmQMTkogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz7vTe88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlP957lB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz7vTe88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlP957lB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wIaP1555991
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoKMBy9TzSG/J4w/4r7M6faYyLtSalGnUet23fBcN4U=; b=Iz7vTe88Gex5MZzA
	mG2oPdTN9fVGtHCjtlWg6baxuKkESiinPYeJx2dAGIiFGcx2pwemS3M5RhFgzSXC
	uCvqlPpx6nCg0YqTQz/PfT6L3SSp6LKAtN3ZiCznfLnTR8IlYFPxBiEZr2DjGWKu
	rk6hq4bbz/dJsbBMuI0IQuFG/HZL7DfU/0aBmTcmTv9G9+bwgga1VWjrqgUScf25
	E2wGxVpmX9bImsnPLMalJJqRaqAdLKtVr1JcqTCNzRwX2gY21XNY0miJLtjun2zY
	pR9kUL4NlvHCUVdBV0321LTkGc8SJ5eTPOVk8YZBVWAPFKVMkUHhVcRxM0/rvJUu
	0AKV5Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqj1jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:43:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8895156101so6625761a12.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784177038; x=1784781838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoKMBy9TzSG/J4w/4r7M6faYyLtSalGnUet23fBcN4U=;
        b=IlP957lBdaqj9z0YU7hO+sZyUPtoqNH+/phTIxmR9F+aHtizROaqJ3ERmSRymppL2t
         wQDDoEiehv8jTJ11udS1uWjBcKeXe6pk6v9y6Aq7FPWvZlABhRvutH8jF+diHICRvHzO
         gl8KbU/4tj2A3m12SF/YeISEPQId7FhScZJn2m3T5+11C2/lRxkXxsv36JSgwQA/Hb7x
         fIFTnmVPshir/6sx9/C/iAsYij+uyKcG+NZNp7HotAeXaKMpmVfl70vYdAKX5JTapXIK
         yQf++j4apihcJK/JFvIrIOza6wOjyCoUu9aTa4/ykT00ttEg7ukSIliI9s3AJv5zSm0I
         sgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177038; x=1784781838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoKMBy9TzSG/J4w/4r7M6faYyLtSalGnUet23fBcN4U=;
        b=RZaPhdTjtdDVix2MVh9cBEzZd1RSUn78oTHG7C3xO4qom6SZBfbOp42TDiz5CsWIrD
         gwOp9Va9oL0wab+ELlkT/TEbNEGaezYOREwp2m6fen7jAQF0uI/WTU3HCpXXkkuVvmkT
         48HLriB+MjnPB12RBrS5jSEm5V6Z8XE1jMYh32XqnREZOJ6cZy+fqMsR5ErUPZA2HG88
         EjK3enjT51yXxdnA83HAn5sx5jGYSzHQSbexU08wnjTGnF59IQxPCs0hq9xCu1DrIojN
         GegAn4IHv1gKnU/3LlCFYzAcHVbzymunIi0WQuf1hnBQ/fHi1UjwPo2eUFyZjyuYnDku
         2C4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3T/bgC6Kec1aM4NAOQTCtKxgk2CB3b+AztAD6R2VqDfDmAIEgprUe4Dxqva5Pzg6fmzm1i+RAE7TL@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfvQg4chwLmQxvCavOU9WyCs0v+t+Q0VcW2/QVYTa1XemuNXb
	iHHeANpzesu+8GVp5Ky9Nw181TRFanC8BtQOqH1BC7mIngjPn64Q6HcWvfhfrr9ZXCOlx5VpLob
	fbn8GPeJtIHw61CAcCZiF5AOYcyLOnHNj1vPvEjCSM6zyOGIOeBJY7wqGGi7e5Kgj
X-Gm-Gg: AfdE7cmKDt8fiApRquHDSO76JTwn0TOPNB5+rcx75R/G+kWsh20ZJAXIyAIhc8uz5B3
	z517DrimNbwztYitbGJp0t7nxUY0G8Xly3XEE2e+9AOOyXw6dUJVSHIQu+wu/Z8lyFBIWjfWad/
	C+fdqLH0sTgMzcpTzppt7lkCkQeKJTt/Jj79qJQmnvp5bFFTTMoXouZpBdjKkOKwi5MXQgJQ5rr
	TqKeftzpwIO2F8w4kpAm4zCvzK6YauoPpYgSZ3aLhM/+4r/9V0Pl4y63TRhG8aWJX+d1H4pUXZQ
	f+3r0JjsTxIuMSxHLO/DStpDC+WCnxeoWaVqSPIeO6WESYJiyOn0aNVVarGBmevYQ7+K1Sj1hXO
	W6sKG5Q/k0MpFRLrbwo6Ad4+MaUU=
X-Received: by 2002:a05:6a20:c793:b0:39f:24a5:3065 with SMTP id adf61e73a8af0-3c36c0f8f74mr5871116637.7.1784177038368;
        Wed, 15 Jul 2026 21:43:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:c793:b0:39f:24a5:3065 with SMTP id adf61e73a8af0-3c36c0f8f74mr5871068637.7.1784177037938;
        Wed, 15 Jul 2026 21:43:57 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm10141066c88.11.2026.07.15.21.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:43:57 -0700 (PDT)
Message-ID: <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:13:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58618f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZMvnSdM8bDxOhK0N57MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA0NSBTYWx0ZWRfX6CFeMFO/zy3d
 2lBwbZviiCT/ee1EtKGfhUbZSl68CZ65Oa5ttzhhlQAa0lwQFAOuP2jWeeMntKZ9oN7B41spA/+
 Ylg5DbdgUROvFhoW/6fwLNBnmVPejpA=
X-Proofpoint-ORIG-GUID: TjV2TBvwMGIKTNHjX5CdWfc85YBnRB6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA0NSBTYWx0ZWRfX3bXRRFWxIXiG
 olKeWKj7HtHwKAK8tfFdVRTK0Y8h5w9NFpk/guOKJQFb5MUBkXYSzsZ97gDnswz0+PMgLA/9fS9
 3+TtVCTEwX/Ips9oQBzRJ/P/6KldCTMB+8NCtwPeyl5WIApvQo6eRJ8FoIAbQWD2NV7hpx2gmnJ
 tp8cx6QCngZ0IOad+yiHnhEXB0bgGPXDT5khsiUg4WrVfhD8oNcrfe6ptesI3yq2Xo0D3igmHyE
 XQOVgiq4wyeO3QCPfbRT3CgbAllHsJBErVyPSiGLoou94DIDKwMbzddctbTEXg+B4VpOd0a6pN4
 AJTgdlQmIOinNaUN4hPO0j2IGgIg6DhcG1rCl8ZfBO/sTCqbZEyD5vduYIlQZaBF+OrfnVe+SDn
 cozBMtBqxyRm5OLVgDi0y/aYG84khNFNaiXuEVbDalNA6QPsIrCxSkFiWrkvHXNJCs1T5cSPwFD
 wU5jkFk30OMDenqYgkg==
X-Proofpoint-GUID: TjV2TBvwMGIKTNHjX5CdWfc85YBnRB6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160045



On 7/15/2026 6:59 PM, Abel Vesa wrote:
> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
> domain. Model that parent domain in the GCC binding so the provider can
> describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required,
> matching the hardware description needed by the GCC node.
> 
> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)


Abel, I feel we should add the 'required-opps' as well which will ensure
the clock controllers minimum voltage requirement.

-- 
Thanks,
Taniya Das

