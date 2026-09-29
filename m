Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231405187E6
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686716; cv=none; b=DEWCW7dbLuSXi4vVUPSEMmFXKELu1iGtbL9diWd/KPuoCGzKO6NmxmcDejGDBnERbl6ebwifVy3M9uoZ4+NpZDabYt87Om3ZrZBLBGDDch0A+WnY+hQDNhQmKEeH1JhqshL+jB4WmOhNAyGh4D3IhPod2E7aoWxcDnpOAZ4DOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686716; c=relaxed/simple;
	bh=poKTzgMcXmt/rXMV3v5aS9FWUcoH0tIk65sQFqa+kWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRT203M624jV6Q3Mu1uyAyTNZlwFJf02XLs7osnO1Z3CDxQ1AI3QH/gRYWhElOadu/v5fN7Mb4ADOIkNzPDBuVeikMaaA7kBBoo9JDWLNwniK9Cn3AUSehy6dRyZdqEQHNwrbbLN/NmLVCnKGZF9J/CuuHW8S5J5NakHgReuWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZqjhDjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUwdizTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZqjhDjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUwdizTL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlxA4151546
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=; b=MZqjhDjT0vZVncHZ
	Q1W4OKXD8HoQp/xNhjb/0wUlzoAvXYIbdaj7k4u/D6HSWoVbzI7MGVblODPDtovC
	kZjv3WuEXNDvujVjaBVIj777EB/VwsrbhZOMY3hqboUWeH/jDENH5/hGtKItQfwF
	aUcRrx5G/Y9PaQjg6r9GjyeWf3yn6oJJBDU2QMc2N+MHcQP52g8QmHzl2NFsMLsN
	mJJ2aJ7SE3muy9AwmPucot7tlrFWBEYvtjQck6J0i4WJgeTxWWpmj5P1UBTKLIt7
	AY4FvSE8+GvnQvaDhY+PBNyvy9Huiy6a9dfSDZ9nfcYRe4w+nEv74IVv/cFS/yWs
	X5VG8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc40c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:58:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso88948385a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790686713; x=1791291513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=CUwdizTLngRy4GB5Joj40ZOcmb/YMapYtMWlLDARhxPBjIMpK+aMMno1OdXZ1OI+PZ
         /i46270vwa3opcUB09ePwFMlzW+74jI6at1ycZO4rjdCkS/ETl0Ofht8AinWujseV00H
         x9Dp3/QUcuY9bK24jVRW1G9QjdEm2oCURgilmAbWRS0001WquSTQJ7BJTuELKwDXvtQO
         jjeZZFB84EEqk1NULrVNkJk+dSg46gmnSfiFk4EZrOvF8wsQ+m5xvxmzy5eSQ2Qk0+7A
         3QSpUhCTb7aLkut013751PC41PUAwdjKDnerHIuj1Pcr60xruqDjBXvVrveeOjtbLk/F
         QMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686713; x=1791291513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+dfVS2AQIbYUhZhPWcbjcXR5H77ZLShPoBFzO/u0Ic=;
        b=gvhoeq4a8Y1yxt6e9ZvJDw8RZxA2w+wgraHwTPXFVNV6uWfst1kY45N5bhRR1i2nKT
         rlczgFzNse7ZEXOfZGsZS3EkRHNFilHan5+ZfIJZs3dFH0ZxpE/YhEJV/jm1G1GINcwr
         +tLOcIgcHsuIiXLbgtREoc7Dq+k8WHyoQam8t0kVEXRGQ0e+LEhNpvLylAwnd8nmKjCN
         SyK3m8SRjqi2PljBEo46wNbM2jORYBRLYe6Z3MmFdymUv7BXjFhHp9izbT8T8zphHBxo
         VC3UGks6yCwCCL5Kt/nPqCfNpGKMYpCgZOBFgxG1/lT2EiGfW+8YYnasPi9u3MypVtSw
         h06A==
X-Forwarded-Encrypted: i=1; AKwUvBw0saxUssO6THWRlkBW8jnkk8k+bi8JpUQTMqz41UlXBowHfc3dLNP51eKPLc1CxNflH2ftRulbODTL@vger.kernel.org
X-Gm-Message-State: AFuF++kykAUPpf9v/oj9i3Rtx/KyKjENLAs2e7qRFWsO6jKfKCP9vn3B
	9KULy9rfpNvXczV18znQKLVMrdGXhhvJa7HA+eWlguboSjnwZHcZfIt17mJQIJuJff3wByfSfuL
	bK6BJnYybW6kWDYl9s8tbLqhTfxj5+xke9ARg9omjDfZZliwm1mpsbNWXhI3dvQoK
X-Gm-Gg: AYBFou1Lr3hsBf1B2i6JdY1CujgHgzRlawsnFxBRoXSu2gweZK4o9ilAdePna+azsHd
	PuW75CD38vBky3VYHLfwKuzBwFunUgJ+Rrbtwb2m/0mwnxzmIsrNn7NbOdItRK8xzjbYX7vE7Iq
	OpgT2Lzk76fEYZt9VmJ01CCGxKgwfb2x+3mI9bjCFunizqmrL4fEmB6WtFrvZrzXM1DQmADOCJR
	q65nCl7q7iMkX9x3AGUenaiUxohTlYeqfk7x8LdeseB3SPn4+kazXUnB5xU1Tk+ekL44u1rkRRg
	5wN5nu6dMgmXI0qRmo9ai5Rup04l7cx0W4U/uCcWEUe8OGo/lJa63ZkVaL0T0PXM3nWn/ATRagc
	Ugp/FnPMSPVcO80XMyAZAUA==
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597725085a.6.1790686712718;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c43f5e580mr2597721085a.6.1790686712170;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9deba80c6sm1361214e87.28.2026.09.29.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:58:31 -0700 (PDT)
Message-ID: <7bc9ad48-b8fc-4feb-a5f4-56d822242773@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:58:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929104127.3156764-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PRNJVSXYpLFgUHXkyhmDJieIQJ5yUZrQ
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb5fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Eo4bF1euHd9rOWEQa6AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfX3avTj0dbo6ur
 HO9J2oIOR84ojBdKPbuvD4BRM4xQN7gK8AhMzwvFstSnOJv1IE0HHzwF4e6LfrAVExzI4e3E9fY
 RPFQqgwY2VTSqeBnAKfholkilzYf9/iTi6nBpgRWhBzXftcUzCaLMcnyxuHfIFagfYKHtiuevJG
 sGTy2L5nnU1/QweGXD//Ds4VL3h6qZ8xcS6e6WGx3YsDE+AzdaFPf4YNH4X5Sec5Kf7SCb8ASp2
 koQ9lXwTI1eqjgWZ1IqBL0nieUiNT1fW5gdiUp8bRONqudHUOwRoNDGMVyxKAvPetqbFriXLPXK
 KKhhbN9f4ciD7vuOViBUgAdeBN/LMA2FsOw5GC5NpOGqzEY/IDdYuT0LMI8bvZ/CXS2E2wuVz5d
 UNWCUCRJPYg+IZixTpFLyumwe+PQtBMXf6xCuZrGv/1PdGzUkJSEPCGpAXnYpQuPWIIb4znovr1
 /SpkXwgaZVSwpY58YCA==
X-Proofpoint-GUID: PRNJVSXYpLFgUHXkyhmDJieIQJ5yUZrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfXwx1lqIC3hvtU
 Pbe05AwM7UccmtkPTpnUaW1STeL5KODjfYl2GGfa2nNZ4vY1QU3ma8Nz5bA2eNWxcyG7jXm4BKp
 mFOczNfXwA37wkGPIw0U5WPUiYKEF1U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290051

On 9/29/26 12:41 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
