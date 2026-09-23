Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25849EC48
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167577; cv=none; b=HFojiHehqjwQcBdTA/NzSWqgmE/5MGTizTx/ktZLo8aOvDHG2h50lwBgNsJmHATZcnhOoO67QQc65AKju15xU5Nz6DVjeWNO8z3guNuGHfXnU8nWMCp4XB1UzezqwEvMpEGyGQwqDALelPoaICyrmD0AKay/JPaDP4ozGRcCHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167577; c=relaxed/simple;
	bh=2ptsqUzh1G3mtl60EIsCWIOKDbdj3Zp7St1CjUKx+vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq7iVZzrH6CZDeazl0arfRpMqg+iYRA6e57Je/JT25jIdWedUq22l4Ty5wyIRqfnLxhJK9A46/9vDOiR8D/PT8u3Bx6CMhBhyjxydHwUXZaU6B4LcelrSa6NZieBLVNiEXUF6ndmmwIbFgspld3woylOxsccApRgVNtqPO88Y6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dn6lPZvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxN6l/QA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dn6lPZvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxN6l/QA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUP2099053
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=; b=Dn6lPZvBvB0CYGpp
	PK7LthTcz42F4nj8aBDfb3wx0nC/f1s91ZrGhYM6XpVUT1hCriuPRUaW/HnhiVC6
	2A558geTm42jC1gZ0bVxqkPPB76n6UGozJ1g8ilb1cbKngeAvoyCKvgTSG7Pe2ts
	fIcrzaFkF2GNl/nAHg7AFDlpGbt3piLQbdojuna33wRSqHwLwJ9mek80Ne5Bmkbj
	rDWbHqJX3JZymNgXrSuPmI3gEeIhyKS9R+aRaq9gusVTb+8fUVQ0iiaFJ2Yie9UR
	YPIsOxoUj5MwlKfGA5JNtJyxXViwylPqvJThkGGLD5y5loABPrjGbRov3qSzruHg
	q8NE1Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c4d4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806a17a7baso26289241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167574; x=1790772374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=;
        b=WxN6l/QATc8zYPQyAjMcPtwx93wSDo2nAxdPli+izbM0rlfdrkj3ssEw1lxmhpBL+f
         iyctlHZPCjiWDLtlsBUy2JT8xePLWfBKfUfrbuRESyiD8684XFBAFjzWXgljy5aWEr/O
         D+dJQSE5BDBQTk+NcnU9G4ystweS6gXZExZIVMmDEmPexDF1pPCb67L/gl7/d2/ydm/Y
         9k/sKDBDz2Pyfi14F9gebWrCFCPq0zxOjuXkUqCImU1h3y9BdQgk8Do28OKkcMadG9Jf
         TRgwR92YB9kTH65OFcEyRTHI1LDAbm7dDsV1e7DkVbzZe479Tt+43OJ+4T2W38hfRz9u
         3PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167574; x=1790772374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=;
        b=O/YSHv++zIS3LleI2Y/u2WDaiUBWKfrqt5FqgRBqQRrbT8bTLOEKuqylCrARt54EOE
         qWRmSYxnRksWlqk7aqO6fdUajYiRYmCem8WHoBPwnBjl1Xfl4cfxlY2CWRRbgqJJ8HUQ
         dW6aR5LLOR8koecApFHVSivWABJ7DaP72XfHYzAafldYE2o8g7Se0Q8Bzfli+XcoNwwM
         dWjfX1Lw6aFL8GUy5tjIlQXqoK9ne5WCv5bhYKGJkd5tJNtKiueS2eC7ffYs5MkFN1Xg
         6n3HEVWLuw3Uh4d8QS1yE3GjpylpdhLAxIki8122Wt4Q8EUXmPsLsg6xwuubWMYrO2hV
         CD3A==
X-Forwarded-Encrypted: i=1; AKwUvBzdmq4nZVw0RCJL5of29azhWgaQO+vgj8PC7+7RB5TZ36QUZqXw9BjgU1gzuvYVubt/DyUpxBgMFT9v@vger.kernel.org
X-Gm-Message-State: AFuF++kAfVV7HmYpClQiE8uIQ2u5Wj7chXiRaZ66TyZYVbYsK5zIktoA
	eRIegTl+o2TU/FZuPF6YIXw6wyQtVRUmvtq443zNoRhUfky1UxFFrDvNk+mDfyKTXTjPecXLE8C
	euXI8B/KNVhSiO/STSRyYh0dim6aTQLB+xWl/PSfBcnmwoqIixOAOT3iablCegMwt
X-Gm-Gg: AYBFou0Y/S3odvU5eH/uRpkd1zUIE//O3rRx4zzSF+l0ShAPCGku5G0bDvm6zuLjrYD
	wNa9MXG4EqoYYxVGXBlPbxo0807DXSsuAdPHCBQeHBCKXLdiKJKMMDMxC8g7hYXS70IhhKGrTRX
	u5X7O8NvIZAz/k92kJfer5CH3e1xEYOB7A2c9Rt+RXEtsngqn0m79ZwTXnKHM8x7vZhHbiE+e2m
	8XI4Jm7EbXboHPNJvOG3NOEZ7yqdPkcV7HqMdKhHQPtv6cHEehbEWMY3ZeUilKCdVjUy5eDabx3
	EwND9C0PBW9vu6DHKBQMuwlzNDAVZMPCJFDQYmRQUJIJXCgRGVHC1e5VDVpVA5O+srLpnI7/Kx9
	m6XuJDv1WPt45x9vfhnn87Q==
X-Received: by 2002:a05:6102:e08:b0:7ae:546e:4ca with SMTP id ada2fe7eead31-7ae546e088emr430760137.3.1790167573911;
        Wed, 23 Sep 2026 05:46:13 -0700 (PDT)
X-Received: by 2002:a05:6102:e08:b0:7ae:546e:4ca with SMTP id ada2fe7eead31-7ae546e088emr430753137.3.1790167573414;
        Wed, 23 Sep 2026 05:46:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5524sm113601366b.21.2026.09.23.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:46:12 -0700 (PDT)
Message-ID: <7431ceec-62dc-4dcb-baa4-9ec41392e72c@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:46:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Extend the
 xbl_mem region
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        Petr Hodina <petr.hodina@protonmail.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260916-sdm845-xbl-mem-v1-0-6e3c88507997@ixit.cz>
 <20260916-sdm845-xbl-mem-v1-1-6e3c88507997@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-sdm845-xbl-mem-v1-1-6e3c88507997@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX5nlZDARWjSSs
 LzBlNHCiR+0U5T3GhpaSYrB+Lug/DuVqg1H0Am+MeLC1TImt8v/LHuaUqoJIMhhGHETu+DIZ925
 +Sz/zlqiIjcWKc50EP1DWW1WP+mjr0PnxjqFJDaVsJDY8nNvUHAnjn9wyNwjA1iatEG3XF5srbH
 pm3YjTNlqqR2tauSUJBMeG1noC/WY7MKr3BFuVKVSKgInQLeZX2ton+zijNEPUSMvQcDy37t38l
 YFgxY5eIbem6XVUeBt8dTATN0y3K1BdHjSEGNvqC9PQ//9fLsMftIEFJmsIYnDfZjvqIblN8Yvm
 p4E6hP5aG8JUhTpoDZlq/UAtTdBG0ihemNZKEEuMCqo2dl2l+uo+1OSFAD9510WUyu7MaLWy8J2
 mR6UNUye0vTxyy2MonrzNQGU1QnTUb8jAWyDmAdNPidcCVP7AYl7x12pQzH96meTs1sMf62MW/R
 2rRSlwiIBImCX5j1r+Q==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3ca17 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fZxPOWFe8h4dJMscNt8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: QP82yV5hJUrx3I0qhWu57tdbaNdgE8le
X-Proofpoint-GUID: QP82yV5hJUrx3I0qhWu57tdbaNdgE8le
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX6LtI2h+gNcSj
 FuhRNvntlXj3we+Twa10t62+QvfEE5R2NM5erYvIonvTM5n9bCgSferPdYmFSHw6YrnQfEmEbmc
 r7gXI0xJ6yX0JGDPdbnqDhlwYMRRR6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/16/26 12:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Xiaomi's Oreo-era tree still had the CAF 1 MiB region, the 2 MiB version
> arrived with the Pie import. This isn't a board-layout quirk, it tracks
> the firmware. The later XBL wants one extra MiB below the old region.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
