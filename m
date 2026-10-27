Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098782;
	b=oIyxZOWb+j0x1/wuSdvx1bxRgvrqN+TEEnLRAv7zwhtXk/E7RaIZ8nUNEaH4cbm7O6nF
	 1Bvbk6p+s1xJXvoM9SOwr3RhgcON0INtp1zyrf2GX6tdczFa+XbkxabfaU4cC0VnkggN7
	 bnV/t+vRXET9zAdt7d+BuU64WAQZS2DDK3OsB+tEgKZNBwGr+Fb0ePeh84xNGdO5KTOM2
	 bVuAZFuGgkUdhXA8AdmTk2z4b/Ldblurui1z5WniLk9ByUFVFR2+zbarl7giVVpe1iXOD
	 3GGlUSo/9vw1wxwcDdu8QzAPjRt/josPmayR6enq44jmc378TA8fxAYH+nM4DqMYySw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
	b=o24tGVYXypfzpbi+EKhWw/ise7lf1D58tZnJVdk9kh2B++Y5Hvx0GYL7ntM8reUu3TAx
	 4CQAH/irQXu1X2fCgcDGk3YtmD5NuSTV4EEv92nd6d1RCPWRDW2FYSEmA197IPXM+Ae9H
	 olG/mossoVQVlpDUCKKAhGmLTF0cmHjOI9SCvFl9lSPycY61r47fvPUZ024TH+MYPsnB2
	 RhJC5jNX0DBX7b9nMhgRrAl3zb/6fnXOgGDAhyPCwReBMWIbTP0w5dP6Mg7hVBZNP3v63
	 BB1Ywz/rOESLvFNXpsc8bCEvONNmNT7KUZfy2PESRKupbuUpJkKLFcUGldlGNdV33ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8B606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F8B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0XF2458167
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=; b=CFt4gceTanHmuKRI
	CHJVPXo7/JyqGvGJucuZv7Nuj9okw3JQMmlQv/8OKLlGWBn9uwqU0SIIsmCggkDu
	R+dvqXwLCGyGCwAw5EaW5RupWnusaBADigjAxrkdys2eGMu9tKDdAtNbyfBnnZgt
	b42StvxTf6j45kaztebp+T8nqvTS4jQX1+9GiBNnV1KbG86UhGcozOWMT4fIA5MC
	zXMpXPrMS2ufCP4LED81iCfgDNNmjzUzs3OhbgVz0yNyYb+9qLx8ldJuUEKsuQ97
	n1ciZN+0r0ABGx5B6/k0YjJFsc/v+GhTYc/a/yEj0U/oYRdMckwDunqf7E8SkqhM
	R7pqtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9whc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso15669511cf.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098780; x=1793703580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=hmh8jTANgqk+4t/Y+c30HwqXAmDGrjspn49L2oJndDazaSHNAhQ/1icKsxiK7ksFWM
         6prUMeM++Tux+RP37NyRJ9z2JSfscXivpQxwIiFIzLXCy2456sQdaWUYB2Kfs04hcvEk
         qly6LbGT5GF4IMYgnQytzXbP4eedfu8HxHqChatmkJLaztzvnuCFJLM1u+qzqHEUP/bo
         IOKLWcSIg3LljsrkEkxoUGBCv98kR0InDCqNp+a+WaXD8JK5Lh9DTabneWityZLn/cwy
         neC+MAQeTMFQtkxKTnNhxkVOGnY4FXoeSPdBgq4Mz7B2JKJYEEywclnyDsyk5VAaHnhJ
         iCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098780; x=1793703580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=S+pi6Vkq3t/YXSBCRhAK2/S6g7hOGyt5Gg9aWn1q9skzRvhPCLL3eScM67mzGTRv4d
         DwTwUVYWxL+XvL+s9pcqtSpbHnpAmQrsVog6/O1jHYLdWmz0SeOG05BnPreqb1WANAvG
         8SpnLHj4XkwBsjuyG3NuHG3kN7MnCrIVUVZ0DZyaaXWFU6PA1U68/vwhiU0/F8jamjuj
         TQ927ZJGkAB8X6/RKZvfvT0UTJhzfRJh0tZSNRWdQHXpAAbzT1YetweASTVRT3KQlenV
         Duz9oucdnTXZizIXpGPn09q3trqx//Ar4WaI4DW5bZmGbSJIbPHWRAqglERSSgEcQ72Y
         Cbrg==
X-Forwarded-Encrypted: i=1; AKwUvBzZqgv1h4cjJNy3UgXlq8U8+tQNfDy/eFB+8KfUc8pWpzAOHrhvzfeVlaNlh0tDdJNaOchOceFxAhZu@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ+9oLc1O+ZbzDvXMcrmkaL8Ck7T7G1rKsxWS5ave6IfhbA02Q
	k9Ee1NcBambR4hEn4sypzbMytqFAmpbwDjNo3FMx8vtKUnGOugXwQ6SrEodfuxU7v3VEOLwDGYN
	qO0iOuIl/sb0T3tig23T7V8I8/w33yZIysG1n1YmWRBqOpQ80RqS7flOf3eYnnE83
X-Gm-Gg: AYBFou0dvLpztGRheIc31mvE7QORf3600KDb+ktGsPg5z8eHMoEWthD1MpEclNf7XdA
	2ISjDgbxxfgJ4yFz65CNFh2HMBOC0PFJ7W/Y4H00vSVvhKM8iLbCZ+t9rVOHIheJn/XvpXvyzoz
	Vjq8XptCnh2sbCR3r82iJFwUP67EAOS+mhGKO5KgQLSVM9NnACy0WGnfzlcmtOKzIsBAKvFj1i9
	vgqYgb9WC0Ox91cNkkXLM6Axgm7NjWk7wP7HZnjfTxsQ0vptTUotL5g5VfWpAK3f2UAtrceTJfa
	UFSAPgR1iaLjRq3tvYlMTj4qBujtDBxM36HlR2/RgMNTIzrwtKfZNodOftZTsj7tR/oZrGoDkoo
	1Sl6jfYe2qvQ2LNK3GxtJVw==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438985785a.3.1793098780210;
        Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438982785a.3.1793098779662;
        Tue, 27 Oct 2026 03:59:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4704987a12.3.2026.10.27.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:38 -0700 (PDT)
Message-ID: <fd27ac24-e96e-49d8-90c9-019275c1b541@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:34 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX2TnKLpKCuYlQ
 /rYR5D7Njd0TgzT4xa5FTvBbIKyPPgmrZTaX8LO3gGFBitGrD2JIwku7AUBXj1D9PQErRtEfcaK
 1TMiXvIuQBJCGtUjJfGTjQl95rOIGx8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXxqS5vlyS24mI
 sQ3irsKWbRf0h6c+wW/sIXS6e+dgTp1bQXRiBt0xbELwT3bHm4fUBKWmW98hH7Mo0VFeifHjkcU
 z7waWz3B5lnv5np5vv+pajW6uKEhXhQ/Byt6Q3a2sOjYfRlZGshWpyq9dwGVdpDaSNkFhGrhVtb
 xyYeSxZ5OKmtAd9Vx3pPn3oo50OwnNRAAWtn8FhbmmcChCKS6qhwE3rii4KuCRcMZIsSaLBACI6
 R+ZC7LRxgBZcevQsRyqFuxFfxEO677stBmvCXmAL/piQgvGATNOf99/+rIWfOly7zD+UYFQBX11
 b3LRydNmo6io2kZV26ie61IZ9i3iVhMIKrDIz3YvloyhPTGuHnrMKPL3/2v153dN/p9gYBI7oys
 H+ThYhvlVNHiir/Zd75Ibmaqo66dbrVnDDxFzA62glwO5jple9DlGHMUN4zNgFoPHT08XwpUXgJ
 zK1ZCxT+NBDYT4t5iMw==
X-Proofpoint-ORIG-GUID: rLv6UbE_R_zp8DyTCDAqClHNSAw-W4If
X-Proofpoint-GUID: rLv6UbE_R_zp8DyTCDAqClHNSAw-W4If
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0841c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RnYB8WQ3oujroR9yDwEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
