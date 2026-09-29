Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C412526A9F
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687922; cv=none; b=LXsBZNzCo/6uZSN4k6IBzdeggPodbLa92L5ZBjrJb2ZKTBbY+p8ZbDMUL55N9US8OxfOnzkf91kCrTXwt/mhw4IjUrP7zfwEt8T5R7r0XN6WuGMQjvU4Itjd4aYR9DtxkIf++U0zMh2ygdkiN4Sh9wquxg6OigJbN0qRs1kNPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687922; c=relaxed/simple;
	bh=RghKvJeq/ErdFxSsLNsy/c0hNkdHN2XDzC+ZRGXIV/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VozQ21LIxkg3PnWv1Z9DJ90l8V9oasNt7qfUeuAog4qQKduBqOPiYjJFK0kHUAZ4IfnW6hJEM3Xxd8ur+pdMDmNnah973qTtHPwZxvo9Y3rMpX0DI/aqhVHuMnK/GeqZ8HMJNXej4C3aQGP9JuEaOgXCifUwGEryNnskF8aH2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiJ3Ojkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNmcU8Vi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiJ3Ojkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNmcU8Vi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqqtD613920
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=acJRYFzUEXib4HZN5FmHHyj1
	2VqTvFrBKT3HaFCEHIs=; b=CiJ3Ojkj0QB/PSzR+k1LrgEN1IfV0teEtppCAz5M
	BIVpvRFx0V9mPObW8fHRfOF/xgmfhWnndMwT0S96DQH5A8hpoEjm2G/CRviO5eJg
	C1iIqLiaULNFiEUUFYP2wuVkjSRAyUbd9EEYV85rDNYcRfY/FZzrSEzP24L6Dt/J
	ND59cZ11AbMkFsjCY+GLuqOGlbBqHLukPauhFqKkapqVYxUc1Bas/1Jj6mxQMtel
	XRt54bdbNJGPiuNM1Y25jCSbaopwK4wIk9kVL2qzErY7pdlYTP8v3GvePY1AV2FO
	fPaoeK6g4WcntlJ338Jkfak4c3oGTaJFRHGe9d4PCbLDHA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2mvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:18:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988b5c59668so1258117241.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687919; x=1791292719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=BNmcU8VimqMy4z//EAWYyekU9aGO5BWzCFR9PTlIHX4sja5QqYsoq/Vma5qSfaWd1n
         Il9Gll+C3qjHFI4pF1lG0C/qn2/+WsUIJviEZJYdP3HSDv8Xzl5vAApsh5PUNj2MiBjQ
         Ygakr79hzky4Voy/aL9LN4hgIsIzBLGwpOLdkpUjT6BB6dDwxwcBqSpG7a5wOP45fyAv
         /dKliVVF1acilpzor5+RkKxg1aEhLTkMjzb8IJomUF5TjqroCvEmWL1BvmuqnJ32Hqvf
         nUlFL/Bdhi+jML93iqClKe2RTmV6k42iZjgzll5YzqpESWNYYs4mSo+661A6wm5DW0jT
         dsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687919; x=1791292719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acJRYFzUEXib4HZN5FmHHyj12VqTvFrBKT3HaFCEHIs=;
        b=lPepN+f2ZQ711YCHAJNoFqsLLCFg0RPOG831IzvvhhMCRa2HJdWNRCgOkCX8Lqj3kw
         ZYXVQkJ6KErVjH6blpLeDVTb10HxM0E0ngiic9xF/oaAtwNzmEw5wAdg+geRFvCY9+n9
         kqzREwPniEvnlyipc+poRJSqxwhIcR1qGsBSrE3dLW+z28ipxPhaRhtVOJr8CRQtUWqh
         8nnlo2cdhEzfqTEX4fr16/PTIhcKM9YKzhJHS4cdsC0pqpLbhh3afCHU89ubBknDcgxa
         rEesLOmDAo4Iil5kGQAZflfzviLf6PrXm49OHkKNAG3RkG/ppVaoFPhWI/JtksHAXHIS
         ddXw==
X-Forwarded-Encrypted: i=1; AKwUvBwfAsEhs5WQqcpLw/huS2LSDOpgNeBMX5edAxA5GHFBpE+KRhT7JK28uTAb1FZGS5FG6/H3g8RFWclX@vger.kernel.org
X-Gm-Message-State: AFq9FYKPA6OX3kTPUrAk/W403OLoWnIvcM2yDrPqluG5D7Ce9SXp7eD/
	bUAND5kRTwlCEq5yLmAFSSYxix9q5SqL+dsmcNp7qOljUEDLQWuSpsw9ZGX292v2O2RECIah2cC
	eyj0XyU3dQqqG0OnXc5KRX05kq+NQeUzqZ1X7xk41WN7F8GW8b3L32fHT3+ALJFFT
X-Gm-Gg: AYBFou0ayIq9ckH7ie4bm+OnWAfMFNZK15rzHnM3jxtC3QDT/u8moluHEXUzJ3fAlnF
	qg9GsEldwu2z7c6F+6bE5eVydCOQee43IwJCkAx1uWdToj7eU8nHgTxOUf3yPzcDY/z3R2Ksfzm
	mNn/hlY3vo9TzZN+/USNpere/SUDGG03iLXr10eubVa5ZTUq2Q8OnrShFk3wCSPn6bldL1CupDr
	ypUh/sxj52gnR0cChDPu67MWUuWCkPhSazwgQtIb0nfooM9DHrjf0xORUvttFkq7tifI5y+wRR6
	PBginNCRc1JoMF5YP0TFr12UD2btzlUCN1QElqmos3e/aJhPNcTro8GNyGfav3afwgtTWhchMGR
	WheqoeYXBvflKf4k=
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523122137.37.1790687918780;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7b4879cc104mr2523103137.37.1790687918083;
        Tue, 29 Sep 2026 06:18:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af509658dsm3582704f8f.32.2026.09.29.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Message-ID: <4d44yw35rdxvkvoufiyscumsvzrslgnvzoqpcqs76m3qn53c46@tk4rbs2xal2e>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1H5+dS47mwtc
 1qtuQ3GykimqFo4GeiG6DOrCdtVWb+Blb2K2cNjRl84gGV7KrVsAoK1jBhUZAZV4+c9YHHIKZXY
 pdmZqgRAKqJYlJ/rFzas9MhAvNhU/cg=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbbaaf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9vmGTkFWgVzo
 2p5ioOuTC6GPpONoeNIYUtjklg9U3qxtY6UntIWnR1jFG8l/sRBA2Ffsxh4zN6EYPRwprxva8Gr
 PROhhnvULgEpFch+NH44DKPlSEU/O2mLVYN4Fk4Ruqz42zckNfVsbEaDFCJiWN0B4Cvfo7lBEuh
 C9az5K95+PagegIzseOux1VMfEcJkZNDuWFMRCk4pOa6amMQgPbbg5tlWlBLPrOZ6S8rEuykQQ/
 XNsrT30cnkCKG30V8BrqPuBBK+3ggRMiWCNMhgy4HnJ7x2Vwge0rSZ775dmzr4ESw0YNYpcW4Oa
 tt7ftKJOWJgXRRJ0+/6DQOIuhYka7aIkruCeK3BJAWBmtThCrVlytd+eOMbwkbofcYfJ1iMPd8S
 GBsV6ofyk38SocnRvf9qNEliOdK2RQeOrEp9VpfX4+COgoc7o3wGL7LN+83Efj6EkhAxm3O5Dpp
 Te+BmGj0eu0atFo0d7A==
X-Proofpoint-GUID: r07eh-y-tBg5Y9Ht3M5VT-l1Ca7RuxjK
X-Proofpoint-ORIG-GUID: r07eh-y-tBg5Y9Ht3M5VT-l1Ca7RuxjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:38, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
