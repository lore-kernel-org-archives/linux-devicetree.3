Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC785441031
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114999; cv=none; b=sxFdAcP272EyWgWUFOhN/B2m+FF01kt+Hmqu03qw9ZGghtxECqmd36Bj4FR1W1i8VXOQW4lGe+nBz+ktmfXzDkHBnHRLFsHOvov3ehJWk2mYxp1nq+PoJdlqelGJ6wu/+frb7zkveANsVay13BPTr3tP0RmAyOBNTEs+vYlALrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114999; c=relaxed/simple;
	bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPK0j1G1OUHMr+PwugjnYB/tCTu63KvaA82S9UIQ3IfHzOF1GpF8hMF1fl5ig2L6JCl8dxYsYSHpZk7Nk9cupNtwKGT85NCQHG/xGiX7pmmHhYmUVNEuZoDCsBPLgNrCQDZBgQsZafAfUvolhVFt8fe3Bc776muHAEXV1ZCyBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JG96G61W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKP/evWm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JG96G61W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKP/evWm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8SBO2090992
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=; b=JG96G61WhRcPHfvc
	cPvSR6iIxeI+JicTQSeXwXnOKEmApx2Kb0APkcCCPRyjMahmGl4RPe1osyoWQ3KO
	SQTnQvvmANJPVYGfWK7FzkwScHBoKbUhFSKT6Piqhk6d7lOLn914X+9RZsQ0VJQN
	OGUzqvwEGjzFM42N7nkewCsvp7jAXUfnGW0yI2ogQrBtHmejPbkvkmK8LNt6fPz/
	pnRSNkWntmhiw1OM8Fxuk2j56X9FMH7JhMpVIjM3Zqb1nNadhqM72JFZdvDWbCTj
	P5lKsk0qG2elAwq75P5e1q81+zL9Q7WlF3tVLw/Opso1H9Dlg5hvoWMPpQEWioS2
	jWrHJA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rph260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:36:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-633526aac65so102225137.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779114996; x=1779719796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
        b=UKP/evWmZ8vB+fFXLFqhytIAe5eLyDRtB8SoQ9OhTWErOzfHPwlwlDu+V02pMgDTDI
         YMUjE+rq+uNVicDXGxHurjopFrCxIR/CRAPilyH4Ua2HE2PvktX/LP4pBAnA4go7x7mO
         X5AIpbHXBa9m9J2UtD5lbV9p2Wz7C0Li7RY2XcaLerAEmEu20F6Ulk/xVXmGW3OndDlO
         OCFj2G+HBz4E/CgcIaN0bAkF27KWSLJsfTgUWJMKJcdnvivRbNoLG2owJfPlB5Lox3yG
         Z4pWp/s0ZkKA/iU2Bv1lkmNYUuq3btXOFssaU5BtZ9nAn6wDc/3qrinRoCi8mmxGJJJu
         tBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114996; x=1779719796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrpjJ1xHCm6ZFYwwlJdMwjDopr2Sv4DPvW85D5MbBjc=;
        b=qWeCJ+CgYsO5RkiNDljYUUAG1b2rhSUrhbNDjKgLKmmnZpiXWGJDsYI7hJmcZCsVQq
         v6es6URXNNJCPI76fPe3lBHcOK4gUWDDIXfJsG5WtbIT1H9hEaEAuZmOf7a3eVaOQNCl
         U96TZ0Z6IXBuHZ7g+hlGbQ9HzNtp0M/K2c7VhW1si9zEDZBhXHf5KmgwDxN5K+28EZtQ
         Qju254ewcBroXZQaY7Nfw+hh84sWVD8ufNBVB5DR+s6jaVqJAeyfDypf8mWQCVxG7RO8
         rmG7up6Ib6DLtzcDqvIWK/e8ZMx7iv8AvMkoovmlvczYdxjUGF3/ZUuSR88qzCT7+tpZ
         JC3g==
X-Forwarded-Encrypted: i=1; AFNElJ+pPar+oNjG+1WRlCEtUTVBMPD2VGd0X3kqQYJP7y6ueKANieBVRWLuGXY9GNNZyhqKtJgzDpTu9twY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1wgcyGuIBBAGgMLvBD4iFQlh2d4jn962ohQbfTgOmt1wDY54
	eJKtL/L6V408McZrL18MxALi7njxVslXGX84hOxplPTNQ+aKECvFrOAJeDRfmFCvdSPGnk4yO6j
	vKfR13lPm/r9JeJLBsLmlX4h5pQMX4zpS/02V/5Klp13AgPNs+5sNV1eVWLCuMR7j
X-Gm-Gg: Acq92OEh4L2IafHcQtSzQ/FFGCbr4sXY/tUOx6ovuMcvxSamcy+lYaIHcOngrTGO0pT
	vUPH7IdGkFalQBGOybyLbXwSrlevczhTLlmiPkenkscU3bCO1C+ZnjwP9aLDxTsppLgswYMWUmF
	fOy3arK1tw6YBAoNuZkZcxVXzGslZvZX/OEmngh0p57ZTHs7PTQmdOYw7h+d+bOSQ8uVsZUURaM
	vuRjlWNqM+mIJ2uqlliJFPcIIW1CJJ4xXeFk7xeKkz+QevjlRK4nQRczr4te2I73sS8tF483ksJ
	m1ulRggKxvVR3+mrTuo/buhFogJP0qZxWBja7e9kLHUgOLyZ+FD+916nklAR6JGivnhz0qZhygF
	cSML1daYa1p2tUxuLVXtV1Bkf7bDtLJLhp7M5gtGxVn8uFxW9V8uFIxzB9Svw22vXVs1omgLvWE
	1sFH8=
X-Received: by 2002:a05:6102:951:b0:636:c122:8583 with SMTP id ada2fe7eead31-63a40cb117amr3123960137.7.1779114996259;
        Mon, 18 May 2026 07:36:36 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:636:c122:8583 with SMTP id ada2fe7eead31-63a40cb117amr3123956137.7.1779114995789;
        Mon, 18 May 2026 07:36:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm571591966b.59.2026.05.18.07.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:36:34 -0700 (PDT)
Message-ID: <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:36:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _QaEklTh4QKED-PxPWy6xXkIu9wd1Lhr
X-Proofpoint-ORIG-GUID: _QaEklTh4QKED-PxPWy6xXkIu9wd1Lhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE0MyBTYWx0ZWRfXziUdCvip3IV+
 wwF/uDqqPkOENQLBrUxHWcP3BTBrNSloHQL0CteU4QKBNYp/r5quiDJY2gZMWMgyjgsJgeFrKQC
 qez3mv/QXPcak6ihQuEKbnIcBOo+RDkip6MRQ0Jnr8fbdswDKk5aISn0vHMpQOJ1hA6wB98zw56
 0yQ06umY4gORq6NPoIr6u4EjIiJ899Fgn+LmOAuCQGx5F3TfFq8WXV/gcin0HDQBw1K//Kq5dBP
 qrtjBMdtsH7VG/8f0fcWOTvED7hKmddbiqmFty07Wzz00dHdryggVFJk5jIdUvHDMo6tIhZUrhG
 ou1INjBEhkKkWxGbKiD9USFSXs7IBrGI9BhYPdW2w/g/wD9YHy8sSNr/lRmEl2tdu4fogejNAMi
 R83G1QXoYRfvxxshagpf8XlIPqcdIlx7KyOB3os3A4yPWjZk5SII2o74ubZ/UlkikIM6rKIh6E2
 riy9jFQa3EoeRhsQodg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b23f4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kDyHj_zsKyADgF95HkcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180143

On 5/18/26 3:49 PM, Rakesh Kota wrote:
> On batteryless boards powered by 12V DC adapters, registering the
> power supply as BATTERY causes userspace to incorrectly trigger
> battery power-saving sequences.

Does battman really offer no way of differentiating whether a battery
is *actually* present in such cases?

What boards are affected?

Konrad
