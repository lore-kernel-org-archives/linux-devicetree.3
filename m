Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14C38A70A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693574; cv=none; b=k8OXtsF4Gfhf1S9dp91rEpg8caU4bLJPW6Qb49kzTtZFMCagn2abCP35fLJB7wHohQisiJRkeFh145AGo2l99vMzoIR/Wq0RXT7LZ+UJ+K/pWgQikJJGe091lvfCFCElYx2cj9NnbGannU+lFTOjLK/5UagklCOsGxHxEYOs89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693574; c=relaxed/simple;
	bh=6oGwG69D/CCtMzi0dvDRGP2E//XKlyAVbpCD10zKo5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8sWndUJJgkvBtSk1qQGxRRLH0bee0CRzwkpp4iUbGdWwdByAGsL3K9vnaLSpBGYF8tC/TOYkfQTSb0y3iRn5hnVfpZzQU6Ae+WLy8ndLguVKryo649xjuCSplbXrE34XoDXs2j6iVHUshPMigy6Bqt5y6DKv2XZNlNyzWboWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+V1j1BU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZnHxP6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+V1j1BU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZnHxP6E"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UUHn3273558
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=; b=d+V1j1BUmibFlL70
	d+lvtsXpMhcZgK5Y4TicmUR2zIhxnqlymOtW4o7aZDxyxFy2+I4XHRzQ6UJBXDWL
	7uASQSD5pNQGxxlcv/vV1R74vSUMwt+0VzQyDQBBsdH7pYzD2fP+PSKc0S83TGil
	ENZtpwnPal6TlH2PmuW1kPXoX9Nl+STG6HR0Mywxz6DBc+tKu+VzuQShNlyOhXuP
	Zy7xaPgDQnobnP7Lyk4B5HAzBzgfi0RnSXcHzerXn7aap3Vk3JzGIVM4eOtmmkSh
	6J3vbToCld7kcpVtOaB85XS6i4hHFz6KIE+V04xjeNhlIL/jWaEPuZGEs+pk/aCL
	+Pm4wQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtqx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:52:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571f0d3e3so29772185a.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693571; x=1782298371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=;
        b=HZnHxP6EzvrwvrwrtanCqasWR45jrlNRgys5/U6rO4Jkvgvoxf5o/IEiEic6cbiWU+
         rnnQ35hM0f9XsH7hvAGSH2rJFMr66RTfTEf5OUhWC+OUi9eKyfU35n+AqxZoXYFjqso6
         32Oc1OfjJNT5FcYdqAqADSsdealcVE/NA5kStlSqZNj334sSWK5CoVCd6TMeBKCELqx8
         cD7u25XJI79DNj0HL33oigaerNvBLo6budIYHCcUhxpTXhLXocoQvNArf5zZqJxEHJbO
         3Wld3Zj8JIZKRk77Ku70jnjYjWzMtQ4qmkGzEtAhLKYArv45HSqbjR4+mnJBoeqDKAJ+
         PaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693571; x=1782298371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6331SK8DnPFLpPsoLFIuHxT8r9zEhN9nEg40mzmDcaQ=;
        b=bTd38qiKEAP5nmoaM+UPTtTe4iK4hCh3jsVMTs3Zx4JxRxqOd8Tmn69xPGOKspdcas
         7aR/BzDhTWyWWfaq4BpW7/Gszoigo0wmlJzyou9tt4fMK+SkYPu9od/6E/NzvJHRYrcY
         lnENDAjLcYAlEpC0YLSv+MA1CqKwvw7be7qDKLBu72C5uV+twr3iTnrvusHIkr7HF4Ow
         rTUlX1SygA+2YryjAP18oAGXG7LphQigWJQvv9dwL7vX7y1xfIO1gM7X0u094HGlH15v
         Hk73gBhd72nIG8dallHIb9Z3YcfWREAittgXQsj8mT5cn0r4TbOMMNn+JPT6b3oHEDc/
         RWqA==
X-Forwarded-Encrypted: i=1; AFNElJ+TOxdFDVu4EZka/uY0T++zfx0jxC5uqoHnxTDX1CTSnLIqJYrs76RV4GWy+iltCKUcVLV2c8ie6Fhl@vger.kernel.org
X-Gm-Message-State: AOJu0YyFadRuiazvziZN+7O3gQV0bY9Jpfk0v6hUs2i+sOvp8DAlDMDc
	r3UfjpB9CcSTKqpBohLSOM70ECN55GLSpY0OsAcvHARIvIlgN5OVjnkqtnLdNM1CCj+kX1nyHk3
	ZgpHdxiNBo4z0hkjhOOQwjgCaFjmJ9tG+ZdFQNZ2UAtBvt//zLanNLgXNWAwhZX2P
X-Gm-Gg: Acq92OFMsG5frfKwwtVfJuioDemZ7FgqkIwFQoDy6fRYHf0SxI4N+I4aSa+Nf2EB/y7
	LIDv9Ba7aw55M5+rNr9jdJpSwsGCeEOs97xjFAs2qmbiXK2r8fP+ZFeBNCcIB2puQu2qhZSA+Cp
	F0bOAuumzUbs7binGRO/ch+Co1qLrqVyHcKEmwu6JpLHbYxiqHmyWrLGDSvFLOFlIegV5oQuxLL
	QUhAG074vUXp4WFTQhowelIE0+rqCuZ4j1kJ0SjoWNZxpXaMe3hPqU+N5Kw7T0Tzw2+7A2dFvip
	3HNx0V9nByXkoUSf7v/hE2mfaalKkbQlt1ftr8k1/ierMCJqNae85v20MttvUeXfbyS0pIImJ2X
	UHlPZLWvOYDXMwuTcz6T2xQpr+/z6z08Xmus=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250370685a.5.1781693571185;
        Wed, 17 Jun 2026 03:52:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr250368485a.5.1781693570751;
        Wed, 17 Jun 2026 03:52:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm781932166b.6.2026.06.17.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:52:49 -0700 (PDT)
Message-ID: <8ec0ac42-b9cb-4da7-b71d-c3f972ef0ace@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:52:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com>
 <20260503-ayn-qcs8550-v8-3-d733f5e57446@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-ayn-qcs8550-v8-3-d733f5e57446@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UKhAyP70IuqCmLL1A-gGRoM05gJ0exTv
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a327c84 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ePn0xV2wtYfU2OeEI88A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX4hszTbRbLBwV
 KTFWMPJBly6GO8FUQ23sc8v+vwN45Fas1J/3XUv8m2nQYR7qtJHNUMyF71Wj+CKp518pZ1Tt+Ai
 yKOTVX6yEeGn+Ee6ZIRVeeizMTm5/Ek=
X-Proofpoint-ORIG-GUID: UKhAyP70IuqCmLL1A-gGRoM05gJ0exTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMiBTYWx0ZWRfX/FySgOFg8qZn
 dnbxgKrSxRGPdXpKSws/f8esllunnjOXf8qx48Ms3D3S8wgYnUVkCcf9mInMrhVyAoFnkCc0Mu8
 xt2ylng7Nc3LbRe+uas2Gr6nZKbKlRb4IZUIBKY4ZRJgPH8wsXKlZztDlT+bWh45RliezPCA6qc
 FzTMUr6DiMgomBTMh7y5M5OZa1Jbjfee8cXqZReAvn8T5HvYjWL9mBNMbIZ60+Dh6dxgDcL8lUb
 pSdpSTA+BDo4WhXQXK/JvLDL3AFMu4yqHUA73BX1ZH4KeaTanI82uwOyF67/Wr56mzyNjHtd/t9
 IKBFBa1vsN+RfOFxRK4NodJlZF2JNmL5kjBh5lx0clBDZchw1nizPWhNORNuNGjYk0QDNv7TN77
 oYEZb/1/0n0YW3IvhVUtPwz5QwN+lUZV7BheeYOfoGuxAkSCTqaH/mMy4Xt6VcKn+IOBTlx+R1A
 OtRJnnpTjuLi0QsZufA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170102

On 5/3/26 11:48 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
