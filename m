Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17C4854E6
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131881; cv=none; b=hOGEmPVZKuKGrNNJP5dMgiKgF/OyM7MZjkP+2IO5QnpAEJPKsAjLg6qdsHAR0b9+hd0RNKJ0jtez3F2YxPNuW10VB8h1p9uxzTlJwkoCk09R1Cxv9ZzKinQJsJhWmPVImsrcAbl/mwRwSP6yXx8JChgic2LD2FVXZIZgXn5K1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131881; c=relaxed/simple;
	bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7NaTI+ed/Wo+k0FwuS/5T5e9JwGoEENcLmVwS+YXpvvqbdwCprgEQiUrCKv7fsLdNFGF++tGNIxFayc62/qOuw3ervtG+bW4m9QlSjpeVHmBsol6/xraXL/r4XiVgGYu7LtXpK3ggYBcyUyj6ePQONyhsqkdptH2viwCJbMsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUflGMsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOklx/78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUflGMsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOklx/78"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCivSN4140725
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=; b=MUflGMsijBiHpNRf
	z1BbcZz/sWk8sb6u84LRZCyYWjhyGku+/8V0IPAcMVa4StptWJihLnVP2m8uVDUp
	Dca2teLhrf6iuqPbyLIYjDdnoavpNZTCrPQ0AlT4WaKs8dK9y0M6rQK+h2uQOM/p
	kYrhiCWSuHDe/Bur3vuaAROHQioKMurgL9xpPt1hjPVI0k8MkaiObhebnbL1kv4s
	QraRTFevRxdnSYBHnorSaCIPKDhVtRB6mgG1rG5I5CA/x42V38qSOLA5qYkOzzYw
	mM+7e+AcxoTkurHOeLPD73NEf5pDuKcAMr4KpI1mDJXpUAjwqB8ufPFWCCRAbmVg
	/jVPfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr9t1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:04:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1355770a91.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131878; x=1789736678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=VOklx/78vf7lOLSKcVj6ScbssLxs+YK59zAumQMzUbH9YRRZcG8JQWV4YPBb2eP261
         notOrrAbKHPB9wYl7B3umAmZTfOo7ZbbO5JDKKxuybFWrLf+uhQJa7QOnXbPBm1oNwe8
         FGZiAFgxyo5VuJ5h0VRx16wRBRsDk6RkSENY7W9vM0HnzivtHo4HhA+XtFTUfhaHBZ8u
         wT49apVvpprHg5bQOAPEl+/WEM0oXONY6Arkc0lfCgNmkPWxlNvovoXxn73kGWaUaaLI
         s96XZH79VsnTA/o3MjIxBws9BtpPk3lyN5YmSPgmcORtbLH4xj+2gzIj+fQRNavlyVRX
         8MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131878; x=1789736678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=bhInUAKfXjGaJdGH7kNTt3r4fnjAASlVLewocGOSeo/FSWZ9eG/ssrBTBV4dW+zleq
         5kFMejDni+Zm/16HD1vs7mposAwMCUf5VWGMlUMsMHAS0NR5oa7X4HW4BZE0g68mG2yA
         AjmNXN9QU5c4gVFVwnuKlozw2jmdnUJ57Q5MOjCEY3qXur4FrdU9BSc8Ms1R+N//suBg
         GNmZs2C5tUwe+RngZkl9xJ6fkROxVH1es0qv08gwuP1uN2WhcqCm8NJGgo+cDz+bPggc
         x6+7kfl8B7wsVEJW92yVPqRzqqdpl0Eo7vRK0AcQ1KcwlajR0eeAZovqPuyseidThhJb
         16pg==
X-Forwarded-Encrypted: i=1; AKwUvBweiAXHkJgQ48t16pImkklwHleOF/cTeEhb003mk+Mor4Jzk5jUWwliAQTDacP4eC2WCM85PYFZf7au@vger.kernel.org
X-Gm-Message-State: AFuF++lfgc52MSygnOqZSZxkfRr9yPHQM6rUXfQhO9DtrDu1673ySbcp
	/i/plpS2F3KY3OcWAIq6Te/DK3yj6EeR4tzjbX32jKkxJ/pam4/IrmHOEYzBXN051KD/FDCtKSI
	oCaWMDSQ/oHR27UvL7pFd0UDxlAI93ti1cM+y77gIy/aE6DAImqj7GLkHo22rr8qc
X-Gm-Gg: AYBFou3tR8yx571mo9Zc4Izy5wp7P0U1uH3/RnW90Fbqx7ahm0s6rPYGLpt77pQBFR1
	nnZGHEs2KPHmAVMMeJv0zJrjR5pGcCX64R2l1Mxfswp7MPmlSxwLkY9jOH8/Q1UM8j2qbaSIGXA
	lQ9gAbMF6aygaB3Ona1Ql26zUAmVOLhs3C/kida5oSjnGyb5Ev/MG9xOJd3y4IUpMaihxa7e0t2
	G3OykpjCEmXlYL9e13VLp02+s6O0M4eyAje0lCfD5ueaSuS5466OcbuweCv4Ft8v6k3QfPFd7Iq
	EXtBGPOZapqaFULVSoiklDPHWa+jGeuqSpQmLmX2hqn9tAtr2ms6qcfkaahDVRXTKfRfkpMPtQP
	bNsBeA9NJgvLfSajzcBF8q5Hy30Lp
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888210a91.24.1789131878058;
        Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888140a91.24.1789131877497;
        Fri, 11 Sep 2026 06:04:37 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7387462eec.28.2026.09.11.06.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:04:36 -0700 (PDT)
Message-ID: <59dafd2d-ed87-4d31-ba2a-546c8d903d44@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:34:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dUh_bbrRAl9whaUxFrZx4A642Bh2IYzr
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3fc67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dUh_bbrRAl9whaUxFrZx4A642Bh2IYzr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX6Z7m9IFKRmIe
 aEO8SBQIavoQLaDVJs0AcII4qpZDWk6rpahgkmu3IypsSDUbMLeNUkr73fETaZU4nL/751Kfrlf
 MekfQtKdiFbws3jfeCtUw1t2i93TpYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX22bM/f/HKWeF
 TzRq+/fYC8NJnRxERwUiqnQCMGqnc/c2ZEaPIIqvpGqbOfHuNsUIjF6vN3mfWeB9M+mJpvqo/jH
 nHFVB4ksYPZjkHyVk+oG1NVuRZpQfUR6Zl/b7HYxoAaCGJ6WGc1GZL1DALGm82vAoBHqSW3VjkT
 j8oDBUrA1q8OKc0ThO8XhGaYM++PjXMm+i5kRImqs/gi79G/aP65BWLVyPeu5ZOCn2dnyxCo/Oi
 uWuM2gSRRxOiG9882QuHZQAYB3xHtjkIYmyk5ypDT5LrFkucAkBQLnh9HEPQdetd5OjfmTmeYsl
 sDX30+pBdNp446kQe4wj5b39XFAy2ISbJCWUz+pawX5a6BvhOv+y3hlYijwQxb1Y0HW6v//thnU
 pxK+xaUieGcdpBJbkoHHrMzvFvdb/QOarFMXawEtdppNXsOQRgIDvK8b657RnbT4PCAp7d9qu39
 Qpc9P3C17L6k2jmJanw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
