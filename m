Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0493D34A4
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039967; cv=none; b=DJqRyxHHIYu/FRHNvGhxSS15TQz6gXM36hlZkk1v03/koLu0VgXY5Q0vh/D+h5/j/gwjqoaSr/7vbs8a8eW1H4jW7xJw/5OEnLA6I5U88pm6iRhAtW+cZZctMB21ymJxnekdzakSDz01BZtEXOiUIYzRGqW5Qy48Ce6GnxpTmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039967; c=relaxed/simple;
	bh=nQ+4p8OsGuZw809xd8Eq9zhMz2sZzX8LN8rIvBt7GIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKF0YJyKpdvISuA6GECVoYpp46IFXmeN0CT8U9YtaqmaV7M8heVH/GilYZG9P3UCFYD3fsKQgBBvZ+H3RmGQY87U35VtfgzSn7Xz0XiLWIpB3T0Gig2bWmHIea58RHhKvceS0jadrmUK0GSfKHQ0rNdaM25aiEcXvMx8WYECwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ1HH3/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BE78VuUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ1HH3/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BE78VuUS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317El704106679
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=; b=FJ1HH3/K+4RqKsD9
	ESnJE2pA0EsnBvibYt7HoDEATpOanA9KYtkTUKaSqzCy/9OsgpkLUsqfupbq9MhT
	GSENwweAbTm9GKqCsFwsRFtxbA+ZukIXFuZ6+8R19iHyK1SIqj9gk2qzXlrysD+w
	jDA2tCz2mCUM3rToBAaZ8t6eST9MoEk6B+S1vwXRHhjk32lkc7t0WP09aD8UpcWR
	ZaBVQvK0oZxWiML0yZ1eu7W3eRar+Dtmfy3JZvN9LHttshfqWwtuae7iE/qsBJhM
	qZrfKlv9vIPCUOheVHe6A/piDU9ted339dTaYxktXZwLlJ+0teRWQwpfxILYpeIv
	t+zHGQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90utq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:39:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82717caafccso1615835b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039965; x=1775644765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=;
        b=BE78VuUSdsH5vW/pkIQOIYqShB5CclwS3SZv0824k+LUx7Uq804sBehDY4XNbQ3U3h
         k270Uf2yLFafv6EN+4cu0oRMzl16BxuyrQIerm7tDPMVnvpXD/x0sO3QY/l3pdXzDbX4
         +cCkFognRlacSbrKHjhrIeH3VMcgggDmNx9DRdcuu84ejHNyQ3C5qonDHRAD3RBbyZBz
         xvqztPTSaSNIJB3RRT5tc3HiGRmwZ3h3rTnd4xwKyW1PkJ9W0TT3dp7v2r9xd9QbLGuQ
         AWkc6PI6psOBjE0xS8v9EfrMLGAm2XPVKOF2o0MGC/FQ9TVwVlW6fHWYwb592R6lAFLN
         aTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039965; x=1775644765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=;
        b=Td7nuutBxsNN+a/ZU0RQc8mfomqDdx38SPdlzQX5uT80avFw+p7ifTaRRYhIuXLEex
         R6xZl+hzHclD8Cus3sMQogs4JyElz3epYJAgdnkmNYRoJy7c5P3EZH8MvDquneWSh7Fa
         BqHG/tEIdv5Bzsx0GNT5uO2KoExMwq4ED6vxOgCmlB14jq4uGQ1NpOYM8Ho246Xb80kq
         j+M47MocawTkTjAAOnhB12/jTUEjJEOpumCYMsgvkRfsDg+4KiW/eabPBH/1LsSlld1M
         1H5ix2heW32C1MTCZOnBZK7PdabGPLvf7Bs95iECYXLR9KTnAE3Cy+ntVioGSzImUWMy
         4Q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzsD4DEU5GIfaljk1EgsWd36yLBRTWSg3spVT41hJXZRVDu05kx0RKrC1o6eyUx0s4gjgezg0PccHt@vger.kernel.org
X-Gm-Message-State: AOJu0YwKM1tNmi1+Qm01NnCV2cntM76AnFbCZeDSOygWUsU9Qjtkv+k0
	W/Lwadq5zMxit2bTOOyOrfE50TWlkFGfTTeGbHdTL7FqoXknFXGg85F8Up6MU+30FjxlqD7fCE4
	qvGdNfDLS621BVQDw95H5DQpzKlGI0hQHD32vtNsU07cY54ZYaNhJ9+njZAVPozXx
X-Gm-Gg: ATEYQzwZutKutja7ju6kOwaQ0lxChUoxkGgmqMUBvJZItcgM6YHV7h1dY0m9Bs1WjpY
	TlxpGu0lTttXnvORRtz9dTcSlFBDMzCcM738Veu1h6LRSOgdEv+wcI6ZEY+gEl55QG0Pv0c1BAR
	zeBm3TAkc8p0RJ2KT7pNU3bnn1tFh2qjwEwJL4Rlsrr9jcWfG3jx0Lx/t0vGAd2cPcADFEQxo3R
	ZbqTuFDu37hD0eXWXtPB2DNwCJCTQWz88+bb70AN882uwqVVv9V+GH1AZWVU98UgiLO5P5OsRjV
	ugB24FdM9IjyPLR2E62BPHaG6Qkd1iV7Z9DYqaHns0M7T//zuGAA4jR8SPcf/IPeg7hWJiEWRs0
	opG4K7K8PVO0ZmfprgZ2N2kUbny0xnAXVvapX1EKsxsQPshMMyHSmJ8gglOdigjn87ZOh2+LpZZ
	kJ96bqH10fzh06
X-Received: by 2002:a05:6a21:7a86:b0:343:c095:c4d6 with SMTP id adf61e73a8af0-39ef76644bcmr1945363637.3.1775039964572;
        Wed, 01 Apr 2026 03:39:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a86:b0:343:c095:c4d6 with SMTP id adf61e73a8af0-39ef76644bcmr1945341637.3.1775039964112;
        Wed, 01 Apr 2026 03:39:24 -0700 (PDT)
Received: from [10.133.33.205] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76bdaed389sm2016215a12.12.2026.04.01.03.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:39:23 -0700 (PDT)
Message-ID: <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:39:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G_NDbrDjdhthoBq33DO2RB80oMtg4OeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NyBTYWx0ZWRfX13wkyx6EfdXD
 A/439HFF0Hqz810kKLxtZGdPJmTQFDUVmW15kfzg3yjpLJ7cTt1yYoGfeLoPjLqlZ86GjTJ45tI
 1K/aFlte2azjXf9vTj4FVl/rBpdDO95HdG4BAGc2QXBY5/8DdzCp0wSSpUZEWhikrSj0QrSJpXC
 k3+FqmyRxBTFLyYq3h6IFsZ/MZJbNAWPnQ5/+LAgPqUIxIZWX2OkzQIp/FMybN79hr6RCy0cUYf
 4HxQTLbaANttQWvaRuTSAkInWZyuV1lscTZ9z9mkzLVpW6hSvrAwR1DotFtmZYNUyi3JsFz02/v
 lcn4pTxxTEBfpXEUcQBvHUTjgcbWXQS+lQForD40TYP3PhoVcR7zzak8EQPVmoDsedLZM7mrIlD
 p/SiHJQntvSOEJmxO1NvfZ4wqRZRED76lzjrlN5u/U7+fQX96N4MYv8wKp69NecbbK5zYz8CH59
 2WtYkJpyd9LcuZmpZWg==
X-Proofpoint-ORIG-GUID: G_NDbrDjdhthoBq33DO2RB80oMtg4OeU
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccf5dd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=F5tj5QwVYdw-9oKD5zgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010097

On 3/30/2026 7:53 PM, Dmitry Baryshkov wrote:
>>> - Is the pin defined in the schema?
>> schema define property 'swctrl-gpios' with description
>> "GPIO line indicating the state of the clock supply to the BT module"
>>
>>> - Is the pin wired in the hardware?
>> pin SW_CTRL is wired in hardware.
> Granted your three answers, it can and should be described in the DT.
> 
>> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
>> which WCN7850 pin is 'swctrl-gpios' mean for ?
>> Why to introduce 'swctrl-gpios' ?
>> what problem does it solve ?
>> how to solve the problem ?
> Please descibe the hardware in the DT. Problem solving belongs to the
> driver.

sorry for not agreeing with your points here.

it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
for 'qcom,wcn7850-pmu' with below reasons:

1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
   both description and its expected usage are wrong.
2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
   property have no user within upstream DT tree.
3) the property is not mandatory based on binding spec.
4) upstream DT tree have had many such usages as mine which just set default pin
   configuration and not specify 'swctrl-gpios' explicitly.
5) kaanapali-mtp is originally preinstalled with android OS which supports some
   qualcomm specific feature which have not been supported by up-stream kernel.
   so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
   kernel sometimes
