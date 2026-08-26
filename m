Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3743B6C08
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735472; cv=none; b=d7n29Hs/PYRmJzytCihcLRL/qH/bzZK0Fr5C4cVej2+pQ7pww5TGQ41lJMIIgOrBR5mH1F6uJAyWK6UJfn6YnZH4uzd5kXd0Yba//Jwiw9sMrtsPJIv2Q0b6mdxsuULYEnZ3rZ9QqzSxgW4JC76iAzKJQCXyvWeE+CNjUdwcPl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735472; c=relaxed/simple;
	bh=2Uo4KFY5LgZJU0hGjjTTnHGiXoFPb2e6vhQ+kK8Xv6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUzm5RhwmAET6MGXM1CcztyrSaCzpmNdLn5WMg8C/v6SIDp2TKy/JiZFVbz9gaemve6vay0oNsoxayfwF/9APvxW6GZeFEmDdobvhxCkvgZ+K+cIfd2WNhv23hHVMs40Tv9Sfu2jsHgGze/eeB2cG8/xlh4h7HBPPXcpQaybZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSrmyoVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILD1brgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSrmyoVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILD1brgl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RloK683492
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=; b=TSrmyoVsGP//TNCU
	eMEw0flt4lH5B2HZdBQwcYaw7tzExOdr0nglH0WjOnIfXGBGMrLkZlKeChnOVRIy
	ovyu6ZEUWLP7+VdwYl1sEI/ILKI1wbhpW86adBtFj+SHrU/phV86Xrsq3NuUhHJE
	tmIQX5uPcpHUsbrDeGs2wQOPf0doA1JhZFsrR9AQEj0s3UlP+81I6pzHXbByLA2K
	VAgRnI8YWywkmniq6W5jbKsjX1t6HhM2ShFrJhSf1UkvE43ps2Be7l4jKcMGanaG
	VgsD0bs8cNr/nTpSQ8fsNPnQO3h3e7AaocmIYPSQhw4DUwqc6pZxxd99FWZPbUAf
	lM3D0w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxk491-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:11:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso1597886d6.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735469; x=1788340269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=;
        b=ILD1brglRgnU2UgPQObR872Pzr6UumR9PWzSJQn0UFqDFIy3Rvv5kUmOYLK2598yHx
         AFviNdPZauiqA771SmoZgaIGVMXiFtsIsq2w+VO8JW40wBmcnrX3n8Bo/CYSYqAX//IR
         CcAKeq9p2aHhi7uoBahGODnQJRdF/JyIAoY0rKik0CNxbevTL+7mQpQ5GSliXt7j6cP5
         Wvfus6e+Ub73dw47nUDnhfUwts6YvDhH9u9BUZimojfoYUIsmALTUPwO8Syy/8KzLz4N
         vCNZYFQQEPyTDlQEvAjoScYezj4Q7N9mnyt1Ku0zoHKpuOS161aNIhOWnPTDMBKHM2UC
         EE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735469; x=1788340269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddAsuImZipDImmWt3HzNXTcYStnvmM3SWFX8+qbAOps=;
        b=YXmJIGdgVIHnCjAEeo2mYzC7Tm7j1qfsjJgQN3p2Rlb/3aWeORHG3LO8PxSX2idGli
         lTmYcTQK7kxEdyg1k+kzvvMsvGwhziJfHXffW+yQlWp2JF1U9O4Dx0/w2hIZ5Zy5m0t9
         CWCPXNJW+zmr2yIXqsBWOxD9Gfi8M3pKN478slfX21XxmGmJQqNb9OsWsXtaCQ1xGdeb
         vj//FLAAq6P1MYhmnSkO13GeCjpMecW9zRdwGhVakwQDJbT5rqmFdVgrIk81N35rkARv
         U6qPTA9HsfXiR2BV1LysGOSaaSzDDx59cLECckpycwMctCpsi27rSEG8yYhEuuQetg7J
         Bi/g==
X-Forwarded-Encrypted: i=1; AHgh+RpiQODMWg70sBqd75NlbbN0fvl8wpNvMJXYjedYOxlLoj4pGAbFUQT2LKfuK9WAN/EMfcSx54AWzINT@vger.kernel.org
X-Gm-Message-State: AFuF++mNLg62Gj28XXosyJ9xf4cvIiATaqT0ZFgNCmQl+5LyWOUDSlUX
	eq+bT8JeLYjgKnm1IXMQ4noTzKtIH2+ENSeyWFwcJorwOWOcw+vCIN8n2LRVRUCmXLcVDPwHtTD
	cc4rTAMzc076fkXYDiG5/zTm96rdSqshX/oMky2vueJg9cbBDTtgkeFAGzDdpTuYQ
X-Gm-Gg: AR+sD10P5DuFOKHZ+vD8I3IIyBUITpgH1vp7LDfaHFO1ZxLbtFA6TWcgzW9qy+xiRb3
	WmPnZSNoxcrDERyOQbut7u9AiWotn1Kl9Fe04wksU1o23dIBkz4pYHkz6U2MYn/jAUCicM1HNfS
	5oWHqEs7bMsuqgpNNlUSVBmSA+Z0M6Zq7JwBlclLMXTTYUE83WrA3xkiN0zkAnHzNVPnjtjPn6c
	xeOa9K+cr5DSAaKpHRpSj+AXZnkIeYXjF+tO0IXK5wCAJ9cVEQHZCmRH1Yra6qxJ5UQGqoCsFS3
	Mo8C8OIiQw1fXCAM2wkyYZTfpt9Udb5t0PCdpwnumybcoQkAt6fAxFwJM3bgl0Ub+0tI3m1ACeE
	Gp5xAtcuRLVFm+qbRY85G5MMp
X-Received: by 2002:a05:622a:14d0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52e422b1826mr29104391cf.2.1787735469427;
        Wed, 26 Aug 2026 02:11:09 -0700 (PDT)
X-Received: by 2002:a05:622a:14d0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52e422b1826mr29104141cf.2.1787735468878;
        Wed, 26 Aug 2026 02:11:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1c80sm2752190a12.10.2026.08.26.02.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:11:06 -0700 (PDT)
Message-ID: <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:11:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8eadae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _IfT17K1OW8DbADf8AxOAl2HtylO9sTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX3wxvDawV9RX2
 R/UNitXHXoq56KNBaB3MwPCU1xQOsipyuM3Ms7TPkmVB0WsftReogi+st0kl0PuUCoGGROmMWVe
 LLe7qhvq5gAt+ih76qfO84S2PVUo0M2d34eSE373FLPvLLnlG5WZO9zTwJF5+Pbr2ULqHPf0Z6L
 77ZmVDEVNzUautD71Qfm+PFCyFTt+PEt8tDCZOIdJQHSgch7R9eRGnHBXEdCgvlu7QloZTvsEqj
 gdXPyqJUIeasx+LfxbGg3TiY3DUqZ2qxqhnUYtzFRjK3DlbSB2M0QoXOtOlz6J0om1dmLUxDL5i
 j2BElufoj2ynjCx8ciJB0E+FQDT7AgmItKFiVNZbQdohINwD8Tb+DSOzaNfeXJbHMjdvi3O2yT4
 V1KaxHsOaXkxjxcfyNyiId1MjsfdW6/gQMZiYC69w89o1NAK/cvNZYq1J73qQniEz6s0bA3DTV/
 SnysCqlJAGumJvIyJVw==
X-Proofpoint-GUID: _IfT17K1OW8DbADf8AxOAl2HtylO9sTm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX3T3SRR5hpXju
 aKxBQQIuSSrVLxOrn9L4w64qBvYSx8PmyvG/31uxEftmwp7K0kvI7Dl2l1cVa2OFqZQt6vCDyuI
 FPGdTweH62E+yj0EEyNKuueMdsgRYkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260075

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> index 8ac42ff625a0..fde7fc035bf5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -197,7 +197,6 @@ pm4125_l22: l22 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
> -			       <14 4>, /* eSE SPI */

Is this bus going to be concurrently accessed by TZ?

Konrad
