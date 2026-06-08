Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1A2E5429
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935522; cv=none; b=VnEmmdqzMrXdnuXDpLB+y7pDJM9ipG44V6yiocIVUGXkQU6wIY4BARVszV6Q2lIwa6FfqMfYpHpe+9jfDc1UbE9Wh4JdmGDpNIFKf6LWmLAV/YKLO77Ye4X7+S7arkNKhVRciYI5rJWijyHwWSi+L1GxGvHcC5YdMYkKc/toEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935522; c=relaxed/simple;
	bh=e8pZf8plrZyej9TnlAyDOk5VBoL31Gl/oUv8+6Ry5A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaSn9dRcyuI5C09hsArXSqT8bAISxHs3s8LQ/2BYVxQfO96w7Uyp5mDhvjlJqDU347nRBEZVYhRXdLcCNF96dQtoN2vmwjG8gfn82+9B8miC7i6EKRHESh3aEfJqvcrSRVCFXUM9JkE4GwtKskLpdLlOr4XMEsSk7cTaFm07SeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDYXo+nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AucteB65; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDYXo+nd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AucteB65"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFQdl3596096
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 16:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=; b=hDYXo+ndaCgs7v2x
	6w/SG6Cpd9D0RozsU4fQBBkpBclLm50JjDibbtZyh6WMRQLukT/Iif5eQZj4raCu
	kSghrhSOnK6q6x4a2X/GTf9AuyEfrhy5cqpW05s6Zm3YKT4ihKRaRJ/UQCr9wIJw
	e3n3VF+2do8u22f5Rz3SGpFIT5ujuTp/g1j8nrSQz7zrRA/DmDnUm5JEI2dlNJIR
	Q9Fff856ERovsvuSlrT75kh8K/i9vPbdQDirKCEVJfMU++bNeAKVXuG2smhD+sH7
	aj9+Jtx0YIPP0db3xCqwKwCR1dmviZNR0JT/zoMuf3wrLQcbgs7+J6FJIKtOGQpU
	jt+rRg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9gsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 16:18:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842208d5b0eso3163362b3a.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935520; x=1781540320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=AucteB65OFN/h7aWf+U8wFb9nENv6pvkNx9D3lvQ0777CBK/csyT1FWVR1moyyRpT7
         +4Mv3QYov4DZAmZ1vb60vILIUVXeR5H0knZwc1hOZc7Kza5CxGJbPPLR/X4rfL42lt4m
         sbQVSO/ELeCanJ1o9PBJtBjDCn4bkvRRdsYzw8RAn1JaLu5O3gvtZIT3kINuflwlM/cl
         TqZygBhKUd6Bi0hyYRjzSVOLLkAI1gcHMrNHkwuwsqCADB33372cgRZW2zbfssbQMLDf
         b5OU+lVLAIPdzNB0Z9xomun0AFiu1JrjTG/Mzyg59qwur01ZUIGJJuHTeiFw5XkAXqMa
         XPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935520; x=1781540320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wN82TcQ6qVxJTHgTvwxJ3Z+eIR2T6ucnR+HY21rEwRY=;
        b=gRVA28vcPVp9v584A+xzuvBCM97CfMr28rIUB3SPG3FwAgXgxbqmzj+Ifdh+fixAm2
         sNVHNOyIVf8MtAXaxKG8blrgUIS31/jMbM+FsKZe9lPF6xcMcF+WVTFEEgppuDPdLc5T
         cv/+BuFba/zMZ6cmdluMTdnxwzO2ANqIcl+PF3qgH2Yl+4PnUExb1qvVJoZQjtk/wVhY
         lBaWZJL8jsMw0olfuAB6+m1VMBURDGbtoPP5h9ygb3mxputQHYSAkmeXJ7VnapzBY2Lv
         YxTVwZ7uhY2WZD7XesbLn7GkNHYiqgxKgPvfbQbI1OovpH5h6nU6/ZWl7QLsCVxPIR6e
         jn0A==
X-Forwarded-Encrypted: i=1; AFNElJ9SEU0hrU5LXi2eT+0xqpV135Iw/ovMWXn4qH064ra1KJv1UdTNGeaLK7kM4dEbbdUJ+MvR0F1pRw9I@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcvlFRuBn8NBfhMrpAOzO7i40XGEeV0VUgFLY+qgkck9rJbxv
	QltUCsFMJ8bRFGQT+5jYYInSTkZaTudkB4Boxf8J+xeyxS5+WaUggHJ+sAQP96usXatUiF/vkdi
	6aC5VGlJd6+eQu0CNEdd403QQJYkiDSA+uGFtnL5jpOXErvNaLu5jea12VNNttPQI
X-Gm-Gg: Acq92OEwGvyuctA0kfO5ak+gq740KHnF0wHAzI1H2LTfVTpfwP0qJ2OhNqV2h0K8ybB
	N/d48sFRFE5L9RegXTuiQvIfn8NjfSi8YLDdXjmwmPFihu23fQ0abON8oSRxtLXe2JTC8LpYl98
	hrYlrro+rijQcX5AsY/iwX6TZpTpMn3q0Gurge0q57nxICbvQbYhJixA+rO+cgYXSagGcy0UAeF
	3i+KMvDCabbDOJfwuW2moj0RyJeL06NlF7+1Il5xhNIAypgU+pdf05wFabw4lbBPweAdg5pwa4K
	y6+WbeBr/fBDDzBZobSg8ZP+9I41sS+g1kiGrLL3VVG9+BQCYvs9TGmQiR9SuI6DQc6G0arEmvM
	aUhkJ5wWUyRwKOnWzqQqb1ikg9g0eDlcs0dl749wZOpUs5WuRPnASWZt0BQJI1ZV0
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141986b3a.46.1780935519945;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-842b1102db0mr16141951b3a.46.1780935519489;
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.240.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm18865716b3a.51.2026.06.08.09.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 09:18:39 -0700 (PDT)
Message-ID: <d046aa40-3dd7-4fbc-b99a-be8076ef46f9@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:48:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ktnsxH1t3RWhdAwvU2RSyqZ4z-ol9f6R
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26eb60 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=dTFYtdXiv3wnlml4cWrohQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ktnsxH1t3RWhdAwvU2RSyqZ4z-ol9f6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX7YzXHJKWyTGM
 pqpjkylLs9DdxGOfy7DyExx9HiQdsLkWLxo3oD6wtsnOlI9XLV58cD6HvKU4Re+Rry3c+4fgP0u
 MWpCC4L7y9+4yPfBaICA7er/WXHdNlvNLaPQPe1j8RuGCoyFX44rQsn1+/eDWs5EVN+M0R4OkN7
 l2nGDkqzeqdBrUTdGT4+gPA8qGMM9Dn+3aJ9FK716JzrK61TdAppon/IiQdgkCBd6ZYD0V5aaJl
 nbIhq6Qc2iZbdDIwsJ6q8qLj3nn+Ek+RcV1xR3hqor4yXkgWP55yTI2NwPHmaKwEzlnzgc3Wbtr
 oZw8KqgWfTloQVFYwU1KxUR2q49F1inO3uPh/nb03+CKIdc+dKe6vQZeBsnQt3jRadjNrqn905p
 jCgwzHVeOPJ5KjnE1dPShte1X9tARO4pchy4dcwkxWXh6uhxhKO+Ao2I9JFbTIEfnYSwANOmplg
 TSIvJjgXndNij83uppg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080155



On 6/8/2026 5:51 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com> 

