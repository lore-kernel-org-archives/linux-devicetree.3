Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACB53BB675
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170139; cv=none; b=YnY070PliJo0mf4iYgvKr2CKZHFwwF/HjSgm58YtfZsuRNFV1JQ4os6wosnYi8LX1BcVlyLTKWAFoAe5Z3eJWBtx4RGtcBQ3NX8IIcpzaxnUjmW1QuXJOrivEmWQJ0R1DymwU9ghBV1tomZ0m2Bc+J+7qWXt8GzsRR92hdWwqtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170139; c=relaxed/simple;
	bh=x6+jKILjK7229wcbrxzpoPjIev8YFpI5kvKmWkbwxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QotP5WenGGNjSFPFP3zkhJ/Zer4u6BRwkZLzCzIi6G/CfR/UOkEYE/OPuvs7PxkcD9dx0ed38Slg1+uPg6ZJ1Z52Ipm16s/kkqAG7HOrLXHYoNmVlPadpTgDA86eNFxpTjlV4LcL3xa9aAK6+tMdivQT2R94xzPUKKJguObeNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fmpn5dCi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTpz/CLJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fmpn5dCi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTpz/CLJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GCU83843632
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=; b=Fmpn5dCiSJUb7/j3
	GLKWuhZv5RaUphIClKik8k9fq/iPjzyvv5VQeDx+zwLPT+sRzNS510miHSclFlY3
	iiPhepYnPSSHfd8b1L2RXYdHrP5GJG68nK/B3sl9vkNra29EeNxFumIY1BQJP7+s
	9O45KypGz234m97muKCrO/Czd7yDImWQb0k5Swj6x7AhkN60xqndhF7G3/iWUL3D
	dRrzgyWj4Q/bYBFTWa9liSUFjCvdLdwaeHqL+q7P8LsW3CShtZTwxLWzpkaPzWkL
	PbYIy81pVCYc4vqNV7jIcYpLScSwIQRPwTeITPruBt8aWqaeuoZfoZNeLlOBvsbg
	G9Zlcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702pk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:28:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517865e6219so16828841cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170136; x=1781774936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=;
        b=QTpz/CLJ6t6sSTzupMD5jwIuylxYQA4XhpjNO40uX+YhsqkGsX/lMM8qzEyqdUeWWP
         mWtpgPGOH9UcqaIKe/F1shO4HmO16pKw0bTZoKo3wMP21lwBv4aGpAJCPUUuP0JKVMyN
         XcXXwGAwHVqm4xZ4iqlMXGybxtKR2MdPcMB1m162OBjNY5Ie79SPF/9YIbbQlq/5jVSM
         B7nDzX9nUJuUN8wG4Kn+Dg6mmKvQPW3cQ6UyjA43esAyQy+i+LjhCjaxvqnfQxwAvcQ3
         UgeDSLc2tvGQheN8GJjo9vcKk4woXVhh72KTQV+6KFJ2Rg0TyeIOdGgFXsr2ldX5tQ8O
         ztoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170136; x=1781774936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i59erlsAEhkl2f7C93uZEg3Bx6hEc0sBg/VLkFUgp2w=;
        b=fZzMOt2gWtnjV1DMxkZBzzyMUxiGzA9SNywkgeOPCjDEGD0arjnFxgM10JyxCSFFVs
         shYt0/4kwr7q+cWR/MBWf3uAN1/I0FCV77brseXDAC6id2HUJHo1d+OT/6l2nF7gwct8
         et/cItX1UPVvdx7wpuSlRCBpxZBaGqE0+7Zedn7z4A0iH6+30wIpuFkB0j/eBInImTJB
         XiLA9+wa5mqOzDjs7i/44Nt9S/jwXiEVtuq/DePyX4240IA/dJBd2soipYIxIsWQNvRx
         dhhFCGJRlGokfD+82QqVLE6rR8JSBAmYjbB0mDw2CcG8brSUA8KWp2bHAubI6yw2c3Lu
         0ImQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zJZlEBsIMGAEW8srXvffK87mx5oPA9aZo/p2ii/7DbwV3ipuOgDVRk+BD7QwSDzMquIF7c1EzXz+l@vger.kernel.org
X-Gm-Message-State: AOJu0YxcOruw/P/3utKpvZDgpXiJFnLQE6Pn5m8o6Bq28SY7rU3hzmmf
	NMx9TKQc/Xt+2vRQy17Q4E1Nx0omiQK0oTWiSgODlB8/QqFaoAAf3d6LBhlQRK2XyoCLx4Pn+8S
	Xv4uShZ77GxxMmR0lPp0iUG4+hpWA7skT3ZwKw9yaPV5MlxVrJbI2xNgz6HfLwrCf
X-Gm-Gg: Acq92OGwRdbOZoJDiUIUVctXvyE+bhAvQw4KY0Q+ys4LT8YyhvPQWB4KA583XyQ8bF4
	6rLsBjX8iFavK5S9Yf40GWjc08UTmBWKke34rFBMZfczdVYwqQUU5cJOD6r/UK9a2TjxJWA3NJ6
	3sM21SRv2DSh3uuSJqKYDNa7m7U8p+zQJJJ8iFgDQFon6MaWUd+u9x824Shl/WZH1weObBsQaRv
	msSHmyyV2087Ksnt5gY2fDmObrmQCom/BQ/CuB0w0lTa0vk6wGqoDBn8SZIH0unwyphbH0JwJzx
	Ukb2ouV6thtBm7kkUNM1+zOvH0x2aYggIDZ7wZ4tHWczhTn9z5qcyuhtbz9FlAo/9OfbdkiYU//
	T6rwIeUCRyRGQe6Iu3yW71PEu+1wCNVsxmvWiDqly/cyxVsOi+vU75Elw
X-Received: by 2002:a05:622a:1345:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517edcdb280mr19757471cf.2.1781170136428;
        Thu, 11 Jun 2026 02:28:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517edcdb280mr19757181cf.2.1781170136034;
        Thu, 11 Jun 2026 02:28:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b4d988sm10681864a12.25.2026.06.11.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:28:55 -0700 (PDT)
Message-ID: <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:28:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vmlrzLc2Y-6_uScehQjR2tRc6FMEBN0Y
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a7fd9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K0v4n-E2pzIAJ4eIQLoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NCBTYWx0ZWRfX64gft8yL44aW
 lWvZIMO8Z8y4qjVKp5UnWJWPB31H0TU8IZXEWZm9bT5bfARK0coDazrhIa2Ha2SftGvHgaS1mLg
 6kfh+XXBZC1PyVuyrNzsfPeZeBeThvHDk24oBz+ezLCE1vZaxcGFYsPbvjInEjGcyzzg301uQoW
 PYommwa34AcSwVT+QUx14wE0e1NMLT9XMsbZ2AUbl/0WuaiN0PsGnt1oeL25Pf9qZ1/oxtgBP1e
 qLkwr1xhQcZ5keRAW9pnONcXrcvBr/y5sxJfu75wGdDB6Jh8NHKfdaIU26fsKvJ0P6G8Q7rfCk7
 WDjLOcbAo4Hr5eH0fNQF/T2th6gY9XuVzQBh/dNpfMCHRzmtg/fNv5P54/qpVJVYbgDMxKypHCE
 /hvMulPufi86AL2KltQgTxYr1HaPM1Z6tlGa9rXiU3HCVXWgLh9uqu7ie3AE7SCoW/pEH+DgdVv
 vD4JEYqh0HiAuAg1LZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NCBTYWx0ZWRfX5Y1Hl0EiYR41
 CEDpjsUwVBFbXpUqAxpJIWk2IBK9NlQgICoCVUacIBQNHbRpttr6Esrx72YwpbpEC15O2Z8b1o5
 h9ZRrQEluNc31ddIC91Y/R1MkTaMaX0=
X-Proofpoint-ORIG-GUID: vmlrzLc2Y-6_uScehQjR2tRc6FMEBN0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110094

On 5/19/26 3:14 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
> on Mahua device.

Another good explanation is that it simply doesn't exist there!

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]


> +	tpdm-cdsp-llm {

Nodes without a unit address should be sorted alphabetically

> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;

Do these other TPDMs not have the "DSB element" as the driver
calls it?

> +
> +		out-ports {
> +			port {
> +				cdsp_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				cdsp_llm2_tpdm_out: endpoint {
> +					remote-endpoint = <&cdsp_tpda_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-cdsp-cmsr {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +		qcom,dsb-element-bits = <32>;

Some nodes have a \n between compatible and other properties, some don't
Please unify the style (fwiw I prefer the one with a \n)

> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83

Please rebase, doesn't apply on next-20260610

Konrad
