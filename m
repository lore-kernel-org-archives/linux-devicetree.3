Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8977495530
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850119; cv=none; b=dqEPNlykZkxvPyfU2k34q1ZsEpm3dIyyVfecCvKotQfiGnbbIyWIQ+FFmYCjmsdW33zyjikU8MBDwGOP8qrmMAckuZymaRRuRWfoAv89QZCPbxIEJRTxfJ+4bHAkQKVGt4C6GVJeRIqMDSZmjXzOrj/VBrHqNcBxbqOXEuUmvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850119; c=relaxed/simple;
	bh=VLth3SEu7qG3r5aWNeqIN5rjqfJQ3Q9Ak0EseKunHjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l12gqRRscX/GfquM96YH6MTe8rv1ToJ9JEa0DItle/dQ+a6slGgBe+/PK7r6P4bgzhfafqtpCTk3fS+ZPzJFtBhieKHUPWiAq3ZzXJdS3B6pK7c3yqKzX2vWtodYCTYbFtC4jcX/jvGDO2ts0BEYaLxGM6fen90KjDExfEqfx9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jecm9R01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Umlqj17J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jecm9R01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Umlqj17J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbhWD1310842
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=; b=jecm9R016Au4SOfa
	9DHqvLJPactOk7aQdK/C4SVlQIDFnr46AJq3kT1lRpuuzEuEStjSDhuWZmBgFhwz
	+tgf26c9sVpNxGmxBxVJKgPo8eW8YRfojy/11FRy9/tXbIUvFT1TfgQ4KI2g3dio
	U/qubr+FLspGfIB0dJYsqmwmjLn+q2pPEB5ISe67RM2QzunWZDMDi+jnlzc7hGIH
	vBhKrjHxmmNe63U6F8+esRq4NhYizZhKei7/m+4Ujojc7EZ7NDs7M5w7jdR5CEPh
	yVwGzKt9J5X8o3P1gx6ZSVuO8ThEdUAk+MeKeJl9E8tazr0mt+TLc3A1As2Jakl0
	MWu9Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5kvpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85415923c8fso150999b3a.2
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787850110; x=1788454910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=Umlqj17JRtiVoyDa42/OpuypxTSUCM5VnbGWWtbswpMLHiBHT5hTTbPanOvf0ZZNxA
         cjH1odyx6JVeqB9gbobnGy/ckw1ECn/E/sTWLIPiZYD7r2eLkBI3G3qwu8JMWHi+lKAp
         1S+30KAJcQSav1Orw2k65VMWmV5l48SId+D0jPoS+nMw5vEM4WByBWuzPWoSDXziZi/Z
         zJUD4OKDkfU/5pnQe43nbEsND+OTR5JFqCBvNCsp9de+8p4CMTNhzU6ABkpkoC63hrQV
         7xLJSqTmKe00JuOrD3k0M5TQCVXejmzcx1LMCnQonknkBsQO1OtLfF+myeyNMtxMCkj+
         bS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850110; x=1788454910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=DlvP4cRWgS3HAucLPTxm7DOviHpyuvAOPBpoIHyUaIbSeBDxumTkVPYDtkci4L1Gqz
         RzhTtA+bbmkaKevBvOrevlO2oyXsektjgF7GsUSt5dmH1WzEEm9vw9jR1gcbB2cK1r/d
         t8oGqVIESTJYnwdeggMYCOfCOROAOLwbrEIgv1MDtpdhsa+/0/NSBqfyJIS3ildLsTrE
         fPAXPTNtf2/NsY2EKec6oHlIaaoENsa/ZCEYpGGOMmtdpMhy0lH+OK+HlK/lBuS0u9h6
         24/E+i3/Vdr0JM8NkMOp2N0yUUeA22lIHzNV4C5lRu+rSTsgUm/uhYFE43jkKjYUhY42
         Baww==
X-Forwarded-Encrypted: i=1; AHgh+RqFwdWxsZufYzQqi4n5GMwRz2lCiB8tMvg2TNrQM7vPZg8mS/3GrcAiVTssaG1L2MCJ0g1SrSHRkP8W@vger.kernel.org
X-Gm-Message-State: AFuF++ldIbjNR33VW3pOWqHO9S7EXhOyx4Yk6XRSu2Q1Bo3HDIXUCz1y
	qjtSnh2/z6vxzwYc3Y4H5D2oZg/0exAmejjGL7hCYQDUO4GTABHqkbakCAJeW0h5Tywxc5gxHq9
	+aCB23xoJLsdKPHlS1PPw+Q4+rca+dOHvARjZx87s92IFP/MwD6HgQTmWShf1jGgS
X-Gm-Gg: AR+sD11xN/l7HVudiC6mUJhn1Hjm2OYU1+hXvY8Jy2D3/rLdV2fVXTp3hXlfg6Zo4El
	YESu1ikouMegVmDyNDwlDVnqS0Z26j/W365g0iWdGsbVMSgDKaqnhRYSJCnmJnFmpAvFsSvAO+1
	jwmNZYUVyXIiSeOjeJtpwWE9GizmoZQ1O7W1tH7XjsTbextnaJeBMpyjZQ2MBR2l93Zc/ECb1UF
	9dZbTe1dHL1bAW9QHPRtWqGwopAyHhD/VS5gDozu08ACk6Az3so7j7mL1zfEy47kRQi3nvPcZGd
	Six368HVYG5BlpyX9VJrqwXKMo4e7m5qnlD45U/kcywc89o12hDmjOZZr1gmYvIGa8gbe5RSn6M
	XswiKhK1sClWC63XZNzrVJiCXlRt6MhM=
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115438b3a.12.1787850109603;
        Thu, 27 Aug 2026 10:01:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115017b3a.12.1787850107481;
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd81d22sm2404824b3a.35.2026.08.27.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Message-ID: <4466c3eb-4de1-4240-8fec-765a4910b217@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:31:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
 <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: epx9SyR-uw2nE-6KQtd7w6TGRwEb057J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX3VcIezxRBd9+
 la3jjk9OxnRPeE8/GW6kiFnZXOT7/0LSCRI7UjVb2G9XMl72wnOp8A3sOmujAVMinhJ4XX/wg5q
 ne0+KcqOUZLQMJP9elkg9RdHeDDOi+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX7fsQXGSzEpNI
 X6QFUO3wzJGF29c9I/RjesZU+QdKSf0e7lk/pp1/T6U9wprfQp3jXj0PsRDpntLG1A1AhxMQ/Q4
 xX28XF6ykfWuw55BxYYRkkxU/82O9MpAB4u5zEVF5i1sVwbPyugOBImqb485/WhEvCBrC55LKZz
 YJZ8H07XWDy3pH6VhOu1NXpDZN3GoIQjeAEeLJPVWRNrFg6R1UqpbX43/CDJtyK6C++I5+dvhHp
 OTf8RcekJZJMc5KAldu2PW3LxlnSg8Lq8D92O3KtasjJDAkADnTTHiyAGSjhV3q6+HiiK9x1l1R
 5/bz+b16mY/ApwB/Sp/Zg+3M8M6ARXFJI93gXkRYv/LLyuKjdqwyp4LUR/n2wkkoiiojHXxlsen
 X3zr1bOe/0uXcenX497QnCjSrM1ASZERmfJn9Gq3I6xXvnidqeZKSOMNkkexpPGdYhCRCIPII8E
 XqJE1aQb3DhzAfeovLA==
X-Proofpoint-GUID: epx9SyR-uw2nE-6KQtd7w6TGRwEb057J
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906d7e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeEooGCi7Zy1lAdgIjAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270144


On 8/27/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:38:59PM +0530, Hardeep Sharma wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
> Missing minItems. I asked to open other bindings to see how this is
> done. So for example you took qcom,maili-rpmh.yaml. What do you see
> there but you do not see here?
>
> Best regards,
> Krzysztof
Apologies!!

You're right, minItems was missing. Fixed in v4 by adding it to the 
clocks property.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma


