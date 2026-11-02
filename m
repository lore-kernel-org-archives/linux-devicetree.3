Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626501;
	b=HicZB3KIzWNR3nnIlwJFkMajJ/A30H/AZiBU1PjZvaOe6IX6bvjW5DsHzlfBVEh9eKD8
	 u57oeNfzi39ocQteT3iFaV9U1vaBTRKyv+eLLD18VmHZBL+bP3bmT8Q9HqBViiIY2XcTj
	 wVdx0metT0CIoAGnC+VZqAnqUaEc1NG+W+8BIL4pz9AFLhIwRcVhxLgpWNBfemOf3JsaD
	 2P2gEMC4HSbEfjdawZt96CsbSAs+po8nfVYOTC3W+eEP23j2P9LmM4PtIhwpxRqt8BsAx
	 +p+ZlkALeouzQ1Tv9SBapvbXnZGO57V3dtUlQul2JGyRkKEdiU8kl9d+J/Vxzz4tDdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
	b=kFel+0cLoNQK7wy8TksAQzfT8qYe6xYa+RvUhckepNd1ZntqoQ15aiwSJVfKApRsrfWx
	 XDDAXn972H5XcN4TdXNnrexJFEAp5wpzvUY5rzDar7GkjOFaPxIQxfW2cif8l44riHCsr
	 wZP3iOcRvWzMgojaFKRP75gO4f04GP54GgXj+rFWHfk65FGtX9JiMBykTIH6bRNELOXs2
	 uwjqkvEc6T+peQ5ULIz4p1G4kMcmuDcroI+jy+RUyMO0vVQjeT2qBuWRujkkvdFgEPMGW
	 hiL8oANMRQqUWHKLZ/yArPnRgya0EF6OM5Yen0VuhcYOfa+dNpFXkNocDG12wVtNhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B422606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B422606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpi7fyrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KO4vprHf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAO583973520
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D3OWRg1rBciJm/YVBuNgf6sr
	+pRkNnJI+vUSSl5wbsQ=; b=fpi7fyrSBEJTfdPY3Ac7FbpxbNfNRmqUrl5rsy4c
	fWTKZHcGigUUQxfQDV3oWicArPDkKb3K9yIZyEd7fwe9jwQsH9b42rUFTr6WwWgG
	dzYqYNxOCV+3pXJITXjYK8Z++MJPT2+eVWHw4fqt1zJElrvcUV0IHOsJ0NwQP17L
	HK1rXv3xV5kaehmaKbH7ykVshK6g76IbCwI/L6PE75LTXNwM0QhXk9gAttlumm8i
	8LCXrjnLlKlGgaf+xGac/2Z1LW+Gvl1Pn6saDyCAxgptvS278wiqrRTmUsr5siQz
	nsuuHzbLxjEgn60w/t6lD5rdx4a2SKZRJYO1vF2YVqgwuA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesg81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:34:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc099197b9so2502999137.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626499; x=1794231299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=KO4vprHfEwIEOMWdDGmZS00ApXb9jCCkr4ayuBfLU1wXUvpWYluYtPwOv0iF72DXAP
         a62siY1O5wfrR+ZY9XcZcZtoyyVTjPN8XcoZRs931M2jESk8R2sKTdBtMAwxznj/CGeC
         /WrMFV+5g4+2ciUH66gxLtdEY16EM1ga5cl5xr1Hwyk82wxLaH/0MUhjNJ1gfOTVNN0m
         +WAMGKoKdfhzD1XldLAkSJfrDXbFgFlJPo/n4r9ImqDkFXYzrKSDVP7+phH7eeNAet2z
         lR07lEZwG1FCfHxN8h+EhvF2zckfqYaiMSOfp2yHy8tzR5kh7b9Isoanc4HHm8fP6igN
         45uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626499; x=1794231299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3OWRg1rBciJm/YVBuNgf6sr+pRkNnJI+vUSSl5wbsQ=;
        b=VS9sqK5rV+av/+s00hS+8vXEF0IS4GHaUvjs7lyY6oSU1TLX2LkRCr1ub9O/S76p5l
         LZa30BL0dzvyRcWuM+7SYPgX9HiAh++vExuH32Byj9Wq1MW5Yt8J+omKE1TUfLCC/SIJ
         qAOO2ewtbJxyNnuM5GOpQGO2tOc1CLu2kaLeYbsDE2Uos19SNTB8C5y85JeU6ceeHBVp
         IljPvTYLf6wurQQj2F9YEscyYbL5UTEQ9kWv7nmmdbeHzn+eBJfJD7inh3YJuI3XAcYo
         23aXn+8XXI3+ux9zVZJbGXUW1khYOQMAoy6+mjtveEC23DNhURfijW8rHGe7/a5b7poV
         txnA==
X-Forwarded-Encrypted: i=1; AKwUvBxRFuFjsdn8yG5oCiW5yK3EYreKPdm2v9YrW4BZbyEe8gQ1u4TgeFCH8MtLE17qCPHE5r3NYb9vOVVI@vger.kernel.org
X-Gm-Message-State: APuU4Z80G60Nk+HSBI3K27CrvVPOpOA92bnqFtKpGhXceOsI2UXqdQpo
	h1yPZ128rpRsng1BqGXA3BAMgV9RGCIQNxdmLoDsj/AFEf06kIUZstasZILnE1l/zltzwKKj7V2
	HPIst+XaFNNfLltAbnxe0FGxtUgAKQVuvPmlU4xJG5g+qxnD+aYTuM/EcG4iZ56Gl
X-Gm-Gg: AYBFou3AnlwY17LGT1Ieu4xUTiWeW3zVif8MnrG3RRNX3vfKpo19/lyJGFjJm/oLrjr
	Mv3qXRZUu68NGAPOTrJM2Jx37hhXWyVMHUdxxeR43kKcUF89+kiNOwcQrLJRuad9sWsfBw42+RL
	FXCfsC2wC6y0i+MOUPvC6EhyPLsUWZUKUunN3FBiZuyc3wSvXeFl03o60pZjInHjBFiLxk6UKSf
	WOSuGt78MS+woMufl6NOuVe7nkiSAlTExJq/5iOfqRc0pOcoCpXfRH1eoWEn0TVkI13gpTU7Ebb
	U7VneaFGz0KnDE+RkhNooJBcgnLOZTrlo4JtAu6mvEooHAbJPX6BUENIoPpfqI8lnjzKUbsU1fc
	Qmlz7QyArkwoZ/rO6HCsYYdC766O4i/WUVJ9et40kHwVBFlv0X9x7Uj7E6oEaNTg=
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251364137.34.1793626499119;
        Mon, 02 Nov 2026 05:34:59 -0800 (PST)
X-Received: by 2002:a05:6102:524a:b0:7d0:3ed0:c630 with SMTP id ada2fe7eead31-7d072d5f983mr4251349137.34.1793626498551;
        Mon, 02 Nov 2026 05:34:58 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm19915342f8f.23.2026.11.02.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:34:57 -0800 (PST)
Date: Mon, 2 Nov 2026 15:34:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
Message-ID: <gyfssymhkvifeb5a5xh5bazpoaguqtfijrxsjlibtd6u2zm4x6@otcsrjngserp>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae89183 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX8hnTld0h4r6u
 lspF6nkFBLo6DyNao3EzrvsFRB3N4obt/Nt6TmedCqGPhzbNl3kWXQ1S0OlDkeB3Zgri0HJGuUw
 YfObgok1t89dkwR/BIe8UVQGF5KW40zZ+KgE4bP/k6qbIUKN+iKtcpgVd3kijZLcK/dwVjEJeCH
 TjY22XkelEKXUkprOcJs2q42IodCdPKociiXi+8Ho9fbY3IA6/xfWPG9gruAMchZclo26JQsv2g
 qabzuodSoe132wniFBqLlXh4OcSu/pQJznsMKEzQMxIaO80mHEDpqFyOLcTX5ZEL1R1r5Wz9VP9
 0HznqaPfFamFauWIciAy9oSbvCxRHJRQT7J0CDyv1/r3nrXrOqb9YibGb08ILfyAc5ZByz5o5Oy
 JMrbbI7882e2WsCbOelAoDyWHmZ0E6HGFXW4mF+9Xx/h/GZIArmJ4PrYmCO4gl5aH+hHItCjkof
 LIhlVDBAQDq4rt4dpxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0UeYkQ+H4Lqv
 hjFVwalj1eipLQ/yiV/mJxaovF7Rw5AQ27+YewEY+GVHDWlkdKjuJqr+yQ2fHKnQ6EImL9Q61qi
 zksDt+2tywfZ+4tmJBHBYdMztPH4c7w=
X-Proofpoint-ORIG-GUID: dJnxtVK2kSb25MTlao0OVgmYTqj5Rzyt
X-Proofpoint-GUID: dJnxtVK2kSb25MTlao0OVgmYTqj5Rzyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 26-10-30 22:41:46, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
