Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496F3A0B13
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333818; cv=none; b=MyJgmsC7A6plRhC5YxOy/hp98KKM2Cg7TEb1ILAjptt0bOlR5r76+hXOhR8iYksai03/1d1G7zVxLOABLeo+wfwJDUunxuwyJCTdfck3uJ1catZ85KdJfmG3gCk6EuMAmxgZ2R/hdn6GkhHez6FT3qh2CCJ/2L2hEcDquXqHxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333818; c=relaxed/simple;
	bh=j7wcoQluXVOcZ+Ui/qPMcNR1A37y/kiIsDuGK/dfnVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIRaFvRu/0saJZIZezY3fMPpRw/x53Z3Uh6q3/yzIts8sC5YlzqsTdi8rgiFU+n6vE5J9ra7ThpYFNYpDLvAgikd6h2Yvsv0BHkM61BP14clnDQCt1GgWIsKhtY9z1AF85zUBRWI7fc1GCD/SqrTk57I2uCKICE5gpRDoxnvSAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR3cbk8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2CWR8LF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nR3cbk8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2CWR8LF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693t2Y4108055
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=; b=nR3cbk8k74n6rshK
	LxJNFEA1UJpLb5OBVVd9Ckkv8dmI+AnIWBai6JYUgA2G+agux92Knf6zvW7A0oCp
	rYugmTPOZ2hfmt/62BZhw2q61QgD2dHOMMI0/ALwMfG9zNSHowPnxWb0N14c7LqQ
	8jtTRElofaKl3BGqgVRReHRsoeiSSUJ2PPKSdIWKnTRMizMKmBxBRhGR/0lMfwYg
	bb6GSgD6W7FlG/qb40LKq2eN4QcHxk44iLNHNss8XgeQT9qv8yvAe5+LRxgm12F8
	BrCAOHJkmrCZW52f3yiDUyFOVJxtgDBKApwYdcY9v527z+2t6f+nJ+f3BynLA/S1
	iIXgsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrst1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:30:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efe683bb91so6682826d6.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333815; x=1783938615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=;
        b=S2CWR8LFIeLs4lz08mzxmZscY+f9fdJ3wS0KHmFLT7KuPL6fKU4GWMUHT2mxcwBrc7
         JQC3x8+N7LULN9NIxv9ob1+9p1Yme2oZ7SQKLaQc4xzCHWaNPrUIs5kznQ0/jE87aGj3
         ld8gpGaIsZzYl04V4DfAeLU+TqzC1tcbRdDzgi7ooWCYbMG2S0nQ2sQ7UyvIJvsIenZu
         VwM7hA+mLKMuwLMkfTrrvo1sQ3uVxOHneD3Z8LFUpuWHqobRx9I79vxENMnRAX2lKPId
         ky98diS5TUsp4pMNFm1oLI7kJnZ5nkEIDzz87FxfqwKIxTigRlwbGd451gVAUdeBACWw
         owSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333815; x=1783938615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJzzmv4Hz6ml1uWYSEsGdo9a6gWmRtyUBQBeCOeGHZk=;
        b=sTq8/gvIrS29kC+qmhJMw+7U6kHP333dGvqC3Pe1iq44beyIkdxikiYDdiZGWPg6gX
         0K1klnUWldmS52Ro6dg3ekP2vaZGaIceveiIL4Vf4lB3VnriC1PCd2KNJvdiDiTgEP46
         oaV+kW2cLqGgF9imBgZd8RU6sMvqKDQaoBjG7dpJJR0F2k99RbtozE4iYZCPXx0Pq+L4
         FAyTZuvkzzW/Qlxxh0eUO8xFYBswgwGaG28rKbHL30MdvXStEiaDJhSVo+hRVavwmxjs
         7JfOkADPegzi3o98lZjPxvWJJw5OBWEc+SxH6i74FAFr4zT7FqyEDFogbdYlGp91dHRk
         2Ffw==
X-Forwarded-Encrypted: i=1; AHgh+RovPMQnpohZyLjfUWZwVXycDnnB7qsru3sOECgfBYauxqAuD0qFw9j/H4YF7WzWWyQsr4LszJ6dvb3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yybi54EEsMaAuc/hXiDd1U1M23r5IvDFz4GX1mzXREKXdI8wqjK
	/NO/FJuaIVP28Kt2zkdHBR08TlEpS484XhXF5xmsF2l6li02IGYNTaRAC5T6vrHP9BVmUnKxdu7
	Q6LYZ0xaICga0gpIOwJi7LT1xngl3cCI5WmpavdeboejaoSLICThBSF7D/Q8QHFjH
X-Gm-Gg: AfdE7cmwKmQNI7lZ8S0FXbOiPeVzi07+yZUNRsBuZFWEigtbWzrfW26dO+NJ6sTE47D
	USp8NnTNfMzi8JOi2mJiqaJ48G0Nm1kCf1WELQV+ooeTPhWanVG+gP8r3p2sQ0rihG3Pdgzdsaj
	l3vdSaw/2EpG/vL4NoDVTevZ50KjNLnghOB8ZGsZR/sb94xyM4F3XEtcXoJD3lqU06xGzdrDa5d
	9P1PnVuMhg2IFTknv1ygyECM1kDQzRjnVSxbgnEE3Ikgjvz0wab+swlWCKlkRfmRlqXbVIzpoK3
	dWfF1z+saYGuVtLryi5lcD8J3x+Spq/5u4X112pQqAdUUinYxrftGqtB1EaF9L60McoNtmfCLoX
	UsU7fXyg4zBR5aTkIljqM1ksn4e4CwRApKqk=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr92150961cf.9.1783333815173;
        Mon, 06 Jul 2026 03:30:15 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr92150561cf.9.1783333814493;
        Mon, 06 Jul 2026 03:30:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm3979074a12.16.2026.07.06.03.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:30:12 -0700 (PDT)
Message-ID: <90f35f11-abf7-4b45-8530-18a17176bcdf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:30:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mc9ETvrn26VSNERW36jXObvafAdJmYhm
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b83b8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cxglbGFaQTsLusRpAB8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX6cKHzDbtXwsc
 EsS70G2n9isxXbaJADPwMNTio+za46O5Z8/eINsYqtvHgO1FBWOqRHz/afEOFEjxZRAQHFKtjgC
 4OaoppzUzFzmhUYoZTwlth5OpkdahbE=
X-Proofpoint-GUID: Mc9ETvrn26VSNERW36jXObvafAdJmYhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXzKOlGf1KsXuA
 NLtmkMqwmHtLdyrhVmJH8AbSULp4tVwKuP/NwdHjQC3a63wUnFKgLimOUeHrkhL+zjaRWjZvm5a
 du61pkkB/Rp2YvjU9on8cyh60zsnVeKsc2Lkpip6bfLDoJBcOV04Spjb8xq00VTCudz27nf41GU
 crJluqgHz4QMoI0gc5jFPAOhzdiSR3bCV3uY25EFYOoH1oI4+179cJ/9aEtv7wkdF6YA+Ec+EQz
 EpNS9TG3cxEi1WL8ipehEaxsmOGyV9pUO1sGTnGLrEp3MbIrcGTsSLyum1qVWDcdGTXaUpMdidm
 ePU1WVxOd6q+m27edhCoEDFs3BtVT0u3FV68VvCECzx0gYeiJxeaxGgV6lWRXjofO9SkgiprsNR
 UGxnl2jRMtklvuUYschB6VTpXL2AxYSBWwoBA2DeW9a+dX6phI5ljUxckUPClhvSL0NKVniGFyz
 WCrq1Gh//VI06mp6O/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060105

On 7/6/26 11:39 AM, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
