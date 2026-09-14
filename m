Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230F40244F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384051; cv=none; b=eKnbyKBrPylk7DrbOb9NPvB+SaWO5vebISXXRhiEOMpl0oyoElXzFO6NtZ62X0NscQkhLBCj18hU15FCJcJwI/1wd2FxQ4HxyfM41KkbEzr+tlp6SO+PGfOmF2QKZotaQUT/mMWwO2Ek/ISTDyZfl1+vlhQWhI7l9KtxWrWc/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384051; c=relaxed/simple;
	bh=ln2K21797d/RlDR4JZCtgsC17RMYiOjRqJmRrjHi/Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeQH2tTMZWWuEEsyjoAq9P7OhKX9aCHKoqWdNe+SOWki2FTljrQwZ66bFl7vdnif4Gi7ThHPfuNGEKribKioEvFu/sq3+Ew3JMrRZDewdoCfM57y6s5DT9wtNAwHKBfHvzClv8aichEp5vf9Jd2WwkEcaBjJZzZRGPGAfq5qvok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUULvRn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WX56eCY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUULvRn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WX56eCY2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6pV3793269
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7wzjtxSS2wTI69BcGIM+GCQ4KEWy9s1+q83T+ReHW8=; b=HUULvRn/ercGXwTv
	f3D4qg8ioDzFNp+0UER6rN+xMoWMs9G4hgj7HjC6WugSUHh03MsWXUaA7ZyXC8+p
	+jCAyuI7g5Y0Pu14fqk3ObuTwn6nFpF7JnR7yP++lBnUdP8840cOQO5+ek/LsEC9
	4rJrUaOfFgaO6ko+UKT4SFS12bFYoz1I8Mq/Dd1QQ1GRdU1jkCMLleY9r2M7v8Fh
	BgAeZowzXLgGYXOBcEj++SGH7HmC2IxzwrBvUfp8NnL+Y0ysb12ViEsN5DVRjFYZ
	qjELtFJB5qwDEJzVjP2y9gCYd+MnVf2KbHu3qAtxgZNw+sGcrQYbq+U1GbgqO5jY
	OtaSjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0tu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so86871385a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384048; x=1789988848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7wzjtxSS2wTI69BcGIM+GCQ4KEWy9s1+q83T+ReHW8=;
        b=WX56eCY2WxeCLwpmYcEiW8ZGG3ILVRORNsoHLBAKof8K8qHKgZtkz3vkynSpkXsQTt
         NZwyJosc6K/om0mrE7Zexyedune/kNc0fQ6zQ5Aw2Tg9va5/Prske7bRCxiFbagm5abx
         Ei3CkMSUmUSVcn0cMK9+IDK+i4s5ZquK7lA2Hwq/H3MZhIABJQITb75LDJ1gzdV/6lK6
         w3aD1qEIeEi0ovcUOJrbmAP0l3+egI7ifl7FsWKNGfsW6Kkp3YcoSLIW6EQ2oxZZaFzE
         WJMQXXOpwyn7UZVc7xUxINezrKFX2ybIltFU/W2GMBgtxdjcqnVIecs+XvJ9PkfXZLVt
         iPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384048; x=1789988848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7wzjtxSS2wTI69BcGIM+GCQ4KEWy9s1+q83T+ReHW8=;
        b=o7t/9/a6oOpmrcTWhDelns07pqABS9JKIZ6cy9+cjyC0hosCsA25orjxKLkuy72pik
         e2wRTzIFcp8gk+1OMnue5eMMid6dl9eFo/dS5skdzSw1hun20HBOxjiCN98CKhnrfofo
         K7IoCDo8p50KK3h2QJtJosr9RWKEDk/XT9jPE/+Qh1VHTI7p0PXkFGpW9S2NZNyCOYaq
         gp7S4jMnhbFipQ0E1hsRrq+W67H5RJ9G1DrWYhRv0EaYW1iUchLvr43Reae5XgXUU0U8
         tSKdBuNwNx3FuXecC/Vpvx0DCIkHs+n4FgMyf+0IsGq0ygp7Mi4KYkc6rNNgPutSByD/
         5U3g==
X-Forwarded-Encrypted: i=1; AKwUvByYJTup7rduVeY27ic4abWyKz1ziKG5QxiIFlztbL6O4pOdsAltDm5Q/55QwWjuwB2T8PYfsFCbuodR@vger.kernel.org
X-Gm-Message-State: AFuF++lPRkccDHwr7QY0ecPpmYBAH0WjMwtZCYl0P3K1bV7/quO4r+Nm
	Tx0RZomGCUsKk2RtS/oeQK//WWhjX0gwhHLtfwcvXyW//fgv6wM4ehNLUcLjuJf32PUvktXXups
	9EWtau+BnRANkSD47rPyJCWy26V3Kl8K8kShrCaWusfpH/xzamY21upy6AJSRTCNl
X-Gm-Gg: AYBFou04BlfuJzuYWz2IO21LmkSUq9Gg+z+nk2foIlitCqFW/AK2z+anYK5CGk4q3uJ
	MqSGwYMPmw84/Q729qERnA2b+EU62MY1ynKYWu9s7qziKsJznK1SW6Nk62dMIbi1FC7F/+kti1z
	RMebXKG1h8dI6VTxilEgNBv68JITfJJE0y6EwfpW+tj5KdH4pAaW6iE+Qmo04WpSIi4BnmmtCd3
	PFnqhn+6xl4EMyLMc/AwK3aLA08gg3nb+2cOk0T/0QKbHL14s/YaWJaDwzmKlzbL/oU/IPrE4xK
	fQZGJybCKe/k+F+VDxqCOKWTuJrmAQBUFG47HB4hLwRc/7j4OdQ4fF5WJetk0P+NUSfDrIdr4vu
	emQXh9BRr/hDGRlWYSWZfGg==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr216592285a.4.1789384048580;
        Mon, 14 Sep 2026 04:07:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr216583885a.4.1789384047804;
        Mon, 14 Sep 2026 04:07:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4164264a12.24.2026.09.14.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:07:27 -0700 (PDT)
Message-ID: <8089b605-a9b5-4fcd-a958-54af90a0cb11@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:07:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board
 crystal for PS8830 retimers
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7d571 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QwumHbZcXSOBU_aVzfgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KlfAXa93-e-NHE9couTWFaoCTWzJXHdP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX2FjNFq/M2M3n
 3vHlSeIfqFw9mFOnDD3y/vpqcQRm/oka+VYgOe1vE1NPNmb0zcFXccS9Cen9ih73HN8+0ayvJV3
 Pec3tY63yAj8WskBRxSqYG6BhzIJLlM=
X-Proofpoint-GUID: KlfAXa93-e-NHE9couTWFaoCTWzJXHdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX93NB2IVuUHOt
 IVuFSEg0ayUN88DoN59sOGkZJuudP2QSfR/9sY+V9FRa99pVAZQgyfQpnu2QuIgxeo2HQTZlNwS
 wzMB7ucSXSunQ14uOl9cSydCipj20wY19VV8DhFyrBdvouGox55qfcw0bMJAaj4wI0lQ055R8vm
 vMkrVgy5QqSAi4F6yMDqtLJka4fwTQAyx1PKADUQ9wdsUAnZkJyvut6pzrVXFljXs0OBh1FwZi2
 cAIpZI2QcvcAmlTs1NDIyhRdkY1oHqTibutOXDequ294Kp6H71biRPOl/KkZ9ThYjK4RIjxmHgu
 QAw6XhjlYGwg1JmMZFBMoMQSb7T7Rsnj9QWj28bTDbBK8KrZ0KaujyPPQXtsW88AkIYom8Q2zpZ
 ygUjEWDipIht/I4uWhCGrF8xAyUclvNqribIRaQO0N6MlOTpJHdF7wRv6JavKBzjFQ6T4LWJ9OP
 xi1f4amsQoFai+6RHCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> On the Hamoa IoT EVK, each of the two existing PS8830 retimers has its
> own 25 MHz crystal wired to the retimer's XI/XO pins. The reference
> clock does not come from the PMIC, so the RPMH_RF_CLK4/5 references in
> the retimer nodes are wrong: they keep those RF clocks enabled for
> nothing and describe a connection that does not exist on the board.
> 
> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
