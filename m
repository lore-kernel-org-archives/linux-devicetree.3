Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DEC41A4FD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968395; cv=none; b=hwig+Qn8MPW+HyYHkHEcipvCmW4Yqilimo4FQL5ChUK3kye8FyfgflXBzan//2SxnCgNA8kA5Nog31y3B5SvVZtSGfP/2zvlXC5jBq0Wz8yiyC7UOgd9MorwTRyWBsewQRPVVuUXQHuPIqgVlTgNZGvAUUiq9wlfhXUDDt+G5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968395; c=relaxed/simple;
	bh=66G7fcj5SVUDiUzPjQ1YEp3TvTinSBhpH6QuNlsiRL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paQ9QcP66GzYx93s7s8ST77CYfTkzobGzPfOOCGC3zrvvqvIGVnPcd4pkuatKUxoE5+vURB7pTKgQPoPGVv/iEOMISZ/UxKGJ19Sy1jgqmyKiDWz3D9rC8LGI2bx234KYWl1g1VmWUzfu+B/0wvn+0lmGUVCm4lQ/qtGq5dlFy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhXaCVxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmAMbPSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhXaCVxL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmAMbPSu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3u5Gv2222165
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66G7fcj5SVUDiUzPjQ1YEp3TvTinSBhpH6QuNlsiRL4=; b=RhXaCVxL4nQkRxjV
	gOBNlwKzbF8tbikdGQw5ytgmWhS1hVFEREk2h1s1uOnEV617QIBeXXGMxn28stQK
	ql1sZwJGacqTjFCO6J7d2wXpr27RGPVlND5wTY+ovF6+nj1NoYb+IwGl19poJPgp
	gui4LgWPTSpyrw3Hv5i39MjR/fY3+w/IhQTc7U69ana0hSfUQJql8K7omGBxZlc6
	i5IER43PFVw0uq6roDJFA2WjbgbyNk0Tl7c0VqebfkxGNHdWjYVCq43PhGimte1b
	sG65yq1hyMPmBrs3eVGZV340hGhGPoG0z4nRK32vU6s5nNxWI/Vo5vI8kvTHYfqF
	yE9bMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsarkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:59:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so9242561cf.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791968389; x=1792573189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66G7fcj5SVUDiUzPjQ1YEp3TvTinSBhpH6QuNlsiRL4=;
        b=NmAMbPSuPpbCZqp9nFAJlQs7EgS4rK+10jl1qgVjMn2tAvmhzJbodudO2JveEi7L9r
         IR9us8QODILXmH/a9dKzMXKf0xf0VVoruTlI7dDK/N8H383DZgPWi/0up9d7zHydrf95
         dE96g3VrQzmj6JsMwa7cpulpUx4lz8A4byIY9OD4gzmd1RywWlmRbwhy7LHNUqwGPqgT
         mWRz6IU+u3wo8i1DVkdxhqbcF7cpo8gNXOIiiM7G0CKWYppq+edd/x4Qog+gpHWk0yEB
         MamzPqTIFa3XZcgXx1SS8jspeUe3pOeQrlrQpHjvd2ooudXuaggt3plRXVWgg/iFzs7K
         NsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968389; x=1792573189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66G7fcj5SVUDiUzPjQ1YEp3TvTinSBhpH6QuNlsiRL4=;
        b=x7vkblaRsmyfkQlTN/kFB8XfLSnvVTWFUFkO87W1342+UnI7dmz09OaugewcK7xOKb
         kVH1gWCfGmkggr4i7gu3LZ4pp2oWKF0xyJL8mu1yWpA2g1xR4sHxSsWknIEHq+0K5xMH
         SatrAVKfdzrQSn4jcheW/VBIf5YV2i8RbgLhEJLMHkLEy4Qriwgp7ME9FfmJwp6Qesuf
         424CBLbvY0+38Y7uTWRAXnSBWVubkg+VozQJvgpaqZslYer+JrS5/CcTQtOljFlMPefn
         LPQDbnN0dO9qhJ8kFkc2uBO+9a9hrMidbqxCtl07LnN/laheiVc4ol0bwL03c0Lh91Mf
         trQA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ39RkMXy6/9DZQMLp/ZwMSnU7WEufdn0DwWdHs8AN5jfBVrLx4bTp6uWuBdqpRFfnNMhvpud+DnJW@vger.kernel.org
X-Gm-Message-State: AFq9FYIt6YQOkNUYR0LPex1A4ORgOy4mcklEm1ynvXTpnSRlyU0uJzbD
	7CMn5c1vxsMrqguKZ1bMbpB9wx0EkEmwc2w3gL0tKw7WkQnE7e4h88B6TXMnR25ERsvkBlCRIf+
	9gMyoFR1CGqklIhU/s8q3LJKCmIfZdxT9eBotOeBrgZ3XNMFcNWYZ3o+nJk0zhv6e
X-Gm-Gg: AYBFou0uq0uf9ZzuJN48AC3WD8/czBCl+vhhSq7t7TGFz9kB1R1wcaTU8dIH0NfPsdG
	PZRwZUjX6w2ZShzqsUAJPiEbdlsCfFdHfocpxr50EMwki77ZYCHn0aRMM5wIOBhIkKpEXkKGlgL
	2UBQb8rG+/MxQXawlRn38ZRvULKJrxP67j2uy/rs77812WTtfE4CPnF0bkku6EN3OkcylzwY7NI
	mWHyMbIS1uxCG0xbhAPVal76XyV8PgE/D9MncCy0u+yPF0yTlRPz6lV9tdykgW3bGtFPaDxizBV
	HJZdPxpYy5l94pzp2pAvNM3/okM9Vf4ZXrz3vWW0+BfSdeRSE4t6ckmoXLXVtnH9iGugWAKzXTz
	bqxbp7/Hb20suOEUCjJWNow==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr2542467685a.2.1791968389532;
        Wed, 14 Oct 2026 01:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr2542465785a.2.1791968389062;
        Wed, 14 Oct 2026 01:59:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38044sm676555466b.14.2026.10.14.01.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:59:48 -0700 (PDT)
Message-ID: <bf865b13-4773-45d6-a93b-4db4f77b1feb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:59:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNSBTYWx0ZWRfX9fQmmI88nKzI
 9BX6U7Hl64aPLld/n5n3U/ot4ucnbYZnpPSQx77kCzY9A2bip9kWNNHsZHTvEd+KZbSuLwIQTBG
 hZgtmbUXNm+9QYs6Q6vzHLP8MTwHRktyqroMyoqkJvDhA95LXp4wE4WzNUiV5H8clPvZBWSUbk9
 LFajVFq37+jogTAmPVLB6Ekj+5pP7x9M77poHnqLCb16EJCeVCBnc3BbMedH/BuJ76/S8hlwz3S
 EARj1kUFzVqlpNMUyDrLhL1TCPlAh9vVvFnUhtelB66Ignc1tlrWoLdssM1y3EJIhPfNR/kXAH9
 c+wYTHGEFDbQQ5QLC32sEpp+Y2+mGRrQRqi4Y5x+7oIjqzA1XRJPDtLIvmAE7nBNXyP4yKuKHls
 96p3W0w6iJw7WyeM3mqnagU+BJiJD4fRbqv33V7bL/wmYGl3QlLfTZNzJBhy1H+BBG6vtyxXXZN
 u3kJqYVPMSip3DnCClg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf4486 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UsXhU33V2knouzrRtw8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNSBTYWx0ZWRfX7AjXPLwXoPe6
 Lj15c/qJqSvMFXMxVMQShm1S6F0BF1J1EcaoCNQYjKV/RIYeLHM0KIAz/70A28wHh4Q/yo/ECaY
 uCTNnmiwJ6LF7bll0UHdccTf4NqoFkU=
X-Proofpoint-ORIG-GUID: xpfJYgdIBSgc0jYBECqDAsJU9ybM1Gb0
X-Proofpoint-GUID: xpfJYgdIBSgc0jYBECqDAsJU9ybM1Gb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140035

On 10/13/26 11:59 AM, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register the fault
> handlers for context banks 0 and 1 on SPIs 678 and 679 instead of 680
> and 681. Translation faults are consequently left unhandled, which
> can stall the GPU and prevent recovery.

the context interrupts are 680-688 and 703

Konrad
