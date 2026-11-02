Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631678;
	b=FZLhJ6KvAEfLWWdYlFo8MwHBhwPcs3DjE3Xzz6caONILALo5LekmM7OTT+MfrnIrt0P1
	 8LfKa1GIVRr0IMC3hknIoR2F4E8eo0sYpRN9hH9/mjfqOVLKfiHcEfdmLjjx2u2UoSt5n
	 Yi/pyEkAArlZ7SvlNycXmk+USWjs/H3f4SE4nuVwRB4jAsKJsNeYkB3ijIlPGXhs3A1hJ
	 utQfAq79Bo89+R5h2aw5H+cztfujL94XFVPwOC3E9CG7jtH0TLLex0kxsDpDJFK3YDBUz
	 uz274zLD+y2sffVDdlE56rB54vD1ta3dEHX7L5UBbPkHamtJ4tW8/XWoN/YLEIO3ERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
	b=hoviPB3OvcOczGSzi3JaOe4y9pwNx53Zae20rclRvbBrtZ1qLXKSMoYryUyme0RnyDu6
	 VUeDC1TveVYS51sxiTyGWSZ3NonNjoSo8ubjN+j5EolPt2M7CHX8v/hhFiK7ch9I8iNg1
	 zvBAx2xtDsXpxx9JHcL7iMZtb0PKgermOFjqKnwsh4YiL59W8BF4jPURb4+7igadc9Bhv
	 TC1hpyjlUAUXdjkPyyrOn2nw9FtFZD2wNJCvb3+9Eq63IT3vi8UDadMPgBn61EH0rI5dB
	 hgeJlwS1ljKM/kOZGgPL++bbOGc7EN/N0OZS7+dfdoFNGpP1uYG3mrriaV31C8Yovtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YxM/a2GI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9siiYS+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966D6070DAB
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D966D6070DAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxM/a2GI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9siiYS+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRQ42449107
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=; b=YxM/a2GIs/doYuxY
	9s/3rlQo3QvRMfIZgFux2lufmjx/sz809/lQTjbejlauYOmewYUvEEFr10MEp4hn
	1LfGZLRMWrbMeDoTyQPElGaQ9kNWTSXvvaFu6cX0Xkk3TXuIzrfpQmNscMDzsa/l
	J9bOknL4EvV18r+f8ViJEFcMbcTkcytuPdOxYMseWDftiPvvwunIQJXlOBf/8U2D
	WDkN7m2/T4Yw30EUQ4lMlKm6NJCZlT7u0YZVQm6El6N8S2xP6sfuhmfY+wWM+mJS
	Wxe/gM1dZKZrzOPKlNKpHDhY54VuUO5kv3cosfxswUH7PLyi3TaUxMRzo04qSj9/
	djKkUA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j82j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:01:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so96458e0c.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631676; x=1794236476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=G9siiYS+3o0gBGLvglO9tc8CRL+6l85uXUFMxRiEW6DOPOoTKBbWpsJyiyFkNQQ+E7
         W5/ac5Hbs4lQaR1MjFgiM9WFrFgQA/0zqz+Q4FbqjmFGMkjdWIdwK27kJnhUBIAGZprn
         l0cDhsUBL26BC/x3IXMkM6yvknte29WGX11n4YJJ74aocZyeJ6hqs91JINYMJt5kSXPq
         tl798qe3ckt9jr9xBx+cpvc9vjUChd78MoCtnrbz4zWSzGUZwOZJfRbps21n4BvQWQb9
         K7vuFtP8wn5I7vZiovLEb+OzTbApIQU7YWo7bbLNcEn1lMhFzmHamK0UVdK1zdSTZkoA
         cK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631676; x=1794236476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=bQNejszqQ9VQrXyOYUL3AxVYCGWaJqp5odyshcBW66tWJv+/AZLR9NCM0sGpNeIzkI
         GxgMWjJ7wJb17ZhGbQl6T0xQFXwwSM75CTA/JxS+I4xXxwCm0mylQdV5nLv7F0iqgcXD
         0SHBIOtAaj2gdidMFbXhPwdAlaGsFJgFpkS1lL/fI9JP1pTAhruPCeIVAvukxSb0djl9
         MYjA0IasbG5lCmm3ITo2Ia6Uo6X6ItPXBLDWK/fptbRufCc7HPKMYRod9I+iQzuwYl4m
         OCDTBbEzt3L3TkrGVOdgxfXBPVZLrZjkSFDsnvdCr7twmY6LsO6by9Yrm43sCzgcaGNn
         mJtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPmluEq81B/5qO7NjNDHBQ7yO2QOg9H4gVC7f5KAdNDpTLQ75WjZg8Mdi3PgvJickfdXRah5fu7QtJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/kJrs1eNV2eWifNbV5Xbow+zw6R2CwVMAi4oA7BRR+kzHG8l0K
	2vn4C9faKNT9h0AUbHyT68NMdoJg/HROXd9VhzAT1KpMFGtCGgN0hI9Q4wqxQVRSESNl7REKI7k
	TmdWnWMPH/wGC69Q+PioL01VGsxSMjA/3fyQXUWxKpqgZH2LQZuKnfS8xqFUtJA5g
X-Gm-Gg: AYBFou0AXAlu/wN7IbovnMtaailuDlJBROqEoiYK7cUKmmKe6ydg7hF4Jn653y/9E1n
	E4yuTUd6wtEdpP3xhQ5f5I0+UkN1KVG/vL1pImxNHmDTO4O8CJcDJ94tPNfZ5uCQMLTK4ZtSJRd
	77YmBlh2o1JSBNMba4LPwFbPQo5TZUJwx8i+JBB6VPdZBugc6AiOFFyE+ObeJKY3cR4bW6nJCkp
	AuiJ7s5x97DcHVTF80p8qn8wvPqgZYIxEgHeGGdJypASLiTVAsWKiEncrwkoJSXg1BzkuaphyyX
	o5RSMNMCSSuWDizEcWWoUmk9jy/rZajlqs+8z0IAB7luDqtXnOCGxByxA8tWLrkVAOs2EZrguVu
	0m/3pxJRLrPpgwZByuF75gMwC2IHrIQxq/GWIkpgUXoZiowQwCwoKecrAv2M3QcNyiN1PzA==
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312279e0c.4.1793631668554;
        Mon, 02 Nov 2026 07:01:08 -0800 (PST)
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312211e0c.4.1793631667906;
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm403326766b.53.2026.11.02.07.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Message-ID: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:01:03 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OGCY1KwaxEZQmBFShGNNZ8b5fPRnuCo9
X-Proofpoint-GUID: OGCY1KwaxEZQmBFShGNNZ8b5fPRnuCo9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXyNKGAUE9oUiz
 Xp5pKPcT3h3IB4fodXnltkw3meVctXNQd3vYFts+sHOqLuCWoChW624pfBKYWWRx39qEqL/Eqoh
 veU/KyddTBHoPNCrpgeDPUmjIupCBjU=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a5bc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P02pymlBJQeI0XzeDM4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX47IKPm8OWLuU
 zRngGD9NgM5ALUpWUJKVYuPuHgTMPOxnzcbGZYcQIkMAhSQnTWsg2IXFOfOg2Rv9bvuwbnDtoJ8
 KxAgK+YpiXY9Ocwv/ULE/k/+/+Luuuz4w+g5P8AL5d3AaMwrCm6th34XuB2mksgQikkcOAjxDTW
 gxxy0kllY/mR0UIimQD/GfrVtwBtQfAV9sAeT9m/AhUQOnXZR+20EvgoDWtZDB9JO0y/0Ed//1m
 THTT3uizz7QPm3u7FFqMFtIMztN1LC/PeW45Nc06wXavRv7OSwvOJxiAxnRTwhP38J/H1HNVghc
 MOjtxNZwECQDaUAqDL22ryoGltEoCkzE+SAz9dHsz54otUX915ffOgpXJi9DZCX/b7t5JPFDqC/
 o/CSVbqwhREFtDy+xkJZTWu1FP1Q1xnk8YhvjEKrNFkQETbXkHbpcT34IDMP0Z7h5QE42vkdbHf
 Chn4tA6dwO2MFCvrl7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	phys = <&serdes0>;
> +	phy-names = "serdes";

I believe this holds for both GearVM and embedded, so you can move
it to the common DTSI

Konrad
