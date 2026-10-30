Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364641;
	b=oUhWAK5iyER299w8WO0ZE/p9R0rZF6FLUEk+956osgLOzWy8yEeoyWb4+0BRffdnWr4O
	 dS2l7SV9cgTI6SLHPacEJLFSuRp0i52cs6Y6wc1FaUn8pdbj+9Kud6FvEDRs2jj+4DVZ9
	 g8tAIi8jY+z8U+TxJ3tlhG3vuo5PxiY/OYlvYmbAcYz1tl9NgnHhbYyAOP/mNiTKi5aTt
	 J5Z0zb5LF+XRNAxBvy1VQToTkQ8yoxogTtrTv2anfRvja6ESSOv0vLm4X5IlZXQ4HrTzP
	 lkAqH6EMShbBzQCz1kb2ZNaY1lphqoEqeLKJkvIUAw5P0v6GUad2AGlhYCM3y+/r3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364641;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
	b=wyfdPUAylPHflV7FQuWYbQqq0XzqBuIFtClElPPcU6LE1T1VMQTX7dYh9KNstk0NuHH+
	 dZyJ/ghbEOhB+P7+TKBi6QOEZbq/KsTNR8/ELBPyG2wRAbR0bRqcZPTNzRmCsMXpudTLw
	 yIvaDD+ORa1g6zmziQDQYpAkTB1xTo2ueIAdtdAV3uxwXLkGklDiX9zyzwyygOpmTzsuo
	 58i69R9i7A4RAQgV18RzPPXhluGOuVhMXNfbVwbjYXXWZ0vJ8/jcCATGTBA88x6q7V4ZW
	 N/kIfp4ZzSDD496DKOJGiqbgto1d4pnhOV7bJDgSrUS6Lvjy6Fj4CfQlBaM+FARK7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eLH+G/ka";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A360A3818
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E6A360A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+G/ka;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG7Cn2541611
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=; b=eLH+G/kaDo+SOeNd
	hn9g3E3YnLyTcBrKc+V1QnaslwQCspq4tmkE07Ze65JVs8kJO5O/vrkHBULOwj5W
	S2GabPDHjQZjVTT5ENiqVi9Ub1F9czByGjjWhL0gfxdKoke7nyh5eFEoMtP7tuE0
	PEEJ5xKB/3ei6SMxd1aWXRmjl1zv4ix9W8KKQhul3fVWmbv9N++rQN2DlcNtiGT0
	JFtW+jAjXBa945fRvEaumaGi1ZBLUwaJGPYOjs/YH2aTuErzq4Jd7C6h2T1RW5Aj
	QIFw/69ckZYQgg3q1MK1671D1XZuQ82YpTpgs3nmRdF6lPgslF54bMpTWgQxwt+Z
	ZVOMog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk2wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso14274185a.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364639; x=1793969439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=SvWuNamlfmolbeRTXoTaQ1EJc17sdw9nbR2uhdn4l4u0mu/sHL2gTW0F64BMHz0GXB
         C9yRP8RVMzwx5hY6wVbD0RHC1RybgFtXW3djXCmcpqpRir7JLSJ7Jwf3pqK+8i8ir1sE
         EiyZp/tP13U6NEO28duKibfpC8zZpAGroPUxEAB1H6O0AEltoxDsT5PioNCD7Lm3Sk7z
         Qe9RNQML7uadWf9K2uKJ8lq2QyWsI8dKW3aoxJZ/e2IVK6qVQ/+txcMHSYcZ0fRHjjSB
         CeLaDDQygtaCB5E3c9KVUQ61tZtOCIlueE/rBShoC0W3uXNULJdT5ehMfTiKVxaZVe2i
         jOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364639; x=1793969439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=qcJKtIrkIfOGWvZu2YIjIsuJgNnHDRsSucAMN1yQ4bbWHOE29yJbR3f5qVAgfAqyGX
         it636zIu9xCFkv+lrD3Ej0KhK+rTXPKGmO7b+7Q7byIfwgAdLyzWpFdIBhtekoEV9d+Z
         nS3sN8cu1pC/X6f6mMOx2pACRALCen4MrnzAxIOw0XJZZl3vrPp8o2DhBLh7AKw4ZLBR
         7+CKLm1itX/EvyOYrxVYBExUv07AnraL9PzFzysnyzl6LjRKiHs8xuKO2y/+FvAY+iI3
         zfUiJIIgG7k1wIL8SKGcwREPpKBQouBqGnvy4TFeIWOLg4Ou+VASWaEYVOkKbaQ0z3yD
         0/vw==
X-Forwarded-Encrypted: i=1; AKwUvBwGhm1IdvCnJEfyscGSjhEVGV9ot9IrjJk5A2M05MHKxZFivslnxOeCVdIV9ArolrWmO2vgy5OfiiiJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJqzEOIoNrO83By+dA+/pmIYZCZEqbJX/iHblxBUcNOOr54xu4c
	ILlk50jX4xxPwYaSFYTXdxR8qe/NIpEgha57pA0rFfj/qWOVoAjqEoPAkzr+b2GA4Bex67351yS
	yAkD518xaBJbVu0wqhO6hiIQdJDV6oY+sabkSsPd1oLVn21JqXYJnyaYCGfzhAbOk
X-Gm-Gg: AYBFou0ZO8illWowLtRzqDpO5DxlYxRfy/2W/O815CrakjpxLxxKH1ZKIYN8bJ9seg9
	8k01uN2Q7hcjOliTWnKKOyUm8xzM1JOFbLYmIPJauYtxGhrXxPVzGU08CmDxEMYUiQNc+rvy23g
	4F3b+g2JojpBDRzO6AtOx+R83ObNDZtzbqE1W2+3LsWd9B8yfqrPiKIKs0YpLl21NXP6J9VP7DU
	vo3Gk3VWDgFkam8i6yomowMn/UzZx7KmAm1G2bP4s2wKtk7/tmoN5dHOG61sa1rgfkU7u/sd8rV
	4XmcjcQNv+bF+/CQTdp4KFbwN3wzDqjkQuKMN3Brc/ob7V37Ocp5xQQj9w2HnUKZYpLkIlmr1W+
	6We8y3hEk9ZkjmW3KzPZ63T3ea0SRlyC4w3EIqhTK8nUCrAUjwBo/yht9MzHkG4/93QrxiUs=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357019385a.2.1793364639439;
        Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357016285a.2.1793364638962;
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b0esm62382166b.85.2026.10.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Message-ID: <21e77fd0-7e84-4173-a43d-f177be98427b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:36 +0100
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
Subject: Re: [PATCH 1/5] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXwahUSvzQqkGD
 pSE3Ih4yLKbFCm4BINboTRxZ+fxQpaaB5vQewbDx+ePzKOcWZ+c7ics1Ai3zB4co4kDe2a9TRME
 A0mdf6Uxnap81n1w5fB8xr3QTjzFzFIcSM2NO5tWgMVtPKkL6AeidLCVt3msHm+WifBYSFCX7AW
 iY81+NEfSR5j7rGc6hXsq+mwwCRuDo13e43ztuzOdqNk0465WM+fK9lHXtgMEcdCeT50GALgP06
 AFdOmDNSMKdbaEqzbvLOdXuxeHPKYuLWgekVjomtgyd8Y50vn2T6YsXFXgtbXWpX6mBzqrF2t3V
 jn7JpdbkJBS92R0KblJzdfiWRfsoD+3DbjwFuTrU3rm1wloU+Hl207UaDmEY6zQknvjQJOCBRt4
 BqMqKqZmApM1q3Q2RkHKgkSZOcrWav9S8TB65y2+1D5I5bEH0hNJcNtuNfzSBebsHIeQBBoUWof
 nEWzWVxTiuTzd1cnu3w==
X-Proofpoint-GUID: DSLz_okls_FlyzvwFHFTtVFhKEj4Wjcx
X-Proofpoint-ORIG-GUID: DSLz_okls_FlyzvwFHFTtVFhKEj4Wjcx
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae492a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX5rKDNkhgRqNl
 pRyoanpE60riiBHFzHjoLKXcIrk7e1Kk+CpaYM9oDdH0cMCjwBi4ivXMQCEH4TGzMwq5ODlHH+C
 s+enmN3ierSY5P+qK/1Z0L1FhbpT1+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
