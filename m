Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213936;
	b=d2AZk2tth5dXvZYP3NDeO4DEzYpk3t/upX4CV5vXOu5CW5VCGZcfgGvKcx3M1kCIkoUi
	 YnUNXAEMB3hMwwgZkghvNo4f2mhBRgvMRSwKp4hGQjMnVk3M4l8iDL8vV3+yhNn0iA8Bv
	 LASFBRH/BD8y9t0fRdpCoB08ioEIOjQcC2d/OD+aMlAt7mpp6HHNR2hTq5a6JNVYEZzUR
	 u4DLEWbbBHgNJadp35Zp86gHnvVJ0xBrhlAK00oglM0hSsUdDH2OwtKDmQ15JxBP5lhNW
	 xwuSvP/eL07k6CGQ31tJJhdnZkDwqQWY1UT7RSuG8RdDmehDl/e9D3iY2Q2uZh2/DNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
	b=sYVcbpyegNy1WyFRGkLrJjsI7r+S+0gwwe3JQNXmov+uqqdp3A5zkeYWbSUvePsj2e5A
	 NgAJ4OIcWBMu6su0w9TdX6PKe5vYbYmo1gxVJgtOTNP8P53B7AzzIivrRAFSNHUV41sPN
	 dnCNXhzPHKZYZ/ImrOPG53I+mR0hFbxQMy4ZY+kgV8oJHp4wgazJcuPPox5vpsrRByFgP
	 nSoJ9vUvA6LsXMzR07Hu76g0hz/4M9m7sYKBJlmseV3GNH8MfyX3QyjPhrXn+VrkIdsQ+
	 1Bk6Ue1bDPiqUkO/hQW/QkKOmEiRUILhWH0mGcdPtiCcyt1Xcd4hZJERT4OkY2D+9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej1WXG9S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDB64Auw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D75606A330
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D75606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej1WXG9S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CDB64Auw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wlq2668052
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bve5kvV3t/3HY219svaq+WRc
	dTGX0LKxdGdyoaAD/Sk=; b=Ej1WXG9SOTLTwU20kwu1SF209+mwn/G0XnLH+DV3
	aqERRjYQnbO4dVeOS8dQK4S4DvojayoMrUGD2pcKdSwsETdyo8/WFrWbNyEcI7Ur
	JzNw8Y3QXlqgaBFOoZcXL2Gd94Pa+OHLW+HK6P138tfdbNgpPZV3Q0QsRmbrNcMi
	+yZ8RbN5FTAJDtteHclAMtvH69vnVKlFXbNtoiXJNxLyMorh1KR1o/F3uf6HbLQB
	8Q46jhF+qeMSB6LvGjWVf2prUs79ekbylTmQ9o67fhsDQDailo7J/HGHA4daGpIM
	R/N1aMgUEs5P1QYAUl1djwvWU1h/9gvovNAdkbMhpMFFyg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99n9ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:45:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so691766137.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213934; x=1794818734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
        b=CDB64AuwVm1F385yw06oNYoftBDjxSMhgqdUlclFmjwzYWZ4WyOpCkg/jp4QtvEKG7
         nD5u01BIKC2b9SEynwKaAsPMA6mPcYh89jlChUShdoAjt0m5e6lpe6ZO7pMXxyQtByug
         ojqt1w1r9TcfXPM/q7am8FlWJsLjE8Klnjxxbxhv2c/FqCxG6WTuO7d7aweWtajtMMPz
         +W8PEH/NI3sU0S08unifZBAxzzYl0j3V/LOomdbOSebwcU2MmiC76vVcvnUQeAnAeD4m
         ff96Os6tQPbUzt7Y5Od6gk5pplgiGaaEk65d0UtjSmsWgJhazpgI7M6s34eAaD4DXmLg
         iSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213934; x=1794818734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bve5kvV3t/3HY219svaq+WRcdTGX0LKxdGdyoaAD/Sk=;
        b=vUu8R493voQGqEQa5rwfb99Z/44wgS1jSBGFX1vV74qzGgoH4A8SvgfuqIBRzlgjAa
         AlMlemoeY6lfdXTn7NF3V4tv/Gqf/C6f6WSvdFFAvZuwrW1j9+/tyBdPW7c7PlFC5LYX
         7VnfuIAeeM2Ik+MGDiSuOEZPR9LNHG7pN2MwDXJWG02V9SlgbkcX/o6qL92emSGXMiiQ
         bD3FoOwfarLoOPhdsVZdU9+um6Mf0JBJNjbl3e+ClJD0O8kaSgMvWZJv9kXwJWrXfA35
         6O9Bd1TLnTPWLy1UkBZNyApNA7mwNBKi2eF8R4K5Wu0yp41YiXO6g4zXCLk9c/iC9oRZ
         JQBQ==
X-Forwarded-Encrypted: i=1; AL+hErEGvZm/6yA4oTYtjpbqQD7Q3gd3SjsS1zSO2cc5iVvdEF1O377ptuD4Ojip7gYcg0uyDNA+XKtwY+Hi@vger.kernel.org
X-Gm-Message-State: APuU4Z8lNuuRvVwX2MTR3c1yhZV5hjryLuEP1mnyrEURzieBQqhi/8+g
	DzKnFzNHCHYUpws4By6N+iaRoUGZ9mPVRA18Ocg6hIRTjOtlaqSvOCQB2rKpyDab+UgxTIZrPQl
	Xt2tlY8QxzrVOVciz4xd5FmU0Zf3UF8/CXVZYlClP+6yUD1BVe2kio0abDeyc+VOi
X-Gm-Gg: AYBFou1iZFfi3kXGcr6O3pxWrJoKftcjOxTQD1PnskiVGvtvmyrFx+wJUk5splJlHlI
	7s4rENhs8/Zp6yOxp0l/KruUNAY9qHRnZHW4AmICoE2OIsTeFVgF9kUhaP42kfjd6jCzZhCtz4d
	gWR/Vok1rPofX0DMvpGuOe/O5y4o0H4j05ZUDnqj64pl5IFCXxbgFOBrAJv9QDo+0PM0zCNBLFf
	q6M7LVVNQHyf8gInF+yd/wXZq0uKwYlsmmJiOCuX0HeMasJ/GGa0v7PR/Tc5f7iIVm8/yFjKrqS
	CAEeP3cqwjPGRK4MXcIu/zAcBFTn2N3+r68hmP1gHsDNypbzqIyEAsog33tmEhEfOePYNRqqHqq
	VCC2QBHbsseEJ4lMEBlz0J4KwizrfUi5LUDtwWqFSqL2c3298212NPdZp0Hbvb4g=
X-Received: by 2002:a05:6102:2922:b0:7cc:2674:b78c with SMTP id ada2fe7eead31-7d2daf1bce7mr804630137.7.1794213933817;
        Mon, 09 Nov 2026 00:45:33 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:2674:b78c with SMTP id ada2fe7eead31-7d2daf1bce7mr804621137.7.1794213932926;
        Mon, 09 Nov 2026 00:45:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959650a0f1sm8630293f8f.20.2026.11.09.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:45:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:45:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: Consolidate Glymur SiP power
 grid
Message-ID: <2u7n7gy2wzodcndmodrpmemtueax3opgtw5ttn3htwgskpu6fx@fuaqt3ngrhde>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-6-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-6-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DCnpIvq7_7TMnkaSLljlmyE06A5R95dV
X-Proofpoint-GUID: DCnpIvq7_7TMnkaSLljlmyE06A5R95dV
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af1882f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VdR85P1Um-UAOipgn90A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXy4N23dHO12sj
 XkOojnngsnx6+60FMMp7YR9RsU5vwdHYJ7e2uoXxGZj+tGiG0G6+ZxnWilq1TBy4Nw+dfiwG93k
 61kF1AK5LtlG3raXVtTZz8IOxE/lweESpZKmVo96yQf0TFE1z1rOjlq7Mmy4Cpp3cdWTpKHxRYL
 zmqkRMHu04FTZ/Cut1z1JfNU4m0fceiga+yltdQz2R7K/AwIZ4RfSMvOukhWBDs+4Xg65fqTxTN
 ZGzc2EUe4iLjHnkxzmcuRxYBDWmrv8BYyW2dxAE5BHPloo0cPCimcCUrTNo1CgEBLE7hbIaNKOq
 xveCYu/j16Wz7t8eh6J3/Y+3YueIJ6Z53iljIfAWfcaEXFERcf83nLgJlarQJCEWwoe75xXWUKC
 SI13DCgHst4BpiYdW7Ur6rmrW4ThWWtTLqYqyRrU4Sqy34qyppB/3gg/IsXoMrLs79JZdZ54+9i
 qzxWomCltgxGBL+f+Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6YElvsnyrALJ
 mOGI6Dm2MB1CQ8ZsKJiO+4WbCOTtqL65z+pl6wv3tQqPbXqKQxNkYpGtTDyYxfbscka1SYT3lfS
 lbDZR5huyAaUVKAZyI//nB48aYi00BI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:07, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Much like with CoB, the SiP PMIC configuration is fixed, which makes
> the regulators and the supply mappings of the on-SoC peripherals the
> same across SiP-based boards. Factor them out of the Zenbook A16 into
> glymur-sip.dtsi, so that further SiP boards can reuse them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
