Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A2394796
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263722; cv=none; b=Ecu9HtxE8L6Ez/jN1VqSPVkngZivS+cVTr6dTa5ZfpOA6BUXbGmy9zjpsp7p1lwgRvvTXLTSOZQHtd450T8QB4tcSen1RyJmcNB7nxrX0KIbcYZiRP31Th2qoSWQkLMS87u7EPsi5WvcgQEFhmxfh/OhAvPfKD8ct8G1Dmr6TaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263722; c=relaxed/simple;
	bh=Qf/SN4zw2xWU8ye0fNf7azjg6g0yfcgHYpQ+XwHTqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLfDSNeENj1Cp+e/0MbdydL3UJtGN4iwpJlItSgWf6K8JHuvr69qZUlYtPtStr4N+HfeD5P1CS3kIHp9cKOf85W5EWB48aJd5ivyDrv7ozNcEk+VM4pfLu8rNbL8/N4I1JEnSqTLtHsA/wkrdGAyEEyyrA47WqbEBAurIRVEEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8EQxF/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5nDWRqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8EQxF/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5nDWRqC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7LuGK1195938
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=; b=Q8EQxF/q2qBn/1+7
	VhjIRX7UMnc+FO1L4p+Bn4FV0B7xwfwPs28PCP8u5tCT3iGdzqIZzleFXAnMb+MU
	O/gV3Vf47lz4amtpZ8+9qgf6jIM6Z2VtQgd0GEKW1o74XzeDXOGQMzbbCs0hqzn2
	moX7hBbt2hRaR1KrqklgeOueVJgmwFjrdT7l6WcZdIOJarKKltNzumekZIN+eJpg
	C7hDElY9W0Prq/FXy3qaNtW1E4QwAQ2ppNNs0O4c2L3wpX2hKWFlpiHov91ne0aV
	s8aTcRqmIokZ2srBDO/9Ai22t9jpO93cwS1TkfPjDPrhYJQL7hpxDAkcJqleGksy
	wPZSFg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5w266-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:02:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56c9dc1e280so803027e0c.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263719; x=1774868519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=J5nDWRqCAdNl5Pf0SofklmEu/l52i9jhA/MOJoBlIGyrAY0WQBtYY3/jT0Kslim/Bj
         aR0wv3S7XrSBvXYA1EaRUbizdixIX+6BMlTpbBPtbeYJwKPK6wqVM0XqCdZQbxJw+T/k
         mp6Tm+WHR4BgpaI65n2+JckZBWhdBb16iwK+Gg7OWnRNabls/m4Fn2r+wISDoz9dFbiH
         y8ldK9uY7hLro5hzGXSiZ0H/zBLk7cyWq5+dZ67jaj1b5tvFatUC3ChOeOyeViRqBUfI
         w060ZwIJvpMiFxgDCE1xbk05LLYs+eWciKGEhTpFk+0CUrJNjcEUcx6W9RG7BOjAHhm1
         aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263719; x=1774868519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=a3NsTsqXVgz8FNwUKDaPvPGbewOx61C+8v9iI7D3fr1wUxy54vEG3cJPtPg/EUshwc
         7UwcP9qmkMM3BeWVRwgiQe7VKodAxEiDdmQE8ip2lwwLuGg4ex8Rknq0NT+09bk+jCGT
         j0bexCY61MiV57feH+EnTP441oQ1DSaaB+78yyTQVpo5n9RqZkMQyh4Kr8CUDxRGYMLM
         XpxCSN3PHOmr49vNak4HTGoBBvk8ExsbTCrCQHCrthdFd/UrQW4hR5GSPFML+Palu/ls
         8cSR/WoWU60FIq7xlXVF5qF+IGwRQ8fme+BFwfP0cZbWR8l450+wr0sHZWI61/j2oy8n
         iTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6dK5UcG/1+31myspY1gVPFf3KboElVcnfg7M223IeepO+a0sntKk4nYUSh8Fsth5CKrKQBYMxtnBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTtfn0IObVx0asNatgheF05BmPqsKcmGigoU3f8dcg0U8nOiAk
	mwsodCDypQ2EORzriPiwEN/+p33ubrUB7kWHl5UuFTq38PQjRWmBwLyiRCJvVdu8KonyZaQMoJU
	3HCJVMqZ0M2vIzLWl7iGKqS1RLDwyawhOZQWwYnNpzymfd3FbLelSionOsgivs6KZ
X-Gm-Gg: ATEYQzxXGeB5BFKOFeNB/ZcFGaa8Nlhp3ftS9pA/QBA/iPKUurZ7oTz80G3itCX4qoP
	Kfyw/YAjmuG1JxD3Q2cXYJdYZCS9GICulT0yjBijJVYhHvxc+dw0CHXzHcfA8ODvBw0UN+u7qIi
	3ISvH+rMQ9v4clXZTTH8cPOFIucfZ907ILhf2KtFXGBMyLosl4SLnnXQopmMODFdb2upH89hdqC
	KVYn73ke7GWo7lhGmkyYPlgxeyQPgE5BbQyKEMzqM5XcTEx/5PqSBMGCq3RrjMOzZlwVMe2lVLu
	uCJsnzTu5ECmYNIqzP9OhZxKAladthI71QqA9OdJ6+5RptTnTMu6WCfh3c8hbbC2fApY+K+RUl6
	g/CR3MLb3eirxGCHQDD4TCggZ2s7i61aBdLgv0In9Oqc6kH976mo7uF5M02CPTuQWIGogD9QpYb
	vD7iU=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2186003e0c.3.1774263719479;
        Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2185959e0c.3.1774263718977;
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm473308566b.38.2026.03.23.04.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Message-ID: <e5a8c3d0-7f7f-420f-a5fa-cb177d321112@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:01:56 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c11da8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=5GD08sD1clYvvWNuh_EA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX7zTDUlwWHWeU
 gV31SgJxJ93/Y6pU6HIOTn2Bs26z8R/bn26Mz+qsQ+VOn5hPnQc7lgm+lTIFimyXP8y+VROcF+w
 w67qA23+tmBlrB4WMIjLID0kDrq3hxXSp6q2n1HLjzISVBjTPg6Iovsq65k2gBx08hSEv+WbV9H
 DfW57AMmL1LH48fFaR6KW5Bdn63PME+GGjFRz3s0ajLspGTNSqvas8OW5nmcaP5vRFiGm9IWIGW
 rAuD9BJTmNEXbr2eGj1ACfsEyROK5ikZ0byjMT0NvDjXUPF8Zaz6sZtFXppmwIacMDk46u5ZE/f
 RLRZLNpFfFQ1rFYgo/qj3mCvdNlzvzzdWf83xgVgLil1aLatoB3zGoI8Y9uhMoqbW0bfn1SNXZ5
 W3hI+SslRWT0+L2XA3hQOT+GQvW5jYZTO4KRzgvarkgNBrWfoeSqPojL4xvaaK1koqsBfUsVzl0
 PASl2lPPnG6AUEG4I3g==
X-Proofpoint-ORIG-GUID: 89kuO9qhH32g6KS-QTv-iYqMA-BgwXxd
X-Proofpoint-GUID: 89kuO9qhH32g6KS-QTv-iYqMA-BgwXxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230085

On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
> The qcom,sm4250-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks.  The SoC is derivative of SM6115
> (or vice versa), so the interrupts part is incorrectly placed and should
> be same as for SM6115.

They're the same SoC with a different speedbin fuse value for the CPU/GPU,
I'd say drop this binding altogether

Konrad
