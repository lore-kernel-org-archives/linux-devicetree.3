Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163765;
	b=ICILqR51Q4vbAK4JpvLYkKACXddH+YkBepuCO/SYxQE/3+rNN/QpoSYP6n8QzRI0E4OS
	 V48Klc15bBSeRx+4zHXjSS+KfBOtrJjyrnvogSUOcT+BpLhJ/kpqYNDCFSjQSiEovXQRT
	 KX4jojn32cXCUbukRPOu8IjNsNucHyz64CTxVkcE17OwUswFUh2Nv4JX+D49P+fkHModp
	 3dlcYwZl1oa+xpiEL16kMBkxbwnVe06jxRhCie9N9jjkh6w/X2SM0vG/YxcyvoJ/jeTkm
	 DPN0FgmKNXMw4Xq6BaybNthvdsHOvj+VcBVvT7ozewNfblZtTDJvFxAN14tl6tVjLKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
	b=QCj0Girf1WS09lDtqT4pwMzPP8Pg7RPzp+7ucpUBCOsK2lRqsMR8ibR5t+3VrsDGSNz+
	 ySLlqc8Ss0qbkFAy2ahNIUzFl2HvUqtHhf9kSOYRzOyPcQwYfPXKeNRT+FUkZzDPHR5kU
	 liWiFrcX57VItd+o6UDx//oMOBXsBEGDak85mJ2EbVjqhNzGdc9GiUHa7hwSkYS+ewjRu
	 uyF+QJ1sj2LseQlkEKIRI5xx52FTvuRy96Q0KD2LxLA8o96Ly/f+IHbrRRrEfmRtsmr8/
	 UAIAujCs0StdHHp+dZDRWE0XKcFGPdF8oWxxcCHx+a9m1yGn/Zq0dZwTLgYrT2kj4Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8VVDOsC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IqRZFc/e";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D7606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8VVDOsC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IqRZFc/e
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fFWi758310
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3+4kN8yRIr0Lo4zRWm+RqNkh
	ZtxA92McvaUVhokCYQ0=; b=A8VVDOsCPQY4o/tKtXsv2nv2OALS1GNJx6y3VFUL
	TSHuk2TV/8BaYcykEPQ5z5IdEm/PY2SFzAGFGuSfljN0YtWs1shRzWlrmmaUPXqP
	mzOELcCxdV7OMM1Bzhgjx4v3iJOca9NFyM6b8QcfdhKOEYcgOSv9oZYNPH8NOZF2
	SzPB1ti0Nlg9hc/VgweLFl0jE2jBIDA2XkkdiqcOv7FcHBwfh1lTxNBjJHUIpMlt
	7abL9d0elft/CgctEwLkplrVeZgIz6GhPZSOJsvQOSexirfBDOD4eZWZhKtPcJDa
	MSGB1JCz+crLCvaqnh6wY22CzuKCm8Dwn2CiCrOQrmrfgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5trw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:36:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so125008485a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163763; x=1795768563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
        b=IqRZFc/eReF0BPaJSECl1zUY8OotV/Ci5y6n0/8t828cG0smmyOge6zlu7nsmcvyvP
         Q7TnyXjC1B9uOsKTKiPxX0JVCmAC9BoCyLlo/9JD/sT34Glkk+zomnsIm73lbtCmPxCi
         9THoXR1epGae9VlwACQ0vW3ENIy/KygoLq2olRyC1VDdH3iNjK0YRE3tc3qW6waPSdN8
         P1HDedNJyxdDxNA3XKax0Ogkcp+BFMhv+bzwbSVLE14do9QJMRFNMnKn3ZWz81zuUuZJ
         Vs3xZf/HLrmnMuGMWJJtI/HSL43+fctiVAxAwrMMbDS8/stSyycVMc5VT85LBZPrBTJb
         /gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163763; x=1795768563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+4kN8yRIr0Lo4zRWm+RqNkhZtxA92McvaUVhokCYQ0=;
        b=rVFPObhPr0JVg46HLYURQq5ebmaC48BPC4nIYbciZ6KZQMxhgkKx4YQ5zSrlb0qKOW
         jSD31HlmBJwOJp/jNlm7Gs5kqMlmEaTQGNtGT/lAaV/XWkdodfEgaw1m7dB+djdRd4ot
         FwzjXNYhJ56zFMxIb1hI2Gd29KX0kMsw4Emiz8VVsCRfGqFzgy87xLCsZXPsaxl4VtuF
         rgx9g7LWvggyQZdLuqTbwjcc4xXuYpAAaHNV5YrhVZZhFjEMh00roLqHAPqRGzwuXqV+
         SVrKPpM/gE/OiWcjncGzjhOPeIHz5TPVhO4amDRiS4rQkd7cBrsXIYnb8yC3V+ke6uI/
         tiyw==
X-Forwarded-Encrypted: i=1; AL+hErHx+vGPaPzNCNXm2jJRCDVcHL5uHNvZgATAMA/F6Yc7L+izVpoAOJRFmwLeyqA32Htzjo+q8mWBlfTA@vger.kernel.org
X-Gm-Message-State: APuU4Z/gzQEp+vwWZUvdyh4OYL4zbeVkfhD8ErxjIxu7zseTzchx8em1
	7oQ0lZYTQ/yNhX8YNysUp6kS2OtsK+KCYjwo+J1GkLlBKnzq1DEKIZ0kMC2sZ//9oVedneI6fZf
	XRIPnsyCRRFDNu0bCSbo3ZZi+BtlXAhtjF2fzDmfCLe/idcoJ7wCA9vRMo4PHsAEy
X-Gm-Gg: AYBFou2dRqxjnijeoCKWtLIDnqymvhnvy+PSK5pg7amsQwpX7X9gGWshFMnHLjGJaQw
	Txpg2sQWdgWCyJWJ/H1ra8lfezfDO1dBDFAvPvWiFhq03FfunWqvcN1diT+jVtulIk0pQ/W90oN
	+yLQiIGLloxcItAnFgjOvUxNdZX2odUJPkLQ7k8c9TGTenhA+v2Q/+jzDwIE842xDtEZJ5A0fXS
	9eQY+Ie42zx8JAftV1PJAcO+DVA4MlUoqG4vpOv75s/htorZueNYqTzvbbLNWmo61i6JUHQm720
	behmk97vGNKSOIqETZdmiZ/TqjmC1+6DZwDbApkyW8Nnk9x8+Qs6WNEX3agytx2GW/BqEfR6o+x
	UgJQKTlo2f+t6w26/TtzPsKp9rHIGhX9Ff4uvBw0u+BP72kqT4FoPC9JiHsGGwty+
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr373795385a.2.1795163763315;
        Fri, 20 Nov 2026 00:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr373790985a.2.1795163762513;
        Fri, 20 Nov 2026 00:36:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm104400305e9.12.2026.11.20.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:36:01 -0800 (PST)
Date: Fri, 20 Nov 2026 10:36:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for
 lid sensor
Message-ID: <dqomg776usbpt2efpnsq2ar3lckxxvzkdukvykirreqpfzi3tr@6ddatvjgvig2>
References: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX4Rk/V4vQBWr+
 uuKRy9Z7ceGrnJFU3WqCoI9/M1rXSH7ZuBWLWyFKbXv5ENe6viNOhHJjA3xG/6E7s4gFBNVaVUO
 NyY8zGFqZh0F0YAGtVN4F6u8c3Wnwgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6WsFHFDp71l8
 cUncK3P1HMXIAHMLGHFK/F7+JRm5AY4TLP0zdGD6fv4+U1wTGKEsZthjwi50JO1nsfbQk/Bk0GK
 lFOCF1a7Z1tncySehrI4vQ/HlClR5b8VAfwMsYBtI5se/rndZ2shlSrhlCexGAQzzh6nRLGDzl3
 LjM3NlOT5UVYs/MVNhPVCCZwx/wTYnWbTwjqJaq5Qni9hyFyErIFxG9iHN3W55Dp1hLQHoKUtvo
 liM/llhQ1ABI1YEU5XIzWX7PIbqVdlkkkOTzOYL+ICwlEQFs4B8FSRkbamVa7kfmGiJTm3dcEmY
 8rF+fR9hhpwm1qiPow9qe7J8ohj1wtvVRaBDkEoHbUNcbZAXNxRQ50qxypg0M3NXB4DDXIDMt8C
 ckHewynV+S2UmL+A+Gf+WwDWi88lsmhHzP5tpVam4gMn4rTzI8et3vPJWYtMMgO47i/TvBWHC0a
 8m0VeTwYhUCrJpngIfw==
X-Proofpoint-GUID: _g2aFOYEJOfVE6cig7UJGbcWPBd0IE8Z
X-Proofpoint-ORIG-GUID: _g2aFOYEJOfVE6cig7UJGbcWPBd0IE8Z
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b000674 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-jGRk2uHz1iNabgFbUgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 23:52:40, Pankaj Patil wrote:
> Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
> Fix the hall-int-n-state node to enable the pull-up bias
> 
> Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
