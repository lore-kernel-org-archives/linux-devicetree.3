Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191903;
	b=XqScLrDgj8oQvZpH1VJgyoX5IsO7SFR7fYtLma9cmaDnneJsytQAdDZZLiV0h68lF5AY
	 eY130njix6A/+hR08O6/cV6uYDqs/ri9xVhPfSVF8F/RBkStxxdAnf+0YiDw1+3C2qlcJ
	 CDTL12NVOXFwNpPlYvUZcxnd9kqPqjYNaxiaq5w4pwPA9GZsqXDSXooBa06q4brfoBY4q
	 y3zPPwgBY30liW1qcfh6D9e+m/hPkliA8G5TadLWWJHB7KOJ5H7z4Q99jkIayBrjoBopR
	 tgB7k7TB71Um0kjm4rZtcatcrui9igVlNGhi1GhsxAL0lItdjWoEK+ScpFMR2a1qkng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
	b=tkFL5oSZxs6nK7vrac2/9xqEFHyHwCoesY7sZThkrc/Lf4CIuGhranzPlhw8Jd3NgvCe
	 PJ53gCYf47y5gQAs1ahNtizO9T/tLt76yKJYizELnlvH6smw3u9IfxX6uwl59X1IyF+8c
	 0bIWwXX0tnkjnkyBwzDm4HevJJarw+PdWlKC+C35MTTdT0KGxPqRniR0+SG90c531fqA6
	 XeCiYcTXKNpxf9rp3248OV7xI3W4vHHPc6e8GM/6jcMfErEqevQRsxw0ZdcGBzx4llFHH
	 qDQvML92v78CxZH0vDBUDfEPUkhRfMHvAHzPDwvIG7ncGMKw6D0yzJ2cBaXS6rpLfSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="iJop/YcJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61DA60A263A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61DA60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJop/YcJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4FO4154783
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=; b=EhO6gJ0b7Fu/03c7
	QiFvEyoo6+Db22HwYPHzd2kwr9wPbpDhZAKU/8MCPc1jj2bpbeuMXLLXY0AdN9mF
	BwGtOHDebmwUpLBkXi9BgS1bBkKuiDAdfJjQ6idY6o0/P1tbpLnsJsz7o+RzPt4M
	955j5OpYz/cyjUvh235ZXR6G3U2ycbjtt2V+zphuqp0F9HCdTx/uosTXDHiB4G9b
	iL4BpaXwInr24motMXM31/m9wIE8J4ahWPzjdYmN0h/2sQgwjyVt4qCIGHn6B2bD
	IvHvSsqH0tj76vvQ066MtkYsQARmhmngV0zmlLPXBxCn9PIi9juCC8pCkSezU/qQ
	FLTUew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0uwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2445266eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191901; x=1793796701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=iJop/YcJgNYAcvki8Sy4PngnQ6VcBdDoihddMzawOZ1J/zYXGnsVKC36ds4SKUmUiW
         jzxCziARLiyhlW6jxcPHvD+aS9JC2cOHQWDOHK2lHqOOKX64r3luwqwl0EgzUeLedeJ5
         wcsVRn4Vs5kACqj41Vp/AMJQ9EuspNDHnPNxdgVWN4j/ME5KEJj7qMJiVvX74BPpYFaG
         h+i2z91UcRCFEeiyUNhFtkkJQ2Y5ab61CbxTKILu8ZyKOa6dJ894TLp/dXkIba5ZqZhz
         PIG5A0BIsd55JVS5ntWL8VrS2eRhVa+qS32fVA/r6TbfjnA7LrreKLnMzxYJqOlF4EeO
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191901; x=1793796701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=blS9MZIJws6nkcKjGoLf+5zypTsc4F2Qj4GuWiki7U/jAgXCPf2fS6VPWjqO+v8JS5
         cjAx5blt4BzU6vUTRwCyDy10g0cAfDLPaADmuBv6UedcEP1nJF6LtWffrEpvo+4uvSmm
         EoCownM4gOEFgm09SPhJFwVput5WRL98kayj6sfP+jl2N1uLn81jt/LiuYD4obznQpby
         RJv/ZDDxluuHhYSxkxrd/t+vZezHrmAwMj7MZtUk12rPgA25OoL/bvvimCjCGTk8OOmW
         1e4NG8Fo+Prp7UPDCMXyg9BVwSp05ClID6m91BtZzzF2SUG+999WSJTUMaHn9rxxE37r
         hieg==
X-Forwarded-Encrypted: i=1; AKwUvByY6NdSrUxE+45ZYGw2w77EYek10ZgmDfbzo6EWDf7dBzqE8I1sicMC+COWBZWyPvpbt6BP4E/Wi7yJ@vger.kernel.org
X-Gm-Message-State: AFq9FYInLa4cTMJ0MXwuEx0mr67lW/Kjk0PnBgyeEazjgjXuqVhsk2p+
	sCbd4gQ5cvhkTdzXar9Z+jnk0Lz3Y8hm7etg/kAgM/xnzJwH7+nOkEJ5yYYaVb8jvuPsaVl5g6A
	RPmgHvpnYDRJNteyMt/s6I1dO1mj4Q9DbtcJ5Ldrw/SinqIKRPXRXyZ7Io77ATixy
X-Gm-Gg: AYBFou1wj30PVbavuwcpP7XqH1pYmccG9zLS/KdJsUJy+HPn0n668VgAcxLLn3HZZqG
	UknDY8/U1qo1BSx1Le1hTIUFNkF5Ph2qwTyZnUwUKtEE5Jnm2qHz8mCdK8MSPEwH4ITRwtggaSU
	Bn/dRVjUGhnXSjpO0OHIUZg+IEuXr07UxBmibh9p5hCHEJcnYCLdD6F20GEAhaQolAYkapWU1Ux
	bodi98dP2vCsQS4B9SdDxO88oDTbSq1Epf1zK0B5vcSk2txwKSpaxBnRfgVKhKEB5wS2qP2bIdc
	E102/CsAdrwp51UcpY/7zshIgTow+uyNOQuvxToMqyXn4KpU+tMNmf7VvstrN4Q87O9uqBco4mu
	lJiExsOiEk+4uaJorr+W630UJSswNtHjgf6eMMYBbDOrN0ubTS7l/hwuW8PLowGWHyIBHpQeMm7
	NKQh+cX1jN
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179283eec.11.1793191900656;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179258eec.11.1793191900087;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm7277318eec.17.2026.10.28.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:51:39 -0700 (PDT)
Message-ID: <57aef084-4328-4e4d-8ace-f0fc288e478d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:21:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iLErH4qnh8rGJ-hKVGNxieLzW8BLDdhz
X-Proofpoint-ORIG-GUID: iLErH4qnh8rGJ-hKVGNxieLzW8BLDdhz
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1efdd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iuzv4ofnY9mMQXrTmB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX2MbRpQInEuXe
 51LxFZR168Y+n1+xO0G35sMeXTNrfqH73xQe+JQac43h2yGHhQ1ONswpCTL1bW1IRkAA8VgAJAd
 Re72RQDRoH/jIRvcyqukNmRoJNBsPHVwPZPlz0Nej7bRs6V/AueNWasOlRhFFSVDgaV6paHDKxx
 STYUrNHfjkO2DOCzWaDdbkJUR/ROed/nppKWo+xd3qXugOfSOvxSCECyjDwLIsosCml7VfGMsLZ
 C7Ew9XgY/0CMsZDErdmndKiC1P/Ti3lY76FtWWrQhS1+t9RM+U05a174w3bjWwt6tpkeN/wwtE+
 eHKs2qQ9uDMo2d9YrLkIx0StH4zwC/zaVq7ZoZfPQ0wuyv6EYajBTl+Hofo3rKpHCJEuIzfryXz
 QnB2cr9W3FkpCpCJeGZ4aaczAJtsGMchUWj7blPkQ/QqP2vpYCu3arcZkhyu+U3WlFKmR1Ddxk+
 PVWUtEn9KHIB+qHYuMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXz1moerVheswb
 z5mF6n7DWO6gdVY4ipZ5gTdurCwhKPrMMUXsyLSieH7zMJmZkdQuo1w/S+xEDF4GRERXFFpNtyb
 UdPccAjgHVOHKNIAMOhTh50tX6Ko2wQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add Shikra sound-card compatible strings to the Qualcomm sound card
> binding so DT can describe board-specific audio topologies:
>
> - qcom,shikra-cqm-sndcard
> - qcom,shikra-cqs-sndcard
> - qcom,shikra-iqs-sndcard
>
> Shikra EVK variants use different codec/interface combinations and DSP
> processing paths. Describing these variants explicitly in DT allows the
> machine driver to select the correct DAPM routes, controls, and clocking
> behavior for each board.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

