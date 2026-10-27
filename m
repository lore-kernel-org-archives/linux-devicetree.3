Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099546;
	b=d7zWVFGWS9XCZqhMiFsXE2C8G0geFJiNko9GuElazdCEm2hbI/1Vfl2c63JpjN8wGJVF
	 I7Qn8l5Z8lCDExjRGfmATax0DqJTIpgeGMmiiFtkFp4yRzlVbmw8fhDm+Uv0hhrWRP3DF
	 DM9Lxj6Z/iGCpNkoNFMlfgEU19DhS/91+GpLjUHvrjmz3wbYV5ilSiN6YcV0Vzr27O5IY
	 eaHMnbren1pPN5kFYmit8fzRITRXzbX8xWrdj9FtpANzVm7rHucH8e9aok+3zSy6EM2At
	 sHi3PohdRJMcJpVqXezGJd81yd4iqQtnNxzk/7T3W+pkHv9Y3VSgafVzAQvd4Xbbuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
	b=z/z5CDXGjWaIXiLdny+vh6jM3hBfbt81/bPbX7Imv0zccvc/i50c8KQ5ABXW/GHlwJCN
	 mfy4y3w5DaH7YpyBb/ir9Bk2I+4xO0x2nrV3yqVofjeicZgQSUMiOVSy1lNmCuLIyVJWO
	 jLMQSPRX47v3k7qAuQuIOkba5TU3MnsJXRmYpdyfplWmNh0hEgdzVThGsee35yPoPmFnO
	 GekPbLwhMmuQW5Ts8RgPH9qVv3pRnkrqgWiogpIPygJjOvQ4qkB+FReT+p6MNiG/IwINy
	 BlkjRCoGEC7E/zfM6FrSFo4QzwAskjUU6rtJLuByluJLlUi+DZ0EuV7FaYA22Y+ltLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E7606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 968E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVwAbHdu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLUBIBMe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxbG2523923
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5LcItJXuNXFQ1eh8RpKnheo0
	zJPTojpSv8nt0cOFZYU=; b=WVwAbHdubapu1ysJDNo6+QNjAk9/RtUim9IQOBEY
	2WgttqTaUtEV0gY3NVeZdHNWhRP62xUWprrxsKfJRq0+bZ/jRLnjqx1syqaIch8d
	S8QhCaAAb/yMmCKNQeqYR8oqEi1hGOw7cvbZNUMZSBuooyKPKnaYb7Xvu3eVw+Bl
	hCVwNdwAi9XAhTcyTmytAHsMc1pDg6DTc6Y6KGxbLIqy09ADacDMSs1W9FJD6MMo
	RCT+DsOCTUY+Bm/3rKPdTBF3rLG8XZR6TdU1ucNG/uvcVqtnxju5Wohz64YXBTZp
	FZsY6uef2QHqGp9KtR06WWSdeaK0s9399p3z9WXXoR4ZgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20s7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:12:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so767788785a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099544; x=1793704344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=OLUBIBMe8d+uuIMgk/DLnmaj+3M/vrzbGMwraXN2ynLZw/JtKMp7KAhOaD0k4QIIDj
         yoPml9JSw1/Y9LyvdThIf3m/qMuvhPB7Jm+P78SWNQH3WjzBCBNRXX74BKnoFQnzhL8V
         GtF0ty5EGYUQzwTBRAWStZVhyPdPvb2g+CZSseEccRiO4hGahMQa8OsVyx33IQD/Rw81
         58Zn0F9RIfT2RAiNlLczx+NFT7ohwEwvgxrYzCgk9nhE1TJ7iUDflHD4Yv+n+9/j05p0
         H2iy5Y/X203byrN/GX4f7PjViiT7+7annNm27Jd5ELSf4ZyNqSTrCMpwoqit+CTZ8C3f
         U3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099544; x=1793704344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LcItJXuNXFQ1eh8RpKnheo0zJPTojpSv8nt0cOFZYU=;
        b=owm3kWyWmHOrpB/bRPKlyRvOzRxobboqa7ZIgsAoq8gW1B4XEhZHFajp/Ilc1PSFI3
         piJfSJoR+83fZVcuGsHF2KLy/GvlN4cJQiJR9rRV1SFJaAG1U64gfdvyShPe/In6jhwx
         j7x7S5wSspg6sXumPw14XfTZ8lZ51kEUl05ajNgOmhl9IItSuPeTaK6CsNPdkiMzDXBF
         gjnOY/ANHg1FHt46Iah52XCPWVrJ+V8y2WfP0ctFYvp4+OvMDYPh/Zb8oT00LkH57uTH
         cKkYlV80atBX2haqahigtcpHle9qGUXx9caZ363gDoFQrr3RQOXzn7xbOKADPfD5u8F8
         I3fg==
X-Forwarded-Encrypted: i=1; AKwUvBzNCcCJnEOKAd7mv1N29lC7tk3Rhc5gRvWL95iW24gKx1JoXCBguO8vUWrq9Gsko9pnfQFT+j6yb4D9@vger.kernel.org
X-Gm-Message-State: AFq9FYLBTkknzG1ImhzAudRDLS/lQG1kQSkFyNkDXQ8fIJKH7D6I3c3L
	dH0v5xcDr+94fEbouhit+9KDsHRkYdaXZc31BYMoxqoBWMSC1xGqx3Qavl2UkPMBthsSud++0zQ
	4pUsLCpUWXNQGPvGS9TvF8KhSe2t45ooNrOdOnWWhP3+l7qIZOURknwgf2MD7+cnI
X-Gm-Gg: AYBFou31Qqg5onNKkL4TWTJ7LaFrnVJuTWrOWvPXQ2SZ4anR2IPhogASBaQssNqopXk
	Zd5bXXEDQSU7ekzRiTNXuBxD0f2Dz6LoroG8fH5Ps+NO1Lwhub4HP9CGWt3Lxw4ec1KgHfEGU/M
	1hvmXVCfh3qJ201SSFMu3Of4GePnE2lVFbFFrN3Kisi9zTnSs8K2tvMzX9HSaOPezUn4ywGBCsJ
	sB4/OqmaxVqAs3dV3ApcOGiENFfPoj36tuXLwBhTYyqOZ2DaFQhAjinDIDxjoKvzNEEuJQBBUfb
	TXQKwb6zaJVT0+Jmw4OX12DzjPiw6A69ZD14MMebgXUE2noplSZTWuUTlKJA1t4hLODNQ0hp5iH
	gXC8zyRZBKq/nDJJm
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483248685a.66.1793099543711;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-940ef995afamr1483242285a.66.1793099543110;
        Tue, 27 Oct 2026 04:12:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm259014395e9.0.2026.10.27.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:12:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:12:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
Message-ID: <rtjp32br42qz7xtfj4jwamvbzfpqroxuk3le5kseac3rnz4n6h@gwcmaiarpo7i>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-8-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-8-vz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX646w/hVhuEmv
 HTk/Rw5Fd8nlEIgfN3gq7BN/3C7GuZghFSeJbuJmVFIP2k0LNnJWZ8siv0u7B8nI43YNJnWQT5G
 5lbSpsZ+49uoiBghZyCaEHqzs2dT+nROSzsOYr2sqHaSNMyyTooXeggFC/WJibg+P49+X5wx077
 vECnvE4k7SN1pdj87AWeHzpossQKiRbCUx3STOSI61npE23xw0kcuF6mX+tI/DfW3pXlaAzz90v
 Wh+Qm2mDEJQivNzR5K3tgkqdgp8TUR2qBG+eR0I0Dz9UVBQ8I4PTBu/rHdUyeUDF5xKJ8ldVfiq
 t7Q7y4XIiSmFMkqrEs0Z/L1zNkaWXyp/g4J2CdltOHFvYLDRtM+bEDXcdi9KBt+4TppS3k5BIIG
 i2G3PEQZJXVjTuCkCS9XHV+61j9DRNmZoSjVPMLUihLIWYyH1zFYV3TYXG5MO64AC9RJLK0PvBp
 AVIhNIXsQ1O0TO5v/Hg==
X-Proofpoint-GUID: RpKW0AUsDCKlktVNH382CEsXNVCAxBgF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX+aCBNBurObTG
 b3M2+rYHpOyGX6rXtzi0tsR6GB+U4RwzWr0UsFmKeZXNVlEOSOO09qXKnJc5OrKbH5eggkDE5ic
 zJCmrPaVDOrheBbtB2vc7RXHzmYAL0s=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae08718 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qZm0d5fHY1XYkhLSR6wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RpKW0AUsDCKlktVNH382CEsXNVCAxBgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-27 00:49:57, Vladimir Zapolskiy wrote:
> Qualcomm SM8450 SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
