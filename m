Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4864A9D6C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364469; cv=none; b=Wphcl6MXYnHtg6KSh/nfooiJiQSuoPrHjwjPKCbeeRtx845Ka0oPWab0wnSfRjmuWEqwvo/yYv2sWn45HN82LhdXO4vw/v5citbOReSyWkKkNFZi92rARzhL77gunrX/DdS/6Q/GkufQZJKZtquUMgUWzsqq4TxFuzLpwOC7gTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364469; c=relaxed/simple;
	bh=gv3z1luQPW0kWiSW4nafQVoOxWYn1gnj91LV2B913+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY1HsISs46cqZqc98D0uZeWFf2vLNzFh5K89S6YptvG2+F5H5GsXm2+lP8pvskimhn0+D0g0j6wlguvW9AwjCFxfAJK9PSM8jyuhyKSWi66ifnGrwJP7y2Cft1740BLFDK0Ijf1CKlPGH3u8f8YnTvrxyK7QzaHJ+cHNl5qxUjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr0H++Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBUH2SBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr0H++Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBUH2SBI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ4sU1408840
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=; b=nr0H++Ouy2NZn77V
	/8tmkA1HnODsnEfvM1kUtbd9ZP5yqsTh5yWvMpO6wkRYFAqtIldx7h1NMHtdyxgm
	4n4eeAJPRVgn+Edzb6no+b/S7vcTs4RKPTlllW3SbyjzmOVmr1wYUpGvnJA3W351
	YD80O3Vieqs+7qHZbtCr/ErPsUsFHVET4QILnK2t+3cuRylyoYNWSS8gYJXCSOuV
	K4NuxVKMD2RMsQyfYCACMaIAbRCy0/Hldfbt4G+3Y+xJB+qGDanykMFz9p3k7mWv
	WFitHdK1tcAkBvsYDapNQYlTymc6dYLPCpjz1nMmJtDSljd21SUiuYRAjJnGrHT0
	4X59JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8pm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:54:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494b1e35cso27234285a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364466; x=1788969266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=jBUH2SBIxJ9o/hJdn7/3BSfhwqw6yvaykSzLcgdrc8JlnDCtFOtbuQ5+S5SBI7ot7k
         3J8/yUk3VkwYH5Nh2kbFKDW66TYJfuG6coMl2e4Xw9Neiqv1Kw87QYbTSeys3TrCqSNt
         12XhjjyxdVe0rtd/k11NcAvahzY4iBaXIIupzTZGC3lZmZUiamuksoZxgxmQ2qrEJzuh
         EHrEvlBFKqkuAhvWTaB3H1/V+3ng6Q4sVix3mh130IofD4c+qkq3/KLxgr+Ql/FjVDk8
         C4JyUN1a1/HB04tSQBfWuyO3n9zloD7i4xiYe6mMx9hr4hxZU+KEYcnKLtUvyyy9PD1m
         MrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364466; x=1788969266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=KcFFKMJ5by5k++k3apmZWwMg8IzVXSM16VreCJvtWqUAOkF7itmkzUL+lw1Telkll5
         CD1T4bXaqkg/1cv3Hjr5VugUNO2gxdKRePeKf/ncI7hDYQGjVikxFAIrjeYgKAGVgTmo
         7guCGlrCGQOPesq4MWxITsPZDAmZ+37NuolbQlTbgAK5QIHPeM9YxiznKiKzfoLjLIv2
         Q+HjtDR9Wukb9FBcpJSLbm/Z+z+dg5WCLdxDUtL31UQOM9ffmMMCwAAhAOyQLcRqHT3W
         H7n4Z3XFzNUBHtG1IhMTAl/V4qK1y8g40f2UNQnYi3eYwcvXjf0MKwrK9K8D7kXWYxcw
         3jKg==
X-Forwarded-Encrypted: i=1; AHgh+RqCVAbreKsFlpfNFQYw9fG+jz/eG12PI9MexwmyNhaAJT7P7+3ggYDWc2dlIUk9IuQoeCIFRweBiKyV@vger.kernel.org
X-Gm-Message-State: AFuF++l4iAb+QbzxX84hvNkBVuZpP1SnIW8W1JEu6KziSQ2FQoCR7d6r
	Iw4+1CczEahYHy8kmJY47iV09gu9et6n6kh9IBU9RZYB82D9/bVyrAjeoJMU3coXk8773hf0IiM
	YEViDR/qxmQmE9gU0nTgzTKrupXDFMa7cZRW/W6nz7ko0jIL+ITzXhpiC0b05pFpQ
X-Gm-Gg: AR+sD1373/S8JKmYIhoKt7jzh6sHcp/4EbAQmrz8K3rNGx+iwUq4APHMHROnyTo/W/e
	WXwpCn6xPOkk+M+vR3bIYJIV+QK3PS1e0m+mGYuEAA7Kp8kVWx0G+R2iF9c/t/xU8pZ1GqKU2SE
	YwLYOgILLReRXQXKDvZoprf6lY6H64G8mGpq5Q1jyCXfKvlmnUcxgfo1KzxYz6HEKXIyefAqQ7E
	ShyLW3+jtFwvt9GETXA7j/84HcHCheboP9kuDMdKRgh/1ILG2gLSeLtjZX2LVw5EamcYo8dbMqS
	Dt8ezP7Vf9WMHRZufFAYJpUKAx7C2PK1X/z4d2HAyLjoOD0fGPlNhsrp9TD5kkBcRqBzcBuwXN0
	k/9R4PMLHf0RtQyhtKSBTvA==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400659585a.3.1788364466129;
        Wed, 02 Sep 2026 08:54:26 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400614985a.3.1788364460903;
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f95f557sm1378949a12.31.2026.09.02.08.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Message-ID: <0ba34862-0268-428b-850a-a43f795c3065@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: x1p42100-microsoft-sp12in:
 Mark the EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX2OM0Xp9YOsYU
 IIwTdyXDWn7uABD1G6Kw7YkUKSUW4RpNBpYmO71uFSdn2OUxDWr1uC9oiJURL9Kwfa26afev7A6
 vvZurojj6IqkOXbnnDqpqlpWzklOCRfr8lf0w1fde1T9lSoaxaNJ8pVHGU3pqPBjk6AG94j/VAm
 3+D24qCeXxDy6w6oiho7FSZUmiwWvGwbhJpvCr/G5RmRJFIZcX/rEvERjutXK1Qv8Raa6/HR4IE
 uMWzxffaGAH/d55+UvUdhQ+vC7XVQi87ad7LPyfxTzeNfE8cgDwXc860gJMdFzGUU1l9poOMxAO
 JgkqWYbStmXMKGVe0fhdiNTOj+FGOZFFnQnqJgmPJQpStCJqd9PPbXyc4U0R7LOKbMm4Pn2+h1V
 0TmgSpmZl1zFMFQrt1EY4iBpXj4sTZ9+wY0dlWPBj9NMeC5YsoFXXOH2ABemdwg6/+vfMZ2UwmJ
 dFPgIo4AvYloX4lwjMQ==
X-Proofpoint-ORIG-GUID: 8tVBjPCAR7TeGsgRqo8wk502U2envaOY
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a9846b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8tVBjPCAR7TeGsgRqo8wk502U2envaOY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX04woHtriJefE
 T7RqcHB2LzbbpPvBKAaji7F4QxhFg/u5ILzlNCsrJ2qjDrXLKKBlfwOHlwbjy8i8riw63sBJyH7
 gF3WWpGv2hyszMmY7S1v6LJwgvRr+2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 447f8053b184 ("arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> index 0314b2246cdb..7f7245773e6d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> @@ -970,7 +970,8 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <34 2>, /* Unused */
> -			       <44 4>; /* SPI (TPM) */
> +			       <44 4>, /* SPI (TPM) */
> +			       <65 1>; /* EC reset */

Same comment as the other Surface

Konrad
