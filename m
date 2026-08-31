Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D6376A07
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206991; cv=none; b=W5xGxTblmZ21H9fuEEAb4civvFfNcLqlpEqGxgKdtcKthfOc9JW7ztDHeAA9WS5HhcSim0qaaiG/+iWnRxP7yLO8HB379BYylWqjIPO+JNkS6b0p6fcoj8pK2/2lhk4KuJGM8TbX/9wQq23m7QqR2ws5pTNCiJdP6YrsosEYrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206991; c=relaxed/simple;
	bh=ZEs07MMJVpyxi21v4i/1UrGlSnAcAbjy7XZCswUhd7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND9kgc59IEJCkqkOcV1MuL/3GqKjUzMZhuRC8BYsWQ9Pi8VbQiIJpX2yFzbsuGJIIt5+SUhiMTgRNKiPWWpOAPm5zXBywqp5V9AhGgItGuQYC+ZTgu5R8JttE/hUOzVzixShMoqKD2W9Cpv9eqTazukcXFpmeVLEjKX8F1xcJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6kvjYOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3le46U6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6kvjYOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3le46U6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXwJ53851253
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 20:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=; b=N6kvjYOyyl1d3Up1
	m7+t9VFKa/VBg+3Q5JSPRALVg/3LadnL6vZxVQV8bHWY6grC7dtO6z3RltnIiaEf
	0/29Vgvi2hTs5WJepVWGQ1XG7kc5Z703ImsCWKQakoX9St33vvEazVQsgnGWxGn8
	1DWShFkuOtcWUV3tqL8W/MeHIvV/n2q8/A4Sx3eHTcm2qu/8jVIZk9ce03l2RrCm
	Ad8sxxAVjhW4rnoFODvjgoTvgvIsD7/waPbJZ0CFv86MYq4FvIa9epVIZmcdJUEt
	vj4dKbTQ/Y/uImHX6Ml5uJC2RDcLJtScM6xjALxS2PbZMsakbBBYrno32SsVcfuA
	jYU63A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayk50x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 20:09:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so641765ad.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788206988; x=1788811788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=B3le46U6C+vBeU7bMWAoJGNF1pVuYknyzIVMKGIEVHw9cX5+lGK6ehslqUFsFbSVUf
         Ld8AsJQZi/ssETR5ZR3UdseAe9XIaZZ+YVRZ/CrUUKUvbH/BXQwiMpng2dRFmAB/viNP
         1uUNMNqaJWbf7we5lkuHo9unpBFrS2ygniTj2JUZJofs97Pita6mcZFRK8HMF3G7FyzB
         5dURiFUQ7xdHhfCbqvSWS3FkTrMMzd4j2m3UNV85YbuJiF/3ZGhjZnhE6y5OK+kyuADI
         FzvDMZgUGMRvGxblT7qDzBjP8qCFJqbgMzVUSSOJ8qKGHnJ2CHsPVIIkne7u4ek9Cu2L
         UXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206988; x=1788811788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InNI/EgxIDv82pDIk41rCKlCz4lWV/WsF4UMF6/lt+Y=;
        b=oB1BiioYUCaBYBWaTBe3T8rw/t3E37dXPXNSeMJF/JRrEgXkS/XTpme6DbKfoYNVhH
         iwq4QPPb0b4457sZPNflJftyV3NmeWXEVyoRpM1V8dovS7x9PgRH30AHtfQTORWFbkT1
         Z3/pVXZLpxCgFNf97EEGMqeKGcgT6rlaloD+2HpTS3HzS5z/GJxZKAtrjB61p6lxTs1Q
         CtcoRPqDyHxqq5Cvq7rPzzUr8ZjlXHu6fEhBPfRSD7FYa+otcIlCchm22/WprRK89aCQ
         4L1zhYxg3C/rltmKQAwyeF3P0utW/nxeAyU7Nn4wuQ+PVNd8Su6At2pdPlsFmUJtWlxp
         6yUw==
X-Forwarded-Encrypted: i=1; AKwUvBzbfomZYLPwJTCsURJjYXuzQx6Klr99g2OaySH5r6tnnKf5uTQKD8SsCxS0JU/81xF924LJVsmCVvXU@vger.kernel.org
X-Gm-Message-State: AFuF++lHZDUEoMPr85U9SW7ds9nFrkkyVMomFIFJlrEsl2akCbcRZyRc
	0ryCpgkU5ufZcAaH4hh5IhlpPZnPlAM9AN2yqjCeFaKR5P5U/o2kfWXq+GquYnH05s7N/QujwHg
	O97sT5qnDP7Dxh6uje4NJ9ARzbsrlMADC4uRZcnJHjucQmtwt4A9T4/K3K6MAV8lL
X-Gm-Gg: AYBFou2nEaZS6YA7IBg3iM4ipnKaYaA7LYgQu8xxApBnvNlDusgOPhBZNKQqGjw9EIu
	sHOePIId6l/n08FZ6idWZQNOR3/6rI5eEWtoQRGuvIDA1V+W85UPXp7mWNlk1h0KMB6rPysmbu9
	U+jLv4SO5SXDncFhvu/o44z9eWFFPi9JavkLnQ4vB4ikPSYC4TPrPVqhO7YgxZWUM56YWnFDjtu
	xLgG4VOoFBmLxShNiffhBD9b0ceviBGKlfdUsD30v0kDwxkCunHdBtDErgaYq7ukxHYx17ScAfu
	jv2LGT9uYx5Dp0RZ5teawXyXHIc4N4/fcrLzZkLweJcImG7JJBo8ELsFfP1C8fpN9R+DxMmUIg9
	q061+LtN1OH0EOyQu0rNhteuQAyEg10pUTaMruohCepSa0FJffq553Tc=
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42726625ad.17.1788206987723;
        Mon, 31 Aug 2026 13:09:47 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr42726215ad.17.1788206987234;
        Mon, 31 Aug 2026 13:09:47 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm32698630eec.28.2026.08.31.13.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:09:46 -0700 (PDT)
Message-ID: <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:09:44 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfX4Yz1oKBaAIz9
 HFL7/+jHtDRCXTN7un5TIJ3uKuT53pp8d3eeJP2nPaFM7zBpFLPWt42P+ctNusJ+T0wiHDm+aZY
 6AQJCUmuW1+HhwSSqiXrwI75+9XEQXs=
X-Proofpoint-GUID: 6L3UWuakB_nLZNmBL32ifmZ8EucnV9WI
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95df8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=jTpQxx6w2ecbRakjFwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6L3UWuakB_nLZNmBL32ifmZ8EucnV9WI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfX8zrS3r/QLCAO
 PkZY7C0852utSlNVPveqERzk05KmQmx80Z251zTTc4HFy+3CSkEwSbYfDsfcS4grWioFWXldFtw
 YluvzD+8LRy1E8W3j/UprrEngcaEa0a4umHPdh873j8CPL0N8LqflIB3bwmrrHDdwqdzgINZf8R
 siQaojHkxt3odHgiv6qrxXSUF3ey8AHMXWGt/NRVnWCtb0Ie25oWKLwBb6J2jxZlVYDCjykn/gx
 WLOrF6mwLbT1Y0eTxNXJQKxM8WHw30v4x+hAcgCkhTYIS4z0cIPT8wEfe/Yy1h2xQZni+zBpQIq
 y/OTwwjm7KbuRuGyAXrAafTPmB8zCJO/IPYRpWEIe24lHxRw6XCZvkGZiS7sAeaZj4lth5TF2iH
 cWHxC0Va5y/rdGZPYwbvmMQJx2vaslwvwAH5x72Oq28tOjm4Cm22m0hDZ0sHNk0an9Z7KH+8A/c
 HFgKpMPZlsORSz2ESxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310174

On 6/30/2026 6:30 AM, Andrew LaMarche wrote:
> +int ath12k_core_check_dt(struct ath12k_base *ab)
> +{
> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
> +	const char *variant = NULL;
> +	struct device_node *node;
> +
> +	node = ab->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,calibration-variant",

I've fixed the following in the pending branch:
    ● checkpatch.pl: 126: CHECK: Alignment should match open parenthesis

> +			&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);

Also:
    ● checkpatch.pl: 132: WARNING: line length of 121 exceeds 100 columns
    ● checkpatch.pl: 132: CHECK: Alignment should match open parenthesis

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=c9d2d0d1c4a0faaba5f57e3c3350707db9f4f3f3

> +
> +	return 0;
> +}
> +
