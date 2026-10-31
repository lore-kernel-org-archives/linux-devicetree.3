Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483395;
	b=MjMn6itWe4H7XkYm+vzWcn132gGolzzUlaBEN0PFuXvjvA2NIfZQOxV8OzOLQPMWAfZG
	 4Gd/vYmb+wlg3dgS1ZjtHyzQP+V6Cna+2FWp77jrX0ERsOsesKoSXG0TD5SOa7CaSiU6a
	 mENUJSiL2Ti6WUH2p+ekR02L2jDBCm/Sh7fL0nBMh885WaJnzPRDCqlQvUWjs++jJbHRo
	 l/htN7pWAUO/yfAR9RYXpYzhN07JjDhN5blSwk87Yo5WZ8ZPgrnAomU/UqbQLdXk1fpod
	 19CnTm8CrVhUPubU+E2mNvhMQqXVqJI3HizI6TQfnVdS6JMK3TNfgnOhcAkCRw7jtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
	b=neTqftCZDbomaNB77ddf4XkcekBcWbHY6tZz4sOlgJtCZTeooD+uG9KUN1WAAWV6mqKN
	 3muSkEkJKhxym0xqa3YqEdeVVVK1TnfsQNRRPH5F2L3XFIN9IfReAIuzpZMHkuv/Cjt+p
	 QspuFStVUwndNIKkRYlQaeP2BiUb43WfveFi/eBbStFNLTe1x8NjBcMmXzTC92pjq1ZQM
	 bjrzpUwfgONWVebrq0FIHz88l4aYZJYDi5JzLWoqI6qOKFFa84uHi7N0NoBsjxxCBh0xI
	 khfijiJnhVy48bqLQzOZU3ezYhzgBg1pb++u9corGPk5WpdtTSBt6Dr/6wc+hlj0NUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D0606A31F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3D0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJGPQo2973985
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j1mbjZFdOfU1TKJ9RHIWtlOD
	dzpuDSIVrKfpxo914T4=; b=nkI+6PchAxge0VXtleC8xeqjg/F9Te5QKC8yTT4y
	WrzwjzrXcoUIiwnv/nEa+GuwT4Q2AdiYh11Hwziw9FdcfTDOo+8p722PZyqoG2EA
	/OWFNhYGWHrzCpto+9qyrSquHbyhGlYkuDeKl3X52KzzDwMThiFyJ1AKMjFO3jSY
	lfgalAMX4PbQruqT0KfvN6bVsxrNyO3X6FvWhu5ZmBRZ9xNNK4ksnFV7nin7ELXr
	Uptjd1vTA8du/mHECAmZFyklwRpsFRdAk8YdZD789hEeYSPvodPm0lIwK/shKpW5
	L4NF87JwOi1zSch5tu7cJA2h78gMVIc8nDgaNHvKs0xdQA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjh80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c85f95701so38805406d6.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483388; x=1794088188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=MKf56zz8SX9uS8xmkg7JfxvafTZkHTj13emxxlmk8SnLnWW0b9Q9v0apVZRUb83O+m
         ecUTQjtT8jQK15yakHlVcwosCR5pHgYCEOY8i7b1IwensqTIy70INUgM/BBnPRLy1K3J
         pyyNmgmy08QqDsouwpWfdPpR/GfXogVR2r+C0yXm4+fizij4Qm1HbRyaF+1XIE20w6tN
         KsMimH3BCrkNsAutKC3gi3hnuzgZwIEbWL8GCA/dvJZuIrOVYBDLZWn8GRlfoqKeHOIY
         S7eou/TG5Mvr/iNsjYmg33M4TPrZSHGJU4Kdh+ez4YJQK9tycWvF+z363I6ZJfvb+FNF
         QcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483388; x=1794088188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=fQtyhFxK7d+TJD6nmzcXubQhZhpF+BbS93LaHjZq4ID37HETXBFq2RFNC/EMAeNXDv
         BunF69tY2hwnG8R/GLt2GO2JI+cicRW5J32cEhzstbyNTo+YcOtsA2eZ3uM9X2owdNt/
         Sqdj4IsJ6jxLEjoKt5sN0cHqDyQbI/9z8k348sOXSxB4ZSVRv4YETwEjyxtDpA9x7WHH
         amsAu6z7cPPyi1dOmrA9UMnvysDjGiUXQ1Mt+wfcXo+kOnBApIT/+FIkeMvDWWGTlprg
         h4A2iJLHmhEgqX9ATbdYc5QVps6Fx0ZCNsIYMRwti1tP7NZ9LPDrcsuU1UB+HRvsItou
         jL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMlP75iHJCN44rfyIVB7xOUuawik1ZRojjMOdhi08RIIOrDZ5niky0mdn1ajZ7cBq3roc2Z4i6XZLV@vger.kernel.org
X-Gm-Message-State: AFq9FYKGahTGpv12rLzDx0kpcmQL/1H5LOPlaNlRYDmHd1vLcEtGqufR
	W+xsutQhDcWLtLYDFK8qUddIxhLuyuTyOX1ABM6z6hOZ6sZ+gJhMaYW6tlOsZKqevh0hzBIU+Nm
	XX9dfMOO9DKYMaTtVg4Wna6/hi45QNy86itiFt1rv6CRI7+N3dd8zxYj/om+6Xurura4je1LW
X-Gm-Gg: AYBFou2XrLguGJdTOMjTcPETEQvOTSTuKO2D430xkDoyYAZopbt7zOGguHmHmNTG3ZB
	ToG5Xk1tr9WUWoTR2BPFyIRPwFRXIjv1Hr5P5ooG3xYcSQYORyP5c4rDtdm9JWKogrW/QX8545e
	c0FpIIk32vmeqPRzUq8ARFzOoUjZQsq2B9hxbr+wopVtryjA/w2Ahuln0NRMBwRSwMkFuVVHrq7
	FjO1Tt89kc2zJGhY2JqOzi3EPv15hnmSPLRwqGER2/5an98Ay2+YaoE1B2ogkd57SKloPOh1ObP
	QYZX1bADb4N5YGgYfbha6h+A7IDK/o1YSEcZH+U3qgG0b5nq4qosp7fg9hJ0+dPOLsJgM+Jv8VS
	rxfhLvcNVhSbLiztZEcYBH/Nbd0rBuhnJQSapIE1167mlWo1ldk3xXZl5HzwTnE5jlbzTuHsQza
	s5rHu4w4laPXZ3/MiZxA2mK6m9/EVKCc7iTqRYBZY6GsAfrIuojv0kw6FZjHWTqg==
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105508146d6.9.1793483387603;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105507946d6.9.1793483387153;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf2b872sm11304101fa.35.2026.10.31.14.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:49:45 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
Message-ID: <i4gd4zqtjyb3a5my2gy5p5ura7xsu6bqbheigmclhgxkeitvru@y6xlqkmftjjq>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
X-Proofpoint-GUID: P644wkxP7qolAx1azoCn0qCKQL33Vjg4
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae6627c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=r0E3B6ySCoxRs-Erq-oA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX99EufZ/MB+5f
 CZFPRYJfPvKQKEWKuI3tF1BS1SXkzaRr8cHDw2cVzNJZcw2ri65JUa9nAmSfKp2uYa2fvd5OD/L
 0vJ9C1iHivwObPYulyB8iq4bSZqggRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfXzK7IojOkrVp0
 4n9uSIyCt76mYtXCuUtpYFjfZ7sCpBbdDfaByBabYTUseAkRdefYhkHMJFKbqQMmud2vOr+iMIg
 qxsGxL5FE/58Vq8dxnvuVwIdxK969APFsbr9sGi5wfvbA/6pXh7ztq1yTvwAq7x4YtXpg7Xvsk8
 ICF2zJTO6oMVSsWKf/AiEhEuQGHnRsjiwVP9q/BvMf5j2Ye9a9wYjG36BOxQUPxsibulRRmZZk9
 CggZZCzf0telslPEb0sgJAMtUNLqhAO28ADoeCQeue2leVQtXuACv10bOc9w6mwizSoNixWQvEN
 N+mNTv8/lDvp7UvcMtw4mMTRS4BjtLOp9YZOgB16tFHNyr82HjM0Vhz59aLzBZ8DXls6+3LjFyy
 Iu3PhKO8yO9ndrIiZUa8j4xuqhLZzZQURMCMYpVBOvIFaIQmCdCmJTuzkEoJod/FH9SmLPrmjV6
 3aFSkZ6JrsBUttA1CLQ==
X-Proofpoint-ORIG-GUID: P644wkxP7qolAx1azoCn0qCKQL33Vjg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310086

On Fri, Oct 30, 2026 at 10:41:29PM +0000, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 3 ---
>  arch/arm64/boot/dts/qcom/milos.dtsi              | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
