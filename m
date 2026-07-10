Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22A13F9298
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677015; cv=none; b=nFLmhil6uQCMbRrIcM5EoFaW9aMkV3wRBKggKoELttnIBrnK5n8vci8fy8cQeySCqtZpAXD2WEs4BG++u4iSfMFkSL9N0kshg8ZJ/hLp/3GntWNA/5yfrVHKTma3DSVD6NrHZ1byBCiJcPH9KPJR2kl59u00Lo8i2X/mUxRz5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677015; c=relaxed/simple;
	bh=QKMu5NmGaOO2W0KX69/PxFjkByiQoEj+2qxAeN2oiLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NrdwHjYuzLp4Yn/LFmxfn4OuqnzvVEZvg5PTwirI5+rMlbt9aJclD/xXqCeTe3f/BrwKVWMFoaaTWnv/OodEy5VlNKG6fquZb4OGLaEU2wG3OFc1qbT/qQ9VwTgd50nGPOdG5TElrskQKfytfnO5BZ4xeqgOULOg3uFMXmiq9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCjeYyxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/eGUARl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCjeYyxt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/eGUARl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dNo5182280
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=; b=TCjeYyxt2uUJ2vtw
	/UbmyqltkiGL0af9Zu9Gy6NDi2J8vmczKisc4AlHagWo7sIUOB+wwEu536JCwyGy
	LrQ/fFVJ3zj0XCvYkkFxvkMOwQMQyR50Lx5JZF+kJJvw8yEuB++TxqAvWDNaszJa
	Bh9Z7+8DQdSQX3UZ3Z8jU15d3RFkJWp99Cy84Qq8/9hLDWJaHhyiS6wo1G+AgdC0
	F/mCRQfN2Y1iu2m+5H5mU3INESUf7p4cMR6io2edev+3qc7N/9GKROOEVIfObAJZ
	M9Mv2JhXitdeNmyrPzKK11X307epV6K7F9HhoLG6b+qzk6AYYXuo2U8rEB19McZk
	rCoeQA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2gm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2322026d6.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677012; x=1784281812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=A/eGUARlR8mZ5XolISG2ul4HPqND5iIor56MjEOxA6lTNTcRGHhmq9/nq7FDErjL2G
         OYYKKj+jDmjV3FtkH2XX4jGXoxkX70/YpNMACZYqm2ISjHCqPu5TttnsaTGsDvG72vuq
         AfH66hgP9ywqshZ2s3XjdKbRCRXYak7nRIBrq3hOmI+hnG2L2XdwMBFdozV0TAgsc+BG
         bDHdI77xaBaJ+zIwyP1wPYt9lkWGfvoF0o+MtH8YZu2uEWRycUXahEiiezLkX3CbRr8c
         eXuGH4qFC9e0KiM2EkXmMFjYU84MihgQ5MSmn1r4ABT06xXtz0pYva0xu9TvGZn35E4m
         wMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677012; x=1784281812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=hn20xeKLMsuK4FQOHPo3tdMDQZeL+xdl7qJEO5a4RUg/ZPK5Rc6W2bVLQ5tgG93zoe
         pJnEesiQbINcupm32XlaDdlEM19mid2R3TUCYP8w4jO0zgKu2t4rnk1In4wU0pRunRzs
         qpijEIGRhZDHpsxh1+Pk37sdiUk5VNlXGjj6SvfqL0j8b0k99choz3rmoJ6q411sGckX
         a6diQXTDRGweXIkGihy5bA0IWl9Vm23bLxmB1WgM/tnAZ4uZCX8V0kSvF8qVpG5ruxBV
         1GAJkM/d3+ou/cMGWX+czqBi2ya0AXjX62w3oJkPSbZNLHrw7Hv/99HxUJWPocK1tTS6
         bCNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rra0s1RHaIMTVIL6pUTww3+gheGi49VgYdYTcO5UtMSDOnSNYE5qBUCa427MLXFUnVx2Qon9ye3l8+u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9jSXOfeW9tqypL8z93vMi0eYBCC2gnCtYQrKk5fwZo++2dzt
	/fxt0mxipp7/gBzUukDwK8o2uFLIWnoY7uCDLVLkqm2ec0LCaJz9wALdftBD6l18MGASetROa8/
	290Qfle/cAD99FMHQtv0WOqWgqV2Gx/dW1RujSboWDi5ZtbAUCQN2MZc79SjCvTOj
X-Gm-Gg: AfdE7ck4bapFb9CGPdg2unQwfNKYnG9P6l8sT2skGw1JxVAgu+60AwhcTpTdRY/+Pr0
	Sw0bCsBTm20diAgGGIvQWRKJ6Pa9QE6CrvYCbZqh/CR/uAbQgrF3863VGv31uTp6Sg8lc84yRK2
	aVwpHfn2fqsp7229OtzLNA3dP/3QY6u3NnZOUhyFQHW24dJK8lwKMOirolT3H7lTv0Gn7z3Dp0H
	2AbUHlDRCsT3w3jqDkIiE3ctLirDrmseKkktmd5nAmuN2stpwuH86R6JRYlbsnQwPO/q04Vwlf6
	a8L1uMKAoE1KvF4Rh9UD7qnSuMRExtpJxHY4/BsozOS57w/NiUDBSvT5eXwMIJzv+u/MQMyMjRB
	ApFgybs5SPeWdTYaKnBKBjPvTJWk9M1FKh20=
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535866d6.1.1783677012139;
        Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535656d6.1.1783677011733;
        Fri, 10 Jul 2026 02:50:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:10 -0700 (PDT)
Message-ID: <31905a48-54eb-4693-8725-71f065a8bc92@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:50:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NZ7aOAALRUaHWrAY-arpG0WJVBwpMXVh
X-Proofpoint-ORIG-GUID: NZ7aOAALRUaHWrAY-arpG0WJVBwpMXVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX4KnivUKf0sYD
 mDQ4Gf5TsN1iBcio4qbp3mRnSLmU3Pp+U+NHMzm31H0EaPEKtP3MklRKvWi4x+Tn+uBCRSqDoyc
 ujkG/B+ouPI/F4OKtSr4f3tT/i5PqTtb88kzXw8K29S6Yuhm4i7pvKeCJj9FwFwj7+DZ7s/c3Lk
 jHJhAtedXbO7DKipyZTsBMezn+eGrVsze2CuEF+WSS8nPyXh0RBofpz4cnbxbd7fZtIMyrECD6g
 rchAJ7TPBfORdv0T7VVayyTsaKqtvOCVkUnXzxNLQ3FMQRWpWiKGIqBoOsfuUWo2agDZ4m2o1HB
 nXIRejwzYOYfgd1CZU3j0Q/UgLOIz2qDcJtpog/Ix+u5hVDZVJEoSfoCmiCoII+I3MIu4Xnv2YS
 +vVnADGOaE6JHyTtansADxI63DLcDGLtHUzXzfN877z+AnPqsOfUdjNsFTxO2D5LayxPD1hUA0U
 jMGIzmhlHo835HsUJKA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50c055 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HHMlELgPwHXHAMwrrFEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX8+25A08E5atP
 ZJ0vVy9wblq8d5XdELVBuesli5BlLKBuP/2+jMnQhG4KNAk2ZNLDhqpzBKypRTepXZawsRwlG20
 U4tDoUEaVyjbVREMr79kRLacbrVdUiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
