Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CEE267B89
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091282; cv=none; b=XBy9GZHXIHA5/o02pqgkwPMEFHCXCj8mhlFo2Z5tdfQjs9bj5fCB/iFhK3g1jU7Gn9e9fAOdno2mlacwAcGHUmJyMz/TZtZsx7eMkpyjDcPcomlak024XKGkacOnFs+4gjfg7JGVaWHH7ba/iVCe+VEbAcgCtt89vl9u2ugWaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091282; c=relaxed/simple;
	bh=3jIYyqc5MjZAiTS5GJ3OPfhILBABRmsafm46SBq2bbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO4gZKniqE7hjsmROLfJy1pG2R/Tm7kfH75TV9JZsQmxTwNcCLmfP37XhM3aMdjxN8dQK8RXPQSFcF3W86sfazNxfsWwoq7w8wwDdxGYZ6AaJ/wkndylxyZaTeFhVi7ND94+6wvomMWJZtcenI+zyljLFuTP9EwpmLssddJP0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHFppNlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fds26FrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHFppNlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fds26FrL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663DWH1Y3195235
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 15:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=; b=cHFppNljtBHFW8Eq
	zN0WtZmnAtnKJZa7oMRN2FiKKKhfL2w8Y9PJSTnZrbfix65ThOOAKHgeIs0UZ5ng
	SVaH2Ls1E9MqMzIFImfNK1GkMj5AQzsgGJugQ2IVbLaiuKSNo5Y3hjHx78TaHuU9
	uxQ+TgcF7/nAeUwaFT5LTixk3bLD1EC4/c0V5Os+svDtLnWs5DlAI0ZN4ctIzVl5
	+zdoweDafG8di5EZP0JIf6lt3LB2FwRCrXHlJVz2Pgg7iYUJBbyHzMKDQKonWdX7
	dpxHmLLsxMl+jAmmElecj+XZuteyffWp4IntTXEFohMgsHd6CW76rR/ubry2MaS9
	uvX1tQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyspp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 15:08:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eb5b9d2cf6so1902606d6.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091280; x=1783696080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=;
        b=Fds26FrLCjT46iCGyCVtC8QPDvt4r/yCmdUcN/LLktVMv4mbughvITSxYLaZjegA4d
         ckKp8S8z56whiVleYTGHGntURIOY5dI9fg1eUybW2oRoWAjKbFAjtke6n0J0yzeKAqx1
         rHsyzAb3QcbKfsSTJv5vgL9q8dcnTtSt+KI00d+y5HDEgUOSQOkx3YY/e7ofiA87kd92
         g6lyHm12arlqg6VN1nE0I+vv6qRpluany8yQOWk0nIckrrBM49qT+0vPbehs2kQ063cc
         FNV5xCxJb7ExRuDA6HVHpz+C0XAY7JlqqkA90kipLtiRwHTWegVESQcH8IW2sROQ3xXq
         uPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091280; x=1783696080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z81ATdnMeKeyJMtRvUDBLN7sUl7qdcNy8daIoFUOp5k=;
        b=k/BlnPuaGKNg0dJ2KAJEfqAuhYa3HIak+FDxm9MNPjaZr4zYi8MYYbjYXGxyiNDr6h
         kadbLIwUsoiv9ta/uedsatYvqC33UtrW/yC7n0fSRCZOkfc3WHt4f6dpGgJqp5LmlPoY
         Eu4S6PWeSv8J1x3y50tVPeHAHuNwMAIlG5WiJV5EfSe5ChEAPNQOqfUC5npao7wrVWAB
         24ZzI9X+h4D/mNkNccUZ/8t8Gpnx34M+1EbZwEN4xW6BrBVMlrsAPQrWcPnt5MDJXnx3
         GsQYSYaCXaa46wQoSBBUVTnfAwJ3KQ8UlQDSPlc8LQ4cAPYAli7kngoK8JAGMMFCsPDS
         U5kA==
X-Forwarded-Encrypted: i=1; AHgh+RqeistbsgO4lfutv1Xmlr+i+jdAw1beugbd8H8RRoZQIRSoHPNHP7m71xPIsI+ETypzMtRAeyPKFGNq@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbACZhx9+4UuBpIqLyDCfTuetlN8rkmJTNlfVmnC5faNSZFWw
	DOtR3ABpu9rW8LYJXsEQiBVq6r5hB6OltlNlWqQJEH8MF1ej4llVYk2U+muNzipsBDXnNa7be6O
	82GhKv6SQUET35luNtdI7ULYIujnZUcIoL7cQ3zyEmairNWbH0dHVu1Eqs9UX6noI
X-Gm-Gg: AfdE7cn04RsKrPRDmSeqcWvudqFRpdOAXkVLuWJtroG1/YWCx1UOaWoJ9mcN8jgbziV
	Ki8RJ8Nl2txmZ4bzoxnxCovZyni6iDNJI9k8hvDa3IcHpgkZ9jHeBoy2JrbuGiy7yNh4FhG2WH/
	Q1/Wip6s28V/rPUj08ilFPl/j5cxz8cbwGbVThVhot49CkXDy59k739n5dqtDLLyD5kQYH9FDBi
	Ae10mvr9QpUZaIN6S0ZdP3la/6VbKbRVBT+2DmvcfaARw6VKFCQgwLKUIOs9FYmDz4egWcBkL44
	clPvDvFWZiYZ/wWy1I4uwvqYtYNFfYMSTerFlbgQxyhLzQWmCPqsRHNCQxaHuwiwejDyCHRT+lF
	oM8YwOOjXVATUVrMAFFbNT7/LsQUVzMpCq14=
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr94566966d6.10.1783091279678;
        Fri, 03 Jul 2026 08:07:59 -0700 (PDT)
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr94566146d6.10.1783091278946;
        Fri, 03 Jul 2026 08:07:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad1353e3sm2436722a12.27.2026.07.03.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:07:58 -0700 (PDT)
Message-ID: <88cff3c0-ce85-4d0b-b6ea-b3b3b061adcc@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:07:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key
 connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX+cw/AZvFEPjO
 W10uLPvZ2zaiyNbZ9/snYQ8JHbdhc3PQ5OqGNvOwagZXbn5OvHYZxx/RF9e4GeM+Qo7724EkYF6
 Yv8q8tkFnbMA6z560BO8xD2w2Xk7ddr+JJnhTOVMumLbfgw5LMnCNyZzFm6Sg9xPbFgPmDr+CRM
 U5/xiNrXMt3tMR17JvT7tMNr8Gw2A8YE2decWyAVrwahtDvg9HBkOGTlaJkbKw5Of5KjfIlQ9jt
 IumNzCZFhMv3g5ggIqFIzUPjUDM+p/ZyHO+xQe1BXUmnYaILQkbEg9aKklAlW04NmW6TejbjI89
 nNGhB3bEL8tWarzHLN1+UCcRSYoM/ZTrDd20EmVpfDUtdPcwBECaAhFUcPa+umNs4ZUxHRbeWbe
 vQEiIHXILRfJ0GzwdW7zvAhGtLgmh+gBhaF6KNrFIpu/Br6IsYARhpvu2WOa4pfRaI2LfaQB/DO
 i+dtHGO4irW/N7mXEHQ==
X-Proofpoint-GUID: wJSNC-Y-vNLN3gx7HMtKufEw68w00RC3
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47d051 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: wJSNC-Y-vNLN3gx7HMtKufEw68w00RC3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX4ABg6+3jAxJq
 73RQoFm+3DRmsg3l5eVnJuK6AorTmnNK+fSGhE5fn6niVrzeSzkYoYG3Wyxtd7jQRfLkoLS8+Fv
 8XI30/yPiHxA4VJPQ9ZVwLZyi+WA/us=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150

On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board features an M.2 E key connector connected to PCIe0.
> Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
> regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
> via a TCA9538 I/O expander on I2C4.
> 
> The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
> device connected over UART. Model the connector using the
> pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
> the respective interfaces.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
