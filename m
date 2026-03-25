Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E53AC0E5
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437688; cv=none; b=Ik3JRhI99MJfHW7Zx8kd+Gllc/aW21/AZVg/VnVt1soZDnuG6O/rwBavqllafxqtD3gt1rsMkFwlcO5xtjnBeQG8mt7UyLc0IJkWNLq+h2/L2EEcEzJH7ekasqVAlJHzpdPgVdiMRhhC7aKVO7B1qEOMSLPzN+nn4t8vqzu/nhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437688; c=relaxed/simple;
	bh=c+t+m1Sc5lK0mt9HPEBgVe2zxed20vbySZT7RvQJspY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um3Usn9e5UNgQbpSeSB739vV7gf1PQkKMRIAnAcO81+FMst6q2A0VIjgDV2AWeAZtzeMu5csMBwLkYrXO0dVphfnhf/lm6gLZEa8ke9a1NeDzYeGcx35dsf4+T4ZP0pBtlyyfgm4Y2ydjFOtwpMcVNwnDHGw1nNNHq4d+PiN2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdpbJLQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzXHP4SX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdpbJLQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzXHP4SX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGZEB876269
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=; b=BdpbJLQT20mtGYWs
	bKOF4GG8EultDAccXuhIU5O6AVzNCXyYI6SdU8Dy/y//J66+sP7wZ09mMzahKgPI
	m8Lh3Im46u4klRzIudeTElN1LFUBN9VZe5k1Ogk1L3308YNkjnGPYi9CrB06CflI
	5KnGr7KuxEDhGL/ae+CkpQ1zE7yOUhcvS+/em60ua2zOnjnWtlq3Bguj1CxSBcJX
	oLEktw+uN4SgSRyAOoIkk4Zu9xD8i5gmbmgkaO4YDYqNcA04udR30Qcn2v58SMos
	PRfE5pEzL7cA3BqunC6vjfzvDNRD9GZpWGI2AS1WevscIgNyI2nSD9XGOjfLh/WS
	ZxWh8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4jxmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:21:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cbcb48003so8065946d6.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437685; x=1775042485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=;
        b=dzXHP4SXpFw1Kll7+8E1VAIIHIHS6I61LtmtRT1w3n1vfXdXw4MrK3HdOGqPmlN00r
         VPn9Q5bGFnaOgSScnEmbrcsPhjXnNeFL59JfyJgo8QDRl1KlWiytlAVJ2gr7XU+Un+KA
         sjCOisnTND/ymUHe5B0ucFakkWYJZ7WVb3JkO7RkpFBI+26JNxqZX6SPpejZE6ZrVtv8
         YjaVGYSbfk7dj5cHRsf9kfzkw1tTdOgSUf+wHhVJ4/NftaH+/GV+HM0ZhxAYH2pKjghZ
         hlM8g9z+eULf0Iy4dYQA00TzPHKcDDSARUh+VowRTJTy8a/OQqpR5ECvkWA9DnWZuaz6
         YDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437685; x=1775042485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTdLSXt1gffIHU1hMmW9BTasufvL9YE1TkFyszLzfa4=;
        b=Lg4GndYyTVjg+6/zZRvB4ttgsTJ0uhxIF2fYp2nVKPRiT9WXwTspopSjOWYz8GTQGu
         gLiZ6Epv3wMsfq4YGTTpX4bPcyCfevoW4e4ZnvAlCQOHek7zCKyX0P2dxK+/XjEwuESR
         4P/FQWU+/0iMC6CynodeO87X+6n09yvCY+vKdw2wKl7PK5Xo1u/k40uRJH12KstjNPfr
         cCy0/fzN7EEKOjgjqA19Jv1fXAZGFQcnW33arQ+LCJyP1lV6CRAYELx+li/cFIj4GD3N
         hnFkoazRqc7qrbrgqk5RQoSRDBkrL7UCWS3UnDLzU9P9QgOQnviY8q0Ni6azfaLzxy2P
         pOVg==
X-Forwarded-Encrypted: i=1; AJvYcCURUWIUdZgaYdUWWs49qXlNKz591S/O84h97Dd6Ym7ZiUqu+1Rgn0eb8OdCSIfO4jGrc98tPCLoXqZw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrg+OcZQenLXz/IELdQHR6LQocZEvwoW2F7DJlfjCUiaKFFPXr
	bpBl3CksaBf9nrUsRvhCLdcWj/ZF2FNneBuPvXZA5DG7WZlEB09Uv3UYhyp8MMeKzQbXd1JE/hQ
	wecxeMNQcbDAUH6+hYf+MWZcaLRBSg7re1phtifq+1e7KzDBLv494kEawv0ssj/NX
X-Gm-Gg: ATEYQzzOwX9+OpcqeDHRwrK+Z7dXMbK2QStjscCwIoFHhWFCszUiHd/COhSsZlW5GTi
	9wV1q0KKB68MXLJrxBzXruYjyr14Q3gwQROPYgDk4Dsj8En/lXl9eMTJZLjViUKcrHkysZSKwkV
	FPo2UpzDWoNLA+cDEa4GCK7HHO+tOKFKwbJfYcVQkTDfuD0Yyc6N6oxAGZjocGw+bdL5idhLmiK
	ovpWEV+6h6kmg8XACey8QrJ+eqgBdFSTEca/qyhOT80olRLlCjGeUh/OP24CfOy5EAALkRyFICP
	F2f5dybsxIQ0PrhZgdJ2B3EqTbbd0YBcKFosRIToso2AtGTu8diS7a65eaN/L78hBh4vB0GvS05
	ufRP6cqXPUB0oXd1ucgCYOTc9cu/vo12zx/oMWJpDhq3gOyM/7KqdIOxqAYiLlKBZ0JpszuufCb
	LhXQg=
X-Received: by 2002:a05:622a:4898:b0:50b:2bc1:2c5c with SMTP id d75a77b69052e-50b80cb7bf5mr31274111cf.2.1774437685331;
        Wed, 25 Mar 2026 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4898:b0:50b:2bc1:2c5c with SMTP id d75a77b69052e-50b80cb7bf5mr31273691cf.2.1774437684776;
        Wed, 25 Mar 2026 04:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b996169cbccsm169471166b.60.2026.03.25.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:21:23 -0700 (PDT)
Message-ID: <4a681725-c8fc-445e-9772-6b67ab948172@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:21:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 4/5] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325035338.1393287-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MCBTYWx0ZWRfX3+8qAjcCLiTM
 Lai+KsAjzxKL1PlRIBQijnvcGUJPVgKKGgT4YCW1zGzPRRaMN8e1ghcM1v2S2UA1hhcgXOF6Pfe
 SATvGlNN2iMrzvirsgA8E5tR33is2c/eKJjA2H49NCFZXoywhntAKPnp5GO+T+jOhViUhFtrq3G
 cHSyAt8RGwzR99If1Z6o9VcU7POowh2LOwGEqlXKXq6ccFCRBjP9z0Sc7CnWa5yfQCVvugX05Lp
 Vw5FT5Oj+9VM3FwZut8qee/ho96XptI2y7DbfMg0C3qIHh4M5MA2kmtBoTl5mIyF7gnVhhdTTb7
 cSUtUbpufxZ3pK31KelkWCdTJXjIBclku5MoybspwB8GDVQSVGuzwBzy1sIAnvaopWsNeTnWe3a
 pn1RBiucwSF6UCDvvPJKAOvN7M22HBW/qwZzFYB63uZatJfakBXFx3ww25OeIMGjLWenHKhLTlD
 eKHHIjEjttLkL7YyVmw==
X-Proofpoint-ORIG-GUID: HMaS8oxpn5aOhQEwjgxXXSURO9f84w8b
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3c535 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6EmWahZ5WOOBv7564f0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: HMaS8oxpn5aOhQEwjgxXXSURO9f84w8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250080

On 3/25/26 4:53 AM, Sibi Sankar wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
> for proper sound support.
> 
> Also add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
