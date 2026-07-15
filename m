Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824AF436BE2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109709; cv=none; b=AEgv4j7r10DGPby2OEYkPX9UTwyXg79XVPfP5y0OAh0MJ0JHygQffw3E9C7ZWq7kfq/0L7O8cgzmOePhbTrTW1sXEJLtBYBvqjtT5hkpYCZZ0Uv3yb7Y4NcPg/YE60rgxVoSnQ6BVQDPZtbuYqObUK6dwUQBTFoMZT6/wrdUjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109709; c=relaxed/simple;
	bh=AfDAVyIx8PFZb8l11WOaABbsnQJG25qMN5s9V/rOcj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS/SWL91TfLRHoDpimAHPKXUU4ydW5/yHh+DfJNYce6Jo48M8DhfL05vUHBg1QAduokgE2Xq6B4zDm0eEnyl4hJf4hXRfmojUjUVCGJDJRqle7NRs4fJOfKDWKlUx7SqHy+jJHLU8rhzfQyxUh9C/WzsWQ2bRN9be1A1xtWvWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvTj6ZxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bct9StRt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvTj6ZxL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bct9StRt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hISb2795795
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=; b=VvTj6ZxL1QXEdkNr
	qrJaak489W4uS7N0qDDJAIMdPBdHIbPzt4jO8YMuJSo6qsx7aJLKmTVSgpGC3hG4
	VX73joe98woNysxEHdo+E8WUazb/xeM0l78ZjJJZXHRYBIm9B97gpZ6xwY64UpVI
	fHTqS/anvJtU5yNZyVa1MIftmTvX8MkO2RmjAnFJmM8bhW1Pb353Kc0VGwzdZs/d
	AW8J5aHHPkj/yKk3hBzAiZ6L+xXmfF4qR1R7Dfo3c9FSYIAH5dB9ocATq+aZhIyU
	fZS06NKtJSP2m0PoJHGVlIz0BWGVpakOqCSJ3tvgPlNtbfYsWuIa1a9nwmVrHzIx
	JiYPNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8qs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:01:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5110c89eso124037385a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109707; x=1784714507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=;
        b=bct9StRtZKgNCUW1PM0XbLEiXcqSNNtIFUkDTa55QOwCM5FWGdoV/oT1UHPaDayUcf
         DGkbEsYQ+EY6rmXIUUwElGoXg8/Hf8LdG4kR8aUE0Bhwm3mGAhgj6T7JCBAZFYpjQIAo
         fb96WWQFuKMy6UnfwKAZirYBURfc4v0/8e5S6DQr9T7V3ucKeJRRKxOJDyFbxaVxFHIS
         dYBjimcLOOQFEG4N3N6q6FNIesgk4hzwYoGfVr0HsEXagmTf8NGRgNii/nonhSPel4Jr
         zRuTapPKpevgrGchMfgXPNPnojlh7YefKCPHuZMcHPlwIf4H5c/I7MrBQnT9HSSETnc0
         8qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109707; x=1784714507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=;
        b=JE5B/N1Epo5YRpHRs4W09OKD6ebO64fiFxyMJ9yZHJBI9MS0iFa4bxmH1GZxhyjKUO
         9pMGkXP2JToJeqBIWlyAF80JBMSEEPrOjikBXGDm7syIsAvLDBn+88OXNRDRCBp9ZxCM
         DaGz0C5fUHlEBIm/ofwNCOBEhNZC3RQMKRLr84UpHIKZpZ+kXhFsHSdt5DlYvoBVbIRQ
         0o9DpL1+IBpOKNY21l8/WULXhsmihP4FA8kAlLSJtMhbMKnxQwHnGOgS4XruzBWr6Qvc
         Y5yzlY0pqhPcxG8sa4A16GdJrl+JK7ARkOv3zc5fJyhnyQpZT//ffKJEkzYvAhXd325m
         Hi0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIP8+08fiDa+fjujqc8woPmMG8MNn1y5aHyope6K7k3NJ7GocRDbo+jTPLjawbNfD26W4uUfnHW/y0@vger.kernel.org
X-Gm-Message-State: AOJu0YyJg628pL3FhOI4fOxdVoQ6OlBaumAkd+RGvPYDas3qbqmazDkV
	86+PAQJoQhodmOAGM5UjjJ1i0v+1LiGbOQdZlU4rR3RNUtjQoe34demZB8P/ZNoNdMPpnUiyRjJ
	p1NqZks8dVw0wGpoqjo6837eHxaPVA9Bqpz+GnZ2HvdCikuVLan0zbNXMBCrPMVti
X-Gm-Gg: AfdE7ckQZ1jBGrhWRI1MZ7mAlP0W3jALi3x7WcvrKfnm0FA1B+aEkSzuM82L76iZ1hs
	RZMnG7ibmL/aLOWP/aYypcNiAROv43xwXu/xmG2BHUVuMelxjEcEN08yZ4oVumU8YrtW6SQ3zw5
	wdWbN8LY7J54uwoqyIyUXvg4Gk9iHFEXBlYQ0nI6HjZJQanAKNiEhPxrFXh4dOTE+HLh2/w0DCv
	pwf7NpNCM8e4xLqOeVQfhw58ohpsbPQ/B/f6N2XifvhBsElPmdkp18yh7dYWzMK7nbF7NP+hBb0
	7/UYY3Yw2vxBDTFcbu37eTbpy84KfS6Eq0bCZkWw7TbgJnlzhzQcmF9HS11ihgQtp/IQ3wyJnL9
	oo1mRtIRPa/whV+B/UNL6BIMLte5TD44niyA=
X-Received: by 2002:a05:620a:268a:b0:920:798b:e28e with SMTP id af79cd13be357-92ef2bfd3a9mr1358878785a.3.1784109706750;
        Wed, 15 Jul 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:620a:268a:b0:920:798b:e28e with SMTP id af79cd13be357-92ef2bfd3a9mr1358876685a.3.1784109706289;
        Wed, 15 Jul 2026 03:01:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e353d2f8sm901767866b.34.2026.07.15.03.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:01:45 -0700 (PDT)
Message-ID: <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:01:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX2bu09DCcHLw2
 jhKU4MGt8Co5CgOlGneuaLAzEKRJGpMOHG/rRxCUTTHBOm4Bf1Ip0XBmcFukk8gX0YbaFRRot3c
 4jcKMdJ2ZIO1VgyTpMKSkxxA7LEJt1s=
X-Proofpoint-ORIG-GUID: 16WQLemVTqhrXS2PzZAzS1T47R8-Kbaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX4XfKuptgsl85
 QgU1sDSD7VtJVVzGfgmTXz+GvRQ9FWkI1iqU+vRgjDDFlVMEidSjuIysf7+Wg+f3ZKqkOZmuR7K
 nj3AVsjVHagnsRxjOoTESBGsIWjoe7iVlC5BVNrS4/58qA+7GYfCJw0TUO+Ohq/HLeUYg5gNffb
 JyE4onwtZAyF40dzkr7FUhm7DAcpuJbk9i+Tw9lbMULp/m009mW4Gyuhf4XKbHtM5YkL8tvOWmU
 uKjFM/LTIdmAybgkP5aPtuBBXl0q9dSEBYGjzBHcR5ZfYNo35z5L+zc3frng8mhgj2/sl6eDpG4
 eIh3gwOauuQfmMbPcQX17MqGv5fVBU4nMa2OEW3Xolcad0RG1I4zYouLbCcMsZd8rzwfn8K1+z+
 LirwXxYg6dhZ62m0AXBwvrSi3Buw7qsXu4vCwG5aW/B8XBUFhwflRtn/0PsuEamvWlWW7H2bP//
 JhOLUHGPOuKKjkmamGA==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a575a8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Xtb9r-GaOZ-y0FHQUKYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 16WQLemVTqhrXS2PzZAzS1T47R8-Kbaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150097

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Do not mark MPM device as power domain since it leads to idle-states init
> failure because of probe dependencies.
> 
> CPU cluster power domain node is kept disabled and hence CPU cluster will
> never power collapse. Do not register MPM under it in this case.

This is only the case on the RB1. How about we fix the issue instead?

Konrad
