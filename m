Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483174;
	b=jQmnWT4OSa6aywcxjO5cvViTZd77JYMup+Lc2BkcZB+64dw0J8UH4LnG4kx5e6glSCki
	 e46n77hugBYhbOtT8dnkpcxW6KDYfu9OHvRNkVPRtjxrcWJCEucyNNMuypso7FmrmjI/P
	 d/N2s5mtllLe3NmHBB/x8ToapPmfg8ZdVCD3pDK/2x8RjlySdFjBSqk5+fOUXYVXgkXhV
	 MnLMolgLD+JmII1a9d9MhSt+Y2pwTSNLVSbbDRNf6POg0QR+bo/QwmcuKEv9Zifbl46L4
	 ypbqzE0zI5bBERc+Vl6JrWLU3g1Yh35xrzO3meki1pJDCW+O1ECuLo/pPKWe4aAk+fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
	b=XQnx/sLGzmRSMkI7S9nKyL9RcuVrXigXLLvG4DGBACAR7JTWm8s9f6meWgRuTsid7Q+Z
	 +ONqZABzc9Fd/CUcJpiZxetVz5WCV8cxI7XCdaS2Wt/Wh2aJHPnfmGGZF1wNWojM45O2O
	 F+29MlwhYlEac8soHqTIZti5C34U5qMrxM2Z6A84NKCkkSPwEaX6Kc2KKufyqHOdnmoIY
	 fCYbt1Qdi/zYvic6SiM1xpRwZhfzLHiBsptW6aH6ChY9AtHAkXJOsoA84QIm5egtVM39x
	 2rB0Ymy/5gMzRGVEZuIrXyDqFXXM7XYZXpIMy0DYoWbP4+pSCvVWUJwZCG/spxXZSsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATwqUrpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNSdhDwl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22066606A324
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22066606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATwqUrpT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNSdhDwl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOgJ2877974
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=; b=ATwqUrpTa3/ynK22
	sKuyEDO+O4eBnz2lI0YKUUEuQ35h61YLFHBrLxNMgquQCp8iLgAPXUdPOmqXNTZO
	60sfiNliEuYZWkqOAE5vgqK6EYx1T+Lbp/Obbc0gW0GspcUhlHiGXI8/dDyJ81jw
	w/kFyx7e6B16k5vFFusehoDp2VFjKeyivUKf4A+KWolO+tduNREiuVSaMnZxQ5C0
	h2yqZTamzWKPP0/7cM/mqjqDZW4JacVDyS8rUSmb6fXVHTIL+Z+QAxqK06gu1VhJ
	NSYxKissE0mO5SKqenqcAi7pOH+D2o9CpY8aA0xoCBTSNd5AzEZb750EwKEAcOD5
	fIhF9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psgpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:59:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so59317485a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483172; x=1793087972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
        b=RNSdhDwlU2DRG7b8kaTa+vAs4R2n1qduXpZpnTlZtqKIs+ZfpO3Jv+mxN9p4RZrPq/
         Rq7toT5z2LdWxASa/QT2Wn8k6FR5Rz5jGBHMC7hmCH1F2jmTFEBgNBifrh1Y1TthjIIj
         g9tydnzntlhrhTUEJgzpE00L805XEVnmOgletm8yiY1dw/HlRvD5/EtIwKaqg6bzGQs2
         /brVtpFZS4fvMHayu2COK6mYxsyMHAX2bLqhp37GdpqjFVxzHyJL/HQVrxoaEmpd5BRZ
         bOmdO4FvfI98xP3ypLka4EX3kElWrIB2q5WFY2/ydytMVU7bIxphdBPamYlREL9lq/Cx
         mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483172; x=1793087972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQ0c+Ka3BvYj9l7owSnPasgWcDbrGJPG2NffFjjy3VU=;
        b=pt1+80NBqwRpAdPvuaQwW8QqXvZGXkkl2foZN47Hl1Y/nn5v8uSqc87+NoC7ZuGCSt
         pliGkMu8+j0D+VctESKL3yM2rtarXgJNXeRQt2zv7bsh/Ovjr/LXc6AAXFBef3QNCWPc
         QCbcRkcD/UA8XwJlKjuANEXrT6UkmRk5eR8AGavBop4jTY/dwK62wYMIpqxIxsGHVNUI
         AdT5O2v4qlQ3/9N0jq/QAtYsZaELWquZTsv0TtEok18lZcqddg0VE5AFm30OOX9tLJiP
         cln0Ve/s1O0wvUbiowjKSY7kc8r0Xv/6fuoHdRPurdraqXDAqKM+GKQJLFPo1MLBncZl
         TldA==
X-Forwarded-Encrypted: i=1; AKwUvBwSVmJHkUvepxA/9rzt+kFEHTwQYKMv67y8Vu3wFCOJ69m2Yxg2Otxf4EAm3SXJokp0nNHYcZg7xf2F@vger.kernel.org
X-Gm-Message-State: AFq9FYJq3iL2ixRWOLX8yXl3e7yCJ6ecFfPqVmSuP2b5cDgjsvwtCH6B
	RniVaUshsrOk4zSNXNkqzBHQkSs4ZGCkiHFxqEBlhFz0sIglte0QG4UnJl9o8YxrrYaAp5o/ImY
	MTP9AAzcfb+tnpgE8cLtlzDjyTokzfp1eccperP0akJwlwiMKOf4lG8AToaJeINRc
X-Gm-Gg: AYBFou0AyXpDNGaVaSPWTphxnszHmNNqzxN9ZQtvjgzT1Vv7N4uzbK862UfinPMxpgA
	jOrb35N8CwMj1lLmMPqNUvWT+uWcvnEf/0bVF2952UJoNIy3N9c/mKB7wz1geq24MZ3kJ1egwqo
	lXV5z4BgRDcMu4ZfcLYzJ9FMKAbtdxUDKN9/3oZv+iPPGz8+mpjW6SUx9BiHE0tsYrf0G6b82UP
	jRQXkOrho27gwuSi9oVuYgGGR7m+mGCkoIMYvEiDTvf+QzaWu9pjBCqfigygHCcU9TtnvWQ2jkc
	53AF99kpwQLzXgJe16oUwjwq1ROBtGYCbPIm5y+0HHIX7kCOe8+jn7Dzo/nSi6rQLGxrtAKFGHJ
	gLax9pS85MSb03diz+Txf8w==
X-Received: by 2002:a05:622a:8d09:b0:536:662:3776 with SMTP id d75a77b69052e-536460146d1mr137837541cf.3.1792483172211;
        Tue, 20 Oct 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:536:662:3776 with SMTP id d75a77b69052e-536460146d1mr137837281cf.3.1792483171696;
        Tue, 20 Oct 2026 00:59:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32897fsm456214766b.2.2026.10.20.00.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:59:30 -0700 (PDT)
Message-ID: <4f586fa8-e7c1-42fd-b853-a2093e8a243b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:59:27 +0200
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
Subject: Re: [PATCH v4 00/13] Enable USB3 for Qualcomm IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Stanislaw Pal <kuncy7@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad71f65 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=C43bMXcMikSIT81_BHoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX9MLJ/yvVa8jG
 pZaqAmchddwWk9ixfiO4rTApa+q2Yl4yo8rafYphceaPajjjsCNyATaUC1w5S30+qYkmWOtkyzr
 alnNBhGLJOA3dGpLhO+YC1RVhd6TKiywTxXCA5Ks7d787f0LMnJKlrB/I1IBk8ikWMho7vDTuSY
 WHbtLX759YkjDIkmUTJQ0dmtT1MmsPsaTnkUsOYkvjVCEti3XH1RTuyKPL5gP9nPM4fS7I83IKt
 XcHuzRlQaEcc4hElFL1fqnwHDP/ekyjOHxmS6qKFnfCeS36gqeXZp6DIIcZxF+ZLvU1ofd7OmGo
 T7GzPYhJXMZghULr2gYShoqCojO/Rz5VzBkhJTpVMij9var5YKahR5fEO6wBFRC1wwYASUqdBee
 X/b/8yvWbGGJGaXryLBQ2cTAs3DtD49fK8PRzNmAJDbKMSNu4NfdA8koUIzgOH7wN8i4UtDvn4K
 XFPYSAGfr7yk3414oLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX5Nbcs5++c8L3
 Q0WUmZXZeS6TAa3s9dK9lSDcjVICvJ3eURP6rrBBBWXQscc++6bN3zLWssZ8KW1wMCW6/NYW1xE
 4WHslDZ9aP5L3tQbM+Z3JDmtzop83hY=
X-Proofpoint-GUID: 4kRNM34DLo6Oq3YGOJsLGgv6o5UppTz8
X-Proofpoint-ORIG-GUID: 4kRNM34DLo6Oq3YGOJsLGgv6o5UppTz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 9/8/26 11:40 AM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.
> 
> The series is now split into 3 parts:
> 1. Flatten USB Controller Nodes on IPQ SoCs
>    link: https://lore.kernel.org/r/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com
> 2. Enable USB3 for Qualcomm IPQ5018 (this patch series)
> 3. Enable USB3 for Qualcomm IPQ5332 (to be submitted)
> 
> ---
> Changes in v4:

[...]

> - It's worth noting that I left the logic to register 1 phy in this
>   patch unchanged despite Konard's suggestion to register both
>   (PCIe and USB3) to avoid changing the existing binding for the
>   existing PCIe phy instances in ipq5018/ipq5332. Although the silicon
>   is capable of supporting both PCIe and USB3, the instances in scope
>   are wired for single mode only. The next patch set will register both
>   PCIe and USB3 PHYs for the combo PHY instance in IPQ5332 and use
>   #phy-cells to select the right PHY in the respective PCIe and USB3
>   controller nodes.

We need a bindings change either way, so might as well do it
"right"!

Konrad
