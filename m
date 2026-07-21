Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68BA3D6CB2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644925; cv=none; b=alYkuq7lG+EhKuqc49KYWsfGDppaBCLaBhxEbjW3690sUIkyQh+/8W1CZuC0QLP+STYimBcH2Aas6FCNiYYUcepaXHXI2keg8Hhed0xKoXAsAKjAFXON9d0hi3puHHZnemT/iu/kstAkizx5hECIz2dec2z9TVwz+OdR555X7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644925; c=relaxed/simple;
	bh=yIVcQH5G2ut2Knic0OdS1IC1iLJaYh7soJm1oKSAToY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0Via6VVb7lF6rEFek317aKBMkHbZ+fyuXaQyIGkbqEEZqQOHIkEQQpH9Tf5dK2e1vggfl6Bq6TerCUii3U8i0QaXqiHdwPaH9KN2oQhdL5bmAT9I8il6a8Y5lcyIwGsMUG6GTBHtcK7JkbN49s+GRnx4x/QOMwsYqiyuQcU6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WK7Lewzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYZP5S+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WK7Lewzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYZP5S+K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwB11591173
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=; b=WK7Lewzh6GDaY9K1
	zfXBPsKoGt2wVXPdN1tVzxW8IqfjiVqjcevJFkpm3OozCGuDJCRsbLaO1+yciCkf
	JkN9WDneF2e0uAgQ2t/fh9y4zxm2jU/yG7Mlbd+eD+JsSBvJRkMkp4GfGAbLlIy8
	i/N1SdbRKpZgQuy+NKhsC19c3AWgt7P+AGAfM0eblhhMsDAMfgMYnJNjnI4xEUMd
	4/wLIqvqLLgqsCQfoVQlqqKOlpcq3M9aajTlz8Bya2DkYdiGY5LWkjonkX9XoKW8
	kT0ypnk4nJ/1ghuyM9z4gVOrqaG74nxnfbtFsyuUbHKBhvIb7zVaW/pUVqsms0Fi
	9ew1NQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as3ab1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:42:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso24283501cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644923; x=1785249723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=;
        b=fYZP5S+KTB7ibvdRU1VUH4df0H5N/U445+uuoy3jSnX39xxwimE7sSD6TXohf7BSTm
         SuJuLuApoaI059soqqTft4ymRpfNxy1NAtzH6byqg25gH+Fgb3ZfQAL5wLgeyMi3RaTE
         O9wqliNS/qHNLyjdqdW56va0g+HJzTFGw71Oqk3dXI4Yn1KBtEJdbVyBklU3opU7Me+o
         acpezX9QAB9ACb/Q25XOiKvT7V1uufn6kiv0jE81houtB8hC4fOoHhUpJeUSmETRR8nC
         5V4agOyiCcSSImUZqnS3Celilgcse64U3DL5sQDLEmiVm/hR8ERHkPNuUo++lzhXaFlc
         VdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644923; x=1785249723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+EqBaZALqNLxdoOLebWj3o9+iNMrqHFuEKh9kAYXsw=;
        b=dbBTMPmb7CqObWgERLKs+Ci4RsMB+7JT9L8tt5XnXxwIq0Ljz+uWmtmeDkxSABBx9J
         cfxqlltOXf8hluzohoV2vlDdwB90OqrQjeNzqfYLFmXkn8l6lV5kUMoWKHVWnI3WU9aE
         AB5Ugz2L3Xt4ayujCuP6+qEYWVwuBNRi/m6Ca2OI4njpX6CwLMFzmXSMBYlC78JP7B/u
         R20U5J4g8XZW0CtgJVUgv1loG0wt46bc22RlaUnZW+DScDv+tVhSQZzANNvq8aWsO+bS
         o2eRkWsbhTXfn3Uxz5Mvk8rL2qbTyw+SSEOZfAT17XgJQQkWPyZHszRCeEmEFxGywUOW
         JJnA==
X-Forwarded-Encrypted: i=1; AHgh+RqulYNUcT2fXE6uk9zwFRaUsFt9hDmAkthhrWwCLSx995kZVNzHW05FKeOTVHns24PrcB/6HvU/IL9/@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDW318fmJUbfA/Cm4rM+ltg0oAfYDX5fGv5G7VtUGF0HpjCk+
	iGrJ8fgqhx0YNO7EoSrinmI/uYHxwBhPXHsuF/btsQx9RDwwJ1gwtCECD1kyToXmQPFNXUyWJe9
	8HpXHF7WpRDqEASrRDEKqlnTYCZ7iBQg+RZODPnaelBBi5TN7jWeJpwCkvICSrwqL
X-Gm-Gg: AfdE7ckb4J1BrTrcLpsO/QZtKjstB2nuGrLxNVskoybldrJjnl3tL9QLNezQyayHd/p
	Wy9+mTGqxXiMSBNl7ZELhpJs5nAxAY1iBZ33oqWGdGvfKctvCmWUM+2FqwUbSCtzrwZKheDJARY
	v+eDS6FG+4vBf5l71Pafu4SfaMOKagfGbVCeZ/xYIL82QmY2jSjpF/7Arz54pr7D2ADYEUJbQBf
	IN3NHwAyAAI5lOYc4b2D9symAWuPCkyjFrkjv6s/mDKrp93USDBNRhIkABHOGXOYMw+0xZ95OmY
	jOb0L1a7iutD9DA8VeekijA32Fp+e6YyJW+f1ZJKga6dz2EmpkN1nSz5oikrUEp7J1VkLNUhrtx
	R8EXTW/jvIt+ZBAzh3ehFQjxy
X-Received: by 2002:a05:622a:840d:10b0:51b:8543:cbbd with SMTP id d75a77b69052e-5267223028fmr20945661cf.1.1784644922989;
        Tue, 21 Jul 2026 07:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:840d:10b0:51b:8543:cbbd with SMTP id d75a77b69052e-5267223028fmr20945411cf.1.1784644922549;
        Tue, 21 Jul 2026 07:42:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm553667066b.36.2026.07.21.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:42:01 -0700 (PDT)
Message-ID: <8cea29db-d3ae-439f-9545-8d61eb620d62@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:41:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: code_0002@163.com, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        map220v <map220v300@gmail.com>, code002-2 <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721142147.1618-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXzJnAj8t5HwoV
 tHGiFy0mzt3AwX8ZbSjJLsQXkV29c5umcMb1sIlE/KnXQtld5d0teEF2wi34ALR0XbV52e4jPzW
 R6XE7ktFZPTkW5qhqg2f1OHxN08TINTjoyooqxsH3YOQhq/lHsu5ZHkOlK5cj5M+PTU1GiSp9kh
 WrBLWv0K+uMHdnMTBvole9adCQNN8mLqVmb45azeSXW68OInZkDwWL0GZQ27DHmqxNJIH/OFtCe
 hFdJRSRbnVrkSa7Fm2ORsRbf2G/FnSfj6mAzcu4f89/NadYR94yB8dD46WnjfS7iS+aCwc/mHzj
 7hvxuXGZl4CWZ+s6nIHgYatfsoi1TmM1/vwSlT32XHwSyh/ij/NAh7JWSFH7MijR4wgARDWxDXK
 O9Z0wegdZ51V/RAx7wRHbY5Z+l9cZCWbnCAO4GdoZOl4Rj1NYpAQKDfqu1DrIHCNMEOuw4DBczE
 epTfMSQJJs7FRDFGTug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXzWvWH40uuZhq
 LXuJ9N0skTDNTFSn0CDD8ZtSFO8cnYwM+AImtj01Tx5pM62aeLrM8dEni66iTdGz5PikSrKUI6W
 64l1OXdQKoyX4X+hJAbQC3Aljy5zBKk=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f853b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=2aqXnDry0AmhDEcoRX8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5cSzXxYAMn3d67S-BhSENZxUBODkVzRc
X-Proofpoint-ORIG-GUID: 5cSzXxYAMn3d67S-BhSENZxUBODkVzRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210155

On 7/21/26 4:21 PM, code_0002@163.com wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: code002-2 <hiez832670@gmail.com>
> ---

You sent a v2 with no context and no changelog. Please follow:

https://docs.kernel.org/process/submitting-patches.html

Konrad
