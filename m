Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63547D45C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261293; cv=none; b=kl6KRzBhKAKgkH1BFr1k17fJm/0umvem75zVFq9/LLFbRNpVVBy9OHy/ZLyziuAC0NAzymp2Xxia24AtJf9dJrmGndHBxlb9C+SNdgjZgmdjn66ZT/TLHkmcQ4JKDup24r+pCdE7+4zUiPNp75Un5UoTNGTQFzFk92v5bJmQICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261293; c=relaxed/simple;
	bh=ViR2iGgb2rl/bfDR/Xx0sjUdrUTgmjM1SnhCw1nK+d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMTKckBvy7438LVBqGaNPUCLrrlqYszOzxFRj0Vx/GaIvVhp/aloUc7NeE22hmsALCShsQN306DZKnosBjsptxdmH8QHIF3QNgC/a0Yvm87blRrIzz7f2AlKLsEYBvlGDpaKyTF2eQMvHo4HXYAEGJIhcvbTpdc4WZB2VCwQoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6or1dGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkiuuHFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6or1dGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkiuuHFJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJb1t2141610
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=; b=Q6or1dGNuI2kUo7I
	fVLlnSIUmQSZt/M15nBanTedSVD86vAtijhoHcqDapllWXZRi5HQKLpL3aRDG3J/
	GgVlVEEf8IS3VhJPTs1B8361yhflSvGFq9tGs8goRLWt0R4Mar4pTGvTfKxNCaW4
	v5yJxnetzcQWzRwyqee+k9vm3zsWwWnYBufVrUKfYwB45X3v0mRoP+jQUFdNvtP5
	ERTLfC4NTKzgI2HSPeuIXjdphf42Wp9xDy03huBVsO1iRV5mudS2YdlllTOpOZu/
	MLYXrlE/Y1kIAAJlxIJqvLG1iIraJenfKYA8CLZiJdYQ6rlDlbS2i6QRGNcGWxIU
	8JSwGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsy14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 11:14:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso81142685a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261290; x=1788866090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=LkiuuHFJO8OVGW+m1LbFLUWgEyvssw1EdS1wLNXBg1qG/IZXU5hhwOr45dw0rGbPV/
         Z/92txnvAw8apGmOHLfboJwbzt+iv5sWQBjadOvRwfu4OGGQ+juz7deVGRJs5s6Q+31o
         Gfh3b4cCMWnVlQ4zMjcAmHobJKz9JcsyWzv0yHAms3LgS9ja8OeLcffAVmzjgyQPKgk/
         9WIPdZBeiljh14Fhl0Z3W3TcPBGboORtK6WI2gkD20uoLH0x006Pw7t0jT1+l6hfsqn3
         EVVtWD+WBaGGSqqJRiIXMxUJM8Dw0Ygy5Wr78rjTCnDuNCFa5IavqOieiTMyXJ7F2v5A
         u4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261290; x=1788866090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bvnsw5icBTlIb729x4QtOvZH9L53U6Yn6sIKAtjAwp8=;
        b=o7cd5YdzS94R5Hfa55Po4L6Ruj0h2ZfMqgbsM1dzJl9/3OyZIggFl8yASrpJ4x/mvJ
         kC1l8CoZHxtuYbZ5X3TsllfwrIuCvlD6mQc+ZycPRybrwrzlCOb8TTEbLB19ytYctU5s
         M9bvtLGZeYCUe2KY0hMY2tWFKVwlorx0Gt9GvN6JFH1FlybjrysC+dS8MVkgh8jhAgIi
         paDmxEz8Mj4Y0l4rNjpnnSkj3f9U0NEKEK6sq6fHX3ZtzQuXe8iT2A2n4jXBG1MOHEV+
         LToDEGYc2tufgWiE2tEZGPs+defn2MDnBgajGfPR4/IGJ1DiXAT5QIk/gJ7ZGxhaRoo8
         tJ4w==
X-Forwarded-Encrypted: i=1; AHgh+RrJFu1J2UIjvf5qqFwx0R/FCPEIqWnoDmQqcDPMvfQKvqyuzy7U9zSaU7EGzGKHEuUW6SolZcqb+EVj@vger.kernel.org
X-Gm-Message-State: AFuF++mdcvoxV3KC1l/iTClsYuuYkJyib2PVaGR9D14py4VQ8spewFJw
	Zzrhb1jYPeaDc1yBKz46x8WzWTNQVO5Gu5NLuOG+f5jvCKvEjrS5p1Uc6Uf81AEsmZDF3AIm5Ij
	dV2PUyZDn9sIae18hu8XwJFUiE4jTp8CoTWOBJCeUW3NiIpJx7mhi2uLs3EfY43fQUDUTF+gA
X-Gm-Gg: AR+sD13au8Aep+xIzVlACM4kGamzSPwyOcRTRkzn5BumndcUPYTrF5Wm1NspnhQkzPY
	BtoHFUEO8s96KgOAoAyLmFDsrgvByd7c5DLaA/hB/jyBmn4nZkpNcQiG84Ay3/Kfb2lVkhcHJaN
	UGiw58zqYu8oYBhhoQNXPHcUDKY70TQt1hpz4OiZzDXk3b8FUFddDYWaSOvQxtyjUkfpyp3Fm0N
	WSScp8CGX/sOkvC5x7mGWrbexnMLTr+cDmxha/G8Fp+Fl2xOBnkYdNG2Ug3ENscxog5DM+Kvr6u
	kcpGJEdfg9UxOgX1BJPQKEOQGD1KoQIAKyiV7GKCREL6hf7KJwi4QhwOKKy052aBv1C+J9hbpwU
	/J82WtNN7yf73E217zinjjw==
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267541785a.3.1788261289769;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2255:20b0:939:4b2b:b831 with SMTP id af79cd13be357-9394b2bbe4emr267537685a.3.1788261289181;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2049sm582370066b.36.2026.09.01.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Message-ID: <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:14:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BoauBxTzQUTDUZyt9hLUonoW6o_fzJ3m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXyhoas9A7qO4J
 UBDfAMl1CYVWD0VULSOxHtd6Q9W720AWaqvH9ZPQ1z4NaKJHjLXfTyhAQcZi4mfOXYRdW8ez8+G
 1Tw/QzZ6OsRVGbpH0+BD+RJZWxtJ8JI=
X-Proofpoint-ORIG-GUID: BoauBxTzQUTDUZyt9hLUonoW6o_fzJ3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX/pe1b3oO45gj
 TZ9VhW/qx7XTdpKN1AIYtdJfPTG5n3E8/sDzlwpi3A+9z32L+7hFBXN3XHZPBkczMnMWvc5voMa
 V0hHJFCuK9eJwPXfg7ZD1D6+Tt7FpzIPKatK756QZURptEK4j3BN3/DXvTjK49+hGpeSAYYsojZ
 mHvD93lnuDhNBea84CpZQubA/LUBO/2MML68gulBCnc+gh9iII5JIrCZYH27i79eSAHSu31P9qe
 4K8CBOa7e4cnjOE+fQXiKrh39IqGIk2OGzlRJQm+aHjmsu4XXcyYEP9xlM8GfIrwzRD1sKzpzf6
 2yhd09yciPFBFNv6nRc+fdUfcqa224x9pWx4+No8ZiwjWKpnOyx+Q2natP03CnmwS1dgwFZC/zA
 /xnnc3zBRQXahkI13U0m7kq6CV4GcYzDforCq5RdRovX38e1jSZncPZbXOH8mo0cCm19ulMJTS9
 m6SL7ty6gKtVp6+QQrw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96b3aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Cuw6cLIPfeE9647f4vcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099

On 9/1/26 10:22 AM, Abel Vesa wrote:
> Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Either "Adreno 722" or "A722"

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

