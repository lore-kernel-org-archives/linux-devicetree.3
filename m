Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557585;
	b=lDBJ8ghuK0fDm3dJkZ5IddQcFZDOHvm9NjoblnLhdQQC9he0V5zYgtt/jEIlheM/GrZy
	 u411ZqugyidEUuIYml4ZQRV+vYrFha1iPN4IafTZkEzmRHnyFUm8CSWVZgEkauc78+cKk
	 WMVB3bZeZenlS3VDmnzJXZG4cJx6mU2YpLHSh4ys11N1rBlMltHwr0BHeLkYS1Ux2LAF8
	 HupwEEttm0WSK8zZm4RzxwVu6szub89DPvVN65fIcEdcn4ruuZlms99Nx8I3EAHMfLBMO
	 N4VAjGUYuayHccon7K3GCC/0wrAM5REUHmeGUzWLFYcShb73d1zFC6DoDjQY45IJgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
	b=FqZBIto2cwxyn8luNL30i6rLWY7gN5lvVlpg+fsVWR/ALI+uxW5g4W2MC9Q+0hMZmauz
	 r6qqHb+1M6C5c1l1Qu394dHe+8vB1I1k24EMon6engD5u7e260kRoISzzc93olsZbfkvR
	 4O5wUIIHOcd8TN5D81g5zw/nrK7aCyVTShlz1ELFLkhCmr4bfU51WjViWld2LlBXQF5qw
	 PE+w3HjUM4gmMj+J4nBWHvMrTXKrj8gcbzVQrdotnODyIaELZ6nAw+YCUWPs14z8Tx3P7
	 sBzRFtDPPDopiAFialU+q4xEmNv1Psv4Fw+qXtSVZhK/BhxhjctO65gwEFPLf/8/LJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D39606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EUDuXOlR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtw9YpE0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Nrd3616271
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=; b=EUDuXOlRXuJ3IcDz
	2DcpKzQGdALG+oJDx5gaNbkmaoThuRjrdXnMyNVETD/BnGS4mT2ZtezAOyg54iao
	79VA2Txb4loofUy9wCNDUlB1P473ZkSWTWHSAbMXoeBh9FTrDyrd8eJlUovndr4L
	SFEmT/suSlm9O+JSa4xFACYwStZnNnLg5GfFB5fPpI2x0Tshr6GTYylPN/hHtz9M
	S7wxj0dzXZSVXMYtFWgqHYe2RMZ7RAT8i9R+sYrXxjLmcEMB1x/98LUb1rF2rVyi
	s+rfGrs/EwC0sM4y5HjuCmW9p3l6VbsQ7wBiNDO6iDzZHIw6VQcNtctmQjYWVvLV
	K89yBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aju03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:13:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so18789985a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557584; x=1795162384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=jtw9YpE0gDV9HKApclCQGi/Gw8fBuf9exXV9R/cCEJn6BhH/G0QiMFuarhbYcg0BMN
         xvMzHKUjSLdtEI+UYIszwNqAb1ulYHGMaRCWJBtkMxwLd46fLHTDiXhJaq/d0pV1g0GD
         VOUJ6JlzI3WJ/Bfy5SsCmKHEgjc8BB29WGRslb/+gIGIQBzNOCubYzSHyPiEkHmY84WG
         4j1p8vRubZuBO2AGOKHG2cS1eF1R4uPsQC5UtAL+vXeZ+2FOJhdOqDEU0UMx0UBan6uE
         kxgkCtymJ5EIina33xdCRhTW66A2kjBKjQnMVXnnCLnU0HQhuM8J7dVdhctgDkuyedQ/
         4zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557584; x=1795162384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6K5DZ6BT6PPRrqksZkUMcUpto2/+I23hqXq9QoTxbY=;
        b=2WXIb7ijiNSunPChkabh1xLzrtsXs01Wyd3QLq0tUYwFZjbXwiOo2KcXeGkEakABWV
         US+pODKoMGL3tP9UDynfh14Ki04gV9RRs1hS6lDnv5ndum96ZdwlZLlLisBuHefeRzFe
         RKoDvhDTrGFM5XbbmUrc2NvxWY53UqnvVza0JJagDA4UZUTfVUud3d0FpyNFJgoTUvBU
         LfHjPC6iUprWdMVkYTrk9hwoZ9s9kAG7vVxdJepFTon7PX+F9Kz+TqPUNHiaRZxQsHNu
         GLX721NwPNLGETJQv9hUbAHO36pn+AkjGQLsld+dAYmd7mgzshixy6uoDk8SZ3JNZUtd
         vIyw==
X-Forwarded-Encrypted: i=1; AL+hErF23ObaMootEe4ZeBYkfphleeaMBW2pwuOeDXcbGYV8lI5YzrKte+bxs0BDzbGnUCJeS984yEq3LtMl@vger.kernel.org
X-Gm-Message-State: APuU4Z+GRdvfMGNxo47vGEU8WzD1cUi54c59IqkTwEhfAwahGgB1slGZ
	0yxZWC9RLGj9w6RJLnMX1YsFZpFj5BDYFDPXzEEpeDNAZdoMUPao6pTFnwefxUkuPn750TzZGEp
	rnLVZtz74VBEWBs+N4TLNHS8RnUF2xJPR3LS/43+/0vXLyMpyNBs7qxjOiSudKQkh
X-Gm-Gg: AYBFou1+ayyQoAwQfj3vHME9d6/V3sZQbcW8QbygZtGN+SAThvh24BI16zGNvxyxI2W
	ZdH7ROiKOBoihDHy5z/EGdMgM8+w/l5xqhC2QIIspr/FZ5rci57PxNp+1pA45+fRPeUJOeOqiA/
	MlAcGwTDh2OKnLZPTVEvo/dPLILcuHQJrsWL5DPmU7Z29Y66vGk78UsHvebJKzartKCLc99CoZo
	GJDK7SyRGISbOG2rPEfixVC2UxYu2flLPbWfeDMkbLz17bWEBL2cxbXtf8Srqy9wvzW24LOJ/8/
	1T0CnCSSu9sLtgScAmWoUMec4NQcAGgSm+jxg7GHSYG7bop1cWEr9anADLFDYdoV4SfO0SwbZGX
	vhb/xt3XqUc3qAF7KyWWrWZHTPJMkr8yKM9/HpSwjMBjpZjNpZ5HeDJKGLUeiEJS4hZSMtE4=
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215156685a.6.1794557583779;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:a819:b0:949:4dcd:da3f with SMTP id af79cd13be357-9494dcddd38mr215154485a.6.1794557583413;
        Fri, 13 Nov 2026 00:13:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63993866b.76.2026.11.13.00.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:13:02 -0800 (PST)
Message-ID: <83150fee-ae52-40ab-a3b4-ef180a29d48b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:13:00 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXyB+YSzsyo9ef
 NMkGM+1JEb9fOSQ7We2yVviY5joPxqLFwN5XsqSW2gzKStPwLCpI7Z+ichFrPOKAtn4DyLf3s/J
 QT56zsKNuX1aOGZLejP+fx9UB4ITW5o=
X-Proofpoint-GUID: tWJ6to31Pz7z7UdYScaI3hvuF7U9Pydm
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6c690 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mPRu1C3yLCZmAX2_wYUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX3NfmsU5m7Udl
 nUKv62j2xbObgU4cWJSZzKG5hpzSkWKdod4ZvL4FFDxkp4rLTKLXPhkCbCg6uLEsQ8WkIblY1eX
 /0u8+aCVNN+DURp9siEWOQ3eG0nI6wcMVtbAqQnCnZbPxeNrXe3idIch/voRut0OAje5BPD32rc
 HhyLR4FwafbU6ObKL1748HpYLkMGQO1asMEdvXY9bwj2DUbGZ7rmmxITqxEBhI/lVp9EB0kRbmU
 ZW8+VFQsigWZcZxbe0eNDiWPUdpgswKyt74bNW5f+icVekxNjLwuYz1QqIiuXuN9JTlOocXzs+K
 lsRhUHzBoaLeMHjDytdusKbHvwcT3Iu7D8HaEJ3q2925dgANtnK0/5TO+XOfCe590L40E1Pm0Gy
 78FiixzqboRNhviYXS/nVLB3htFgxCSwn7u7XsMolXX6v8BMFWJxdEIGY024XIpzEWtmCKR6GEF
 c5UAAU90ZkXhOiZUTew==
X-Proofpoint-ORIG-GUID: tWJ6to31Pz7z7UdYScaI3hvuF7U9Pydm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.
> 
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
