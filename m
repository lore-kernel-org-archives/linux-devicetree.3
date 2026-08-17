Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08021422536
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971759; cv=none; b=fxKVmY1h++/J5ggDiv7Nq0xlqvlwLJ661C0Z/RVcSizdqMjQy4dF+yO2RFoPD6nXxmMBpKQmY5P0sj879Le1F9oSYZANKmUlE1uD/xccKJvX0YkHnZ+W4cYwl5NcQnK5k7zsTcH4gpAWNm1F425JmqWbe/UppMgSr+omn7pQ7q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971759; c=relaxed/simple;
	bh=WZFhqpM+HyJW8bjzf2eB/bviQUV8/jyq1BEy0pumb34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1zPJWCMduQ3wJ2wvM+UhYYbg9jZQJeVFTh5n3c8o/45IC/HrhHJ8TojaMdfNz1X8LrX+tFknkMb4dZQRjOapHGyCMrtVKTNBa0HYKeySGBtqiYw8EJV8BRe3W/1tJS2g8/mU+nVDI/bjIhcyonig28qxHu6slMuhMpF9TolUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IC8o/3cD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThGHsuGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC8o/3cD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThGHsuGI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAoff2307980
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=; b=IC8o/3cDk/MQiIt2
	BftVcxaXC1DnR70HH4caTpyxmy4loWjwTh0fFCx3pGX1nOWoR8uTyeRUDDcr/WfK
	fYSq2TuGUgM7LIIKEn/NEEjkNXS90AG5EPdDD5BCpo8LT6CVjnivrDRMjOi8xowM
	FvH5xrVuEEdRZDf6beve/WvSFJrj+Nj5d1hx+tAckbKrdSLh/w5gQsWyJhUi7UdO
	dOLcbME1m+0m7tZhWhM8M13iJnImRvahCVNgAeHbuGQXW9ZxoJKnvTu2LC2u0sxM
	+4w0gVnWejCaxayHj38MaYWf/HA7oon3f62XR90BUt5TNDJT3EjtQDfGF0csiYqs
	66TXSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wreha4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:02:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d371c85362so9542035ad.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786971754; x=1787576554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=;
        b=ThGHsuGIs6YooyvqAwML6OBOZygG+5RSLgbdshlVLiru2bA3UmFnkaZMurG1WTqBzo
         38Gj89+qJr1LNF0/FMG8CflPccmrNGTnJocgYxHIObZOF5UYeH8CzeOmLqCV6ygy06K7
         U8HZYZ8deeHXwxcvbQCsGxspOVfN1GMcev+mdLWXw4x6ik9zlyFmGxd5XVBg3lQ5NoJT
         1F1pxsi4uBBEfiNmC20ikICjQ7z9OuFhTUSO8AshNHSNYyJyo860Wn0d3c5umuba6AIX
         as+DlVZqpfQIMEsPtRjCXRTsBVURbB+SbB0iX1+CaeTl/IbHaCuRWrZ0+qdk6Q4oJ089
         gvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971754; x=1787576554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=;
        b=bUuD8pXcCYKxwHZ8Bb0V0p/GeaQ4uUlzDtXvYNVXycq8vtmB8hG/7cZCTL+jTGeePM
         jKiV6Z1reyuX6rMuOeNeybfOV/gpKycc23N6ITPNv85C3jFu19MhJ27uFU6KtedBelAO
         DMrW6HexGpuVXHAjqvNsFvCgWu4msi7gHO8L1MVRrUKx6BXHYODX5OFNcA/mNw6aToff
         YCE+9iqm1OvWtceiGgq9aLBRbJB+egGXFdBz9UNU7OugBQ4/LcX4DlYbYRu4HIKH0zXc
         CJyvqO7AFLXUE+9VV1oTOXl1JysMTIS1c9cxFJIHMz4/ewYr3jBfbIFvTelVeF/5CTbr
         RdCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSLCHSuDGEnKf0jQcXbKe8K5W+IaIybGu2g07sBTcDeLnW7eWtj7Vd/aQ8LSDhrVsWI7IbyY+7HTVU@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFlsVtgdWkGQzcTw9onzWrgzUNr/9m8J2/XO49gqsXljEpJzu
	DjGR8ZzriICjSrdXl4nKo7PMPm5T8Ih0tIJnVgA4VPfUHsT3yWOUx8vuKo6enRju1zZprPjTd2e
	YrgM7K2AuhJQ5SKV+vhz6d7H1M0PFC2tFbmnhjsf7gtLgCyNCBbaMRgfSjv7nTz/n
X-Gm-Gg: AR+sD12PuvoaiuFklD6Hw35ZK5jMxkrR7BZP4dB1YIwClIR9lNpU8RGIyEGu6JLsxYj
	xGdFn4Gi+9FBbbS8fiXZRg6CXC0AJUmfM0iR4kSfcq6YiFZBUeyypJektUiIfx1EmCXGtSysMJ0
	Ob/yXXercn5SW3oT71w9axN2ljB6oU1tyLYr7aPFdndwp6skCAw5w0tQ7Ohw1zxvZ5WO18NeUsJ
	ysFC6s4iczYMiOt4pCPSMKFDB+svoq+dgPdG5lwbp+PUbz/XGVLyjhF7BD/ydQzX6kdCD5QJiOb
	pYpDrtlyL2lslkgGLPX+e1XpWMQ3mM7I44LjibM5wJz3F3ATcyJqaw4daTsu8eSIbqGxGdb0dwd
	0URZgzq4RYX1HLlDwUrS/fdBL
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr227811815ad.4.1786971753700;
        Mon, 17 Aug 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr227810995ad.4.1786971753199;
        Mon, 17 Aug 2026 06:02:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85886bcsm706570a12.16.2026.08.17.06.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:02:32 -0700 (PDT)
Message-ID: <dcf5fb6a-5d41-4fbe-a22a-39280337cf42@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:02:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a83066a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gfAMDoNP1Uq6bCn9pFGPkR-980Y-wnnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX4sFrTsdGzh4R
 I7qZvgxvL/UO9kI+0W4SwqDU4hespIJXKSz74sKZyztHjWvZREau4NkAPK0jFgtZSb1tkE5R+/S
 abDShVNwZ6WkRLadt0TXljzh7Ts8umgC+ZfjaXbgUlahM5pJRJoOql1zVr0b9MjIUMeIqMiGrg0
 jFo/3+o0Q7hNU6U8FLNDTKghdj3UkQAfCAYeMvYnIdpLy1Hb6/Bbce6ntnDy+H7rsbrNk7FC/LO
 c4c7a58pm6vz67CaKjTMo9kvQXT7f/dJKfOcsmNcjd04KhN/XJ6JGgPjqrWxqWcHpXANuBW2w+o
 yFvcEyPQzPUhjl8itM7LmieIGwOIBdBaILJN3yUN6V9X9t95kCkv8WHTC2kWEpZocRa1QtfcBHf
 Sv+9loISjNWdM03/5XrjN4ilFxzPkFJsafmKGktpHLY6By5FBOEQCy9eMWZiGVvZkZueQAgV3uR
 btRCUZItMgdktpY8c5Q==
X-Proofpoint-GUID: gfAMDoNP1Uq6bCn9pFGPkR-980Y-wnnu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfXwsQWZ1bE0OtQ
 0xNKG4pwVw3sAWdZxYz8/qtATfML3HcTYeCCrW7Y/qN5OP4Ux3BRjlrs4/1ZKmn0n30UIAqOT+N
 S7Bc9Q7oippRI8h1rfF/qs7RJ2Om998=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170099

On 8/5/26 1:27 PM, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
