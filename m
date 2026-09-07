Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5572C4C9573
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786079; cv=none; b=cAOQ06sG8TvRL1SIV0w0XubQ4+af1Q8YnlK+YJBd0wyAc4ShvemvF3to4wSeY5VtKjultBjLaA4dgc980Ek1GaguOz9U1zZ+/oesaqGDbJtJzWIX6hDlxwZKzHOg4t/WzE42iGfo6W3def7mCDTV5LEs8tW1iHiFur2XziyoC40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786079; c=relaxed/simple;
	bh=yzcBe8CWx8CuKM6PhuNC+5srTyX+HIdMDmFUULGmUx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6mwV2qb68nAM0txTyU17/bweZPWNqdc6CPU1XGmIg+C61BoYXN0hP0uHVpdj5QzOprrlk8U2iaq8MtvqYNEL1PziEIj8b1UHRTZull55q0VKh5CY36/iJjNGCJoFasWkx00tdAhZp9POhMWyH3gWwsvFVVXGIO5wRklU647rlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYNkjYRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcHVAnte; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYNkjYRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcHVAnte"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An40E3181030
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=; b=LYNkjYRbHTev5ej0
	8iVNfShq93wGtCm+CPnKZ1T8naeU6UCiM8db30+Du8vbocb6VR05AI44IZ/GtHHH
	YiK63bcbMI0MHAuyFXqiFcOyK2ap147FvNB64sGi2aFTHcSylc1HpfQBT9Wm6wRS
	RgtEdiy80Jck9TB4+QbCkJcv9B/r2Cno7ArZniWE4JK4CWOB0kDBO9ieKhMWN7A6
	CiHjHTttfUZdEpCDd6nYFrtIvE8Hka5212z8H6Q/hI/A8lLr1Cw63iMvWLnFc73W
	zxJMOxzke5SpMrxzMxxJ1skbunf0Hghxp4835v+lidPHYIZKtRyjmTAeUDIB5j2b
	womCWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw211sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:01:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee162355fso572509a12.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786069; x=1789390869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=fcHVAnte6oKvkNIXP7gTsY43IENMoKkQ76UwYG2J5J3EVuXLx+pN965eApvtkmFAqL
         ur+7nInofjIGAJia581wIaFxJzmVOr6JUPsbIEKefFZ8rLR0YTaO7zx6PD1mwXudAM24
         4i2xG68s0WYue4IzfPLjrGMzT8uD778ngcmNVEAFiHVhkv6RK805vl5uQ4BJt+IMRzT/
         iGP2HgY1JhhjllBbAhFhng2opeuhg8yTaPmeZAMHDPbv/0o3xwQsdFuIheVgrVsIb8Qe
         s8A1iW/v4cMKSSV6Fc3lyyQqQ2cbgK3zSGg9yD7CUl0bhAhlbm7iO4EnMc+vrc100Ygu
         kZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786069; x=1789390869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=ru67R2tLNoSuUzzsH9afdlPYPrR82F3gQRidaY43NfUPK6PiPHySMowPn1EaAsNRNj
         I93Xpn2HmSvgqzmggaLGRLV8tBs4o0H5emAWPEor6qbGifK7UMtW+2kq72EXMsjeZpVu
         SMd0IrhltwuabdGs+TfrxA5jpTI2hjvy4EkPDTC0sovQztDVzYcVH80ZGIM4GK/lVCcI
         oGltrnqxCU/pGCP6+ddzznpIr/NfqH+WKxddolcKcBJrwqLELIdF4UXg1HVd+QrjEZGc
         zOakNsQAFcdLy9FdfRl7iQEaWDDYqaImWE4aEmgAhymCyZj7PNG/MnHX5WMY/K0IDrRf
         R7fg==
X-Forwarded-Encrypted: i=1; AKwUvBwWJij+hFs+BF9L9r8LnQD2TGerdLWWCOmgsxsQD8vGwu3IHr42vEYRghzrEEXuP0EaskhJWk1GIh0a@vger.kernel.org
X-Gm-Message-State: AFuF++nvuOhGJnbehXD9N4xP8w5eFhSEP/IAQkgM001IerWuXDow2gfj
	mfkg9YJVQcycHLJ2Y/8U6A+oXeTFTd1nTTgZxpYkAVn/pyQ83pkZ3Qr4wHsoyFXu6Z0RPUw6Shs
	C2bnvUDbib4T8fMMWULsMJ54I2PFBlp2uSO6MAuYO+Zc4V7UeGzmML+VI7LFGnrDa
X-Gm-Gg: AYBFou2uFzkaU4PxlN9daGT3tEJc8JKGDRkdzH2j1XiN9v97BUsIBmOQ2sT6kVpYgGo
	pgaGlXMszElGL1YJBYHYDovsBpxX5+fnP76TfdEdYJYauSoKJ65JwEDdmywQoh1qZsx01N6n4p3
	mDKlxaI8tcLolPdHfFCKC3qQzjH5AEPY1k2AshWju3tD4y6c9xvwY7xa/y8+W9Xj9um2soHxrpS
	cyl3ANZ8AT1aHIsOoxZU7dcgLZeWaQBKnH/WbECAAeWKK4hVj3+iZpYK8bFLcaCegQqDqNntdKr
	YuXxYjiUAyMkkDtF/h3NmpAJhovYbsSsUu+77cIrViIgU12kmY+MTNyBlLgO62QyBbFG2XGLk79
	jW4BkkiC88WI/ZdCjveZTxg==
X-Received: by 2002:a17:903:22d2:b0:2d7:1a3f:8db5 with SMTP id d9443c01a7336-2db277b3dc1mr154839465ad.4.1788786068266;
        Mon, 07 Sep 2026 06:01:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr1133602985a.0.1788786048213;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm477639966b.2.2026.09.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Message-ID: <4740e69f-23b7-4b3e-8d75-d7127dd6b140@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: ipq8074: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uoTOWHYno71iq7n3AMXkoV2htoBEqaOU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX27SXsoxubZS3
 PW7lm/J8D13gu1ssJ8ZFciacs+5j4e1Afo0SsQGfbUvSHvToyz/iPO7ZwVNRjxxdx8NxHZTZDO6
 ho4P7RlAxpCH8SjJZV7GR3O0sScvQ9I=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9eb595 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BCToOkYIF-vvb__y--MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXyBKPlWhW3Uj3
 7ROnH2tI1Ah4U1sRfsvCm0te1KIEJW5pUuIq/iwcUdKXVf6rKqQVWZPONPtQdtw1N3Dagn3x9pr
 yP1hVVQaUKh0C/ZfQAEYAJJjC4BMDkGVxQ9wnYM6XnhlUuTgvk4zTE6JGcnS+J+pba9fgRqTxK7
 fUaan3D7WfHL/ZrJHjZ0pCaEAis4JCyqZUQAvUuOXi3YmAXtTDfdeisW8uTAL57uqgpTsoB4Ne7
 T4ajqvyKerCSZvzwSk8gJxhHNlZCCe29nBNJApLJqJay9HcAm95jC9n6YXC9PtJcsdBsz5Wps4R
 Gu8/nQux+2772VloRxnjWeoyJ7LGVV68L2QThubEgP6oTKINsDRSJ7Q+bKz4YKZGcu3jiOOXeUk
 TktZP65hMVedDxiMRs1HjC+4ODJWPnJlbX2bgfKjY7Uc9ROA/n9dl8t7GsqePiPuXlfpa6b/yaW
 vhdQV1v0kz6Vf9fWa4Q==
X-Proofpoint-GUID: uoTOWHYno71iq7n3AMXkoV2htoBEqaOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, fix indentation of properties in both nodes.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
