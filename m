Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297937;
	b=3bPjPpisFhPuAFg64qVNyOCI6M5UE2bFnEFzDXw2Mk6p57iLXI90X0cE1jT/+L8XqQSh
	 YGFQod53bLFjsPTJph5PrXeQHrJsLo/lJ4A33Gc5hWOZweGV+eZu+ChRllDqttLmHXfw5
	 NLWjVNpmRAHbNuW+WVmXVNmIePyEksPy0vC7KBJresDDeqI/rTZv5GsFmHGVNSENillsW
	 u6h5e2l33Waa1iXRBTtqD2M3LQ3/6i66awbR4zvFMTFZs06bUyotNNvs2S+HcduF4VUYZ
	 OaDZYj+f2Vhido5ZuQM0d80xnEButoJgQkHjuTTQQLPvHozLAvtolhkia2f6atgKEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
	b=kIf4MFfGrkpdgokM1cI/5OuLgEnEBc3IrxMMPpqYZmrJYbmg25zhaopTNcCoA+uQ0L/i
	 xQdXGKlLuTTz4qtB57l1LxSLGqUpHGFGBgejpE64HyRLdpDivr9gfNnmPjUSWxn1sfzcj
	 CSf5Tm1MHvh/VlxZt6+i9CelR58hLT7wmYCPYM6irhuxdr8PKFmJMZNZz+9/vS+uWKRBR
	 RzDMQ/pYQtOGSZP2ZphfM1W7gRvas9eSDX46yyk8mzfdc69B/ufgWB+2jksREwC4xmYy3
	 SaSoI73hKOHV+ltMnies83RmLmRmfti55jZ2zxmCLKioMC6NnODicRgl8dRptvuUjFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFC4606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lgwp2753590
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=; b=Ymm32Jxu9xyo0ZWu
	hBgC50+7K78337ntZ39i6h24qPBKxB67EcPcp2JxRBROQgcOJe1D01fyuRembgXJ
	hDO+Q/2Us0e7ZxhYAJXwd99DDfL5OvX152el6QeNtbbaq7o7gDCRw9fv3CZ5nXmD
	HubcxsJ3swsOCExsbfBpwLF8IKFi7Qy5sqGMu5MWy8bo8ZBap9k80i1oMTnqGcjS
	bcbT3LP1aDEpsxuHGeXWMTiBgMw6UBPQUhNc5NbUazzKOQCP3p0aZ63nBFawseqz
	2m6/ngKVhBFBskDI2lefXx1N/OCrQlWkBVFiMbbRfgBGqlTIUb5eBDsby8ftdu+8
	YfBTHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5c8pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:05:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so5166781cf.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297935; x=1794902735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=H4pmW70Y1JPi0mJDhJc7PnIf5FbN+gXvBLGrmKVK8HW05RNipIuUFH9ZQMJE3aZNyz
         9ftdGtfFVotkP3MVjWuN4XsAC93wlxRHWmP75GWc95iMuxNw+zQSywOYFrbww9X0xE9x
         Zcn4yo7VPcR/22e9QU0VSX8VZJ5V+TTu7m8tsL8ggvSc73BVz39HB7m7OM2Y+mtfqFiw
         vskpGxh1giEzku6TVUTxh/Jhg82eoBswUcgkvFCpaxqG9gziejF4cmOw2a83ZyP/bcbR
         vOYpemoDQdCqWEmwl5X4VR/vP2Kj1Q5Wo5SPyGdFq72G52V5y7hF3GYhqDo1fWVMrqj9
         5Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297935; x=1794902735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=bTufbzud1RDSUhHKr2NbMDNSWQKjXBLlvkFM1XHEOpPnq0jDGVQFsCm7mpFz3qBDy6
         ByUsiUFTpjyjC8jbhRDoNR314zOMKrIe5eCRWHROS+eyMtOjlRDwdHQQ+A8Ro8S2yaM+
         ygG4SOLk9Si3W6uNgDZaaNOOI57kKt8Qr7wqd4KIudHEG8kBi79LL+t1ncYu16A3jOZx
         PTbHXHWOtsT2nbw4f2p13nk0aHR9Taly5QXIfdH0IvKWkTt1EZcKn3BJWnZ4wy+ebuLN
         nNG7nX3t/a+MfvWPklJ6xbwFcVXPpnJhHVDGfCSY4y6lk5+CuXqY8wuhHOX42+NZcS6H
         j47g==
X-Forwarded-Encrypted: i=1; AL+hErGQf5pHzj7G0qkJ3Q4oj9besJgaXvmu246Qdr4mkHezIVk7RXjTs/WjnV26Qut9KUx3toQkXusqCuwD@vger.kernel.org
X-Gm-Message-State: APuU4Z/qgTa8ALxjh4B+8JTeOFEYXjVznsJ1WOEt/hj6YAakDiCePuVG
	zaKBvrebYveBAnbyt36xkBcMqGbZJH5AQ8XbfaW/ETrRS5X/8AD63RYGc/ZGCG9FSTiCX3AeLI/
	t+50AlrIg5rWtysDr0iyOy+5k+vFuGeeGTonIYHhpa+yo+u9nuIut7+iRd7Kjcx9s
X-Gm-Gg: AYBFou2+jJ2Z6DXhkYc0Sv0aD6Uwf9gIV9qip3GvlOX6DwEiDdPADVoMfVilfc611H0
	wXYKu72bfmKU13Z8dJjMe4GWqmYM/OefH2JZMaZAvQSdoKK2VC9EoGX8uoCTitbP+eLoAOiI3a9
	ic4Xyfsc10kDnungKD7b4EsPKlU6kv903KgMAVTMZA4Wn7haI8OPhX+iFmuf5DYyQf4xjYe2kku
	QDaMdJ4tOmys3ElUA+LTtY/jPq6EoO6ycydWXq/MPB5WPCgkcbgsOIg/G1q+NTDG7LxFKNLjHg4
	v2VI/GCde3Z0LcbU66aJkwCTZyu1HMtnWjD7FcNUCgu9mLifekpMPMSeymV49AO1VTqauGhIZty
	iXCUUvTxs86Ekfwm5qNjEV3UAm4B5tTYMAM9fsIdFqOxDoYQ+X2MsW7T3DxFf706XRfIYvgU=
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34573071cf.0.1794297935005;
        Tue, 10 Nov 2026 00:05:35 -0800 (PST)
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34572611cf.0.1794297934423;
        Tue, 10 Nov 2026 00:05:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59436esm79121566b.40.2026.11.10.00.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 00:05:33 -0800 (PST)
Message-ID: <68b721d0-4777-431f-bd22-e89c9c21853c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:05:31 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aSwHSGlsx_wlYG-UiLU1HiLLNe1gzn3R
X-Proofpoint-GUID: aSwHSGlsx_wlYG-UiLU1HiLLNe1gzn3R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfX776lJuqfV0Qj
 VV7witNOcBy3gdlbWXm3h1qP7d3XScADvTTGK3EFwa5BTJFrPEM6KlYurKcbKfcqe7l6OmM9sSY
 2pOgyAGtFoi8arlqcQ8xWfU2QLLD3/I=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2d04f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ArbKvjEle962CzFOaqYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfXzxrAWAmCwrcs
 8Tu7Te8PWPSI96LPvDBNMv8uYj7KLpdWkO1L5pdwvZqHMUuzZ8xDI3ilTZBKAe+1uAd6E1qB8LQ
 yfEf3jROCId+Gj+QS12qCJ/zpMu+YvZKwL4g90GnUSpuqvwSsDarkdEQokraRJiblPHfBFQmFyj
 5MxEcmY6I6JR8GA4EpbD4MiNvdN/ZBbJ7ey7/0HoSgbd40B8pprUMkmwLbtDXDRJ7rW5J2+fUeD
 lI0hqnk/NNCtTwEVLzXwgc+xMka4DGinUuelH7zgYHvvPxXSNj0QmL4sduLe600jj5iERpeBweW
 HaSymgqn9Sk+qpH/RGJSXmnTbymU9LwjB7M10Xh7hiqhDYfkS42KrQXz6LrosP1uUAolbO/X78C
 fHo+z1q6g9DsKc53ZlwUnuVUprwLIGnQbTJBwcRI8/+AkP4AmJkj5hjECt6DbK2vjN/LnKqo9qp
 oI+BFHM0WHZoAooFJPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100032

On 11/9/26 4:50 PM, Nabige Aala wrote:
> Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
> Enable the two DisplayPort controllers associated with the
> Type-C ports and define the supported link frequencies for
> their outputs.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> This patch enables the DisplayPort support in Mahua CRD.
> 
> Functional operation depends on following PHY PLL series:
> https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
> ---

An alternative patch was part of the power grid commonization
series and has now been merged as

fee7cfb39608 ("arm64: dts: qcom: glymur-crd: Move DP0/DP1 to common dtsi")

Konrad
