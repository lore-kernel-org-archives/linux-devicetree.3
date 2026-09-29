Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6692524AE5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687456; cv=none; b=reCtsXB4YP0pwVREGgAZ0965J2wX/aCFIvRryPW8RFTIPqRLCeggs6nkXd0bd2uZVKFHR/716o9LEAjwlyJsIY1FRIr2uxPj+b4nXiRCboEquNx12MSGC065jTs9fK6naAAa9/usiUw1VNwYPo7FZEtoNNgzuykqth2Ew4QKI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687456; c=relaxed/simple;
	bh=3IiIfXJtyk2FPxWnJXKW0rHvOYkXxJjw/G0mKQz+Aes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqLp/S+NVDJ1K001XKTsbRzI0bNFmvSwyRddHexp1x/bCgFsRVB0tEY8vtJHmG948YVwGp4/Fbvv+CyN3XEVzvBKUTD7m5tYzGDoXqekvzT6kTfiQ25TnC3WvGbrj8KXlM0ZZYi262FSxkonpH6RCtMqDDFyhWFgu5ELvHpdeJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B38cCOiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfBWkHbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B38cCOiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfBWkHbW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfMa4151382
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAn4rx9XwpXXw1tzM/gvOYMp
	G2xmnXsxaLSpoR4YmIg=; b=B38cCOiJbHoUVgfoImjmRex/4zvUdgGwPgkHhJHP
	3UKmxcUBffotjpZtO6ZH+tzoIJfhuX/VuCpp5desXYrUCH8Sf8pfLVit+ddQyJad
	acqYdqGe5dOiyWVDnMicCzj1rSLNyx4WzboKn2UrcQTuZUZYKtH7uyJ30XTbZmst
	HMFq78T4ax0uP2orzRO1ygexHC+kSpeYWyXcgO9BmXKVt/13REjvZlnOkQTebIOx
	BE0YmR2c7rZ6Z9LxSCXUVTPFUEUcqGNdq/+Sm8SMyAgmuAhpknCAjmctcoMc8zzx
	1uiO6UpdsiFAvmq9+1Pl7hGY5p849BFBh4TzLCFgQ1jk3Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc69h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso310481241.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=KfBWkHbWsyXhNidRfDmF3SZuV16MilVnPJwP4dN7qlfWl9mtEpIQeIFev0cE9zrTbz
         To8byYPp/Y7pyj4N/m0uOpXrurJQ/d3BkDz16JsjHMOiCLtPDWTo/6JvGcf4WwU9Asgj
         5/F2L9e75Bw8zg7cnwejBnI62tkWoWuhT6fS5htsIbBi6G9Y1T9ul+sBLs0UjBTacwrN
         d9HMt+M3ZMBN91wazqyjOP7MAWMXHUqZ36+3EH7GGWvg9HbHmWXROwdMfTUQqnBR23yR
         nKPQQU6vEOu3MzWqVD5gQNLm99jBE2iHcEtDwY3QJFGMchGq7LMZ3p45pxPg2HaF9vIg
         7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=vJER34pD1ynsZvWbm6ugjYFheBVyFtw/3f5jDxAIBELZUbIY6+AUXaUXkJbibnMaCO
         pxdH1MchQrKZ9rjESN+wUdZiv7M7Ai6+z6mWPCEUQQWci35aaPQzrcFh1q0Kk48klcXl
         3LdpmQZnctqxN8L+GQzHK3HFcr/DiyDXab+FSbTxBs6BSuCD5eqDGleqPd4Eyd+Qhh6u
         +dyE7441YD+h4jEsCuqSH7YOVUBaVVPMkoC9uUiHPbt/pxCkEXVbar3HyCpjVr1Dxwbb
         u0HJ6x2orJWO2XT5yLHNA2ZDF6+AFUH/d7ykxnhHxqKql591UcqQP5lNFTMLGBNXn0CO
         gdMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0G6nmwc4Lt8M2EfdE8ubCJrxmsl6j9zGu+q8fNlIIqheVqXqpK+26MaSjY49kos7P6/I+BfPQdC5X@vger.kernel.org
X-Gm-Message-State: AFq9FYKcGHQzdOSDGfTz3DZyOsH7G3N64aAVI2fy2gYf91jxPjxuaLJS
	/aURn3KhIAQ3CkV5SW0w9Q5JicbywdoNOqS8AzJy/4oRHM6D/FekTLHyPVvfSyKRbvcianq6VFz
	kpQTq8iLUvmeuqW6PiN05hhU4m2F2hRQSpVSNZBP5fMxWcLO8yz0ZHo0sdWQ6ZVOc
X-Gm-Gg: AYBFou3Bq7mNoC+3GP20qFl8p/bFcAjZGx3uHMcwILKEQWycNGmkDdraKwbDvwF62Dw
	GRg4BNb1K2y68eR0a/xFvptfp83Dmwf+316kxxlcxuvBMDl/paA5U9zxe/Im2VZVbB68xFXajS7
	QnrRrAtvJ3FjOxeCCXybmnkl3IBoMZIgMAm8ZD7TRN/7cT5VTbGx02g5jF5O9PMviAW+0frgTOR
	tj/nmjtk9MSfQXPm3ZnfJErLTwVTLAUHpOIyFa+CqMBDH+h8vbzpI1S98RIAe0mVd8pWO/v4a6s
	o0I5X+JWPb4gbi6hex5MfJb+Of4VW1dkusS+ENxj9o7lnvQ9CmXpaRnZT3tChb57cQOwxQa5ad6
	Wqb1l8uwlZyNIr+I=
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006512137.26.1790687452178;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006495137.26.1790687451535;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f760sm3102825e9.0.2026.09.29.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:50 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:10:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Message-ID: <vqnl4ofgxtxzulzr6xxbgb753vkcgyjwjgj5x5fra22o3zox4x@w3ehixdlzv3j>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PyAABGoQnUlXDO0ym_SyI36r3Zg5dvf0
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb8dd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9wjwRHIJUbZh
 TMXEFY2mxYTz2P7iO1ruubksr4OFQHT5B06LdHf4HIzBaFBtT5693NZ6qbDQylyCThfwBfPpRyn
 6cDEgdTIsxM2MR2V5kdpDRbhsprumNKna4j/iT3KMutZFekyHXR7Y02cUNe8LWYCyyGQdkhZrZb
 T7p/lVE161OD0xg0wUZqip1KXC5/kISd6e0DKn+VpwSOL5ay8BISPHB3vjtDLOV4tFOGsmWEYXF
 YkQmbWkh9GxcR4oU7JXMzS6o1L9h8LjcgVFm8+Jfbjlk1QvHTjjwXuIpZYyVHG0EgO+pBPTZ21F
 vnHvpdBL0fdgrt3uOgijC59UiaDoMN5s7w6uKIAVG+CD0QETywZfz6zaBrL6WVktR7jcjjatv3b
 kqJDPM5Iw/9yIEgyi4M/iqIAgNhth595rgiaU+7kw1RKII7TGcPuTlOLSWapSwtRwg3i9qKbkn8
 6oPWfTEFYWERok+14YQ==
X-Proofpoint-GUID: PyAABGoQnUlXDO0ym_SyI36r3Zg5dvf0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzLZaL8J2Fxy+
 Vf/JoWEOlgKmTFv6jwyevy3X9OPerkBHcRRSjJexTK3h15PUf3uaYc/dfyym7YKppooqkP3+ptN
 xWX+mTqi5WXYrbSxrR1bIFU49XoXScE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 14:05:18, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

No fixes tag?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
