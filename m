Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E7367B83
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996306; cv=none; b=p9lBEupj3baS7Slhz1THVFLcX4j7p4dzICAN4LZ0hPole4WLIn0O2E8tnRvM8wVp4HGQzHGSY4xzvVIJQchSISB9EOd1RFL6cloh/KKC9F7TSZnXyiFUTvk7Snk4/+ajh/XJrHK+AUi0+ynFmmFB9CHpzcEl8/NvVXz+qsV4TSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996306; c=relaxed/simple;
	bh=AoCAD31poy4BC6qXAWM9wHK8TyC7bImeMVDOmvVoNFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6IxPrHBCbFw8rN1eBIlWYqJr7rcLsWVcH+53S0692VUp+VGIS2r+QRdGJPH4+Tgkvoo/rW2hvRXWq0etEcV7AjK+0LLnnDzjtbl8ro+ZLY8Ga4uCFhQtzx2xUVYthWDoYZ8rnA0z3PGB27JzkHPjufk7hU7klzgmEWccdzJr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmqQDfFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULM12meB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmqQDfFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULM12meB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rIgT1585628
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=; b=HmqQDfFWVPlCYm3y
	r10fBkJEBYoSFulTGHZAgYXV1/LOG63nnbizryt3uFD+zS0jZilbb/lyrgGDqcea
	hmY7HfJsrxNfschAUYfVKmSX7uMCced7stHDchz3m/y2E5XD8nxdnv2PCHrpHa2D
	mTkhHUh10QxjSrzUwfF/4ES41Hx4Dxk4M4soySzSIcNdVAZRzJFuZOKQA13MgAZd
	LNm9obq5w82ZN50q43mJdzDy3vkcNreUT+U6MmwrZqKIqf01XRkV+wWT8GVZSZ9+
	tPs7yh3HMLsZ2wwXZvcYd+6e1VzuM1re0dUDyWVK/Q+53SkjAIusnmadrhbjvu2l
	Msj7Ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggc61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:11:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768e1d798so13507971cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996304; x=1781601104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=;
        b=ULM12meBS6RIk6ibmJTboW+KDszzCpLNyVbuXmPBRMXJuuHFUuM8NeEFDw71sNk4dJ
         1/FdDmxpzPWhcC+FPE08gg1fbZ+otIXaXadkgfGRCFzzXbEx9YXPDjJTd79E+xAVnmMP
         hm1TxLjqzANswJfyAZ4rhd8L/gRlzN0+5nj1tb+IfDtOt18/8dtmBUCM7UqnNcQQ9zhu
         BEsWTbxYQeG/UWmu15SWhrBNk8ONnUybJgJ/6sFIbUc9hcKlO+HReUv8VykTlUTtlYzC
         jAwup+D+vW/1um29sfSy+36rPoE5kMfITBs7BLKWlcEfHmEPj1dg8ZhA1oKdZhn8Mt5d
         oObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996304; x=1781601104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDywIep7m762xcW3R+EkXngn6ekhxLJNM54MxttIni4=;
        b=pjbpYQqg2aHEij1BET2oHFcPcUBrRutet//416fL99ti0/6j9hyZnYjJrPNz3xinXf
         NBOdspQ+hgmzCQtr6C1nrQq8lIWgUYaHZ2Qe6nYmZuH0p313SU9HocFOHQ+veNdb6ppE
         uu6f6tXDK0Bh1vKNFP+XEOHan13KD0mXwFkiEvpr8KyxUNCZvBf68oc2RcFHZpyWbkuB
         juBKH2uJQ5o0pSJoWvEMFOst39bn5L79hWvOv0Ka1Tg4W+5AdUc0i/oKO77LlaKjPnwh
         CjOlPoNl3ry7plmSNOs5kPJOtkmz+J1idkA3U6VXFsnQnEtI75hr6rkTq5WjRfJ71zcA
         IEIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qGgAoEKvyI6RhoDBhDKGQE7Ixs87NVaU/ckcAwy5IPNQg5VFGMjourkvxfqsHT6mlJuP0MpsA7hXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+zP/nTUlT4yLVQX6MJxFMRM0G+oD15r2oJ/iK5e5iB9atyhO
	rQE0sXOZlcN2ssV7QvDij7fNGt1hz1bQuCsxu9hEjiRMkRG2BnYMx4ZjUzDh37iWpjfiKLcFHlI
	UNvSQ6bU/tWIkqBhEbgrGdhVZUvn6/vQK47g+BodCeUqDkn9Vg2w8rk61ajo8Ea57
X-Gm-Gg: Acq92OF8ZMJc/WOK7iZuHkJ14LOU5nWWcrMTjCy9gFjFe8vVTQTpFrrrBM6HpaqD4TR
	E+/FvVQbGivx+6XRFxQP5NVlxhaXDWCGx2Uj5Dt7Bdxhd2msWnsw80p4U7tthxjk/I/bH/eJRqE
	sI3/mbdSexCngJGSTHYyfI32Gtqeu2UuiXYaWTBLecgpMWiY36/uUUuIeaTwRgAJuP5GCm4klRh
	jny/ae56g3e5UG4yskx84KeLgwsSsSdYcEMUXo7rvFn3+63hSJ3zWl4DYWJycMs8cfN5/rI3jKl
	gBz/BIurKni6ZXNmZZVDE9UX64TWijasdUs/G4Xt0aiPgzmfxRTtSzk+BlyOqrFjQCVO/hmlj1U
	ZNjvgVaB4G8qCLlY3w6u6xbRtTd91HlecOaHu0vhpMoNIrp914XTn5myq
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr181329621cf.6.1780996304033;
        Tue, 09 Jun 2026 02:11:44 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr181329261cf.6.1780996303608;
        Tue, 09 Jun 2026 02:11:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c8de00sm1016404566b.20.2026.06.09.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:11:42 -0700 (PDT)
Message-ID: <0387ad24-4b34-4e1a-b6f9-44158417f308@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:11:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX6FKIm8yhfeZf
 Z+C+t3btu1sWxASOUCZqJtIjb6KeSJOpf4ryeSCU0xBzpVRIUOX3cLt+YgcU+imS9N9rDQRz30G
 JhDorvL+LcH2IkefTFNfxLZ6xpgE90uyvIBzCydkZKq3M3jnpoItZ7Q/Pf4RGKpJ1ljoOI68mUO
 +cYLNBmLnOlI2RPReFlb/uN9pgbrRgPsA1h20jzUBQ/BhgF+uhITDx5jrM6BJVr7ouhAaKuHoe/
 LWAFVPQ3lhbfE2DD+NEjEaUTZmZ8f6oLtjvJ/gD4+ZNNrN5km5MwPno/KUs9jgXLJ/uKiLmKLY1
 Sune0g5doYjG/nkMzP3JgDX887mqBFvYbPw2JktaW131eW6e69YuuRHrH7qRSQjb19n2yVd1cDh
 VizsGQTvcvPs4lV9ziZS9I7m/Kjo80ndWMVa0WJs7xVWYrooQLiMs3C/l4Cd2SDycIOLvxJh7eK
 e8b9LajRCJw7Cy2nOuQ==
X-Proofpoint-ORIG-GUID: cZw0ADwSfiILHT0NU0XMf2pmT7rdbdHh
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27d8d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HZqIYIiTNIUL-lcWgUEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: cZw0ADwSfiILHT0NU0XMf2pmT7rdbdHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084

On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the existing
> LPASS codec v4.0 flow.
> 
> Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
> FS counter bypass bit during MCLK enable when the platform requests
> LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> @@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			if (rx->bypass_fs_control)
> +				regmap_update_bits(regmap,
> +						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						   0x80, 0x80);

regmap_set_bits()

Konrad
