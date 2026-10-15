Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452A514742
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059665; cv=none; b=cz/45Q1wcw9b3Vp+VKLK2jGNaGjjKvzYhNeFJ4/lLnxMrk0wvhoF6GVJAIcj7YSfIlaME4l/FsnOToaH94kry154+m4J/6pIxHRRi4KPMoDxpX/T3DhBDZSiaRzQUCGybGWYjX6Vn20eeVUtLuRM6DfOp8jBgNppbxcIsRZxa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059665; c=relaxed/simple;
	bh=u5tlsWRinm9tCneuBQHtmvAy2x7uMN4jqyTkfs7VmyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F66+2G5Iq+fyy08b8M6w9RUI09NuDFH7e0YmcZnR1Gy9hKBKNH6Yoe7Nzleaqa+/poNOCL95KDrjlyNSgx4ZFw715uas4OqYsw6qU4gPfNa3jLHORkCoBHtU++3GWFYIA5lfBh9hVjcUf4CHeSAMMug06yyF5xHX4eY4qx4SPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXwPD6H9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLJtSuGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXwPD6H9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLJtSuGC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jjub4011184
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=; b=PXwPD6H9VVWAPlpm
	7e64/gahPRzF03ivU0ke3Tro/pwygWZG4HHz/Q1f02i2TNYa1FbWmc6YWhhs6zJA
	WBvr3r9A12RcT4cqpmuZl1XpCTUNyxL8nCdFyQ/KSm9cw6DOlI37Voz1g9oF0RRG
	Pww5TMpaykPDJlt6boMjRlO5IhQwo4WxHDPepaudsgyIutUptE8Xmn43EDbjzspp
	Th9BcXQ3PIWKEuLSBfHhF9uo0a4VVpGR4Ff9K+hW654DzNNd3ejPGOAqV62XoB4n
	nITbNg4KhiyjXVzT6ya9FePZLUAwjC+BLrfRvPiinIlka3bXhyEBxXqPq8RkvARB
	eKI/kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbx63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:21:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13484896d6.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059662; x=1792664462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=GLJtSuGCnp2kCwnyCQzxHvTH/k7snfa0wi5SVyWgJgdi4sxYim1fMsL+flIqokQ8/e
         xzX1n6SNbTjSEjz/LALdITIY7q9qEhojMIOSN5Y1kU+SjpBevFktwMZAoIAxVWgdk/Kb
         p3hRydXRLiPjbhliERQP3Smo14b0yMKPj/oI0ZoJg18SbtFZreCvsw0r/5OlnmQnJshg
         fww7xR9KSeJEoMM9wujQBAivpuNP2S1K7vAg2/U2OI713FNeajMwE8gVvnG+jlBN54SE
         QH5/l5GO11aKZoWLZnow2yQ4aGNRDFvgvXRtg0VF5M6lPtz+sTZnGIf+caYw6dIh64D2
         Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059662; x=1792664462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo6z2wfe8BTrExVINJs5EqIKn2ZoTlfrPsINE3NUuCs=;
        b=oBJLp08rzDBrghzuZDIUL86As/yGDJGTO2ANBOwXsiHr4LaW9V3sKRODQReSgz2jjb
         ADWHPvLjJVxw15c0jzBjtTDdf3EXDAWPdmBy5YvXSMajRLeddFbBfi6wjjfJL2AcTBdN
         rAzqZ1CMpWiQOLM42IOeybWeDXqBLCz4wkV3FJiycknj1V9lg63lLAwvOgraeI0X5Tu3
         zIHM+D5cbCG6MG5Hiw6G3d4zkXCuXoM3huADAciajAZFOwOn0qr5FGgMeRWUObCMEnKU
         MeqOvHn50AKA3txPdNxU4X1bBbhGYOCBmW0xTC43vvZI7oJhSk/84lTd+UeqxdEmKiRL
         pYWw==
X-Forwarded-Encrypted: i=1; AKwUvBxKRnkDZMlNViD/xRo3GVUpdIfYkQg28gLYAWChVzm3zrTlG0CkP88yiVbO44RVu3yrjA/53kRJFLf/@vger.kernel.org
X-Gm-Message-State: AFq9FYKAQyhD6xmd3Wz2FUkcDZYq5mUWwM9iIiVtUET5bjce6s2U1IwA
	JuA1E0ieaw7i03mDTUz9Cwpacru4cPRF1OWIKdD5PJUQ46jdnnsYCkIpMcbqtz1RKv1UER+PIA0
	SyPAJPpw8S2dWuT1KdmFZVt93BCoVa6ZH89/TXt4HqZk5p+8UJ54U+wmjlLc/vep0
X-Gm-Gg: AYBFou1+/qvSG/Z2D1M8OB1rJfixoen9thoGZf7zcQbKM9uiY4Qvd7Xxp6C3UD4dzUk
	Pw8vW6la3ywXVFoYNv8OgtTdXfgZPAhQ9IvR2GbU14tkIYBUJt/nIYZXjMa/uASkEFWYEiZuCnT
	MCOAdFIqZphXR0WWKMU3psfKo7KC1hym6Or0Q28wkhZUUTVMfPTKA1nUN5Jes7x/0ShARTHr3UG
	k3/j0Jfq3Y4s6uny0CR3Vt5OEFJVmfcrzzPLJxNVKxuUND2Mv988Dz0zuuPDxj5YAWhKU2Rrz4g
	uYSzcWI9UfQCHYBWkRlMd8A6CyW1C2yf22m20jhtOQd7dO3cgX/0myxJnZs8pE6wcOMeeJZZ1tv
	UaCMcEq378KB4wPDMqj4XvQ==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302250085a.4.1792059661875;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3302246985a.4.1792059661402;
        Thu, 15 Oct 2026 03:21:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:21:00 -0700 (PDT)
Message-ID: <9d752fbf-8b8a-49ab-8e8f-5c11963cec71@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NjkfW09bgB_-_ZAQ2zAmS7IoJVDyBbNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX6L0WS9jQezNG
 bEHoG32wPqKpfEfvfJ8F4PjigAvQYtr5dYzDxlYYirQlMKTMM0KOlvsBnrCQeaEarCABtTSzLYf
 3jxlhKFW/ncywpirMhj1CAB1jo8UGqw=
X-Proofpoint-GUID: NjkfW09bgB_-_ZAQ2zAmS7IoJVDyBbNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXyAygCsFkcS4d
 bCNO3NW91CR8DpYeiklVQluvefq2HNwgX3ARReX+OTqbDXvQbpbnBD390kbrgWpPWBby+CaLan6
 nHgW0Hy5DLELHvWgpNYWi6mOtvmL7JiHLCrykpkAR3VKUD6MEzywK2EjM87uaeN8wOy8mJS0vE2
 7ufVyaxBtRwWoD6ALpHBUGKUr70mNk2r4aRYlIujoW48iynawv5PbkELbN7dlzKyRTuSs4Jfhut
 UOEZQwGzzfiex46JtvKpu9vQuAnNbD2focIQnI6KXFlJAlwN/OjdobQXDlqVqG+OalHWx0MVAAU
 K1r6oXI7esfKrYekL0Ykw8Hf760UqrHRybph9T1xyFd2R4gyL+EPZLZNObR0FsuhyM2pcBavwZj
 ZOcmjQOfPmDcMcRqGL3hXftL2Ag5gFDrl8xZXpTtuxYswpy4K19RLb/8d9rQzsm8c2LAkNePMvl
 6+dt4lCV9EDCyTgjy8Q==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0a90f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
