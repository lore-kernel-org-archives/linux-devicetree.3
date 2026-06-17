Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BC39F188
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698371; cv=none; b=UH/LYjM2lF1k+qp8rGJpqofZUpNTx7xJ8WOGwxFY/Z36gG4XvpZHmyP4z4xKBsHxVO5iejrMBVO50Xj+xfQThZZby55RPfsM4DHrf2bak5YQ+CMoLO82e9hYNBJJKHXKfNrGXKdoWHYUzeAxSrnffa0zyvUiMLS5Ws5x4RyF1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698371; c=relaxed/simple;
	bh=0bBGl8veb/tP96Tez8lUYsFTbml7IYTdlypgvfJVzWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2SoJWRpQmEhMeyUnk6m3z4LXYExYcq3prYALhIGBkPgQsp29MhmCMANFXH1ldCfzcGk0vqaejnGmaU2ym+MLSwuM8md5aFVh9g07OQMCmlv2wU7vysabm5T8aTDhJ8DRonKO5GaxbXsVlXuwgnLwBhzK6O0N1tUbf3CbX0MM5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5fk6zOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RstQnuR+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5fk6zOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RstQnuR+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Uh8N1654706
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=; b=k5fk6zOurvf2PaNt
	eQVOPo78fhgQrzRrP23NZ1CzWWw4DYeljgbdrl7QJuInWpSlw12AZErCUAFrgscj
	dhgW8CGaJUk/Ibo6ldjXfjQMOLkDq7H1B2wf9gmF66nYpwHsaWJhgWvEwA+9ucTO
	M5+TkW1sz7Nr7M+cB3AB9yIwViXnSX5BxSxCxub6I/M3bsHmebLb00HYVB3M0OV4
	lK3E6+ZMoxPhyVWKodhsqT1BAX8RfJqxQ6t144BwoHfgE+jmwy81zhGoybuTPkYY
	r3b/kJF2UR29gLzML4DXWRgiqwLp1gLMA4jGyoKBPeBYdc8BOTL6ADAz9J2rBA+e
	8E01aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2ym2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517741bcc53so13867341cf.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698368; x=1782303168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=RstQnuR+oARFcc1c/ueelLaybObBlZg6SyrZxff6EKc5HT4XqFREn0RRrCbLkP9G09
         HFu0wwYbwcw5WmjIuV/r9I9I1KspoK20VGVGerMzcFMyFCaeWf1g6QSdiduW9YbtbRu5
         yndMQYbARNDtK9DX4jrO/zQKoU0+qqxFSXq+1MWuc5bh6IR3xU3OFe+PS2wzi+PXu3xg
         ahgdfRkPYT8tUG0s5fy6xApm8cEXqUnGSZc1yqMXUAhOW7x/XicGhfGPvAy9aI4iXree
         e5Mds/BBGav8lwJ3DkX2fkCDQ5NqIQZyTqfXSjq0wSW1fSea6Do+HVlPWBbdIYKFR8Du
         Pm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698368; x=1782303168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=he8QwDhkZ+Qzg2hYeBGBIpc+UZkGn0CQxHJewxHL86IvSH14qOOfvq9qc1FLuiRFf1
         APpvS4DF/nBohQ2F1VZQxi9aUH9JVnegABveFGNgT/uXjGHGzhdg5CZTlw+ABkhVe9Tk
         bzi0b6Bff4VcHtVTYkcbckSQmlTdw7xKukoZeuZUMo78Rp85TAnvtbVrnpArRmliayDv
         SpjOa2gxOrLtPZ2AJH9UPZDmMTe4hnk8O0EQqCrS4uEopy49m8iYoOpFyXAP9zj5IpGg
         OZf8mdIu1ZrUo3T2ucZsBoOrwcBkNbBOw9HR5yejZ2jboGiLm9ZrcvP8XbIVHawdl5zk
         Phvw==
X-Forwarded-Encrypted: i=1; AFNElJ/tMk5wXz36FY1sUJLWGn3LiITZrOh5biZNFBxe2I+OgAaL/sgWdZTEmmjgAOvaulqmkzjGrG2Qd37E@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaR3Yq42+1Xq7dgRtruV2lOCRtbsxNrAQawtncrQVja8B/h3O
	KYsArOednPax0263CvyygNviEqUelN3hgrq358g8mq5eoHvZkIs3aOn8svNLA7A/Tjyfig9ye/L
	lth7Pyf06fl2ZNQ5NUzc9/zwtCDVzc0xUfKlSI/na4qFQP+ARwz2eqpKluBHVo5yE
X-Gm-Gg: Acq92OGBc3Xa/8BmqXxGCgB/SGJJt+YLFfMY6hC/FL4MOwg6k5nL3tMCnznx7qOpaQo
	GVjt+MoQG6e5+Okabgv/At4ntV7moFFXLMdQnT9GsPhKWbApUgR4yUC1mCneFvsd6vgH715Ugl+
	E4ivgvtYGEJnGHlauki7/UF8Oaoh0UEADTBiDNIk1fjgP6aiK/1Rx7jDde6+h6krJFJ1W/sTBgd
	RBr1PsMSxLTUVVB0U3h9rsHcMH+hFfcUkg8GJhy5cO2u3hwfe7W7sYN2relLffCoaoAA24dLjnu
	2dEu67dDAAzRdOHIEhVafe9ctC0sRLBDbd6tGoKXlG04H3I/OTDjWPBKH7saOU20no9CNRRZKpt
	mEkY7GEzGgA6Th7Qc721m1tQncioGoAbo0PI=
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27927401cf.0.1781698368185;
        Wed, 17 Jun 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27926871cf.0.1781698367625;
        Wed, 17 Jun 2026 05:12:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dff8sm6308440a12.22.2026.06.17.05.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:12:46 -0700 (PDT)
Message-ID: <af46a084-0544-49ec-a75c-70eac0d0ea49@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:12:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
To: Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p5yMYG2VFE2wYshx61hkExcU0DEcH-BF
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a328f41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=t_WoDEAhxH4J7FjSGWwA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: p5yMYG2VFE2wYshx61hkExcU0DEcH-BF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfXyixejqrmpBn5
 kkrX4GWyuhs2RtZzoCWbEv7/lQ8M2oqVd+1y5kzgnH18KTP4r4oL4wJDmAbCeJCdYGBib5vncxV
 51OgyTpQ84srA7W3k877+wJFrRBTNL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX7dsX/LHZoHB5
 kC7NiaJeb+OPpAZuoyd/iwGsEcr+kkGQnrmpAWeq5YkmmZxjtG/gS3E/HwBLAOg2ROXouX1j48D
 eHKMbv5AjGgyFt2vwwqtl8Ce5gnU2puPZrK4Mitt7elxvSc00wYboUi6+1zu9+eRNzyGGza226M
 YlBnbPtTJ29IEnmvAxHk0BT6WOovC/MVmSBxc8ORr8a1fao3rAND1PS3EORrUbggyiPwhpbI4f2
 zay98POTMJ84fnU4eB/R+KQnh6soj68n2otEg2Ql70g+pfbuFIED2HmuhsYMAg2SqCeY5GGsuQe
 7gjB/KQfGIEnqpB1ZVTwxaD2rSNgNDGFJ3JmPw8/1S1tsFAqP61U28x0ZLXY6ZyyfM+G1ncwRR1
 3Oj0QA6GW7icZNtbOUoXnxLGGpGrCwZbtWYeLSoiYR/DZbaIWEhAZNxpbEJSYV9x/iky0L0mPIc
 0+/aQRfTDiooVGDb/FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170115

On 5/1/26 3:52 PM, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
