Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12939DBEE
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334808; cv=none; b=ccM8mzTIDjmBbtP6Q4VUfV0GHjHMg4PD9E/kiYYnPNNs703tk1Z39J3FsGnsLpeP0nZpK9r1uB+enVdLifKl8mYU8vemp27EHiL14coOPpgPec5/j8bVBRNCyDxg+T1RABASqNHc0M3iqqGHokn7Zd2IkxuTkBXcNZ2O/1AERlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334808; c=relaxed/simple;
	bh=ML2htv29V005SfDSW9eTtfi4NMeYSdVZ5DYRjltftQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kop1uVyVLsvw1x59cDgScRmgFWWDQujYuI+CBe9yG5iF1UyA5FuR61dvl3/9s3coHCLQW/itI985s5lzO8qNNZUMheBNBN8cGb+YY+Hvl5ZjSuWhxY8S/NxLz/KkrN5es9+irG165uxDTlbG2n8i3+J3+bLMDeN5LCmu1f5XSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzV8JbIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0qaqJzc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzV8JbIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0qaqJzc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8QgG02834774
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=; b=BzV8JbIAB6VHIB/a
	6AQvWvhn8cD92mqA8vzU7NcwI0ai4gbvdCF47zuEv18L43WS0n8sJEAbr04enCL9
	uqp/v2AmG/Uit4sG/aSkNCvMbR0TSfUjj53fd0hD3fb8u00KlnHVVDhxY8ktSxA/
	Z8o92TIQNwiREC0ePE/icAM2DuLH1kQQu67gLNWqlGZSmOZUTu909Uh2jzJbUWlE
	VBUUzcl6QSFxHCXLyXCbwAxf/33EaHGiCY/PpfBdS88pyZguSjAiuTsaA7NaaFzO
	mo+KxbrQ+GhhTC4PcMYTBMhZC+bEfMEekPMmpW+PXae+3CMT27ORDVRiMiO9QcYL
	Rx2v0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvkfph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:20:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb39de5c54so183153685a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 03:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334806; x=1776939606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=;
        b=G0qaqJzc8ZZ3g3tRl+tlc5FSv38amT7DmNdZw5E0ciAl9isk79+4hVM9Qa+Ff+7Ci3
         nL/Czh6vt1V0nFTN85/d1g6RnVgkobGmk6H0pwWN7eyNtNvc6XmFIqBcLn+dTE0wvRCR
         gsrmvwZl+TCKJVNlas9jwEToci2vc6kgx3F6tLAFJ7bItb5bs54pirtZEwiqKOl5LCdg
         J9QZG7sIvKNLpNB2oyZ+l7hC3UK3qCpuF6REPS19NZY4WXNTx8g4EyFiHN30O29ScQh2
         S9/gl7bAEJeo0xcF9r+iiFTJH611M01stKUv8fdLLyEXjwI7MAQ1ud4CeWHLnQYfNX/A
         mOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334806; x=1776939606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEAsEf/mEHAEKtROzGpkn9Ajx/ckmkSc552LIlFmuOg=;
        b=opxb0/bmk0JXqvMzVtdQRaEOx3HuFcpvBZIAr1TZDx0fBdMljQ8hetjBt22iCBw2VC
         Cyuq2EDTEidP9UnE1k7S0HA328hoJKlW8sEjB7WHlqJ45JgDdxpctJJT5NLzP4loFdDS
         73NTCroyiTfD0puO1GwjsuSWKwVdN4Fst7xQ5WeotHnKv4PXsrB8dPU8TG3zzR1ZP5AZ
         00MPcMFWhBXQ6p/hwdvxdQO/HofqD9OZ6JXJPouQE4GTypn8VRmlev6yuPjHUN77R5Uj
         eitD2nstMbOabHbxXmGsP2kbqnxKE1Ap2fZClyWp4L1O313Ti1yKjNWdxv/nlLtwl0qh
         JtAg==
X-Gm-Message-State: AOJu0Yz9nzZO3016DqLKOnxbpD8Smgn4W8ht/nR91+UMQUcJWXj57IFC
	E00o3Z+JhZdbYWFcelSiZ13ZxO6S2EiYVGpRicxLuKKCD1+AQJD+c0U2jNH8gh/rkkT0T5Uh3QT
	stAB0Jb6Qk8O5aj79TXzwOj51HnpyhnWw/lw5OcyfX8VTWrqYEElnhPPPwxnCZLjd
X-Gm-Gg: AeBDieuBPI07x8HBcaVu+aa0h4Nlo5dw05/QPWOwrKnKN0Wyzz0Zkt5xuzp5UxrA5Sm
	X3bpk61DLQP1oTNTMQpU8l+v8uFNQaFMntaIefLbnUdRPS877sKGnXe1WIfhrYbLP98dOIFV0bO
	xN3g4tEGMXzFDUpL4llvfJWFJCbj6oQqTYHdydidfzuVul35TGGNHJIl/0blYfVIBc0P1M6Ezsw
	X8umL2MUe8dpUuvA4b18Wcff1nelyovj+EjP8Q17qOJy2PCpMWSixKJ2ivvdYi58qA6RrJeha+R
	Tlg7lU90IOlFHI6AQaXqLWCDeaWkEce5SoFZMX2rABmGUOq6PaoUebKkPWQQxasgOlpu3xhtAHT
	dB5n2eYpwXA7eAWtyNfQORI0GZun32iMg2cj2zT2/yHJnJOY/ZINVhp4EJv/p7is9zWIhEPPoCl
	JYRrmF8kKBOPO+dA==
X-Received: by 2002:ac8:5a55:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50e2913a2f2mr14491011cf.7.1776334805973;
        Thu, 16 Apr 2026 03:20:05 -0700 (PDT)
X-Received: by 2002:ac8:5a55:0:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50e2913a2f2mr14490761cf.7.1776334805541;
        Thu, 16 Apr 2026 03:20:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c2013sm147935866b.34.2026.04.16.03.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:20:04 -0700 (PDT)
Message-ID: <d50ae707-7382-4d9f-ac07-38cd9ac13293@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:20:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
To: Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 93bAw9wTCGb8OUJluG-4J956ukr19C9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX9XkjU9tZ5Qq6
 ecc7zT2vKR6+geT7uq5upd1jF+xCKSkm0c+OMdw6MLDseQzpRVzekglLSuWLEL8++QHt5vLR2j1
 DC+JNbWFD7OcD+e3Px+LF1qL+uk+oT7TLaRvW3oQJRP/oa5d7EFZlCsMPM9kt81cEAstwU6hid9
 qShlAuhcAY3SslTo9snvTH6F4rstAxAc3Lh4jKwmgWT74YApIzo4JvKov+H1p/sPimOypr5pYGt
 SEOuHzJ6awMgs+eS5CPHW5isFEtAtAyhyIC1SpOiusldQnFvCyr2isk/vXkjrbeiX84kW+8sUaK
 b38DZAyH1k1KA0R02fu2BLgj6hCwE9nuoyiKawuxc/J6b7neII8Q9Zx1BA6KuIw/FsHbZVcCLXh
 PqNN8WYJKOCwWQTst70WjWeh0VMYn3aRs44JlS2/h3eKKJCOsHpD/qms6svTR4kL6l5n4wszd7N
 dYZFwvE9xZgAJUnZHQA==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69e0b7d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6ofop3_kVoDNpCCVtgYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 93bAw9wTCGb8OUJluG-4J956ukr19C9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160097

On 4/16/26 11:40 AM, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 6fa5679c1a62..551df07e44c6 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,eliza-imem", "mmio-sram";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0x0 0x0 0x14680000 0x2c000>;
> +
> +			no-memory-wc;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pilreloc-sram@94c {

Since the node below has more than one dash, I'd expect this name
not to be squished too

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
