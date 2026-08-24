Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171903EC685
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564735; cv=none; b=aEOzAtBMr/K6i7/B09RtsyIL6cROLplLd4SJYEANwr9rjtM5bMjUC+VM4kwFXuqxwYvqKAXDNTS+JHC+MPNShGmdpdXZXNHZ293R0byg1984oECo2oQT3D6FqUTLPrzq8GPGAMuMPdmg68DLnvfITVWSjaoHCbNSo37OhFT68NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564735; c=relaxed/simple;
	bh=+I0hVqq58+Av9ARELy6h3GJ8Pu4OTaE2EFvDddip2NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnB4lzthyn4QggPDCrwBUGcMCEnURBtuZZueSBg3AbTqHbqUsRPQ0l7/atsaQ/Z/KrL6b2MNzZphfcz+jVySv5xq2fNxYoah3KKw+wcFWaNnVUTHKOkyP5oVbThrMyzF0gqCIxKEWZ6135L7yPu1t+apLfregBbHgw81z4QsiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnUIpHvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOviqpCz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnUIpHvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOviqpCz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99eOR2572199
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=; b=ZnUIpHvtMfJlN5Tw
	qXgJo1KEZsC8kYNLv3ep5kMFMvY3WrEecMXSP7tSC1W3E9kiRHsj7vwOO1qAKpU7
	Gn4ArPnSkfEPNC5kAqC0+HH3TfAr5UIOxy2gn8oeVQkMGPNOUb+xe0u4K1gLb/et
	lA++DmNPdG7qjrB1xcXIYpxunGvWitOYfcWoVJZY7H7HfP0b2wR5s3Flypct/lJI
	z1Uo6RhNmy0m5mKHoQbZzRrgjn/0gZxwQbZPYcw+qCOHcPlCZPuS8lnsCil13DYO
	Prw0Gb6jEKDZzCNkxzt+BqIJCBYPwwiDXwc/TITIS06AyxNfsLMWRApLt04bGJiz
	StX8YA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1ut4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:45:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so7442551cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564731; x=1788169531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=;
        b=iOviqpCzYh8Lvna9RieM/bWRAfcLoVR3ZD573feuxZDUweKISSV8fH9SKoZgPHnbN8
         tIeY1GK4eqbunxrI/Nzbxl36zY9euQU10dvRAzEdarHMOzT0IF0G1JU2Qepn76UXVWtO
         AUGFPFxHQk+y+G6IUnjd7TAihZIKNBDzAoGcdFWn0AyIpb261aYba4lNkPAO1v8JhxHn
         NvByuon8SpVlp7dMG4LUnSfrhpPfj7at7tQq0Pqso3Vg/KiJy4HNhiwxrON/blwU6VAb
         ujhyRcMm2kxfnvuSNqH2Y9a/rjXorTUwBvZa7ADoAdqwX5pKAvn6A2yakapIWFvPLCYH
         wKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564731; x=1788169531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=;
        b=G0Cm7gXQJO7Qxbfa71BMf1jFGWVwJkjZ5vrNhr2SiT/oN1aPnj+T0OMxSTHeNwO3un
         RKt/WVo1qqNytUGiBrwKqHF7xrNw5xL4mXInD/C0vKjGoC6bruRq5CUzJ1OIwzDrWfBe
         2kwf6m4btDo/1Etqb0KgH25FSKi2X/8D4by6XdqklKOzi6f9RMY7FYZ4BpLBO+2qSoQ7
         HdKkC5uToZ20uw6SQLlEMBO5IBz2M6I3q4N5ttzXGGBqvQuh1yTsKw9/34edzK5NGWGv
         IxpUaaxgV630+NPgwdYZSe5RkllbnU2fQ9famIyj05mKhLV2FA9zX/CfYEEJfdYC6Z3N
         +mnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPwk//Zw33y4BtaaWOWavdTSSqsKupsvJaDG69LfJ46qu4W8Pl9aqEQY+j1pD62yW3JAKN/JZj7jrJ@vger.kernel.org
X-Gm-Message-State: AFuF++n8tWfoWsLaS95/lHLTQ3SsFSc7l6EnwxLfnU0yeshfvDX3twtt
	3QedW1DKyIkMzMCEVjE+zF+GoWcuYUmWFieCSmeNcZAoiHHalh6xrcDziKXbk4ezUz4gn/ReQW5
	qSF32McWDhu9yWbHgW0f2QxXOUvzDQQS6OIOr+XGQ1EnShaxUPp30BPr4oTk8YriLAjG5zoQU
X-Gm-Gg: AR+sD13FVwy13IhGnhsDUAtjNBYBc+EC+q8+uDq/Nt66VqjzVZy0hZ3E8A/F+VPnC+g
	65edLQD7AOL1PMznuM1krdn2zXjohEX4Qn0eC9hHDBiq3v7sF1vI6UbLB7RytHTXWMu3JTPB5tY
	dlREynM4yzWWtjL99Ikd/JbGOLPY/HpJgcWTYV5BCJAvcXG959GiqZ8LRYrg9k22ThH41NTetqE
	MN7ZdaWp16f1MuPPBxPC+RhRxc/zuwi8wC9FbNh8PAA77ZR9oAN2x0krycLC5+py34Xd+yCnz/p
	/RkBv/1oiI9LGeCC/rV4OUo+Qzhljd1lysPK2vgNSmBmFJ7Uo0M4SJrsSli6PCX+Too2v/LOWcb
	MsXMhhCxJnQ5Kk8MmNEmwILRg
X-Received: by 2002:a05:622a:34e:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52df59fbd50mr192865771cf.3.1787564730940;
        Mon, 24 Aug 2026 02:45:30 -0700 (PDT)
X-Received: by 2002:a05:622a:34e:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52df59fbd50mr192865491cf.3.1787564730545;
        Mon, 24 Aug 2026 02:45:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab63sm1152142566b.50.2026.08.24.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:45:29 -0700 (PDT)
Message-ID: <b68a12fb-e39b-43a9-91ef-f45db6d391cc@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:45:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-pmics: Enable PMIC MBG
 thermal monitor
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX0uOglLNJewNy
 kucF1HDb+mhXVbRiNgK1S+Ka5pkjc1q2oRHQLDPnXwI2GLuKrKnC/hJrlzdpowh9v9r8gGWvqds
 rUQwgOpikqE+29TMebGS9+LMwbJV5einrZABDVJ3hFhNNvC95WbwnwW9PXIq/rMfvA5S7DYKx4g
 BUQi+uR2txADaf/qYZc2JZa76EgWfyrEISCjhroTIyhVaAjN7paQhtp8psvpLd2sgMejg3j96yt
 t6q1oQKkodoF3gRZtnmx7u1Y19oQ49tdHSagIeWU03Hy2uGevbCiempygMdC2mJddsz/cEFmhPN
 pSF4oskeGbUuZgiW5CInzyhUBzl6aVi2JeowoblJ6c7vElOsTWHcJ4j9RIEiDafuc6OPIW5Htv6
 Q6OPSEBKCmD3lmqvfD3AejvqCiYC1WnM20JolZE8U1HWERUa+PtYpYU9bu9YhYIMElQi5VQw73O
 qsYuMFlE3hSHTTS+L4Q==
X-Proofpoint-GUID: CRczm6pBcgrYk4RtHgjPwnvf4uYVMcuV
X-Proofpoint-ORIG-GUID: CRczm6pBcgrYk4RtHgjPwnvf4uYVMcuV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfXxy42w9ofdraw
 0ZoXWGYp1RzYnsnzLvzazu+FwAJBzq6k/xhucH4LQswrUz9LBarcQIVJYDV9t/dZ92Ycj06aOxI
 fpTHmIrZEw9nfRj+8gNQ2RFo43bLhSI=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c12bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YRSyWayBu2VEUMgi7_sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240084

On 8/14/26 11:51 AM, Sachin Gupta wrote:
> Lemans boards use PM8654AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
