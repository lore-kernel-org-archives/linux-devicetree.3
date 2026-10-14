Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA64ED182
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970811; cv=none; b=uIXW+kHmG4s2OWuzzgRxHVyJEEWQlvXkI5HLBTIvjKZfggXoh+dqYudeiq2clmPe88L6+292d2plCaqyHizg7r+d3wj7E08TGMQBJGYGU2gi+MmMIucISqu87uZT5RksekL3G/B77Q50r7ePMLLNAYCneM5iXcvDwLtDKTrhCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970811; c=relaxed/simple;
	bh=51EDfJ3McB0CSbNJV9tRvd0LTlnNYRq8kN39WqIaSCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJbIzZ1RMg23MXUESOXPRCLdahoVCSSvlGaUdRjm+RnFaZkIKufaWsM53zoz/8qgACQnVpvia2tGSexMCWQCt5I7ExuEUuJ4wPI/GqwHiX8Iat6e2c7LQUfuOgTleHv+Iuwfvq/v2T603TIhrxI7hQcANoASo6gLm63SnFSv+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKlubNWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKLmW39m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKlubNWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKLmW39m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7QQMp2874030
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=; b=RKlubNWP560b5l04
	iznFlYW+WkYYdzxbkeYKdsCa1Rhz/DBh0sFxsW3W5XnRbidW3S5kEk3eHVKDHO7c
	ch/DJQNh7hqy1zgifyssTBjLKp2uCuMgUPk3kf5mJFdMGKs4XezSlSsy6nyylY0M
	rhOlAGqJuYW+bqkfMS6ddhvLY0AytY99XoFwDq0UvtK2yBmhNcrGtTScktYeFb+P
	U2OtDj5wb3OXFnRWHQDeaivQDYKUtgapAR7wDIKkbUMkg1koH3CKDNgYtaY7Qege
	IoMBGd44p0OePhIhwxMI5AAO5sfhBKauOkddknaiR4kAnRKkbRaCCQgRbJqCItQZ
	0vYkQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphhvhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:40:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53568f05f8bso12038941cf.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970809; x=1792575609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=DKLmW39mgLp4bwERFmhQs5ZjsQRCNnrJiq/fTEmipbd0ZNZC79jLZZY787KemcROGA
         vhqPgyDRv82bcyCp4O9Cfn2Y3K/fQftX73jTXL+ZiUPAtlypIkh6IXYubNL/0MawCrgt
         mJP9/t9r4iUHgINNVeIE8katx9N0mKsCbCHegZ6AO6Oe97p3fokFJwXs2r9QSDQR5Yu7
         TeaVel0scrDZcd5cC/Mm4TMHac2KafV/2hDBo+9lVhvENeWHdjtxSAU5/Ai+YAiOVaA3
         +GI9f9D89m/ozFO9QngigMARyJ3kClMjRsuU4R8x0eNLEAqZ9uHACGvug96a6O23lTnV
         xojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970809; x=1792575609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Sfg51us9zTiOgc08N0134DVVlSe6YnZt1r5O3RNu3Y=;
        b=fRWD+APhI7OJInhL0X85Xd8UGdfaATY6yKmjifaFlXFBP/Jhlw16LP01tNR/Vf17KH
         M9+CXUJ5ZMuAcxKSHcVeH5l1SrwhUWQiCyfPSf+ssu5EFGhnqgS5Pz0TWnPF1H6KACKD
         ZS+AEVr62ayE+OrsK619C8/P7+oq5MUDPeiwGIFaDLv1VIhYX+gUOUn89wyKetrv706Q
         j2YbhZpWJUIdutSKLVBzhN/WrKvmBrVr7Hekqj9KUEpv8CQf84NpTg3GH+74/w4ZIydw
         q7rhjT5yupAE6sfZr5PH26DV+tgMjG7SBbjFdVvJbDLpZ27tos28NlBiolf+/LCYzDPy
         CQng==
X-Forwarded-Encrypted: i=1; AKwUvBy98g7V9az9TuLxZ9ougH/gGPsl/QIHf9LIAy27Yts6XkRkz8ABJtjvTtLL3qH9mBU+Cwg30gYYpsad@vger.kernel.org
X-Gm-Message-State: AFq9FYIMDlGSw9mEZIbwMdX1xALLrcisv3vvU9w4hH7AfszuXM3oMyc2
	RV3+9I/syr+Qz2EM9fng/H8P7KArvSu2PvCLJ6GYluIO5k237aOOYhTmriW/eyyOPWELTCSOABx
	/K46sbhDM+eeQL5FJUSSMM6u25qLsp9prKFJj8tYfepnjCqxHZx/QyNja5xcHjNM4
X-Gm-Gg: AYBFou3NT8Hf8hs0EzR9NnWk0shhZww4eZd2lAEonr9FLH6jC7kYeKUmFLUTFvq+9rC
	dcH4aGbSKj0lHBvWTxr8gDXPc5hX1iVSfUXJyMERhwutO8hCscPwkchuQF4Tiv+Xs9pOmFOCK5i
	rWl8FqzdzNxqUQUEuAI3v8S0VSAEwZVGwh0gt0OKmSGTXNUm8ZwEwp17OUJVvxFfLTZ/fjVgXoX
	7lTuQobKFCVyf7rpZVXFQO5GRqj+LAbEZxPW1LMdFaTgQYMgGqsXdziSTqgkth52zmeYmaXevA8
	Rar/NB3cV8SPOfj6IYGU08qcL4b1baNvHzXXGvHrVIQj2snI9nIXkAT+ypLRXErfFEZGamhBZel
	nXszrgyLZMbcwrA7KLTap1g==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020854985a.5.1791970808813;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3020850085a.5.1791970808095;
        Wed, 14 Oct 2026 02:40:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm682278366b.31.2026.10.14.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:40:07 -0700 (PDT)
Message-ID: <6df78358-92f2-495b-bbd7-3557602dc677@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:40:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zivVkDuRhIcEBJCW92012qLYWg9I6lZX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXzNTSKWUrBUhH
 YrCHlUECJNXXV5OYc1o8A1heLqvPMHDraQZu6XPcXCFKqRwn2SFAoE/9wMjFtCe7MogdEuvtQeu
 n5orjEUOMmS+U2cWMHqQbg60CbqUqHA=
X-Proofpoint-ORIG-GUID: zivVkDuRhIcEBJCW92012qLYWg9I6lZX
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf4df9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=v9uaEyY1ARKJclbH3V8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX4FtZW3b0TJj4
 8KHkbNbsh1dpSsativ4vqqxmtTOiktL3KeZX4StVpowCgxzv3CNGDMmw3LOXvrOUma76MsQ9cmL
 LBVICbXulw/uSVX7d4ATiXBFFZmvOwiJL/aUwW1hHw22zB9fQAEXyf95szOQcWG4V5cN671Xzys
 fTvkXtjLhcEiSwEK891N0Qml+ktKYKYTg+gyUL91Id5LjvJVTrziJFbRUgGP4r8/lyCe+yWy3bJ
 R2PeFdYC2dl60PEmekzY193ikvjaLULJRI4T75fx4v1oGoOUWMPf1abCBXsVM8hZpwi0OaXpTu3
 STP1TM8YhZlPx2hPYZ8b1TBpw1irdS6+3wco+y2u5N6+oCOCwL9UkxfCW2uKJJ07o5daAMiTdNe
 PwqiM2YREZRYOJK1eRtmjJzGa4kYbWhERmdwTgWT7ITLKVJnuAc8stCBLNQuw2Ag5hF7m+gyk2Q
 7fr+cOPIbf3DKHi75sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140038

On 10/14/26 11:27 AM, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register context fault
> handlers on the wrong IRQs, leaving translation faults unhandled and
> potentially stalling the GPU and preventing recovery.
> 
> Replace the context interrupt list with SPIs 680 through 688 and 703 in
> context bank order to describe all ten hardware context interrupts.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
