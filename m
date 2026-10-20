Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483693;
	b=24u4vvUMr1CoqdLq5GdOnkmeJmLUr20keH8iGdqqlqDs4txP9jU2OIFa8gtosROXHyDU
	 1hXNS7AOAh3sLv5TBaRo7rTv8BYmvWKUX9XAY/6K3bDpbqWn5cKfYCAWfvBqDroELncbb
	 5IipdpnaiTWRfUDnCRnDMY2+2z/BFWmLZbh0+yjySThjrnMiDYXc8b2Cmd44Gb90TCtoz
	 IXxYdFwK9t9Pk5d4K+zqadwWtcVpDzr1NqOoH0p2ARnJeOy9xp7BWz/QaRGUo0eevp3ix
	 rWrenAc3k/ioahlQDybDBRjukxHxljnMRwq5YHug/lQ4RNYTqy6xH0PBEf+dw9U+B/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483693;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
	b=Vv28yuqjXKBswxkNbru3E360Kcw68d9gvhgmf7snD+E1Of3uedD7djwnxUDbVI9J0xMm
	 AGzJWnAhmOQ/D3QY+tu/fY6KVqOJXd7lwBnhBvsFiARHyXrJLMp2FoPeiwL2XlOkvG94v
	 0BfQjIKHapBhHdGlq7nYo4QlqnDeGG6eEFugihP6YJuNuGBCv83XzaVBl/IuPHLwHVwkX
	 vOXHqmk7nW17cym7alUHgHL25Rz4eG+6/6XoApjA+C+D+SVu5Xjcy9YYJd/CsQZwkGFmC
	 rgzZpS1W6Z0i1LDKa41xSGUHe1zIywxSRsL9dtRvc6lAVA1I96qlMcbZEi6TgAsiVbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VwoaBQYg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0A606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aerPNKxw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VwoaBQYg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBfS619934
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=; b=aerPNKxw7wfJFNAV
	P3+wHI8AApAAaTn2kvTr+XjMwXuoiqR/q7BSsxWyH14IzW6s+TMKZ3r36sGdqYmC
	8cYgSiGmhDjgzrmbJ0zViuG1KO6mWlEI8uesD1ljK5CQZ6JqaW1PvrLWbyXsErGy
	GMkYwxlINToMyV44lO3TuhtgCBPZ4pcsiT225fh5ID+idm4J0NRtWRtO9oBcU8Fr
	8GgXSBQihHC55w+aSZIhd1BywnacLPnBX2vuCasZ+6zR83EzqTlzrLKemx0cLhGG
	r9TRXUCETf95XI0AgdQIGeoYbDqmlCFbkVhW5Zc4lKIwHwe88FrEsq4zzkSJ8SFn
	q/21oQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsg3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:08:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so43857885a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483691; x=1793088491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=VwoaBQYg8Q1FQ10w3mo8q2PgWg0tnJqatXLPx4DF9j0Ch4HCe5KCIhQ8EfTBGkKOcg
         Ljg4/ISt8iC2pfLcIAj9CvpaA5R/Q1VLTHxgSseUHKwElyZg9cZw6PHaO6OhLzfVeJAE
         yKnX0Z1dkEW/MQvATkNjoHT4eMla6GoGQ6cS22X2ZaR3Vu4rNfOy36dG0wI6gkU0av/N
         8+BMFVgnVUe52xz8Yqlch1UcpX3EzKVGoW/7WxgTF09/tBWuyNOOd1WALop4CM8BT6L6
         HAyy9jGNni+8DBlUmgzf4AXvOEEirROLfynoCdeofnyYsN5fId0o1rleUsHBwHOcQ1nm
         8mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483691; x=1793088491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uJTMWTowdwAnr7LyOxnSTa9AWYYxjfPH2Ns9i2jPjM=;
        b=Wae11Z25eXsIq8pshCUU6oIiB8uk7+GDVc2uvHd+gmwvFA25i0ypMqey5FOR31+UKN
         TarywG9qIA4l61cVeFIn6oY7bRsqiKKCmq3Jx+YX1YNlVzFfXJSjlhX7x/D/59xATyXB
         D3YbOEERnw3htxP9y7B4Aai/gQW7F1C0T271f+sQztUxHEeDhvLcegaswA8btLUJoeiE
         Ynxm+n3EBi2wbaGAlEK1crrmToeXP1P6iajE4g+IteLVGerAEXb/r4uqA4HYR5B8Lm0F
         Dndg5VwDogBbYamsNoTvESBiqlI8sREa6iqb0OxWYEBdZagFREmOLXuOW5Gl+QrmskXe
         rtPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3FBfOtc1Y2frIiUVWuxyJBUgq9UsMrL5MApv0BVo33ll3Uwf8FVvAqvSw4dI8q8R4vXAjCnJt4jt7@vger.kernel.org
X-Gm-Message-State: AFq9FYI3YEj+LyxQFBJgbErXb+ZqXbZY3ATkwpFydyQG8ftrromnEeGh
	zAjbn0phel1Lst79XrUAI1MRTSr1MVZRRPHVl9Udc2w6ThThqVCmqw6i2C74DbDHi5mODbflXXp
	9Xw7/eTGQj0ZEA8Qq6JI75zQIVmrxMtkW9M/6ZbSkOoj8LnTsFddBFrINAuSeblPI
X-Gm-Gg: AYBFou0/UCIEWLmPu/M2hkdYP8sQQDcMs0DLtxjILSDlkJqYRuw6iSqwqvhsfR5Gawd
	SvWKbHEHpgiD73V45nS7LhS9WuLQ/8k4H3VhacI1/XDtBdD5g8W/UGOaPGl8icxfsGcbIWWReQp
	1cABHN2GGGEKrQIeQkPC+ywX9dvwy3ZKPZIFIoKvyGkWOEPovtjJ7CjGtyCH9pbWnsT0hjkuxsS
	ougzQ0QORKkzCS/rBqSpg94VEdwNMNoUIHJjxKOOJC9YyVdcMqq/0s9BxbfG2fav/S6eXdJsZXO
	1yfxgnb/+xu0M7FGYTWTBRII1UP5yy+Hpxsq7CxZcmbx1SPZN0/Ph4zgV4Kf/S0OG5g/OuSozYg
	tEL/Cm8JfvxYjjTeU200YTw==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910501185a.0.1792483691146;
        Tue, 20 Oct 2026 01:08:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1910498485a.0.1792483690600;
        Tue, 20 Oct 2026 01:08:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3af8e926fsm3811663a12.0.2026.10.20.01.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:08:08 -0700 (PDT)
Message-ID: <639549d7-9e63-41d1-961d-edf38f6e5e76@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:08:05 +0200
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
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: add
 notification led
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
 <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX7T8mVoadKzyF
 cb+9W/FXfI1g1GMr347RPYlWaWp5ZAqqRUQeN5nmkcwgxhmcRWmEL2eNWVH0wa9HdJJSAwrNy9f
 hWONj/Il1gdEXqF8YenIowtfBu3oiJY=
X-Proofpoint-GUID: 8d0WVl9icFKCuIZiNVobSVru5hP4IzdW
X-Proofpoint-ORIG-GUID: 8d0WVl9icFKCuIZiNVobSVru5hP4IzdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX1cSlhs66GZbo
 r0ln8p/4m01NrPMTzblayEMWHQOtmj3nuXiER0yw99MuN4mYapdkrunPSrScSff0CRgYqlYmON8
 d/axAl/rAaWcFh4LyobG3K1m1CWe2F7pP0hX0t1s0N3DtdYanZJxK0F3UwbqauHDhdkvPiP/de/
 bzXL95P7k434DI65ay24PxJsxQvzB4KcdiyLqhVbMhBj3D5CXk1od86PpqaQW4V7i9ZVf6Ih5Rf
 tr41yWjywX2qXhcHHs9qnb90nzCprm2BfkuVqnEF/OWw2k8IWY7Xny4v/7xwFSLu/Qa5Dvy4Y8e
 dldxaASiHwY/m6gKvxvHsIQPFDQkCBv2kvo99/m1VJDbz9a/V9Q+ETVGfUtR0Zq7wxMke6bZZo9
 r6CKLgm9xlhat7msTaN0q2IgsnnFqwPJVDNEEoZJU1HYz2hB+4ES6mw0pChjcP5HUlmWjG3CztU
 I/KWPVcPniewJ5VAINg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7216b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=C96mxyFFfAi5t3y68eUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/21/26 7:43 PM, Barnabás Czémán wrote:
> Add the aw2013 led-controller node for controlling the notification LED.

But it's already present!

[...]

> +&blsp1_i2c2 {
> +	aw2013: led-controller@45 {
> +		compatible = "awinic,aw2013";
> +		reg = <0x45>;
> +		vcc-supply = <&pm8937_l10>;
> +		vio-supply = <&pm8937_l5>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "disabled";
> +	};

This feels a little sloppy. Either disabling it where necessary
(presumably a small subset) or moving the definition to the places
that use it (if *that* is a smaller subset) sounds cleaner

Konrad
