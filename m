Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B173A0B3B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463743; cv=none; b=lGHmpqeLpCqoi7ef2B9DSWoHZnUIdUXxZzdZwmqpedR2mEfXBesgomu/J7aM4r2WAGETNKLOmuZZwbONfXrFHck+xOigq31akTCuf/mqBVLzyIBVanaxiS0fya8hVeX+8z0cIXLpro2dj3vx02o78mZ/OV2NrQa5Ux+2qeB1ySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463743; c=relaxed/simple;
	bh=ZQjUpbvPNMZwfic8zaI4fhkcmsRJfcKo65tVhd5bCBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pzsu2Gjgklv/KWbBPVtVSX6VjaCrBVa278PHyjzneeoXhuZywoFPCaiRru80Qiw33qL8VFcbqRA14ZWlSorugu2zh0D2UkD+Y+v7H7oEyDp8YRdaHyiza6zxBW585QkO+mU3oc2J2PbjLGwwV0DmmfEr1xd5GRC1/W8x1TOnf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zr3QNWEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjWR50Qa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr3QNWEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjWR50Qa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZS8X2250636
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=; b=Zr3QNWEv+0LPVA8J
	0NC2+9zU4cWHw7EGdcDRJYnttjGmB/SyQO3QhRU/pdV8lo6b6nR7v8AwzQdOOcZ7
	QvnpHLkmoYkQ+lj40Q53RrT+OIPvHLTirKRV5d3n6Yw5juIGcfa0OTMassLTQ6Bk
	Q0kMd8uS27U8z0duz9vqvKQ+UmzIC6odLt+dFSxjujWffZhhkgMhZI0tCjrxHtvn
	8d7LZar/sQfYrFJgORQAG7iQGwnS2iR2++mur/9IA0W7H70j2y7NXwjV0I4dktUf
	m/OLvdY/8V7tcJqbXwCsN5bc4EGkh3X/p3hWaNxykD01ulHVxIB2gEiJPG9BuVHA
	e2h5TQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye710fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:15:40 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a49f09233dso2652228b6e.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463740; x=1790068540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=;
        b=OjWR50QaoVKBtU8k6MKsX6EbqCngP5WocCDsGYZAQp686qweEVTMPZIxXo6EhGtPKs
         o2j82MpuQxjPrP4fkf8/hh+TG6FNxcAIblvkhXjJK1DopSXEEro+kBGPiEGKhZorCW4S
         Aw/GEcOdvVybSRjRAgKHGBcE0j6+mopay7OLBZR0SR83okYbZBQEHGnTpFbVeiI3WuO/
         L4B9DDtsjB3ETOdMXViIUhkMrh+nk8KJbQDg28JAIGKgtiQCrg73Z1hHK/b6UzhyzHie
         oz94N+ALyAgpFdwvhrmtzoaSmyA7+3Ih/xPNPuqr7czBbegHnMeOKGI/0TyDXlzPziUA
         JxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463740; x=1790068540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=;
        b=Ma6ChFQJLDxqFfQRXb5VIi8ks6L7Zg79mkyHoe8Cds5AkrRgPKkDYQR4rTEYgXWcS4
         erK4JnIp8DWJniNMeRyqfI3JxswquioljWOgUT49qgnt4GkAXO2+lO/Laouv+xqvhRi9
         9B/TkljOJRDDT0VHU36CZH1Cbf+MM9cmBVJyIz/lR9xmvEG8jd8LxDKle3yaV2oCBRce
         P3dVvWZWuODIgKQzKp5QMlZKSgh1EZel6MfgPTS5kAhtoPxhElq3qetw3H8wLWWkCDSZ
         RkI3qlHrvMP4HfcnEHYcQbSAVNwsF4mBHN+tv8BUnInaeNY3f8k5x0elcdRLJLTs0bsc
         gpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxddigOQuzQ5GaJsfu9nvPvPKDL5BgQzevcI9ceLXM15y6vbYhK2CKejqOp1bod/vKwWtsBYFeudw1w@vger.kernel.org
X-Gm-Message-State: AFuF++lS60sa6AduZTwqcgTmH8RwuJaDW6xklunL0N/XNuC3LA2oaBoI
	Y9zuTrjoJab9sJxjvtc+4fLDz3Tari+WQUgx3NP0EG8Ltx/FDhe7rOKd4MK6xXpJG6HmPtTxlwe
	IjhU9ZeHuE81lh9JshZaOvp+cTW4nsMFYe7UvyRy16HO3eRLLLz9fFTIjVr+HPlLF
X-Gm-Gg: AYBFou2sYspR+P3QJCO+9fgF1M5Etlju25m9DfuzrQ81z8GFOR0v2IVyJ132Z5Clomd
	1pP9EdRMz7+IwQHz4wKosLSopbry3gkV8E7gYmlZOXoAteodAayeIQJ9oEuBZNG3QY6O0oL9kit
	qHQju6yZKh8aBY/ea2BHolX07QTYWwndwxNH7aAxpFOpUath5kTUhR4iCRDuvQW9xkmTUewGLdB
	4E5El49Te1orEn8fbw/AbVNAg1hRzBCqHx7r7w58iTNN9jOLWKq2r2yUaG59Y3BqoPqiP+lJgXD
	pbu+4BmiyFfkEjX/G07+UzqxY1aFDLsXuZUGLeQmmtbAqHPx1TYm8V9khv6U3WYVTIoUIRFJ38V
	bcDHzfAsSM8NsiGzrkppA06+cWEZwZw==
X-Received: by 2002:a05:6808:4fc6:b0:4c3:b3e:4e72 with SMTP id 5614622812f47-4c7b37d8de2mr4884096b6e.12.1789463735147;
        Tue, 15 Sep 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:6808:4fc6:b0:4c3:b3e:4e72 with SMTP id 5614622812f47-4c7b37d8de2mr4884074b6e.12.1789463734770;
        Tue, 15 Sep 2026 02:15:34 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.194.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c85a621db0sm3015261b6e.6.2026.09.15.02.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:15:34 -0700 (PDT)
Message-ID: <b86bd3a4-ed4a-4c7a-8cfd-d3e07e5808a3@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:45:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/52] dt-bindings: clock: qcom: qdu1000-gcc: Add CX
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfXzuwYj9RgOKgM
 OW0+l/kFkJRsJywRhepiz6/911N8CZzIQFQHrPAPmd4SiJLVlCU+H+4LR6h0xvbzVDy3XdKKu+i
 d6uXqw8sT+vtdVipOHThLrfztv2JichnB0DNlG446unPfC9Klge5oWnXsf+LTDDU5DlD/SJx7uk
 QUJF9+pZuI0XqBdKFKtCExs00MyW0ZWpAtIhwOL/oW8UYFC0eXEzf3ca0i3soy6zroLgK79lnvO
 ZwNd6ESjH7ESiyzrEZremnUHEbof7XoMA6yuoFGML7Si/H/EMn4OYcY3WakdtgExa/QHIkb9rPR
 I6TAqmS4gkKuV5s2vRUNu78zQXpPw+nBR9kgvOSqjHmQ+iuwkVFRckkgA7sFF5MrDGuRABVq80P
 MiQ2gXSd5whBxoa/Lu7Y/NV1vVczUDFwJamumiofwaSCmdwZityGCBTOXF2KWQVYpZcbcVem46e
 752MWfAAacuocD5gqUw==
X-Proofpoint-GUID: jevbd_q57evFGp2Qly_N9sZsNOv0uO4Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfX8M3CWDZNJKaN
 HX0i5DnG0Yy5jWMgJIuWdCCxLRbug39598YclIWvPdMCOtxyHycwl7YyXv1bQtbqRs47Hgys4Qj
 E+NgzsG3WXpzEZFkV5uK+sxmfP5e43Q=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa90cbc cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZurMxzgV9Xw1nvs9fmaK6w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3nyXIwnAc1TS01hV9xEA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: jevbd_q57evFGp2Qly_N9sZsNOv0uO4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150132



On 9/14/2026 6:17 PM, Abel Vesa wrote:
> The GDSCs provided by the QDU1000 GCC are supplied by the RPMh CX
> power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
> may undervolt it.


This is a always powered device and the minimum Operating level for this
target is NOMINAL and does not scale any further down. This target does
not follow our regular PMIC for the CX rail. It is better to drop this
target.

-- 
Thanks,
Taniya Das

