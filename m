Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DF3DB650
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522053; cv=none; b=bgyNLAH10wosgVfG037G/+Go4yJdy+6e+D/s60E2lY1VUVUrkqbCoPiHGvfUogEprcaeLksuPjghyMELKq5IHzvWahy45bGzfG+ScOXxubm4b0RQp+FxGKp0Jvz3wJqS5p2SXek9PYpcOAM7CfK6/LmxZnPGGWnTEQJ3VnaDmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522053; c=relaxed/simple;
	bh=vnOqKP3b/xcO5Ohy/yAR1/T968zsBzBSHlmduAuPUPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Grxcu4lQMsUIVfS0GIE+/SWL3hgBMfBk2x5UpWyfUkyDzXIlvBpxDeAYEC1HIIUqkjIEUHJYM4NjnJDIG6DKOebmrr6T1i3DNulnelCN3CDbHGe1dE3wCr4zvsm5GuoRdF/5Gz1m9cfmRrfHhT5rkY1syD+/PY9wPsSSO8j261o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzqVWNQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQjOkxBO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzqVWNQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQjOkxBO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q65Qdu141353
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=; b=TzqVWNQNQpJDLNKi
	Zk92CDofh+W/nedGsJZKDjtiQk91E3efs+ZXBsgqBV4+ULm/tZ9rxpmWPOzgaYRy
	rVYJc8hCyS40tHB+kL1BEN319FBcIGTp0rzMfOjwI7c53GZMSQj82J33LJKMPOMv
	wpEUQQvGKGZ8KfLKQvPoi9Xxwn+eMlELGvaOXujM2XT/610Bclni37pNzLSNlElQ
	kCiHHe/SFq3a6ronoy6EGQsFlXpkM+VqMEZB1F1cNYaYFQq/yiitZiz04ThN6BCP
	DyNHEWjkNafqkJ2jJnxFZZ3gpIOAgTBk7hxtVJfSdAyD5pavK1BoK+SBYeXUGZTy
	wm+7FA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q092fjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:47:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a5b38affdso2623366d6.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522051; x=1775126851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=;
        b=BQjOkxBOgRd+1yyslZu8Me41lueGxeCulwhgljNA6yb1I/+6RZqP5N4S/oGmacpYfI
         g1HS0wnldg0+m7K5KkhPtwvAcynHWg7ETl2cqD3SalO7Wg+86DV6Qj2wzmmpdBFj7ofr
         7hdnlTjLdYluR33+iAFlWcLdMibbg94g9LwFW3LEVtx2zaBBKvic0tdJvoEBEdX7OZuT
         HyqM42MP2uvqM9NSH+j00ryfDvz7Lcf5IFJrewykuOCNsG1EEqTzv7JWBogX5G9t73u1
         h4MQT5yuDdkhPeCF474maApzpdCPjA5H5E8H0+p9Wjbx5/4mdw6q1dKTJpE4oKlZswjs
         2qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522051; x=1775126851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbcoSCCJFYoNCYnsc7ZoTcxqAGoQSeFuzx3hnMuWMFY=;
        b=bxRG88EO3umqTaBUUNPZQzU4uhmL9Xl/fcheLNiVBgqlHD+9pT+7iM84SlO+ynFWI0
         yc/xIodY8Wpp9GRWR/Lp2bMkK8FwAFr6gOMzWdc3RK8riAtgmOCwjcZb0aWyz4tupZFd
         8Q4q6nHAtNh2Imh0MLS7rY8Aer14i9nFQJ1BQECiCJUBcZRFJ1xdgAt88SnQrEk2yvQH
         Dxyvvs1nRJGQXeAFvfW7ceBM8unoMNSo5PTx6JgMND+z1FUIgwVriw8Vdjb1vNKNamvu
         Yt9shLLpvig0raCYX6CCSMMAKCxvWZ4njpwjyqiOzSJBNo3L35zSAMGOZlgRaXe0Omzi
         cPfg==
X-Forwarded-Encrypted: i=1; AJvYcCVWPSDz8NNj2LVCTXpizg3R4m1DXEWHijqW017qL/7eNpb+06mnGj+2Vh8K2iEZ8ebKHF5TW7iPykJr@vger.kernel.org
X-Gm-Message-State: AOJu0YxtX9L/Vu6qzU3RRd7FaYdrHUKp2Eh7AsIYKKahIPqPd+4SZxok
	GbCgihzgPZZPjZfGkCjZz0e5sYI5Xs/uUVIpCrXbXZVaKfqR1OHZBjs7IIKzNH8BT62Mz+xc/DM
	diWCjnQ94ixoht1vNE/p4fzldbbtpW7N5fD3TQ2kQEfkD3wK3uiWDYO8oV0oRMImC
X-Gm-Gg: ATEYQzx7rVdVbk4A1CYOmiXKVj+xC9HwHK0ycnFdBtibkORdN4EANoG1yLt7bfPCWxH
	oFUYOECxD7R4ecLGgMSTtt4+yvw0gDEiT+6Y7k6M9ZTzMh5JVvXofzW2txkwz3K/4U9QKa+FOb2
	xfivpQxbELjNDNyh/RC8j3vhjXtbor9azRe5CojbVc5XwHbwAEQlohXMxGVq/N5hSx4Lq6u382K
	9dUl8jED9mgnm9dTMTLX9sLN87CWxcZT/QC3qUNLze8YBVK4B+8pImK+pbse8f0aVmQnruaanGw
	Wy38Egx2fH+OYBd7imKUUtecFoA5P2588DVqRYBiB2ZwOjD8sf8KI7kir6Ia5QLE91Pv6JGdV6p
	J5YELW/utbT45AiIGoMzHgarBrGK8oaxYfLxVSssdszaqBMvBVhT9RCOJLS0a3Gsw/LYzMnuDcE
	O1D/g=
X-Received: by 2002:ad4:5bc4:0:b0:89c:5285:200e with SMTP id 6a1803df08f44-89cc4b3aad2mr77072146d6.4.1774522050718;
        Thu, 26 Mar 2026 03:47:30 -0700 (PDT)
X-Received: by 2002:ad4:5bc4:0:b0:89c:5285:200e with SMTP id 6a1803df08f44-89cc4b3aad2mr77067556d6.4.1774522037346;
        Thu, 26 Mar 2026 03:47:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267420sm102035066b.24.2026.03.26.03.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:47:16 -0700 (PDT)
Message-ID: <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:47:14 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c50ec3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ibZFE5IyWWuyGgHUNSgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: MWNcNBBzzGNxBgQH9xhdbG29X-AvwEfp
X-Proofpoint-ORIG-GUID: MWNcNBBzzGNxBgQH9xhdbG29X-AvwEfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX2OWeDy166m/i
 RP3wMstptoNfllluKAAbMclYCITUk6ijc5y9Q2T0xrmBSbS+nNOK/Tw9kEg0uao2kmB15PzJFQb
 Q9nW4Q+4UTNPkerhu+5O9p5fNuCmLpxU5JSFGXGCTjpZlI/psOnwGHpTcHpYAweiUXjsRIp+xFI
 7eBPV8j7fGL842jiXOHjXIjLUjgFzKgIXEJeDrzpBqaYHAb0Xfa1JqARYLDZBu/TdkvZE9I0NQx
 mvWhlpSinCAhBcUbIx1k4HRLC9gW5C5gpQchwPWN0VCqBmchgiswiIFbGJtpvPWcxFwyzT7DTTx
 0X0s9qM0mQnFPxW5dVVQOzMckyrLgv5kYtcRcJmE1UH3+fozSqL5hsnTu3bgDUUyyMUej6X4C3o
 5PNszlxfwk9qcFilpu4IkTzitXUMuO5wjfmMFrqt/mzD+Ib7l/Nim+OXVFiLFmKdxK37KhH7Pjv
 YX69/v9XVK/PsxXSMuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260074

On 3/25/26 11:34 PM, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
> 
> Introduce a DeviceTree describing this device.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +&pcie3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie3_default>;
> +
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

In lieu of the recent changes, these 2 properties need to be moved
to the root port node under the RCs, for all of them

Konrad
