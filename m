Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C797738E5D6
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451346; cv=none; b=CNeAx+Ce0oL/4t1Bv0rJgHsXd35jbTFf9yq8my9YZRclO1Yi/SVX037WceR9Iryszs70Pj045HUpuTErYcW6EkOT4Li036Jr3FF7aGmcju9aUjEgEjuVaVyHUZD207PCuQGIPfopWod9JxvHTpdyFBV0Sl8XOvkvpi/q7gxrN+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451346; c=relaxed/simple;
	bh=NMbmUa/Z/P8s1i+9J9SWnpDqu/ZnM5WIaLzDgULOUOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcBpl6mqQm2k/Gi4lXQuQxSbuAHq6bZ0/CdtNu1pgFIirFpkg81ngq/fi5D2aAekjbHmnqNPgWb+XF729M1RlBpo4642TYl/F8ifiGtSIfhUPyF2GDr/xwN63q6fE/DBci5qSOAODWkJIeMfR+wMyiKolA8RFMrpc55DHv5AeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNIzo59C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnws1Hw1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNIzo59C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnws1Hw1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8BiBj2007710
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=; b=UNIzo59COmbRk+I9
	lRVW/wcxw3B09B/UKEnF9Q308iJ4di+UEodyA1hKRVHhgwy/+6u1DRV9Vt8G69C+
	5pIihZNK3rxgQULbf2c+tHe12pBtggH2fsDodFV2WehImHMVhmsj0arfsaA+1lNj
	nNAc1CysprUxHX0NOHzcdmM7EwYIT5CSSOsujNAy5GiK0hikOJyDoKgfwEP5LgVI
	9R+xbsQE1tsQ2gbbI+PlKM+1sq7l8+YOZ0O0C67HPt4e+Qr8oBWL+1bwkLdCfqXX
	OQRMsetxeopojSy3DWBGltTstPtmEnsM3TSOP9bEKvp3m71KR/smngx394wx38Tp
	qvOuww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9jpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:29:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so6361333a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777451343; x=1778056143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=jnws1Hw1G/SVrladfDA2BjGw/1Oy0iZm0pihCeTVNN2tM/EAmPcniX3Il/Jj59M080
         clIOhtvao6/FjLvHGEUdrwdmKbBE6Q6+km77an4x66P+A8rz6aCey425k7jWaMQrEgKu
         4kFDdJHn6EjnqiAyKMc92GmF9W7OFGD9/QBz61xqTQJlQdRohnNt0nAa49zU1r1lgPPp
         ed/CiclzzcQyBW2+gzVreJ4g9/ZLLbPIh6hF2uuYrjC+MJqnjOO5Iy/UzkMAxG1ATQHz
         vJT1iSPw4bapmn+FWdIGUwOYWqFOx3em2JKhUQWRCRz+l6oI2YhKoJk0FvvyKamva4OB
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777451343; x=1778056143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=Ciod9b4YloFPWlAQGEueeAo9tsY/UKlqMdMtz+bxGgbrGRMluA6TZ2hYT3paF+QswM
         2tmkc4OslymexI+2k55aFen4T4rvCtpy5O7iNssFDaCKmvL8ssZWtTApgW1Ca6a7Sl0F
         9Gdbr63eqmhneMlpfoDFd4XZZoF4NI/ioH3+ERNFZ8uI39mUa3oO7Ngm9GYRZ3a1oK1z
         4GwXc60X7lmmIqxd2dZGDcVXZbUGiyI10BT6g6kGtTfBA2VQrx7Ped3/qenWuBQQnC2o
         oGtFxVSQTG1899lxeBxsYi8GzvD3DKGE8x/WXkIHygdD2/uVuohNqSbSn6biR4RV8vOd
         3VSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/04kDJxJ5DtAKYkNHW3RzTj5szfbDI75GLHNcKkVVb5k10RpPGULSRV0IBiAqD+iIfGcxRuJ9wL5mA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ZSomH/3w7EtTQNOgkVW23r4pkSQ6G7vwnXOUihx/VWMyrNt0
	oU5MRM/o5uCkxBCdyicApT5MMT6JwbIXaeaYw3KuQEnueKuduFhYr1PwfMopu8R3wgq6zQskul3
	ppZpDP8Rk191KQBcmlBzulvlIEvkS2Kg5RQw+2SgoXN7EKeu7rprx2pUOFGYhR7Jq
X-Gm-Gg: AeBDiesfVQ/IVOK8mBSJKzzbFGHFlY9rhJLUZOZ94UTtr0YvamCWLRMHGAr1ckUFslu
	ciNvMmgiALQa5K4ICXcYc04F5Xy+SCimUD456MFFnWV0OCuRs0BBa5wfg3m/hU2zCTYN2cQWApn
	a9/jLLZXphCeerTZpaqkUD+auPctYztBH97ePADOh/vu1mL5VC7POak+J6d/AU4EVJzAN9VsNR6
	nzuzHtXYZ9ncvn+Cb9FGwqzhw7ApNyobaItsihEpoL0v3iLQPVS59YB0cYv6k63nFiC3BL6JEvP
	aRSK/zm9aISSFHhmDs5Jgad7Eoc4/x4VjYW2vMh8C6XNfvP8kSPGan1agqLVk/aDaUZH9M2R+YL
	TSSEvErP0l4KbPiXok2DHiHT2bRWDccOh5EBFpL2JrskNxdCwzOvoLCcpvaGXwRCNpwD0v/9WOV
	UMVVkdN8G1xQ0XFmORYc1ursc3QdEwFVtgbBuxlQ/AGR0rgs8JYv0=
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376153a91.21.1777451342805;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376128a91.21.1777451342309;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1396271a91.3.2026.04.29.01.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Message-ID: <cc4380d0-d9b3-47d3-bc80-1c970ee7a5ea@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 13:58:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mihsvx1gLE68pJnfzonL9PIRCMuF56R-
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1c14f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HC_c-dvtGznJx1dPDJUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4MyBTYWx0ZWRfX0WmRy6JD8w7h
 JoSuZk6MZ3Wh0Du90Zm+6DoNbqh2D4lzTxFUkTTbcxYDvFF2xuU+DsS1zJfVe68g9iVTugwoSME
 mDnKYCdBg+hyx8acPEa0QuxZnLCzUbCujdzC1G//nOXDL9/LWxxlPP2q4VuMKjoMZUN3h5lA4sa
 4NC6JqHb/5ChiHvNjk6mYdHFjxfkS0VBoDHnxcDi8OhO0YtyeW/m1ThQt/6lS9LQpavNtrb0swx
 V6vxJXtEgwx+t5nVJseUibWG+Foe9S7g6knqqSQEvmDvr7e6XFQWdXQ12omtMZ12DaymTmbl5Lc
 NAPWedjXVwXB1uQIr1IMVd9psahJusC3LL2p7i3ebkgPIhn2Lf0I2UkGWgphwExQKtpiypyCYhW
 fVqwFKMwc25jxSF/9vi8dUsgeVTqy5/l6WZqPeWE9M5uVIS92tlCBGU5HaLg3CXanBqSQm+EcjC
 Bl8kkJGuD7H7Zty+1Rw==
X-Proofpoint-ORIG-GUID: mihsvx1gLE68pJnfzonL9PIRCMuF56R-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290083

On 4/28/2026 7:18 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    8 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 1771 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1780 insertions(+)
> 
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
