Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17262384237
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757410; cv=none; b=SHmEBFmnRoyEWPq5HZEuir9hOSIhQEb0p9ud0VTPe3h2A4xnopEOjahQ3BNTIR3tDlPqocpixVHuTnGNaDym+2TCT6X6Qzfe8DiMYqoiond10H7PjFp05RZx3ToK2RWiuNk5iN6bwOh0VPJCcItuU4gf5KxSSE21RbrU7sA5hfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757410; c=relaxed/simple;
	bh=MMSawpn3Giyo2ZkRVVzNqV1zerLp7+QOFPFRA8MFXjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr68A2OJTyTarjL2n/ksKhE5WCD+FgiFcEbVwmvigGXGUR3YJidEfcofpf/t8rJZJDWRz3n4CaVwA3QOKxctDZ9b+/KXRMLqkC4Tq3/fCYvrwg4H09zYzt6Tvp6edyN7rwrf1djbGYKuncYR6rU1zFS68dNX5N8WrZiwyJzYg6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nssmuxua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gibOWwPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nssmuxua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gibOWwPG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1h7k22755700
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZerX/6IY8zgoCVrD9F6KFOIt
	ZCLdJApcpwQ0Rjf8lA0=; b=NssmuxuaMiwi+pyI9Bzl0uvZYEX9PbDcU9Jc8ZLF
	C0BlwotYShmyUon96TwOkdEHZ6Zcy9z2CbXZJG/RkoT04cnfqUvQUzCT0l0fsF5+
	TWa46aLzuhLOTVZP1ijA/zUNJ1IYcaSzxUxlUx/3Fw3YvB995X4qLup0tdXTCc3I
	dfpYvioUtj5BEIPp19nVbvdcPuTlS6XECTMp8nVNFrY6sEBN4vy/qwWfmBAua8ND
	u5TOCdzbC5NeAwQ3f7KbbLvRj0+Www1s2fCKVS4C6g2wWoeun4jtDTIQSDOxslyz
	SIDydKNDNKYDRgf7SJvuIfApRSowAdw9B3VfuYcpYT+laQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xmce1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:43:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so5322154eec.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757408; x=1777362208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZerX/6IY8zgoCVrD9F6KFOItZCLdJApcpwQ0Rjf8lA0=;
        b=gibOWwPGDZrPWhl7ocQKk0lV33bhsl44ST2OnF6kUgtmZu/PfzUxezDRiK644YIoXq
         +rk7PpO1WSsv4dWIH4Bj9orgEW/reE1uOtiNVMdpqIwRYLasbuV+U8KWV6D2vwI43rLd
         59znzCgLtS/Qcvl/ScYX+H11sc8swTsnwBodynNAVUT6tJGq1qmQETj/B3fsBlucmxUg
         CN7ZeNEdqYRHbUdcIY88KBCnNbI3VMhVGykv6m2njSXqJcE9tSXGTDnDxFBXhg5LBCEx
         jnAftgcq2420/EXNgXReD2kmkI5Ll9yG7subf8e3OmkXQRdhtm5yBWwdNYBjQVTZHLwn
         AReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757408; x=1777362208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZerX/6IY8zgoCVrD9F6KFOItZCLdJApcpwQ0Rjf8lA0=;
        b=rxPAWfPL5cFc46KvzyD96rHky2WmUJmRXhsqd/zFVhp7ZyhAHGShmunRfvQoXvqqPW
         Xj0TXEpGC7BVDdzcXsqQTlTxpwtkIdTf1TSb2qQFePFopetxy/e2xF/RgPcvIjU+Njcp
         r6BOz2YHhB3tLcYzjsi1W9B9Vl+wyzGFt3ap3j3VN1g0CTyoPwMe96ILr6qsaZg2hMFU
         kKLC3HmNkI2O83yhnh9TxoZjnu/bzXuRacz6854EzXDb+pmu7O1WsT+Wy01M8OM222tp
         PJT7S6qkyYwT3SdeBRvB7IO+9kLYOWpMOfFx0ycWu0YW6TIX3FunVj3m9OaLRhGUq6jR
         i4Tg==
X-Forwarded-Encrypted: i=1; AFNElJ8kD7cXOMDIgKFwN4+vfH8YdFC0jjAoYhrPI3NE3SbSjIRmjv2xwB9XApvhRN+JniLjdgdJ4YpR6pTz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+bUPIXA4qCvAi0EgZbJ7uWLtR+bFGZdA5dX0iFYrLd0lr4wP
	aJ1P8sQ8V1p4v/t7S/NsJ7ztnH9kxtznuZQvEAhTyZ7AOVbBmNwZoqz/gmiXumUBfX9aNYgr7gt
	lQgWVJQk3QWWWOk7ICoLAOepRGnIsIUPT8rEcMAwqxmNuxwv5kFA5Mt90SgEoC9ye
X-Gm-Gg: AeBDiesOaaPYtjtpQV2FaStjL88XsBLpauaQx7uRPCjYV9LTIeBXnxld4Bao9KDCFf/
	d1KBg7lF6lX8/LUq6WnFzwkQ+89/3B38JsN5MB5OhFfwtO/HejL5t/rELNSiOuzrDWhto5qUkBY
	8A/tRV2nUJR4zEs1KwVhVf6f7nRJ3oqkLc6TF2nxUWqXEGTiyEufzLo8gXbzNSvkcrJW6V8djzS
	9vawetZhCljMxhVIil9Qr9AEzrpdZnT8OSTHZelCtRRSgYOP+0Aq5NQy2D8poLiPojNUVGyNqLA
	Plt39kdHsbF7AGzs0w5reLqj8qbNcG9xwPrQ3ll0Bj0V3pwzk3Vo2M/tuttP+8H1mCwRphcT5yQ
	+P0jDmTGXbMl2iDOhGPwhd8MEdKI/jMccmEeEe7/V3RBKgOzwXueidELIaisGN6oFG4Dm2pSgVx
	o=
X-Received: by 2002:a05:7022:ec13:b0:12a:7181:2f1a with SMTP id a92af1059eb24-12c73f64470mr8467114c88.5.1776757407622;
        Tue, 21 Apr 2026 00:43:27 -0700 (PDT)
X-Received: by 2002:a05:7022:ec13:b0:12a:7181:2f1a with SMTP id a92af1059eb24-12c73f64470mr8467101c88.5.1776757407026;
        Tue, 21 Apr 2026 00:43:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm16702310c88.0.2026.04.21.00.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:43:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:43:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <aecqmPP1J-otyDUz@QCOM-aGQu4IUr3Y>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
 <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
 <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>
 <778475e2-0baf-4623-b927-83bddb0c92bf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778475e2-0baf-4623-b927-83bddb0c92bf@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NCBTYWx0ZWRfX/HvdBWdL6Qnv
 T0RCoIMiFvKKEcVIEpXiwmF1hJDLfVs4SAAK36byo5xN3l44omtFP4+7SISNERJCMZo3lNdzISQ
 76gZxPwk8ge41Pb0mf4oGj70o36fuc9Wbh+iTKz4VQub35FPTHCzmY8GgPK+fwq99pykDqO8F2P
 mgjwBz8ICoEB5AryE1NWTBxMXLAOtfHAaXT8di9W/KvWmtR3nup/9uxU1x2Tu+el2DYwW7ccdNt
 VETjErqCimO226/IDtD5CNwh4yPBNhaSpbHkGNLY75kad3vDvBheqKLD+HNK+5a7lM8loDhsgxW
 9h8jBzy+gnA396TZrozO8anL259acKJeSdBx7bj893pSBHm1Vr3wjThtbphzWfQZOhA4wnX4LV6
 5+wOOrSGXOzEa8cud3FI5TFGSCusGif/48oxNCmwennvnMqFo0lIR0nc5HGPT46ExBWrqQ974u9
 J3vNBrdUSVWZBc7TNlA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e72aa0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZ2qk-wzGHh3XmuBoPsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: o920O2qbjFLA-0wxmjPDXqLqUT_Pi9_c
X-Proofpoint-GUID: o920O2qbjFLA-0wxmjPDXqLqUT_Pi9_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210074

On Mon, Apr 20, 2026 at 10:24:24AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:18, Konrad Dybcio wrote:
> > On 4/20/26 10:16 AM, Manivannan Sadhasivam wrote:
> >> On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> >>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>>
> >>> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> >>> with a fallback on qcom,ipcc.
> >>>
> >>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> index f5c584cf2146..0a86230a2b18 100644
> >>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> @@ -28,6 +28,7 @@ properties:
> >>>            - qcom,glymur-ipcc
> >>>            - qcom,kaanapali-ipcc
> >>>            - qcom,milos-ipcc
> >>> +          - qcom,nord-ipcc
> >>
> >> What is the difference between this and the existing 'sa8775p' compatible? Are
> >> they both representing the same SoC series?
> > 
> > Nord is a gen newer
> 
> This should be explained somewhere, e.g. in board/soc bindings or SoC ID
> bindings. None of these are posted, so most of the patches being posted
> could receive that comment - what is the difference and why commit msg
> explains nothing.

Indeed! I should have posted SoC ID change [1] first to introduce Nord
SoC.

Shawn

[1] https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/
