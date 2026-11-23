Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462819;
	b=lp+wRl/0tdzuXz3GqEmtXJ8n7S18lxrH0t0kYjs0slVAVybm2gFx68h7RJHCG1aZGum5
	 JuOXoKe2dkKdXyJcn1pvQS2PkoLucxAjLXamSkiV54EPEvzF/DiPJgP3VY/pzFZl/3QJk
	 G+vUSraJu4OgbEJq/BpNuq7ep5RIoiSoh9fv7doHnbBJLzOxr2haA5hEa+tYX7Ype2Y6r
	 TUl/GLfStPAr73cLOfPjAM+7UnaWOz8jtHSOWHQANUGMUTB1qdz7pty1fpozgWGe1U/rY
	 VavRMWFZ3bTnkflI8U6qHtJYZsHZyQevF/MArEj4LpqQX11pSdTOianKoJXbwVO+t0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
	b=ofs45iRpkP9r79AKtvEy5urFehPHkjvZNeldvXoXF18SZw6JCNo6n0phmrUsfCBQ24vl
	 mJSubnl89lks8ZNdFljEeEQwlR/AeqHoC3p2/DSFU6VHKTm86hLWGS8kEezUwLZvxEx3X
	 NQ/cLw1rzjRFjPZu4C2N5Vvo4Rr7YyynXi3Ml5yVseIZmmN+A/tcS4bkC1Nci9tUziHCh
	 yMY/OH/K2LanAkjAvm3eX0wOeOsPPDSLbB5tsb3wnZEt4R/zsxLLF+BPGN9hF47cmOk1h
	 bya7zoLsLd1nw3ehguLneiKcKbPln+GJKZ7zXbghBoo4/D/YTz53IYV8MUPwbKaGcmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB2606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCB2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxAI2377194
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQHF8sxJpg0r9mXjUhBjnOoW
	S+bWertP7VU7oU3l54M=; b=FMCyqOPkDlj6tsqZjM4E0RAqGGWIbRdO/5LunG3P
	9fW+J0svBtb6tGe0T4vZqDc8Pzf9UpWwPb7x7ZpthN2ksxxnHTdMJATjqCbf813P
	IftAagPQoY+mpj0VrfTDPMQnrfJk5H01S7I40JptHJjtiSBK/zmQC5Uy3/3Wjrgr
	mHAaAXspWIXHJ3EXQWB37e20TLmONF1kZweg9rhR1lrTE3xNK1RmNu5eAvHQX0Il
	h5tcCNfDlPLC0uXMq3pLE2ccqCiQ/LNGmcq02aB58MtfabrlKp791lgDI530WMlo
	zh2svND80S96HZZYj3i2iex+6M5ldQSD/XDbeO4hiZpV6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut493-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:40:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so692419385a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462817; x=1796067617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=hf9HanLBpNKMNAnoweFK/OazddHH3vCjpcERlge2KFfvTId6XM0ksx6HRUUZbX+Cdn
         xW4oqAkHmJVkJXZmz/pB6eeMa94kNybZCRPEEXUxXe/mU7g+YC+sDPUJNtRiYuxnZ0zI
         KnHnTElvETpakEGTWliTeZsifyfk6Sbdwvg4Q+gFyaGYPhtF9MVmhS/JzkFijpVRylry
         5lxI4EqesypYrZ6eViRU3/TC6bIxGY1umPw7vvmgM/1sESvkYclVVHO1abvzD+MOYoRm
         9RvcrwqAIYO8SX7TXArsS7CgIbC+tZg0ihPpf70quomfd2DJp8bXUJ+G/5d71QtaOavY
         +h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462817; x=1796067617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=enLrf+sNtccbiFXWVHlkB5y5u82OjOi7K8rcPslPHs+lJXTgtD3m60pv9RtaZF03p+
         3Iz4WjKxidML592a5KSamYTkA9byfICT2mN3jczmRmbqhLv9kLS/Y/z/CXDAAqb6Wt2R
         GK9mTpHPvnfaJAJKWgjn0qcgwkQpWaEdYzIbpYAOvI/G6YFSSaVEFoTt5Al3DA41xpHl
         tT6DilIVjto0H3/tiOU+4yDaqih7xrdCIen2ZM5OshXG5qdM7xgUQRexfHMGUlvTw9wD
         wITldo5DY+U3EFnz1gV44sBk7nBSeBLmk2TpJb4zQAO4NjTv3XUaLSJt1n/fYJ75bxQc
         dnzw==
X-Forwarded-Encrypted: i=1; AL+hErE5VnDAHq8cGJKSClxjiLtMmW5BKQVZ1hR4lHku/C+YJ1vjo49HhFbt10WgQ+MYEyKz4Kmbr9Stj6uX@vger.kernel.org
X-Gm-Message-State: APuU4Z+TCKh74k+UUUaxEArs9S7n8TF4z70Z8lWoHRnGdOYU/gmSS54F
	2OwaH7bXvjyAhX/hTI6Wq5ACRHvswDYj5+XnbTKqX7IQpuYlwr5xdMg1e1mhPq9tUdHDT53hFlJ
	7qW+Kyd9dw5luYz74D2e4AfoXaM4yAfy1sfubTtns7cNIJrZSbwlIZHRgofWBEiN6oqajKMCz
X-Gm-Gg: AZFdTZerw1DSIIU0gpSzPG0tRcC77nRuCm/oN3+fPrltavpO+JClCONQYfnxzz1tzwQ
	qsL5tv4HH5hoGFwB3x8MpRGSC1Z/ABjTbK+7CXqn6wFCsgdKlOUoiM61rRYLCHCtW32D8K+PosB
	Lak0/0SXJhA03IKk6QZZ8T8m2txrkp7N05F6hCmdD8H07aQb/sL/etW3P4wdNV2iY9ueAJJlsv2
	ML8bMyEu0W8dCixS19t/UDBoMfUOR0gkt1d4zegv/hkQBj99uj/OL6Q0tyAHuGl5Zu/OMPTPhIb
	xQ2nKtQOXhmrmzU8h45JoF3L9kJgxpum6j6QLhzdD/duwen7f6gAUHJm0/TZNmulNSEXub8EZJE
	/0fU1cW2BNm12clN9Ot1qRVAYieRj8KwExmb9ZkAsvtrqsyP+YVhJ7RXLcsWzMp0Z
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256929185a.3.1795462816926;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256921985a.3.1795462816158;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm27856759f8f.21.2026.11.23.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <gcgah4os654tusrceekh6e62dlgmtqggtlgolua4zewglhrpjk@4rnokaj2tzlf>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: R5GPXy8IlGcuxNgYEpuFWLG33pzoJcEP
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0496a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: R5GPXy8IlGcuxNgYEpuFWLG33pzoJcEP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyMe4fac7EaAX
 xWOxjROvxpWOyTf9MSeDPLwnB644Fh0G46QyPjrLTR1PDx88vRJXyp6X9iP51KYwVDxkZD8M3We
 jzwfvkrxlr/TNmUIS5EIzfU7uZ2U0wU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+uBSsFj0TUSZ
 BkoUGIp4DEo8qklkmzti1Xzuu+9rp9+USPi4if1fPviT82IvXUxPfbIK7jsHzsK9j56RdQS2Kdx
 pPPlf4GSfMiAcilMK31Mi3SVNDXFd1rY8OaZUlsKG7/uK4NbmVu2YFc521VQWTrA4WQof4EyAW0
 Bdz+JQx2r2nXAQSkOqQNIVMC4qr7DOM0CBHdRxS4AWFQhmTgmzsKZp1V6G+GTkveZBPA9BE0jnJ
 EWlBkvuPmno0CmUVX/ckTAGrVhXjcgAS9qJ3P7sKPWRWqII7M8sqeVbvDfE8b4y+++m1plFIU7W
 L0lgvPVOcGBzhJTUqL8AUYqAivk2wanRCWTAhxZsEqOBkKJNdCtBh0effZzhpRUrAb6pOjZKZnf
 XHk8vi0yhFskkcZjKVJP3+vN9dGQUd1r/J1Z6PMgRH/gO3tLfqzFPYAd9XYTgGfAGrDOybhjjxx
 vOg85NnaP6sAXibjRww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:40, Bibek Kumar Patro wrote:
> On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
