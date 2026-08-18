Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA92546C83D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052779; cv=none; b=Cp7zdoVUs8jACww8WDGXL7Pm7ZMKzLCUPp/slYP9kq3W2JpeTVBfEPOCLnAAYDXoNrICHbV+QyVUkjkdGXEZi/RqtQdJIOCwYNxEiEaX4lfuvsK34hR6BYgsEI2epkyT6MFX7T4dVLvKLyaeu5KTgl5tSUyAXb9nVGvawTsZT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052779; c=relaxed/simple;
	bh=QFo3MATzZuipgehcUrMaP4Cb6sPVVvd4T7u0xqT63KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5dHyWWrvxM4P8XQiadyXN9Yp8t+XupTvN5Mz/gMkm+f750U0nRKJU+UosiJuvfLYvo5vtZgR27UAxN2AwuyKPVABBfOf664jBv10eW9mNZ+C1D54eC0cplnYzhNaKrhmg40dNtUxSRU9+RCcJlvNe4l8q1b4wQa0fgi1hOKOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzsCEAO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDvoGvrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzsCEAO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDvoGvrC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABVuL1021629
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0edXLCnECW/SavngxdBNJu+cxOnZqKebX9v6ffh8Vk=; b=WzsCEAO0qbGq3WH8
	hEQ647wYUKc0zrF9mG0kOfJdp0LRK/n15vQhN9WR2kW5UlrOqvC05V/izfaaBzq8
	prDbjPhvD2TUrA+1v5taG1500M41bwWZbC1MpJpu5qaqz3b+BBHk3EfGuCQbF4Gd
	jzcaf0MHYlXoduxz9QnBBaY32lUicgsaDYpEpco11KXEPzsJw3GDICTu1O6IjDwG
	20vs3rt3fHAYoWhrBjXMTG/n3iqmmFAEG6xcYAKJn0fCQKHhQs4Uzv7Lxv3RUjJe
	Ukwz1pdNTHYc751eICR9SROhlNr2ukDfDZgz3CrGwlcSro5c/9BTUNWt5UovyRW3
	9+il/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0ueu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90786218dd0so10003936d6.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052775; x=1787657575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0edXLCnECW/SavngxdBNJu+cxOnZqKebX9v6ffh8Vk=;
        b=IDvoGvrC6mqfH1YgwQMaMrbww1mLNRtx4vfQjVcp7WlRruee4aWjabS5EfMAZeTfrw
         r3UNnfh8OpXUYj1NywA5G6VOoj/2dulnhHFRDjJt0bcki2HACRNsMUe/VEfM+QrNyDS9
         iEfBks3dw+LiIjRxciMPtcubte6M3eTuaGUHqnZjS9wn4E6D8IygAXlMNh6mRodq7kMd
         NhdxqBTN7+RzUrsu9oAeH+fGBMRb1K0LRxcfx8n8y2ZLsyzK7qFu7UsZN7VOP49fXMFd
         rhG4Hg7LGlDaQxektmS48HisGWkFvYQH5LdFQZv1GG4vjlwZ5K0+wqLbLjf7RCP2I1c+
         DzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052775; x=1787657575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0edXLCnECW/SavngxdBNJu+cxOnZqKebX9v6ffh8Vk=;
        b=e7+YidU1XqOsU84sMNkdh9GUVltwPMUj2GoF5UvYuK7j+ZmHX5BwlMr1BGWoFMULqU
         luHf1SBex5uyRUykaPIJlsSJ+z6aJW/fcu0RqKo2SNz+4W8Y2h4mXZIWA10ZaZMcCjxY
         aUwp4trGl89826i4KaLrmvDNW/RppVeMpmw9cErDoRZ7AfvAZm7XIJbXpnGglrZWBVoS
         Gb9mRu4SJDyuMI0+6Ax4ahy7PX6tF0q4uIpoqPTBJ8rFtqLx8pZl7yIm/uUMagLf1bVf
         PX5YB9xc3kXL/QgC4K95TXmSPAb85r3G7JCBKx/95BF3rXi0yvf4OmDk6xNd7yTDGArI
         E1Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoNN+gwB5/SJGJ01bI06f/dyJm1haaZwL9VmQXXHVSeFmqJoOn5zYcMOj/83fU671MT+i0clF5WaMYu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjAgn1A231zzrsUpmmN3VilKJ1pGsFCLVJmPtm9o8sR7txUx1
	+AtkpFKaVREvujL6VAUwBp087lrdgli5l7mGdN5FsGDgcYDPbw/BRQF5hczalkd9jhtzYVE36ne
	+10blzB9foWszI9gOc3xokigCy4tEuAOFJ2wQZrLX2Yd7AvrfamSCfg6OBkUQIraB
X-Gm-Gg: AR+sD13dlpNJazdptibrxZxJuVw5KtG0hTDP+s2LAf0JsAeFLtoDOsAuH2f+CiK4G16
	znh3fg3NswO0GYVvQ0tn2cE72toMRaka+Wv4g6Bj8Dwz6M3jTCtusKxr4ZDsl01AI7/PGz3/riY
	nS4jsvFptY9SufLlGvKB9QQmn8oSFNDj9NpcgCk9uFFIpjqX5dqgmVBKfrUwtxxJ25m5RS1NVK2
	5fGAIEECasCTuic5Wead3N3HWIv0WSFLknMnon/6I/5q21AbySgcic6YYbxKuYRrCqhvV2H+OUt
	Z1C5b8TSmBTf2KTAncrGmKaORllCzGLP+Dmvj49v6mtBFn541SpUUVVbRHjmuOY6UVVMuaGAYXU
	vww1aaM9ovkYwIIevhAoDiWgs
X-Received: by 2002:ac8:5d06:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52d8514128cmr226080711cf.0.1787052775250;
        Tue, 18 Aug 2026 04:32:55 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52d8514128cmr226080341cf.0.1787052774812;
        Tue, 18 Aug 2026 04:32:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7cadfsm168163266b.6.2026.08.18.04.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:32:53 -0700 (PDT)
Message-ID: <a6fca9bc-eb4e-4714-a626-e14f4c2f6983@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:32:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Glymur QCB
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
 <20260810-glymur-qcb-v2-4-9e6ea7987b9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-4-9e6ea7987b9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX8k6oHVsfyNZD
 71N0FstKmfi4O8Xrg+lUVqxYJogRT96dtHjLKZ+/gi7LXzC1/maQ98X9KguiZCf8oW3zSuJyeue
 tdrAfEPbknVy/2oAwHLIrtHDs3PAGG4=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8442e8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ipge3QrOEePnb0CFo1IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: L9-3365fLT6Vl9nc9K07ZWqCNwBgxtOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX3YWTy+mDTfWt
 eOc1d6acr5BgvxDgrC5A616yhG+GwVnEE+0KWQS2kBPo9TBrdD2UZeHi83DucAVrIvRT3GJPWFZ
 Oeh8kmu7MJ29Xv0i1OJqyMD2joFLp7PR/46nGdOd1VowEhK5woJEwJRWz4dOxK4oVPd4fFLOWSz
 zxZgRaJh/WeKFz6udFtySfpsa5lKhocfeBZDAFqvovN4egU9hl1LAyq4KujODjZU9kb2AnuzOPy
 T93TmIwalKS8uGHO18qIHtVXpDc0n8AgAfrRoFdygeoa3UqZTGoNI+3Gm1tBCr0ThitnZP7JBGP
 rw6Av2MM9Ga6F67bInOF5g3+uwk2W8oVXnraLE4LbpjiVrfR4ChNzmKWnZOe90tYmx91BRoDgrg
 e+XQ2ciYDeMK5HANEZ2vHCzdvCqiNWVQ5NdbEIjlTUi4/3m4i70Cs/qMWPw5c4EF5xZC50KMVUD
 rgtdE3Qg+3/AZ7fWs6Q==
X-Proofpoint-ORIG-GUID: L9-3365fLT6Vl9nc9K07ZWqCNwBgxtOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On 8/10/26 3:03 PM, Gopikrishna Garmidi wrote:
> The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
> open form factor, aimed at compute bring-up and power/signal measurement
> rather than the closed enclosure of the CRD.
> 
> Add its device tree. The board boots to a shell over the uart21 console
> with its root filesystem on NVMe. Enabled so far:
> 
> - Board and sleep clocks
> - Volume up/down keys
> - PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> - PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
> - WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> - Embedded controller on I2C9
> - ADSP,CDSP and SoCCP remote processors
> - TCSR refgen and QREF reference supplies
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
