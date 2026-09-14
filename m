Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9213B583A
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371804; cv=none; b=e3dPLjvkxHvPzq+bafoeihqCgVwCrPJG87l2+kEHxsS1jspB4rsbwTeP8qRnWVsFBXRs2usw5nXFU71gVrSp8rSkxX/p9Sfgxcuz4teRu9ibADxNTMM7snIHBmvg4EpA5YJWqtT1qwQLh3/fCY7T5Rsq7Z3jvCorenYW3sp8Lsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371804; c=relaxed/simple;
	bh=fqcikxls2+dbYxGrqjqG3drtGjgGan88xU0Jb+QS78s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiHVmtpiyVC8kbTKljpOQQh5wo5J81uIRl1aWKCK7TaR5G4LmRU78yCvtU9fdEkvBaWsTmdVjOFhddmD8h+qddL77tGgQFGZjiouHXRrWE1PebbUOh5FnRsOkEPFSXAdy0I4Tggzt+BSBuz5/XgfG4ulDAFpVKWrX0f6OMBJRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/32VMLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id1NlDha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/32VMLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id1NlDha"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0WP3369533
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y069kMI3LMPmd4YhgjfkMBHC
	y3CzJVOShN20mUkcnTs=; b=n/32VMLB1DpCAwk/jtEaVx9KoaWPZpgaMOOm/iBv
	KodGppiwQFbRs0gbkyluJZC4YIMIz3J8FSVpz6jS/fRrWgnvvOnQET33WiNncay7
	dEfG9wHQ02jHNayWvyfVV3K0yZlndiuSt35EE08d6Kd/kvvNMgYtNLhP8uf6Qk50
	+biodU8ivl6oaKTsu0pwKIjh8b9Ce8LS8RkVX1gGc/d3zuXQzqpRqSEjfsQ9xIq2
	oRXexBe9NFVyEaMbMELywyQ30g7x34Q07xXfm4iDQV0dmeQKmet51eb0KlmCJJc3
	bqdyhdhurpKyws38JroJ933OpzgfMDmPGE6mszUUFynaiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5k9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:43:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9102f07f2fdso78236906d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371801; x=1789976601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=id1NlDhazAyYQbV639WDIuWAH2V4PWnvwvfOKKDPUiihKEZgESqJBUCiM4hQywSWj7
         6S7wpz1SI6wPYO/FpJmJMA5YSarLF9dpbmXiTStJ1iZ9F8UNjGgdqYNmgmJvnZhpgk6f
         5yv3D6KdB1WAwG1E1bak4AF+qse+UJcjrLl9PzWWpQ4tZZ/H5wmPyupJDzogw6diqryy
         kh/n1CMldxygx2yg9RclFUhPsEgBbQVb2GU2E9d9UL++LIGKHfI1tRNNJk2JilMEmGxj
         Rx2iOdsRsL77R1QyyjBfJjkOasgNSYR8lLkDyT3M5+ZIsUmF9ff3GjbyY4BofTZJcOWx
         MBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371801; x=1789976601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=C1q+X3yc6pXVesGH0tWQmJszj7IrNJUr6OllxZxiE1/sMYO/czZlLYjM8HSFELCMmZ
         YSPhn+yErCCoF+t76k7ptmQONdO83Upd0yXWK+PdE6qXh5LEEcqlLLzbfxrngB1oQQ+x
         /AhSlK79WPQqHe/UkQ7a36MIpM1JmtUrE9ISEIdD6qdFikzLZw45D60j1EPRU7y9MW1G
         4eXAH0YPF9CU876XEtCzjgpMmhE959GRPsa/LrI8g7vS5tU+MaDySWD1WXRU6Ffr4cyE
         wwK9rWJoqxMPpHKHRjKwLe+M/HmwF5vTK/lRrdZXea10mLapNSCLPW4A6N3MMu0u+XgM
         3p9g==
X-Forwarded-Encrypted: i=1; AKwUvBw2rm11BbJLs0A7dEkKJ1sDZOYydcpCTsgCTG+tKc9s1hOHyffrgLEO7ecSmwXv5hi9FN9d2TsU+2SY@vger.kernel.org
X-Gm-Message-State: AFuF++mZ274xT59lHXg1zT7/uBBK379tZZktO+BKLZ1XqLft/ZttKu6W
	QF86a44IeHsrBuLdEAeTcTt7uhJjd+UTvE55tT54ITJQBJ6GnBzFyZo76zFlbOjy8bG3thnlXyQ
	QnpLeCN3B/W1kc839xI1hUVPR74mpmB3kYnC6XHKGA2Bqb45rXCf6DRUSWsqJiEcXNTUDeP9a
X-Gm-Gg: AYBFou1t7DZOYNa96uyQGnXswX7FrCFKrrtekYh+S8fbpRiudWbWLRFTOQWiFUBc/KK
	XQa/0qIefj/g72cyfiOs3DC4aiPPHLPZ677RhFUfIpXqk0eKwoKs01GC6+J3fko2lWqtjeSQ0QT
	JzAB0Ka4vXuXOQ+CcX5Ic3y+XgLDJOScSy+LDJDia/1lfz4mL5PHCfCxRvehn/QCf1JPcurzle6
	1Ju8DMoqxn8DRyfMwDvmBvU6DAZGXdGmrcPIcdGnKrVWnJgmRA2yoNkRsN2gOp4qsJ5I8bgRwiU
	i299EnpPN6MSRrXs+Q2xIhgD3sgmKEofv37b1u+dhH6XYZ/RN3UKdh9KxfdrKqhU3EMCjPcghCI
	gYFXxI1RE/OB/fQ==
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501247585a.42.1789371800721;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501244285a.42.1789371800073;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24639722f8f.22.2026.09.14.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
Message-ID: <nm7ds3j53rtcwdviye7mt4cirkpsw4deoiopah5fvqd45nrqg3@vvosfg3wn6ii>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a599 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXypZIesyHv2hw
 fUEqhq7uYljS9XuMGfm4VrwH363nMSan6GpEykE+BXAK8PdyVKRi4K39MTXTHad+omRP77/kQJP
 fSfLouJQyFpOXcgzkSIA4UOdgJf79g/tRSeTq2X40HZ1k90bR3HTcEh62E1h4ssPG2JxkxhTaoG
 K5QgTzyi+W8vg4XlBnCABL6XmOk5tTI3mmYw7sXOSqwossQ8YH6qczOKTsJEP9ICWH7ySw1GBz8
 /VbF445Hxq1hP812srx0HwFncHvMkJCpySUrGmhJqDC9x3vyWMYPOUMykD1YPEx+s1QSTpTnauR
 LIPm5p1U1X6PD66e8ED9GIx409HWMWfdkXJAx1w/25CuuPcRCHV9IGHveFKJIMoYSMhheLq9bDJ
 lIGPaOEk/4soNdQAwx8xErk4b+nAtEbsNOE+wFKybhaHBW8xx+Qdkwv1HaW4jqZWWk6ipH0FZ+a
 nGNCNk3RUM1f4ALPhNw==
X-Proofpoint-ORIG-GUID: v-yFmI8gHngpuJCsdRkm4Rtf-q5Sql4e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3caLXRa4Z6ld
 jyYIkE5JPwhK2ieIhJurRmuiyCeWxFUzGRgm5Ms3IzEHFUm7DAQcIHDDyoJToIZ1pt000ScOH1H
 QWCKyBvhA8nrSQvvyG33bGehruiHOrY=
X-Proofpoint-GUID: v-yFmI8gHngpuJCsdRkm4Rtf-q5Sql4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:30:01, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
