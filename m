Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA3C365A1D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889004; cv=none; b=iDIBJfXCZcDlVBsu573jvYQ8DxGgq76I6N2k5g6oh0cUOvQohzcQwcnYdXCos91KKvCAP4QVDgm3gGUZP3DPzAUaMhoRog/Av6fb8JaX+hk/pJA4hzDGEbxdPPj92bzQ6oPyMIzD9RbRTV1EkRR1dWLtz0UKtS10KmVs711ahH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889004; c=relaxed/simple;
	bh=27a4ZBAh2T3+ZHmlpGLT6Yc8QyhrRE74iT7Nbf3wzro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ukssl3KHhPZm82FGa1nwv1B2tMOQgFW2yv1G5/10tTWZ+WbXwJy5Hiouxu8Gqg/t9uGghg75mQ7NXUYHAtXoyoZQcidnkdvSpl3m5k+BZKVbMyO5ZeRun03uh0PZZyyTtTP5aCtD8Bldy7aejDQH0XKcTyuyVyeG0bx8VKW8WwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blFGahv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNueDgTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blFGahv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNueDgTT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fMU9327100
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=; b=blFGahv92s0HUYjT
	Ihj7OOX/CnOH7LuU5MlrBldveiHSlAs8JLotz5yKAVYzJHzUZNj7s+B7yxCABZQr
	MIeuOap/tRS5v53jzGhONjBC3KV+HTbV+7D6vRW/eLiAunSL1Um+B/R9wppgekbr
	MEUqeXNAyibnAYw91s8LSCwst+PaDxQLLi/30M6EKIHKDEoyTMDNR1eh+c3v0CxB
	wFIh6v4C/U9MaZmtQffoPeagpZF0l4N3OH3roV/REe8FlXEloX5t8SMrJggV/FkQ
	3AgBiYK4NzS36r3ZDhDDQ7ItYyL7R5m9fW/5iHrSm0iYokJjo0HQnTlVPGvxZXrJ
	gYLCuw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8d4db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:03:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so4491970a12.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889001; x=1778493801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=UNueDgTTtbj4AH2YkZwodrcNhNTVZ4zMXMEJF+rXOP6EwqmQBuQpkok8oO8Ri6AL2H
         pUAhDeaBwcPdur9LtT+l5BIaeM+1Brdq6tUNOjMnZto3WZS4R8QHnbi50i5orSuLdsL8
         vFb0Bv44VjE63//J/5724sJcZKMY7R2LA4bZApNlsyObkq1ChhFFjIqpH8nDfjk4TS7/
         8dnq21r9aAev0d0ahI4YYkNEm/GCIJRQl35ixPGrHx9Tqc/MmaUOQgnR5/5xk5lK4RAJ
         t8gAClJVCgZ+GalIwtQaLbDpIbceplcIjfGYfQ4jdrjPWaxgCDCWjjcLQCRJ1vDA3qaA
         W4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889001; x=1778493801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=i4eGjgpXflDVaXRHVxJUl7+8vpynuk0ygAvuCX383EI5CWRFTIE51nYfnM1jzAVkno
         75HDNW6t7rSeaVC2gxFJ33T93HNzfacGop89z58zo8d9PQ8RT38I/F8WMMTL2bhmpTeX
         yEXjMRo1YR+/eZxn9YHybEEaAeITZxjORAzBb3yDQt/J9B7et9fyJuA3Vz0i2Jw7FXLo
         v8AHJLQelacSDaFeG5AvtP8FNXOl6/RsYO1M60bNfmVnCgTLUl9eJ8H/GxCtoFyyNz5o
         bHNbnE/dODaaviLdBmJv1C5VyAWL3gWQ8+4eZNK+hUvpoPYNzpPrRo+C91scYLj8UJcK
         jSsw==
X-Forwarded-Encrypted: i=1; AFNElJ802BLk1eFmxpzehMdyEDNuer152O3+o9OH0aoQKR1dw9NQ6mQcRxhJf33HG05cXrHuWK13DpRKNnm4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVU6x9c1DCeI1/nZ/MTik45fpxRy56nEhPe9zLcecQiDp2kkVa
	BixdjGBm/vaPH9CBrm74fms2/NQjaMPIA4MkCeKXNWYVi5vkz65hp7aU1Qcw2KBukyc+xpfQfXp
	VCtM9Mz0+vdH+aMg4oOSse+qP8r4muU4AjCeY14d7L8b0xiwA++JmFTY4DSk0gOP2
X-Gm-Gg: AeBDiesh083dy0vCO/b16IZbEytQV6J/RdeiV2oNYpTKKOFQQjyg8897nk3jEeewVJi
	a6iLEP9L9rtotOPDn0fQZdHxDdMC2dvQfkJdICL/PQ9NtQvil04qIMFD4AsjnFehxN/q64LF14Z
	OGvTQhJZgKzs5UtNs5CFQLuRdh2EmlJXnxzgo3ccbJ3HnkpWyVfCUscf6zYMKagS7OiS/NBHSvN
	hT0xhw5wD1MESqHOOdPSJ0ZPGoR8smhmroRq2PDDv3H+/mNhERbphB/gWNjfm49drA5DUorvsdu
	/LgL7g9muQcrvBNFnD+YHOTTDNsyf9podYHS3Afy8yL3S2SVUnFTivKjLB3pJtbZLIbiY8Ls74f
	tNdVYY2tooAha+qiD2Ui1wk0KU0BUzVD4LSB8LHCBNWOeHhQZSqO6MU1EE7sTBA==
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9309013637.22.1777889000777;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308931637.22.1777889000200;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba8fefsm8933909a12.7.2026.05.04.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:03:19 -0700 (PDT)
Message-ID: <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:33:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x-hh09H59qOHJTQabqSDmMKKBHsAyJRJ
X-Proofpoint-ORIG-GUID: x-hh09H59qOHJTQabqSDmMKKBHsAyJRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX4wKUZiojKAlN
 6FItPKIknbzvcltUdHocmeJzK7pasiUvITWrHD+Lbdl2Izi7nZm/qA6otwX8tuCHDIX+c+3p+3y
 NNZYtwriGR4x6lvMl5il6ZL5zQG6HebEJ9e2zKtz8IQXxIYMg1VRw0kp7O3FjszLgq9cTTqlnzg
 CtdWxlBGzqqBctrjSW3iVL55gn/qbli30fUUbY7HZZMmzyiQMkDkdSjQwlHUmVk5c5wS5vxYkbc
 xfhJFaolr0HbUJuG2hTA2TBgMv8xud5pCFhFus024/vXQQRFEwQrfNcQPotpc6LsgE8aMT0gffp
 YjZAGLIY+sZ3q5wG9Vevgw4rE8S8TgXv79DRoPBFRqGwd0pf2pis+XJzscLJsRv1n2+xPtWmJt9
 2tzfDxbP8K8XXdovjUVJge9f0/QVgaloGlbrBW+TDUuQmA+AQ0wdHttxLT8f0s5Gu7zBFNdgnAS
 gVJEYDfwdmlF+bzOevg==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f86ee9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=6olnGIjaqZ5DSDVW89IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040105

Hi Sumit,

On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig        |  10 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c

[...]

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c

> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> +				  phys_addr_t addr, phys_addr_t size)
> +{

[...]

> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +			pas_id, ret, inv_arg.ret);
> +		return ret ?: -EINVAL;

Following the example from qcom_scm_pas_mem_setup() here:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778

I think it should be:
return ret ?: inv_arg.ret;

This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
I can see that is tries to print this error:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286

With that,
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
