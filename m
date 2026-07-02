Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E243C769B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989814; cv=none; b=tEsfYmYMMiG1GiP4kCJezmodkzDcRPxJ2LwDN2zALMht28Ii3t22WbLDINxXBSipqMstTUhuVNFmxkcNcZOZif5fLOGO9xeKqdCGKEc/UJk+PGcFhPG/Z5/35/+MATGzPIxDgTGNzXOt847W7kLnX/aIPk8/FvdBdg6RWEOX0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989814; c=relaxed/simple;
	bh=3AY8KOyUUyqG7bvvPct26mdyF2ZJXyCQ44f2DHyTO0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jejniv7NMKkVQH2fqU9wlW2eVqFIxQLTX/JG/J8FvC0QQmWsMj4YqlbCYRQY7IEOZN5LrX94YSw/E17abRdWl+0fVhVy9hF54g3R6B2hz5lkbt5ReuoWMxkRl3wVkPNzLBypfUqoGc+amMbKs3pwYfizwUUcSFc0ZN8M6s0HWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avGLBL/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCaiVTN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avGLBL/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCaiVTN+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628n3gf3046377
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=; b=avGLBL/13aCEgnD/
	yX9H0oixMcRik2vEesKt6ceIaas1P3zCDg65zzZqjWNm5u4HILtuaCl/WedbQoLk
	LM9HtQXV8Vu5G2X+cePmKUIjqIaGcWtkEJCASIwjbkKyFGDgPmyPjrjp06ygFSVb
	paepII5OgZcj7/RPGk5GiQxTmz3SLOY3b+Ic9CgO+Hou7iuSU7IcbOoRgTUtN8Vh
	6l6L4Wq34FtxaITwB9YNTX8AromL80uC1X5DVxZn+7ygULCN8GIx6ZZhbXtwhkbE
	nc/xltO9bwud8onLjH2eofHKuyVUOetaZoIkKlbnFbjZduykN2lY3VzQGgl32lbY
	obzquQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3b4th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:56:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so4078361cf.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989812; x=1783594612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=;
        b=bCaiVTN+C83d3n2/R7ftMv+OBjskS9BYhRKQbWNAMAePXJs51quCQ7kthqwb9Ie+Zx
         n6Qu/lqppvbJQdN3fm6xuiULuNi3M2kFLuR0yTTdRaxBPN0RtcZFzzwZCgM/NVfn8pk2
         e9LCMLl4FjT9DhGkEocxXNW2l0/0xy8BCJU7IdEKbt96Zrr+30Or2l0pJDv6vg+fCIne
         EKEFgzkDkhvbXa+dYE1apbaxpg2CslTJgeDQQq/VzuQmNMAPa9QLK3Qo51xlHnZ5xJy7
         La8EQ8voaCT52X+GjX7gTDOEO2OrX/q2B7PNj8iP2+0AxjdlCekLPooyEckWTQA4BqiA
         fnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989812; x=1783594612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=;
        b=FQxWo2aBl1bl90/qstJ2PwOh/TtUbxfUrrOzMOq91XPlPxB1jpaOKyIDOZ0cc2jRZE
         qBtjH84Prq8NaogF33+LvSnuG+X2pO7XvqQOD+wLQ116eIb8w8eP+marqGX1qU4d8Zhi
         gRL1kc4dHxCpn8ITHRNejI9oPTpXSatpb9H1Xrbt6dOUIZR1jmHyPRerFfX1mGyanYnv
         mgYMNKXoYkQRTPl68mWEI5IaaRliizlnNsZHm22SWldj+oUXouc0/JeYuyLi71WhkbGw
         X0S/2JdHrnVLjnU09P7XvRSwkwC03+c1i7UlxiMi2aJnqxpT/OFJ1xjXuDyX8fg3pfck
         nYIw==
X-Forwarded-Encrypted: i=1; AFNElJ8NQbIaRl3KUO6pIqVaRnFsR/Pb5qY1aNpMLfPCKCOUcQC95DHSSGtA5UIGb2Tm2qw1T6w580leW6lZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHd34rUboc1tiAQK5bmoFbEp7/C15knWrB1D0Wwmf1CeOhLjs
	fCwGZUbhBaBX3DFwT/MB9482p3AVgrKI+OGQWWZXPPoZbrKDqDBdnTCDFab6SGceO4yJWSFmguB
	3BlDQOx7TCUw1iZTNXEcEeYL+/3P2UWnTJ9ISKLFZ6vXjz8wTnzlHhcMfxwG6wKV8
X-Gm-Gg: AfdE7clSCd3QNMw2IR0eIN/2Rt3ajbBRMNi8r0pXKq1Td6IMVxpS38I4zreu0ORR/kH
	kD2jen9OxhwyYaq/AbIQHLoT9wEWVpNvrc0g3cTyADa9AO41FmeYee4I7Z0RBfi57mEcyAjzcH1
	69p2GQRgFz+znXF1KMWMmGrq74wJLAvTJpweqmsFnYqCz2u5JOntWmZasmieu3155S+DTQsKsKW
	TLhOGM5O8qzeDTxxx4ktieBaZuHxxwizTKevQpBUDVRGCLP+3SE+nRubNjVKaonU9z347CDg55U
	N5aHyQkVWklL7JEkOVa+6/jMiepN5P1sy7R0xgXhHTfLK10vEgtre3rtODpu7SobpWAO0aS8ZAM
	w+dXOq2cJg6LGgjOecQw3T5zpr+V6K2dqSHo=
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr45694151cf.1.1782989811851;
        Thu, 02 Jul 2026 03:56:51 -0700 (PDT)
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr45694001cf.1.1782989811437;
        Thu, 02 Jul 2026 03:56:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm110052666b.42.2026.07.02.03.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:56:50 -0700 (PDT)
Message-ID: <be113bb4-3248-44a5-8fe6-5942ec60f75e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:56:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] arm64: dts: qcom: shikra: Add SMP2P nodes
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Vishnu Santhosh
 <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX1kOMc7kLGb+d
 HUfmu56QZ9Ee3CgCjz/IHd/nLwj2c8kRDc22L+f+yjMAbfYHJPBTA8u7Lmymn/PGL9doiZL7xkf
 OsbPgdXfhhojD1OZKmSTFtNCFPKDHrPpz4Elbjglg5tuQIsr/P/HodO5T/HYTQZK6cEMmvLEDBJ
 jTR7Wyg9SEdLxy4bPD3+mTJWLZAbOL9GMTXJLbmSD3CuPqSWyDq1ItPgsbeNJ5ONDui6USmNJPM
 WdPk+YG79evms3bO4b4KK2cm92wdO9nnauUbMTPrHB0sYoQvgKTT//vXBjoKLd3q/9iwrymx4IV
 CcC0t7m1pQ9vvQhXlTQvFAJ+KQRi7C3B7urdJDAcgAw/euFHEx7eR9Z1Zken2E0cFPmfesk+9Gu
 AAGQZM/TkPUE81+mrtgXPBKYaDRc446eSxHK16UXeZYmpzdgHdJSUFCL4OJ6Gy8UcRP+k0edGrK
 IB2oG/mARpw/5kTu+Pg==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a4643f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YUvwHg7a0UAiIoF5iVoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX9Wh/FX/gurp8
 SycDHAqqfpoRhXAx7C2W1TqOVXA7iGYkIi5iuFzRJWTZR7wlO4h3de/kQidPD4xvU+ozlD9xaGE
 1h7n0lN2vvYTuWj4lnRDPWqGuKhonRk=
X-Proofpoint-ORIG-GUID: Oz9wzBW8kvJugtpnsekHg6wQUrU2Mx4d
X-Proofpoint-GUID: Oz9wzBW8kvJugtpnsekHg6wQUrU2Mx4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113

On 7/2/26 11:50 AM, Komal Bajaj wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
> inter-processor signalling for remoteproc state management.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
