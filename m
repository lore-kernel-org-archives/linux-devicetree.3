Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7F379981
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781765; cv=none; b=B4R5gB729eJHelDf9A9svWWeIvoeMu/ZAeur5buemLxZ/4jiy0rTVC2/HgZo7VJiqOUFuVgOwy3r3/j0wy6FhKgXJQqckQ4bc3WnJ8SazNVKjhvCVtLVmTJYPe3SMJy2JMjCa9DknRbYO2xBu8ItakosJFwTS0LUniCJmcWRzms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781765; c=relaxed/simple;
	bh=dgyik6Nac5Zyj4S60k8sYpqDxz8bAfLXVWeCZ5FZtuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kn5UlEkKUVRHu/6/dlgAgUwOwbyz36SBYsvTlDITvmUMDRNCMZmrbXU7R2SC0/MeYU9SRK4pS6LNoU6/tkQKylKR6WiWlg81f9B4mWyT2NUf2KhixgkTCsgn/4PpAVqpBF1BZyPv6oH96swLedcwU2a2/vyjPgdXXyNpS5XuLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+EDbxL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtVPzkVd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+EDbxL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtVPzkVd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q7eXAX692844
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=; b=Z+EDbxL3/aqPqMSH
	cOWTz8l6A/WYDW2/T5LOyzOondOOUAkySONvwI/TyrTf1c+Qu4eumtKRAv2BnnNl
	qn/rRGdSHrDVTbOtrFBBD/l81xj93bvhvSoU5/Syjo/3fFp1kzYn7Zhp6MKiysWZ
	Wvc0+1YBpYzNQR9US1OoEfkOFyZalm/Va+aqnq0P2hMV8QiPVTyytvNah12DOZLq
	53ydDWwVZhgTwu6kH8Nx8GTk+2CHpi4gNNdk/kxwFl3Kdc0wLZxDYcCigqQMlno8
	NWLAqyHaTCmLJN57iXcFZtUgDW+tFqktDx7BL8iMMV2XaC0DXbCCi8A6tyfgFltG
	IoCBHQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jys7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827c880e39so5090222a12.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781762; x=1780386562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=;
        b=EtVPzkVdkjHqJZcL9bbF28omAGA53HbhNP0yPnkA/zmHd6Eb3LdPt1cxaWyO9slGBz
         2uPSrcyFWle29P+SLOnFzp24+IO9Lirvniu0VC19NoFmGRExzuU5y8FXYU/ew3b8S9uh
         gt9HhVT1Ws14jlNRjAeZyK+WNSoDSI1Z+j7B5TEjAhDXpX3H03631l0V2s3YXxm1Z7KP
         GyBRr0MZVhNVEbz+Uge8swf0U4IdKVpJ9SDN0NX1Y05JGhTBs8U8Dg+kTLAyG+ZHuXbB
         GmZ7DPGihbEep6pZqgJJvRXagv3zGQDpQefmbz7Qx5psskKeYd9vTAslvEjgigShi/ui
         xZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781762; x=1780386562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kT6gUPSm5gmyxHVjKc8NRVnk6e5Qpk1xp4p4yJsGQls=;
        b=gYmOgWDHGL1GKWmKOzFLwpR0Wf3vyslx2ZujmI42hBD0qJMbmuF/EyHUqmKj82lB+F
         w20w9qg/fO0r501Zm5VAVzwG++5huP7o8VCWoRkxA1RMANfWOwk3r7DlKCqTfxjBnd3b
         dBBJEOctkU9V8obV8Ad3qb7/o+/+TT+6EP5nAF86WhmWeO85/VXeq+om4yTJNCoMkED5
         9oHoux4Fsej46xtrbpLN3A10Ou1T+QJMcP0tZgH8eXAUVvsgkXwKpRxDAEtYlLKAOKUf
         QmtdCl1NmecZ/GROPbZUIJ1IMmH0si7sjvHnaXNlYRRAECThJu7y00v57eIg7v1AYOFn
         5MEg==
X-Forwarded-Encrypted: i=1; AFNElJ9vaQGjU65NDspXjt2arSbrIIwHvqqfW0Hv6u/7/P5IWqIFkmGSCOBDOiX8ZHNQdSVZY1s8UpT3fJkb@vger.kernel.org
X-Gm-Message-State: AOJu0YwD7wB0Mb1pVxG4SAIoHCsj8a1hcPd7fZ3cI7mTm6pMdn5Rv4EA
	Lmo7/pxUeyAXIYYFF/fzwGON6NEHahJlUWaMWUFJARjqR5mT95on/2lYch7OJhgtseR7JX/qSVS
	hqJfJL3hwGcGCd2kvQgD1ZJMot6FYGQb8LFgByaOBoF0y7Egzg7dyfNxLuISVyyff
X-Gm-Gg: Acq92OGrXZNIa9WkB9Au+C0Sr7NRHVm+CyUK103mrLAcSiihe49iFLikw3jkb97RAl4
	rRGMvkOMeJT7tSqjFVW3mgtVbCWSTBzkmhjsSIZTvBuA62Npp6JTC9Y14RbzbbwZvQwrPvuzJE3
	Pbk1JDCEUUiRHQWCgZyEm18LE3TqVI3wxUGPVaA+zdud/C8XN+y74wH6IHN7UaVHEedQo3WFt08
	Z4bKj0AA3lzibmLfxI+eM2wKUKDrdqPCS7mMPV7piW5Nr4Z5SFA+AmYKMmGSnX5A0hnjz5/P52C
	t7D+h9sXt3H6K/E7vSMn/hldWH8/MJ3MtGU0k4lefwSxnSBtjSxuO8/tIIDe9Ai0MWbtCT/fqyP
	C70tJiWObTiWQgMnd2gw5BgcKU3cCblCgqZUi9YGKhSXgTsriFxN0CeIX4oRROWwVyFe5BQ==
X-Received: by 2002:a05:6a00:6c8e:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8415f5a63f9mr17116177b3a.30.1779781762247;
        Tue, 26 May 2026 00:49:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c8e:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8415f5a63f9mr17116150b3a.30.1779781761773;
        Tue, 26 May 2026 00:49:21 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm11934235b3a.41.2026.05.26.00.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:49:21 -0700 (PDT)
Message-ID: <75a9fec5-20b2-496f-a365-2b1201fcbd60@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:19:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CDSP Power Manangement Driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-precious-notorious-hyena-7ba95b@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-precious-notorious-hyena-7ba95b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YueWXF396KM_sHzT7aOKIqKKwRFTo3nI
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a155083 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uzc-zwSIlv-cvvK2V8IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YueWXF396KM_sHzT7aOKIqKKwRFTo3nI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfXzpJF+Xso43bI
 Mj66Y2ulzjEsW6nmJ5gh1zJjtx4aRiRbYYs8YBXB3aa+0HN+wIzRlSJe+aGMRol8Hv0H9a9KPTK
 stQD0MG5Ce9ZSCGoFTs7QzFulBIsSnYUTMZ4zleXZcApRwSRNyHUxi2buTh2/0We3A00m+7y03I
 3JGNZnV82FrWxz1jPWzCKOgfXrCynbDQnielOb9wndj1kn5aoGOGK+Qp8lvth15p+OptqqKhI7H
 FsvmJy2Oi2vaSg98wzOWwyrlGh7ogEumYdSTkm+m8jC4c78p3oDwcXjj6dF2JyC3RD5FkA+EYXs
 01K6tqFapwU2tEhte4hUDbNr0JDtIuf6eV0kFGum9T0nKRWzU3MTnuyB59eEdtQm7PKSWVT52sr
 1r1O9ggMzKJH0EgNaTlc7g281HYeCBTEqzkV/rQiVWcWbGAGlC8G9qUa0FSADuoy/ttSPIbM0zG
 GWbsiXCnghBFy+vNqsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260067



On 5/20/2026 4:14 PM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 12:35:08AM +0530, Vignesh Viswanathan wrote:
>> On platforms like IPQ9650, the CDSP subsystem cannot manage its own power
>> rails and requires the APSS to handle power management on its behalf. Add a
>> platform driver to fulfill this role.
>>
>> Handle LPM (Low Power Mode) by executing hardware isolation and restoration
>> sequences via MPM register programming, coordinated with the NSP Q6 through
>> a handshake protocol. Support both FULL_PC (CX+MX collapse) and LONG_APCR
>> (CX-only) modes, detected dynamically at runtime.
>>
>> Handle DCVS (Dynamic Clock and Voltage Scaling) requests from the NSP Q6
>> received via a shared SMEM channel. Apply voltages via the regulator
>> framework and write responses back to SMEM.
>>
>> Expose virtual cdsp-vdd-cx and cdsp-vdd-mx regulators so that the PAS
>> remoteproc driver can control the NSP power rails through the standard
>> regulator framework.
>>
>> This driver functionally depends on [1] for bringing up the CDSP on
>> IPQ9650, but there is no compile time dependency.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
>>
>> ---
>> Praveenkumar I (1):
>>       soc: qcom: Add CDSP power management driver
> 
> Power management drivers CANNOT go to drivers/soc.

Ack.

> 
>>
>> Vignesh Viswanathan (1):
>>       dt-bindings: soc: qcom: Document CDSP Power Management
> 
> Neither to bindings soc.

Ack, As per Bjorn's review, this CDSP power management driver + standard PAS
driver will be a non-standard implementation and I'm looking at moving this
into a new remoteproc driver. Will address in next version.

Thanks,
Vignesh

> 
> Best regards,
> Krzysztof
> 

