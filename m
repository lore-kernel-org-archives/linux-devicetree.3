Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5487423EBA
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378251; cv=none; b=ubdeI+QzIVDCfrMVbjLZybC2NQErzXxhRE6BkPRSkWpLx4N1ARaHAu8IP9cpfwbivssyoARolCiUYOizJYjGYWRKzeOdIYVUFQ1EwuS4uSvOZi+SUaGnX6K3e4/2SiFlUXSUnG6oKyuWYXIFwzg7bwjcqkZ8e4cGEM2JIgUjlrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378251; c=relaxed/simple;
	bh=LaWXu73lrgxnM+WOLeLQIIpfXYsTiC4ZzLiUEwSFXJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQEhBwQNpTCvpOVvzh5msAy2KkFGfw8oRTQDbaClfsVxoJLXo+AfR0EGSEmxl2EnjCRW1+hxccqYVX0jeLQKmuH5poct6zlEpyyag6N42CHVZFBeXcA+MAmTQiNtWCSGklzilX8/DFYLKurQyjXAw3KwXyA9qLc3FSW405HyszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaxEYh0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yjeyl1sZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaxEYh0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yjeyl1sZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8Sfwl594705
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=JaxEYh0AgFuASaKu
	libuXqFtXFTaPSkzhi/TZSqE/gMgE3Kb5DiXYnnO6C/lKjVoTG8Z3/iEDGoqZlpY
	MdSHWPMqmEzhmVjY0IjxWAVv6la9fSa2lqPgYVstXCEoxwosnzIbCyKbEwHGCukC
	of6ehNzI13uGONMHKCG7OcAM6k9HnXXSeU29/4BWE1x8BQJG9TSUNug+niSMA08/
	JUBE/ORKYw5lisXX3RMUPHKN7+g1o7eHm1TRTgH+ZtSNTe6FNLzjakK7shCMnr0j
	julbwe4DnRPkHv+9ViHp7g1e88xbyktL1c+KX0bXZwybjYzzJ1yJH1sDBPo7UNs2
	sHDSeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr6tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:30:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a00c70d28so301113585a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378247; x=1789983047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=Yjeyl1sZvv4WknHr5rfmP79ueeyUCRM5wR8tKEnXiQ0op8fCuMtAOivvz374K6h3wU
         a/ePD94K3KdqHfDUHfoJc+umFjQUZ2u3GoHJRPyvXeWGTKZ35AtT2xed7hbzRuFIA7mX
         /+DP/l4ybRvYTpqZjJTBv5ujncV2hwSGAe+eN9F4oFpiSmY0HNiiadhmN6bP6dZk75ve
         xWgcmc/VK4NQmR6xKnUPvBbsTAFpwpVjla6xc8/1AdJbHNVDvZCdr2FYgPu2JmQtfL8A
         LExWya0giIARAZgVKZeKD8bjbdF8CCtmWOAcQaJqDUaY6uS1/Pf4Lmd2StR/0ijai2Kg
         3QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378247; x=1789983047;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=Cz9qgoCUlFTq6vFfKsmreE8CqGd0bOj9W+qVvtp4ahLe8MoxJwLqaJIgVtijZYgZB+
         6Exp7b2A9ep43rifDL/3Gr3VFZV4JOhZbeR4Erfw9fpEpSR9DPa8Sdf+sB33cbhalTH1
         UUV1MvmHTmTUfbi6ySdvrOB0as6Mf9q3SOAMhj/AipAuu5sV/Vco1llJSHv32qWr2lyf
         bnnC0352koIQ2nyUKRJKFXBQ5TdoWaqw/WRiTYnl4+QZIsowKr2p9tHETp/uSR3+UGQ1
         039MN9zhDPvLsZtI2Ir+4fg4w9LRQZAbuUbIsJvgmsuiSzNB1bAeLjdnCzi/mv+MNQ1/
         AYTA==
X-Forwarded-Encrypted: i=1; AKwUvBzKUD4arbqHVX/fBDZbU5sMeApxd1MLyWXg1jPYB72aZ3PvRGZGt/J5xonF3gixFZAKXTGl3OxLxi5q@vger.kernel.org
X-Gm-Message-State: AFuF++meNhqXxWv68HOzhqa6lrvkrptjALBBl52n5tk59faKqdKdyk1k
	mI2H4ybt9Y7iMJd8HJ2gMeXDFqKh9CPb960r9fOQ8jRtu8oB9bmKkhBCqefJFpoKFlpV5CIyriK
	+UxlqYSiPPVMueW1llTsG9FQjqftNUAjG/wCPzVMlv1hR8LK1NLK6MN/FaPkk4KK8
X-Gm-Gg: AYBFou0FcWxlN32TtUI1Qwg5+f/ooiwqlIBvk/W5pvAvFofAwxcvSS7iwBdn5XM2jt3
	c/Nbxozfc0g8C+6AdVI+LmSVVn6VGZjz5Hk+HNWPKI4WqFqUniNrYZQv5QeiA0Zo6Esxk7eWjB9
	BYE+RU5Sl2ySr0ewMR6+jQq636kNMHRHFaeclnG42fE4mCf1O+5txRp4hRXG4ZvHYJRiPdz9a0Y
	YwBMxM+qbX9ZAv4SRaxZ09yyYxpg2eKOMbnqx1+gG/5R7V4yMyJIfXb7u++SJh8s0ZlXkj5GARb
	8FX9LPZtpguGwnYchg0Q6xh076egvXKrmkQYNX+r8p0b8/+HhlWMTH9hKAFTG6xdrTy2snINHjr
	ZRO+ATjt/4l2G9RIzCkNtkoNTAFML
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222699085a.46.1789378246612;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222688285a.46.1789378246009;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3895022a12.31.2026.09.14.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:30:45 -0700 (PDT)
Message-ID: <ad4b454e-0774-4870-b743-fd0d82d0311a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G78mKe0ut7mM_i-hXGD2IGmUGvwmuooS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfXyQKqBarThcmm
 WV6gxfuyD8+w5bgDBJCq/NSAq4+0DFcDiJuqYqI9e0lxkHG8cEij65iZJnN1gT5y4+6BWrjCMhd
 4QE8zuMXg1E2naL7aYYGsOn6Qa85fLY=
X-Proofpoint-GUID: G78mKe0ut7mM_i-hXGD2IGmUGvwmuooS
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7bec7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX5ck3pPgVYldc
 a/g2YqGRnDxzHuRh12DWq+a++eohLbs84qS+isRZHQPT4dT0qbDmwums+VL13Y0i8Wuvv1+DxuV
 Rk2LEpUYIi1ebBNycBwmGuOkRAxT3Lq6pj/D9vFWpMpxzCPpGNhRcE5vbJdl3e7u83Oq0LLM/Za
 OqoSeBFbA8yPtudao2haAeXCctRy0keYGJMVvFQAaKmW0tm63Igqr/PkxnPh3ftVZKc7r5wQIuX
 UiCMeqK8rF52IBlf9nvzrq1hgGculnIpPCOMopofbb3xIqA4Isn6TgNcRyA/bKZTDNDlsydQSpQ
 9QNA7+x0yPvExB44qMjtLFYa+Z6bAWDwrS5HYhssz7fYkBhjTqV10UOd+BBf2WJvRTa7PRDhMa0
 D9BZbpPf+lxkKNVeeu7eXTNaTd0ixtz7IHCQohxh13I75B9oqnKhfkK8q7Ne+vqOyLFKQeMvSHq
 t68Chvgolvc/iUG4B7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140135

On 14/09/2026 11:03, Charles Keepax wrote:
> On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> dialog,da7219.yaml.
> 
> And cs42l42 which you also fixup, would make sense to fixup
> cs35l45 which also has a non-generic name and isn't fixed up.


Yes, I'll do a v2.


Best regards,
Krzysztof
