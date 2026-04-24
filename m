Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CD3BB9F8
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033258; cv=none; b=KomwaKtpsFVOPhz7UKUpEVQ3ktkc/Nmt7OE7HjCBFYu0HwbPysieOoO4KU+UZieiWV7mxaP4UcrXqFTJH+w8vpB0/lRsht9BTMX5Sj+ohQcVCScfFy8fwACADdhgL3kMXNdlLa2nZdLLVu1jFkDLyfitVy41v6C9AIP4jxDjKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033258; c=relaxed/simple;
	bh=yA8ziDbiiuDYXL/uNT3NuacIBGDQl5QA1yM4wel4tRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqPRu3jy08O9oRD7CBU1FJr8SWauDGImeoqbS64PrvnB6wdkYvPgNpSUri9ip32WDppGSipDMuIFRnkMnFZ2GjuP8ZBD7JG9kTJv/YYI9r+dIC8xfY3l5TIdmMN5TeYuieK7vycOPvrQh2JUR/zAtbEZXmoY55tN/2Ed6VPvKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xb9stAXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnVovGtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xb9stAXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnVovGtd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z2Yd4167478
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=; b=Xb9stAXSdOD25ISX
	8T0bNeqeyxKc5cY2LFlOuz/jjHIQZLxjpo5cVDNXfcda9rJ/nnMroYJ7tSIL8Sl2
	GwRPN7MASEVX2E//7nHgoJRx1GFy5KhOEgb6C2TxKS1epmNmiXgQWWHFtY8vgkbV
	nY5HL0fgu+jpBTzgNPr+bSKJIMvLQaPTiJdMJEBo3z64nxsqKEghAjRF2Yyr9AQ4
	CY9uhm5dXz+1fkXvlASWj3FW5Wb9VI3skFW5iG2RXQNxoIh6oZon092l4mKkzx4K
	VOZQUCWEi0plDxqamCWkrDJ3moQQsSSbvACPagjmFOODC065knZfVCAzq7ek/Zky
	7WLo6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n1c9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:20:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso12372961cf.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033255; x=1777638055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=;
        b=EnVovGtdphi8R7DHJ8upPfYBjiKVA7QNFMjxtPWGjKsH6oWE/8rbjSO2XFwn2e2itb
         Aw1RuA3oDSlAx47rvoakDpedpNXZ5bOeFt31DuVRozPzHcwGnlHfMEDR39vkEyPnDxQJ
         Ks5P38i3es2UInRzKMTxK3za/emIljgn8emdk+f8OiF1NiIh0+nZZZr5B2PXFqUQL9FW
         tsveCR2NM8QYHqybeZrAHmwoz73VM6LmxZ0sEGM4P1Ys9dkVbPyPshS87vq86GmiW+dq
         dzmTaRk0kNhDzd/9EmManQ9QaXP2jLIReDDckLsxRGXetd0BVuHoD9BKjFzZH0nQgY6Q
         4qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033255; x=1777638055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMMw4YsypbgdcdXsMiXryhtFIOmYWDOgJ2k0IZlBLls=;
        b=bHCgyEcsW4UbpWbFBv3GKtkwWbZYL4zwoLfrsHl0TsXDwglHdKhzdK+dFWmZmmN7y4
         AhFODI9lnLUJLGCS2FeM33flR60Q+B9Qh/yX9ei3n6R0A1sM0NS4hUleSu+skuywUKhj
         XHjR1jsT5nPUQyS9XrwrVUzBnZZ9FiDkEpimNNOjYt7gQMA/mci0NifnYHtzHxKi0+gn
         /0Wt7ZMWp2q+fS8TP4cAR3MkMNfPnaX4ze3AgeSPNJp7smVQDyxUwQLs4Xdsvp/0mb1I
         Vyodn3dTSxXbaVcLS0CcsClFj3NxBgCvvCFQQiI3rxUJsRxWb1koVQKj8R0bBL+WLQXb
         +IgA==
X-Forwarded-Encrypted: i=1; AFNElJ/+PhJrLtth8F0H5Ef7HBpSo8MM3MO0teff+PsybL/hMi0tEW7I9A8bnpoVjI74AsNTZ5FSuO82/fun@vger.kernel.org
X-Gm-Message-State: AOJu0Yz007nCLpruarwrzlc4zlTD8vHOulvLwIOOzxaChwaLAPGnxagm
	BBIzFZAD6SKPvIkiYtoaoPwWmkw2pKOjooDQ8/SRrob/caiO89x8rZkSMZJS50EJy95iqI27gxi
	9S2F1KZXMGyS/YCTH3sQwv2eIyzWYV7nmNQjJJ5kksPC7kFTLOpL8CEkVwrmhbF/V
X-Gm-Gg: AeBDievVxVkN8gWCK2MI7cYEojYm8sFvmi+CDaAetxZQGw2PQkYZkyeF9xmspa0pETc
	xNoZiMsnFUprK82+rlpeEWb8zAO+zgyiw8RqUbrAdUAXW5+DaY57nyg+kAgfkS0uzg1NMi5Gp0a
	0kT9g89bJljNrbgwejUYwTKewtrsRbfbyAg0tmo+WoztKMzJYeRfkx2yCvocagprgQ58QQYEaNk
	wPwgmnstQ+fsYs192+dbF/BEJQSp2A9yTyhqoxckIPk3w/06N9C/pQ/91UiQvG2hxFokpmOyfsh
	H45dnfOtGRWmNwX32BHHz/9Nq2MaG6PULqnL/UgX0ylqHVvY9KOScKoqpjTP7tUVYtA5KpKG2Yd
	/grDv6NjJW2jO7zhTIl1j/AK4bjrj5R8AA5SCRzGQPOCzOt0PWj6a8ePdJL/jxljk2Z3fKgrGIW
	u2QSz+vgh2gMbsvQ==
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr212489111cf.1.1777033255242;
        Fri, 24 Apr 2026 05:20:55 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr212488771cf.1.1777033254745;
        Fri, 24 Apr 2026 05:20:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm793905666b.10.2026.04.24.05.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:20:53 -0700 (PDT)
Message-ID: <0c7ddcb1-306a-4afe-a026-930b647d8b2f@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:20:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
 <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p23na-LZ5OIVHFJQZgXirBQvmUPV1QeH
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb6028 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=2a3GcjfFp_zg-3xO9c4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: p23na-LZ5OIVHFJQZgXirBQvmUPV1QeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfXymrL1gdvBYUi
 gYE2Q48HCppX0DcDPxngZi+PtX4OpPlW1OWZXyGjFFXTMCiqDUbSJdm9XrlVirZNVifA5NrPXJu
 vmRByrDRDETLa72hBbKu1C/+WKDf0di1wYPZRsW0eiQfgg1bFVvf+svBrIsJFcC6pL55wp1SRC6
 ZAN2Q2083KWocUZY56ch6Z+1WlnOVVbG1RJ7rEXwpM7B33U4LIYVas6HfBAqExKwZlYiwLkUld0
 6G9tsSyu9SWQtdVSNX8am+EKaoqEnx9ssiQiUe/WXMhpQgCKFZinRiNqi/nr9Fkxa0uec5Y6x6b
 mKXWiICfHpca8EH6Qlg0j6P+QJfTLlhZcf5vmt84NgCbaKetP/2wBaRyCPyp7/0ovP9zkqVqrgl
 Aod1NDVawSG1E3xhDcXwNqvgakPVcpCW0qyJ+KRp2sj7T/LS4ODTYNAr27aUW3cLRYAFbWgQRmg
 syDsNeFvOAPcFmh4Big==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117

On 4/20/26 11:13 AM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).

[...]
> +	upd_ponrst: upd-ponrst-state {
> +		pins = "gpio182";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		output-high;
> +	};

This should be made to mirror:

https://lore.kernel.org/linux-arm-msm/20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com/

Other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
