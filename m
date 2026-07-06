Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA363C2787
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351889; cv=none; b=PQknyD3JurMuOhip/l07JdkoFiOPN5ZnSxb9nvf0miNTqNycybyxWgjV4+hMaShUO2kkxFSpIfbgZiYC4z3E1v3CWKc5lN2zdcYx5wL4+4rESbQqt0Ad611bhTrkt0Cs7oqYOjbx2H747yNsB07vILLCcbgFuUA57QmIvMb/ocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351889; c=relaxed/simple;
	bh=MWXvaa3McQKW0X+Ho0aiOmBxvbNnEOlsUh1HkA6n6nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CK74cCHWMgEPVotkCBo3kaSnSD3UOqMGKnOXypetMo1GV8yw6kOhrqM4VAhtS0uZd/ds221nC1z/pQy/ssRbiO4TZcjbzxCw/vXj9QHkt5VJbcWmLaK9DGCSdIQpArvalH3JJ+CZO0TeHYwu4wHQ61jtYhfLd6kO1ChMSf1ufUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3sfWJdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PM2ml5LX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3sfWJdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PM2ml5LX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFAaC958540
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=; b=i3sfWJdnHYtFp/s/
	OhKnvi6OBlewJALw2q0S5l01BpxtckE2+XbTB7s0I86CpcGzpEcd6fS59BVT+DDX
	oUm3L2Fxdk0MX/IxO2Ir7Ca/IuiAqG5Jbyqpa8W+N3rjRGyvEkYXcrUPCLYOb6PO
	LfUlTR8NmGYs54DRcl0kxBp9MW3U7a0o5IpwezRgQ4IrbOyS/hAehmCDHdsyhZAw
	JrtJdpee+AXL8FCFvj78V3DkV6BY45or7BYOCcUAKy4OszpLT1ghidPFENeslALu
	gecIL8aDTQg29ckoO78H3ZhDLTEPhd98uMBlH3toFKB57RwzZmi7Gr7DBtpBGYe7
	zLYFJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99yt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:31:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c069f73e4so10374721cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783351885; x=1783956685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=;
        b=PM2ml5LXLBNBRS5NB1sDeT2DjGBMVUOFQVhkEOaxGcrdZWHXM7u9mmTlGbR5+KQb9P
         37Dk38mZ4D7g1khJ/8cbM0E124cvFClIU7dSVxyjdwVfjH/vr5/FwIX1y5eKxW5FeQ/t
         atko23RpGPreb9HkyYLeLrDRjBeljG5FnWcpRsWZa+16vlz9LyNMjVkV9yYwSGlJh0eQ
         WN6FKor3qKS++821vZiMYyKuHGFd40n2T5BX2zDqZKILCCyZ5MK7veEJK3fIS7YrM43e
         1sv8fNDPYIcceUyf/EAqvfEckQTW9/q3n+IC3mgXJslctzuIntCiZSWKxPpY4xTCd6nK
         paIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351885; x=1783956685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoGmX6/8M0XrRbOk6nh6+9gojaLrHsrhKhUf3nggO1A=;
        b=arK0FHeiInjBlnjBtEiaWwg4xFj8GxVGlGipaiYQToCeF4u5tVZ+e4wSMwlVfGtxZi
         5tl0YZHO6IeGesc0j6z6smtO57rRiEkMPoli2cC98hPW9DoofV3qPR2RLn75V4egpBmn
         aLnUKh+l4XLhdF0lvJqx69spHJIx+nLM3ZOrfE9yl8aVaZKZCY6UtSNscKrKGRXwIuC9
         0oXMq3qrH1EpQ2rTEaYCfz2JeEkONZn5nt469nTxPZqXEhLId5SFJ6iIDlwBh0IZrueU
         A0akrCL/Zi6TXtPY4sZH+9BJxzA1RxNG5EYQS1OxvxFrJQoY5FXLEmwyzzyuZiFDZm0C
         3c1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp277izFnyaxbY0By0IRwEr+yLnbnGPFIhBDcg4t1t+UOguRx3fW4bebRRvuu+yy9IoCqiqoHidwk45@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLMeiyE1qN4qNbAj+KxLrHLkkQkyzCEDDcik8aPgocmpcU7L/
	pa4bQ/PgqdoPBSZYRIfrxeE6/YIFVZGML5rTKwq3QHGDpuebZAqJA5MYojD+2okrcMtsKGlKo9A
	qEdGRSQSQLuhM7dwNOZFuIxPvLKo9zJssoMiy54n6DP6xLBNAf/LTqD5mV/3VGPmC
X-Gm-Gg: AfdE7cmV5hYsrLKpp1kiBWhtYp/gk4//3j6YHkxTIin+vncRMPdKCBjQL4Cs8aNibQ/
	cQaxg3PgxdEr25dZjsWDODsvvE8Xs+xbcfQdPli565vB2lqN3rrWFpDlgyPBi01rDZaSDyGWt06
	qNhCBLk3o6XlaWNdKzmve6R9RPK2YhTsY+l6fj4TjcehdYvVXMGZOdzTAv33TE/Dlfvqlf9V+SH
	xExH06ApsGu0T5GFrcYTEJPukrT+18Olln3jB/VACqp8OAps6dWaaDcYYJaESOnGiPpDN0Bk4wG
	CZdx2XreDaLDYjZ/wArN8UYYeYESrPnRpnIVWj10sSqM3t353KRs4dsbtW4zA7L0TzJvI2tck6d
	W/Lh4oDc2/H9Gg++MiJL0bpA3IWZXRjRG+2k=
X-Received: by 2002:a05:622a:180d:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c4bf5b83cmr97156561cf.11.1783351885540;
        Mon, 06 Jul 2026 08:31:25 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c4bf5b83cmr97156201cf.11.1783351885041;
        Mon, 06 Jul 2026 08:31:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm4271032a12.12.2026.07.06.08.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:31:23 -0700 (PDT)
Message-ID: <1321c89f-ab6a-487d-b18f-99f281a1238c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:31:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RoPdEBdoVqEd8EbbLK5JfIZfXebRDQNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfXz+QRJ28m5i5O
 fB5TaRL3ypFAM07Nyst74/QWDyJft7NvHTaXbVDv52qYG0rufbFWWZh9Nf7fS3hce9PUKz8DXjE
 wWxB/FgxAZC5JcttfbAgG8S8T3iTAdg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX6np085TcNRhl
 7uRPQG7fl3KdnGAv+84Ob/qHkLUGet+Po8/5nFjaNVjH0wLPBBuKtT50813gN4XMgIfnyPfJ7S5
 zIc85Zhx8hTvfvg1n3+MQy7ZbW0X+vKVxNpsYslRC+0N3ErZ9lNzu4OSCjQaJB7spfMFVJREmOb
 xvTXSMTZPROf4R3J752p80v78URYJY9wxR8hZEL1VYFO+QhDduBpkv8wkyPwErSMm0LWBmVU07P
 71BgUV8aECQxYvXk4rSvf3BPXxIBjqgfUKoFr0VHat10VIt5bEIqgpAyz+tQcWAEpnR0H2KmcCt
 +OIlR+/oRmA1o1a4gJi7FLpOBHr/wPkPUlJjdpm7rVGW1GxBppifRCG0IzAy2MnjI0i3iDChD9D
 +66XsXXl3mBewGZ4+mbouCKTAhnqZ4EwpzfS1/yvNpQGUNX6CFkBCxp/N0Rvw41M9fcpaDg9uxS
 w+EdQ3IQgTqggPM/Tgg==
X-Proofpoint-GUID: RoPdEBdoVqEd8EbbLK5JfIZfXebRDQNi
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bca4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eoxlGDcgPB-HuCwanXQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060157

On 7/6/26 2:31 PM, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Add pm4125_data using the abstraction introduced for PM8150B, along with
> dedicated voltage-selector ops and the pm4125_vboost_table covering the
> four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
