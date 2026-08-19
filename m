Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504035CB8C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118642; cv=none; b=RUeg2yZPSj8VQqneZFKywjL5l+cOPZ0eW6IDdSaDMWt7g3tjdUBX+M7pany/0emcj+eIk6297b4kxxVvsNCkU6k0EQL8neidia5KYR73e6JU6uW5xfUAhjK+yO7FXvyiX6zZKqkg0mOG06QlCgTv7YWGrBzQQSj7XgnP8+6Wy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118642; c=relaxed/simple;
	bh=xK2xnyL4tQOVvhFVzniMKoWSg953n0t3NPhq5b+kXGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8Skaa12YkCtVtFoqvZP/ucTsY7NGWRJvNkaDq7MaFPEi88ZJI0cp9oOVvrslxU2pfHt6kzDaT+EVqoL4iapGVWVKcOKs2/ZgDLFk6Q59N9Vk6QovFj0U1jf/z1uhfBXxllluXiQ5yB1ZjYkjv0H3qnNw33+tZu47M2SqtPOKsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f20frE+6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPV11zZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f20frE+6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPV11zZz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IErR2285379
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=; b=f20frE+6MU7IX+wq
	VQ6CLo/LnMV0VMUW2R6mMpvVCfubgMLSnkVLIonFYPxBaoFG3Xqy6baxIae8F5mr
	yBdtIIi4kk0UTQPTfTe/+ESudp5UiTy88E20qKGwfUfNfCrEX/+tq4xyStLLZjKk
	2O0J7QXzezGdCeWmeujNLq8yzAYUH0cHawjKPdkQgiDDkBJPteeHSakGPNQccT5V
	KqYdNlTCv3r9HWsfVL57asycLe1SIN1lVBYM9NGXr2qKsLVthdBUScLkyNwD1HWT
	2p5CfR7hEHdtqW0xlGWyczFmzM9tsRs8F3pN5MMsn2KifW4DAwpBVqSZl5vA8rby
	c/IvTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9hpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:50:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1187600a91.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787118638; x=1787723438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=;
        b=iPV11zZzxQGRZ8Ij/+yJUqh1IkTA2EGLblW0bDIFq9Fn4GqPnuhQjYRPksT1k38sDx
         00cn0qYv0ChE8JmGg8nLPX91bj668KVwz7Op1EwCa9mNLUsYgaFNLzaLBl8kZQHu2Aw7
         pN0bh6QzgIJP/SmQIQYpyfmRAieXC2uyyW7Bed9BQKfmg2d/e9DSf411/CGNbTekL/0q
         /JcAe8oD/TJPwiVGyylhKcWi8+wySmrjV5JRjcxFvB2zqoipUWCivbM6CrAZcQUoGgVX
         t+1IN5Ut1AASNkHUikmYYBZDkHDZN7oBkVQisTB2T62Fo3eLxF2f2xUabCriWzQHHa4G
         oxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118638; x=1787723438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=;
        b=XCHIiFeZeklOrf6K1P+cGetQnqVSHSGYPSw6+8GLRcJI65emr2TjZ3q+Sy++RRLQxH
         zMDQu05M5Tysdu3qZ7BG+a7hVpVlUakFUa+yYdRHzkx1Yc2oDIPtFt2UsNRLMF1ODGLy
         sqIL8MuiKO38w/3Bc9UlGX9E2cwpUNGva9HLOIEDvzUCQIsfk5uagCpRr1M/LPqIxdi+
         UlCxVLp/xNLRqMUxHi6L6JY0AxLxQHyHlnz1OE+LJXABF+vmsqP229NxAGCTfUzi/5qm
         FKuSoTutRe/qrAR/6t+dISt98A+/3PzlGrVYtIm5Do6MAddxSBzMqG9d9Jvy/8mfHFx1
         FOsA==
X-Forwarded-Encrypted: i=1; AHgh+RqTfS+WdehIcqgIBKQr582GN/F8bx+pRdz/tTf8S1egYMEuWgDxVHPKQKDFHsae191Zvmrf3biQ4tkp@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNKM+XiK8qzzBLbrphFbpwSc4FjW2QB3BXFe9Ix8D6SCI/ox3
	ooeRzdrNLckBIc/CgtxLToyzOi+MniDruY5Hk0RZMzfliS8c/QDHM40JFz3HgUJ/AJyWOJEQsEC
	7rnO1B2WLorp2I+dFoNI9sNMkM40TKi9iMQRIGiHXyeKY0OsxCTjt+4jwwqBfme7W
X-Gm-Gg: AR+sD13gKdm8VSjOn6qRC06NBI0V8uoc3UA5yyogn1x6vXylfFP9E7/URcrNGR9+ZUc
	zqxmdhanOyem+KZ7Z1IxjAIN/ombpmcf20uzkH1DxwdPTgUPhf3hWVDXDYmoXL1dtp3VNhaUDUb
	ReM2+c1dN8g02swCzZrzbvICazATo0AUFiRQcCU6pjbxDy9s9WHpN4zkGJFnkksK6PhkjKRB1D5
	iNj0AyLFfRjg/hi5Bz0WLU8pEfbcL412S2yws/RN73kZ0jtGPkPzd1WxANXhUsjoc7L0x+XrsRf
	UN4hjEPIq1ln4oQnbmoTPrsCZ9XPCSo7fIVzETomRnQfAYYuKHZFrqh42M9Lk2K6cCu1V0HoKyB
	avMhXHwyY6Ry+ycwLDej6/bkhGX3gCBNQKBTSDQTk87husCAxatOSUo/7h+/oBduWJFUDWoI=
X-Received: by 2002:a17:90b:510b:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39580ed9f55mr4454780a91.2.1787118637941;
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39580ed9f55mr4454704a91.2.1787118637537;
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm1251541a91.4.2026.08.18.22.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
Message-ID: <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:50:33 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85442f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gGspQyDpFobIHN80kfYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfXwnX6IkE56aj9
 9/KgN9z8/ad3RhuZQnlz5ZdssqBS9Ua62visLzTYwA3H1VNUUS/mB4//xDJGyP7QvQc3Gv7XNo9
 Lc+cqDxdzdlYcPb2n2maeiZhNFM/tQEBbYEsQeMYnECsZI42zau8WEwenOG3io+xBxc0nsybCaF
 pW9P2BMeCEtWSXT4WzeeCMwBcLYmyHD2PTiexbguQ+3Ssevmv0zRaOzlGMVJefwBulmwNaFTwm9
 ATA8TXzywBOYZbaQ7v6E1D6+hbIEy5HyAx61KVEemnXSoz/wwBAOoQOKsRXzEtb4fwuFzrDURu9
 I8dK9Sr7KZKR6fFfYeLHC7TClCd1IY2g/r29bQn1uHjUcnoFdrsiHCHgGnClTzBsdJ7BsNVP/9o
 dcgMEmm8Bkrp/YFzG2vwFQbYPfsSgr9lvFHg9niv19GwaEhWPhsRghCbXXiYAMl0KOboZ8ZCcTw
 zaBxjRgBCooPn3nKdng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX1mEK9h7iY24D
 R6EBjHNqr53LSRS1DFPcALWtJ3/wneJDOIOEzS2m0zAnUZUVdECNQINBjiC2TX3FjtVtH3lCjhw
 xY+ChdrTYFAfonz9iTELtr1bv/KyvyI=
X-Proofpoint-GUID: zQ5GIamiv7t90WhEp0Y-CBPtiG0zwiym
X-Proofpoint-ORIG-GUID: zQ5GIamiv7t90WhEp0Y-CBPtiG0zwiym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041



On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

your SOB is missing

Thanks,
Jingyi

>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862..00d9a493fe76 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -175,6 +175,9 @@ properties:
>                 - qcom,kaanapali-qrd
>             - const: qcom,kaanapali
>   
> +      - items:
> +          - const: qcom,maili
> +
>         - items:
>             - enum:
>                 - qcom,mahua-crd

