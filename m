Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787133;
	b=ihfuPDJJHBsn80zvFeiNBvU7oMGimeebxUlhQyKVK5R0+x/DuEe7E5hjfc6eUbCPAR7a
	 mcfUxzfoXOjbSqHrLlr2YOAx75UAMVJ76r10OFYdtKxlk+caKQQ7QjaB3OU58lkSWPvj7
	 Z6z9jKco7aijRubRfTngX+uxDk6el9wMHS+507ASRQH2gsJ7fv2UxnHCps4KQdZ/VutAt
	 em6hTez732hRFzAESGFEqxiF2PrVyOjFCOn9bU02h4zYBmuTK2nNmH4XMlSG38qMqgju4
	 mykzrzEAscnlDt1E1lU1/dCcE/qjAa5Jtz6I+pvbgMP81NsTienxld+GXhH4XHdgfPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
	b=3CrYmw4i+k2Ua1hOZB95J8gTWCBNB7GmidXwA7vduzBJrPFIAUTF474gQC7OSCyUz1Pj
	 aLSlIY6BnA4Jv7I2pq/IoFHL8ciMRmcYTDk4NjUvqSWWVkNcXM7dD/3ncLiXFF8hwVSM/
	 n/DKGA6Exlmg73JAaprwK6VsAxo76ovhFpiPtQh0q9SDKZL7n8LSg8ApoBCDIjW74GR8Q
	 VR0noClZxrBKNnx1u5BKKoe685a9J34QD+4xPh9r7tEr/m2QFvj1cWQ/QK8H/DBgPOAtx
	 PmGGZ3AvPYyVLTpf2iPM9iujsS0aLroKyBrOp+Tkfr6BjfHlOb0lJzjdHA8XVg9vo9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LZsWLSvD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbsu7DeE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBCB606A681
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBCB606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LZsWLSvD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbsu7DeE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChKsf2205251
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=; b=LZsWLSvDbEYy1cLu
	pcHv1Opi4Uksg74eBpY0ZkrCJxpmeYSg9GxFGlx+QaPqv8ZaV1Y9ZNFxbi5hftTL
	FHWyMUHog+wUYMYQtor1AHGQIg6W2P9wn26PcReDtjWO8a89YFIUdXOu3cggBWcr
	+hDHC1TbJzp2mwsEIuqdwFurrcHyNklXuKLBKk9rGuNTuez0EbQHuPmcRR6pGOmZ
	qyXrZODCVe2XP49NQs/+jJb9vLkUP4h+utbnR/WJHr2fX7UtOCwINm+Kq/1xa8Qj
	rsejN2ZnCVbrMXQ+kPUFOvccs0fuCk6P6Ii9+4Xdsw6++21Qpc81zwzk0V6Oahh5
	ojti8Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu9hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso317217e0c.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787131; x=1796391931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
        b=Tbsu7DeEIZfrvujv7jEvTUeD2gUIUsVleMf665e8iJuRaMY+qj1dTe9qkvytLpv/Bw
         YgTueEDb6hdf/CA8uXkuHVaCa8VFE1WyT8jA/lXuMYQjG6sRbnnUmSI68uLysn9tvJ81
         4a/S4CgiFCr1JamSSQmIhW08qzaMv6gsxX1i48vjDIVVyTPSNNXw0LhF2NnoVaJQluyA
         n3w3djtIv9qix3HIxtu/MkzMTfBCjeTYJn9AHJMhg0hothTfZDZRoTpAKl4pue7QyIgB
         AXL68K/ZYEhKhdnmdMTh2zZXnMMeTV5w/1lPlruI5xRzGqpbgVd2pO0d6mG0y/5bLaq+
         Yexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787131; x=1796391931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/nekd2MO+sDn7F6GmkFOILNLjOXtTHs47xIKsa0F0U=;
        b=LZH8zbYpaO+8em6B8/L4objLAh1rvM44BwM3bkslTGELPSEC9qVvC/Bp1HNnH9KD5g
         lRHBEvPZQbq/Z9Xc94/7VWJkQAhHAO/TyAR6sdfrkzdcrITerkZzoO58uhqZ86eNz9zz
         aoXBCpUkLgb4me6sa1iDagB7QZ9NSDijTsSnfygzT01N2hzFUQnOQIRA7IH2l2cQcjBt
         ZN9hULx0irR+xkDlNo8RqqolqDp4cea5Ux/rm8BV6GZGixsF4pAbF3HXCbNUe9y7KTAb
         kx8modSqcoeX1PEQxKWCCu8AirDXVaeWY1+j4SWRgCx50y+v8cu51xbc4WrRYuUmM/tQ
         qRlw==
X-Forwarded-Encrypted: i=1; AL+hErGV/qcMc6IvcRP3P1m3+8TgrOVUtKXxuzTmYcwPHuXXtK3dgNxf4da/ImrgEoWkTta2BAHfaFp4bzCD@vger.kernel.org
X-Gm-Message-State: APuU4Z/uhzPVGItpchxae0qBzwhCXs8gMgu3efOC717if2e7FuGiDWGy
	exRTG8BJBnjPllrQW+FPpM1DWlqUjIkusmmjedw0LzgxW3xK32zwEel909ZHUf3uB5eGRs5NkFg
	Q59RBA4Qvd2yAB3xj64oDA7nQMqQKxHvlp7aecH+otPHQ500bPOYQjh6L2h6glQFQ
X-Gm-Gg: AZFdTZdtT/EnGEbkMjot45a54LMa/cx2rwbCNgrH2yMNL0JNq+xJMqpIZwjmwMRNwlB
	AxFDpZKHuK5B1WLnkJnBLdOIuHT+VMHPIGATin8eSIHDFRvuMUXcJ6w3jdK4hyFyc3+G9lLeIKe
	BW7X/mJcFswGsoPE48kBA4HdIjdwM7w5QuInZTUFSIHGHuW+A41xcxmUFP4iRdbuTHUcKhDzQfr
	BzUQBe6DFucHhFXdB6wCh+DlWnshhavB0o416apDmz43JcnbRZ75EUL+AfvblvshS1enT7tYTI6
	TUWnVDo9KxJ3wBX87ZWBtyYkDN6X+uNpKbwIVBNfAzUW0qNRq57Jb7H3N4mBysdSL9743ejm0Nf
	f+EJejEtRa+Z31fhWGGHHnOCXUIPkc9WNBnfqfY4uw/2X2nx7bKsPUFIIgizeqv/o0ukJmqU=
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr18107566e0c.3.1795787130995;
        Fri, 27 Nov 2026 05:45:30 -0800 (PST)
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr18107503e0c.3.1795787130540;
        Fri, 27 Nov 2026 05:45:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm864314266b.80.2026.11.27.05.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:45:29 -0800 (PST)
Message-ID: <26b3fb31-7f1d-4464-8c6b-6a70a962d1e6@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:45:28 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: Enable
 SMB2370_2
To: darkobas@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261124-yoga-slim7x-smb2370-v1-1-2656ec0226e7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-yoga-slim7x-smb2370-v1-1-2656ec0226e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX+QSsht5mIhn/
 BPY4LcrAEaW15isvrY/32rP4vKoq9sIjEDjolkigAoK2kpHupwhSCHbQdKqIGrOaME+gbiMrkcl
 twW/0v8EDlZCFf6Fs+zDNuaTMgbzX0s=
X-Proofpoint-GUID: rASG4CHUJkRDXGb05EJ6-Gb18B0Q_p8L
X-Proofpoint-ORIG-GUID: rASG4CHUJkRDXGb05EJ6-Gb18B0Q_p8L
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09897c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iV1U767r0ELgtbyuQYUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfXwsEtbuz92jcP
 +hU/ctrqXXShCQC55SKiC7xXNwlM/L+ZOOQTEUmua/BIDMhfHY95+TAEYNbFfPBqbhvv7sgEmVH
 zPmbfzVVvFcC2U7umTjXDs6ob3cW76vOAyygPGYo3/jCW3JNmN75Ar1NvM2ePEeDFf0cXDko0d3
 7ASLbi3Rp/tyGGxFgYm6YwgqpRkm256ALtx1bHqiT8ijvchP3JYw8gMGKbKZnsqS0XUPpNowWaH
 3Gp7Lg78VPyg1deyN+wBN2tKpQ0SxmSB9e8GFyjZUZq/tdyvihyV/ra/djoRLwISWEPrAxh4IAC
 vE1m8rowl5OQd12D7/Xbh2ePRGR10L9541PgivCfPVDU/6jPJXoqKXaa/nX+evGbAS7qr3ZX2zu
 AmMC+YKXJWNzaMcoKuw2jww1FT7M01as3LvG4EtjWMs506gz1P+nCPWUs+qllnfbUQSpHASMLyZ
 ekQqLwTaWWtm6TVKCVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054

On 11/24/26 10:51 PM, Marko Zidaric via B4 Relay wrote:
> From: Marko Zidaric <darkobas@gmail.com>
> 
> The eUSB2 repeater of the third Type-C port sits on SMB2370_2, which is
> disabled by default. The board file only set status on the repeater
> child node, so usb_2 never probes.
> 
> Enable the PMIC node instead.
> 
> Fixes: a741ecde8949 ("arm64: dts: qcom: glymur: Add Lenovo Yoga Slim 7x Gen11")
> Signed-off-by: Marko Zidaric <darkobas@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
