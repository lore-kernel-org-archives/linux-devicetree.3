Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59431E845
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907003; cv=none; b=aAHlPTjc7VLcYIbrQkxJYJVVsDgdcod8AhM1TsawdwDZF7xVeVkIrCCyN1eNiJHSFFxJbY7Ak38oCM0UEsRmN/SJtMCZriMShuLRheFiiX5ns+sBDgf6Wy0N5XY7FgeRYZhEfHjCoaaoo2dBA9zlbv/5hExlLje7AWS6Y2aMlGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907003; c=relaxed/simple;
	bh=DxOf+L6yiotlxOV6augFzgLDWPsdWfK9kuJES/ulFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPYp0r6qqOOcml4VdjPJtZWgTqkQM/LKh8BpPrVy+pxRdCAwcDecw0BIJ9l+oF2OingRLW1ruBfP3gr7Q6X0f0iBw33ZYhB/iY4dV2lYMhFjqy8eZKDBpaR9esPHCA5JAABfOwG5JHaOBcjBz8+6sPZPPlyUVRxAH7IbxDYV4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSdneA9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czk/Mlhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSdneA9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czk/Mlhe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG4ke91587773
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=doS0fD4+OOQ9XqikyXcImBcj
	iIDXJMyeF1hsrvrQhrA=; b=YSdneA9P2bF/vTwIYiXmrPaBd9+RRK17sb7+CVcA
	Gw9E3FF6HI01Tr5qwPOZ1/XbL8ne+F7VuA0wcShkO+pfeQD5VD11Op7nogFl3u1I
	H22vCBzNnJiexi2nfWfRhK+zoOLylh0QHHE0N7SL2TVQSgwRf3I6GXoQ/8oerUzN
	J/h4Yj3DB6uAreZHEs02zkKKzMJyQ1uVyWsUtLGjrz6dcmKqOod/7sSgnyTXAqjW
	ayS8aK53nidzOKiuuMePQ8TGrbqN8iTD47mjQxc4RL713UQrRE1NPU3U+1S6sP2a
	eDRBL1JJJ/Y1Y28NUZ0z+Ozazn4y3/5iNkbWmwP/njcoag==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq1kfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:16:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8ccc7593so6268303c88.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776907000; x=1777511800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doS0fD4+OOQ9XqikyXcImBcjiIDXJMyeF1hsrvrQhrA=;
        b=czk/MlheuqK9du0/NAKhS+67a5sOXCh9Z39RTkYXMyBAypZE02zqjwGTENaMrzJf6p
         RnXKFg2QeOuFfU2j2/8AUi3M3EGmAuzE19jy0LLiXfuU3g81yrac/UHq2Df/xibXl575
         Z28a4cAjKjM8UHECwwK1/bjc0r+lgcaI1o3n8sMpPFjZPAry3uExTWgZPc5teHtFZwwM
         u1tj51SyMSpVIkqNSvNprEYKuIySsku9CxLwxnpww2n1SolOkXMdasOa+jQBX1rYo2Sw
         yF35R9pRP8Q0LUA4NZld7fvRve+Q8j150IDWZk6bua1+B+zry2MIZQNsNINCiP+yKwqg
         I2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776907000; x=1777511800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doS0fD4+OOQ9XqikyXcImBcjiIDXJMyeF1hsrvrQhrA=;
        b=b0ZhW30rmV+rf287AYWRY7ZUnE2+adL74bjoHL0tLU76Wo/tHJA79+qlik3EsySkYT
         N3s5c64543VBJfxG17HUWhcp4Adgbgm+U//qMWPxBw7JzTLokctJbSUvG1CvJvZKZP54
         bM3jPhtERuJu4Y8kKLIcXjg5UVYe4eqbt7ywT8mt4iPx6KxnBooRRUpImNuH7YJsw9C+
         hc5mhpKSqYmTOxvfOZNoe1Bm/Y3S20BESZjH41qjYG5oji1nDXYdi9edX+GoM/W2R2gT
         +Ag1uN54Weqs7E18PU9KXyHByLBYIy3iuzfZDGJJzhcToprDqc/66RjfhJdDbHLkbyh6
         LQ2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8nHtKxDhBcPJcaOJsNp10uiJrHcD+sg5tzIXyrXAPvg79TxOPKVKF+tLmc5s9eYbJgO0ILrYFwseb7@vger.kernel.org
X-Gm-Message-State: AOJu0YwqatgYFyC+q4uDStdQ321CigWmpeQ19nKc/3JyuTM/qbzJbPAg
	09504lCyMOguHN5B7CVh2ZR02DG2KuUOBPwO16/q1cN6xf7TH6GdXrE3VeJ3mI1FE1iqrKCrrO3
	FyMgMjXvZ/0yeSfnJlj568ok5gtgLl8vWRKfY94MMQhAmtYwqshBoQeTijdDIFJgz
X-Gm-Gg: AeBDietCnCf3HI1adr7GKO7d667RKcQROCs6R0jdaOq23w30HyWY9c0sfWKxEWrAoS+
	bFkXhrcVcsyXax56m1KUus/iCuG5hvvFiBhjbCe658ZM4/+daHDgTVvj4+TYf1VB/rkyduMg/lQ
	NBFW0AncaAIctm+BnuuD5W1t324GmXIS46Xdfz6MbD1Qmaz8mM0+bFiosZT/5TEHFaFZjCZd1a1
	2nS/EhuuRpUVWXliexTw2goBlk4ovcopm4247gC+Ck9RA+9Bg5txK1YSnuCeKyLZtRMBAw9kNV5
	rOf8hsMlxh4i7tdd8g39k5Ppq2Ky/sHl2pwmsEhANEEhfDJ5xgwU2a3bIpGTAAbb6Nd4z2yM0/l
	/LYR8zuiiQ14ohUHh+l0qmkwevzDnd7c/B6nZitp0F3DkkH3RdGTx7IiEjo6zI5/maN3WQtYqyE
	M=
X-Received: by 2002:a05:7022:793:b0:12c:8cd7:d438 with SMTP id a92af1059eb24-12c8cd7dd7cmr7691456c88.9.1776907000113;
        Wed, 22 Apr 2026 18:16:40 -0700 (PDT)
X-Received: by 2002:a05:7022:793:b0:12c:8cd7:d438 with SMTP id a92af1059eb24-12c8cd7dd7cmr7691432c88.9.1776906999499;
        Wed, 22 Apr 2026 18:16:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c422csm26381425c88.3.2026.04.22.18.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 18:16:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:16:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Message-ID: <aely8W3Tve-fhMzz@QCOM-aGQu4IUr3Y>
References: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAwOSBTYWx0ZWRfX4BvIKlZXt5It
 ROZ81A9c3S2oB/AeehKJx3V6H5pa+MMf7SnKW9zVIZ4X90cErMgLkma7rxYplCQHDjd1aYgPKaA
 dV8VNc+0n1HFxnkiLBlxtY4Mj//ygjR+veFuAsDlCO1NJuPrmpROntJTxIBuj9e8ZFAOrUriMzR
 mpccc5BuxWmFYot7P3F1jeCPM+c8MA9ziD8e3dZr2bY52VGoBM/c1xZNY16OpqmYbmYHHmXRq4P
 EvXDAfPquGpGa8f6Y6GIa3uhV6nc+4kYmc1yF0RP+gfmt9hxhgXS7PJATQ+TlHH6E99Ck9qeXxl
 DH6P2yXjMLL4yjao+8qrS9odSMYIaYX54zxou7Wb2hjUyq56sucocVzKdwZxqhy4JW8yHMnBvR4
 tq+pMD3OSexXeHmIpeIfkoOiYOidWIQaFqRzFm7xdbwylh6d1IRaurMAFIs9Xy8+J0GWBGW3RPr
 Br3ZTT9qqiicmY/AJJg==
X-Proofpoint-ORIG-GUID: Q2BOOFWeEQuHMyoSAjnVx8CG2A5z-1CB
X-Proofpoint-GUID: Q2BOOFWeEQuHMyoSAjnVx8CG2A5z-1CB
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e972f9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R-84wXamayB7cy0xVmkA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230009

On Mon, Apr 20, 2026 at 10:57:32AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatible for True Random Number Generator of Nord SoC with
> a fallback on qcom,trng.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Sorry for missing my SoB.  Will update.

Shawn

> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 41402599e9ab..1362a8b748a7 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -22,6 +22,7 @@ properties:
>                - qcom,ipq9574-trng
>                - qcom,kaanapali-trng
>                - qcom,milos-trng
> +              - qcom,nord-trng
>                - qcom,qcs615-trng
>                - qcom,qcs8300-trng
>                - qcom,sa8255p-trng
> -- 
> 2.43.0
> 
> 
