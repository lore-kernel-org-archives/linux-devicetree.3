Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812666;
	b=FMJkJGqDYyslnBdGByOFY0cl8Zv6EuAw2PtbsrgHIbNnm2EwjBg/ny/JKOYfG/b8nf5+
	 QPtkxTjP3FScG7UhtFJuqD5rUvsNqir6CkGMKIAvGiNIX34RS6epiqml9I80F9hOCeQps
	 axC8fAjEMaQ4k1vVKbpEvy8qJpZWOVSCVVWtFlNbU8VW5lgBJJ0+vP3uQsgt2AlS+RAui
	 YOy2Kqxk1YDRPdab5HV16kS5LFfY1O4NOo3732yI/pmy0/ajOfg7t2KvaUpJ6zywo5ljH
	 zVcNiF9mdtmhfq932xWkfD6ntS7imxnK6e/NSN+aUx7uWAXnsPQ08htkWa0H4s9WfcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
	b=YX0080CcM85pV8pfDWY2bSGA3cHqE9WLaEZ1O+5o882JcNsm2iE8VQvBQYMPIsejH6tX
	 E8xVwbXSZxGIc107Wqoc9nEZiDEnCxhjSGKG7Db9tSOw/u9fWHdC6CTyOqX/F29kGB+Vu
	 WJMke3hB2+/r2TbsYtIQCVkLVSViCWlOa8JS9/SZA6HqovNl2A90en17NMpnand52+mVc
	 7GJgpPSZzeGtyd9w0nlOz3ZglxMGBXsoXz2+SWuTPQb8L0dGewlmy6ARdO5PAHEmd2Tbj
	 M8jgMWSfMlzHrBBmaTY51gCnx6+lI7YMclzH/VtLgBTYzJyb1Nh/aRSreyAZ3mN09xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eZGqU/8+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3F606A336
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B3F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZGqU/8+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJ0d9qSP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lhlt656077
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=; b=eZGqU/8+OWhPYFuD
	ySKZbP30C/XMF2ZitJlxPC4u3cRqLNwbs0oiTdizemAKQjLXw321Bcv8Bd4VGZKw
	yXYWti83SgW7IMpcwN39A6zycURZRxSdw4ToTEntaGwkW/8KZ+kDuSKy9mEOH8Xt
	ySysFGaF9cIeUNxZ3N4DY9A+4fhDFas2dawrVScfBNjozNMTxRMArhqUoKyHFy1X
	sACoPuou1Ehfp6bXHBhifCBR2Z99zC36S6H4DYQ0foytGRoBS0YbzMxfIiEQhsJN
	g/U8B1YJf2vHJzIMQYyfo1fOkAZYITdEq/WNYcQ0m61OkfKI9gzTq5WnqMsZd4aS
	8x+1dQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk258xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:04:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1555926a12.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812664; x=1795417464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=YJ0d9qSP2Zeg/LFjKTfPzs7IYhktn82izo8TeU8lm4LnLmbQ3pNOjbZNrkrat290lk
         ts7S5x8W5P9PXxXmmIaoyiefFbH3rsxG8tZwTWN3sUTWSI9gDn9Mud0Ig71GYa+6ASUj
         TBFYa0rwl7VPkzW8ugAj5x2ridU7c58Ufd6IYWenjmpJ0cmpZK2UCtZq50cISQfZsWux
         GJVJnaWuoVbSHpcBB3GC27/SmPVTZlpJefVgwwBh7v6YX7kja0tHZep9jKkt+aEkHbQ7
         AxIJHzsfi3E/8ybabAhZtXkiCfz3noyP+QHceoVjBZjyRo7Bl2520x+h4LTGBbTFXYMY
         7ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812664; x=1795417464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUtRpQWJkQjp9wIulBLIg1KkGqyz5UqM5CuRaQJgHM=;
        b=g5w2T7xXWeyYXz6WRdwzfrNCRRcfMcihHL7M4Ryx41TESvw3NNs01W/sExrE4KfrEP
         wSQJCM+Hxd9MBoPTL92NGT5n/YEddDgcsz0r2lcNVBxxB9Zj/cLRyj1Szb4tWk+Ad/Hy
         9JCDjTBEN7lu+14syfiIyXX3dxORqSZ5liVzvFxFHmytBkYFnh+poxmJpVNMIcLWjIv7
         maW+af5POw7LuBjIZRhm/HK51x0Z4a6O96ts1F79B8mrVDZ4U0zRmTRGa96n03NQmdAA
         oh+Zehz4DbwwKyW8Wlr6yK0fwIAO+613BFGMak3jCYtKehH0MG138esj1ogOfcvBz79C
         +zDw==
X-Forwarded-Encrypted: i=1; AL+hErESlBKlSrMmSAACj5rzacKjG0zXo1oNNf8LoDmZWJ/xOhzstK5nr22DPODm+lsQHCoiT/helFkRkiif@vger.kernel.org
X-Gm-Message-State: APuU4Z/XD1mUn6D2o/e8aEXepq7uTMh2ohTV9A8GOjclUreB2IZZjbAL
	hUZF/YCHkd1Ogt8A4VHdtnpakpG2mGrmsM9QZjyA48ZfZ/CbKUUxVEZ/Ni/u+UvGHcdW3PTD657
	dEUrOjDuQ6sKoh3i5vtRy9XRYN20T9Crjr51WDCU/hZTiO8gZ9z6FJYllZyUHtm1E
X-Gm-Gg: AYBFou3HN9Fm7GEiNX6a/7gutnJIgnXR0EZj2y1SF+TfDJVbCS3uvAKlmLsORxLTvoy
	+Fd5tB+X6ZDJrTeqbTAStB6iJ/UT/Rp73pYUlTEQ9EPW9+2WG3TylQ3NfbutHNhAn6dm1nevkht
	qmGt0GEB8XYUOeexjZ47mwKcyRG39PzUmYe9y+XvAhuXBGLAexdcwv6rBs2dYwQ16TOZvkPVBBs
	5F+FGAMIDqIedaXY6t8kwrCRtiRdjUcaOvsG53EVSH2XGcU53z/tQq230s78GrHENq/OsGdEVK0
	aWCtCSV3LetXcscFDJal+cQvsoFT+Ud4TCGQGRUSs04YfLrcXkaliDkxjkk2sZ6YUusaza4KIZA
	iMx8hO7GolXOptNuuPyllegdi6teY1sn38j7sYqyKD74tof4KJntBAOLIIdsP4GagYBfTPatuGO
	c5wg==
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731030637.0.1794812663985;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
X-Received: by 2002:a05:6a21:a10c:b0:3fa:7d10:d1be with SMTP id adf61e73a8af0-3fa7d10dd48mr2731007637.0.1794812663510;
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Received: from [10.217.216.218] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3159661b3a.47.2026.11.15.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:04:23 -0800 (PST)
Message-ID: <92001145-02de-4a73-b904-a2e84645ff7a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:34:17 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/2] clk: qcom: Add SM7250 graphics clock
 controller driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-gpucc-sm7250-v3-0-df68449f0e36@brar.si>
 <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261116-gpucc-sm7250-v3-2-df68449f0e36@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IxwdzCBjnJxkM-TdNoEMAmKVrtjSODZi
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afaaaf8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tvYaUqEbFtj8o43HNvcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX1F/WWRCm2qoB
 QrymXDMZMqPO4OpntUBIgw9iAhUY7LdBri8Uu9Vb27zG0Il01ruahsmUP8rWwPY52pr8ubDQS0v
 oxZGcFOQy6qBWbHOg+iyzEYwxrRBGbsCwOyNJUWcVm7JkuCcYfXJNwPz12kXHNDIjklff0kvQwv
 iw4WklWGRKyoAS2ZsGJWqOuTBo7hZCRoycD5EIEUJCqWFwcHf/8pCXzTqIA5tggVPXRRhbH60aL
 wep2RZWotrtBFD7pwZbIzbzaaaqixO7v8TT9fl3RoZ78cxp3FjCMeUvdsFnjzuWibSHvJCzgZbo
 7nZL+MMejERXtcvSUcTF/8JHCgr8qErioNdJw0e5vA/Da/lSjAs7/sn1Uku/dYKgCI3ILkPg4eX
 dnHRYBEnGxQSl4gIZYarhvlc0AnUz+vHkKem0+wdDtVLro/YKk3i/gME53hWTQI9v0eAV3fXFdd
 Rdz5mDh01xcBhQGKPJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX+f863JvMG8V1
 sCUZNwWwPt0qGxpJRCTfOAsmhRSYHq9SYN3KSEHxO+XliDuMAjckr0MySHpSHhFdYqnyVTP3Kts
 un5AJUFQbI7uxDDXY16GoE5ksDggDD4=
X-Proofpoint-GUID: IxwdzCBjnJxkM-TdNoEMAmKVrtjSODZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027



On 11/16/2026 11:51 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 379 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 390 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

