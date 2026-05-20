Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6D3B38AA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271156; cv=none; b=EJJV6W/PIWQ24vbHF0g1+BKuZYC0Ypug5PtRHakmRyRNv55HQav52THPoQtM0S9W2Hn3ClshZunDDZarkUhVbm35Py8/M9/JOiLMkpDv4dy9ExCS8maAN/9Cm2zO5/HyYLWh7WDl6pn0YVP+tJUhjhAXgOevrQ5sFe7w/fxnmqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271156; c=relaxed/simple;
	bh=l9HvU/DVijk97NHpwl1aTz9bBNRUApT99CO5CbwcKEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlYbM2GphOX0ZtppWVWNv5Bcs3I/IJJhtMvRDEyTQEukzRkfk9I6/z7BEfA9Y/ChDxIvHRXIR/GCTROJCzLIdsm1h+MrqGUs3AQiayiBrBzOrRIgGL36izJ75DjE70koVDJInAYfHpjnYEVQUL9bQ9iAcka168wFSmsIE8sKCEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F04FTaOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2edcI3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F04FTaOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2edcI3M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nm23447958
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=; b=F04FTaOU0agfylrK
	lIW2hpN+9kQ8w4zIusw41jMTU8qAX4dNXmYoqHMmhVE0f1U5azTNpBFHiWf7Tog2
	64es+wbmVNKvYEw5Xc6XUKX6nMUty40Xs/AUTIDzo7zsIeUSHLCRSbp1/6hLOPZw
	i5FOp6FCAhoOmOYAAFChD+4GBopMMQsGMOszrBvc2cLwxCR0cO/XxWwsUZFBaks0
	//j3Oe59CJ898iOagZxKFVuGTgBOmXFO8PDliGXH5qrYumzpdotvX5XbNV6KoAgC
	BcET1m0eovAWpmqcvI0QR5Xam+mkrL1YNbFugIaPDaBJRxfK0QOiVWGK0jp2l0IY
	GrB31A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg142-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:59:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e429ba4dfso13252901cf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271153; x=1779875953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=;
        b=N2edcI3MJ7C9mbRIjatfUdAlxLrarVQH86oxzgh73Yfr0vdJSC0zy5v6Wk9v8MpK2e
         Q4Tyq3yqqP2tVWBnLt+M7zbd0tlqweQKmZVFkQ0oxcBnrw304eUtyZ1BZ3ohybNCGDUH
         SdMExqhGFsFzQLz+5AJbAM+rbwoEokTpSWf3XKIkmx00bWEHaUip7N1j382J3WnoKCRU
         Uv8n/leJ2rELWCkXaMMznnGxufUiAFn5r0HUeNwsOVFVeDugAEh5c6wFVxmZ57tmQNL9
         9cGbY8A7djCc3PPhvxH8gKVXvWloPkmwOm8hdKdGXjkaV/SDwQF0kioH6lUTRJ83sptW
         wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271153; x=1779875953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=;
        b=UTbeKl3XnCAtHOqGEkKvZ4DFjvj53V8v30/2gw5Jhi94J4x+PTz7wjVaDmzUrliCIo
         v83S5Xux5fmk9Q9QNK9nhF/87WX5JrDqp9d4dYYT7O4NK+kuSMckG/mjebj1MuqZuugx
         yim+lcC9y6xILlNHszTqX12+AHLLqMr4Tz4PIJhT1GuxfOVGjjQJgt8C4PEP2jElXt4a
         5DcIalZklX1dhVaHcCcW3x0s+WkAIC4p9YS5NUnBTelwC7VZeAFqY3R0gozBYN3FzML/
         1OfA8AR7b/ikN3tpOJ8VORwC9Ke4sireh91NhCF/S/HKc2yXi4mpHZdUY0UYlwKQDAW0
         RRfw==
X-Forwarded-Encrypted: i=1; AFNElJ+8tNcNUFh0yokC7vnp6e0x8ww7e98j0bbU3nX4uGT0zeAgKsUjR/8JG47VkT0C0Ki3dnrKdGI5KIbB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4OmZ8HDdtvywI8sDucUN1fAZZ3NuA5+kYitqulNSgoHyWiHRs
	ztL0Kux0gAmwW3VGItvpYOcI+qNQVUWMfwgkuVR64u0W3SJ5ZG4nmHHosPZjLETLpp8KcPpL5Jw
	inUVZOwft7fFxC9RvlUz2lfHSZP8Vs22NKpiDObMC5tfMv+LlydFpwXDCOZuY/FMY
X-Gm-Gg: Acq92OEuagtjo6gxaDlI5jgeLL2HbhKwUGN92ZFP5i835x+QwqoJiXdjaw9ADCJAFbG
	ln2bW3nlvpWZ5DZMeplewW/Ccuefbj50dDSQWlHMrFOxUs0mIXcx6DH7QTUbfxd02izbpdwSzrx
	UI2hk8htR1CjGxh9DopcymQmYCC9uxVCHq+/CwGGmsGVEE5ElKuV2u3o3jC6ipYW+GdepkueSf4
	/mCFVcG290N/1wXXvECAUKD1xdN1xCpEg5epVXuavFqyJdOglaOOFAFnfDJ1gpTFpmB9jH/m/Bc
	okDPf312G95f+CcGUIUo+A7qdENCvGWcBGXq1fiXySYWrDR9XftR8DUsiSX986wIwpG7ra96V4j
	mfxmxcFJ4GcBG+1Z+pOLUN2U73scE9NCgUBjGqvOXDRaq9ZwbsAXQrWB3nqwyzHK6xyjMDIIGV1
	7CFzk=
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr223272931cf.3.1779271153569;
        Wed, 20 May 2026 02:59:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr223272671cf.3.1779271153029;
        Wed, 20 May 2026 02:59:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58df1sm7847371a12.13.2026.05.20.02.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:59:11 -0700 (PDT)
Message-ID: <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:59:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7p_bgwY0y_nPNjNe2ma7Zk2m1y8YRhst
X-Proofpoint-ORIG-GUID: 7p_bgwY0y_nPNjNe2ma7Zk2m1y8YRhst
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d85f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=b5dwZOq_2XybwdJL-ncA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NSBTYWx0ZWRfX4OAys+9UrjSG
 JA40eIzMXYHHCbHVhQfh8QLL5S3whDxqCCBOPAfg/MY6tRBRibwyW6MDnA4SRy40/xfJYrrddAD
 Mlz9pWanNCQQvUlTFtXrPqV6jO5UM3Z4vVedkbcRR9b56sYvqgsqn3O+7ONctC9EIsxbn8vAxOV
 W2890WabJ/W6VifYia0gHqZxZJAR+P/SdttLD/l7NrQ6aWQxtPOWJl06F2KJExQ5bEegB3I+a/h
 uhvXhI/TTjIh3vw1q66kHfMyhpIl0n+TowQN/AHUo+w3L46GgjyqZIRRlkqhuPLuDC4vtwxo4A6
 Ry46XYe1DXteiTW9Ok0xpzCp6tAW2Ht6bPkvloCALazy5rmJvVxL0DUHPEUUJ4P1853/9bc9vx0
 j/b3p6gTQaoR0P2YIQxQyUgLBujqBSTGG5sznF4n8O2DJduIUI+0JXBnLDfjhr0+JYYaZnTsgN9
 0u2z3Xy6h0yXeqVWoiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200095

On 5/19/26 9:05 PM, Vignesh Viswanathan wrote:
> Add documentation for the CDSP Power Management driver, which handles
> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
> Power Mode (LPM) transitions via MPM handshake, and provides virtual
> regulators for the remoteproc driver to control CDSP power rails.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---

[...]

> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  The CDSP Power Management driver provides power management services for the
> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
> +  via MPM handshake, and provides virtual regulators that are consumed by the
> +  CDSP remoteproc driver.
> +
> +properties:
> +  compatible:
> +    const: qcom,cdsp-power

This really needs to be SoC-specific

> +
> +  reg:
> +    items:
> +      - description: MPM (Modem Power Manager) register region
> +      - description: RSCC (RSC Configuration) register region

I was under the impression that these two belong to separate
universes..

> +  vdd-cx-supply:
> +    description:
> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.

I believe the second sentence is wholly redundant

[...]

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        cdsp_power: cdsp-power@4ae000 {
> +            compatible = "qcom,cdsp-power";
> +            reg = <0x0 0x004ae000 0x0 0x1000>,

MPM is a top-level peripheral, but this is a slice dedicated to the
CDSP so maybe it'd pass, but..

> +                  <0x0 0x26018018 0x0 0x4>;

This is a single random register within the CDSP's register space, so
we should definitely be able to describe this better..

Konrad
