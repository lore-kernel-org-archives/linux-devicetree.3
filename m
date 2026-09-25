Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F245D900
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338489; cv=none; b=pPmY4bkDWoU4tZcx7roub4Z//05gq6bzM99+YXEx1O7islkmj03N5TBZaEIatPjIkfYJuesTL2X7viBZ8yEq762lmpIgsRjzP8tKk8eWj/F9+xCZpGHNzwDnueK8wCf0dOUBsNhwD8xtdD6463ezA/ViRzmlrk1Pi20DfGx+hBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338489; c=relaxed/simple;
	bh=N+lMSqrne8YcHlQdG7dHU4OhnhlOtuA99v4OizC6/1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcoVVUGBAzaYNTsaLbOgkKuLMhuwZdSS2Wdd2pu3or+2Z5adjdi4nBxD59BKsDwjOXTuDuthe8DWCwUb4ik9IbBgxUNkIVfN/xjGuwd2+eIKJfYWqvdCRQEhkaskhSlI/rMu5RO9/UyucQHsW6joKxHr+WtxhnxkzpE25jtUDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khH8loOa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgkqRsPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khH8loOa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgkqRsPl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4BUa609090
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=; b=khH8loOadnvvsfi2
	FtgV12L38IpsV6WZ2PYqQj2dlzO1c0W6P/CP0y1Ahdaj2Fx3J7j0KeAY76X/o+KB
	Cedaj/LihCHcugMEusgBYGq/q94XGynNUPx8RP0mpCGHee2hubmTzC6PeOn6DgsM
	7/0dFRNkr+mCnHgBtMa49OExPFOp3imWAdQrgxfVk0Mww3Tmy8PTETnF8lHRViki
	pXIszoU05W9H/2b+jq6IWZHTiQb+iKWd6S/Zw5lR8eI9m5kQjKO0uFJWe9pfY19C
	BgrNWwlmBzF15TmZFEUP4qRU9tOP1IIqS2pbLodcHJ2gXZIybtKZvHOw6TLYPekT
	w1N8Rw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrc39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:14:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914144bb388so2171126d6.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338486; x=1790943286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=;
        b=PgkqRsPlPysKp917jN9qzEVlDfQa4Su07e+kycmWgLeg7twli/6Sa0gdKWMqD7PK1d
         deNeeiD2Tkvaiov+sRQ3OY9UcE/t4O20tGE/rHnGvfTCoFXz2Vc3OQ1tbHwX/3/Yt46p
         ZJ5Id0efKAx8JpDuoey7LugO3RQg9P3/3gBZZWtHgJJ0lTaG+xal6Dg6WRstvg5YLXiM
         7Yfy+qSDkTDV7lZ6Xv/y2koH23V27t5PxoNgfYlkwXLGBAa7THL83coOGZr1m3HKjU8m
         9GiP25fTQB1tV+xMwQtgQKdntXYdXETozeUv+kmKm6larlc4c781dPO1+gorc2TiS46S
         pCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338486; x=1790943286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzG6uuL68Zj8ROKNtvSAaqvO5/7l2+ckCdOn5Shxuuc=;
        b=W3jAUOYFIaPgiZF2DaLTCK6D+szYqy0x6GFBsM2YwzcFPqvlnv2V6sV/rqHTHpXCxr
         N4IDmCzX+inrlI9qpY6IQZI5iX+nHYOEr3BOfDBgn/0bQevILDXw1wqAWTwd0UCyL1xw
         8eBzxaAydBeJS0/ZyUNvuiYi/Utyc4HQv2tLfy0qyZL1ZzcchzIBVCNhs3/LPTuGMo+c
         qDoI19e1T0S48mYqH1wnftbcIWJXiEg1EkZlNfUkSU4ly4Dd0fcQHx6InHd8u/8vmPgC
         AKGZMJgfRIUlfIWyNFI7ImjKLUgsw43g683PMzktFtY2tLDEUnuBOtXNvPlrcVQLKpHP
         T/bA==
X-Forwarded-Encrypted: i=1; AKwUvBzj+TCKSvr1St2ggcYWLZ84jXzxCCNKgmXcKMPnPKcwRTc0Ury+xMmZVSLTVx5cg+Z2gvHwTv37GTP7@vger.kernel.org
X-Gm-Message-State: AFuF++nwa+07YcL238ylG1JTymxlQeFNW7H6l1wQstGXvFN4wVyMZh5k
	FDifEWsVFeYDUeQkibBLa89nwpnaX7WPddJOFLpw2CA47yhablrxD4AmI4WfUGNE2sGLtB2xKoL
	9HugrCDdO5hpN0bquTWryxFG5PqpBAWcBlrh9jBcWEmxOyx6enw0OntoD/N7D1oVJ
X-Gm-Gg: AYBFou29Bq8C9T8wTPx1i5qAO2An9skzJe0hbT2mtz2/DnCdAoUfu4arVdib3Bk5aYA
	94SY8ALbtNoAy+mvm9B2PlDr7PHq8buWaWQb0+8Csmuh1UcSacGMd60WNeNAN+3VZDmNtAAFY13
	OHFaZ4/O0xEbGXSwpB4JtInmSCjJ8GSwJJnz2eeteYz4gHV7GO1uRFx2bbYC8vKsQ5MYCBr7BhX
	9XX62Ubst5l4eGVVEtQ+i2tgmOem+Nw+Za/WE43H065Ho+CmJsVFldOWX7G810QvyTA0ddwYkbJ
	A4JaPKA9Ae1Pjy5EMrDnwfwN5kp2sGNApJmN95czpa40JmY69yCR+HlJWz7GUw3309vfEXlNgNG
	Tv5UT0edD614ZspYtPXtIEA==
X-Received: by 2002:a05:6214:5408:b0:912:311:12b6 with SMTP id 6a1803df08f44-9142f8bf1eemr38107926d6.3.1790338486476;
        Fri, 25 Sep 2026 05:14:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5408:b0:912:311:12b6 with SMTP id 6a1803df08f44-9142f8bf1eemr38107296d6.3.1790338485959;
        Fri, 25 Sep 2026 05:14:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm957336a12.9.2026.09.25.05.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:14:45 -0700 (PDT)
Message-ID: <ba1c6614-5dac-410d-9889-9c6720ad1e0a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:14:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _gJ1ju-bDaFRURb8bIb_oIrC4Z4ewcUg
X-Proofpoint-GUID: _gJ1ju-bDaFRURb8bIb_oIrC4Z4ewcUg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX/5DhBWKNYuGD
 VUu3DWcIR2SW6fPfbbi0ArsJsLg0wJpCn3VpC8YCAqsEkSyXIlutE3DnOGgRuzc08/rWJe1E3uR
 EFljK/6Z4F1hxL7OVl1c05ncvuIns+Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfXyMWUxnxtr8aW
 sF5qFuRpip/yrohkyE6GkskO53XxuvmvcDdEiXys2oT7BmAEA+OUD7eSh9SkzcamNpgjj5RdzYm
 KNR5sNjC+Fjqp2KRnI6U0eEmT/C22V5+frMUak9Z5gnzAu+CL9W4GQtu3ygd3d8kF0GmsudM7AP
 TMgvxW8OZd1nmYXSkXMg5oo79HIG6AYzJphjnm5lnjbl0P5S0o3xWwU6/wo9BApgL7CEAVsv78G
 OpnbairXxLLfjn69hTEIHsIpz2C4cdbyMg8nxJ7kj1vQo623i7HORN6hm6y3rdp4eXYvmRSpJSm
 VmKX7WIPS9N+1niZOuRXhnyc72JR1BqdLxWtjjsBMlwkVR3BEI9B4zUyNctQdmpAqqOgoib5Yg4
 AiU1XUiln6f0mJKqwEwgSS/dAlgMXAvxbZDMWoW+K6UUKa1cw7l0/kvdeZ6J67U9qmIUbXsSU8E
 V3dKuDeevkIrWWypUCw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab665b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zdnQAcmOsowbSLqG7IQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250048

On 9/22/26 11:17 AM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
