Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6D246766
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515795; cv=none; b=qitJaqshi2Whh/NMBhFpidmecTFvW28j40L6rZjp7yqtGGNui0ZERVbzcRjl1Sj9yyn/Fz8WrcU11x17FXGW844EibKC0s8YUijbiUjmRttzIWPNn68TxvepUwnw+N36aMXGcZLakMn2TPz43rcE8ckbWEMjIW+UI/BzS/6ppu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515795; c=relaxed/simple;
	bh=WdAXu2wQhnSrNal0fclWdl3vSbNYAndpe0G+kbfr2XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYGycPeCrmJTiwNk0J7iaGeIVJ5+d1D5P9YNQogM1MFBK9dlvFilc0JiIP6FmKupBhw0OJN5cCCzOAEInhWGAo2YaHdY9IutauSb3EAzcSSzePiU7aEQ3qpp5MwF2DYOatkh3UCVhybCWzM0C0e6MCiZ/llrjMIyCrx2wdHg//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokrrRbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfqYf/AH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NokrrRbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfqYf/AH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3m8Y2715656
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=; b=NokrrRboT7RTHzyS
	x4K6XgaFT/nO5k38Xa09rFmoVor9vKZIi7qmnRlqP2d11ThnH0pdBItRuseWlEUu
	vMRTOXG2CyiWQtu1i3jJh7llsTdKR3cOCrd+GfH9mP/8Dku7sv0P3W1kCIcAmW1q
	BNMc7Q1vAlFUf3Lc1j7jRIEDwq7APpArJni6cUbQrspcr+Y6ZeHAQRxi/DSQ3s00
	ZcMSwso3eJrAYeCodkxOjL15ubgwPpNQY13EgIOlPkHgW62qqVf+0+tkT4zB/GV+
	g33WtJChJzXg21pvgicPbuCKLglZsEtjBVJELcMRdbwFPVg/qK2URFjSU1gWxd64
	M7WtIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4hr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:03:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbdbeffb9so1890335ad.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783515792; x=1784120592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=gfqYf/AHTRZ61BqCiEAaDtbsRy1AM+QDd6zb1QIinhHsn+Hg3oNEXiF+9cg0QkHnOl
         m5xTcvypDjuu5A+ZAKO+NlxBNkKlibHXGfjn1IjdmRF8+13BzM+CLS1AyhipFNTadGob
         7+37J3TrKac8UiDu4fbK06P3rAj3bH7ZuxwHOZ9PQE2agmF1vqpZ5eX/M3Yhc960Xk+4
         Wze4weOsf1I7B6VumdEG9qVYi3l93v8VjHvykxjpZbHhkbc8zyEa3ptLYkN3KJKl0cgA
         koW7nIw1WYAosn4fSwns5+UA1VHV6jhyu01K/4xPCEO3AfWglq/r+M/g7LvHIaq3+z1E
         38HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515792; x=1784120592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=rs+MUiGiiFBp7QNjzuJSe5b8ITtw9FF0wjUXin3vo9iXAFLyIRr+8KkOr9U6wG7g4n
         jRldDBZW2HU/n7BhQkszTV60Bn8NOS7l6CzFZGPKaEQqItyWHcYlvXd58s51OdNjJ18B
         wbZjqEVC4Sfh0+K3+T+do1Nf+Obn7N5wa4h0vjHsFWxJvN7eOMd1Bl4KvduEwBmE1rzI
         FI0dRuqjeZSvL5LYp5neEYWI12ZkoMPP6fo95qzRrgy21nnwZZghzFQWZ/kuZWTJtNQw
         Dtjx909QRdBNCkcbVCd59v7GouqNMNxoJnok3OoREAY0t2Nu3KEDBCallxPx6s2bpG8f
         jm/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Uxqph2/wJn/MHkp11NBoACQ5Nnpr2kDnZ+ihO6B59ki1mRr6mizhd1r8rMZRWUo3Fk6cZwIb4T39@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQsWpaZ9C81V8QiucedKH9DeRdiwwi6j3FmEXV+CVH1m1U8pz
	LCJggbLh89e+K7BjqVXuxu1Wvk+ZldIY2RmfxCYrA8gsvj/ntR7+ance7REyBoXIjc4FJ6ub1p9
	s7xRJU6IFS3q0KG4aV+BVr1GqljBvpk1oF/BEYBXQchq6qxgZUurlS50S6R7dMiW3
X-Gm-Gg: AfdE7cmbleh9fKqwISKimpYSL3dlVMUaE70fDz65XXxAJhFkFB06XqwqCVYBEnGEVaw
	/35wvjLAbTNqy8ih7TAwXsyyGiUxYwkGp0NmQme53RsWrZaOnerFXCHGiW9pSyUedswm16UhJUm
	MbEp6KLzrnnGIKJgdK2X+GTbhc38+XRjlmi2vY61L3pmVWvyytuo1uLpVieYFUX9mhpBxbRTeOe
	V+5s0RJBIsQcBsTfUgXU8pKIAYNgHJXPDuhts9+hXBIreOqaJGFemG7LgDTzc6SFswiz8AHIRu1
	0sbGilLMg5QbH+DaOzxpKshPHP2RHtAdi5IqGBNM83MfLb8h0p2kexB0QfsdMO04ntK/n8lKiJV
	YxEIV1MNZG0HzXs61DjOHlhavX09zkcsBcik=
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21921375ad.0.1783515792332;
        Wed, 08 Jul 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21920945ad.0.1783515791798;
        Wed, 08 Jul 2026 06:03:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm89230266b.27.2026.07.08.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:03:10 -0700 (PDT)
Message-ID: <6d2f66e4-502c-4f69-a57b-0cd779cd3501@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:03:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for videocc driver on Qualcomm
 Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX65szrDY+keev
 UVrs6tcMiu0nHNll5brkSXgRfJLlTAD0qJ9oVpDmpxkVYjWkiy8d7OKDk9eRnpnx8A23eg9cUoP
 7LtSoOlc116gQ+BobHC7b3MI4AkGIePyZ0mzyUTzK2iI0DzoSanv4m1/ou52wz2osWOX7qZPJdC
 x16CNTCeJRZ3T1iF8xVHf33oVpF8DdyAM8hhQfwDR2z/JDQICjl8W20zb2OiBWb2VYIm/hVzgnM
 /9WE7nO9E7Ra4dmCHsqPaayTKQj1pdFZU2bZjAsKTsmbKFDCMvE8JLKyKj65EUcMcpTw2kQsSnQ
 oWRTYrX3EcTh17uhbX1wIYvh+gCkrhaJrc81nLIcKv/FDRvcVTJ1sGEQvZ23bhP8136A6r9n8IG
 vYs+ugUVS1DMhAsciFdpJJy/oZjMhJqvo4W6GK9+ldygGXIuS3xoZ6MBNLvEp1ZUjeIJt48MX9Y
 H6O00i68b/orKstd3NQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e4a91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KabViBKo7pAC4wHH2OwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: q4aPqLWRzB0sQwwI04Q2P4MxMr-0fYgB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX84TDH+xecLsa
 lJqf0eGeXHXOT32vscVwGSczZ7vHGbvkDxmXuX3gPiW69Puea3D/S2vZ1sXRPY03c3y95vWTX+f
 BNTWU2SYmJohw1YNPvf6bBAYgg0fN4w=
X-Proofpoint-GUID: q4aPqLWRzB0sQwwI04Q2P4MxMr-0fYgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080127

On 7/7/26 8:13 PM, Jagadeesh Kona wrote:
> Add support for Qualcomm Maili video clock controller driver for
> video clients to be able to request for videocc clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
