Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62B3EBF05
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352260; cv=none; b=icDWDVYBOzIi90DPZTPLJaSwNDwMkKkHMPoMu3ds+ZWwanL2Npd74vgb7P3Pv1B2aLK33v6q843urKJx+dusAOKZx/cy6BI+cMhn5/RQgamy87ikjHuoUgx7gdZUl2ol5G+wtUGyNy4Eypxqn5f4Jemi0nq4XCvp7LPhfFgYYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352260; c=relaxed/simple;
	bh=kadTKCReBeNH0HNP5FL6cnlA6hMu9YPA8eqCV7krTCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGZHMWntbLHnzNZmsSta/42M83nYtaHevU6uXaTQ+/bOruLDNS0zMOkGznXNu7FRQoOjxF35mvOhYF6UhHvc2BddeyVatKxeZbPZQoWg60U9bCgtvQkVkEfx9U5pPRPrRwF8hoTs1YKDQEsQEmdYgPGjx6NqvoEVezW5jG5dvZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0J34JIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjNukKI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0J34JIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjNukKI/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBb1NZ1291407
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=; b=I0J34JIR/PTku7Nw
	cGtnTaVm/hOXhCouEZArtoGZBqX+Edsvn7ox8jLEwHVmwquq2a3n6dHBQDbKgbuF
	Ef2oktr5Opw55TGOA8GH0ktLKMC9TZkr63TmuoAVcYKlB8TmHd/a3JaVF7z7gJsv
	0YVgnhUJJY13cid54xnsSt/Y0M+IaVY7unASDRJZN7jY5vY1bjs/L+3Ke9rJC/yo
	3McF/GLYtOnh5CzDzMOYoKL1PZBrVeM951xe09+sMQSgUah7zYXM00rL+oTnFkc0
	YZTgmA5pG1qefZgRd4YBwnfZ6kT4EK6pYvL+xOKe2lOXMjNd3IfadNIg5tdfVImS
	hH3sEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw4002h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:37:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c867b7d6fso32347126d6.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774352257; x=1774957057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=;
        b=RjNukKI/bNMljeWu2MBphMh/NC90D/iqNk32vMt4J6ebEBg2ZsSN8/myFZa4K+THqX
         x+m1V8Yp0nxqz+Mj++B3zwv/wQT5q1Z6ptPBnHV+pZ84ufyFVjFjRovKf9rPIPoNnzf/
         pIUlw16XiFx6xkvu07RkN6B+UyArC08oSX+c2GkmAO/fG9mZXFjsSxGDDgVd3lCpX6Ph
         i7Ce4+py+VZ9bykLQOjRfCLbIg6rFYxrjTUtF5N9Cy9yYjmrtXkW7oEozM5OQNDQdFZ5
         s5nefLNs+szZz5LC6Kinwmu0fqhgJjmEGfNhsWaOo+iHTXTWMM876mcXVm9TJ+0uAh/D
         F2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352257; x=1774957057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGeHANdvGzuHUf44Jb7BpgbCb9hLN8bSMbkx9J2MijY=;
        b=L0Yg1HLzGmbKGftns2rX4VMx6rdIf9bQ5e9m0/3NdNEEQVMPtMH+zWWq6QSxDcJApT
         juyhdI1qG9F/B5RUm3B468Z26dhoRM5+QcyhliZUeLu8AgH2qSZuk/u5WuQ3oWbDfqEE
         DVpQAVJOLKRlgGjIg/51JEgbqQGPh8C5hfs+FJCumlkbtUuPnVE3a10PD/m65NzLpd2T
         R9Raw09mC0wSvYozxVpu7fGnI7/UeiX6eW1bbhH6BbCw5rYhHj09gosEsEAzimiD9EEc
         rgQvd2lEInXuGUlz3RaybbyYlRqaPX6E5nEeOsgf4fj489oNd8XjKgBTVlj3YpuEP5Hd
         FYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEGdWkxup4jwK/SCMxJZ3XcOPjhd8FOVudNFAoxgMVGphWfNs9W/JL6C1u2MPworuE0YoBKmEanXzO@vger.kernel.org
X-Gm-Message-State: AOJu0YxgezMr02FVHb3YKZsRmQ2u4ODN8YMWriO3Ojs58DALXccmFWnD
	sKcI0OHTisVrS75vVA0bvwbJCGseg3QJw7OfXhYFzb/jlBSRqsCkEg8egdUdwnFtFWEK17v2PrP
	t0NYYqbyrlBzn3viLAFf+ikySrg2+9TATpgn2Xyk4RkhGGF/fbmH5lBe+Wf6kwCqF
X-Gm-Gg: ATEYQzz9XKqruaVYVHYRp5aMUhnx0o9hi4Y0TGyln7GmTEnRkszkl11Z4zXPIevMnRC
	tdlk+3Q01RNAxJBYpLerO14eKscKeAo7MmthyNHAwsDxKlOmgPy6q5hOYE3RmIPGDe+bLVWaAts
	HeN1auPGqxiUb8Pr2HE9O3cB1zqk/VS+kCs5SCghaZeWXBhna98/+psqlDs+C2GuWkaNZ4F1PfJ
	hHGBmYSQsEAL9KhPpd//5Cb6PIDS0v8gfAwgkyTJaSG2avjZvXR3Yae8Agr+6jdG/2qIru4IQM/
	ybixJLeo7bZQ/+j6OnRLiKFWNAOTFLWKYSn61trkT+6KeQthg9ZDmTo6RODRp9S8qmoymvpDPFX
	3AGMvdSQ6Nw6nwo7Yd4Vgzuc23QTcqTID+bAuaZss7zxrWD9AOrJQhoU/F4boaBnYpT/ENcqAXy
	I4rC0=
X-Received: by 2002:ad4:5d4d:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c85a69ffdmr207689856d6.7.1774352256538;
        Tue, 24 Mar 2026 04:37:36 -0700 (PDT)
X-Received: by 2002:ad4:5d4d:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c85a69ffdmr207689466d6.7.1774352255984;
        Tue, 24 Mar 2026 04:37:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98336675e1sm609963766b.51.2026.03.24.04.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:37:35 -0700 (PDT)
Message-ID: <98bd9c5b-4cc3-4aac-b376-6c9e653a7a81@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 12:37:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent
 for UFS
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
 <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MiBTYWx0ZWRfX/GiwV9xkrj2c
 S0Oi5NQCPWgwiC867RbPgK94tIqfXSibUgLOJ6u0j0OMasMwe7pb+zUOJ+mLidzVJdXNpxaGbIL
 yL0aX7C37MkJ+VaHs/HxMB9SwM1dPbZbergFWBuxslaKEjElyy5pdhzRN9kr2HqthQ/tW/1Rf6z
 mwN9jK1193spLSoJXsYcmJv87m/cHmHodNVxEYxTArOegJs1M/h9jd1s9XUz1TGVJXkVVXl5dHf
 X73sUVXBDRInpTEGzkNTqzcNTlOQvkqXON7tCHPpKYA8AmVXsSvXX1a0qDCgYI3EB6WZstWEDas
 awkuENrFJNROdTwtYU3xCkOdwca5yTFzHUAr3Kjhi0WptkPtcstLzZBv1LN0VES0QDlrNPJQLR8
 oNZVK8fYEkzJ4HH8Zx9EiVu+n87XmroOzvv1P09CZWqAjk0NRsM0fchpGLzj/DB5QmrvRaVMnI3
 qr4gtwhX+JCckx6azMw==
X-Proofpoint-GUID: soXeqIcN8QwF2jENB1EuIa9xgxSfBEnl
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c27781 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P4vY5hjairbks-F6ILsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: soXeqIcN8QwF2jENB1EuIa9xgxSfBEnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240092

On 3/23/26 8:23 PM, Abel Vesa wrote:
> Wire up the UFS controller to the GIC ITS by specifying the
> msi-parent property. The UFS host uses MSI and requires a valid
> ITS mapping in order to allocate and receive interrupts.
> 
> Add the ITS reference along with the device ID to match the SMMU
> stream ID.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
