Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656305;
	b=jmI5kVMRxp+THYa9P89mXqVpxXSMceuKegC2g0huvZKQVM5fbTI7NFRNK5zYBs/7XDQy
	 zFQkuO1fQH2X268+Ciw5rCkdWluHHkBrd143B6k7SsOZVfp5Ri16vxcCK022GvZXdxKaC
	 chumLy57WIvJP3E4wm7iG+vCXMhJk7f32a/s+CAgrQk5eMgNzr2G1Hm5FTizrLHsPr8D2
	 YSsKQOWtOcupnQgg0Q2m6jcHBqWtUyHPibMsl3JKeR+KSje4ZQ8ln6y2k2LjjIwABlF4B
	 bVPGZw9o8HbTb/oCRz3OwLOcndbrR41DZ1XhbkOcT3cdjeNw/cD2/Vgq71pARN3PibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
	b=C3A3zX+LRax8XGW8gdSag2rlAWZbdgurOC8/Xtc01OsgjukyJuUhsMKXNv7dYDdT3x7t
	 KEs9CvsDweITxZlEPKuwoiOuQsuqkGJeWheRxEuDdZpjB5bRmlnlhR8PqqMb7asSks3l8
	 zJ3lJUXPSO74Dv9PUhalnIEgoWQc98MLEbigoRMO14T4jQRB5ckxVE3HXUf5YZolxvJYx
	 7cmRc+6PEykE2Yx/U0f4sHO/sRFf77iX02vtFNvLcB6UALLiTVxr4favVSHqmGzgHasiy
	 WF4KlOXV6zALwGiVNTqeIw37AiO/5e3b3heKvyFM332Rn5CI0d/GAoH6EJqT8X8VL4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84F606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB84F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7a09A3105160
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=; b=cQOhDfF3r36vj4kQ
	xjVtHletR+j6W9y+iv7K1etgu5d5VhhTBr7ehV2hi7fnaB15JDWRewYPUnXPrgjd
	i4s2CyAnp94GdXmwIKjaeyR004RAWANKoe0azq35ZSo8ygzHUCJpxF1pDMG6koXp
	W/weUD6pa0mywBn0pFPUsUctpIXz/Nm4/a5FRJDusNpAJgF+z4DrPBCnFrfCHEPE
	LDofoMC9sbjelgpn2m58YJnTEpn6ZYwf8UGgpsrPMvwOi3ci9fsbmlYaA22dlYkx
	LfUlckblKMZlS4FFcb+BM5ZSmASur1h8AQXGs/jzlxyrnZ7Tfs0ELnB57r1fTpKn
	6cQ77w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asaf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:05:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so32227285a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656303; x=1793261103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=TUtwjJoKXpRqR+koG0tBr3W2QDfYkYxTtxCqtdVlzcJrRRoRo/wqtT0yLVsV47qgCv
         zV/LwUEDeBcCPKv6zO2z2ws7ccgaMQsPxv31chzg45q+/3ohEoUvyXXzT83psqo/sZG6
         rIX+5hCrKpwcMN9vvwSSx3hZ9rpJa5/CYAQr+5Kmha6NJpAlJlfylG0zZ2KN+1AyFpQ4
         zgWs5Sf30jZaCSlrpmhs0moBPP/ElMUKRkbVr65FS6SdhssNsJ5QPVwP7KDnoADgCs5B
         SfLiQ7ItGkTMsSN6bVyBc755XIbaibS9oGpy37PbfTBa8VoSTmGSq722DCX2Bl6jJEs4
         W/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656303; x=1793261103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=LihWAqjrOoOxI7oW33umCLWFVtSwUDVe5BehXPvwrGtNzxSn1pJ8D5lt2HBKnnsM+f
         tZ5GYEmytMowIepoSPhihqmUhgpjVgq77nUbRvqJFGcG93W0Cuh54ermB3LluupYGCPp
         BB5b7IKru4JVaREx+vpqxRKDx+3rqBG9CMmCSWBN0tyIVoEFw1skw49uzv6gXKTt+bqy
         peU8eHsAXLcilk9xnRXuQfLfAgWEIJUdG9SuV1HtrNhTT5wYP9gTeGsQzCRNYixBG+0g
         8sPTEO4EtZNyWLpx9ztUXdpLRi7dy/UnqeF+dy4CKMuaaIFR8nmYutAsYTl64G8euxhQ
         ZK1A==
X-Forwarded-Encrypted: i=1; AKwUvBygBZTEoAwR6G5elmeTI0quyLmFS7soUzkYi/ay/raQtW/qt4ER3JRbRUzrTWm9RgCumz8EHnlsLBz4@vger.kernel.org
X-Gm-Message-State: AFq9FYIeKkgIjj6AeLCsGSaAs3Z7AXkMGqCLdzfZ43Er9CHI4jgve1JE
	JmjOaod99YQIJJwDvCNDmmEBrax9GKbaFbIrrXHqdHlH3jiTbQ9dtCjMk44jxOIfeB1ZFjp1UFD
	Z9avoJSwcFDinD0YqdWRtMTBr+94Apo9x5CFsMG9VPvM/kNV/L1+L+tVNeNzo5xzu
X-Gm-Gg: AYBFou3+Bkma0AmI0cig/Fl7Njg/WD1p15gISpdSnWGugSGqUTj3u04WFuNLuf32Dgx
	7rJHdyCUPmYqgAmIXgnsRZvrbiUuklwCXBD2Eabiq3vfz8KkpEoG3i1HUp/nXGn5/0RjBC7QRfJ
	nFtT/mao2C+Iuei8iXmYXkLLKnvLklr/x0ieDH4eZo/ZXqFfO+9TojBLBBBOhxEdxAeWW80d6nK
	0Ort0FQd2i8uwsLzVbFG8WRUpwKKonqE9u4PLivWCcOXOM33kWFdxYk6eAbmcBrMolMD7tGYzO1
	2cZrSJgc25jhjrivsftiKwqdnRMZe4Jl4ICFT6qTHcjQOKETcDxviN0BmRzVIN14G9rLC36WFvC
	1e9i0tqws/ZTseD/jmjV9KA==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932521085a.4.1792656303052;
        Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932515785a.4.1792656302652;
        Thu, 22 Oct 2026 01:05:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a610a92sm76425466b.80.2026.10.22.01.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:05:01 -0700 (PDT)
Message-ID: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:04:58 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXx8ebDoFEBqEz
 TsKU53+vWFwWvAoiB4a35RG+U5RUHIbNNeJqtXzxkFWbzOoMOT3gUpyggx/jyrrUqjmqZjdXrSu
 J/7eSfigT+oT5VcHeVzEdv/qaFQGyeP8Ol2kjnJD/diB2awmdjiEyK0jZsRLKZCEl9rjkrZqBEf
 fnkFeSxVcZcdnr4mcHCKzYg9Xgo7rmQmf1yG48HhX5V0bIjiVi8G+bfsLqOeXATfgzGvC9exJO7
 xCX1zmL7hNyixOKf6vC7sFBuoMoqUAi2vsaUYJ6TBIrCAm+QxPiVTIHF/ZjyYsHvFc6DAe//FTX
 7QfBqx4QplQjEl9oZe15t2wxgHpaVknT4yPMUSl/bOOi1vSJn7c0Vn2nxl0FpG0q1s1/dlG11QT
 Ff3ISp5oQbLuZ2BdobIwcCtOGTW/HcXhhChRg4wc931ylrYpFhXPMPELCV0VFzoxjEwaWSHJJMX
 dxlKmh/MDeQ/xzEuHSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX9MSXevOJc7QJ
 0OWAAo97EGlqwaHpIIknlSMfg1ew4j9h++j/lTJKlyAvTkNSYi1WM/46jMXLQg7UvxTsps6gHCT
 Vpkrfjy03bnQc2d2fkNWBLgLFrNtM8g=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c3af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kz7q-GqAsz_10McoYYEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NfLUGoK0y4LJWgBPka1Vd8xYJuvZ0Lk1
X-Proofpoint-ORIG-GUID: NfLUGoK0y4LJWgBPka1Vd8xYJuvZ0Lk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> default on the Talos Lyra EVK base board DT, to provide HDMI output
> on the DSI0_B2B connector on the carrier card.

[...]

> +	vreg_disp_3p3: regulator-disp-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_disp_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&lcd_bias_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +};

Stray \n above

Otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
