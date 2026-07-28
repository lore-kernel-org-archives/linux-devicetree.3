Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2103B8949
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219498; cv=none; b=cyhSh3QhIiBbgxUwN+4p1S5ndeo7az2RNi9nnHCWQGEGxnIfHbhHLB37ZGz6hiBa/sYz3C513DPNOvkdfBp7FQ/cSt5Tn0c6tzuAlS31Is2hX1q5ozK1gcaMyRkMCEcl6339XCEYIPW3C5YnZZA2HWwjlkPT5f2AT1I1pRVBtGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219498; c=relaxed/simple;
	bh=l601a+13X9ZKLQWE7X7p8CBEF37BsFxy25IJ5VhGl28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YT93Z7MVgPrSjKf3sUbtz2GADkIeX00Vic5T/NyqH2Rax7b0jlFKegtN3nOrUtxLVmnzHkDEmKfLGebiSCLCCb95v9zrNZ2ExjTl/VbahvgUmBJ8uiH5oJP5Ye0T6DPc+jmaIeLITf+osWMvGCedYp4+vAd/d9+9xZnmcNqjWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr1C/vKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYvtU3LU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr1C/vKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYvtU3LU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S46MFr1821019
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=; b=Hr1C/vKQmteTWGT8
	SAp407kAGDl/1/kO1hwtAhtQ4QEI9ze7x2J77Jaq8gntciG4VyEA/BQ/lOcah73r
	X97lfOxFCi6WA3xSlHFZjkPIwfGH5qeMlbYZWAxXBRjcGiqLppGN0WjwqIKkx72V
	QTdLdwa5d9o9vEfpC+R92ZbLhkVGLnEBsZ9h6gyqITLn04Mxcar/Pr8B5HTvVr1G
	Jiav1ODqBKzEPe0g/1CYHp3nGxuKI6XC7upH2WJdSIJK+fMBjZXKxtTScFaX+WD2
	Nl/KU2Co1H2uKg4O3WCBdjVhywYkuyoeWw5pKKWM3tzHQX3djmDhSx6IE2JEjCl8
	rZ80yQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0dpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:18:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso50993405ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219495; x=1785824295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=;
        b=OYvtU3LUu88/HUzTtVzr78fQp6vYFYuY+zQLp4fhzTnKMe5m04WC8m1I9GTiIFjBXj
         yUS/s4jyKWIeAT4EBKVoqyUne+qvzszmfLoiCjPaXzh8/LOeA99/oupc8bqDFVvRs1Op
         iwpuXUi/rPocJrhz1Ikk5Q4kULdxM75u+GaII9KlxxCcTUhG9+JmFVaVm9CiH7UBzpey
         cAIDjKkJ/TrhFywjGTlNwHEexx8Y44kJNASPTdhZkp0QlcopUOvTSUDiafA1XS1cQD2N
         /Zfewxputo5E4gzI3rdrktOyCbN3QF2bxjkzTPjnCisyGXCOVCPx5noHsAXZU3MAqnac
         NEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219495; x=1785824295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=;
        b=EBnJIgxx2D+5BjsvVcGm31+CHZgOkstCyewbvz9XCMlwVFKMVIfgihiWvxRvohNFHv
         WrM3+GFPFh9FiA1rntd9Q7fAa9kO3ctkSkS+XkbRMU15OTesI4mLeLbWM63K+DucOcr4
         svPR12w8D4BwFpCSYc9ZinwUZmAa/REdXW7Ivj8NzhtaxQZjzjcZQu0xq6/Gf7PjThLS
         FomnCY0cocSF+3O6flZEfdZm33Ii3rAXdv2jPJb5wcG/W48sSWhHak1C2PYqIKy961Tq
         9u8plDU1eXJlXcFDeAxAxlzxwC2yF4Ipxlcz8ixhNDjHyQ9XLR4l2s2sSKBxTc+vnXLG
         2iRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrf+bSwUr2ZaSTgAJxFSvECE72plWfBX7QWZVGAu8RtvKetIBgsD0zCJmOwpEsjLd4Svprwmd6iJ+a7@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjCfJKXFRxoDAEmQ7+VtesXoy6T8Mc26nKELPsaZENWmUDdV5
	VccrfgnMMCGlwGCEesmGYO1hyvqy8Qd51a/OFGFJNrT51s5ZPZSrqzlLVxI24ME1rIvJouvRYno
	6uLTKtpOTjovBBSGEe/fY2+xaiNxzg2ZGK7jdtFxCF+5UWSOYoo9oww9O4sOyFQuE
X-Gm-Gg: AR+sD11c9P4tEOjHM/jphkdCUX2xKL9RJPY845gjAuYYkd4LfsxAyUEPrACkjeGBUZL
	hF0UA5RTepxAVn23WAT+h1fKxYB+1Ej02kiJTBYEC3j4SHSy5grv3s5aDSdAqh5pTfgPZMBSsP+
	5pekg8rEHJSskFWmasda9a5j8/IsSdaxVUB1xRU1r0FpeD65MG5AYBm4aocABrrXbaXyh1K1r/R
	oYgoFSc5zDp7jGtqZRIPZC0HYIvOtsDL1aUP25abiTq07z/mMLJnajk7mWYBabFntlAiLZ89f/L
	MfnuHywiKF7tvk3VmklN/QSdZDYSQhZXvEbMcPXEuHwuWLbImM2qjkIY0Gy6If8Bf9cLJ95vabB
	oNKUPkRWVKEdciMUFqfa/NVFbSsyw
X-Received: by 2002:a17:902:d4d1:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2d015d44a5amr12297955ad.27.1785219494979;
        Mon, 27 Jul 2026 23:18:14 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2d015d44a5amr12297575ad.27.1785219494548;
        Mon, 27 Jul 2026 23:18:14 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4a05sm45410835ad.68.2026.07.27.23.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:18:13 -0700 (PDT)
Message-ID: <7e9f457f-3ac1-404d-8cf8-ca06842b9c1d@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:48:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a6849a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=twTbfQD5VkRrgihANLAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NiBTYWx0ZWRfX1NJ5n0vFOSN4
 FZtC1n8h/0UA+HJRa/xrCxXRiZNv6vqenJEuymhX+hDvh14D2YoY7jJnFi/clzrx6vjSJheJB/b
 GNMPPjaGyEntK9TuNGxwzmyV/y16Z/w=
X-Proofpoint-ORIG-GUID: PAoQtgmzVXHlqerAuHZqOkxOqTNPWgla
X-Proofpoint-GUID: PAoQtgmzVXHlqerAuHZqOkxOqTNPWgla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NiBTYWx0ZWRfX1JZ9C69a9+DK
 t2PYeqtPO5Z667aTsG6angP7FEEsqAincHVsH2YkrfGpgbpOR6qm79J8UjNmSdmklnX1ItIgTA6
 buAZoY3c2Fk6K9HUhDQKCwGmtk+TIheIIcn+MPde26TXg0B0h2zq+GEYdeUaJxiQzwJq/hFQ/Qc
 dV/Pue0NA2vbivDfFGb0yx3yPPs/LD3TarmBWdlvjUu6KTzek//bGOZ8sDRg18mfxzGD9SuHAIm
 fZzi/ar1Au3aPvIZ2X5v+vcmf2jTVDCbPcC02bInhvULdo6f21ovdNa/Fe+jDdUMySIysREatB8
 0+UsOTG8pR5S81VujldYq4rQm18LoZqS0k/pWVQctDh3P49JO3mgenROlbIrvefS8oRIgI826bh
 mFxPdm5Of4WabC3zw6t/l2MH7nvo7V57gEm+f18gCfZyUWfcMwYuualdy9nbfM8s+RVuaS7Yr1i
 5GD1XKhF1judU7ZmWbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280056

On 7/13/2026 1:46 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
>
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
>
> Keep "qcom,rpm-stats" as fallback compatible.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>   		};
>   
>   		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";

Upon running dtschema, I see the following validation error:

arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: sram@4690000 
(qcom,shikra-rpm-stats): compatible: ['qcom,shikra-rpm-stats', 
'qcom,rpm-stats'] is too long
         from schema $id: 
http://devicetree.org/schemas/soc/qcom/qcom-stats.yaml

Thanks
Komal
