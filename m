Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215E3F20ED
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477889; cv=none; b=HkpTTFGyoY6xosp+dNFFgq76D8enI4SoJKVasfMW4UlJGiny8mFAMrIsL/5XfSPXszQ0W11A9owWqwTFIquVyf0Tj0dwR8vdEzg9GYJLff6DZh+vcabO8IQO3c1VzaFyaA0zf2A3VNkgJ4OJArPyS7m8jNcWJvYllXSHehFNYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477889; c=relaxed/simple;
	bh=5ocgwha666hb1emqnCLiMPvr9KBVYGafjhTuybSGP6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=losMrgw6T3kFoVFrShF78ppH8/okeSHzcLj7YaQ/9ZW2kxQxmSCVNQnkgJHM0ppShaWmyBZHq7etlJl/WGMlcC+xjgwtIWKGjXkqv9HSkzuL2x12JMwVoQhOHe0mqVctmW61DCRzI+jUeltXSUz7XX2KNuz23zv9AH+HmKI/sKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n45RY/qB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0LF34Xo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n45RY/qB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0LF34Xo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAd4bX607858
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=; b=n45RY/qBbEjvRV1c
	IglFi/8pm4Azjh5+HkDWxwyY4n317qAVrrIpUxAdT+2judBrT5VpxMfyNvYT3jVO
	2rjVuSj+2daCR0wdpHKvaSJNMaAMwm8n7pR8Q+DMCmVzg2BEXEDLBPib2w1WixWv
	Oh43/y2B+ylvBQsT5QENCPJ8+FBxla03SHrxKZA7rhPdSgrl55iUON913An1nChu
	LwrnmA0iSE1mTB2wdAmL1uB+SOeezX/9Sl3/PSOwEmbT0UUkua/s7c6c6kkLB78V
	afRxErpGlwHgiZMFh9oRoWl30UxJopgkOfiqRYA4z1KUJzCGlKDZYkkoEG9WxvbQ
	D+xlVQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukcpyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 12:44:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9691c46fd36so16058241.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477887; x=1783082687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=;
        b=h0LF34XoZme0ddrlRQCec7ktm4C0gl5t/zXLrtJbq7RFnEMvxkaw2WXewhSHJAClWL
         YInplm2+pKZd4tq5js+cT+CyVdSXRzgaG4vQ3hvQyfZFKSdYmhy0UyUWQFLdgPqyLR+7
         GeO0rAH8gEzMQf0069ApdVYmAKwwAc7rOB1ihCi8FJFsM+mQ/84UzjRn0+MlqWzJPBUf
         qW9JhHFA0S/Z17Kr+IXHWfNXHFMZY77pAgxxMtN1mR5KTKCPTN4LetUX8N3PA7efdkSE
         v83Yrlwf0Zk01HgbmsTRxcxAyx0gbYDI4zLP0Z35Pk/1btWWsHgj5L7ZUv/DPzigeDpe
         wg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477887; x=1783082687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2kWKuth+1KwqzAoiXa5qvD4gDmK5gvceXurKgppeBc=;
        b=MDgTWDnyJy2Sx0vgblltApgb0egAIwhNeH1LSq+tgb3j6xDwwFDRWLbD94q5q/L63M
         4m6trU2hzu9UYu4YbjNGpVgvn4BD7bpyLAHku+E4goo1a2OeX+5e8uO8ByMGBWSTeSGg
         RA0AfAYLhYvWTCaeDrn7ij3o7H0fBE1kvTdhW2Mij+zXuoTnlnks1Zuk29dZsxK4r/MV
         17SgP/0beigdiqavamveGRtOMZcvTSiCVlpB4+gVQY+U7nap7ZMNoUn6riq/WJ0ep5hD
         8BM6zTtfFBkrxUh9lBdh1b2xCUJDmuIyvDrEH+HV1BGallmhd317OeQLkHjqjHZ7rguu
         876Q==
X-Forwarded-Encrypted: i=1; AHgh+RoP1QyctrGKt0JzDxfrgBN/rmnN/MW5mQnSHPDzbisuw4e5sOFVvtCSk7XDZ9F611AHCDIs2uukSj3L@vger.kernel.org
X-Gm-Message-State: AOJu0YymJvNVGPivW2phqfrPwWPp4Dye208zA0hCuOOd86wOlq1g7S9K
	bj5Qx+pxYCafvXmRuM7+FAABknnTXPX9e2lJRflabjjlGZY/VBnY2WYz1xNL2/kaLiSNqwpHTfZ
	N5FCjfwimehGNGCzJ4bpmXeRhWohZgTSAlZMtdt8c9rlHTUAkyaJtqUBFlUPQxNA8
X-Gm-Gg: AfdE7ckoCNZBPK1WqB1BYWpgzxoez9PRNqvUw2ZLQozA6U5crt+8m/HUFiOI+4a7flz
	3SgUhrJv28YkqZNaq0Jh5w0NPBBfvrIsDaMei0aN2YKaSrOdA4gT5I0gzvDYVoZD/Vnjj41CJjJ
	Yw7xbUtwhJDmDmMYzHYluL2q72nwkorHUp4HachJzoQeVfM2u7se7sbgop6yIPSSvwE78EtuEgX
	ssq0ia8HpkX1ZK3ODrrw9IZKo8eab7nHyyVU6pM0/MK8jS87oDbo43RJVzIghPeOWZlSdKLZLqi
	Hj9iZTSgXlK9N9NOX+/ScisfeaJ8nmPaMbdzFFlobFaJHRh4omayYYeahiEctwW/ZURlv0zvJTB
	j5psJ/q6/xjxrI19/ymRslK3DHeQxtJLFllw=
X-Received: by 2002:a05:6102:304c:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-73435c8bb7dmr1118168137.3.1782477886911;
        Fri, 26 Jun 2026 05:44:46 -0700 (PDT)
X-Received: by 2002:a05:6102:304c:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-73435c8bb7dmr1118161137.3.1782477886463;
        Fri, 26 Jun 2026 05:44:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ae59f1sm2715096a12.8.2026.06.26.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:44:44 -0700 (PDT)
Message-ID: <fa55bf2b-fdc0-48cb-b865-58b7b6de7d6d@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:44:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/19] arm64: dts: qcom: sdm845: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624190830.3131112-20-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e743f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eJDSHYLt-8gXCFyzMoYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ikZ3Svbx8fFuTLABSawSf6i8zQ7kyQyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNCBTYWx0ZWRfX+TxjoiqEhMM+
 e98d+XmEqlwB769rdeIIKnJiGIOaF04rvUY4q2Kcg/VwCbk6M2xKAHcbZUOXkMMf8YPVarX16MC
 OMn0uginTs6m5/bmqSDRD7u4LMSBGA/KlNVmaDukgsZpPFOAUE2C3lQqkl7hdEFAbjTwLRfpBTf
 A44oUZxIMxwdQLZjZPBScrlzLOz0kJ6p4XlzeIud1jSW0AYjEFy24oCwZ9m2uojZSTr8Om3NT2J
 4r8Rkle+UhAVaOeJ6lU6dC8xfXawaQo8Al6/yqGfB15sQLgeDmaybwcnIOZkXn7xtuiz1shMm+x
 3N2TR9lz7jn8bs21vc9u/lOIjIxSV5alFVzg1uUv6abptdnlyLJbvlvcvjkUO3TUpW4EEmgRGLW
 pae687OLq9C6QW30WfBEjTFhbnxCuedWAUseEZdRqh91eTPfW9+Uc72U+o51GrS0uLx1tc4dlG2
 7ZTLx8kuxDIxA1lVzPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNCBTYWx0ZWRfX3NBoWywP8aFH
 ZCfe66TKsvGQD4pn95kKtc7kJLD0yox8QCISYPqEj9bhmCpnY3O1lg6SlPgyj4yZ802d2HHX+8e
 DFXxvINccoqVLA0vjOPOFuVwdAOXQgU=
X-Proofpoint-ORIG-GUID: ikZ3Svbx8fFuTLABSawSf6i8zQ7kyQyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260104

On 6/24/26 9:08 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
