Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698854718D3
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466079; cv=none; b=M8yNXN9GsICEyZWVagB8+k59N4lOk7/cpZyaPY/E1Kx5gcPqLiJ6PHba/3gXv6+dx6u28Hbf2UqTUrPHD4/m9dRm9jtDtirGrNe0PpWV58SVKI2KAsj3AnCZ4BbNsVkLtwjw0e6S5etwlymxz+RQyKmsi5or1eItZHw07xou0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466079; c=relaxed/simple;
	bh=idsPIr+3pZBF6LKIDN69cLPiBTmHyZ/pTqdI2C2CvLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roEKsKQO0fxkIcRuD6IPDkimU8U43XgM+ECPppV+ic3rpKbHzPi7OYbCt93egk9lTooVAmzCp8QEF08aZruhtxrmax04z2o/KO7jzrY4V5g8TZhyYoBIFloRHFq2FZSCc9iwJwrUS7dW9QDf5yh6AX3UVdu0adCSeQNmc71zKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/pTK/rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byLCVtH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/pTK/rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byLCVtH4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hR443560928
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vppERyoW3BzJo5xUE2KTfoeC
	I03u7SKMXvXaWdO/Dc8=; b=i/pTK/rNkVlprb8nKTDlV6gxmFNaNtgmLVmJYpSM
	S1vyExx26sU6ZYrpqIaNnfqZfNsINDWItyoe11Gqx/Quepqh/NQq57jvFLUSmZDS
	DNAvO2jNkTVuan4M6FK+4c46svWcyYDuOCm7TK35GyJR4Ss8BHqwvM0WjT6GOSvX
	fqME8uRniLPF2vxeEe+L5fnUES8mMIfBxqiwOTwrPLAraxgkQ8sbLXImtxlWLHmi
	rag4GVWE14u6n+mwpJqdTFf2f10FubOG3xGVhTDmGgqaeLwFoz+Rk0Lr2Z+J5p6b
	XxQW/tBKL2mRmmMOUYNgaG5/TkWMuJrA2VuCAieQibksQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9uv5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f248907fso334994485a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466075; x=1790070875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=byLCVtH4uPo1UPFP+w01Q/AyyRUCn+8BOvdzwHIlAuWQ+TSnY1FHF8ayp5hhOBQJUT
         k0U1jFIN0mioiOJL+5vdctqGF7FilnM8MdfwvOvSX7vWDGw/9zLQX3tKaTieCQNybZ9c
         vTwc13bfKsTdRE/qvTM1PYFiQASfa5D/jVi/Xu071r5LbLnxb3EMhio6LmzNdb2o/E/G
         iPfpvqrLA2gBJHaFTlw2sLDwOfhi2ShOqS+PkyZW45lmFHiEYD5L/0h5uks07f1X3/QY
         fpQrRA+mzpG4wxguw7ZBJclk1I7mTObbayqMlR+UyXKBA+o0cYFYLVkqYdlrkafSO33q
         VE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466075; x=1790070875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=ObPOaymZZ0Uv5ca/qGteAc7ED4Ei78kPcyrlvP/XCFZexF1N5o5Jp+2aNlDcTkApgg
         pBDWDgQb119Tv7/DQQ6brjTUMrYqhSL1gHSfvcr53C3CFteB5MejlE9VgsFbi5hcmChJ
         nJ8MlavZsOYYSS+leRNv2/+ibp7u5F4knNWr3Rlp304TfqoyX7dBFWA3AMsLk8UsaaxJ
         p1SXqj/012KM2NgUZZxyIcBInO4UmbioV3qr16xCR8/vrWGJFdokRBa4hdLLqBKNJ3nG
         1ndVVEUdiO18a7mlAt18ugco1O6txMqq3hLtb8nbzyTpumij0Hplud9auRQiUEyZtm8e
         EMgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCPCPLpQ/NAqfpq4SRF0Ape7uF4J3y8bT3hnJJP/XayYTiXGKYoC1TCxmIq6Wcn79SmDcdH7yac0kt@vger.kernel.org
X-Gm-Message-State: AFuF++kEKh12Yj1DLYPtU1nddwiboD1fR6VuhFIj8qyQrWkjcDircR7d
	NtGgPA1r2HSChCbfofJwmomA8kyPYHlx/Vv8xTB7StCGPKsqzqiGD43NOXp71sJEG1P8oCI6Q2n
	qjAkhyrKGQ1mB2SA53miAINdXeohkKTNM7nr4TNxe8x84SCeg4Qm3fkwQlyujWGsA
X-Gm-Gg: AYBFou2Ne0aX6KTIl21lkeUN/dbpzv+5jd3/p63RWMcNh2bVcGipxk3f8DoWtaFIDkY
	lLycv+wPsp7jdTpzvqwwq2+q9HgbiE3S+RIzn7VytdSqMH2QhZxQAHKTzKHBpuQjUfJskIedGab
	fAR5znW2kSTZMlxRYiBpUiNkp1UwArHmOATxPkDUf5CCaRUhMPn6z/L2/cQ1gFG6aa/1/IFyzt7
	Vb/AhjIqoCYU1SBcuuDH56L/NNpWZqqZ8ekA5RfAwhNcLMwgInixcj/0DFdPxHbEKFugW0blvAE
	883dBF77Ic9hQ0CF6BiTmxhnXE4xvF+1BRUmg+omkNH5sxbFuJeR+tT7B1cJkOigSdnkSlGy0MS
	kcc41VNEzZXGQQ/A=
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1748385a.47.1789466075285;
        Tue, 15 Sep 2026 02:54:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1746885a.47.1789466074829;
        Tue, 15 Sep 2026 02:54:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm34465272f8f.19.2026.09.15.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:54:33 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Message-ID: <ffzuqd7jofwosprorxymtv2mrmvdoi3uif4yvgkhcus6m5vb5t@ahitqlqnb45o>
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa915dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX3ZbG2tHpeZN4
 yltl/Z/VWjIy1egdYYK8jb7H01nw1wPTmltq8dV+27SOdvEfAGfiKDca2FbsxMebqL6N5HfZo0x
 YyxAwlHTzLFzPrJ6v71RztSZGxoLRIIYX56LXUcKefHnj9rLWnwgnsUpzyt2aJYxTVjrwhQiCJq
 Ffg9bNIhCBrn2mNjmgj3nrRTcuJML4pO3N3BNcaLqD3I1fOthAtZF+amXhV1PEvwO3uPZ5lUQld
 LavFf33lZHxHUakUL+JzCqNHyfdJeiExH5CrdV+H1Ch8GTXMTnpSSUFBjXNG/J1AVkHlCbhm4YZ
 OnGmdSwtOC/ZOp2EmrbmClsCjpG8IVHn600eAPxKontGgBetShPY6MKx4hciqAyVUp4/0JUaJc7
 C7FprvsRssw6mX6wH0pUQOgvuM/H+tS6TLI3Annc3QfftSY4W3ExZGhTF89APA3prdKZCDaiVqy
 Vkv2RKsVzfKMjxBzsgA==
X-Proofpoint-GUID: RfpbMmYNOu0fWySaPcv4NboWfKYOG0__
X-Proofpoint-ORIG-GUID: RfpbMmYNOu0fWySaPcv4NboWfKYOG0__
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX8oSblT6wwyJE
 RJ93AIjKtfly17EbhrFfxlQAuoAuMC6A8J9Wc6XzAjRCkSKg/hZNtyKwMiF4BTuHSlPAq2NFU8O
 uYTap4s2I+SdVgYFr0adpyH5yWpErRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141

On 26-07-14 16:05:29, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
