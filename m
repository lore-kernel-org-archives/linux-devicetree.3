Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090030;
	b=bQM9PL9Ah5cZw2GkUYOyUKtmnaZCqALudSqDd2eYfl8p/N1nT7gUQX6qZ4BNliV6idtH
	 f2L8JkLs2LC28vsno+zeGW2ET6nw9wV/FdURqaiZU4dkXO6vsqndkZAinnUptkFoKCOyJ
	 pCbADisp8AdN7pOWvkKRGdRg374ZCZDGi4KIW3/gh02wzBPHKQQq8ECYi8yKHDqtVJM2O
	 lP7YooIXfYROJVr6pNodOw+2XaxJE/16Dbb6/0IHYqyz3f34EPYm+1N4EBwzvAD/KqxCo
	 9WiIUfkAoITYaE4ra4R8t9I/Tc4it7vAddzFJobL2pSR31ZTz+UjEEBoK8HeX4EOZ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
	b=z3PTWi2OCFUSH8nSveBLWReo4Yli2vwePrLHDIvLhkt7w72LayIRGQiFqxtPb1CNSqfc
	 vsEeQcIyPHG4cuYXz2qPwqrhJBCvNH3/3T0Og8X7LzTDXESaiGUKui74ES2+rqyNFun6h
	 RJ0ZO0JBcxFJnfWh70QoXOhC2pncb9j3oZgH4iYzduUAE3AkuuPdsuY0RAm7hMxm4xc/b
	 MpnNikZArshT+tePZr93zxPRslkt4I6gfTBGZ6Ah3yOliiTWxZD/P81CTW7TUx+6uwilE
	 wyGbexqNLu6a/x0yXg36qIAJgdn9i9ES1u8ngRsI6JB+FTkgII0xI5G1bJpeU1Saf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRc4sDkr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmdY25w9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC9606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRc4sDkr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmdY25w9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJ3M3950141
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=; b=bRc4sDkrsY+osIgX
	N8YTOL8OzPUUjT+3Hlx6GAYOW+un954QxMERGuTJvWNzUOPXzlCJ3KCJpQVG00jG
	JKOj6xWWpYgBW4XJZoaQ6D4OvX+RQWKZgHRsb5nyCxENjcdkHJHugOpyjXyqSpcy
	UQxuoAS1BiFvFS+ECU2TrBq0jDp31cfEcq/kLj4XVE1VHybBN3sP/W+J9Vu7+va+
	UuHaCGLEdqkWdqK+yCgJYLFM50pVNgYSUWvN8ZCf6o3/ABmfCp6byYubZlOtnyFE
	E5dqKy8BWm3ay9qNof1q12G3A7IqRTaeE2ROX1WVugXdTee6tHpgQj9Ioewj8Kcv
	SPl08w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jv7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:33:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso15275091cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090025; x=1793694825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
        b=CmdY25w9ZB2g+GoQKhru38h/lN+9wVF37A3WTcmYEpeeZzOs9QlNgtVV6ckgvi4gwc
         UdlfASUZQYW//JEODq9L37eWitckm7T8gpalwLmTs3aEIzaOzCa7TlR3xBHBe1U98ylx
         5NJCTfubIZKj89/nFr8ab7q2Z3JrRJb7JqD+PGjrnYpXlHG8b6uRLyuFfZPOgNWa+RqV
         fbDK0F6Qsk0C1j4dOMLEy4ZCP1kxizuF+jRdL/F/8hH4ulSzMiA9ovfCNt0FmTNCThQ5
         7uSJO4O4Plo7p8ZuCRVrJXABvMpvTlZnclT2lXUaUwHcPJebIX4FHWGTAWyjJLq1uhIe
         dacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090025; x=1793694825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtdrVNiJ3zpClPjAIw/I7/xnRjWaayF2qUMuhQOOe2M=;
        b=QDIJbCbc5NAGbf5Vqdmp/dsLakt8ZvR5FCal4Dc9OIkg5864QDrZ9aY1zUrLbImIty
         18kfw550C9/vYE2AeY1CDecItac9xkjkTJ5Z58bMzxPxFGPBhgBHKzSdQMm+WEWwQ8hH
         axSwBEIGZuKjOxWa/gWxy8nQzbEyHy9p2EehVBh3mpjYAgLgJhZSUh6APiAf+SLOaJts
         8s8QE24kgpR+LM29xqslr/JYEwmvKEGp2pgG6w+nOPgztO9op00o35nR741bRRHZ2+dL
         FOPYt7p9U0rn1kiB/rS2AILL7o0Fxv7jX90L1sbkkxf9dmhZXRPtYL0edHLQwj1kJuzb
         lzOg==
X-Forwarded-Encrypted: i=1; AKwUvByORFZJUfUDZCrsc/551Ib4QNvnWihaKhpEdWfUjgffcQC54bt3T+gDm/VlIV30aRmYAFgf0r2PfJZ4@vger.kernel.org
X-Gm-Message-State: AFq9FYLcTUaRiZuQEVSXuDB+9Yx8GsPSUA+7nSt8ag5Po3lS/uqC70P4
	l+cN23mInX+iIlQlP2MziHMpSiiZ/9o1W3ngK48RVVzrHhJLDa2dwkW52stHohwacOIpEwXXzrv
	KPdcuWEvLTUx0q76bSupAUbLHLC1/EW8GAQw1ZeUNVN2LhyMzt3MYW3odGCOsjO+0JTupg3Uq
X-Gm-Gg: AYBFou0pkMKHsXwJp4edS0V28d4N73eJIMre5+E30BWpUmOtGRvHKe1+i6+ZuUsfpKW
	IJzBkOX2CSeWhby/lg1gcGg62NM2AtK3Z7FdDGdrnDMme8pZer3iIbtK4lijMQKqLS35LMy9yGT
	v78vumOL7J576pZR4GkDtqH7M8ZT0ztEVDKAAsr6vTQTCfzeVTeLWGA1P4qvFbe0FjNRtHWeN77
	6X13b1/mM9/yUYrFgIbTXjNVvkeHwwtlOirWrmNh2KMdSDistgaTLSaSBgpjnsDltTnZCq8e6Ws
	CcithR9XywkwKigomRMoL4eE1u3hOPPP2krB4KiRbo3gOdXpm+BaSc6yEyODX5u5mLd2DdqoWeE
	atGZe4AGRCPx4N6Y/pc0oOQ==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr142426031cf.4.1793090024938;
        Tue, 27 Oct 2026 01:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr142425821cf.4.1793090024557;
        Tue, 27 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d7c8sm4686184a12.8.2026.10.27.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <fcdb97d3-58c6-4996-9c66-f0dc99c6f699@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:33:41 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe
 ports
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-5-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-5-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX4adtJTZPWRwQ
 OgMOTkMMIt7dPm3VL83tHmUsxzAXI20AZggKd/Zu+4XTRRzegwkMfrAjqrUs8fIss9pQk5JJj9j
 LXKJ4dhpy9DvM9eNM0mGm4/AFwT362g=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae061ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=_qlRp4P7470HW9D_qU8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: GDknCGoXxB1DDweEtUSPa8SBLzqN4Uih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX7gsPEfLcjTTP
 EnfqgNEbXT3CfSCUkSitZDT+MRkHD/5uDVkECkWi/gmRAjWq72hktHbwi68d1f8JFyajGpXOwYE
 FnPzsTnhbMC2ZlJI46VTmSREh872P851ccdmR0GRZSq4HcrfDGyDGbwmoP/+853nP6dLOw1c2JU
 P7cfyLdK1atAqMDFPp+4O7pkRqqQwm5s6q4GoGbqa6RIOn+NtYXgVOmzKrAPTBNGuIlnUlUJRjr
 GZ3TcpBSkRkZi9Opvz1vOg9MiWL4SDm+8KGsM//Yy5UCWaE9erSb7j0gLJuOEoBhXwj9qu+U3nh
 WUs58VGTM0PQC7TiFYG7O40wAVnXhruZ+IWfxp0SP6vQ1RxXugifwNI8gYLb1UyCWsEhwpnkgSC
 aHeNUrMd694hdbdw18xusERlTr+DbNXSxj0woefliYJXFfk857+n3pa4A/ffg3IkrISIUBfe2+E
 S+PgI8/f9qOqavF3z/w==
X-Proofpoint-GUID: GDknCGoXxB1DDweEtUSPa8SBLzqN4Uih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
> The pcie0 is for the on-board ath11k WiFi/BT module;
> while the pcie2 is for the M.2 connector.
> 
> Add the 3V3 regulator node for pcie2.

It's a dummy regulator so it does nothing - did you miss the
enable GPIO?

Also, nowadays there's

Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml

to let us not hardcode things like the wifi node

Konrad
