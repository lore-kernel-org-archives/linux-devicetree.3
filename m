Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE014B44B7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657992; cv=none; b=VRrNkK3lZgmPU2ApxCMPK0hVLYSo/vcRoiikFNDAlyzAwd/uBs6tQJty15S0CNSG9L4cCYCE+d8uVMNKDTMikgfHYBmSMJhPbVyE3bLXgoxl+KQ4sMV1/IR0zVmSS04WnT2lRHd0TaQDWq4eLdNWL5/jT09SzffwbzxacLmAZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657992; c=relaxed/simple;
	bh=SPc69jFFjRMj/dR/GiE/fnvPzv7uPyk/XhoC23aa3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssJ8+VxitWgWxF7F5pfsYPk9XGDqnMEkbc0EEL/y8qzIStuh3MUFXbZFBS7Sp26vi2P99y6AnipVNtP2yXBFM7u9jMD/h55jZk0dS/oNF+se9iVMtd+pf6JGcXKago4eU7AxU5wyNJaVa14OTIdqaKoCA0qJFF/m8vlCZ3/KZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4jqkcwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl/JRdnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4jqkcwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl/JRdnb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRx72265055
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NDh7P9dtNVKF6HTzLbhB6G7p
	UWmFKx46sTTj1U4KSZc=; b=D4jqkcwn61SbG2mM0Oj1IAlXtBs60vWRXHfCnvrv
	umtanNrHpUhV+K3jno8y7HIZiEafeKDhWhyU43enNuOtv+nUA3/J7gZMzLuterYE
	g5MxFLixnxQUSSQr4MBvKoZF5NEGZuN5/K6QlSsYgPZ8UgQwpx7LPktrsAzwyYv/
	0RXAIq/ddCKOJnoXe7pfKn/kBcuSnDAqLxbpKQ2oPpJijI6OVC1Kppb7vRoY5Kpi
	Mj+Bc92Px14YpPU6KtBNUwT6LoyOj5CZeZCXGN+EvI92fARXj4JgPfAIPA38JHaz
	LcoyBqdcgAUxoCd3iRrk6LigLwbFZ4qcIFO/bxZXyChv0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppgxgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:12:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso225223385a.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657958; x=1790262758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=hl/JRdnb8YmkLCqJ5oEplD/K3PLPY7ZzscqJaxGtDyA5QzunjVA7u2apJ0I376alRd
         NNIGrq2zfSOQ8WyOtthpvohmcy77H0cZfT4REpkYxfFBaUD6utFAUyiZ3skxlXWib40r
         C5PwAySSGSgXZ7omWsqJdCQj6FbmChMwO+k+cpKduXokTKOtWHMDHLGRJMqMv3jWuCLQ
         ELSRsnCeTkzVXBoxoow+A2p9RIyVamw6nNmGpHBooa7pRcDXHa6JvnmQY0NqKi4ZCgln
         PjMbXH6T++dYdkJxYhyNohZInIqLQ+l50Tju0pSUfKDp+SYMol+MZNme8Tg2u3y80b+f
         SMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657958; x=1790262758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDh7P9dtNVKF6HTzLbhB6G7pUWmFKx46sTTj1U4KSZc=;
        b=kDbPQJptQ5J0GA+s8KC3ZZysL0x7W98IEiC0WXOKw0Av09UEtNDa7v+rLK6INUrXSe
         35FGlj/VIuc8h8EmNW5WOHHvpCvc5gFlOKmmDr7NrJN9rbLE16KmaxhILKw4tAE1xn9U
         1gs6PnoqvmuzFLKfsHLr4BVAywzWuZMQ7tSumGtjqWR8WuPtrJ3B4UqE+ckubr73ZZN/
         2Im82UCIPdVQ83svM2oUDZNdDBtb69Orza/GFZxkduK8dSH+lizx8/00n9e68orfB1CD
         CQO43kE3Ul5X7xwAyIjqcfh7QxXckqd4VB7aTAGhvLzjHWshEh/MkdPpQushNVMsV/am
         iQzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgqUOasAmMcB0yym+NnsAusIpfUObRzD0LVQTWlN0oBn08+Qncm0cIfiBTvPw+i7vbRNaZZBeyRKiP@vger.kernel.org
X-Gm-Message-State: AFuF++nWQkmw1z/y1+7Fs/P6S/ia3E2/hZar1Wkh6KoU+8+jfh1RT325
	axRIUEmR0HBcpgWf1+pTw8/RfHbRoBUcFvxN5qaELvMHfEmagEtx4NF6EbL/Mj2Ss6VM5Qpf/BL
	WbcriEPUecOsS8yBoAfWgDOof1t+Rsmo9aWELdlgwE2dPJgDtFyNFH5yeVI0zK401
X-Gm-Gg: AYBFou1YBYk6APaHJIM/eSt+OPQfuTdDuXouORkMgXy04Dgf2v8ZgcqqDJw2sh88LFT
	hG19LyLzdiYkdEVJ/qy1ucQj23yGyNA/WBau2Aotdq3cI/Z0y1D3FOiiHLTdJXRYFMGct7HMfP9
	X9jBcMDowWX96eYI//kBzCfMqGAriuaR85/OW87p3vnZqrtj3su1bVUiWWXNNfYH0mNRakDbok+
	RDdCq3zLIlfNWTgboqT78BDhsB7EhqsER/F+Uv0gQ4ObUnltON0cmmWcZCPBOpZBUkNz4Ud7MpQ
	OQI6RxmLusTyz/jjT4e68lWa2DT/bG9M24OQWU1ux6CS9LxHeiOiNOFeqHOG2TStR/K30YLVI9U
	GyOwHfx7E41xpHQ==
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515977585a.1.1789657957498;
        Thu, 17 Sep 2026 08:12:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:937:6f98:c68f with SMTP id af79cd13be357-93bc62405afmr515971985a.1.1789657956678;
        Thu, 17 Sep 2026 08:12:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm131474435e9.10.2026.09.17.08.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:12:35 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:12:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Message-ID: <kfyihddprwum6q727hvpyzg636erz4cd4t5hn7ubqwr63ffl74@iaui2pgf7wae>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: yVzlA28aMYmqWA678UBPusDq6yKS8bN1
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac0366 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yVzlA28aMYmqWA678UBPusDq6yKS8bN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX8j63xlF0jR1i
 2lm5dyIlnFxZFY/nOQvnSzThq6qM2jg2MQxMlMyK6PqO6uKc4wUqil0tc2463F97+1HGPEdNrzh
 n3ZFz6nvw5ZPk20FyVKoe6k9p7iwRmC58VIaJZLrcHyX6k3dvEL2dofyk6/awcP8vxW36Z2jcVj
 A/xU2vT1twgBMD8TKAFuASv42O+hKN+iZcD49sVZKtFeJhCxNafZ48ssiCFLUKzQT5hFWWlsLgr
 YkUSCVmt2zqKJomxanjjCJ74nhdSQcRs2qXQZiIpbxZVhVzFc2/cZc/C/iO6gpzdISzcewr/20N
 OrXIgxLD/h/77QdNcRX1bjjIeP5760Vn76a2EsC5JG3WwNeAevVBod3WerstUhL2C/9TtPjYqDg
 Y80Odb9utm4nN4JFkevqUZGUsLT48P7uicNqePACmcxX7vIC3gP1saglDXxoEwHy65l7jiESk27
 q92plpettakSs+f9BBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX7xYgPaU20YIi
 f9lhnrvvg3qGn6gNaxTaXSUDymBiEOIUh47kwZiTqCyDAIOLO5+x09MoU/L4OQoS7mx2h08CMKO
 uoRvIRGDjVTxeAhvgCPLGAQ9aQn0Udc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170214

On 26-09-17 17:55:18, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
