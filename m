Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FF37BE9E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140745; cv=none; b=KuGj+nJ+EkUY4w95Zgm512H1uWOcWaAGy2xwU6ZKq9ZTS3HRXBKqKahzILA9bRMc8CzKeLQAbLXmYR81P35twLLnATMsUew0TgI+NlwuY341oclH/cMPwHNDOWwH+8Ryf9128ieGfaXXtAXCRbornIsDSEwDuGDpUUyucCvAUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140745; c=relaxed/simple;
	bh=x7/AS9iVt+OJOWTPrR8wHUSuCZH3x2iwRo22tfSQynw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYZcRAC/k8+TcK/IQlVUJn/A2cvmsvfYOhLLeqaBFI4uTl4gPWDVoUk2yiY6xys3qmyNhQnTDB7wmZPpoIdGAaFLPykXUA+WiEyT1G3KkZbVfie4njVGNY11OdIwvq2tHIHPVugq9G0bvruox/EYxJ0da0lxBcr9brRn5hDIBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBbF4Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUCku9OW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBbF4Bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUCku9OW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lgLx921322
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=; b=LxBbF4BsrXEgr6mc
	ACjR8P2WGtJ6iwV7mIXyhKF8KFwUlv/ebN2xS69wuSfQuL94270CE4ptIuHln5IN
	mVeIWdcCVOWKkAk1r8w+TFERulU5eSbShg2f9QtOVH2jaLi3j8Wj+jBEd1rIOMra
	HVv1GprGV1LAEbV3RMj2snbeY1fnUckFzmT+7HvUVOFg3ua7VcqWJxkRFOKyQn0+
	s8TaqcJ+3eI47QOQtaN2RyZjPVH39Q5Y5jmquDmuG2S98dlmXZxgafV1tV5ZjMJG
	TT7Ws9r8TBFor22jnF23naCmARA5SjcS17euqkQAyrWLWyFXpJCSsVX6CvpWbZxZ
	zj9Jgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3aymn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so15125171cf.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140742; x=1792745542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=NUCku9OWtYtV+Wjt42wVCJtS1LgfcrJgBbboJq4oojrIiUrqcHN/6KAY3nyAjKcPm7
         H4qM5EID3RbK9kbydv07khThRsW47Nd1TSw+tWnBBoUy2elAVkwsHm1ylvD+dSpwnvIy
         qJTnJbP7gSfI+I7pbcI9IUDET3YK5WR1qBaiB1ntbjr5zigHiy8piA3TlaFXK4Q/pYIe
         kw0lYQuKpV6HYlePRXwCN3ZEXnVT+oPHxcNh5UiHwIjPw8BmFMkF9Qel/XlA+n0KsdcL
         3eeksaAOckHcv2e+Uz7qV8uYxIN8J/WZegnEO8wFSA6K31V3bZ28N4JPMrVexfBMZj/E
         nhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140742; x=1792745542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=PH7DsQ2NDH2i+v+MfyZDrOBudyRAlKAznpieO/0h88dNkGwdiD2dmda+EHehEiDlzf
         PkTIdHliWLMF7uH8Wv2yqnaiJXAvWw+zbLPJzvxlGEvfuRpFrdqg6fxhV+3fKWum0YkO
         nCOFoSg7nObdnPapgtH9rczNOrn4Be7zalJwQIu+dYgDeClZ191kWa4KB3GG3LQ71yql
         SyHGdk0CwnsytEIcJs9CBZznt4ojCEqZ0KHpkXBY8P6/tzFTnG9VVRfNmaVw6ewtHgcP
         Ys035JUdceq84Cm7E8/jUvwXctpr/u8H7p41upMqcpDTLEoQ9PTvjbeCq5kYJtBJ0FLL
         NwMQ==
X-Forwarded-Encrypted: i=1; AKwUvByXYDDW08nwNAHLVowF01B6/uFY0uccp9tHda4JdYqcxpaSJKLIlAtWVK45aDACi+BOkuden1ux77+K@vger.kernel.org
X-Gm-Message-State: AFq9FYJjwQXEvfsbxCi2LYlg5GUw4S7dsaO670loxAlycL1HXNkSbdpA
	o7nkOTi8B5L8AMxpz2sosPYvdKXmaeUFenY3SfdEJkHxd5epHMTvQSOqbvcCBXN9XAH4ITIGLpj
	d860pvw2kUx3UUexmAGtkXaNM6ZzIuR6bfkSETTcuYvjSs37ptIcEgs9xRbEuiDtA
X-Gm-Gg: AYBFou3FWkeZD1ocqQvRFUfwsJEFSY4QMTziKhNhIbbewsirkF10J255+6hYHQnLG8v
	uwzyehT57+6GcL5IKZbekgVlwVsnp72kMokmwno+uYvOuqFxUD8WCRFUPSXvTg+Uuq7qiUnn736
	7stPeEVySfKVn7+mxbKf/tcD7YKHNe9CUYSj6QYHkrSDfpjDoGgSKpVYSCF6V3untMGwUcQX9lh
	rERGJ8sGEV23HWiDutdnOv4DxyXwsSv08V7ASSvF7w0g9nqmn8tKb0dDQgNkPv9EY3px72pfWWu
	7ECsO2fF8JWvJzimr1dJoBTcbu8eDeON/RuYcTUIJ1xiB/YJYBvt9LgxyXE80ZQeOPK+Vf8yAoj
	UX+DSuKgD9RvDQ6HCUUD7Hw==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019482385a.6.1792140742262;
        Fri, 16 Oct 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019480785a.6.1792140741852;
        Fri, 16 Oct 2026 01:52:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cf02csm51471266b.37.2026.10.16.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:52:20 -0700 (PDT)
Message-ID: <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:52:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwRiVkg48UUrk
 djJNSt/d951f86KGbIQ/+ue80i7wGnfT/A5b5qqIvy0peCg/B9R4zKdLYE6CsL9GOGElNzcwnxW
 SQZtoxT0+Yfnc0E3LeRqGx7cbKXFbx/pNPhcVaUpUZiEGfS9VAp4x/JgVCDAmOK6dX1Upp4EnaG
 G5DBaTzgy7Rb/mgk5kNMwgt9/GMWj0NeSg0gWziwybcrxyx3Ws18ZIEWF/eF3DcNPoOmlsuRC60
 uaETOGVi/Sfnq2WB9+O7Zi1HhnGrWyGDX6uYRzYcG4yWOYXHqfA0s5OXHMTgdQ1I9azaKpqhrZk
 PweOjsBjl1mDupLow5acsgBz4bvDI3Jd9hrVUyQd03yC58txjln3bWD05XPAY+giep835jI6JWx
 2PVYtBBxyvmDX40bMJmZcRtXwFXcM0SF2fy64vW2yucQrbolvS0UWn2O1V4Q6G/lUWrEuYFgfI1
 jwRqQ9sJxA3q/vinFXA==
X-Proofpoint-GUID: 2Eya2Q7XUBgRtWyXIqJsUPhULjSs6yZN
X-Proofpoint-ORIG-GUID: 2Eya2Q7XUBgRtWyXIqJsUPhULjSs6yZN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX7iv+hAAhRzK5
 J3FpZohsbPXoicjK/d62akyY1NuhnzzavVB1khqGZel9ckHg/Aq3vB2JU+yr+QoOx8zoFU7S4FY
 tRnq0NBkYgb6cMJBDOcYqf85OOJQwAs=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1e5c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mI9klGO-NMSZWYpAt-EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/16/26 7:39 AM, Anurag Pateriya wrote:
> Enable the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..9db94c3b0c91 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,12 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp{

Missing space before opening bracket

Konrad

> +	firmware-name = "qcom/nord/soccp.mbn";
> +
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
