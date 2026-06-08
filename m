Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C23B14D6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912711; cv=none; b=mKs27UdfpY7nlYaimFx11JK9Jqynn+0tC95B/Sh7Gy1XaIzXBS9pzNF+ZUcn+BmPXbzVAvDwo++/eVJSmj4ZVNdjGjBhc2KFqJt2YzZR1vHLMty7A5T4n2MUgI/6+kNbSL/dbUej6byELSbOls25kosWbCFaHyUX0JaqTESqjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912711; c=relaxed/simple;
	bh=Sf/hY8RxXrPFlkUl+x1zcYoBpjPAFg2+nW5Yf8mB9bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fn3qgtvOmoYqCUKHnhUySI9ciEa5+n1ImX6p+j5RGppbZggpcWM+yrmKG/JJBnp5OQlQR2jApmWNaFwmUuur9Bg1mPDUdukWaBJ0KnIFfJqoPOlC9WicU/pM7qbGXkPuhhOvdCPJNqFKdNKFZkMiclBC8tnMgwCOq4ALtai5vlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnyuigiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5YkghLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnyuigiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5YkghLC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892Lrw2677815
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=; b=SnyuigiAvs8Qkl9F
	ZbtfiH4R6AGF26FILXOpyHD+ri9IfqBdvF7vwkMBpF+CEXd/jbpemQxcMC+G/8c+
	HfYgY2yV5dkxg8DHCzP/aTGlO6YH+U5o/zaH77ZWRqgP1LLvPdWbw68LWgYmyvgJ
	+1mdRyKb+zMRcaS2hUuxIf4+OMG9Wccw2+s3Beg+sFN4jPlD1mZI/eo+SIp3z8ji
	8n1lKPMOY7RCo9L3zBpyobh5G0/IHaCDALjuybXtHZrDSHjnHfXgj8rh1UOSrG/R
	svWeb1gSPX73zGdGpPrmWsEtf2erlD9MU1EuIRj1XZXmxsRKs0HQnIjB1Ct48VQm
	Y8ud/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkr886-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:58:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so105600485a.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912709; x=1781517509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=;
        b=W5YkghLC+UDOFfwmCOn3ndk7VMod/kCWIE8fIUBjAlMKLyYBAdNLhUv1Lf83tLv8F3
         MpQ73cajkmCGZoajEWieTY2us1EupEjANlx++BGzSKHq9yKa65kUm+s0JovXUDuKFTCo
         qAm8Ht6GtXLj0+FNiL4bumB9gb/qyRxGLjtHObWV+XuF+VN4vUFrDuvcJVBGDXXSW6ho
         H3QiabuzjusPV7YfYDgw2TJff38tErXBPUBJFHK80l+qA8sfy5OOp9cuR8VYTV6D4XyS
         HC/rRlBhz0aPn9Yi5xo3D5vr1ChzP7oRI3WMIlTowH8O2m10BEBU6vUq6gPhPgV9V8MV
         X63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912709; x=1781517509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=;
        b=maweMbPQsY0GzyWpJvO6uC6NTGW7518qmEm3zZjINCnGki5W7wjbgAsBKw0Pu2URC9
         Suz28C7VxMGEI0JeKuG/c/Yqwgq11Jhng/4lSm/qAHntsst243IeqXyxiIFz8nlLCiyE
         SObhLYRky5iV1Wy5jjAFS3Y5aR53L5xpcPLbh3SnF3pRMOmxBHmj5qH7Gw8641Pdht50
         NQx5VuRFID1pD1V0hcN3Umh4OTeKSsdBA8+gHllVEk6elI6rWUGTYiidaAF3sh74S8bV
         o6NVWSNqOMzYbidImfEen3rrkgXOQWNtvUSWkHJXXgoAM09HXFSPCxKjOLT32eSykHEf
         4fLA==
X-Forwarded-Encrypted: i=1; AFNElJ/MG9W19Tr6cAoATSwkKErXgL/cq2J/rbLUp0XDS8Z+yNrIbPe4IMYbRFQLa2lRE92heTXPeAYm2qAq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAWNhRZGnyjKmojunEFFkgzIqneMAKM5qoA/7ZK1ihDngDP5A
	m1n7Mf8XFsCVbPArgxgpyrCX1JN+CuXPsRiTh24WYWxkA/gMTPB33kAWLWdDVD0ElzSmRhPFxIm
	mtXUrRwn0wlIGfHMxaR997TVH4b4izT0kRbfxo/xTSzLACql/5C7Cao1P3JbCMmq9
X-Gm-Gg: Acq92OEir549U7rI8hgcwz6f14HNVIuM4kv5DdSQtn3SuLiL0PuuNCcwk4Buu4LQuRw
	57LSA5zwVW2kRf05gzqBJBCPDVNFlnpMweZOvRpXM9xd/qFG/lFj3ltZceorx54m9mr2rYpGTWC
	hXSs22vPOyHOahOL9v5tH9Q3cMq+GeuddMb3f1SpE5fid/ROpjDd0MZGYQ2rGUC7chAQDtWPdg0
	vAvBClb8er8OBrqTn2wzxct8fgJD7hOAdvgPW6+Y4rxHS5t2B7Zi7cgjFTKyKw0S0g74BK4q0X1
	IEiI6xxUYyJaWSGkxOAhFUYyfksztRjWPSi7KrEWPWSujLJWluRYsh14KFb9C6HaYpy9ZY7kp0e
	0zbSz9jWs3eFqxUw2QL8RkkZiuzXXd+nig5ZPZgJ8ehWhJsVpMVzbrz/U
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1308796585a.8.1780912708799;
        Mon, 08 Jun 2026 02:58:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1308794285a.8.1780912708414;
        Mon, 08 Jun 2026 02:58:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm863681866b.16.2026.06.08.02.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:58:27 -0700 (PDT)
Message-ID: <c3bd3338-fd10-498d-ac4d-3578db58d0b9@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:58:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81
 touchscreen support
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
 <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tNF4yG37Dz347S-9KnAncTHl3ZTrYi5H
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269245 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=k8c5NOaSzwRjXQmZCncA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tNF4yG37Dz347S-9KnAncTHl3ZTrYi5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MyBTYWx0ZWRfX2ck6hM+6Ouwy
 l2vfy4u/RuNZC2PsZIentJilesvKVjSD8BrW3fyV3J87em4tVqEQoYC7x8ym3S+YnIfSTvyUw6g
 Djax6bFb93353TszqdAPftmDOPtd1bSipqGS+Y92aaXEWoylsSTGPsjyoymz7a95UAQmSgFIgsg
 KWBofxpDy2UfjyXjYKtYGdzA8rSxy+mVyS486LQMGOKSWITklw7Y07w00NT3TukmU5BPg70m8BZ
 ln5os1Y1BVnmgjbTlXfmUJEs+q3LVP2Lcn1+7WaGiWoB55FaLZDhNGIWxnilzHyBXdHIy3NCfYo
 dcrRAPRwJp08VFtYk9d2j/uXwmtM7cUy6QL7eSv4txB7uZYgUAortPVVTArH/CFn0vP0Amp0bpr
 QY09CvCJPzpxpWH+so/GfIVl8Sa0vNp/vdCguF1xt3OjCXmdwDI8Oq/7mdYnqAVXRYlf3XVso9W
 65Ztfra2Ysgf7IljJZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080093

On 6/3/26 5:11 AM, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
