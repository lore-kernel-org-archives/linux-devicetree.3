Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701953D1CBE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537928; cv=none; b=QNRec+6Qv0fCHgmqnD/5xMndEsaIdYaav56KppIEPDQGxD4c10BEed9htKoz1rseMgJL4FTginz5bYkLEx1JhDxwOVlPMKQCbmRKKr66afw+fnzvSjtF3UnjH7fdTnWzYYfVzk++lKok8oIbn8KYKtU5xqAscNvFxisGg0LZw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537928; c=relaxed/simple;
	bh=eELYxTfSAfVlp1pEJBxafdKzmI6BhbebsXeruvdqR4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFmNUKEohPQlrcmghk+e/+CZh/Kq9qVDqU7HgLcmAgwHB53V2TDCQz5HkdpGlG2cZdMhYT6G17AMNDBLB29YEMI/YYSyZ89gGe1Qq2wBacx3zIiRyDxWBUAT+SkEkox4xJD/i2zM/Bkp6Fz0L+Gr7WLOWMfEaQDbOF7H4RtASI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/1DIaKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpJt4NTe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/1DIaKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpJt4NTe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76WwF1712996
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=; b=T/1DIaKtGF/ywqZP
	uwV2LRTQCdYWKg/TExoffyarKzYh511lB2DOHQRPEVWB4ZdlGCbcVBT433lLpMBs
	lW75n2aLXjOfGwd6Or7zimWq0vfEja96KvZWfNgZ/35MhUsKnNKJ1g4qlJieH1lU
	ulKHawJPqSDOzUra/Zkx127f7Si6pxm6o+LbbdKEF3V6fHv4AkRRcCaxKaqJG7rp
	7xONyzwaQJQJlgTfEpEPfU029Aj0h7XUvo6TwvsxAA3NLPh0WlZqtiGewOcf2r9X
	jjFlPHw3MkFSofFU8HuA0rkSAmqarHR0au7vQf+cXByRXkonpjyT9ZBAtDP2facF
	8Q3zKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0duw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51caa0b48ccso18600861cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537925; x=1785142725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=;
        b=XpJt4NTexvj/afLp3xZDq2u7LA/zQHhE22Nj6qFa/SFsNlbBn9Yp3nFb2ZKEch3J2E
         K/OcqyOhbJawPVKo04U6hCrYc1XMJdxIUuL66IHeFkLW4Wn1zLIIILyaxUyEl8VuKQAs
         06GJftYGg6U4wdf05zVgLnZNvaHMeMRhYIjgbLtvfp2idx/BM9x2dPjigw8J9SF2Zm/E
         GgCYsRMtiD1Zhbq+bQxQvEce4t5FvxCkHlWFp6pKEE7y1H+C53WxrMygvM2+qN5gzf6U
         SIOsoZAKMHj27Fnia+5+Tt1fQtgt+O3uQrxgM3QJhrPiRCTV5gL3yUH5WDfmfqcORmcc
         Ga3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537925; x=1785142725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=;
        b=Ol1OWxEXJJmEXWdbqE08x48d/i0PWKQnMr7P2OD93mV/1q7YguXKkQ+P3e3I8JAOWl
         aZTYu6EHwFuAqz6d2H2p4HP3vERmqExPFArCkYHlmVfN8JNF5A0U+BXjz02KkFnawcRe
         lYSAul2mRSx6GTrqfrWfSNMrNQrEfybGwImwaijvAI7RKhyACGpBM5oKqUpigHH+pnNP
         dedimSBfvHfdj/ocm50i7QIgj93NlxYzbIoFPlx+vdJVLLssBZONlZ+9JJWOL/NLN8xx
         5Cye/9sRBi3nqVlxWyVP8+ROxgpqtEE0m/XYDcYXwodSSA2ORTm6uR0Nnk3NqeuqUcwS
         aAmw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8y/NbrxkLyLcY14tGChR8NEMfNCmDHEQRtZh2ry04k4CnYtcXicOrIFpXmP9dntvZlvnWHJ7f9Qe3@vger.kernel.org
X-Gm-Message-State: AOJu0Yycg8+FaW+BFDghlco6/OR7Fjll0KJKBRiCsrb3+Wnv7m+R9DY7
	KvfQ+/G6i/UnvCNagH9ja1q0Rz5QpDT5NRs5ukf/6xEypSRdLBCTi0hoVDRg5yXzHJoaAXFdQWd
	175qRWt0+PAu7cXqsU16t7SF+r8Z34rnDSYCxbXaGFnQ7v2jy88aA0P8u0Xn21hJkCrXW3Tdm
X-Gm-Gg: AfdE7cndtuglPELxtkoFhd4Ju1uafhD6EfrEm0OK1hlumQRMiKUgwveSMZb/02pEr8W
	38FffUpbOqWZpqYNKYIARpMr6t5rsDdzJX81JmyHKhD0d5Ymh5jJIA8geYbKkiL6xlOsNPuVfiw
	qiCq+YURFjAvYTDNF84CecOy+oG5DYWTJZ4uKxNuYA8phwQ3W5rB+zIH155JxJSOn/HuD/DoJhD
	uag/rxfgT/APtHHeI/mQ8TP4jqkb5yhVkc07TMYJ0thpmeJ/JY9QeosZMVDxP0Nd905UyyJOS7K
	a1dkRtpVg2aKQlbw6l1tiv3MNpPGFnDokGLXADfq4Ne81QI8+HfjHX9qdCeneIcFSSxt8DVE4ju
	UkVqkWDvmcuFNy0nDojpRHqp0
X-Received: by 2002:ac8:614c:0:10b0:51b:f40b:2faf with SMTP id d75a77b69052e-5213b633e1fmr74571821cf.4.1784537924575;
        Mon, 20 Jul 2026 01:58:44 -0700 (PDT)
X-Received: by 2002:ac8:614c:0:10b0:51b:f40b:2faf with SMTP id d75a77b69052e-5213b633e1fmr74571731cf.4.1784537924247;
        Mon, 20 Jul 2026 01:58:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm386519666b.36.2026.07.20.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:58:43 -0700 (PDT)
Message-ID: <067f40c3-f827-4678-8d1c-25216d3b4603@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:58:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5de345 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Hkh_rGh67Udisc0sesIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: B2d83PjygcILGUkLiLp2nGd86azg5ITJ
X-Proofpoint-ORIG-GUID: B2d83PjygcILGUkLiLp2nGd86azg5ITJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX96iM918jiAUB
 tPzPfzWwcJbkWRIu1AJQkG6sdhSpHIOnA94DPSFsbkzGGhXGYolh2Nssx/+1Q+Lj3JXSEu3ASIS
 QA3Gg+7OrzNB9V/LzTz1E9KtwjIpN1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX+/rhCBkN21be
 g0uVZ9FGotD8RUrfBCK1nlfw5iqiFKIgtoayCwaO8RCbSckf23cDM+TC3lXgj5KEM9ghkFEnfkV
 PQnMfWBTSfvbAUm2Pp4l2/p5vQiMc2JjiyStlogzYy8MUOewrPtgewz18nzU11SF0msRjQHZvld
 tBNyyQt0upzDn6goo7B7WKn53KMer+cbgig3h11oq7i1cxExWn1B0ezG6zgUhiBT4DKsdAsNbkU
 2Ap//2LRRGfdEpk8TTw/a2XxQFJ3U3PL8yqCK8TPN0o5OrZsGygQFjxI9DDFKmKKJ0Uuvcflp6V
 MlSMg9r4fzWmPywo9tKvlISvS+AZbuXT7ihia9e5imvT0efvDga+K9HAFvRJ/ls02hmFNrL+uPD
 r1p6oNhxvqEnzawFyrf+viCY83Aj0X1IFzwBg0zppWVLLXZwsxtzpJM1lucoIV1jaZJRw69xN3l
 FNdh6410RivkiDpoGxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200099

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
