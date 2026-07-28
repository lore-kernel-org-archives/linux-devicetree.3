Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FEF42DFEC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240180; cv=none; b=Lq6VW4fYHv7r4WDsgqDVQdlvi8R9y7Sb1Cdg/Qk4tHhK1GMM3aFcBoTxOTzxE2Gt2f39+9WIC+A+yFH4nHGlKjDky0ydN+3DVfvwqnvQOg+lk9Z5CePNlsp2gT/mgnJxNcAzy+zdGLp3WLkm2qAfb0HkwT8GRcDSQBDea6ETR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240180; c=relaxed/simple;
	bh=nUyz00awLRGhrVunRlQ29wlNX6AGiLgybArIIn6clCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z11hO9zw/DaJB3XXyJ1v4CAUhIjE5C+3Xz/eHu3FsM8pXqhugTiM+CI4+KARhJmBQ52NuqtRaIvAQtN/oKSMcpMazg6b6g6mMIXHaVLe/IQp9SYLp9HHSsXk+Q3PYrqVWoooLaPQdZXtvJRN/GpdaeI/zOTS0SrF3BACrnL/OR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHEUrjFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXwgt6x2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHEUrjFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXwgt6x2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHF8Y2940221
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=; b=HHEUrjFxJQUSajza
	isCApsQWvwlHnXqtzcEl/VGL0fzf8p9h8p/kj9vNEO2orl5DrytzzWHbLgeVTin+
	vT/xIzT/lIEedjL4DwTeDYgyKpMgNrU17XZ7euAKJ5C2WhDP6lxmcRtmpTHtZ03q
	MmMDliHZNJngvUd2ZSS+YAmKZve+fpkrfoeDvamtWlliNl8Z+6jV4qVjR/hW05Gr
	YY7z/dlSDdZSfzDNGFvjYsZCXfGE/idfv6BYviMdcgYvnTw2EpxUDl7K0q0k/vbP
	adg8hCXXfuNk3SgaSrG5wFjZc3er7C9z1as1akEpCGNng26IyW4cPpGluPb9urgo
	YjcIhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11v2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:02:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so34881375ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240178; x=1785844978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=;
        b=KXwgt6x2v0v1AYm1QX+B6FzcsL73DuJxkytE7EBmbeXmdgFgAdPF+y/0Hr4q1XacrQ
         HGXEkfUIeFXEiZ869H0D66t6D3Wdp4FiYRmZYoSNdgRM2BDOgIjEX+hiQVSvaxWUwjoz
         M+3IbzJ0GjOezLmVipXQ/xDmRWvhKl71XlAyMpSx5RkluJwcbVJAnddpK3IiVT0wyB4V
         com9DhU3644FgktetIQrM1ZOeBeMp2n1KSNA4t2wB1EgyMVRzwUNGP4Wzc8pPTHkEFZ3
         dgr8imGHWNYGmCcBFW/neID7NoXFLijLU7aVwf175viZzHAe0idZ1mofONp3Je9U4hIS
         hrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240178; x=1785844978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBmtCwPzeopBDjzlubUcQYKBGcpC+oOoizUjQr1Zgjo=;
        b=Wf1Oni+mRpSdEaokpS9F8FtLpP76sst9hBqk2LHQvb3QbaOBvkel6zOWL+uqGDqPOw
         BKgOhTyAk8BMcbCFFmSbnG9+1faMIaHDRxjAIjW867eVHQPhCUwX4T91JK7ltAAQ50xU
         U5dGn1pW2BKO6tshp/ttTJkSJoGKmZtOb8fRWqdYGSOm2Bx4FJFNPKmLf9Nr+rnHf3Na
         WBBtTsDUPUbs8v9cQvbTSaa3pkzdZN1sjs6t6Zdk8wLImBNJIGCSZVQYH2HYiR25O1Hg
         /Svb0TXYoiSy7Iwhjt0ROPY8D6ZKULCEbJP9/eEK2obVQNJUUf37o6vy2Jqr1H+/093L
         Faug==
X-Forwarded-Encrypted: i=1; AHgh+RpM/EjyaH5Pyo1Fe07cScYy2e4GagLcz0PfAFkE8JCJA03oGzzCqJcCtjeaLt6GYI4SdlK9UswAlAN8@vger.kernel.org
X-Gm-Message-State: AOJu0YymU6iHYLm0dOwT8XB7SHBNakI75/zkWgihQ9FnU0IgkE9V4kXX
	we8/oDBDHo6ipfs703wxcV6h3/6rEOcWubEFNcMNU+fWVLtlbdpSDFD+t7Lq1J2eqNxZKBfqie9
	GbFSRsxi3xTfmI8v/OqpL9/y71j3WuY6Q+0S4IxuduQq4F9OKcJTfG3eNKP+lf+x3
X-Gm-Gg: AR+sD11v/jbbHviP6Zl2LrM7TaQ+ROexhAiP+7KbBP6GfTy+gZVwT3OHOgbre+XBUuH
	VuxFwf4M8tYOodbEjlKB1CvInI8dpkB4yM/WO043jQf5kDZkcB/nAQBqzxlMTrZlDTLaI0tZErt
	g01/nIW3VE8ZaFG8SSmYgyGFy/QLL7AJEdowFPtCZX+3xoMWQ1tpKT61q/IPZNoUHGOP76Ymomm
	DO/Y5XGK5efNRjE7zf+r9DO/lTtEUiT+TUu7IXOaUwoIP1naWuohvRJvffEz0q9PFqN/W0Qux/A
	EbEVOvsTfcy7i4/VSaoUW5yhK6VoEbv6jgCCF9PN2u+YiRCSr0jRRmIZWoFP1LJ0buMximRg2O8
	TwU//W8c3MDjoq0NwLCedFKmoQ4lv9Eea
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr27172445ad.32.1785240178049;
        Tue, 28 Jul 2026 05:02:58 -0700 (PDT)
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr27167625ad.32.1785240172747;
        Tue, 28 Jul 2026 05:02:52 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5eecf5sm51384495ad.36.2026.07.28.05.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:02:52 -0700 (PDT)
Message-ID: <c99f89c1-fcae-41df-8426-9bdb3e8e9b5e@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:32:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-3-mchunara@oss.qualcomm.com>
 <20260723195417.GA2688724-robh@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260723195417.GA2688724-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LQfhDU9KSKFhjhde0c3fsVwK8o8MgodY
X-Proofpoint-ORIG-GUID: LQfhDU9KSKFhjhde0c3fsVwK8o8MgodY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX+8bmE4JQ7Ymn
 Smxndmlm2aiImLL9X5Fo6m6Ca3O17T1qIGYqkuyQSAFNqpRwPlFe1QHY+tweRblWKx5IYgqjIX3
 iMX/vLrgeHaW28pHd84CsRISDiOF2TcNLvVZAHKqLKGAvlAHtC7WzWHXjIkpYsCxzozd5tWgDad
 r28VkfXbVweH8dfEgcYODnl3ZnsYQpm7mVDKcV6a245GoqXKlShZYOiLASpH6kdLFtaKmmWzYmn
 b+S174vsZhX1yM9XRia+okhxaJRaSHNF05j0fJRBixmVibSBTOT+yZkxW7Vk4tOgdhPlTMLlNYi
 5Enh7yO1oqtFtU17WMjbfQm8o8XhU0mvnN0GH+b/NZtNBQuATOrhZPUE5bXQ+emqCVZqIqz4YZG
 d70PS4Evm3g4jjr14aJmF0EEBEEncV0WrQJR2hNOOcE8c7SJbuvDKICxVIPjT1GVuMY9qOC36i7
 cn9wyZ/onrYz1XKJQAQ==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a689a72 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RJy-eKN6XEuLipikQ6kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX+adsxcHrGLa0
 iksGTEMIxzL+YJNtEpaYMzIgCgOlQwTCbWGuE/YeM0SbvnO0ALEblRhq6C/PevRhpiWwgeA8oqY
 0KjfWH/tbD9wjYKI+Ml74Kyh288JYqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280106



On 7/24/2026 1:24 AM, Rob Herring wrote:
> On Wed, Jul 22, 2026 at 07:53:40PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
>> with existing MSM SDHCI v5.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Missing krzk's ack.
> 
> Rob

I wasn't sure whether to carry over the Acked-by tag since the commit 
message changed, so I left it out and queried on the previous series.

I'll make sure to retain it appropriately in future patches.

@Rob, does this need to be respun to restore the Acked-by tag?

Regards,
Monish
