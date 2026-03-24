Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FE32BF44
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345116; cv=none; b=rioJEJal+5wl/FZ1B4QfMdVhW8BUQ0arIcANRdblz1tnbO5EfS4irsht321yzWh07Cj/V665UxpfDjgkL9n/CxZGWvhqmaQusn+4DgP99SvZykUUzdIt6utf7JXVsCHh1/ToY+PAKqfWMnBB+iovjJd3cMbuk/+GhLYA+EzHMc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345116; c=relaxed/simple;
	bh=ozLl3/TJGom4/FQ+AzmNPaNzi1EImRBqIdnpnn8fxv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbfpLKHmtnvhGPoIKbnevGcrUlQdBbeFKg8WfpEXcHrpWnCUMkTNz9S1YrF1Z0OcbPReXfR780UZITQByky6Pc18S9FTbqC//Fo6v18/wyTrbnv8gJm3Jb4FO5cnWEE300ub9ndZiqkLQTnI2wfTN5jlygUGyQfwuytpHAaeiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK1+SB+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpJPCiy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK1+SB+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpJPCiy5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xfmY2322822
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=; b=eK1+SB+IPXZiFJGw
	xOjrhNE1TmRI+o+mhnmg5rYXld6nKzpfdmJZbIlnm320zBXgt8eAk2pAabCe/bQE
	Y5W4hR7CbVtdtfyD+MIN0i+kYBLCnoxB5ZHSnuhwRlHgRnA7nBn7CsUJnjkPj0Nv
	n5gh0IpSbULI+LX/MuC5l+kxD+QFMy4fzduV8D188/Y+18v+OQwewPx4hn+YMyBX
	M6N0jFvfKdxnOP9fP4UVUcOpyx3HaisiYDHZbpcrMWsIo81YTP/5de2Fs21edlcE
	tD4BzndQuF6kMwTT1/cXgJIza+ki3LmN/NTKrRHuwLbs3hM0kADhzu4BuVOm/Cu3
	wJNmFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qker5b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:38:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so359535085a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345114; x=1774949914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=;
        b=BpJPCiy5JI9j4Gc+p54qt98yfr+nE3qBSdCq8hsIbCi+vZsK0bRVHVVScSFRRKxuLA
         9QnqAjDfW2nl3DUfxkWQZJX0shom5y9GpS1e+9ZcFAUXNOFlQabZo83Cnh/aUjFF0M5n
         4x1cj36wXvDeChnswWaHDRD8rxlBGgchwdddSvka3oF/66LpXZfAOA7asV9hMNFk3iwD
         jvWYi29JkjfSx4A+7LsHv/wAZKZ76yM9P26piwv54Kv23M0bY1fSSwnv+/jsKhg9vpcI
         cW////mCkVWZnQsZY8tSZNSRr9EkkFqGePV/NejSSCkVIf2L06YT7Hr9eR0ABwXeD2mG
         l4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345114; x=1774949914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=;
        b=tO68S+1XPBciqLYql5OOojSDDPw9nXbNB8byeTwxyR823fdR4cLpIrwTKMStvlmr69
         8Mqk2Ingh9bxs1X8IFRa1Q1qj0+otgpWJypsKCq39zxOIWwvcc1iK/VgWwKiUM6Hu3Zb
         ILSiz4hbEltOc296O6o/074Il7LUbCk/ckKxxgzEFi3AlmKzZmuBXF0FCeYcbK1qssUo
         DuOKpSHuNjO7iEjKhryiOG8YmAdOUtctXLIYn3yCxTd5P4upCDd6Zjre/qACxf62ptdl
         90Mik2XDFxg2heclqlN0h2Zp90N9TtoSexJyL2ha2p7etLgz7zLwee06stpu7gEq38Nz
         zd4g==
X-Forwarded-Encrypted: i=1; AJvYcCVTRE4laclsqhK4uZhSQZS562ArpkAObKSyI6cywtKcBT2zT5yiZriIucPshWvcyu7v+Xc9AZEfwAgU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb4jZl/aezarkC1Xn2hwwPv/ZkfaNDKwfqkgo5wrXtNkbHXHJE
	E2ez13drwTHkGBT/hJYGdg1GGxuLINQU0Vv3+FY+QTxRnf8z4EHkh5D8Th3oLLhjaNpys1FJxnd
	4LHNkphVO/wvRBjqVCXt0FZoDfkRm247QNwKEfuuyKgE1jxwTQu0I5LABbp+h4iO0
X-Gm-Gg: ATEYQzzrjdAFyD16Ma35QF7v7AwTT2SpEudZsSLYqy4iePRqkhr/pfzcS+33XYk1ZTR
	OTIE52k6DElYpOH4CC3duBy011fYv3oNOlLBgY5A7VhfvZtEI36t8uqjM/8feShHjmy0HbvpUh5
	JEEpYuexchgdO07ExOBHPfqAQgRF0AXe7qND3LWD0PCT4bAYHXrd/7+n/0ifE2gSdXNEmys0LhD
	lTyZvPU54IvWo5uhufHTLXWS89bmzLsUPxUbQ0DBNTA0qEx++de3gqWpNd01F8uKt6GV7yLv5v0
	PlEnMSSAWrMeszOyKL6ijvZEP8H/fZhoXX2VM70weCb001wfbXRU4CPQOtqKK7Oed5UTyT8f6mN
	aopvY0j1ppgz3Ud/6uQKvT1pEURHviC/wIevFzHZZ1Dt/An/Cq++TxF81vU/oE4zwTpocIrbcX9
	mTAZA=
X-Received: by 2002:a05:620a:29d6:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfc7e9ac9dmr1482206285a.3.1774345114027;
        Tue, 24 Mar 2026 02:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfc7e9ac9dmr1482205085a.3.1774345113558;
        Tue, 24 Mar 2026 02:38:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm3117996a12.31.2026.03.24.02.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:38:32 -0700 (PDT)
Message-ID: <5d02eb1f-8384-4d54-af41-be0bb6ab7545@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:38:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s3xe7O_cm4Z1q6zY6Uk-tfhy5zeePUaD
X-Proofpoint-ORIG-GUID: s3xe7O_cm4Z1q6zY6Uk-tfhy5zeePUaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfXyalUoMOp9BlG
 hRUAB4KPgOG8oYSB3u3uX+uRIqMw8wEq6EQAzIk2kuMldyTE1Tut736t7rTawn1lRpj0s26xPAr
 O2M9Lv8DZDvmaaX2ONsoSJwB2XD5L1d01JvpJ80wdWmSonRHieK8DQmaSNo+F17hVNR9FXjcnkQ
 eb1rVYmJNrPXyk4MnX4wBwUrQ48zvj1pTa/ZshzqkFz90g2wtjeH0qLMex2m3ZljdnyzpI3lCO6
 xvWgmm7QyO3k4uVmg5nv14jEUpUaMj+tbmYagaQVZXS2arJYsQ6L8hfFqugl4tiFLRmtp1Pom+m
 Fdqg5PS/y1h8N4zWQa3FKM/rJY5HISgXT5ydLbWzF2/54JjRNgLCo3+hmfpCkqic5pdxRpB1Bw2
 LzKXB0ILhXy06pr1mt6lBqsAT4Tfxagu7kXMjkJKh1fDhxxWCn5Cdwq1snVVOiIdoL16d2lGuBl
 Du9/fjapzCSleVIDpVQ==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c25b9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A4rZZFmT0VfpKD8yd_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 3:32 AM, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
