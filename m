Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0032E2852
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250911; cv=none; b=c2Umi2VaJxuB3qLTlz9JAfE8uxTAqQbNdt88cxsrwkVD7hKkfljKcOj/GhuYJf6kdbpJ2e3+anXnyBy1YMKtIsA/tcbNt980WO9sdAJzDC6aq84cQZdVcKvsTHa8WWjRnlG8L4QTaORA7wdsLeaiQbk18sIb5G46aVRSyqf0sgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250911; c=relaxed/simple;
	bh=POeJGXRJCe7mVrdtZsiPcOC5Xeqkta8xdyDSn2KlaXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvOQTArkk1c/w74i/tJlIjo4lV3WTYWMDlStJ1LAMFRs0qLEXS7zWfz84j+I5o1YL5IlAJ6uZN22o2V/oJ3MlCCY2alAT70cPnN9uVolb+EJnJsa4r6cedLB21x9L09LtsGvcro6nnV3KBurYjCBTwsd4SrRA1E68LmMEGqFfEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzuMpIng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0P9CzPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzuMpIng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0P9CzPG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9c2TJ1778931
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=; b=XzuMpIngN52wTkWU
	Pn+YStViJcACvJinL6J+lHj0LLe036DZJuPlBe41S13uUzxrOlBn5yjf+35nuxlq
	w/MESiNqTbXWaT4yPdyWr05R3MdvF0/CasdMcTIoAT+nLXiGr2NXHIS9m9zkrHkr
	m7B38ozWUwrh2QIEpL3Eh+Bo6AKpee+506EuLvhNmCpUYiSursDX9ih6VfDyE+Be
	i6SDU4Obccc1npceum84L5oShB6L3/zSlszmwtoVUNSOG0MgdoMO2wyOjaoNcdkG
	p/9SkVyFE/lTRNqXaR3mMckq8TWhTdeXmWCI9OIN6ieR2csyT48A6rbdFDZIwxX6
	dFVHtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw039ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:01:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d56ae62e86so200032485a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776250909; x=1776855709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=;
        b=j0P9CzPGY64lldW5CZjWTWb4JX6wD5w6ytR+PMyNmLQZHRiNp9k59Zo3luDjqWFII3
         WermY5dfnvvYbbpyvbOayhyCpIGNtkVDCqv49Pt0JOqDzVSMcVc9S76YUYdKypuRrGcA
         tIQ/fAuAd+YI+yZHUVaZLgov8s18s82abXdQ5evdU3ZNhMagnLC+buOIQhcq6pj7mYyQ
         si0GcfXh9NjF1lRCZBRbKtfB3Yoy5VKYk8HuNAdDjhTJdsyi0tuL00TrWazrpCHqezh4
         siqIIdCzh57Hb4QR2BzvNKewjSNpSRQbYutliZnh6ihoNChhF85aOG2CQhX4uqGrxTff
         ig6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776250909; x=1776855709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biDz4g6DTWtoGGWbNnsBijCTxZYo/Nv3TB29e5VcHFc=;
        b=egblC2Yah3vhgwARc+tadPeFiGYs/PtAe00XOyHAcs7xqfvDoT24lxVRGJ/q8sRZId
         8t2YI9s5FcX1gJkvBpSTirEcAJqxgnOsvT0ik5B8naRog6Wgq2HCC4dZUD/dgLoZToTR
         ik73HvvyygygRfnVpYN/rfzsg5C2MzcHLeA8vRCvXhBPkP8o9F1naAK/gcQCPAa0a5v5
         3fhQvUt8gPQ2ndl4kRyMe6DWrU6KOxdczaSwyH9zOdxPt0bvGxUNJ08ju6L530s1Sz2D
         sB8dkJriO4nDcGbNVOj9XtUA/h9rQf3B2ISkrFO0ILjPzt03j/Q+pus3PTKXAHwGz5HT
         kTVA==
X-Forwarded-Encrypted: i=1; AFNElJ+QJ4aZobt2asKIJWAC95ZTyA9rTkmPZHyfVMdnZZoKBxy7B7pBWhTfGcZvh5bobSYV/vyq76WDr/tw@vger.kernel.org
X-Gm-Message-State: AOJu0YzJGrMDarXyCX/fQ+z6AsehaQeNYCpNIwvReOUloVR03W+Whr3x
	r+026fwBCAAycEaGHx+i2MgGNgC+0aIQxDtKao++QP62kRfbp6Qw8kvg1d4IWPjgwYtith168Nf
	bbsXmpNvpAalezjX+bkz6DLkkkxCyTvGmvqTpfwnA5NvhJXm6ZLsnHvRIAhslaOGc
X-Gm-Gg: AeBDievdrN6nZ2hgALSLJ4GKlmJatOBRzpB92CBqCZcd/zDg0neluFFmoxUjOWamAmw
	HZvY32EaLQjO+WiAHPSlPJtKz1xGbLu7+31/QZouSIqbxrxnkhXIyol9ymOyBRd/lD+5Xtve7bz
	123sDOLevShijuDNfuhKJndrEp657rRseXXWjZ45vucSeDInY3rjpb6QkPsbah8koFBXfbH0CJT
	+exX06NT9XLOTn2PhllPwmNOvgi4ls3iEGd7KrTBl/d0V0VlfykVWPgPuxH3/tkmxoiwmnRuSto
	lISxESYhxi1xyI5klmCOZJlq19F6f8HU45TO+ks5fYvICpIRhIn50aocYZ4xVeIau2Ewx2s0Bc3
	xrhwfhn8CuwsCFfP4GHG9U5ja3ZvqwLNjA1kfU4XA8t0PVvBhliXtASPZbK8/9dVV2IxvGj27gF
	DtRD75dWx9QgpcYA==
X-Received: by 2002:a05:620a:17a6:b0:8cf:c856:8ff1 with SMTP id af79cd13be357-8e4cc8a280amr189901585a.8.1776250908741;
        Wed, 15 Apr 2026 04:01:48 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:8cf:c856:8ff1 with SMTP id af79cd13be357-8e4cc8a280amr189897485a.8.1776250908151;
        Wed, 15 Apr 2026 04:01:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d8dceasm321621a12.13.2026.04.15.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:01:46 -0700 (PDT)
Message-ID: <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: dipa.mantre@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GJTTtE2wUIdXy_SdwYxg0Y-HhgfLKb8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX7nJK97iE4jVp
 8uqUxsRZFITRXZyMwhZ8KLwtdiJY7KLKwf6gSbRzfmM8vIuOW/F2W1INeqFkzoQLxJTEgQ4ThDE
 UMEy9xTEvdPEfzitT/H79Dpg7lQrht0c1oWqSzdcewTUlrC/xaIKFAvG81Lc2BJv58ZL7pzcxkM
 E6K7QCTDwl2GeqthTYZ+50BQbKYya0FKvOSL7Cvme1i9C/Ccica0Qp6gaChbnjiCwzP8PYYB47J
 94kWaQCOLw5Q13iiYFbR3OVLzLYh3dabF/6MhYubH8R0vuKeF8g31G/liGe+At/UUZWguRbmjaZ
 25D2Kmyfh0weGjwCrygvWxR/ee7Z9iQT7WWa54hodo8vBRPdMdNPbF+L8nO5VRMPZb5D3TKwUP0
 BXouIKTMrnJWKv7fifSoFWE1Tt2mrIt96qnWrI8b4KJHAg7R6FLLT/PnHxVSyPu/DGINMyZX0d2
 TYjQoyNo7SFWqoB1XGQ==
X-Proofpoint-ORIG-GUID: GJTTtE2wUIdXy_SdwYxg0Y-HhgfLKb8k
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df701d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1oU39qR64IH6zgjZjOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101

On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
