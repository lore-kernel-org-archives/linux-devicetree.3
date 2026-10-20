Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504677;
	b=TZNiA8yJE+f3PnPX+Y6E+vqRU4Kj3UaJnyKZVo6i0sCaJw9+Xj5ZZOCjnpqV7V7mCDyi
	 lZQLuGcTYUNJV6eO3ofyeM+gMcYclrZAN/MRvNqq4rfsTwskuMtwgFmqi314IspB/DUcS
	 KFKCLlWGSb+lLBTD2XZfPOfYUgV/GHn+0h5PxaVJENtazmeTKyW1bLWdvFSrXStEUd6x+
	 zH2V5D4MyJsHpDNZVH6SZkVHnhyZOct1bQbeSHPQST2JSXv8OmXn74ZZKzUCtTDj3VFQg
	 52/ABGedh4jMVcHIv97M9XJSqwEIPsJ0ZtAt7q+6sDeaA3JFws/urXwvgHvprKwHptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
	b=yMQHStmIRHowwlKrg18Fj2Q/mH3JsngvImYlImlFSm2PhEVQ1CItFb7YCnDteKtm4gpS
	 Gh1rY0TjyE4JF1d7yYVn3JK4YUTcH5xPTwzPNBqAv+cIVt8KPkeGCdUGVJ8q3N/fERYQJ
	 TVsFOtRewWtlNjz4obVghmdXANvJbtuj6tizFUJvVa4WprBmD27CgClUkpOa3VGpPnnVD
	 vYTFXsYWhZ65KzBuy9r+DLAn0/ZvNiKlxDS8Lv7rckMhLd4nvlCPYKsyvmiM/RYLHadiD
	 sJWvFonUZFWXu78fmjxTRnfSqqfGz/ugBfqvvXsVN2TXnCZHS4CBaZwFj1ZhfxTqe0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1jLaHuN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80203606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80203606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCqur4cz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1jLaHuN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA4Lo882252
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=; b=OCqur4cz4ubjmA8w
	+41iJPhJIEgZYmoE3Uy6GJXEMEo85yC73Op892DT/BvvNib/hma0n1shks8GJhRs
	Fqg5l3MoNf8FY/65UqUxvEgeO907Vg1jJ4CsHocBVJyERluZszAipQhSvu9hkVls
	0mSEiG54/UmuQEjYOI4Jtaem/mEU1JQZhoTBpZOUb8l5pN35iVfQwFaftcT368pq
	40F/RCr02Rm28vdR/EYLDcjv+r6+mC8hqaW1aWh9xLVt+42BFMSoU5m5Fk0tlEAH
	6TtcSIQ8PravgzbLTesKuZQgwAIamFbAaD7quKzB2W1gdkwPJ7DmlFbfN2nN+PaE
	Zxgtnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2rb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:57:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so66382985a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504676; x=1793109476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=h1jLaHuNRtiGw+RF6PcCK232KfV9satiAr04UxczL+AGCOhNcXEOBjlsNgWwbqUxFR
         RSfbMJVvTMyl6is6rxZ/+yN8y0zK+3j91XtPokHWHRPdZNGywUpb/ixyxWRDrEtCpEeH
         aYBKBq30bR85IssxoFuBxVqVaBlsZqhQo/vfvHt4eMZju84FvVC2lVOPZekSSeuNvY/p
         bSi776GEeC7Lj1KqC6V28VNDZ+pJuRylfRLeL3jCDPX+oUQ+Zf7XGhrUgpr7lmxKu8Sg
         I3msbd/+YSNzVAfaPArGXoD7XOzMU9j5HVU9hQ0ttw1DLYC0v6YlCPAwvNEZthgwZA62
         LHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504676; x=1793109476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRpptwxP00vKcnqPDfRG8atA60JwuaQEIZY7Gn5bGx0=;
        b=XufNOmpUw9386Rl5LuqM2It5nV8CmWI/jMowHcWDlJWlKt+bs6DhA4Ba8kLh81+/1u
         lAWSw72I/5W8UEV3jOMPWig5RTeP7eORC42K6aNeg3kQd7KqQ+nsB2YnweaqF2FIOnUE
         DE9OeuFC9kU+UTiizfuwOvEQIKXWGU+5A6vJ/9wivaD9MAmRSnG5iuvEBdjeVg/2V9cC
         RGCuid3Mjdi/c/cS7LUU6XV20jQ4qMrhGo3zbO6bpkQvJry1KrzO+NoFeVMwA0Ms5IuL
         lGrRSgoixR/35J+X6WEtQ9AaY62WmvsZDlUDC4xgoct4cA0vrSqnXwK5u/yOmDEB7pGs
         B3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0RaRs8QsPxqsCiW9tfQFUHzhHWfZqUakI3ebaLmmFDKImKvL0EVn0BpKTOHCpTBVkQfA6CARnB09Y@vger.kernel.org
X-Gm-Message-State: AFq9FYLSU91jVt0nhSfQSf79igPipnw+kM7vzBBHiDFdgNtewGRKWzU6
	l5yN1unLlzeQsuiwrJYLKtIQSyzx4KVgHt4TygBKfltKCdjPzdUumUug7Eu6wu93RgY4N2hP4RC
	KKK/Zqo03byUuwHUsJ9bbxYRnnBiyovWQnEmjkaS7z5TZhQq801NHb59w6vmYW3Oa
X-Gm-Gg: AYBFou0BReUkPVIHS6yjeoKNrk7DQqqibbOowPE2JLWdXP6+vqhECRkIvHf5ujx39sr
	uL9OqgbmtZJgTNqDZdcIlUQurNKSfF/sF54QtppDpklfmx3e2GQnwI/vECM94vZNe3SYVmPCBl3
	2Cq2piCf+TjTqHlcaymLpf/87VquBLhRuA02qvY5+zqJfRyWzDMQ98OpKjSeAwbZF+HjcXS41A4
	gIP4bpKZqlPoDBbFT0KRDvvqcqDpKm2YCOqLqgFw/f9V1zwyTFd5q1vpzsnzVlWN6KRBen6rlSe
	FQvH7sGXKEwO+S8F18sJ2lEC5ECBk0aI3ejxFkm36/ZoMRCsz58YnFZ6BP71uf4gwgmLfFy2QmG
	v9ehH9by5qmKxu6dAeIQAKg==
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022153485a.2.1792504675390;
        Tue, 20 Oct 2026 06:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:701c:b0:939:8148:1e3d with SMTP id af79cd13be357-93f29bbec19mr2022149085a.2.1792504674838;
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm490932266b.74.2026.10.20.06.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:57:54 -0700 (PDT)
Message-ID: <e4501d93-7781-405d-b7e3-99d21358d707@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:57:52 +0200
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
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad77364 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7urghiclZBF5WMYhkxgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX6dmNelqsGPO9
 ohAMs8rQz+n5nuPijlKXxNOwWrAkZZ9xpm1iOrAeJvFhiMkon/c8ytN7K0/7zP/8UMHDUPvb2Rv
 pHb+Mym4u1dhdAMt6fELT6790k5o4+c=
X-Proofpoint-GUID: M61Nh5HSYhnbfBtp8kHiuisJcpWZZlP2
X-Proofpoint-ORIG-GUID: M61Nh5HSYhnbfBtp8kHiuisJcpWZZlP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXzgz8nByEgQgI
 Rz9DsoTv/OJnR3YZPmJdZcEWE9nyLXSXuYS0jaMe27isNUl+N8f65iZoYU4uyqHtMqeKdsMNZHX
 ySr/SYyrFHzp2m10z5rMXUIr2hW80oSoKiGhEYasAJ2eGJCgRO3S7xK/3KyyF7qSgXvr4f4lxl9
 nUeArMsN8dfTQY7DtVBqQMcEkoLbhz3PbLxN3Ik7jYuDwVrh6ifeuQTJ+M8+tCnlc1gWDX8at+T
 eR9gBdWifwZu2h/AdK8rz5CPzvDB/0BVoZ8mqrBZFfYs3ch2MbDB6UH4EBeB2vWqeoQYB5nkApy
 +V/wlPMCWrM3jGfiozUJPrusfJdAQ5TmWLKRbQcTVK1The/jhd2wj6RFFOnDu65OWBdrLPZswtz
 OuhQLQZ1q2DpW11mh4mKhy2I/susCKPsupvEXj9AjCmjVIiZSGPm6jXeaUZAJuYmlUGQrV1YilK
 tkz8UzigQa+fcKrYnzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/19/26 5:47 PM, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.

Nice!

[...]

> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splash_region@fc800000 {
> +			reg = <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ pdp@81300000;
> +		pdp_mem: pdp@81200000 {
> +			reg = <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};

Please check if your firmware automatically carves out
0x81200000-0x812fffff

If not, insetad add a cpucp@81200000 node to the DTSI that's
0x100000-long

Konrad
