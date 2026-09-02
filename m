Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FDC4AA021
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364455; cv=none; b=hFU4pW7FvrfiySxRG/amu1/24vM3n/UsjRr1EuSprnXmNPxz04lUaJ3T3D38/d9xxj+cEHSD5CHaJsrtxR0VytNFFEMNFXeHNMmqkXljRQQhZITkgSuiXyc7upy8SSgP2M5OcEzkJk2R11HaWO+Uzhnnh5ndFkX7P7yTKiit7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364455; c=relaxed/simple;
	bh=8XkQR69hwEkdBWOnNWghUOPQrJvnLIbWTv55zF3ayPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJy5CGmAlIfTQYlCCoHl1raTm8F0s162C6fJgcXLsxG8jZjU6e0iLjmniSgVCjnObqYCfvyW4OPEZ2K3SvxeOP8tF7L+ivxMF8b8FcwYH8CZwLOrMzd2pfIqnKI2LZl7+0mH9MDR5EOUe/4+/h2OFK1DshBGfUzSEqt+3b19G9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtnzeBaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4Gq6Gxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtnzeBaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4Gq6Gxg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZDaj2177133
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=; b=BtnzeBaSF68f8XQ5
	jO6LUojPP2V3cqVTdgMMh2jPUGKkADB8gn6nbfb+tFSyawg5Sl2MBapSli6c7DN3
	oRP91xdTc53Fe9QQYDrOlkiT1L7FP0BkEfWzKBhkgB3G1WpVXOwG5Ce9p/gSS6RZ
	W6YypX+jCP+YDt8CG5xdufXzot7MioZDzyE7d4zWyypqFAfnsyhH9s646qlVmwAv
	00zwuin5CIa7tC/ykBCkl9M9I39ma+YQ/GWAHXffgZVMfWoK3lnKZUrWdU04QMzq
	KC/j8bResmK1xq6v5UR/fv/3/L0HG3yXndLGD6q2D51kz426DGuv5vNmPHefPV7F
	RAaObA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh8kae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:54:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so33418485a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364452; x=1788969252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=G4Gq6Gxg5P53DAWcfcxcf6wSjOzX5XaIGo5FcCl/Wdkcn0IVyd+pb3Uq7fF5TQEup/
         Gr7urC/Pz8R2nfYXfAd3j7W/oo6kb1RHY093vxWxU2WT7Y1zl8+022D+GOfiPHzTL20g
         ybmxjDupS5bF3DhsNdBzTNfIQKrd5um7bSytkCEJKOpKqSnVnV/Py/vA0ddKcwcVAWd7
         9naKn5F35OwC4X2uHzSHFvHZUScgDMubUZHwROMDgkUMQ9Bw3y/ZILGbjHjLh816uF9v
         IxWgSF6BKr9IS0qtdwA1yn/LnQrIb/2Pjqs+uPpsLWcVxoM28VUeM4eeWvJIt+kk6G7z
         KmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364452; x=1788969252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=Tt5MAdzmEt9LfjLOQNW2ZLQ0Y3wqlNVeZOq++WaB3v62SSr4dlvfxQs9sFfA/aUYnH
         TGfhR7eQcdRtpGnGT/QPMREMLNTFDEvFWDZ+6WeQHPkfXLcNsV2y5PbnjbLdG2nFTj0Q
         lPB4rhOnGtCR1MJBbgZYQ1PuSmPQb0GhnbUFLL+4NIWVijHI1vtpgFuUtbpPTt2yEp2M
         2pWxYnb0k9wIt4UxOwzdQaWNukA/ogV4nq/pphBWk6l1PmJ9WlpQzJdiDAO4J5SMv4rB
         Bk0NK/JYXtyl/VwVNfCAtmHfJ1WgQzmp37OcQL5xa/+DWXPx3U/UuqTfZgoNA7slMyTN
         r00g==
X-Forwarded-Encrypted: i=1; AHgh+RoahotyZISUeWVNV8scyDT1F5K+uHYTEFM/0621P/Ac7MNk/UD7f05ylwCexbZNhmKPf3uGH0fk1XlP@vger.kernel.org
X-Gm-Message-State: AFuF++lNX5o8cKAd8dW7MwBGrU2QIh1cwd3eWXOWfuPA8BtdZ2w3A+Hf
	4+rXWkcI8SAbYL6NIv97lN1ziQzt69t9bOy+EWf2AG5iQXoU7Zpfx3AvK6WxSq6pDPKGfDpI6rC
	W8OfPplncrygAkZqYGj+0RB912tClc00UhPYUHuvwAiEeQyYGTssLHKiDQwpnRZBi
X-Gm-Gg: AR+sD12CFGniVvMx9rEV+t+2qplnulHGSp14lkFPdPNlmrjLF4CWvyrmTwss6lHQwvI
	lIUr1wgdBF/P3gbYrzHfqWKyvwND622Hc5fWAZIvhGaCijXqLCla56weWuodjOgMKK3kGV8a1yL
	wsYpMMswNNt5RIf9D9y5de/W1ijirrFZ4wxhXKDouQRiIKIhLntOU73VQHlPMObgZVFtggNFjz9
	VR3xqMu5HqHCTF41ZpZn0nft6e+QroL0bD2DO5He55+XVFPbvHz9wMvpv2tD+5oFpZJqS9p0LJ1
	tvvYT+3CQ+FdO8zxCzbX+j8xcn+RKnzKOQYISfTp/1Ht88wO8Mi2FcknAZctWmOk0H/jcFJzs3p
	O+IM2ZkhkywME6BZP1ZGbWA==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421117585a.4.1788364446565;
        Wed, 02 Sep 2026 08:54:06 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421112485a.4.1788364445998;
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70easm158636066b.3.2026.09.02.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Message-ID: <85f9ef02-e33f-4d61-9e9f-33d213a0c5e3@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] arm64: dts: qcom: x1-microsoft-denali: Mark the
 EC reset gpio as reserved
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
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wy3-i5P0MA7gtF_Ry3bEvOkMnKIiMIqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX1oWiAjSRNNsJ
 IdSkUG6bP3PkGWTJdO1fskDHKVDliFYVwxL/FfPrcg9EGLqSG+lqB0+Wx7I1j/WRxxNNNMf8486
 jcJO+ZwEOdTfByv0DQ5jhBbxzrefFiGDGXv/P7890Jf+4cdCLHoWQlaF1nErNQ+SLpaQEy7ow76
 vwzV8UloNfoD6JfWthViYZgJ7A+qo7YLXE1PmsS3L1HhD9BeK2feC9DgKr/s5IvAYe8qWQRk99M
 hgQHklb1CCsY1AinjOwYJQihNaT0i5XdsDP75NbxQLHITU773fWFRdGhZRAlJ+QVEQc1ZC7MqOY
 /6jX5vSkznwml4NP6yfgB60unnFin058TlIpk+D8MUcje3dAT9ZsZ0ntjAsGOm+yofig82Uqy4w
 X7wAY4xKNldLaRLpz68i2ZVfjkG8uupsNhJMCcmg/kpm63Kq9bdoBt0itMK5yjUp7x3vRHrvoPG
 LfxJxawsv1wmjUoEnZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX4yW9CVBEbQoC
 4xVA1BW/NRtrz+a3Nyp3Od2Ywsq8aOLSczqymBSbhgw16XhOZDS5J48J+WN6AA3VJv/TsxKJsYS
 ZBb9SE6W6lLesCSHoKph589NSjnIKn8=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9846a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9b4qEoD23obgxP77xDAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wy3-i5P0MA7gtF_Ry3bEvOkMnKIiMIqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> index ce7d958ca687..ef2684e23a09 100644
> --- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> @@ -1109,6 +1109,7 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */

Because it uses the same EC as Romulus, I would guesstimate this
isn't right for this device too

Konrad
