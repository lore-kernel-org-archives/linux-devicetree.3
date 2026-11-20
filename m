Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170231;
	b=C64apAuo7Xx1raBuDBpnep2rZruMUybtCRyZbCYpPFdEBdLOVnAI6tI4pcr4vhyjikbw
	 YbLIaw6V1b8iJ5XGsDqcQN7uoWtXkadckxFBghFevyM5ojS7/vBbkP8W6KdUIJJUDADj1
	 6qmEjobUyJ29OdUYuzUzX2Kq4uilvG13Wm8laWlFvzS1OwdoHmXBDPkB6bfBl1xZ/j9Qm
	 lXYRlFCCF4rW4lFQev7wey57lS+ndx8B/0luG0/lEZRWYDe7A1HnKrQd6rnpiushlZ3oi
	 r12rvSJF1Fb2+TcFzMNKRVNpeZI5vAGCCFhDqjkJC48uv322BK5Qt1PF823Wd5bzjmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
	b=gUNSXiwFTnMpudbY77ecBoKI0ZPEkr4JW1CJclyIB1pUeZJjdtraiNv5eYAqlNmHHkAk
	 lCbyFtGNLuT899EOECVOoYfjaxlCy1962K7u4Fn9+tlI7cgKx4GdsccP8HcQF71cAHDhP
	 tsuLgE0y3ML62rxoMfImJNOnOCAc2VCc3nkwXh4el8/nFlBHG1JAI3YeCA9YG/KbVm/A7
	 f94Ldmx12IDPkZn4ftnSHD0UtDa3oSyLcnl8imxdKiefeMNtm/q0gVLS2ohHK33xJKi2u
	 biJcagbNybLmxhrJTlnwMcUF4C3KjAb3HtzzrQGcE5hIqK9X385ReiJYLLlGujEZuNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF02606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEc9758285
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8TcUmke74uRIjwI8jkOaFTKa
	ZBFJu17S8g+x0u6+YBA=; b=fUjJhogutELs2uVD7hnzyFBThyKIi0WEy+eTSFcR
	cX811Sw3p+NmQjf3221rW1b1mqT/vLupUqlV1+tZNiXSDv+nOEZm7lTfeCz1vvnt
	Moc586UGO2NbfG+Yc+bHNnrmL6HjIrhVH45lqGATN1zNQ9/3ug8j/N/ID+nLlTnc
	oUcI2EKojh+n/X36HL+8MenRFmhRxsI6nhWW9926PIrcJeh90s0N0VYzNrTQuvnO
	5r3yrJLN8CBdWxBmyJQI0IwGho5cqXZkbRKazYaQN/tGdx4i022WxwZll4KFh0rM
	wDNl+Y1doBoMLQpJysXkYpU6mp5E8PiafBGlLYQtImgHVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u7yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:23:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso346842385a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170229; x=1795775029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=DvAiTvQQ8Rck6OpoqHVsHQKyFrZsIDOaG0lE6t1v9pYEoRg7g3CsYLWbBOqvgX1Iqn
         HvDDtJAiCbXSQFzk+IzAA7PNArtqs/oVz8ftMo7vebwnpLTOXvKtX/72fianSv+P2uyQ
         hxD26mPz7aWu/fEN4Tdq1Wfpvo5Ze4iXPeBFxDBEPARX0GqmsqIbYFHPJw0J/Jed254z
         cVr3oKBQeC82FmjnL4GITmvPQREM5lcWDuSIYr/IITUDhW++mMEVLi5HDZ+RFgsle9sg
         QCDrH7sYx/PiqaNslADuR07sXI1tFE0KAFNnFqzYJKm5qH6zmSkCg8/mVEs2IU6YMDpM
         xbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170229; x=1795775029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=RZ3pMGFlCtPvBk62QF3XSdUxsGP0n0XoLMRkCOPTIK0DIx4tQn8VtyiQROQKTnnbSm
         J6JRd4br05q1WufKe5meEDXdee9TCKK6ltLI2GylRnugM76KRh3HOqMk5ewsxtpMtdvk
         FCUmlhkAwmpY7z9tpKFJCoJph2/ZxDC+vdN76e8drJ5/KYc5hdo2/Ku3cPvguWMopCCu
         THDXYU0QOVjJmTkkYNiO/kL6adgxeqDeYHoun/XK9AwtzHGLRQQY+qgUdJ4EqD5XAyWe
         Ll6DMdj2apC3/kRdAuk7r5nc8QXpv3YKm/mKQs3ZPj+ryvU4JgbvboFrmegRZGZBQfzq
         Ufng==
X-Forwarded-Encrypted: i=1; AL+hErHvW/vc11aIyQTLG285RUaoEXsVtDvEvWa9YqM5fs40pOGNqfhLJi69IYl4dh3+ea6a+nQiyXIaO+UJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9iy/EZbLez80ValklrLdFM+lWsZSSyeekO6oCCR/+GwMdQDwHM
	Bjb72aDQ8RwqBfgSBJD9FlFU3qUMqEkTIIwJvEcGe1jMrmj86cx8hJMyRH22HGmTKdj6YoDp2hq
	5vksPiuF68jCjfkDfhhAgwLx3nU3kOdKKNNImenGHslTe8mJtGXzKGlkydJz1yop2
X-Gm-Gg: AYBFou2wsuIOJ30z3xaVQULjqD1lC7tcPuH/ABw9UnsqtlPfJQtPe4zH1MvOS7vjX0Z
	jMuG8YSOG39ruB7odYNzjWTHs1OUkRCVMQJc/NW/wEzkdhBAw3Ti19mp+B9W/9xNstUTBvBPhHY
	t9TMvLQjTCIffqMG8DwdG6qlw4leji8TEyEa31XA6SvMLh7WOrSFsWvHk/CvkKueKjPZxbSVb+a
	ldbuBKnWFIKyXqa5n13oQ49NpjDu4FFRquHKfXRmfUmiswdOOpna27oZmVT4sR14pItUtSHSCuV
	CJVVi0iXyFH6D2Cop8KdhXN4BE2f0VgSGHlAgZg0/QdY+yod1CuDkntnPb2zgIh6C8lp0KZwpqz
	ub1SeIIy2ylfy9lHxT6+sOGK/k6gJ6tDUoR8pICsU8BYbB8D6Fnfm2q7RPXl1u6Mv
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548459685a.24.1795170229078;
        Fri, 20 Nov 2026 02:23:49 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548456785a.24.1795170228426;
        Fri, 20 Nov 2026 02:23:48 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4698002f8f.3.2026.11.20.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:23:47 -0800 (PST)
Date: Fri, 20 Nov 2026 12:23:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Message-ID: <dtjei3tsuc37fzaxokznqtxxmkbuk3h6dn3yxnqcru7hggkuuu@igwaugqrjxfd>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
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
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX8elrTcWZ4BoW
 /0MMP25uw12h0ItneWucYNEp42lemjVVqmnJzW7QbyDsJawUJH3D6zz2vtj9kcjM/k0zku4JMUv
 mY+w8QEFP/rFttBtHXUAIWM3BJDexrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX0WLYoDuVG9eT
 5/xwZc9pRmbI2jsm+eVUcGxQijBELZK3t0Hc2m1cl/ws9fEJKovspn3PWOU6vnbx+5/Dr/sKdrc
 iyd5Fe+H2NHJ07+jNvkiBL0rnkUDycDwJ5nbuhN0qcMayib9Gr0V2pgdfUEYnHm3O65UCWXz6rN
 mLuA8ST5wiapVVMz3jX//l8+LSODEsEIexpAVY32G2/z9m1LyMbaQe6D7K04RxNlDRqXDAhMPqs
 4GuTHJ/Rc49JBZCBreN022YU/vRT0WH0xozZPVH9COj85seUSYSrOLUqcjRDINe0sdAAHafoDn8
 dyTHT9QU2kK4yxiMYBS51ScBppe92kqEVwtvmuQm/I8FEGnbQsRsLnQtAfnNHv5ogC9eDnHTNz/
 Lq0ZubY6BmnoZQI7w9Bg0PfLY0UwFTY958ZCtXud5tiK/m65RPpZ/FoUVmYIwuC8XuzUGv97qxG
 sUROv3Cx2l/cRbBwHcg==
X-Proofpoint-GUID: wDW4bY7wOsJ6SWah6NSdEzLoSn27k6is
X-Proofpoint-ORIG-GUID: wDW4bY7wOsJ6SWah6NSdEzLoSn27k6is
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001fb5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qo5-9WyrHJ9SuE11QxkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 10:57:45, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
