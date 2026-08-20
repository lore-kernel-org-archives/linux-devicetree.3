Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799943BCD2A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217777; cv=none; b=Q4DopXmhHKgA3X1sQGE+MnYmkj4fnCkBiZJrhSyoJpW7DWDWgHRi/bnvVcBC+quMpBBAmVAC6tLsD6pBSdrY36inwmywzCBiMuF4d7GPecJLHh/iWC/TuHg1CBv3l4ghMrUrFrOiSUAz7A8OOVyvLeB7JmCdL7H2Ya24hh2zWiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217777; c=relaxed/simple;
	bh=XOx5Rhua9OWaqPeaVQt7XQ4y3QPc43N3uZZGlsa8DMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG0AdEZQPg07YVpdkmXizahVYTwWWIz6dj0slLdjPPi3hPwFKb0dz3EsLfro50gzCb2n0hRPUN34hKxb4IZ/pQbCafLwRDxIEnxQgCkVy01CgOclBo/q9Ed02hSsPpzh0YnajoiKRLqWp7yLCxwuLDfZeMEhGrNj69tWm/jipms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wld2p1uP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT5WTey/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wld2p1uP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT5WTey/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jdeR2529508
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=; b=Wld2p1uPiy7YRBnJ
	1GnL1uB51IJYNO6ufEkKNpOfNr4/HFPC2g9mhWCQUNTTIG0z506QAtTBw/LVvO6H
	V5VcFYRJRz49jGkRDCB4ZBwgpb0J/s86erAV8kgmapZVo4igiGdj65UozA9Ir9C+
	LAdW1SCqPBPHnh8zqngrsq2Ayh5xuK4k1hRv0J0aMh9RKyDaIFOrLYxvZnfbZNIg
	9kynygmKEzSL+r4LdzBcIzSGseC2xWNx6CeL3rCuwdFOU/JVv4IGYl755QzPZPlW
	A9OoLZQ5ryHv58ZSpwJgPFq+RbN/0hhnJCPCXbEuptPcDN5g8MMVzGEwX0Up/p3M
	EIcFrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv84cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:22:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930f80ae4f0so3218785a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787217775; x=1787822575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=;
        b=MT5WTey/Ut8SR2hqBljMYI7aWPs9mFDs5XYldsB7y8rN1sCkFrvMxLuwUGBeRZsVrL
         5u6AJ5VfGpn4uy3Ei7CUqVYi/OHllGJEIP0SI0csw2YaArsVllCovOd/cnQC3CYffw8s
         OTMsviSU5rTHZQ4hpDWfAj0CGLCEYYkXj0gUZ+RSU6l2cgEQJ5Gord0CDJjeBRyzFXja
         3zd/7g0FsJneRLyimuvT5yMcTJ1QyYt1eq3Rj4i5cK9ssrzAgQMk0qBtBSe9+mjfZVZY
         FhHHZgRoWhWrb6Gz6y4milHGjRJWHuD5sXFC6wdBy+4Txqj/OZoly7g702Ix+SscKZz4
         nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217775; x=1787822575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEg+BW0+VrS0plyWZ7tPL+T6IqZvRONSfa4SWkTUYCg=;
        b=j9+LErYKi8f31sg3TjsxOI2Hp7t/noOB9wqDx4eMllp2h+zoq8ID3WotfcuHSzIPre
         4tjIwnHuUABsJuXXYjoucZdBFNkAaK/eIhYu49wEcNwZ204D2do1Od8gCczFc463kxor
         7BRyaoLg08hBQ1DIRRpmMQK9oz6NlKE5PjzRHhRaENfJNVmQd1WMVgmPheF9w8Zx3GJs
         S41QfMe5wnaRjy6s/vEB4gY1i2m9/Jimd+69qPJ+HpxahWNzItkaPpFOsCaPFiWzhPhh
         NgLtoNhBabDpzvKDwRq7Od2KYS9Sq/ceIdKNzjXmbQr8DNK/MJgVvTZraUixauA4NRIN
         XBKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6XClQOJZgrJEa5hAXFVjDJ/YTdGWgYzMa9tHYF5898P1C0WtEEiTI9y57RvsJWQxEsY9yLIEt+bQM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7l+9+RS8wFDs1LA27uyzJGT9Hbhc/IZzuUMx7AU2Y6Hhu/qGK
	t6WmweSS5Ld8J/7ylQLeRXjV+oqI08G3CoBulxGtaeeoYf8ebQfbDt9t2ezv59jhl0cb53a+QB+
	Ut5PYzpbMZUi5i7K+rXZSo0z4yT81rr/3Cize/OpLkpLYBVvGAFz+xO/kI1DrTFPf
X-Gm-Gg: AR+sD13RENK+iYrHdGXH+Cxcx4e1LQg+xzRRRD0/F3WxLfuNKJ2eh1lJJPLRIM+nFF1
	QUEYGOWX+DTLjW30UdNWhkjtoiQDd/kNZ1bQXMr119E2kgPz66bSfheJD0X+yagKUgtDnHgI3rk
	MNlNgInGJ7PkeVDe/EVw/gaJlOiSbFp1wozZBwHLJKlDK5zq3A5GxouGbkFnfSK5/3XyNmfPb0/
	h43CMiJqTJOCfgrVc2ZNMILBvscunLuwb9BuUG9eQqK8qsMxGJzB9+G/jEIr3G8r2+U0/96gX+A
	oZX/Nk6o2rgaexX18s7OAzt8aNuVjRAKIZ6q+NCrcPdJBExQNcjqGEv/JG46Vhxoo1Zvsx81+JT
	EqFrLXVmgdvfaSV66i0FGi3Bd
X-Received: by 2002:a05:622a:313:b0:52d:9a83:419d with SMTP id d75a77b69052e-52dd4dcf2f1mr79004671cf.0.1787217774549;
        Thu, 20 Aug 2026 02:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:313:b0:52d:9a83:419d with SMTP id d75a77b69052e-52dd4dcf2f1mr79004481cf.0.1787217774210;
        Thu, 20 Aug 2026 02:22:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198966sm46036566b.41.2026.08.20.02.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:22:53 -0700 (PDT)
Message-ID: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 11:22:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86c76f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z_9H9m6cyw4YOzOhL5gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA2OCBTYWx0ZWRfX1ZfJODwyKrRa
 LAP25z9+MofZLNAiJFIGhTSng20cCA8aiIDwusDatvSesNJILAy+PwTcxhxWkhd5U4nc1Ec8NE7
 RzEZDef+YKUeuX9vLKvIIYzzaIPGIiW5hKKwOM5onaInoHvLyMqDKBE7QR2v/JiJ+DrAkh31mQ7
 /28J/kroqk+0LQZ5h1n8efuVQ0OupCaGIM9bzGY1+Pu1HxFZJpyeH2VIhaE5ZyMB9O71n5cYH9t
 PzcXFVMzT+Ra0dacWqubgY3tSZ8+7cDma5sEhaq/Vei4nzCaeKdEqvLkN1ebJoKi+91QaXlsXGH
 Ogtm1j83cnJJpu8qZlj/OBJBR36QFicwz3jnVcE66Frg2qYL/E+cGZMg35ybsltaQIR6S/FMVuP
 pt9rrdMiNq0qTxY12sfy1X6+IZlqA6wPi5Gv85sQ4Eh0U68JSuKJQ6HrHdYs9xB2oWYOUawR/7h
 qiIrVmlLqxCtJcF8Klw==
X-Proofpoint-GUID: ry4g41GYaXyEnbp1rWxRvRo3UdfyWWlq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA2OCBTYWx0ZWRfXxJ5ReVtcJbW+
 95HsDvBVw6VKQp2/OvaXrdJTs/6UPiQChslGkENrqqGWWEfaeVTXEh28cfqTv0eembFq4synaYM
 kYjTRtRSmDnXqFdowPlT6XMGgiHkcSc=
X-Proofpoint-ORIG-GUID: ry4g41GYaXyEnbp1rWxRvRo3UdfyWWlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200068

On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

This is not a valid tag to put in the commit message

Why haven't you sent the two clearly interdependent patches together?

> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
> connected over SPI5. Enable the SPI controller and add the TPM node for
> all three board variants.
> 
> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>   https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++

Turn this into a single addition to shikra-evk.dtsi

Konrad
