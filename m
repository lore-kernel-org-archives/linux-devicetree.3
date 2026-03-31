Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744943DDDA3
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948292; cv=none; b=ZUtcnFER1K1Rwc36VjoxyiFGjuqkvNy3ECgVrGqSV1FElNj/6S0M9Tk33icM9SNK1lgOV8HeTmEdXS+oZZkS0Jc26z6mJ/TvWcipakZ8Pr/c0ep86BdmLtpFqd1C8L5RjLV9CHcOO2WCrV94bSAo7WjhhkiRXqCLTyWcvOfglFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948292; c=relaxed/simple;
	bh=796KHNc7Y2BriFksPz8VxoTz55QXqpxFqZkjLa0i4ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjjP1hQzleGBg5aFmlkbRkKK2wwMSOi2e8RoInr2c0JUsE82MhAf6d7vlXGiR+WRq6SfNZsXAYvs+kuYvi8/pZV2aKDglT9HhojMrKgDZa7n9iZgGoiHHqw1tJqxpXcxSJuoeexobBDeL7MYnal5bqzAfnFg5J2P7n0/fsnkem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNPC05Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB0FER6f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNPC05Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB0FER6f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7olEK430858
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=; b=LNPC05Jx5PUahOj6
	QzDRyIgJWaDwgr28qg09blZrU1FD9UgXqPxnNYuDPPt+aUES9tLy4/3fzvHsaoIc
	Q22c2iHUE5LcXT7xJ7r0FgvGQPFZxpZQnBE0DSpbiSSA2BEHv0IaqlMno9geVlOc
	uStEz7iyrWp0f31HxLj+KX/W5B9H6TGt10GqFqXWPOsGYDv1ntMHGS4Bz+ahTEPK
	8BE0me4Q48Ro4C5CNMDosStkUXi3waYDNp38zPJaQaW0QZvwxw0Sy6JH6Zzw6vHQ
	l0hStVmKraJXD3d6YKwW9Ed5yfHAbn16BGsYPyehEtcfRtVihqtikgOvMTahxcII
	UY23fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhmuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:11:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b86b756c4so14607961cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948289; x=1775553089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=;
        b=EB0FER6f4thgbtpjA0D0Lub7PCcHWADL6IWNAxTX/wDlLwKRMvjlKvqdo5LCvxnCg2
         JTVmYQNaImefKrNDbz3WqvH8d1HseWWn/KDTUhXdKjggzBV8JzM8GU7k7KnMe5nWINeu
         wPxKtJl6Gnr15iV3rk78M/Mvf4PSRXEnoHERaKFMTCkishmXUgKKla3k60FILhdXAa3k
         lqLVRPMwQTq9IobGA77gqHC31xCjUEX5rtG0WRtK1ELyllKJ2dFi1bF11s3UloqW+1CC
         UG/uVhoq2xF4QKFD7UJ2bG3PTUo1CyVKe+us76O5RKNPFI3FclXFPPTlVY6l+6YZGupT
         JdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948289; x=1775553089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=;
        b=ZzrBtW6pPoEDcQth6lJhzb4VpWUub/TyqWqsaHJ+Mxq3sWpnuG6CcRaOonR2PqCt+B
         drEcHQRbxHl6vr3HYHNIusI9aDy6v7BpGD0qeup0CC5RkgwYSyCLzp0ryAMHthEVtH3+
         BW0fd4KX4sSVxp3041WgfI72Ji8OHIKe3aUzGwiLRmLc+yGh/nHrvafEMNVeIVrn4i+C
         J0yNdE/MgwafpfwNW1wrBg4cMEqNCURM5JGELRgl439bbBV1X6aVEKkbnizOKyPJv+Z3
         iT8IdEqYgYxw+JQNRxzsOB+FK7DY01EtMKkemtFm7j3pZx5cVZTDoYZZ+RFk2S9CSkEc
         bgrw==
X-Forwarded-Encrypted: i=1; AJvYcCVKXM8xra5vG52dSd78in0m60iQidItMIopC6Cl5fW+pZMorPOBto4Z9Ft8tfDxWxIzxoYHnoLeeeP1@vger.kernel.org
X-Gm-Message-State: AOJu0YzoP3Yd0vgZ4H2gNDyJezNXij2jv3J8kOsKoKwC//+rXO9ZZJWs
	vh++lHXi4MRSEF+1LMa9kJbRaEy33eMpUEnuV0eKttdKrM+SLZXrmwP19m7QDt6THEkNHRnxwUu
	QaDqTFG/b7vC3B7EYHn+pQMDKRe+rJBc3EUR75bst+h7HH0PQ4B1Nu+sFfJvuCXPP1k46GMFR
X-Gm-Gg: ATEYQzyBMIGDBFliT+b0n7tKM07GqAaCWyQolUWf9JCUCRbZ18wx1Pwacqmp1iizC6I
	hTx3bVjx8jwIdcT+YjJc3bM/0relf1zJJrj2QcRplNVUpX49QOvS1btUMC7Ti9nBWC5Hxoxma90
	7WPVOHFZDkmhLpsCa+czAbB1SJfu97DnbyBiWrYPLTfIUyJFsMojXzDIWeR0QThKdpdtPKryGQm
	QzLh5ZTI0el4OKPFJjdkNvd76b1czxIziOUk0+ibzUt1lvjQ6etWQv962cEwZqiNg1AIuzOOSSE
	0zeNR8PRRSdwU5BCTHeP6AWGDtFGCLScr+tCXro3DPNYYqd4EagBogvvPETzGEtQdu4GMZEX84s
	GGk+DsGw8BLuI+R6NiLd97n3lFW834SmO4tOL8qW1WKwKdKu7WGefgikrZpTkuc+H54APp/SIBG
	7lHt8=
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr169137191cf.5.1774948289332;
        Tue, 31 Mar 2026 02:11:29 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr169136981cf.5.1774948288865;
        Tue, 31 Mar 2026 02:11:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm389223166b.56.2026.03.31.02.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:11:26 -0700 (PDT)
Message-ID: <3c0d4f4b-e126-4170-9684-e646aa6ceb82@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:11:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb8fc2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xfN0tc22g0KGPcRzlJ0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX4u5V+eZzyIKF
 MCn9fVPa/LhoEHaa+VGm6pgGepbyDcsiFlNIA9b/n9tCzo3s/56T+poFH8pE9sJZ8dzIP3Fn10b
 uf1rb5XM+90PVIasZx1vv5znxrvSQB/YuhEi0ASIZ//P9rDL1mPsdi7q08swzoamXNY4m3fuVFl
 p6RHQJE14vOQmZUeI+R7xOwLfsEpNWJeVCtAm9XtUqSDbqVMquM0AtCUNoK9TNrUjO+MhRqPnIp
 EdXY3jTdpXWixUTgyY4Zme/ZUO7/7a5du1EdIefeDK90v3E5sU1YJ+OmN4is/97uxV30Evs9XCD
 5FLbQk5YwhdhX+aKerIX4EzsUOYlIso5GTJuXsJk/whmEuBXGfwkpRCnveLgrwQCYOjIXLSLdj7
 rUfA3f/fS43dMZmyoWZyN+Jq85JApPKd1fkDNiarcvuO50XyIFJ3Zkp5Tfrur2iIHgjMtD4ErJN
 tH3VgZ33THoXRBpjmqw==
X-Proofpoint-GUID: qL7bdp1iUNQjbjFZGSUD5ks0aXn33gGp
X-Proofpoint-ORIG-GUID: qL7bdp1iUNQjbjFZGSUD5ks0aXn33gGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086

On 3/31/26 11:01 AM, Shawn Guo wrote:
> These PCIe devices with MMIO address should be inside soc node rather
> than outside.
> 
> Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> This is compile tested only!

I have no idea how this fell through the cracks in the first place

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
