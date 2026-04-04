Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77C30F548
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336729; cv=none; b=moWZdPTOpcQoNqu54MzHZje95sMD3aPODiXscDG49mni0vGXNYXnjj7G/5LYM2iJSTfq+PMMpFFMBwISV/S9QcOO9xApm3wSrd+gtOcCi/4PR5e+RD/B6ZDSEYwp3ql/7Db75I5U8orSCPvbdmdtKQDW3CleGCACBYOqp2wJyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336729; c=relaxed/simple;
	bh=HM5G1/JGcqaUtlq8xyprvI73HlG9LDW3DZ6aIrro/U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYB4yfWXCKG+WXYHmEv6xET+RS+dU+0QzUM7TJDTjtA0iJW7UyWVlYGhpz60CuiN6iNeHwM/GF/EuiPEmyp/rKVy4G/bwC0SNO35rxGhHjQHxVZQHu+4tyE2q2TwoLIwKgwYoVYRRtnISUTqlvL5d4HKF9Wpp/madaF9CEqy1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ7FaHDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy+F/4p/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ7FaHDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy+F/4p/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634IpIrZ500814
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTrkVv7RxA87UYtedNu+KTup
	uZyd1sP6sRCLIISx6CQ=; b=kZ7FaHDmLXN6oTi6I5w9qG25oUao+k+BaNrSKKUW
	uxoHpRmE/Yri3KEKo5BjwBvKhFmmew5GTPrRYRPmlRaaJK3is0cjoJLKAXPkZLiR
	/woeLPIlN/gIHsSDrOReZRXvN5JpEKHccvNU9C1p/fTb6i+u4GO3DekIaF4Im6qi
	nfwaT6/wvaB0uK+WuBWf3Ck2Q/tywv3n8CHka/yfPS5jLJEJvJOXDkxEmkIt8Djn
	KyFNTS/wmHc3FgBLyxpjaILtfXaUHNv5Ui1wL+/o+5QR9SPtLtQFeA0dTUIJZWp8
	uHf7MSsKiMXmLRZSnLF4Syh4gKPs1gV1YP762srdC03hbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sfkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:05:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so9075391cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336727; x=1775941527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=dy+F/4p/jHQEBWZ638NIkkB7NofQb0c7SigbRVXNvQGtL6DWUqqGfuS1ezve6PuFal
         XaPGOF1bJxK4m1fGl5NwhhZIcCfcLbTwTQuD/tCSe8tFYrFGd9rh2wDwwXdZCirKfIKh
         L1SOt9MfUojEU35oUZ2w/66w1QJZRoKCFg6vz4H3+XT6BlxN11n+Rjp4vcU0Sr2ZlP6y
         UgsWZgWSslGhKOS+QRchCbuUCnszZrcIh5ZM/nuN0HP2YQZkFY0vjJ705/2+Hd/ynHj8
         CeHMm1xj1R8ExNGnW9JXU/MQAgRT6DLpDbRTRv68zz9XKSH3cCNUO0NJJQwM2+BVAu9h
         KfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336727; x=1775941527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=QthVOlryOCSVOoSzlG9OzgRRO75xcBJGCpu26ScqbwzaYPS6Nu9Mx9teS0g9wd25CR
         XJjNuL6AI0zNOMop9Vp/0WoGjqmCteN3QqvqUFYZAaxJq1BcXEohL8qf9bLjP2aBpG24
         qXXwKf48b58QbmohfVoO897vVYYj3FBj9yp+BfHN+Rp67E4Tsv3JhpqCZMX7hyR2J5nJ
         p+tNcDs61jkHkN3TuGKncg9zw5rAsj3HrA+ixyqUSgYOSdkcMPXSfRdLcrWh/e+/g4eu
         5dbgh+Y6Xniv+3rVwNAbVKEaUkhXfpR9Z5J/XQu8HE0BDHxlICofnDU4cK4vC2D3mfLA
         2Dxg==
X-Forwarded-Encrypted: i=1; AJvYcCWLwtLo1Z24Gs58lSqgvTrkLnO8o/r9Cpk86clDs8PcDX6q9vmLxbzXDO0BrFmRlo4S7tuykKswPBrk@vger.kernel.org
X-Gm-Message-State: AOJu0YyVthaAQp+oUEtWr/BZ8xhCy8AyzBgXF8KepsarXk+MKKSyfQ6I
	Kw5m2LTfnTGf9+RvtOSRueEXAVdNJ+rOb//xDUkktfHTmQMG1hkRFfG/txDqP7vtm3nMTFGoLu+
	1ZVDw5MGX+5ZXA5eRxaNu4PDGuVSqQJY+eH4F8Q1twiN1+BuVH/ypyLbZN/mfIvOZ
X-Gm-Gg: AeBDievMbufmZhvFGYkr5mkQf2qCPCQL8mvbYp/rKwJWPnV9pBjIzFIG1zb/rBAEHsn
	CnYYbDtBYrIWWeVhOZk5ITHWB1amMH+XJcavsJDk1ULZhMXNZ+pFaOZlas/bu1baD5Dw9ULbXK4
	wgvkN/m154SNQnLkHQP0uph/NbylkBkd/PXZes4MT6jiBt2Xdt5Y6hk1aFODGzBNk1RZnYySN2R
	gCf56wBoewWHr9Ly4BBWajScPNADIhWIYaRJ9+W2O7flnhQ6f/ry3vjAfKMq/K8Tvw2teBzmUbf
	fYFYoLthiuuQoEkuhkA8pHhRbQomjnv3oiZFmi7WahBf6ZY6eI8ECfX1v2kVhfeKZD/mhwqHQXy
	TNigtYQye8Kob9XnoYKsCrowH1NoKpIElbBfwMOm638u8eTdCEDZu9BElR4pd+hzlQcMzFRisE+
	ZbFPk9L+YMuhP3RimzFxgFsM+m+wIcYbJMRMw=
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22878131cf.20.1775336727055;
        Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22877861cf.20.1775336726595;
        Sat, 04 Apr 2026 14:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cb95sm2274374e87.23.2026.04.04.14.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:24 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm845-google-common: Enable NFC
Message-ID: <3wejnbgrlcyagt7eqhrfqm6ih7tyo3kfgmmmvvwf6nqdr4y4bp@rhuihdfu54qd>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX6ihKm1H/9mam
 hBXbFjJrYTJ+QzRCi7aKU1Co08AgsRUEHj23XQYkRkyGcjjaQEJDC4bqYzqBE6/kXKRvJGH5lqe
 RYRIYS84EYQ2tLs+C3jhBhjo7PJLZsMTW4a6LEn9gU7d3BNhJ8RjSgbfY5Bd2KdaHwe6OYfcFlv
 50vE03C3iy0wOqHbT+5sS/e0HYJrop/5f20ggxCjlJG+NHOiYg0wghEECkTZjDq/HNGziCmmj9U
 1gRzPY7JvLWEWcPtTvMsuOu/QOffnxOuAdQKcnCkkHVK1UbOnN6FSSQ6/hVTcubU1KkaPSPEc5L
 4e52ooI41Cwx0grL1GkJ0Y3VoFmbBsU68UlUycqFgbe0WQOZLxlGysYvyU8pwdl2E8OxzTGu4AZ
 oaM+qq/deWk/nMSdafuUhTUEKNP26zk8LWIEs+i3i7tg+ftHYn2OuFOgUKROfcFS1MbkMPVGrzz
 hWd+RkieDXJyn4I0zXg==
X-Proofpoint-ORIG-GUID: eDxqryGeIiVbBDNPQIOJZ8kpOvX0TVIp
X-Proofpoint-GUID: eDxqryGeIiVbBDNPQIOJZ8kpOvX0TVIp
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d17d17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=k9HIGDZ-W5ShfVvnVaQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:50PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN557.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
