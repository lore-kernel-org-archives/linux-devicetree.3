Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843F3F8ECA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294662; cv=none; b=XzMjZ3F4MxSRZJgkqoDVCuWYZLIxaIK+fc7LcCHWL9hMlD+neOcKzc/Z2y127L13XJtHpIUQ+pLz/7fjmDJH4PqRH8Iw4hxVDLvRAy+TLYoGn/ublnd3rqo8eUMMPpvtyiRGu5sBvbKkUVPGe1m3/v+vxBMZB+Xd4Gp8Kzdk8E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294662; c=relaxed/simple;
	bh=+Bw4yHL3Sn4ayZ7mBhJPQ7Omr7VihtfhmDEPBiph2bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gg4woFW/9JLziDYOrZXurRCKErrluZOcDPmE8u9JJO/+2e6szKJAgU6skgtn0c8AT+vi40/SH652t9mohYHCrCAJjbFz4IcRArH0iPpNf8oGzfy19QUC0SHmjKIf1RrD8/gtErFkcgP7vDudRBhLTdnygHbx7od8/D3IhCZrwTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+1uLXOR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRsxCD6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+1uLXOR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRsxCD6j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSrXu1781399
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtvPtu5Wyax1N1NQKVynka6PC2SH8vK4pP3GpnJlqZA=; b=P+1uLXORsKCPXldN
	mzHgtk+fl0rwthFakwd9jvxwx4ucEdj6yd3bnEkaZa8ezlVpaat+yvViTUMeiAGk
	49ITyDj+V5zIEK7zJE7vo7onVMhC3tIr7r5IgMtx9T4QIj3S1yxYUiqSAityf53c
	wgdXeEa4x+Jvod0aqHeR5OOZDVeqRjH9yjQezUsJC54b3/iO4OzZHPZ+DHy+VLee
	gkj12hU4QGJoZan7auQH6M02EBVaNFcEeaBnTE3vq9qETFgBEx2IWG7m8Ri/PW0W
	fYFG4zE6C0nleJ7gtLxgcEb6NaWVe/hWNNU7S2IqYVadfPse4vufOj3bmMY/YGEG
	M4MRfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsgnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:24:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so14720761cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784294660; x=1784899460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtvPtu5Wyax1N1NQKVynka6PC2SH8vK4pP3GpnJlqZA=;
        b=YRsxCD6jnQW19J/kXaoGdE89ipg5fZbpDS5bLTW1MZs4uglNQcd4wP4oMmeCYHagUP
         aaJQ62yOFP9mvv1WrzV935mlOoEBvTMwgb+6Gv5+EBVjQnW5KS9QtH9A3InX0U8Fd5k5
         0s+orW5f3JSUBjECAKsF73lOonv1CXxPnuuXjEttHZYjYYf8Q/6UtTWPSZBSx8MkpwC9
         Obt4b0mdhH56f7y8NaR1dr+K4u4YJM2fRQ3wXR5JcXyWLRHJ3NpYMdT40QW7+0W3do02
         MjmKF1CcGiKcb9OPxMSTr7i4IPC3iY6xkPfPx1yWLEzn1XxTMZOXw7k0HeAmsztTk/oN
         YZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294660; x=1784899460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtvPtu5Wyax1N1NQKVynka6PC2SH8vK4pP3GpnJlqZA=;
        b=O+V9TIc+7hlYqou3s5M7M4XnmN4Qx4Qz8vraNEg7qZwONAFAal7K71fpS4GBtJXdj8
         x899BmMA2psFy/FOOhds3HDMCfKOW6YXi24FFlgr1naS1EwTv/6j3yuGPqeoQSpA6oQp
         MEHHhTuoaMHi9UPm/x2S3PEpniMI5MhCZIHf75420n65GUsdYmRRWcBEhGzJP2MvElEp
         gPX/wLbmdp1VLpor3cEtlGHvvCX/BYOcaPZxhN0jlgIeydCBXHT2ws23ddN5OUVtI0+2
         KV+hW3koVuME9zdfSZfRvibqr0usSJ7dZgPboo7PE59pCPSN1Tt1Xtj3mwL2JoBRxLuk
         D9YA==
X-Forwarded-Encrypted: i=1; AHgh+RqCyRcrbowiL/5UIRvY3Il5Rq7RqXgDZUMMI9RM5KNsCujuIgKQsIagA+1IWG6tcqRFg+rZgNztoyHY@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsyyYBnt1FjlMA2UVzXociD9Z24NSQC8PJe95BuZiKtW0GifL
	3C0Qo1ThcIql3AjLjYrgZP0P0aSCDkO7CrvF8A8gQ7LY/XDsyrLskKF0FX1xXgq70RjYeE8obyc
	PAhRc1w6VukqCizhI03iOb1q23ziz3FmbalI1raavEXPfaFVOP+Yx6SzLj+fHoklh
X-Gm-Gg: AfdE7ck0K1hwAIcVAU9qNz96IucYyVNNriWUPaB9UR7ZZsiDTCBjyYR5R2MUbBj4Rm9
	LuUfwZ6DknKOndjVM1p4VznV06Sj9uaKgsBOashwYy+YBdzP9Jol3+UIrpmp0vJlnby2heOaFN5
	bbTDX196FNfeydc5HH0JWmtbTNqL6lqjUsAju/kd7fv8CKEoM9VLHlgBLZOM+Yq+72Y4Y7tJs1Q
	V9HPRyXx2QmxdWB07bizkai/cK1rA6GXXq7zTveK6sxbcSwBLnfXDxjjb22vfAyaqNQkrupdJtD
	+4yXL2X3qvI8Pc+LQI6RpVrRVpBsEsrZAym7iloN2Jh5sKBlwg7XVQrdAp2K+MZDVpY5RmioNqB
	Lj8rgSXsFuPrbPA2YhfVm7mc7
X-Received: by 2002:a05:622a:2295:b0:51c:f3e:781e with SMTP id d75a77b69052e-5213d0c1fbemr17925201cf.6.1784294659818;
        Fri, 17 Jul 2026 06:24:19 -0700 (PDT)
X-Received: by 2002:a05:622a:2295:b0:51c:f3e:781e with SMTP id d75a77b69052e-5213d0c1fbemr17924731cf.6.1784294659281;
        Fri, 17 Jul 2026 06:24:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b72sm75411966b.48.2026.07.17.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 06:24:18 -0700 (PDT)
Message-ID: <375ebce3-c019-4ce6-963e-3f27c12f5c55@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:24:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX/qqRnRjtybQ0
 OVV8XJ9H16WrIEpeJtsQCEO9syfz7c05TgUKde3lSbCF735r3D0N8tflpPFXh1UZbMTjAY0u/Th
 yR2flEnUWGzxJZ3uhQXKq7dmIJ/TlPU=
X-Proofpoint-ORIG-GUID: uMr3f6StF8Sbn7qt9e-ezwCilvotkSgw
X-Proofpoint-GUID: uMr3f6StF8Sbn7qt9e-ezwCilvotkSgw
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a2d04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dXkGG8lSNh7L0qOfzMQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX34T//9NCRhpK
 HThWVeuvGMqUE2M9AF3xjRuLo3ZZNJtZgv8tQMWFKTFzhPXU3NBmGIrWKH0i3pywip+U41YP3Mt
 lxZcUktDbzGDg1G3Pmnp4Et033vUNUINNyaBS/9Pe6RscL0rBsVEW+5dxQfbAOgr7+MXfuxeiKH
 NDh7tTIpWTPtH5RLXt9cDlobHTDRJ68d4uCNkv9h+1oi0v/PC585J9Rr93TqRrrEkrLUsewUlCT
 X3iA31YiumtKvTAWL7DHl9MN9Bv2GpOXcscFVyK8PyMuU4KtdwmBQNOxWEHzg8fUFsuphBt+OBl
 7egcV79jdoIqrnbsMZN/5kx7E2EXXfNUKV/DGRFPOBHubkkOFHLm1GsAh49wLGqN8TS8kjK0qtt
 0hiR/+i0y3+6ONJdtTyZl5nOaujDijD0O3+DIt1qX6fPTAvmoR4+jJ8B1jIlC+JZv9aJz9fEkJU
 RtEWZ/B1fdEUi+fWXQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170136

On 7/17/26 1:54 PM, Gopikrishna Garmidi wrote:
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
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
