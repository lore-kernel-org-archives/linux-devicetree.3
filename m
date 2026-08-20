Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A88415B62
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221808; cv=none; b=VEU6H4LGM7XlA1tEGWnUsb134Hc2bHKWp+5SDYZ6oxKP+3QcLA9V7Z5xx73MvVX6NPEDynSrJqrpApd/ryJ4taZ15Slmxghb7/JOmPnv0I1+/qCX1Bvn8rK6iKQRLYfqbu6K3MQmtu+E0+6v9DG3llSGfynJ2deg3j6wdqZAQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221808; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBwuwFFia8/m6sf12+fvECZMEhsWukBKbG66mfTa/WYk5/RZCgPbNkSf3FqAy0qLH57xtBC4/gcpozKlH5cF5Hlfv8Mvr+wNhUH5f43qejM2rmPtiNcpgNAfsewk/UyPl7DQSx0iPwtR14enbaZt4EARUVCaFB3mexV74P9WCAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjrgZFi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhSNAIra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjrgZFi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhSNAIra"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2u4A2933270
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=hjrgZFi4/5qLwcbs
	D6O9i8Sq2uczkmXcdgXawPVqbN0C1T/xdpH41ADHqZtuAuZnxRhdRZvbe3FUs+QF
	/bU7DGp7Cx7D/m4vHIzzteNSOp6t+T3O53nPK3ixicPioENvVGayqmU6272rsJGu
	khEOVBQXq+Ks4ciUSuz0hmvafAxJFF0rezpHeHY/lpzSQvvKj2pQtSAd65Bx02xb
	gQOyWMiUkr3wVqEQqdjFpiCjeD8PbktYq+jxP486eu0IMLxqxGyG1rhYXwPFd547
	Z4o48D1iNCCw3QVZrHqKO8lzWa+0b+aNXCs3snVaF1zC7dpUAwhXGksyyQwRcx0t
	B6hCxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g3th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso6510985a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221805; x=1787826605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=QhSNAIraNCJWSBIim4EpQbd6bervgZa2lxx0iMkoWgZigrjwbLDfbOmZsq/5gML88K
         GdJQaKqD4gLMjAA5VUTGmY00x56P7bftYKNBbtD5sisuYmIjR3ZD94sjH+KBd+4eksJL
         ZGxU96Q8PYui0JZWPoOLaVynorP/XYsQdCqwjHYFct8ssNVhVaN03Uyd/iohCMUojtpq
         oEmt2w/LoAlrIZGXqE3uQBfF45OpWJeLhPzYy1FsNFgkNGp3EIf0zNQxMSH2fzmduqpS
         FYJ14eI3QaWF2AWREaiCA/cqJxKLUwUTLAgpy6qO6+BhXoHe6SY8fuamTN+xN7FgQOJN
         xRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221805; x=1787826605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=RLnCvnxGPidQweVre22HICx51yR7aKfzZLA144NvGMSGeBjet22nhtOHs0jgNCVSIx
         5P32Nr+gZ6GnKBKbdy3Ge7GBv6eKuhXgfrjU1dJdHHlBz4dAHqQKd/uWy7fEWEaSpGKW
         RpuPq10RtBuT2mNr06qb6XRG3w72Y0J/aNjOQfv/eIC1469lzczsi1CsmK/uRSGXRTNY
         G5ph2BFXBwacDv2O7tkFQ0T8W9mzRqXKbe3KvWAkZHd2YeYsOBIWulOkFx39vituy/Di
         232Oi//QF+cXw4KYz4CmAOHLKx/HcyGKPM3QxgmhR3WBLZrIlLeVbCWz4iNoULjxq5Pr
         POMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvxvI++AeOUQFkJsVBk06bgIYK2XdBzj0sqW/oC7wusgoldxUUWJCHE/S3ZXSTwA3glQ0aiNncaJE3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHqvBLNQVFRFXSaTP3hnCcoDGyfDylQcpOaSCttsC/BIp4w6K
	bppPad9j/qYP4OXUsRBziZOyX2Xjx1GIniMaV3hCt97OpyqJTRR36t2+nHA1Q0cgsNw/eF2tgI6
	9GEztXIVvCoL6240MlbE7RzWubdhdtZG2H33fj13AvcmlfjcrziqlnTw/sk1bGruO
X-Gm-Gg: AR+sD12fJWjKRSyTgf0iQrXUh7GV/ECwO/lfqKS+a+MPZjCju6kAUqe49wTPHm3msXm
	JmJipX/Jw6UFHAjEs8ZKZg5Q43aIIV09zludoMBoz7iOxkM9eMXw+1fkrAise30eR0OV4FS7mlK
	/296jIST9gwxujTusP0wkTiioRl2A3o3Lh1VigniHUDOPMPoyJAdfjo8KO6oPXGPqBrboVcuxuy
	kPQll0+Wz4RFQ05atA1B4pdj+7RqyCEQW6FyJJUoC7a8xHLWXZEOIqLamzXgrGJa+zZFozBcuXU
	pPjeuh+E2pQF/u5oL3og7iQKCKkp7L3aeB3TdnNROvqSKLIwlexI8ndcuOHfBmaKJ7PjXtmFKp6
	+v2/zBvPrfHQKrOusKnDsZMQv
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771159085a.0.1787221805180;
        Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771155085a.0.1787221804799;
        Thu, 20 Aug 2026 03:30:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:03 -0700 (PDT)
Message-ID: <86062063-4909-47a5-9279-e1b9ca8892eb@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yB6tsu-Sl8a-6czo1W84cU_TkOH-IYD4
X-Proofpoint-ORIG-GUID: yB6tsu-Sl8a-6czo1W84cU_TkOH-IYD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX2ljsNbTVjb03
 zImLZMyRhJIySx6N5Kv1L8wI4hAU6ZNjb3GDj7RtBwygy/R/UPz+fmikt0qPOJ5PAJScjf0v+p6
 8Szf5m0Ga/ZBJPSu66CA79/UL/HeWGsVazf3qXkEcptpMwwatnB9d1uYtflJf80ntPXZV4S5bFv
 vhXqENQ3XqFNH96efdMWJmZdGD3n9hG3I/mKeMwzQFZAIN50KT+OmCE916Wt5rwecftTlilJTq+
 ezbyAoyl0qKrehfcZl4G4tOs2SUhWl9/3KHeiVvAmNvZ0bWLMbL5G2k5sSZPfcwS/qmDfG6qLan
 ypKVgrdaSZz8FIxP4GNDOOBVFDWPFwAnCtpblgLgCvYsDrA0wWoY3VyaU7bdxyxdjkXvf7Qrcms
 xmytmo9ntnGMeYZwKrpBJv8fPl+XR+iHPy33wh0MxPv03BN2KBWmV/SdW2zkEI8M4jL/56wDVoO
 FNtSS/ATVhovS+4fsyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX/drE721AofzV
 GMfYX+qXQtEKG+H5pS+nLtO9jObYgs9TyGXdzIbiaL0bUEGZCEuJHUEGnHXBO/o2VfsynMPGmcP
 Gz2QUpiX2zcoKDBIW/kgLL7HtRM+6Hs=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86d72d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
