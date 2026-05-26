Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059123C9EE4
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781096; cv=none; b=XDbIpSofTzeU7vJevckcaPK9+A8fYSs1XHOBX9Eslphfom1o3FPYIBjMyxnlbraB/dwFV3ox92urv2J4OYl2bltCsvXA4A2HCx53CG6aZgdYSU/oExc9Rzks1ejZWo+roNnZD5WE3IKBdmqgkFAZfq+Vda0U9SnhLAfGzAhky8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781096; c=relaxed/simple;
	bh=hBg+nfSw2r2A6y/6VmD3zCK2r0ocJxNLv2H3B0R5g4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gr2opkDdF4pWs20Cb8kFdKTY7MY7aoOSA4ngMht6/UoCZxnZrrR570Xg8Y8uiA/CZJJeY3KgDC70nkgqK9aPpRb/7R8G/5FkuTRKsaU9rY22x1G6BdU7Glp3gPCE5xyamNAkIU7vg8P0RJjaMfVeJYuH2X9+FVPHdFt+MlA15+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8ml76sZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF64dob8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ml76sZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF64dob8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60gsu1763368
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=; b=b8ml76sZcbkt8hQK
	sDgUYRnbog/qCZlehjI5BwlEqoFY7FBELrWAMJz0XJWnGi+1y7DWVkrWqtFYP5EM
	rP6zRGNUIofUrzIS6wkJgFX7CTCQHG+bH/1XGGe1JELq+N6twYiDfZaKGym0i914
	y2g/o1z0LHi6aY3xw0bSYt30rNLcY00VNpsu/XyjT0hO/xqgtckti4GWPU6MM+G9
	7W3hq9uyKk1NvfKCd4L7AtsBHvgsHViOgxVUvWdmqmySq7S+vGb0hpJJoJZMbs21
	j/GKlUCPziPnXcQfkDiV9nBvDYVSqO702PPTuADi9XoWQH388lzGQuyvoLuGkpdb
	9fnryw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggbnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:38:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827bda2e60so5920372a12.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781092; x=1780385892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=;
        b=WF64dob8MVXSFoixJwqIyJdpDpkKI0r1gvWqZa6gZIxPikNKYbaZfJ7Krt3hJmzdl2
         dlUEeaBtxk+iT2TVffGmfPHr+Kav3KuWoETEpPnDWP9tHlwo9ozgrV3dd5jRy6Qoar5c
         x+UnMBNZuZTX1IDgPhnLBKcR0g+zKQ+UA6tDHx7NU3ceW/Q7vgxq66CjxxOBuRvUov/1
         xCuVmh+x9gGNxtDOX3ECNGdZUqvmfZRKdDvsOl2BxEbtsEhAkB9fThK2F0cgJK9xroRh
         HtQLiLuLDqjWgN/LDxeqsbL/E8anjTYQ36jOunAx66o0F2mnpCOb3O8tuD3MPu288+tD
         z8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781092; x=1780385892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKu262Sj1Vla6Ii3OWVDDKTfHAYx8gM0SgzGiCDXG9M=;
        b=q2/uNeeIyQuHTTSKQabr875RWDp+6bvPnOze8sVlA1XlmhU+JHzdVh6Yq383fOqHZ5
         7u8+u1KoBPHsniDmGVmDggvJvA5w6XAStrgLvDkflp5TIp0xnar1PWmqGjNi1+Kt/XBs
         /UsBH2cTNuJARROSLVV1uFwRmT9XxyRNxlrkSDxTOX5QqLTgzeYWmQYbEgiqG2kS307z
         QxCutlMp9hQ8UaEUxiNly+2M4UftgS6Jm8l7g8+wgHPmpwrsZVWm8NQCBFBaqEMH6bkI
         jSpWJYYN4Sp4/n78dGiXditAcKVeK0f1HvxfKScAwWNkuIHxDih0RUCO1yit+kqg8oGW
         /8zA==
X-Forwarded-Encrypted: i=1; AFNElJ+QAiItwHpxENC1mGt0vVd1NBXmML1Vh5nxglJ0qG4PG43hRZlPlo5HQoLvEaRCT/WX8RcinSvkS5Sb@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwwdWBWyF/8Qx2FQZnXjGiykDn4F+qqK4Ul4DxFSBB3DuTCZU
	jHWiBNy2FtNnve0DUcZqoXSdxjnHCy9FGjkVper3N+EuBax0gFM6GRZeJQDtFlQlCN/PSFJq1ag
	0tMBQpd2ngaiGd7mfS6hu31pswtonEKsIQrokRgpoIEU7lU2PqJHQU91cOy3lRxZKdxKLaHhD
X-Gm-Gg: Acq92OHtLrULtV9IC2FwfZieaaGMVqBTAYhFHc12HTxXnLnRTNGkK4m3UMYETNXIMhu
	bnvi1vYRS+xABefOb391Zvgjwh+hnYiIpSYAMPPdKEUv3cBcURsIjKYIgXbmV/jeg2OvFe/aiGX
	4pzQs2UfFTQkUggMwHdTYgGTVfNTiii+ReKQ3QWjzBLT/BijWinZ+3D9UZHk8Z4s54NqNFvMjFc
	xSBQtY5pQ6feUcBdYLTDd+YnIQafNA1op0pXVvpwrMjq0PphrRJoEtW7pG94bU08IkXn2RvDs7A
	BB1ioTJog8aAwd16pp/tyZHcmKRs8n0qo7SKBec2fWWSSXXElLq9iTftPteKgfVv4BxQ/NmITrx
	adYMGPhuOBALG/D/ck4UFNQGN6lhAGQpiogCPTn2qK7LXyL65cmepp6jqNuM=
X-Received: by 2002:a05:6a21:394c:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3b328f3adb3mr18196173637.38.1779781091823;
        Tue, 26 May 2026 00:38:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:394c:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3b328f3adb3mr18196142637.38.1779781091281;
        Tue, 26 May 2026 00:38:11 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b3867sm9294952a12.11.2026.05.26.00.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:38:10 -0700 (PDT)
Message-ID: <8d9f78d2-d414-4ffb-bdf2-e2e7bda73aaf@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:08:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a154de4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CbSWp4jS9IVN9doBrZEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 6Ey19n4zWf9857f_xjQ8YCZtr1Mgr8bi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX45josndU8ZJL
 3o2I/qy6O7ZPc2jJpegqEVBbsBr8XnQRxWUS0mflGauJSO+m+cxj5fXaWF4tp8+kEgMQx9QoNzU
 y+YbAmtqQ9coopFQKzL3bXm/pH1kvzTiUOgBEJjvzV6jBY27spgPSvDsjSCCi8idt7ILdFP1Qcv
 1mHliGdbL19JgMqwAw65HNKejQoEnp2pQ0o0ihddKkfEDwQ9Xx+QyLvx9oejE/NlMCYhm/6jUbb
 tV4nWFmTsnTdb7LCgx5QudK6z8jWcXSuG8YtGXU4RTIx8NG3XRWCkkMyw166my1JJnT66D3onTY
 +xiZRrw7+ITwRWK3zefSxDg2rrXTHvshJkewkD2jhMt025xj3YVl3Kas/kE4H7udpDqh1v/EtCf
 TlCY/3M+VJkGSgDY2DK75xzQYS60FKc1M5YWd2UFIfDn+/8tx9zEzLuIdZfzBM9I1mgng0BpUDZ
 isRS0/nWzzcIGzemtDQ==
X-Proofpoint-GUID: 6Ey19n4zWf9857f_xjQ8YCZtr1Mgr8bi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064



On 5/20/2026 3:29 PM, Konrad Dybcio wrote:
> On 5/19/26 9:05 PM, Vignesh Viswanathan wrote:
>> Add documentation for the CDSP Power Management driver, which handles
>> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
>> Power Mode (LPM) transitions via MPM handshake, and provides virtual
>> regulators for the remoteproc driver to control CDSP power rails.
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +maintainers:
>> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> +
>> +description:
>> +  The CDSP Power Management driver provides power management services for the
>> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
>> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
>> +  via MPM handshake, and provides virtual regulators that are consumed by the
>> +  CDSP remoteproc driver.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,cdsp-power
> 
> This really needs to be SoC-specific

Ack, will make it specific to ipq9650.

> 
>> +
>> +  reg:
>> +    items:
>> +      - description: MPM (Modem Power Manager) register region
>> +      - description: RSCC (RSC Configuration) register region
> 
> I was under the impression that these two belong to separate
> universes..

MPM registers are used to control the power mode for the CDSP.
RSCC region has RSCC_BR_EVENT register from where the APSS reads
which mode the CDSP wants to enter and executes the corresponding sequence
in the MPM.

> 
>> +  vdd-cx-supply:
>> +    description:
>> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
>> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.
> 
> I believe the second sentence is wholly redundant

Will drop this.

> 
> [...]
> 
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        cdsp_power: cdsp-power@4ae000 {
>> +            compatible = "qcom,cdsp-power";
>> +            reg = <0x0 0x004ae000 0x0 0x1000>,
> 
> MPM is a top-level peripheral, but this is a slice dedicated to the
> CDSP so maybe it'd pass, but..
> 
>> +                  <0x0 0x26018018 0x0 0x4>;
> 
> This is a single random register within the CDSP's register space, so
> we should definitely be able to describe this better..

Will document this more clearly in the next version.

Thanks,
Vignesh
> 
> Konrad

