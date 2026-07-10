Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623B42DA32
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688471; cv=none; b=By7BRNr+ZNaDMUifsF3CA3v+aFGk2EgnJp1e/+D6iyQ4nTSe2P+XYug6XN0Ktawfpxyq4yeUoLnzI0/QYUc2KFjMuOt3IU1njPjjG/+XRQZQ5mwtbR5L1DstCCuQhgdym10jxndxlJl3HDzsikd+bWC0XSvbQ0L+YAEY3y6VZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688471; c=relaxed/simple;
	bh=IzrIYAqK12+0DbBs+SW6tlw64V962i3LE/L8V8Wfs88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM3qjHxMTJxIZPJIJTKwOt9Kb5mRZKwMM6/u8iDkL+um8hxWjROBF9rUB1zIHCSIjRlMJYQQP0ZP9NxKRTPnAZ5MCrfEaAD1aSvlWU+yup3gPhfOCIwVWnvCLzkcNz/DhqxiUevUoMEsoBZaaexgIPL1O8iB/kewdfvaKqwJwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG8cobAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hkwt7ETX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG8cobAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hkwt7ETX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmVT9615089
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=; b=RG8cobAtccDGy9Fr
	A9QbasxRaTIXsbjqafaS8tG7YdsU+vQPGRcsz99XdzM+KYfMCM5e2ogfanq16Jip
	ahjrWVSEWyR9lglhEKpH90gSJWEq7rWlfEvI8TxeIcueDAI9pizb11FYyTxFyvhg
	Jcxox2SYibdX9aBJG1FeNjLZ9dt8w0XtapRrhVooE3HcSd0JVEOeLDXdcYWeBnss
	U7K6KaqOHJe1Y74Bh0odf9X1qWCL6h9+ldyfbLS04Z6HxJXU1tWEe4Zn112XvUyQ
	tNVLyNMvtQYHuOUXjKVTJxmu2c/NpIht2UJS0STlXo+3E0aj9zcFppqBa6PA/Ok4
	jBCX0Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte35jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:01:05 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-495ef87af01so111520b6e.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688465; x=1784293265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=;
        b=Hkwt7ETXbkdqRm5Hapfj9g9/jIvjAcWvPOTd2O0HE9hUgOnKjz2Of9w5CB4q+I1DO5
         zAXaqugF1YCM2gb0OkKQ57lse33JyT45imMTw9tANwoN5obrCjAH5mEdaQBQkF0Qumzg
         8tuWVizcvGfsCxAbbd/uGQA9b1vr0fbRNp66ufp9AEbEwpBR1Fb9aXYKLvaVBPu++WtX
         ANqMQTaWgiyu9ecH222OZiKnevAKNURIBrLTsoGGF9hFUGm8mCdfPco30ZTTK+Innubg
         MhVOTlR5NVjBlbMj8haKCGkEM7IcjmLoBDVsLaQBh7vBgP9atNUrS8fzYutjWZbFNgpD
         t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688465; x=1784293265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=;
        b=cNWCm3zfNYXObvwLg1lONUyuCkjuG2l1aVEY8LpPg++9gj9tEqRGEM4rs8t5GQHU1z
         fi7sKN3uRtXB6e/rIQ4Tw5kEuffn/cjMDItIJD5aj/WROF/kYv2PJS++B8u+Ka9U3K+p
         HX3ttn45v5xSeFahpRMDeOZnbEyvnownL7Wxp9XRZxRjb02zfCn0WOy30/CS2jSVBpwP
         8hnRiid0V2hN3qGQ/ihxhDD/qrsJoXLuA5YVl4DpgFbF/aMruTvofFMvavNO2v/ShiB0
         h2apZ/0jXw3VKJmHpqlNJkQu4ZBaJININkmb7o+UIJXzFG7wXaWVa0J2IfOuXLTWdPjk
         0ACw==
X-Forwarded-Encrypted: i=1; AFNElJ8ouYHIbvcf7xhYssBfwOJZ1s2AaxdsZtrPXWj9nSApJ8j94OVZEoLKkMaeee4h1ffHn4BupBh1cNUx@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJgTNlobtpT3/FrGpFZZGlPxzZ4jHG8q4Cw1d7H9EQOKNqEe+
	7seuEgf/5Sa+NLsiH9ahyVR27yX3x1v3v2BQ5d3nsQLEAJyqkghyQiL647/IQwMEny3LSwqBSHY
	eOVoIYOx13Xhw+bItyM2FoDbMHFE3Q2CuV4U9F2UWOr/JgfUYX4FbCl/evrP7f4SF
X-Gm-Gg: AfdE7ckO8EKFwdx4UYng17dM/k3mDiQCrmIXrKUwVZB3R5QXFmJEoagUy4GydZNn8zS
	pkyB0RM1nVgTBRPSM2HznYHrsimes8V34kkLrzvQFzomMH1bv0vSGw9/gmYeFYeUQBHLKbeKs8l
	Ripmnyj/OT5V+wXma/dS63Bw0dl5y6xSS18g7XCcE8lY7cSayAaIBDw/Mu7Ja49cEPCzCzZ0EwC
	UnCNSEexmWmUPpavJyf++2ykytVLy+P5kn4Kreg2clJ4WOA25AT14ya/lq12Ed5b4rGaNBvCB3c
	HzBt2WfVdylrl6oe/vvhoQUiT+05q0kfFHaGX63DdOE9Dv/2m6N6aeKZGTopR/g/8mszCeampUB
	+Pzp5cXQt75Po7pCgZwKZGAv242nqh0d4nUU=
X-Received: by 2002:a05:6808:15a5:b0:496:9bf:c837 with SMTP id 5614622812f47-4a2f430ab1amr4762998b6e.0.1783688464654;
        Fri, 10 Jul 2026 06:01:04 -0700 (PDT)
X-Received: by 2002:a05:6808:15a5:b0:496:9bf:c837 with SMTP id 5614622812f47-4a2f430ab1amr4762978b6e.0.1783688464172;
        Fri, 10 Jul 2026 06:01:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm3595066a12.31.2026.07.10.06.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:01:03 -0700 (PDT)
Message-ID: <bdb03f28-4f5c-44a5-b2d8-bb51ecdb377a@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:01:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8-d7WEG9nor6j_fsZQBPbT-B4_vriK-8
X-Proofpoint-ORIG-GUID: 8-d7WEG9nor6j_fsZQBPbT-B4_vriK-8
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50ed11 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s8hspuRcmIiiD5yHkK4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX1tLdzMJM39/8
 o2SJXIvQoQoCnkFaxqaGEf64QS1sS0Vv3mLT9gDKztiBB3dl6lVx+xeXUq0nS5CV6Gz3XRk3+6l
 wMkLC5WA134YnkgcurESlNNPm6kSanE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfXyCZtLyGhrD3L
 x0HQM8ypOldpx1KGBY2HsYtes4WOm5S8FWjszvbuPUs6o3zzrH+v4WmYo2NL0EVaisD5iH5F2ws
 nm9cIj1icAPn84bh0GFUSsHNH2sCKT5DWXf4rE/IwremQIKuSlGkqexwHP8Ys8eOfOaIH/74kYg
 8YZTlIlpIKJOUFuprLOQ2gMq5OZO9fPKPQSU6pJwqptwXcTRwaF6JntwmzPQNDvUUMFI3EzlmH8
 SDokABRUa27q+KsabyzlMDBXJyKYC0N/N3gUl6CPHATwb7KxAXh33lp0EhKATBieBBJJAsp/cTC
 BQ0GNLr74+WJC+Rf0Rp+WTDV20vYLn0Ydm+V9nEZEU0nmwc1qm9zjQBoCh477qKemys838zKpX4
 53TstuFqRhnw7z0PJBm6dNTLlAhFRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607100129

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add ADC channels for pa, quiet and msm thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
