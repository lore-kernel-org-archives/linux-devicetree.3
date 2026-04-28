Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E937A4BC
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363722; cv=none; b=rC2WHQO424ZafDWt3c5SFO7AK/Jq5QZ320E4Q7fIDDUqoXNqk4iScrgUzKoIql6TW6YhtXhe7YXGvTBWBag7zoyzrRn/ONWfPIJMWJD4KvNBFhXvccNl9Yhegg9WOzSUuivCYb3xu4U7Sg/YU9pYVKsgF9XzL+G6jmG6qjTbwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363722; c=relaxed/simple;
	bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qF7RIhHpRiHC6ij4uyFkTqx2PvEE48uKwz+DFGKPUM3pFhsM3pjmT1HSSzth8pXSr2JvE6BgeBIADQ9ZhbpFr/ghc22kc1cQhmk/ysVtU4UwZXEKUyegwq2nzhngtwqJt4RgqDTCCZBoVXxw9ZSMIgAcA9JNqSzt3p2c0Uh1wng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlKQij8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htbhCrvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlKQij8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htbhCrvH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7uskl3968074
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=; b=WlKQij8S0tlpwaSO
	1N8mKTGe5H1O52lOrh8HwAaeYcsufyFNNcIorv+KdFUNLiBSiQBNzS7GwtQdlmZC
	e3nBU7TOmAviuumnLZClaHbMliqdhnkpNxQHYvBv3XSMvOl5fSYNfWH+8YdkVblj
	8XCiobRpobU8y/FFR/HJxrc9hk17Nx/n5BrfZHIAIruBSwRA230ESvBkd1B9hEBR
	plQGKdj4RVOxcGLN/tsqn+VjkbadOwtdkBRA5fuPKwEch/GqImViT3mgyfAsEHlg
	vBnU8AB0MWWpBl1NceBVIjuZf35kuNeycOy5aFg0/zJRBZZOUmiHja0bC2MMNnX/
	n/gNcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0g1h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:08:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso11250002a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777363715; x=1777968515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=htbhCrvHbL+2CDUpKc6d8dLbI0OegLm7c8hZFRjLxq8zSD5vII9NPgB+Fi7kfr5bs5
         we/QRsXy1TJGsrGAz5duDfhAMOwIIwKcbub4kcAvx0KNJowiicPD8Moy4eiVyvnrkfWr
         j3ajL8sJnT6MloPg9Lwf3r2eIKkrmQprzcrqvuwlJFRQN3lN0zwVrcyf8QAkaGjm+8dJ
         XgJ9sC7ottPi6CtqyMJ1X+zcN0sW25wD7ZPxUNP/I1SHmS6ZCl68TQIZY3OOq+Gy8PNa
         /d6s2OyazuFox8BxlHLgxWTaWyndElL35PVbNwOIhy4d6k/0n2CuV0gZkCkMfSNR0fAD
         pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363715; x=1777968515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=tMK1/N40sQ9kAeFXykoI/n+lyQRICrOr/dePV/zCaJ8tavzUR5WeoTob5cAyrmL0iN
         VMHmGfg6O/2nY6/iQ+vfY4i72Ohq7n5Pg5J2Jdf9EbEu3mBMY/U4OjqVCy1EltMKFsLm
         cJDrIZv2uYcnJfaujAPqb60i2j+f9e7xXw7p8jmkZFWmQLxRbFfPl+SvHo6aNPWFMiqq
         S1lsZxZ5tSblJDYmnFprbJ1hNewiciuoPXyHCNxtsNwboQ3JEAd95Lm+ofvxP+QrkXtN
         QiCsy5sJoyyneH1huScwjwIp0Osq1R7F5UZFfOFDFfuw4GrTdGtRmvd6miNYEo7vo/P/
         Tp0A==
X-Forwarded-Encrypted: i=1; AFNElJ/gDUl6/Aubtfh6SHJqdVRuj/FeFTOrzH0QNsPPH5hiUZWVVGzsh4BaeHmUrg3DvVcSkyNJP9bEnyps@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJChqsFMRaPeckAJC8dXFgu/OKLnwKblKsF5wOuwt9hU6XvI4
	zweMYVQYNXBsVVtdV55B8gm4zQd2EfkN5zr8BjeS7/LHjuGIM9P9oCzoKnwhKKbdBgWhi51KRxw
	OwFQK4ir1yXCOGUIySGAjkpArAirLTUaTV9wBf5j7wOg/+2P9clPqqxls26Pneq1N
X-Gm-Gg: AeBDiev+zobAdtP2uab1ol0iajZLkt8eu5oAmnZkyBjgWLCY9XiQsQAvf/pHl5hehHi
	lhBgrM/08DedaIz9bdaMyYdnn3vu31jZQhOp1cAK8KaIhbX/Ytnqe6EouWn16WwfzmpTf6Ju8Ny
	FEDGa/cgcfIgOZuOd3XGmBX4yTr7Are8S2siDuTm1sOtSdC7RPxXC6NRYEi80JXuXkorjpkZCFh
	aka9bb18pE4d6DtnW88YcGsIKGRYvu0JD5bSz+8tylRsN9If0MmwRjBlaag0r4h9g5mBZ+MaJiO
	gtzeqeqHgfPT2D2I2fjSSZezlrcZPSwFuKmcUF+2/RUBE+mIjhPc+HFhSjQJ3rPgdgMohGe3pUu
	jVHrx6jCH0Do3Nks6DT1TbpmD2uIog8hxZHtp6kFAnJvLzJ+FZWcO2WCD5fVMnSf2
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410769a91.9.1777363715232;
        Tue, 28 Apr 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410709a91.9.1777363714720;
        Tue, 28 Apr 2026 01:08:34 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490c4f3edsm976224a91.6.2026.04.28.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:08:33 -0700 (PDT)
Message-ID: <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:38:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Language: en-US
In-Reply-To: <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f06b04 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HCVpI3b-1_oNncJzd4sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lKL0iNM42xsSKtL7-63Gr60t75wwOaeF
X-Proofpoint-ORIG-GUID: lKL0iNM42xsSKtL7-63Gr60t75wwOaeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NCBTYWx0ZWRfXwAx76/w4pQFt
 mWk8i8bIn9HeOvSqU2asG4D8FPhxTGLslvVqXln1KKt6I5roNb62bQ8FuNZTRrM5vW+lyL+Q6f7
 OcdoPYtVKwNFNNOgj87qqPpOqTmmBBenIGezMWfFEwgc0bySimIYQ92GInZl3JprfSwf/fosfKk
 ByJ1TCgosT1w2+KhIQB9/iDGtR3azd8W/mJPDRVE1qmd1LHIQnyeZ6YIQmhyWB8cv61Ef+nn0LK
 7wEljHVbwrKbninv9FQhNe1e2647SsXycmL5e4KhDt5VO8Ws2EqtNlQACLgWtFoMsgXXwPkvRNU
 ZOE2kBUE3YTjG3pbcv0JyjZU5ItmwB2/6g/+odDHqoBtpq3aAu7zOLXSebfQ1OK/8xffPMil9za
 N04H636jVoADrYtZYpfEXkGG81JUKj++slAnQ3LFIY+q6Kz9Htr+iUx3omtlZxcS1so5Pw7Jdb5
 m2s0xJH2zhCc9UBXYaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280074


On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>>
>> To accommodate glymur clock and power resources requirement, the maxItems
>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
> This is a very confusing part of commit msg. You cannot relax the
> constraints. Each device MUST have a specific, fixed constraint. It is
> your task to be sure they are not relaxed.
>
>
>> binding to inherit from the common venus schema without duplicating shared
>> properties.
> That's obvious. Why would new iris device schema not use common venus
> schema? What is different here then that such possibility exists?

Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
requiring 9 clocks and 5 power domains. The stricter maxItems from the
qcom,venus-common.yaml takes precedence, making it impossible to accommodate
glymur requirements without updating the common schema.

The same thing I mentioned in our earlier discussion here,
https://lore.kernel.org/all/6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com/

Alternatively, I can drop the $ref and use additionalProperties: false.
Please let me know your preferred approach.

Thanks,
Vishnu Reddy.

> Best regards,
> Krzysztof
>
