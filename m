Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625375;
	b=qdfycbAPlCLOHYUnqke7NaRm2WRQyDRfRl7bXgjrHclxu8MxOARo4Pn0+HMZ81IbLf+W
	 MBvtNDYRja8JZFC+bsAxLQzxkzNuY2UFrpsW9yZDyKYgA5qWOXopMm1tBGC1Kh2a1Rp6J
	 BkEsuFj56uK0t+o0cFzguktUQy+C4ca2LCCFeuZrCAY66unNt8ySjPThFGuFG+K96XPqE
	 Hf6/px/fJU60m4lKpAQWMJVJIhkVHS9OrsQw14Sw2TzksUcTxfXxIHUt+teGHCF2YwL5K
	 umg+v4xSvWdtHU2p9BhbzjUHnkm1yX/chZYXwVYlvyRPuH1k68bkaHBCh5CxV25k8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
	b=ZSeCfGjdk5nd3gm1biTZe563apIHtdd5Ha4tlg2YJQ2nP3gc891tndBMnxVdx3Cul3UC
	 pCGZ1Ft0PzRAKQ1vG4JIbv3PtHuZyA+ZKHRM/z1HwuHBVrU+T1CmHgG6jP4NeWQ7y7X8g
	 a3OuU3oW1mT3rIEH2L5ambbbYkDU9rullcf5IzKX8ChvJmJSBD/J4maESiiagP2UDsFt9
	 kdUDdYiiQlSxnNE/ptqPmoH+cRnuCeuWUe0ngaGQ6B6b7sPYtdLEneCx0vyV3EyhXNOLX
	 CNAhJqa7i02WAc6NN4gy/o6u58ia90OlFOJ4rpAtCUuz/i2x37I0/F6z5XjnEkCwujQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33337606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33337606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAKQ43423285
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hya+gIi2koVDG+4j5QPeJpDU
	2NBaBm8cxAs4R6GPce4=; b=bh7Yibi8Iu8gQDZIzYkTL2FAG8azATUPfbqncMs5
	rJVSbvMcQodfBpDCDXlHdjKqTYJQjIG3nhIuv/Z7bBPMTKJmenp8MufQd21yuNJ/
	c7wQtDpofYJrV4QqucwqJKGhHULRdxZxc/IYUk0BAFtIsInrqyTThqebx+Bol4eS
	pC/2XzINCsHZIu1aSTVd6PLrGgu5K/lDdYObnUluaFXTtGVJd+AIuNnIRECBhqlt
	3sGn3so+mnVwNtFO9te4UNlmDxeIGzwM2eZR2OW2wvLXzxF3mbgPM7yc4bjesrSo
	VXvio64AvYghFD6wEGiiEbAfDCbbxwQ8d6bvFekv5q8EkA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgyfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:16:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so2877842241.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625372; x=1794230172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=iB0C7hhPWOeseuJcHVHNqGffHixBd4wmCIYNVs1pBzWuxV4mO2OZEw2SHj4i7cesKQ
         ekKRy2hr2ASG6AYY531k59OlSpB0cKcUa59TRK3TzZ7MARfRzzDhkMfYWyvhnYXVXaZ2
         efGL6PII1rCQ0B9PVrXu43GEIgiqpjrWlNtuegQAXVMwkUEHLY1mDx76JltW0OaTNx3L
         R1SiajC9XSgHo/KYLrEsBoJHAEkCtZncgd2O3bCNpPEpMNl/o4DRFodtjvWnjMyKCZJU
         k5emVczePpy4CwTGEk/LeO//H1Rbl98QeJMsIHDIpT5OwyaUJRuijQ9gtaOQI3zH0LF5
         7wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625372; x=1794230172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=fIIL02UzcB04WUZQ4ag4XL1JqnVURtRodDCNqIhRTtVEt6kI/ZEYpdFleTvOsKz/fj
         p0QS/lLSGusBJKp1e9aRhjG11vtxj6Sjpd8/6pXa6DuXJKCoXOhc0eGVA+Nk4eAiaMmb
         VKa+UL9zExlL+OXX2zYE/j4liMSPc5Y6F1oPIZOVoylqy3Wjb/d19X/ss6f2f/gYbN4h
         EGEP2iuCLZGex5yFgpm6XCVcgVwQF9DwfplS5sMeYtmWGlHutWczuH4KdRUIq6unljDn
         9NIp5cTeyb9gnzacw4O8+IQxbirFijVpVfSnVS3hCGiRi/ug6UX1INNiYiVgfy7qUHjU
         KU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxV79k9hHFfwH/5cgydgPdLje5ejutWOR2lZdmLO4FBHDV/klUVx0rjx2ISBC4dcvupxNKjFq1rqHTo@vger.kernel.org
X-Gm-Message-State: APuU4Z9YuQffciqa1mqCXUIQ4dPgztY72lxJgipmxJMCsEf8kuz6ARZn
	RLpXNIpZyioeAfb0ujJ1W0E8e2jLJH4T9ACk6JNhhHx2zq7lrcJYtMbFB+VhyKLMYqsmz2UBIOb
	dWXCEAVoY0zRVCXAAARmfa0N5bELNCvekIGo+Mo2IcaHvwvcChEH2jgkF38GHZp8o
X-Gm-Gg: AYBFou353wGX+TAy5lnyCfiKJMHCcNTsAj/oGHqh8MbS0c16gRoF3VWnZlR1b/THNp9
	OSmPCDtw5GExOKORGoJRpj/A0mGpaIisSphYwo/zkgqQMklXT5ZqLbrqwANyHBnw/VWfnyUmgli
	KAL9hYCTdS2sZhlhyOq+HPE2Vz++vNyv3wZC0twExEDhQag5yXl/XG0vJcy43tVezoIXvL9iIiz
	8YuMZ1ETrCj3SwCtdWVhAVM/BEgDHfAKEMmT84yNFmcg7XBNEFVPXxK2aOMEBzOY7LKaUrIVO+h
	g3qHG9jLM+mq00I+6sfPtLu5NmUOvyYQLzViM6/ytUYyld9YfWOca9tX6JTV++5fuhEyURSNfNK
	z5J7DRhzvXWAqtYWF2d0jVC3v33948pbhpT83cVV8C0ZzQEWEkI6ikDU7lHZtiTg=
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757428137.2.1793625372210;
        Mon, 02 Nov 2026 05:16:12 -0800 (PST)
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757411137.2.1793625371414;
        Mon, 02 Nov 2026 05:16:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm298991405e9.7.2026.11.02.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:10 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN
 support
Message-ID: <5irujcxbl7w6nvtjp5en3z6rwn64cc27ln5yrs45msncjjjfk2@znziikd3jpgi>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88d1d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9wUN3dL8otb4LRdDC5gA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: CiuBTaOnzawakHiMUD9Xv4E7h0OCmhGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX0p1mlscQknAS
 ikCXWZJmd7E5XW6t2uSzk/c60Eq1mwLlh2nJP49yrZYmhDhw5KSn4qhaOaowpFGHhGtjKmotQet
 QVddKWFkM/ZD0e9XeiXP5kxbNXi72WA=
X-Proofpoint-ORIG-GUID: CiuBTaOnzawakHiMUD9Xv4E7h0OCmhGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXykuZPkwtDpbE
 LxvdpM+mrmBMTkVsNnnDjGB5RAPV1CukQXzn1sDVjScsrpmBooc2BRfizJ6pFzLz4GFXxQTpftI
 oJNoLU3AbPMoLJSR91XkTCieGQV+B7ZK1g/DPJaQN8TXettmf67CDdof1fbumwFuUMrXOT38dlA
 dMIhaH2WruhECR/pScfq4Pl+0CrVwa1pRdSi5pZzXMvp+gJdcrYZdN04EE5MJZFNbZnke6ga8xW
 sanoQjQXvvJNLoLeyyiwKCAEE4PF5J4oOHvHoMpKUptFMPCUDEPmGxzNGiyZb7Y+3nEebxvv892
 QSPrfltCJWPvjUhksJ0Cx44r1+pqnCWvzJ5uSZ9/ziT7ShyU+x0EOF2fjvetHqvWeK2RVnxZ030
 ogu8XYW8qO5XSdE5SnEzJoOV4dVqlImHZ4a/K24zNIKyVv5N7PQF1kE+7OsIZrzqIE6g10v1JPF
 3ebkEYEoFmEAu3fiV6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-31 22:24:32, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
> connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
> and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
