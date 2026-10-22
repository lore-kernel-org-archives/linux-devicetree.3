Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660068;
	b=BhXC+INs1gP/hwfsZs6L5pKBeo4gKAqA27lzrKB4Y8H62ZrV9ALMmYGaHK131sfD5Yyq
	 P6aAFmUy4lirmPIaYClOVu2gT5T+yov3UsXgiFbKh/48wQMH4AjzrR4RPr8pquRZcdVNf
	 SlwLnwOg1hC54dfQDyLTNPX5ba56mQZKN63isdb7itu195CV+U2lgGRYYQRM+dWKj1ZCq
	 v1gtcg1ZVzdoHBwJy/YMu3K8+uPedgsutfiWSvxg9SkjdDhQ3l+dC0BbxOtDHcDM8XyOn
	 wsdUabfWGgLoQbeyzhYoqzIj5A8onCWJLK0rf4X1AiKzEthsVM7PFtHDt2bnfNtV7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
	b=4zl7/5Aggm2yeXXr3dfzkveeEBh3VQtU1PWDdVC/g3KawWiVXxiJBHokEUXqARMGUAmK
	 k7xeRhce6xHjzKknOfxbdAhyPoWW/OwfXOYBQGP9GxhbebPp4ZkJDti0cSgS6qrZBjNwt
	 iBPq9ajj+h3q8jqUauqJ+RCHm+c5iSFpBc3W3ubjEt9PwgF32eS3i2Ydcjp8PkFoS3i67
	 fHi86udpW2UkiCKFRT1ErxIiTi0yBAu1wg+kmMX2mhCSfOL9Fyijbt+uGv/UpqzQlwWMD
	 629zvWfnT5ppijGg0+dphanvTq83pxCFiGTiM0leNqEd0JmupnNTc5ShfDsveePcu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37723606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37723606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4vyjIq2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EunLO7FC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708Y91561484
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=; b=R4vyjIq2Cag29CA8
	G4x6yXFU9bVRvJaCxHAHKK21/QDksBa4W3iQwfghy4OArd1fa5BAEKpgNFuMm811
	s4ZDQkT9Q+pzZ5EJSN8yqQQ+aC3d5umK7YrCL5VNf15qEOzj5NmSjjiM+BomNkXm
	KFdAQEJYZie7sRvpKs04i++qDNl2H4HS6U1+yiJINSiBApcfSR2BKKFJ9Rbs7neA
	eylqhMXVkzVtV638K/yOFEVmjZuju2tCXHN8SNpAzbITz0TmuM9KM5P4uXCuBsxl
	Nafotz2yQ980oZBjQYHLbTvGak4/gGUS3eNhz01F1IGcQcndKt7skDzR/su9U7UP
	nQzhTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:07:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so35915285a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660066; x=1793264866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=EunLO7FC6tEUbG/IxFwpfvusOCqC43hYuhEo4vfvPmUPiZChiO4Pjx4bBcID9E8UA2
         HJIW2Y7CYSTuplHvI/s6iNk8ZhKxec1EBoZbxgErpKLG4TUqFKRBJSI4AzkzL/rCr2tW
         +r3R476asrvw0fMpwu2rw+Mm19ODh5S7eRAmEUKuDwnWctperTu1/+QCdTbsnkHi8nGT
         6CGD9j9Wwfix4rduGCwUCJV+twg18Ty3tSx2mvvfpC9BoGWbysWi8X10cacO1J2ov61v
         GuPXiK12eGRrsOjt8rm/gh58AvSTHoU3t8gdgCDemGyHOWNRtfUQ5r0p4esbDvu8ZfSe
         lmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660066; x=1793264866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qu+A/DrU84k7oCYC9haIMhGuasFxzNnyZOIHQ+S7Jg=;
        b=DlMMAMlcwdZZkXGewWr5m77UmTvc15tvo4rRI/uA6XPWFAr7cbhUeZrzwomxdwAxtz
         AjSG4Twj+1fFPCzBE9H1HzCN1MCj48OImRZ1KGC9Ns77sox8rWJ7tS6/q40Q1uMbpuAF
         idT30+H2QPlhMzIBe8W7MrHhO6FmhKNhLFSv3vF8I0tf/XkWfR+LF3zA969kjJlWevKC
         k5SV3kU5vs3vfVsHB8jtuguxXtwtPBwADA7B8C65c76yg/4vsSwUAx2n9dE0db11Il8J
         8RxOqFagfwUl1tZYMdUJ1Ef424BsMsWd/TlFCcDYf3OVPPBT5SDxVopfUFcF853NFzx6
         0Atg==
X-Forwarded-Encrypted: i=1; AKwUvBxPb2puZ/HDg088dBC8XSriFiEIv38Umge3VtPF/d01Vz9xjIN4Mgxm4CLUNMDJYXRD35OlI4+vwK0O@vger.kernel.org
X-Gm-Message-State: AFq9FYIQiDt1jMjt2vpFD6xqkyzhqzKVnR8Sy/buQHrNKPV5UT//mDG/
	IEguGNeNrLPgN43zrcqQQ+k8wPxolCRlo9mNu8HTIxsTbtrIoyWEzwMvtAFRLpHj5npd0+1sPg+
	igEy1JtncHKUObmyw1rt2Ch9oVg0TrcNHlLG+8l7Bq1TfiORgi5NuBQrWyLx0OFdB
X-Gm-Gg: AYBFou2OVxEO17lujZ3ja0n7ylykNuk0oOTguVvzEw46UFhgXYBWMMxZH7t202lAZYj
	TEqh/CLwe200p/FYDgDbKTZTMdcdJISeazYr+BdVauhPqUdW5fF2afgVkgdPyEY6HZGkOP+v6y4
	PqG5sL85skB9B89CrA8TITPlR9bT7kUJ4wA2y3N/QDwa97yRhWJVmZbLVobi3rh3MetKaZy99zx
	Yvu2f537BwFeU1Pzt7fmJtoVV9rt6BSIn+71fxpWSFEqi8bvIPd+AkmPVEkAzFKvlJCMjK7kgub
	9PKNQrfWqXKrvaz/PT4f2thO2+EKO2f9eyoG+Aez3WlLUsK5NeGnV1iyOkq5UACTyJg6wqDmPAK
	YTQzmE4yNk2GhLs3RfDRz4g==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955689585a.2.1792660066460;
        Thu, 22 Oct 2026 02:07:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr955683985a.2.1792660065814;
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85290266b.24.2026.10.22.02.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:07:45 -0700 (PDT)
Message-ID: <8cc2f172-0df4-4494-bc1e-3124cd25afca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:07:39 +0200
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
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
 <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-5-4aa7e22cd0ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXxkUtXiIa1RUi
 rc635BySUpts4kSQfOrGrSvHqYC6shMex/2X5R/UBQbqrpGu9qCMYTLalIwdxtro78hF/QJYrPD
 D8VV2IAViHp7cuD2fH5GPcE6BsR+bIpejaUIkQ6PxlE+tlcmEQSLW4lLM1PZm02sz6TdY1nQoPu
 FpgfoEQRgsoqITaO6hubtUnI+duTAZKth9uSGjvAPeq536ykUQZC1xi6MUyJUEfDzNC9RRGD96c
 qO95lOHBfNkTrGOHYpwtruD8zxsLtAc05QUrPtiR9eMXEYkUONBn1lFZT1E96L3Xnc5o/cPtnpa
 KOVnQ+zic07wuZCduagsjMvzR6bRwvOKl8Eako2eu+oEAXxl6BztKLOlLmC8c9dmIwz8L2y+Ux8
 0H8PNTbvBOocN/e2ZbEB9e5wS4GEWyQN1AKhhzkwfXU+wVtF3cXiB6OXBlx8ow+l3kV8D/Ifdbq
 qw4cP9iNCawt0HA6Aqw==
X-Proofpoint-GUID: 1L0q0oRegGXApg8d2IiqDB6KnpPmc1RM
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d263 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=amIBzKCq339hV6VJ64AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1L0q0oRegGXApg8d2IiqDB6KnpPmc1RM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+Yu3pMIwYBG9
 gvHKqmnStxNfMcNQv/qnoJwmyGfeRVetg1JzCY62zyD+uTNafuSVSbaS9CDunfjC1zREqAiuvPM
 4LbVQ1B3TyRsqpYhOsLuHlNf/saurCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/19/26 11:18 AM, Dmitry Baryshkov wrote:
> The SDM845 HDK can be fitted with the display card, carrying a Truly
> NT36850 WQHD dual-DSI panel. Here it is powered by the PMI8998 LAB/IBB
> and WLED, and it is mutually exclusive with the on-board LT9611 HDMI
> bridge.
> 
> The configuration follows the vendor kernel, with the bias rails at the
> 5.5 V default of the LCD mode.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
