Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7744C1503
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726075; cv=none; b=EJY9lpAeqSjK4c7i3bMu6uaf9RCUcjQnHxCU2n1+oJ46CRkvAZ4Cd2E5uxDfy2vDJJy51clZgHPnA7MoZ/6gHaKcEIvA3KjGixEbXDNVMjuPW7nzK2ytMKQIoKHgFKjT7jPCA3OAOYv+z9WHq+TefcliLmEASA6rxJOFMG2v/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726075; c=relaxed/simple;
	bh=ODVmTkrsZTOLsERs/mMFzF9HF4r3N+YEx0HdUk9SIR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxnQJ4QBp4vcf3T2XuOL/zTM/b2F5ccMUe6af0KtTy0I91o6gpliqjClUITTQslEunFhrJP8XbzMniXxSTgGPbg4CImtlgt7adojHlC37N+GMy1vsodARdrMFRK6THD+RQS2Pb+JUa86adfTpx5EUaesSghMutLU5hUGVFmNw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogUBvaEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GI296D9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogUBvaEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GI296D9P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eE3F522588
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=; b=ogUBvaEmTnaaFXm/
	jW00N+7dTJd7RIPTsJvwzFnVH5ua68O9Oac4uyIem1BN1H8JcXjN73EGNYeNhiu8
	y/ivgbYkmSRVRz+FGpLMzdDQiwmVzrd4imP/0+rAbW4Akp8A1W9koKjJ6seGr2wB
	fXF8Xq0XWEZx9vb76iTYZzjLAd5eCtb/n6nBGOU0mCpD/Q3uzFo05hvJGmLgIQOS
	mhEQBZ2cVh9KpTubYIug6fHCD3c+mqjK7sOtJ8ap0eVKFI9KW7uWX5suRDGhjaqQ
	7hziXLOzbLIphRo2gGwA159IgDcOOmf7ej0OWx+SY6mzv+oEc5wndXFEBUN5J4Ea
	AIWAjQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebcyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:07:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso417696d6.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726071; x=1790330871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=;
        b=GI296D9PWngPqc1qXiTqL44peJTy1KSwaMwIgr++AJvOjp78N6XToRJC3dLRUVusYY
         dhcE1jgfpzoaehXoyO0PIBMcX+KvF7xWmVfHCYgDcc10BB5aXjFO32qQ7OB5ailPkhju
         Q3iNrL50IR2fn7iSCSmHyO2ubZetBxmZElTxgIxT+QjiOmWerQCUbNA6/gwWrHUWgC3R
         wiwpuJnolCL4nOtd1TuhIuq9M6XqdZlUdnnK/Yylmdq9rf5lWRVvGMR+XIKmLdAoRkt1
         53nX1T6gYECBt4HxPT+NwJ5ANnzW19gI8F7eABTYS9LbfjzvkSx0QmhD6ZlbkPQpp8s1
         kPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726071; x=1790330871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=;
        b=yZ6nsVgVtXMW7bBtv3wGJt7obDPhyZFy9pEbIX71c17BzydnvFPXJRo/F+unx/7UEW
         w0X2gn4nj/373aG78jaPTv1NadLY1rpw+IqlZrmuZkr2rXGt+Bt/jYjhSWfttidu9op/
         w45WxmxMs25/n+KZiWK1M9RHXuqHrlQkkQYbX8DO0PscLUZAPhqbuVumG30JkhjhfwQE
         E52dqbuLaYYnfyKC7cNBPFQUMYxti/vXlXGubmoX/CBG1ITgZhKC0mXW1oxZvWN8Z0fO
         azqiRl20gWbbELhKlV878QbJTVGd6rTzTLEX5+rjJ+i4JYBTbwlrT2XxDKve4qEU73NR
         F8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzwXJJMmrGbot4SUkX1zGPqYhqdIHwwu8NmF5NCtU4dQ5LLR+SzgcunXq078aE/bDbNfrpU+dsmzHdj@vger.kernel.org
X-Gm-Message-State: AFuF++m4vmpvX77mRgJKk/YHwGX22N0C6ppRrKNoGL3SJD2Q5/qTHlWT
	Xg05HoxQoxKxu578zZl4MutDTqvapvWVPatoK0/slm3bVH/wqkxL2Qx4/wW0rT+vIYoCZCa1RGM
	1jK9dMEXi2MEcQt0G2RhZFh7Rm07ZPj3eyGn+WFjp7sTWQuZsh7UCgo4F/twPiatd
X-Gm-Gg: AYBFou3sPDnSD7Z80T2nCviw4bDl61NJ93eXtvvXZfwRWxY/kkJ3LzmXCS6eIqOFKx0
	CfCjYdjJDpOIBbKzo0xF2FSRHc4Lzg0iVy1941fLWOC7sCMQ+lSODgW0M9Zz/vrotniGd3roJN0
	DFtrSCKZdikakwnVLEJzTq+SQny3oEIgboHMRw6OfkLYJHo3apYAi2zfHUPkQqtqzxeYKIHtKPl
	L3wXWoX4ErZUlQ/yVcukN/+9h/5Eikh3aUFNlUIQtCK6/o6dtF+6ivfuye/pqzqrRs8CuCKvtsH
	8FS01GUHnJhR4ZkRDZtqKDnDaPI4VADslRe20yI9eylNXpdin1ADp8xdW0lMVbwaNmUgLqqtgll
	SbterN32wNoxdWx2kHPUkIw==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24560166d6.5.1789726070956;
        Fri, 18 Sep 2026 03:07:50 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24559686d6.5.1789726070480;
        Fri, 18 Sep 2026 03:07:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08182sm40252166b.15.2026.09.18.03.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:07:49 -0700 (PDT)
Message-ID: <59205ec8-78f9-4378-8556-6902364b9f54@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:07:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] arm64: dts: qcom: sm8450: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: clNTWiI792QD2Edny9UQsMEI8Oe_e7QP
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0d77 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: clNTWiI792QD2Edny9UQsMEI8Oe_e7QP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX67r4PkhUwjeX
 UCHwElnhh/y2CfnweFP8yhldCw5XlQ/xb+R6klu1vUIJF9Ucs7B3REkCsloE0xnkFIAXNp6kFn6
 xl/RiIyOsL+ezsFm9JD1DCrgm2q3ULOKI7WTL3EOxJwk5/X+UBH0vPRvf/pa4zvbAc0zRRVjK4M
 JzXC03B2Zpy/hGD5XwxvuuLLRET2xlfLsOjIFUi9+I0kQpn+GuN2lkvubBGbskHQv1OJLfPnDhx
 DrKGe6y7OsYPKf9j/E0QBe22JOd0zj2TfnmSKLKL1Vav/VCkY09llQ6lJNmt2TwkjY3AXC+zaF/
 hrN4zylsLej52cpKzZIsKpNwTax154XNrI7wEQBX5EevgYzIvy/WI/46HCJgkVC8bF9afjYq7rm
 /glA40g5WxJdUcRA4AVgYrWN6YDSxf7GGTmIIJe7vztvxAkmKP67ZtMZbqmrXqwpbGrg+hm4EVC
 IkDFR9WINf2xwAgrG7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX3m5Jpz+wQs0y
 eh4h5PFIxsT8cg1Rzr1D+3o9mRImcnG1PyGUMef6luNf66B3/d6gOZNpXUjNbJYl/6WPzo/4UWw
 ZhnJfxe0yRWZX31Vki++w0IzV6Y5viw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
