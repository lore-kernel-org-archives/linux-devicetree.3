Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C630B508
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205699; cv=none; b=Lfrs6WZVDYxK3LV/AgZOHqiIDHeYhsZegJSIMAPggLb1ke0Zk5cBaFBwVZpGc7SrCAfepd1fvF/61js0ECSnf75wcWZwp4QTSVjj4CW6nj2bNHDpPuLlmXVVI2flX0GixCbhU0blM0bDa4yY6LZemdu5M93qv/nwN2fT1Hi6mO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205699; c=relaxed/simple;
	bh=zM5ygIRfr6T5q2HjenYVrxQr2Py/9mOvTlWDJRoNssE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxZIjLLKJtXYdNFr8wXBUy/iFWfkR3S7L2cWj1bMC8a4T9GDiX+vRX/5DW6njkxqfQ0+r0ognyRstO6blJUXs4gIohZw+Ni288oF70EXz5DiSeyciqafuw08m5aKTHDdmnxC25inEsqFY/xxL95Vqb6K6BQij4LSVK7Q1GHH+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1q6wAHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGFQ8JJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1q6wAHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGFQ8JJC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d7BH3376137
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=; b=X1q6wAHgchGik5br
	XriuufvYcwN3RP2fs0QMtgkyW+O4x3A+0ud7XboJ+OuiJ1YiBW4dd0bRYNIVwyIb
	7T4d5UBjCdnJgmxTPb0HMzjgyTgulP4zKgqnxSl9Z7x5SrB8y3RwTdXk2s9VALMB
	5aYuszB0tuptQLcI3YHhHFHVwpVoOpwIlYUC/qxkPYfqGalptoZTvLN5gkzamSF4
	30FZulovzajYMq5r6LjL2eQmyYetESF0SzuNfphYwxCNfXEkcM6b3sXpe8ylopAK
	lFET7VZpVvHxVmGnro+BJGoKPtuNxL+06Q3bo7TadGzZ9MzE1PrFXjQhY5E8dlsz
	9Kffyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yebuuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:08:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453a81b846so7805080b3a.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205695; x=1782810495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=QGFQ8JJClogMN/d5OjeHxjqku0HivEmqIa++Ccr+rGnsODlA04JdxgNKM0dOTTFQ3J
         aQTeaWP7pLSy+RH2s4VRZd5SECkzHyZdRf85KAOUFY+XhvoJnKHXTKsp4CvRAEJxEja+
         BicCZxMxq8HH/ZqAXpF6csG3f7wyM0HK8n5P1Y8eRooCl4JhE9sEAr4hUHqLUXrSmd2/
         fosrgTbg4cd/iNFgO8YZ2pUvDBoXVTrio4xZReND1/smlrpwuexMLbaqNbNtZXioFY48
         jpetOrI1ujxobS2yvdxWdYDhRBw9P17Sf9/MaJRaSGl86QjRmsuxcQxj/myj9uuTs3Bd
         DCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205695; x=1782810495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I37pwTRNyH2lUXmBptqTrcmcDaXs7c+RllBrCyhsjRU=;
        b=pAFsQ4nIbicNtd4fAvzTaDPdq/IpJqRsBFdWUl/owv4S6CsSxnbbqo05zdkRJDLOI8
         UdytoTw9etznsThs6ogx1PJHSJIYm5+4uEm1UZZu9prXu2puVBUTEwIJEjCVfrgbWvps
         95vOZ1RHcz4jTqy6Nby2Wqn33uwtn2Or8oPVn8YmoCitpJOYP5z7Wmv3prMBNx2ODaSI
         bXVVBpnbdi0tXvEBpnIvjNj16WWN1sYwaPCMvpqunnMuNDepq8MFnWwlzz8jDcQ2Owcw
         rylD9zdVKADkp4aPR8k/E8i43/M1ZuJOyqAImAViXCrhIuHLBt0wGeeJa35CCBPde5Jq
         Sh4A==
X-Forwarded-Encrypted: i=1; AFNElJ/cc4tvtdIIOCPObVWRYkDi5LoX9CBsZdEfpWIIxJ/PmvKvqYrg6eClNzw7eDdrp+mWWcPJdi/z2BbE@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcyW7QpayTVFwBXB832ABLjps8QH3ujSiB29ZY40hOonp9Puf
	iNoxMvYvlcrUiTMWynU5ia5ZUQ7VC6DMCKZA+PSYX8nBpBmmH+FXHRP69iCT7rZUFdE5KsxYtON
	9ZMHvW1vfktcRlgnnD72YWnVCVkoaRlQFprlPzbFud6JTMLnkLXMwXhkt7UqtuGjG
X-Gm-Gg: AfdE7cmCsgC5/jHw4OcNg4exiFi8hr59reUnM8ySq9EvS+jE5lIwuxGEcVq6aOBoIXs
	D+7oh+qXOfBCIWzwobFFjQVaja2LMMc/sznB9p6aHqeAow7uJ7oTNef6Oev/JBNky4wCZ5LHOW1
	tl5ndr0vgsvHndfHuiWtZkp51UsiL57qCHzoUEHK6/YAeoHezG7NLYZ2OHb69quUWuPBgK5Kzga
	ovELNcwagBymPzwoBmkbAmWN7ygdiJfvPSHNddxe2M1tV4fhW6XxJqLtn2tjbuVRwlHfY8DO6jb
	EYhruAySctwTcRQpOmbKUWNgTZlrzHpR3V7AL9W7Z0MKAl/AfcF2oU3jsDEk+hTRbK1V2sOM9+a
	Lyb4aisxWsv3wZCSZwQuz88jeH8UORNXy/egctGbwAlHEbUIGQ1Ts1psPfyupwqBlKbZ+GEIenq
	D5
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902374b3a.9.1782205695103;
        Tue, 23 Jun 2026 02:08:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:6017:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-8459700a9a3mr1902324b3a.9.1782205694644;
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm9431287b3a.47.2026.06.23.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:08:14 -0700 (PDT)
Message-ID: <7c75dc89-f62b-47f2-b5ba-63b9e91c9394@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:08:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zwFhgsu0rXxFIqtRTCEfo7lTZbV3asF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX5FpiwbyndyS3
 OCr72FRoFXJ9OGBI8ty7TXuEmqv0hip8i0895rmIJTKdTFqVGALqQwOtrHQTDwEfU8NUa0cDiwq
 bhXQZpspdccVG7wgqQ0uBRMCZx5Ihfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX4l1MiachMnMn
 HyCB1sFfgTTASMQKRNafklsgIOA7dAT2BKXC0JfTimCLnxry3K04hSbX1FTm8ZiptfK350yR1GX
 A9ZCgmPssJ0kJyj53B4zH2hdW0fXMU09r2D67BkntZhidZVkA/p0kb7H1N2gkcGOccKhTyP4lzf
 dNCwzzVp6M/3rQ5D6Qe58HIpoHpY95O+4SHVK2MfADjG9lUx7Z0Kcm4wtw/nUrCu8zSSM/va0e6
 ijgX/evTpn2CoWwjcgQ8wT4gawenmtDi/bIC/Yq7U7RlQxfuZfo87CVO0dEC4fqZnJF4k0+p9Ju
 4peHd6gwU4fAX8prLdapQlGBz3+Qgn2+3Jo9I3cv/bR8AemUa5x5deYEo/f+3BSkXtfLhk3aCiV
 F+IC56V5UhRbUpm45oLX9+bVTeqtYmBSI/VAKqPuqyjdIweZAqcukiu2Ari+jiGmeFdqzBueIxh
 HssRMyPrqMcAQIp/hKg==
X-Proofpoint-GUID: zwFhgsu0rXxFIqtRTCEfo7lTZbV3asF9
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a4d00 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=L7gb0O4lDvObzA7K1y4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230072



On 6/23/2026 4:10 PM, Andrew Lunn wrote:
> Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
> <quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
> "quicinc.com" addresses were deprecated for public work.  All Qualcomm
> contributors are aware of that and were asked to fix their addresses.
> 
> Driver is not supported - in terms of how netdev understands supported
> commitment - if maintainer does not care to receive the patches for its
> code, so demote it to "maintained" to reflect true status.
> 
> Fix all occurences of Luo Jie email address to preferred and working
> domain.

Thanks a lot for fixing my email address and for the help!
Acked-by: Luo Jie <jie.luo@oss.qualcomm.com>

