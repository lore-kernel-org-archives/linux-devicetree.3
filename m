Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E8126C17
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775708124; cv=none; b=fGbVKjtIkiYZipDAC0sXQCGol8KjmCpeCBrp6tbphgGjCVrw2xOnTSUOPaTjshmgQ/8Ldp6Q7GsFb1DRQQMMwhaA1MOUbCX1bIwdMQ83WH02Jv+W7Vftt/hOyG9U130EtVJYqbJylsO3lkMUNBR6iPTqIc7s0Aq0DkNmCYEJ4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775708124; c=relaxed/simple;
	bh=xcM7TYtOdQQWWW6utBXDyke3h4LT5QOMSWQ6XwP67Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZOG7Ae4O+Hy8K05Q+1lD3XjSG7EyQ2UiANyX159WIraqlHeaEz9UxreGtf00dLwCMASSHoxrT5rvhB9F7DTxteOGT/aZc3iiVeDas0ZVNzmuilDg5TH/br1tpLJ4ndqO/xE3Zqf8wcpfVGdiyIz9+Gq1TyTVm8fRZwfOwAiiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4nF5jMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxqC6j8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4nF5jMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxqC6j8B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbsQX3781296
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 04:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=; b=H4nF5jMt7EMS6wje
	x5SX3/0ZUPtAfAfJuiMOWtKILhzeEha4dsNvSJw7dMp9R6nYvhZIqzoKjQqpaMx8
	tiEioC3c+dX4TO4fszbq7ee80wAqSCjxCq+kZzzETes2zavnc8eLC+eLUBCvQe4C
	FotGz2PjFjm9VvE9gytKnFkphCUIHKVBUBsvXSeoMmObCBwJE1DqDVMKpqzsHHei
	iMEK0v67knQMaX7sqJqmP9QpvIQu4FfwDFm6f6qydGIRVOASdjFwzUSm3ms8RsAM
	JKxbx3hf21tOVAUWy24bLOfUm63NTRxuXnGNDsGvH4uury1jPD/+lCa4GcNC/m65
	AMFUhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt6yaa7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 04:15:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24af7ca99so9260545ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775708121; x=1776312921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=;
        b=AxqC6j8BJaKmAFTkbP+xIGH4mwpmJBmjA6xT45tmB7CyCcdiKh8WvQKUFRn5jspLag
         Xxu7HLTGmz+rQYkAMHu9hFD9FPs+XG5ZI90l3Q/BweDvdB1JyofcjYy3314eU9LpCj3S
         0hXMp5i3f3lzZjemOvWzDBoyfzfUCljIWVGeY8Ra5mRbKmXQW96TsnBsQsltehgK21a2
         YVneevv4sYHKTJDWEwX476tO/FB28O5zWmwv0falxPCLM8UNMhlP2739OtE/+BRZLfju
         h7x4dZnfq5JYPtoQAMcluLiqrEYP3IGJRslYAUSsWcNTg7SqknuXvLPbf2tqRpaswoFj
         joGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775708121; x=1776312921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1eDqQSPk8E5KTQI40a3DvbWRJFPZD0z6DXQp1BfF2s=;
        b=UUXX2MNcCmzJIRR7wWgvBMhY6ivYm6zSxwJMzA1ZMURCNCIIPKH4Pm6NsOam61UK3q
         aoB0roQA0+L+hA/KdJkc8Y34sUJbVVjTMOIOzwbnwwQ4TwlYAkGKal5iiBtOvDPiQB+I
         7ECMKbu0Y4wtLcGT7Go7S1vU3Cu2lI0lnV583F6uZbS3nrOel53P0TmPitTstyeIur7j
         Hj22ZBeiWrFahYgs1SVI/KDTFIvbxNnA1kuwfFUMu5WlEEJ1KrSF2S4uzSiQV1mSJuR4
         GJ593rJkhMq8PqMiYVEFWZv9BQYeQ84A9iv2XqrkJRbKKTy9BI6fVk+Bs5WcM9LLQW05
         E+9g==
X-Forwarded-Encrypted: i=1; AJvYcCV+70qYiIuUrryduu8HeZGSbgM0NMGmeCMoJC8Lv1130d2YLesr34Qp5ohtTZ/fpjTIfaUfCOQrbwYH@vger.kernel.org
X-Gm-Message-State: AOJu0YycIaS9hKQ961BxAfaLMto0gkzgT3pZnUK0NfPVUgg6HrAItcy1
	iMTpfAO5UPKKLZQiIu14h0/akGpkSqwBcL8E52Z8u4vtE+SiMhXjSuCAvtazbLBdSMbGIYk+jK8
	U+M2JwkX+QvqIsI1IWsawDgRKk7iii102KBPA8gk9LeokUho37t1QJnKJWGD+KrK8
X-Gm-Gg: AeBDieskyWseGDDhnkVC87vFzVt8txilH2YQxqocKrq7jOx/fTPgPu6Zw6jaLzbGmaw
	HhE1DSPdxFrrDPp6TznlwG6feOVbxOry9rh8maWGn2LHsx/MCsNxCXibun+Z+XB+4nyia7f4bg6
	oyBxcHA3RdF+i3dkeQlBQDfGTkd5oEuvRq6MDRDjyJk3WGMijQch7CkoSQZjBM3GlDZ23qfU/w1
	I27gLA4r99Ksrs4gvcocwAKG3K+nnAe3SaVW5M47H/O3vo2b2ZHgANIOEG/rFSMMIRlZRyXPS1c
	UlxP4XE7nnjYH9Z4FuzYxkP2roNYi8mHhRxccTeD/pEjuNP4OBFUn6HJ7Y0+z7PPsqSJaCLPgpf
	+hudmtlPU/lgHgQTeb2gidGGZgzkv8SzWE1uou4kokf3JX2Pe+v8D
X-Received: by 2002:a17:903:1b70:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b281763373mr265628275ad.23.1775708120978;
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b281763373mr265627955ad.23.1775708120443;
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d098sm211355975ad.13.2026.04.08.21.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:15:20 -0700 (PDT)
Message-ID: <5f58a4b7-312a-4cf7-b920-401bbe757e3d@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 09:45:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add QCrypto nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
 <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rlrHf8FdVe_E98eNaCSjVF-fZCdiRWLL
X-Proofpoint-GUID: rlrHf8FdVe_E98eNaCSjVF-fZCdiRWLL
X-Authority-Analysis: v=2.4 cv=R9sz39RX c=1 sm=1 tr=0 ts=69d727d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TCpjqbDHjloqY1tG7BYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzNSBTYWx0ZWRfX7XWuDnEzOkrD
 811+Kp/RrsDPW6IfZME9tU2fH6lFos7V6hsGFSjKHqSuphThvqFla0ZLFITx3DZqgPpwtiqNBME
 yQDSaBlx7Ix5UEm+nAEsS0B9+sUAb3WHHqMb67glxvsFHbRfvWu5lLC1V24ufGbNLsGf+1RvRot
 D4P3afALLpGGItUoqK91eChyn3rl87ru1lRZdjry12gDr8njeU0R8KB+cAE2/rxGV/oxfOmR8U1
 eBIn64wqiLD48FXmn8pvw7oxx2vgqVIZerLRGKNfxxvsakj7ptzwGFb3g5h6Iq2/JzBVWUWx5tZ
 q9Tv/u+GXrGLZpMGAS17+C3lRkAZ675XOxqg/6xqDrYQp8xxpaNBr1+D+I6+nvoE4UW4nzCsbE2
 WwREQcmiBQnZEVerzgry1pLzeb3VOVQqQ72RyDi7oHRQuP2Ni8SfgPFRdSs7y3priRBGV2esD+l
 8VeDTpWmCXCM69etnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090035



On 4/6/2026 7:40 AM, Alexander Koskovich wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

