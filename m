Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614E522EF4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168490; cv=none; b=qYpJ/kqUzAtLt6cir35w2/5oWm9s7LvyqmyFdEOUePYVdFan98nnGJyZZgqDqkfCWgB4GtQXKNocM4vIKdtSz9UiFeFk4H84Q+4eDobvzdv8nfFriQEyRsHnjnHSrpNKfjgiQtMeI3PThu+c7yCxC2CYlJYivl/9zBHteJmTsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168490; c=relaxed/simple;
	bh=BQhmcQ8/Z22Yw6lCi4BPzDtsGaWpPHmu4Ypwm/KljfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEN2MIeMdTJ8NC182+WieO2ogqj92BQXtGUHN1kDWxAYQLnpY99wvOJp3k1e3Td86mZDHeukl+ZDWtIbQ6TN3mKqSkxVRFQSX5GGMYeFeB6BveswV8t7MKhAxIQRMsJuMCyy2y7xsgcB/AWzh2TD30TdZ18zu3MGTlsB/8JHGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wx74NA7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkEmX4PT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wx74NA7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkEmX4PT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbaIo1831890
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=; b=Wx74NA7QxKHAGwP0
	hsMY3mR9BqNLCF3A3lZaUQJkKlDw20Xrl5KUQBJy96tF5YpwgJMRo1TTjGGD/8NH
	tGsoGkCsPIhfEXSqrm5+Jz1Kz7rA012tpO06JHzbnGloNbQ5mlZNPLhyfbwUF8k1
	wXw5f2dnnLe1GruVvA8mCvMX3Stf/nsSI8eQNx6TJzMq0kMf67HwUvdXHkDik9Ob
	W+1RIEtRugOHUQMouFMCMDzCs2g+sB5SAV8rhnqiMyKiYFKiWQ/obqOxoEdajPxZ
	LTOiiXcOfXqxKQZMeyYrzyJ0dFC/5w1JB4ziwjMR4BgC1LRkHRRwl5m/HT6GAX2q
	4EmDvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma40gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a03c441e2aso217262a91.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168487; x=1790773287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=;
        b=BkEmX4PTS7zwd9j47xDGNDRgiZ+2JWN7Yo29iQ8C7edLKTbFg5XsAKdvNA+hkjuNwv
         8YCpydEKYodRpeCwzLmKTfceHpKgqF1ZazLoREhS407uzECEtssX8KV5/q/N+gn+HrAN
         2SEbTdqSifOG5S4EKLq3NtKBqDxHduGAeuwqGGQoHRDjiHCxpMxrdOJ/62fRHqp5/7Z7
         UPV0dKCIpr93hsRcO0bk024DMaLxUUNUwYqaWNMhbw4nCO9jAjK9wq9F7cjkcx3enBAx
         ylNCakbgxS/J91CKQ/Pu2uiRPIhpPhzQl5GrKarcjWuSWseAXzOUYskbEpIyMAzbCzrU
         lp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168487; x=1790773287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=;
        b=EWZIb24vewANTr8K5KIlSYXLnaLwGrA97fax8DWqVeO+1AvS8mljy9ZmEvzqjHBKEO
         Jt4S3Y9fYWTG5W+5pt6SFTFmvlI9n6ZxL/4gUxVSzCFKJgFC4mX8ZrP17HcqndRMPbdj
         tmX5OdyJnr8FJIp6pZkit4oEgRrM6vzf4fjCuw/IafwKXs0R/x/xjGYtgh8baCWzxf73
         Nd/ne4XOUtI2qY66LnJgfy/JsgfH/n/vJjn6c9/Qfjd4YdDkeoFIc6VNWAs6X8Ejj1jA
         YyFH0jog0hVFZ28XrOITQ70vS++JxTtCEj6gVp2CwzjXjlnop8/VeA9sIT0d7SnD5u/9
         T0GQ==
X-Forwarded-Encrypted: i=1; AKwUvByofRw65BqztwyoHD0hz+nt7pPaOhJf4pFyXBKu0kR3TfSMKVTiXrM98nOSyzm0AMdEYcmLMgaT01dV@vger.kernel.org
X-Gm-Message-State: AFuF++kiS4L0eTkt6LjIhFB/yKix20N5eQoDiXgUGx9Gvvq7EmTuPQnv
	BB8RVxjEK4r5RklU/pcNVyuoNv/qwRP3Mt2v5K1V7EwuOn4uHbg7Y8c6pwL3bhRxsQAB12q3V9Q
	0Kbk3Wg5wWr39O/j/2pGl91a51HV0xnJzqK2Erw0RgnhiHg65SauFXxgeo4qbyFRr
X-Gm-Gg: AYBFou2doEWFSyXopL81ihfogluAhcvxC8KDiw/9Ar6kC/wcN2mVvo4b8DrDuxSBB8P
	r8Sfw1PuWYBe7YiTOOUoHrYuUF1A9vRgveINSUQA6VlFaN5JwxXecAPhLafxIdn6sY1DZoJh1UM
	o6Hw81FiizZsBTwqiTbWn/rffbpwMx44TIuFOm27jbdRFKQJxeyj0h0AiJU292gazkVSrItpU2k
	o7qoqfEhQIi/uXHQfab+LwIY7+hkON4Z+2ZSeWbwBIM3CpxYHEdPlLzvYbRfeNWwKOYJKmk12/O
	5sQwU3OBgeO+r9HMjxXHrJPtEC4JgvO2XSqqWyr3nHKto8Vc6dcscWz4bSuFyT3Xb6jigLiLY+o
	PWspAtXXxZDd4Uzz+9uIDDPYAgI9NbE0d
X-Received: by 2002:a17:90b:5290:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-3a07e708070mr3594703a91.3.1790168482074;
        Wed, 23 Sep 2026 06:01:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-3a07e708070mr3594629a91.3.1790168481508;
        Wed, 23 Sep 2026 06:01:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d2defsm113710966b.56.2026.09.23.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:19 -0700 (PDT)
Message-ID: <19853f61-70d6-4727-b8df-da628c0b88ae@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 3/5] arm64: dts: qcom: shikra-cqm-evk: enable
 the first Ethernet port
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vSBrYOqPiuix5L6__Ce2sgA7LXbvwKed
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX8C/52YZuZ3M1
 B/3uulAtuKoeyrG/2LI+RCfC9ByyX0r8mqj7g7gQqXrIjHSqTssvOcUsYqBJeyV2c3qYTpOGDeT
 IB9Jd8LS/Kyxz199Miwf4rQgv2kWfHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1Vfplfj1a6g2
 PMxLPdMkfxMPto41Vu3VzbkMuZDXrEreCngjKWdBIN4utxViqQYFkKk+4+vZyDHEOr/xv6CPMrZ
 mzfomyDL6i5TTJH7yT86jjQUezCcvCCniC34AsVf/FiRg8tYQNwjxgHTtYKfK1vW6zyNcTtF9ZS
 iqjOZ7pvxVOTvrFaCtpewNZS2G2Lm9ry4g7FLs+2jbLHaJjXLz0KT/A1vVW8oZLOTzrGyF7tlM3
 4ZEJLBNxwqq9prcbPerkjjxPfUEYXFC/PxfO+hMud4O6H30g5E67ZUCsEnAwL+JeSgTItUE4M3h
 LMrZofR0JHWblwRqTNP3leVJjQ9OoJr3iLvHqUATXWiJXzfgMaoUzPWrBVQY9PpUNNw4SuEhXLs
 2Cn3QGtV44bIW/6kuERbax7CLwofShfWxOwCJ3fpMdXKbYa9fQm2Yz1L23F1gZ02Kwfxkmt6WaX
 4PiUdjxSQLQ0h151o+w==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3cda7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fr0nlaHK86MzVMgUQ3gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vSBrYOqPiuix5L6__Ce2sgA7LXbvwKed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 for the Shikra CQM EVK board with its DP83867 RGMII
> PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---


[...]

> +&tlmm {
> +	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
> +		pins = "gpio149";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You shouldn't need that - the driver will take care of the 
GPIO

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
