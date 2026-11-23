Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461410;
	b=AZz9GwkeGjgaATZJy3onUnaggksy0rhif1pTWXoE1zzsrMj3F4EhBdb+v7aGEhkUteGl
	 tBTLSDEM8YDwz0GqzlLYxww+8grl3Gv7SRbADKRP4X4ELPvW0XDnm9J7OocTWvUiGq3Q7
	 zSoQyw7MBLiODYSv2lMDG8+asJpbY9KBGud3JS3i5pSfT2c6Rm3wQ8eXAbZZXbmEliQ+z
	 MKuvYu+wfB3J0htlNoEpoYfvMb8gRu9RrriyZZR1JtP3CjVqDjavH0AUU5nuXJ94qHZBF
	 JCoi8qNnjza2MMGIT1gyd1tAEXddwwO8QPmuB4W07m8KNkeqkBzQ/uKw70JojtlTvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
	b=A10rG6x2rfyV7eRgE4JXgi+2y8psBkIkdukYda4Z6Bg0359Cqia9+OK48uFU+MO4uK57
	 kKF35zEWhWWsOYTDEZjFjB2Hm66ndGKlUn9xW/n13lb13vJ4xg7oLkgu7viGLogsfjzZo
	 wCglaGm+uasUQrtyJ+nXJxXKB2vh8m+Qry1LykNm13gtAypsD8QOWcgzxcp30zgmA1YIX
	 3rkWSOQadTwyZQ1aXm8M6fVwbdUOWcLUeDHr4nkKQabo5yXSrfwo65kNI/N4kkcbrr0Tw
	 EFDQzaj625YFEfpgCU0Ogb6bUMKBHEIeBvqzQCAQqmH2DC30dN88pGrbKqljCYtkkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF48606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF48606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH6FQ2340475
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTD3QrTZlVtkdPEUbDHvJVFh
	rOqBKwh9s3utgL/EWHU=; b=l2DACRBOH2VnI6FVCXclKpIqWlXSmnHu7cRyqYWY
	ro7RZaAkSfErzWgp7dNYovNDQgNTrFTsAsvpcBXjq/V5ltRB91TDnVWjL5NQcexi
	Xz49ZoYFkQ3v0ml7zaDzOLI2rpWL9vj5OlDCJeXkEVObWyCqmNqVT+uFRnmm+qTR
	r2wheBuqK0YGs4cJRFeEmfZkDpBoBUaZ7OmgSCPh/OgMKinMsPFXOH/102Z2Wg5w
	9Z10UuBn8Ii+lGyR9ZjKtumBgBYygwfhDp22kt+awZKC8iOVbbeihkKJAtnYU4cg
	wSdSc2xGmpvMJJH96vTBXnwtQvsKvr/hPSh+6+4x1lEhaQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx38ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:16:48 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b18c67095dso51611307b3.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461408; x=1796066208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=F2GXq6skIZACS/YNLBT1jjTq9FI9u/Th65Spg7NHmpuznzM1VJ5hFfRB/vNBOaNRcS
         MU8wzKV+YRZQ9O1pf6/57SGyK3VylTnTBVsZDBV8ggrsgpq1BrTxdNPV7al1OytrtMM6
         e6effqIXWwksWDbe+yjdwJdcbWyUuuHUG3sCixV11AizrBzxyitb4D4QMHfc/Jbq2GkE
         mbb0ntGLaCIounbp8Y85whQLt8ENiczB6ocjrLvrBYc7nXJyM6O304JtiOW5RLlFIc7q
         f/hf/ZN/wEnA5gE4US6LgyIcZg3DcJLRs9Zmko8ta5IfRL70CNQI5wFLe6qmbntFdcRB
         RVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461408; x=1796066208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=2wzLS/2Tpw7RnneVVgPXZ2jQkaF0+voAoD2LovMPK0S5Oyt+bGhKwyksCzzUHqQQTf
         N+gc68l+m49RCkWp9UHK/gRdd0oIfvH5O/sJnvHgdxqUMTKSmB+pkK2T04Zx22mK8jJC
         tDp6czZe/2y2+6rRwmWs3oYwQSwtDwsL4r983zSiML/XKz+yXKUZLeafGl5UMw0ncXjR
         gGiARHa+gwEuHMFSjGwyVXgpjb9B6B4q7vj8AdzzaPSYcDl5JnXKIBZLHcIQuZXfcoLM
         T/k8IwVUV3v5aTKKjmmx8pPyqup9WqEI6b9up1ChduaL2VA1YAv894YxSTSr4avefZUs
         vDMQ==
X-Forwarded-Encrypted: i=1; AL+hErHnrTeK4efb3G3xQyO1kdgtde2rUGkTrc3Yvoa7a6BOMmLHAQPc7QVhImBINbvdilUnAZRHeQMBOn8G@vger.kernel.org
X-Gm-Message-State: APuU4Z+AmEXShWx94oNMeeMeVxxqDYjCeKKqCkT8seSOKWlNU0aj9nDO
	b2xtzdRBzUI0voK6+zQhzQKPmNWl0PVEk+aEdbQBDcFO8Jfg79xy0QuxfDBipO3bHW/nXYBHbu1
	mJwl+7q2QdKkWdUtp3w4wObkjqLOIAa5+ZuHTHOpEoXqladAX0b7EOxrdvD+PSWJ0
X-Gm-Gg: AZFdTZcxQg19HlLWzA34cnewysC0H+voNNfUHwDbYakJQJYpO8FdbVhwW3sk7gJJ0V0
	Vc2/34oQn2VP7dDfH2jJCgUd4gRKyqoks+eYgzZTuUA98usW0HC28AdiI2p4EF+46l6LColm26C
	r8mQl3UpGgvb6mmIJ0JRY5DdTVK5QzOvsVRIsEnMh2Uz7nbgyj2iHWj9Qkha0J2YZEOf6ypoIpi
	03s8iBDh44N58TffudVQ7GwIzTJeLyWkkFrts8PkixqIG3Byr1bSkp/cxzOgz5dvmiirMA7RO+6
	+E8B0KGEcimrvykGJHdxjc0FZu6JMER8MScQvg4NNwpB2JLQtE6lFShq+OvrVW1Td8HRbPsp5PH
	WYwOZV28m6MJg/ZwDie3DNj7nVSzsbJJ4m5fnqkkl00pU/pMT5q0CQiYTsEKe3P4h
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662487b3.14.1795461407687;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662367b3.14.1795461407044;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm23434678f8f.10.2026.11.23.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:16:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:16:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: Convert USB4 clocks to use
 phymux ops
Message-ID: <6hypfzcubivolbtygk7a6pma226yzdqwurxairyeomnpexlo2i@rnlvijyghav6>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
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
In-Reply-To: <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049120 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_3OWXpHg_koiZCJ6kicA:9 a=CjuIK1q_8ugA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 6R4qKXrzi8rqSar5nGXj_qTNATzCRkcX
X-Proofpoint-GUID: 6R4qKXrzi8rqSar5nGXj_qTNATzCRkcX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+aNTg2CNEa42
 EPhfZlpm7HRXjGlpofsWo49iZu/brv7Yb0x2FU6VBi3SSF4lJ3stW7ceTH4are1P8a+XoM0XSbq
 IPCO2N+vtX6467WwdCHFZz3UEj2A8e4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXzlZ4ef32ozrX
 6W8/3kfVxJs17uR/95iHwkLfSd1/GvLcCsO593hcdPAMXbGTnKLILlYC44j9OxkbLFBzuUUItkt
 OO+yt54OCjEztV0xr9Cz5YabTLec+1LuM2CWYH7+Ms11djiqeIFPKSQXxIxtIrG1DQ5oWI2NNWY
 HTtxwIfRFlc+TMw35xjA9C4QT+qrSvLbWPoAMCVOBNTHgQISTEg0B8lczc+i4dfBSNcFTKaQ1kc
 eCiKGuZIAnZ1g2OPDLnPQPgRHJdNyA/LgIyneqZmbTGferxT6R+W0YqLf/9PpvdvT+Bb2r7isH1
 DmtLLKVesnxmhP8ihAh9guvnjyOvyZhwyqKKgwQLH5IyIHHfyG/T4BfVrBZ8/Yx9wd4yUQxpxmS
 e3Lq089SUDOGQeoOqs3+DtM1l7x+lLSe8pJC1DNqGxkwCXbtbDQXO5EOVq1D+j4DOxum1tVoSRn
 I/FmY4CapfbqXDcARUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 19:34:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Almost all of the USB4 clocks fall into the "phymux" category, with a
> glitch-free mux switching between an XO source and the "fast clock"
> derived from one of the connected PHY's outputs. That allows for
> running the downstream devices (at reduced capacity) even without the
> PHY being oneline.
> 
> Convert such USB4 clocks over.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
