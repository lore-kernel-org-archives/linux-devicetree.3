Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35CE395D86
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265724; cv=none; b=RenC98nlBArD7IleL9qkxMdGZWsukSfgdMVqZqLztxs7JCtsRTjzjztK+NghnN+ctgreKxXN/X3fR5JoBHhcO6FCvDMN6lFVWUmIGQAJc0k7bGCR8nJRJSJEH/5R6o5C1aG3w/9ba561f+KFrLslQsYAheIWo1p3bQVy1dt3P0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265724; c=relaxed/simple;
	bh=xDPmlMDXeL3lxfgUwJ6Kd1KI98MjSx2OU5F2knJ/FuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ua7RVq+EoEUx5mfOOg5ob/tEsHfIvYN+0mnf4FAxCQkYdV8Ta+yR6aAutsPoQpog3PNpmAiLY7j80rqUCxbydbg4zhkB+iMO1yRXyk+RB8+RrDa1TqLTiNXERRWT/hVBuswTddSwP1pjHNCpkqvn/iuffd/gWXm6BWFm6ATSE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7f0gmCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPg0MblB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7f0gmCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPg0MblB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBLuTV2758672
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=; b=o7f0gmCtH/CDJQer
	Uzu1ls1dWrprV1Eu0TfZoj0LGizNlvHpmGL0pRDGcQwqsNyBYPd9xJ89ATQPBBHJ
	jtu8gKZiU6IPqagOAWGFeoW/wir9KtD4c+pFqm/tm5BRRATdmp/93fkrRo+P96oE
	CyBAGXQ0hvZvMztGGqvEPyuniL1CEItyEnPQ7mlTddDvlcsM6cA5NxeH4ZfYbrf6
	NAVIc/ytCcc/ZyXr1p5o9d3RhrGesFi/DOsG8+WYBeqewTRLccaK1WAhjdSRpmkf
	Oh16AGtTQ1iUI48UuOS0WuUdCseAoYGKcN2pUN4ckpZqmpBSWhf/qzXil/NYdmwn
	1XlOcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4g1dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:35:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c4041so27230141cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265721; x=1774870521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=NPg0MblBoXrLKdLf2m6vQYDMJQcwRAWxjrs+uhSY6/AVkmRNd3qFHsxPNXdwaDtqQr
         4aut/qZN9/UwxMgOFkWgP0LptZFVTMELbXX6OEG87gbM5MQRhdy1ZD7oIk68NkODbZfl
         ZrtXmzMWqWEb65pZkEdkg6Pq7qs4QPCx0RO49+D1lWkxFRPKklehirHpEt7Ch9am+oHD
         Iwddy5VJK/c0/+VH0fIuXMUcb6JOFEptGoN9oIsF9CpWEFngDfEAt/NAVrU55MVx18Dl
         KpeqCv5GNzeh/GiBe7k2zbfTshfgDACpQojR70R9V7KKx9oNsdrepQpFf5zun9h6wCyD
         IMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265721; x=1774870521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wS5LtayeZTbWa+/jowDNFAN2aTZHLtBtVNHTSu7Goc=;
        b=HWgjgVLGwdtbGilKcHrvjDxRvr+TZdUkz9rEp0W4tZ7q88lFJNtOMzqvH8Me9V8ExZ
         jDeHhFRRqHtuRpwd7tvjH6d/kmnAy9opVgrAvpNmBZRSKa9sFmvb6VR9Agn2tW9ofj6b
         mtozqA3VkdrydBTDLz5/3YsT9na4G75IrWfAxI9ltrf442Zd4jS9GtZHoBdLyQLBdin+
         ycXxWKq1Fa0dtRSGRSDxH96xOTI0QLlVjMhXKmidZCOBkIfZipKz1ljsM1H5Y7eYIShO
         NsDdvk8AZ365EXSH25AW+2AB7xwaVuBUp7JwPsBV4LAPiM7rMiLgwj4YUH1tKnrk/rTL
         5vFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXucRTFJ7wjmJDyv4MDPfsHfzp7LxmslfHbwMFydtEtviyAkn56FrnciVXl8czJ8xTUCzbyhrJWiANH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+JvE5dddQHHYhiN2Pi+CGYQy5e5Ztsubv6FkTO0gJI4jE4D3
	1PIImcaZkW0EHnUEuXFLq7YddzAnNPLynOUayz7rbMeqt3GCdsfjiuOA1LEZvGAJSuUhv07Nrh7
	Yd2QbkA+wryt6+3qG1mhszTDOkDV5hktNrb/qWx8AVrs/iFENCn/51xwNZs0ec+DT
X-Gm-Gg: ATEYQzyTyQh9IycftsVWN/HUZiLOsrGjZ7olb9jSkIgx5IoZ5Ed0uBFtxpab7G0f+zQ
	/HyspJ0YaCW2C3yma/YZvX4SmQk49woOd99QGaH6raf3KaRqrcl1TMbXcttUmemJ8TBZ19h5a76
	SKVCROMjmosBuHq2WnImQkhiwdC44b+EPQDDj/g2gwZEjw0lQX60tkAnNAyXbkPfGoPhScl+pXD
	/8eEQtEcUewiTvA+US71eh9ftt3KOOi3Iz9IAkY6ndwyEr2+Z7sgnQUuWcyHpwndGkwfYUAdYfI
	IONdbRUmUWYW3DIujqjrOMdszIqQyx/FduRQy66UodVzKDA74CCjEgSOGa8+cTVBBqbnM2ukh51
	67MAC1lnDU8eVQ+28FU+lq2QNqykIkavPFQ2NAQoX3nUnLo2qxiW3pAoh2MgQoO8Zg+6m1sS77e
	m/ISc=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775561cf.1.1774265721260;
        Mon, 23 Mar 2026 04:35:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr3775111cf.1.1774265720584;
        Mon, 23 Mar 2026 04:35:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm2208073a12.31.2026.03.23.04.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:35:18 -0700 (PDT)
Message-ID: <75c80dae-1ee5-43c3-8d72-bf239fd51fb8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:35:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 1/2] arm64: dts: qcom: sdm845-oneplus: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
 <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l6WcXb3G1wLuznU6zN3gvrj0Z0Pb87Lp
X-Proofpoint-ORIG-GUID: l6WcXb3G1wLuznU6zN3gvrj0Z0Pb87Lp
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1257a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=o4zcOJKZs6uzFkhwQ20A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfX4gOIRg/fTde6
 9TWZrGB5s6j5giAU4zIz1KGuSbnMfu86E1hn73hP5Jtswr/Flq3KP5PvPx1gT7G65maPBcFfKta
 O+F13dQsFp4+t8UHdV8FEbqT1m31P4mF+fAQFf7cM+F4HpruadyHjpdjO9OeFACqltkL3QFq5x9
 c/87zYB42lxOh/l5vL7LP+j/S03ducQijiXHhVk+oUiW5VH0INHfaq/WHQpnGpDFqrRqqpcQJRa
 +yyZbtaZBmGPEedTn/AY8G1YmYuLextktRBp3EdbBjsrAJFfjaR/h5GHm7kIhKq2XFNMXO3ZSCP
 SdIKQyerhScM7qC0QR+dmSeRK73j/39hVixb3G/iB2VQx2gdnEbaWzotroh6gK2p7DKKZGWRxAH
 EROsTuiqDDRh8L3X7w+5awypEqG3SM13wXhndYLI2TGpwiftv5ChNybeGXMRR6ZZjW/UnUocIfi
 IO9/8Prj2WrpRC+zsnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> From: biemster <l.j.beemster@gmail.com>
> 
> Definition of the NFC.
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5b121ea5520f5..34f476299b114 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -392,6 +392,26 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <63 IRQ_TYPE_EDGE_RISING>;

interrupts-extended, please

Konrad

