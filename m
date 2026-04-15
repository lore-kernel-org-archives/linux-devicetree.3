Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836FE33C19E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254762; cv=none; b=V6/kWjkgynUvnpQmY6arijHpRvsl7RX4e8uAEjW9jSRQX3ZFsS84bPWsMY3eBPgz2qn4V4cNXzbRAKaKwjluypKeCoc9mBbRaWD+li21XstgwmCyrs6F0Iyrrd44tCJvOwFd1UMDZVvl/ywHqJeUwIx3je4YB2nB3PRJTo7YkAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254762; c=relaxed/simple;
	bh=aS8vxSG2wGvbVUmsEsetZsJFgLkAtcc9AR7I2Ayxtdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQzrVn0L9cC/Rc8CWNKey0+loOgY9Q0KsEneruu40yE3Nzm/ky0F7fgMD15rpV+bdx2cnlkNxK+t1WXToJqwhp/18qbc7TYPglaYj0jdmv0Ac088Nj/02jMcYPsuiLcIkQy0Y7hQyr4LID7VQ/6yW2amBj2A3PjE8ux/tLqD4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oohwY2Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUYdNmgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oohwY2Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUYdNmgn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tS6M764284
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=; b=oohwY2BhKXqMNzot
	rx0/qZ7S0wCiHYbDA2jVDStCp5wOjv0wgfOnz2QxQyCTyMR2WONUYv4WgV7vSg7/
	HKYiI83AfxLki23s99ZqARIj0nqbcNyCJZprB36+TWTN6njEfo83yKdpzXsY3D6g
	SqP2UYKpjqtYnIrhFG/x6YFuz7y2dGi6p3FvBsnM1PDbCDwm68wB6ECD181UsLbJ
	FfUfCOGIcAT+ZYbPNvtGXWtsLDG4gnCQMyu8xXdLEN4RntLYDThHwjNaqUkTi0s4
	twJAEr3myYwvJaSA6/1qpcVsR3R3mAcSH/Arew3MtQh7dbR6IEohgY9yMZq1UbvS
	9BjwUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7rx1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:05:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acb4b340f4so8966436d6.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776254759; x=1776859559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=WUYdNmgnU6ATTauNpYl94EIyvxBL4kxbPsUl7z/ewTWdhXETIxFWQMKdSDlkn+wrXo
         IJBtkork4v19QQKOEgAET3qjeIbItwOczz33HNrwnazaBMKPxxHMb7BsSeFuUNrX9V3E
         63KQhCpk6qBZ0vIODawdz+0Rnd/WpoqElFNQMyXnG+fXejJ4LIFRoXTkxCvkyOYzX8P4
         UCscjYiQKgoJyTy0KUUDKC8g8IG0bDkLoT3CQun/QY1tqDXXXpsnQ2mHu8e0/NAlPYNH
         EY095Mkxxg0ynhGTa5iW9/N2oKKj7fICPe04mqv6cZRuyoZtBtHRylxqRwUX3UiE3QZ4
         iIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254759; x=1776859559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=AmQUI8bPnq5O+7vwZtHX1Gwqoo0cFMBYbDYtNg7a/On+qnWZH/5X3+NVfrOu6KLFh8
         Q72PPiTWdOxBUehG8Bt/Vsz65Fm4zptFFqHiI2/udNmOmzxXpPawJXnh8d0WGD+qCo+g
         m0r/eOnfBQtnm44kOF1mDQBADGOVfklZipCXKVdSH4xO/dkqaze3O5AlKhNgMPxGe5/F
         TRoJ5i5/bR0rPNOa2KdizNBCnHz3tjuM2Pymx2NJ2AukEWhRXFEY7y7Pb9MmtvFS5UQC
         tTXQQx2lH/o+Dku0rd/GW+mQYUmjxJr7rK2JHBqFuAGJIai/qnF5uMqLDR0HZ687qcoH
         Merg==
X-Forwarded-Encrypted: i=1; AFNElJ9pTb1xlooGAiyxV+8gLtW2QNH649aH/UozUd/M0Qmvc2xb4m1DvLS4B3t6ajzb8VVjcXg8412w+4uh@vger.kernel.org
X-Gm-Message-State: AOJu0YxkijUV4z62dOwtcxog8QDOpCu/xLMcrQnGCqGJ2WRld9jAev/O
	mNKqPH0pHZCzm8Iu77mkHGim5G4kCwpaJdL5qSb0jhuY8ohNrkL+VNth86ScNshSwfDoB6eNLML
	rtLG9O5TOtHM5+dAa3i/kBXrgl3jftkQaih9kVmZ1hQun+r8raWocqXArzgmy5BlB
X-Gm-Gg: AeBDies+zUj0UZWsO6dOvH9j5iVRncaIYDbj0vHfeHdaLq6m5sBBR55RYH8A2YoQqj2
	9YPkrlma1XrRgcaly/QhuFfUGpcuiJO2PxyzDC6eLltugAUhKN6P+za4emkY9Esq0A8lng7Fpi3
	Ncwiw33POw8uxbwURdLvkLhS6mvAf+nwVs6taffrKwF8lguqpF+1MabC9mdZ6qThcJTc+Tkg9TM
	hKcCrfgTc6u6CVwyU7J0SoGi8eurfgU+OfGA+oew3X66UtgljKCqbQKp7ty+CHmiCPj4v2s+XNt
	S6SzKrC0sZUpScwDhYbxzXf8vp6WQLF6fUk+Pev4AE9Ge7gmD4Zci7m2UX/hXWtr1dIMzQmItDC
	xiEWwS7hPRQI5OW1Qfu9GoZ062cwr3rnEfGWXq7qU530SZmRALypszy7A8uihJhZkiPghL0BMl0
	L29RRE4upTowu+jA==
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24215206d6.4.1776254758803;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24214816d6.4.1776254758360;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173930174sm51117266b.18.2026.04.15.05.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:05:57 -0700 (PDT)
Message-ID: <d407e341-e54f-4b1e-9000-3e12eb2faafc@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 14:05:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df7f27 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i1Qc4F9nIsNgxiQxDngA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: nePHb95wek36AzOQkxCUCs7lSgjYJt99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMiBTYWx0ZWRfX1qyU1h2vGZLo
 hOd7IjpY8JH93WoSsfNxKRQVjRh9UWwgoK5ILrBEqWmXdHbJ/+b9TmaB43Cnof/pJp+rmFMGctO
 WC6pKvci2uuuGOi5goInoHCXPpQtirb8AvOVbVBcK1R7sb3RJk/CuGShK3Yv6UwiSE5kQfkb6fz
 tSZ0nL53ejMumeV3DQnJHLHj3HnoYth+JEupdew/0ECGCeztAVDpLyDyZqCsJwDSEnwpArJ4h9B
 U4Qq/JL8T9Jout9SCkZlmZ9OON/uFfd4tcaGjdQtgazEZ2StonYhlwXghPOVk+c+aGkvynkPnLz
 xMnZCAG7im1A1bd97kTfV7C1TupZM7KQGKNqLQ703Mzy1XEUB0lxS6s0R2IQDJ1ekneh3bknumq
 aQJeGwtzj2LxIT5lSGsrjWPe+tZq2UBGhR5DCB9tfftmhk79AfYXAXsIJHkkEjx06LxnY1VgY3W
 Ti4zxD8bB+dgzKz00mw==
X-Proofpoint-ORIG-GUID: nePHb95wek36AzOQkxCUCs7lSgjYJt99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150112

On 4/15/26 1:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
