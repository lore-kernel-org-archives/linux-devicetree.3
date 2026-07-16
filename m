Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064243C7D5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223613; cv=none; b=W8w2lJMqw5ri55qeYYezriyAeaVPf7MgIz7NyYRHOc26ThmojZIoyUont/x0UJCa8Y7uzUnnAOLAy+90PhaLNqTI6GbqaSAvBYe8TrjkuMifRRw6LWg8Ww9w2/VRNyAeDIoy7cFpxtm7wIAPRFhwZtZaDC/3uH/SEQUWF8SMiX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223613; c=relaxed/simple;
	bh=tHg/hS1FOCKbvzI4sWSTLObFyPXHnoqWeIz2PSSrQ7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSKZfzZbovXYm8CnS+aEIDu7v6DwSKLH5fhP4QpAilwamj0um8u1xz4xAzUW/hjXZeRMJ0QP8LZ9IgmnzJHJ79v3rPEq/nwTuvhJr97Q8EPcANvI96FK58VOIVakI8rD8yKUQj3noZs+1sx/i5lpE2pY8KiVe/BAkIO+3WM5VmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1OAL6mE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgqvuUcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1OAL6mE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgqvuUcK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZXxB3544301
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=; b=C1OAL6mEGviuEAxs
	qPhC7CeJo41meC73MTRrgJ5xqJZqKndArGpkOia3oXRu8UZzVAmQ5d5lY0IBG+NJ
	/2dBEHsbOuEt6lbTx5PJzGiWfuA8CBmIYvib5IqqbhE6rtmkqsIiqb+hPDJKgVWl
	t6bUUsTXmaIEG+kg4V9vTUr42dRFq4JWrm7yMr392GjpVhXnDWlpxyn7ys20/7QJ
	76yxYzfgWL9mYuI+Qy51T8k9JEgLN//W16KqnBUgTYqzkGLhPerJdhHb+7Ds4CJj
	D5nJhngaXK77joPRTDmLAwZWD7K1uJvspbzERYn2VC16jOWD1gt96NO0pgShto2w
	l7Drkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u800p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso139691185a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223610; x=1784828410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=;
        b=BgqvuUcKViIPA3nL6+fgfSbcx6AhZMatlg/je+BFKgNdOe8UVFBXoGsmi1r61p9VJR
         8LbhOXfL24OZqkka+fZYxgvztub0XGFdHh2k24xfPtROe2GseBvo2ZBDSYbwU42UwCIh
         XwALw7CXBBAbH12pVLmUasMREFx/sfknA4aTMl8CJrTEgNIVOz5QLb5KZrYo2ZYCQv1j
         qb8UZ/DO4BRtM0j0xDYhgI+2stKi+gzkHuFmhFWIwu/pCKrEfkaRQrlE/0TRLexq03xV
         hF+sEc6EuSzvrmo0VVhWf5X7lC/mdDs2Fo51y4uXvERGKUrfGmfSFwRruoZTTA6knVCW
         6E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223610; x=1784828410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=;
        b=lM9Cf/lvjQJGzlXFqMzIo5D+Q1131DYx/ciCUhZkpA8CDe+RkA6qUAnUMZs2nB2zfj
         0+5qqnH+Cn7RwtKT36Bo9dzZOUcuJRw/sh7Q3eQaWl7yhA8AbJcG2gQKGx0wJYhSFAtl
         bvj8m59jXT5WHUEaN8irikm78ciDBijNKjdTrLfaYPiKHH8LyE5dv2BelV4La8wfr2y0
         CmpI/Y7IRrU9Wj71Wl3DFoGECy8WmQJHxkSJfzMzT6vejARkF1GF4H6SW1Kl0A1zoYyG
         kriZf/wo35YJWLR5UPrWFMFNq9tU6PE79BCk3z639GKzvk4lAnVKYme/CDR87kpKUWIz
         ljKw==
X-Forwarded-Encrypted: i=1; AHgh+RosqC6F5AQSh2yhhZCeKFIZn1/6TldqkJqsEEDqVBKqujVdmZFTHXppmYDzmsvXg5NUC/CQWnbgHacL@vger.kernel.org
X-Gm-Message-State: AOJu0YycW4IaXVqhuXyp+LgpIPMc7UQtMh/8IvPqXzYeWe7fJyG5qEIs
	Uwbz42tAzZcHJuHdLgCmQ2Oc1YpwkWCqmduadrWW8TjsKpzW0Uto79I0Sf9jHpNnd2puNp67lWY
	p2QLSX2+cjMS7GNiXiAlppxUAIUBU89X9sEKlH5hM16u31C3AEAiavQc1rFreWfxN
X-Gm-Gg: AfdE7cm8xnBO4/Is6bsg3lLyakPzcpTRC84h0y1t3rUM85BD13UkwlAOeaBHPybY0Bw
	yhLtLYe+F2DNiKNL+rf6bbpytpfNNToDggGx7D8qYI1v0CWjfc0xe7kydEKy+oOpzHW7VXN9mMq
	VrZzySfbHczzhyAMbkSEuQ+e5WT3Q7bEm8EVs56P1L6sOpOD+VVZxJgy+xpOXeoZBHT+ddRnQx8
	FOESDzydzxOGnNG20U3BUj3qv8qSREa8/KDLoIoYujhQ6h5CNDZgAQ4BfEQBfIxtvGAHaejgRTn
	Fhw54zh+e3ZTv/1YOP1S3NTtxqrmdaeUqKaDaLtexss9CxN0XjhtQ8OYZx+aF5D5Ru2r0QpUwcg
	AMx/xkUr9tKaZr3DUrzJyWMAE
X-Received: by 2002:a05:620a:1992:b0:90d:11b2:80f3 with SMTP id af79cd13be357-92ef2c4c04bmr1857741185a.7.1784223610166;
        Thu, 16 Jul 2026 10:40:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:90d:11b2:80f3 with SMTP id af79cd13be357-92ef2c4c04bmr1857737585a.7.1784223609678;
        Thu, 16 Jul 2026 10:40:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687125a5esm254590466b.8.2026.07.16.10.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:40:08 -0700 (PDT)
Message-ID: <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:40:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfXxKqI62eCOyf6
 wzhoQzFzXE3SP3dTOcByXYKyFg1NaDDsH8RVoghFkk2fd1rb1/aoRssZVRik2Yjw/W7J2irxhub
 yp4oxXk/tAWry1kr15VvxL64aXO7Kv9eFh1p1Qv+OBVMcjDd91JEeo9/B3d18DLhcyTHyDeg4N6
 w3BgpRpbz6HJE6j0QAGrK6a5UZXM0KpsHvbOoxqSdCT5g5WflqlqvhqPzhmZRWsgQnp16vTN42Q
 2vs66mdETz8TISNwZwuM5MudhfZ5SIAKzIKr6kKEPQS3nsp5U3Ii7P1+XnILoKjbnisyEEkYUYG
 KMuPCNlrNTZ/LxC6ZR1NEVANv2VCRCvn9tBZT84fUWfyMTEl2mmwgaeEinoy7M97hW7ssmQaXTy
 PUftYxJ+cfWOpMaaVClZccedFA4dUWpZIcT/6pJhwGoz0o+y4q7pLVw5FQgTOYCV0JxyDN89uRL
 kz/vXl5VLXaJEkO240w==
X-Proofpoint-ORIG-GUID: 8V8HsCM-ek2RjqliD_iDuNQEYKM5kwm-
X-Proofpoint-GUID: 8V8HsCM-ek2RjqliD_iDuNQEYKM5kwm-
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a59177b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NKjDTbTdbK9Woghm1DYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX81j1f8lcIxMp
 0BnmAPggvNnPbNtp7GOK5BYVNFmoH4LBcE2kC0jX1hyeXrLEnOFFbfuTd3HKFkzpAkPxJPTVYCR
 krusZTCkNvovhUGH6W2mO5/CBF737+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160180

On 7/16/26 6:29 PM, Krishna Kurapati wrote:
> Enable both usb controllers in device mode on Shikra IQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd759..2d4e34ec3b82 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why does this one have to be peripheral if the other boards are otg?

[...]

> +&usb_2 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";

And why do the other boards lack the secondary USB?

Konrad
