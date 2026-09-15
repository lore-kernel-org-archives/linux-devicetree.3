Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A59440A24
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452318; cv=none; b=YbNi7ROgvQcwE5fo37bTAGsEiSVBC2FNKy11UBkJ7HI8WXLHO7d+1Cxmx836AGD51mxP5h0eiHJeOylOEfTRYAoDVuylLgQj9oOLirJ1urpZQGS9/C5tlupCjmt1MLVnVz36nSdLv2fx66u9KGPwuSWpJInmmwTlQCok367tGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452318; c=relaxed/simple;
	bh=lmbl0FDJ8BKHPU7iGiLSRRUOzdLjYSXjkdgoP2gRUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkhIIV9xWgKhsvVLcl1MmI917RlU6NKV1qgr7eQioSEYVqjfxQ6NRE1Ijp1mR6tv+gWPo3Pn8a5r3CgqHkVdC3YYlhM5V2V3I1Zurft59JgLXuaL11zWD9iTXIP1IUPRe6jOaStlYXhN/NX+t1E88MbV7owX329Fb3dx37zvQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYAr1IbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eplEh6IU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYAr1IbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eplEh6IU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nPTm2992662
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevvm8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:05:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102f07f2fdso12406836d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452305; x=1790057105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=eplEh6IUiJOfFPhYZk5XwfQUM/THdRBPQR+az3SFWSa/DjmaR4p7fFSphfJgZuZckg
         DjDE5sGS+cvmsXI0yHSKpRPuSUNAlRIsJw0SmVK/y5DRgmIwwgFMQh6GROfswDnO9fPG
         Wa41o4/UEYzZ+7lm0nX5zQNliAK/YLB5nl3DTiFXw8FY12oQNn+iY2Y7GyVRkorB+14C
         uEzV7WPluS4KJSq6gjbAbIVruaX2IS/DJLusk9XyE3TlGGQrAJKmSJMxmMQnSL8pBYEi
         NXh9BOZCUFeoFeAy9dcGLb047sdi2qSszxy4FaUeas6I5yyA/l0la5eqmYPjEAMbUtg2
         UEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452305; x=1790057105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=W6ztipPeHw350GzfLjSBvr0NLeomcsIXjYSWkI7N4FDFl0se7PpAF5VAnFx3EmA5yr
         3W0TOYh4hzP42KlYS6f9bQqNyCn1MCh/G390nk4QclGiwXCRocABzpRUWufenG/w2Wv0
         bu9mVAtyzmQx8wv/1gMguZCtiuw/ZUk+RBvpRpV5PGADA3kmyBMTII6jmEHbOF8zRXOL
         ok+Mn+5B616+zICQ/U33NxCIIM+nzibCwa17ZvAUToXy0rSTp0Nh5NAPStObagOXLHkB
         ohImhP1kpPs12jceVJz0qLeK75ZjRYEFQ3e3ifEIFjorXwTYAPrL4P2xi5+tX0+V8xnU
         sw+w==
X-Forwarded-Encrypted: i=1; AKwUvBzwo5/ydEyW6FZamLMyxWkVgc0V7qVEdfWGp3LEtIoq4W4tIuTNDJxq2gxNxnCEVHpeMUOTqJhav9sT@vger.kernel.org
X-Gm-Message-State: AFuF++mkehB0QyoKJ7SBsqfP6Dj/dLgHbaKVK9Z75UlTlPyeHvjQ5qAg
	H0ZC49GxBpZbeXAzQ7cEJD98qh0kgCAE7vGLJB+G5KxoUQn8UAYlNkdXRON9SUU7jZR3f/5N5YW
	rLQLsVwwzyIc5Ev0uSZo6dyPMxUf3UQHI1awr5c7thof1EbbyxGAoQzZn7pvCjopK
X-Gm-Gg: AYBFou1v6Emv7UEMiOouyJpZ+tSP+mZJjZMw//X0BGdkZOmA0FDVb9O4qBHaG7GPs7a
	Xzm2grHcIjjPVzxgdXSpMiPT46l05Qs2th2QRE6SGplz597fHnW0jXewoHhf9dcwyDNNz2+Ikdp
	XsU+DCBI4fnBQXSW8GHx8ZHzt45fhYo2HBOGpsHATRUApzyeeOI8is+haSyNTfpMRastmHmNMkG
	pfOQtP4YMAgFbD/5qGBOqDKX/5YHUeaZUkxBpfH+6vGIYEJ7f2avW+VdUdxAzboiemMYRLHoG9L
	YuCJXT0E6kQzau/HzQxxWtxwe6pXkWYJYqhZlTnood8Q8uLnFsiQju3CGOM53lfhx3hOyfIR5GE
	5o/Y+zUijDwaLvlX/mZ7cNIH8Y8N0
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323527985a.29.1789452305653;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t6gs635DdrTOWSjppAE8bDaScOXYZemI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX71hSuPnYkHE1
 kCd82yGpJR0wQ2Q2pJv0/5EFecrWL5l7d5JSeyZIUInDLwHAr6tEbXTxsry1jXqVvFXeop6m+wq
 R1QXaEAS/mL/U0LWQVl0iQzx+afYtsA=
X-Proofpoint-GUID: t6gs635DdrTOWSjppAE8bDaScOXYZemI
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa8e017 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfXwAIpJPcd5FJ7
 qyjDRgaJhMYHhWJl+W1gJk5IlbxPmKf2D4qZ+5HJ3HM8q+QV85X9DPlBauX0yOf2Q1fZ5yf6iFY
 EtrtrphLwuGKWoQSCKp7U8HozKCukxiQhoJ/t6qcKt6QE2naNn//YdB7SzZTtmWIbEWe00KRIUW
 aC5GoRSGdda07TxZ4OzTsBnfOhGh/UGmW5mvHYozjZF1xEtQgpstXMYaHXi9pBpWfkRgHEtwZ3C
 zE3YIxxalYecpU9Swhpf7Miz2NgIHwndI9OE9XA60rpYQVeLvZuRuMsIqwL+pb0G8fD9JHJvTqr
 ONsDC/vEvgplUDcwEGT7M6j7Xyqa1ljjZ9jOI+lmiLir34tBPtZDoKlKaQFy8n0ym4EW1tfJVWd
 9+DSZZjQDpB2/5PQNCGD7dFa+apC6wTTmGP1/fP/1n1SFgAGXoyM16UemSHVyzt8bgtWoCAWipj
 T9kclcCUtNmq5OUtQmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150085

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof
