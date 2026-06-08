Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E83AFD06
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910424; cv=none; b=nTvR3te9Qx5mpejPihLz5+aN+5bOeF1ais6AzcbDoXYO3TxG/Tfi0XJItSdpxTFaYU+Mjjt/brggkAx5KK3y2Ma9+iB8ytPt1JznV/R5QtO304pfCPSXawMHTa4ZrjdDkFzuO6Ra2sJEhtcZ/JbOGfGeurO6lqRkSZNva3NVVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910424; c=relaxed/simple;
	bh=M8vsWRb0TduXx0YG5oELTaktxwy+AF4EpPg7vZFUQNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enTb/WEf6ERL5Et+TRzEY42qeCsDptZgJjGaHx2upKvSFqFwOUVdDWygs3CGOo1GiGGLcZJ3YuLJ3CRoSQuKGKEcGR3c9Rn2OtIT4wp+7n3tSHVK9lhTGdVbgDRW36LhfCZ0qdpy9jg5baCy2ko+q6MFDnnWcI/1ZhLHfUohbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVsxb3vZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stooarc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVsxb3vZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Stooarc9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892Ll42677815
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=; b=oVsxb3vZJo3IEM2n
	aBuTw2hwO+1BQ4+9tIp600lni0p3ZkgxdWFKzPmFq/1iWAVYUGURIWgz00YtFHHM
	9TN5HqrF+ROXpDylfQzWQD0juZx6nGHlksiEEasCEQ6CqFZsT0VQhYRLB6ytkziF
	C+Fpglq8OxjO1xIfHUkrXfz0lf3eixkDtamDfmIMi+ZD9+sj6Greof6SMa3deG8b
	ikM9mKZWcmDHoc5yCgsfZEpAPwNQ1QMgU/h5szLDsuwjQeRD+pilJWwjajmDhkRq
	kfg/YbYbaGt07c4HfO4hme0XRRNXd5zodSnHMqnr5fz/YeSuErsyV1NgseOBi/Zp
	1ZuOHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkr2x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:20:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517796be724so7867321cf.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910422; x=1781515222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=;
        b=Stooarc9GZ3sXJVAK8jskXIYnYk1YRxFGBC3yeGxwy7rV0aZq5tg+eMglqhc/wch/K
         a4Bcp5GK7plfORvicaYkItjn8OOfEXc10fMy9IEBbEQdoDYsBfs5xWIkK3Yw1lemBgVZ
         BX22fJwq6ALu73MonS1vi0dKP9a6XuxdhgS9CU7WJLVI55amY1yOUsgE5zxI4dc7mE/D
         8pAeyJH4pJkfN9lbgGjqwDSTvVX+Arvk06kquX/m3Zimr3OLkSHprVwMrKtAWxStLKGC
         Sx/YG5k74lIDD9uJiMqSKNYw67dHE5s5Ex7FhSeoP6O1fFTK2qqr8kSb1zZwfzMZxA2y
         2BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910422; x=1781515222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=;
        b=KTIztgQBfCbh9sHHSClvxWfJ9EGpe1ZSHdXCngUGSuVVGK7V91oh5ifAtngbvJmw85
         NPfCt3QZ7coouXwYDx4u9ntDOxAfo7GQ4DKWdrP+ZgUBKBslMtFHQL2j4y6Cszt2Th9W
         L2LzLYxjlY03U5jUKlN0DDFk4KZe4+x6KUCCG6S6Xq3x/TJubBQk9y2AzvPNeWoHREW8
         aR3velCRsHhO9bE3zCMtmjUXfWaqJbkyfpG7sou63w56TCC6G9mG3iAcso9IPKHwpsOS
         YFnfOaTUbo4ZF8XggVW7X0Pq3KiCdae5dvhJCMZiN2VnSWxQsnueyV4N9ubPW/bk5n42
         SioQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Sm/6ZLcKUNTQzf3PvzfehUeU9/Ma/DmTxUhgLSpqsYSYNhx432c+hIuZQhoUV1EeDkzEdGLOnrIrb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TwEtJL5/8MZCiOoHIcWuJb570xotzMdGzUZ6zBejPeUQ8rXB
	BBPKvzmE50NW2L9j1KWp5aJElPi6dfYCBqjqrvzaoU/jGCUJKBVOH2MKtp3Qc296aH/ku9hRM+/
	aqultCtNGSaWJiuNQGEYEHDJfiYd9LPI5Al0TbneHN2TIkk94dKdAHNo2s3lEvFL7kWLbt/3q
X-Gm-Gg: Acq92OHLDUFtKxwQwxC2qtjjbxSnnVxaphHYKL37b/ghBp9yadjfuJu5PCnKvh2xzIU
	a4ZyZ9CWDteaeOAORLM3LKHg4OgHsXi7z/j20QxsE9Xd3k4op4MeHYdq1/OhvSirm5mrfFMiynR
	Pr4g00dwUmQZ3I8y1KSrPgpJ2ZSyrjCINbFBSam+HzXOR6Mez4/kE6J0lsd3LfqH/7ortLUqbVV
	7PbCkVQm7v9ho/f3DAJI9DohYijq0hZG27uHwS6Z0iN0FnCisUVzKQGt/3qlTRcRRiz8JFpw8QB
	AeoRnwdp6WgpmOjsGDcUTwtklxHy1fNtSmzvmklStTa1lJ9SmNSN4OwhtzkYRZ2nSzzWp/WxUsJ
	NPAflLubcpIZlmGgLTlMpircvvKvGMfvpKJnRZzHm+JPL1WAywc0CAT3t
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr122139671cf.5.1780910421711;
        Mon, 08 Jun 2026 02:20:21 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr122139541cf.5.1780910421371;
        Mon, 08 Jun 2026 02:20:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm844359066b.11.2026.06.08.02.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:20:20 -0700 (PDT)
Message-ID: <11c9e2cf-4fcc-405f-9ba5-934025da3341@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:20:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to
 root ports
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rosh@debian.org
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K6CxJH8qb-rlSGMRFrodx1RCcAJQK9uO
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a268956 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=8ikbXZtZfkZUXiAuQb4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: K6CxJH8qb-rlSGMRFrodx1RCcAJQK9uO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfX3/8rFAj3mzaC
 AU+lNthaooLkAi34K+1DKCc1Wp+OZ73ONXLUuHhHoa5wFjVQRHZe0IxxMKgrmS95wDI7NoM65sB
 N4St5Xm0wpn//SHr2ZaVEcXrLMgmbTM/EFQVSK+0yIU8MAXWb2AEUKKDl8jwnHFKB4uAddmjH6B
 Rz1YYqmSOaUIN6x3L/FaYgpd192jvat7Th1D4qceVEGd/+NND3WYl8z5XPxgX8j6EtZ+gwRO9J7
 h6X6p69xUCpvGwCyJQnqIpoi8gQYkK3azOjbMO8GA8G6HgS0dtbx5oS5Ujnw09yTSJ93GnyHaik
 dKXpfncEluSbs2ceY8RHOF6dU8qFEZXbO2n9cdwuvivwcPTZFyW5J5Ln7COvjskYsoHcHgK1tlI
 piKQkLd/eLYRZCheQ91QPH3KjdI8W1NfdQvg6pgn+j/XJq7lIsiGShZoKyySv47UscQSEZpRQhN
 G9ykkD5HKSFB2kPvJ7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080086

On 6/7/26 6:17 AM, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
> 
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
> 
> Keep the PHY and GPIO resources on the same root port nodes so the
> Qualcomm PCIe driver can parse the root port binding instead of
> falling back to the legacy host bridge GPIO parsing.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
