Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8B3EB7F0
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721200; cv=none; b=Z5TMwZq8rfl1NPNc6CoOQ9YVHbqTwbzjAa8YJRAIKb78wLgN1GRwG1DPKybjXFxTSGbGEA1BOHt4IdjN6DwWzAyZT41xhMq6vh5+sBPCcdhhiC7AXT0AJ8lrQimdjNrtaHkI5J/jtt0kC28VdX8zWk8LuIuD3V/n6uPgGkWLXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721200; c=relaxed/simple;
	bh=3oyxaf5erFOhHykBv6HtmESVGsNR2h4lJpscx6T6+9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjPYx6Vp8hMqg4DWgbib+pCkQKukTDuBUkydb/1YsJf2V1ec6u5TUXkrcu4zs3nMALISeSqVqCb8e1/epMGNVTfFfAzJFvYUHGFeuJ3qvpno1Jl/vIV4cr3vFVcbUCc1yGY26ld+9nhvb0woxg+dbtG2SyrbN9MyWYwD1sUh9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ySc27H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr/2JhcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ySc27H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr/2JhcW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7E0DW2188890
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=; b=G3ySc27HESXrbKXq
	QSZnYe2sQESRHcoY3QZ3NZgE9jFVfzp5ujbLGXFTql1LqzLT6HGGU01t5egh+QAJ
	auFObbnoxJoLb8MvJxOJcdgFY9RIXhD616A5s2wIKYxrRYYpFDok+xxXnOwPkPR7
	SU1hZOSuk4n4hTI/wocZZKCDLOuzvxh5FBU03LC3+dHXlh/6o0li7/5YVg3LFMb8
	ImQJqM/MaSJvxCz/lpuTJ/O056tp9W7rG+MCxlD0g468lfpKdUp8D93wFRr1ocFG
	hEY1Pn9FFw5R8CR9TxTeP47J+ZviIixjLLHe9+/DVF/7A7h3C5zg4qCJBEawlDbt
	FvtFaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tr8fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e8e40a8216so8306916d6.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721194; x=1783325994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=;
        b=Yr/2JhcWYp11Sja7foCojiMqMAH0Q0DhSMc8X8gyLAqq9+qya4JN428nhmaVFoEwxn
         Vb/2qPI8qMY81Q68nuH+K6Xde+BuFUq11DBpWLGeWqXtd/FoFQ59RFXCNqq5sLCLdJTx
         p06y8ZyjPoSp4aOQ08qrT2qXaCZM6xqMFs/eqawIZrekKQlEL58FZwrqq1zkWAlnPA1E
         mMSNDDCFgpX6nZoEsXMNStrIJOblnF7RYmUhVFqn1B6h4b8pEX/LP9Zu3vVqx5L013T0
         r/wNEy8txWJXBzBdrMjdxvi/Jy9MvYfa8aX+/S7WirN5a/y+e6Y9FhZqqO2SsBHvB6X8
         ML0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721194; x=1783325994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=;
        b=px36hoy39vAaZn43TGDzbH5m1z0UeyLBBokfqJF8qGLXvmkKIhpNzoEuYMOMUBnksb
         GgcSCvyKfr8HSDV6LTlWktT6Z7A3eYq3gVK7zYcBiThpIO+RWxwSv1L5QnQNQMO6iNLo
         UaZgTEKnrRkyn9ADFvzIr7vXGPOuc6slX5LP7sGcaLdO6docIxgvRf9mGhHzt5R4/hqd
         5M+VXjg3gOdxf5b0QiNTryUNP9/3dOmL601a+jz2Oq2nq8t4vaEQgDaQKZ/YGxvpsV/L
         kRefxodYGyaNpt9KimGlUE8tOpgnGPFCbSjQT7zbBzqoXXPqfuEk4YWVYJLUbMJsBP8o
         pRDg==
X-Forwarded-Encrypted: i=1; AFNElJ97qimqqTXeBz200DHCivtWUoOPaW+I6P1RyijmcFyMUQA4IT06smSdAKJ2On+g0BvzhD4b936NQiKs@vger.kernel.org
X-Gm-Message-State: AOJu0Yytn0CAFvpKTn8Bo/ArBIcIvnoEZlASIh6oiL+sdyVYCNRuZNBI
	WW4jiA7uH7FWG8yYhLbxYEpCxV4waUb5q7K1O+IQCt+toRcqB9cPNFSA5NHUcZYfsP/FKIUuofp
	9I27a6QYrTTlnDX2Qa0jDATS5GK56jdc3Gdv8CM8yUhb3Ha0Jji0YY4UucSa4CDyW
X-Gm-Gg: AfdE7cnKDgqzNNOtBhv8ls6F3mPHsKcCgiImi9wAOK7INDPS3bqQw5rZYe+EAUTsPtA
	O4GCmqUvcoJKtVN/UAYAxIhp7PN0XH1FjSq69cCtXIvSXJQ9hjYutZJr5KcMlDxGv4GJsNYNkW+
	xab9zB1b4k6va9yE2fUJnXMUZYL8NocU1/UW17O2Cs9gju34Ytuz/dYWlXWtPkjmAjCLTuSC+y2
	YZoxuVvfU+R3N3ZU5fUT6DYxyEPyl1SlMRo3z/Bc8lzi+10Fl79zzLeZUGXWL6SCpoFZBkCu5pF
	ZwYbMCIpVFI2s9dl17oI9owyC3o7gR2sH0NMjp6XgbmFxSnGujVJSOOoufi5KmCLM0WHZzKHPVw
	wjn5tKIgk96dbleXCv/FbJqPs0NqQFGWHiSg=
X-Received: by 2002:a05:622a:1450:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51bf40b343bmr34093431cf.4.1782721194071;
        Mon, 29 Jun 2026 01:19:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1450:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51bf40b343bmr34093301cf.4.1782721193583;
        Mon, 29 Jun 2026 01:19:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1254b1b366sm209386666b.35.2026.06.29.01.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:19:52 -0700 (PDT)
Message-ID: <3bb61c2e-79c6-4f36-a1e3-59c2fdb249cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:19:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for
 Snapdragon SDM 850
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
 <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX9UyH2EoycIVA
 582hfUtwHhhd7dx4dNwCuzNzkhWHXxTT05xk/Ck+aMOfwR2XQSgmN32trpfPS6KnzZ30jG8TNoH
 Szyt51B5vOaGM0XaW51mia0Qw7iLK4DSsMCdXFPc5lrw+MsK5OKyeD0XrIEWBYFKpgTpa6iLf/V
 7kl4uQFmzwxAt1oB9FSELh7to501WNKmFlzk7GhyNm9ZTr3/UYTEGDWES/MWZa/JYVGUZ6CCs9k
 nEoPGsAcaRic/zS+aU03ECIBSeEXyX2pAE4/9mOoHO5tABXor8IAmG6n/CiPVWdrR+mrHP7nHb8
 G76cmIzMxm+W4zxnoPgHWoZZUpSNS2r4rQmy1SlQUvoQ1PynVc+FK8pHbGO9IBeTL/4ZWrP/YXM
 d9XNm9qHTkJ4iJLw4/pwfuP+IaiPjivod48qxGvgDpJpC1x5q5EROa5nMpgLx0szDFuchymUrgM
 yhN79Mh7RExUXLcY2ng==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a422aab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tM2yjQwG1dvND7ghf3QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX5wsQv7cFglV8
 MD92LzaNQw4E6Z2koMNe5bwJKlMJiRtPzj3HavmZSiW5fY0+pabz6qUWk8eqy3UrlQkFzf54VpK
 GRFUSZhkWklczf5GBQTLFnGol2vezs0=
X-Proofpoint-ORIG-GUID: a9ZQCmfp1jjBNevXNB2y2l0QtLjAhoB2
X-Proofpoint-GUID: a9ZQCmfp1jjBNevXNB2y2l0QtLjAhoB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290065

On 6/27/26 7:50 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add SoC ID for Qualcomm Snapdragon SDM850.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
