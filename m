Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601376;
	b=H/9Ed1W+evKby2ws5U3gRTxQyipsM5OB7XkQBA8WKmvNXloqHDIvrCwDlvy1jtXOYFCk
	 5CLIlymZ8s2q17FZb34QR54q6WFLFijdL7UFwipVi+LqIQl5epFKOCF718cK96rl4gnJP
	 eB1xAGrFR+Z1YH7gVaOH1xYU7L8DmiKho8vg9TK0Oq+pDTI3Om0OrJPiBjLLTb0aL/iyb
	 Eq/DIWaQ/mPC/hc4Ccerr+MCJ/ky59BTTMHs0vt/2WqwRs9PhIzc7KTdaHn2qqf/Kmmgt
	 ncQ0JEqYcDB9+Vz7kCoSj+v5m84avacrXk9vtBLS1OVocqF5ci1CWfYzHciKrsoQXhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
	b=IyHKPfKFyNMydvq8dU1zPQ6pMM7Zew/Xsp79k3BJO5oqBBt7CGD85whPOSol6RjCeYgv
	 p5ddSmz0HSKxBUT9VIcRcQC1saWooRdlreIkbYLncbRqrXWu0dtG8nR1VQnIlHUR0VRvo
	 rxg1Ty1gQfk4VLWbABeA+1Exkxq+ejLu+ECYQxsiHXgRmjBNgbRZbJ8EbhdI83ScmHWNX
	 UjHXKMr3yiXNOmcW8rIYYyOotYg7fNX4JKj9S1yChSNwyOKste3Sk5xXlnOZZNUJCMF/9
	 9qSa9q1dIf0IhmqcexZzgsApzkxudluFkYxIhqAUZ3o/zfmyK4MSF4/1DYEPdLzUd7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jS7ny/6q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLD5zy7w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A24606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jS7ny/6q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLD5zy7w
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOLi555534
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=; b=jS7ny/6q7SyV2157
	5RRY0Ley6gMiHuKIaJgMVUnISyC+JBCpAMDByWRouE4qasUBZpb7qqnBHiVpb1wl
	qX8TkbwT2Ykf2qX1yID4XAdtx6sWRG2ADFq62B5thd6314HWtebS9wYOjHx2Ylse
	+RS7l7z4RT7pc0Pla//d1dud6Fk3T/R+nzgx3UtB5dDDx2CmAr4WJBbVYQtCpffY
	gP+b0cSOALZlTQM5XdCUbkfL36wRibnyFgk/nNvtP7lJS0FmzuPsKIjBSzhLSNsd
	AMimtGSyctakfpV5ZsRg/47231w+y9ZxUapYHjLDInG8SXcPrkV1809Ig2OkNZ7J
	FDL7BQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr8u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5476f5bd009so19006371cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601375; x=1796206175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=DLD5zy7wdgKJEvj0fjMY9CY1W3yBI8tSEB13cQnPbl1jTMxIkTZimEqM6miukDwXkH
         1MSFml8PTlNAf+kBGSH/0BNe1RRSFYW8tsAwjPnUtvj1QHjUAkvCQcBltUz9iCUGbhB4
         K+hH5+voxhlfV2iGZWpcUqLdi+CnxYcwV9DsURtkGuy9BHdg14EjqLEh81FfgNHGAOxj
         eOurEszR5MUyfQb1sJQm01Qqi1gqGk2BumGEFZyXdMB5owz1SQI2qqi/Ot8AaNWW/LMe
         c0fe/QpqtToaKFqSN8Mdk7AJ0/GorPCtpu8FEUGN4I+z2eFWKwCRuzKFlU4hI53w/QQZ
         jSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601375; x=1796206175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=bp8ZRVOrMHVzbzrhoSqucht9vBC2xz4+iL71vKcBEg2dxegth/A2BTqeEAzU7FH0V6
         334sKNkZiVd/QTW8rQXlhE+FKzCcIO3dfRK39MG6MjEPJKIBKwmU0mnndJQ14YYyFAaE
         5MCLvjeYEIYaHTQbt5sCyjsc6WvhXQAnS4CU920YNA4YS51567AJH720h5Nr9Xe864LC
         qOfx1xi6I48Qjm48kry3MwXXbzjyO+rctDojcM0i5YSA5O7sCI0n0n8MUfcyfrRRVoS/
         ShvubQocLHxtXfcXVD4Pi78PY+NacevNUYGsl9UmYdEc654KV7Xpx4bKBi3pE25RS36Y
         pupQ==
X-Forwarded-Encrypted: i=1; AL+hErGpOlIo2rUB8mj5ozy3Vz9b5CnOoMDNIDkygiLvnQP6d/Tf4v3KJp6p3ZK4/AQK077KgcwoRmGIy88h@vger.kernel.org
X-Gm-Message-State: APuU4Z+RAmRIQ1MH62Bm7T7DEuOePlbFDr96s280d5p2ne4zp+0di7Oh
	q5XA61tx9npyZDo1iKt60zrwsM1M9zZdCjK8gkYkRmNUCKpMJvBOzK3W3ep1wXNX4NRUtk1JlO8
	h+be8C8HQRFVa9X4pGjFMoZWci4Za6JCcuOMcjn7zvD8E0wFPq3igav8nh8DD+erP
X-Gm-Gg: AZFdTZdWlv1qBUBiQHBEU3wRv9SdltDMDTookQzh1r+FjyLR7H692gMKoTeC+5I/OKB
	X9n7aBP0V/zdY/1w8aFC1GVRaJkgd5Xsge2aTkmP5MlASWHFs9Y6ae7NM3h7E4nJEuxvoElHmOX
	ZkCqzBx7I/tKdSh9QMdEIB+Bv05HHebtJba3GXFiQjWc2DYFHvd6izS4j66ZgS9uED1JbnKcF7b
	x0XAfnAEag6nKQ70KjMvv5pHZOeeYm2gdq+zpb9GGMOYi2AzjM83+jaim08La6VKhVTpPxv4VGp
	K2V+mZ8IlZ171vTZPi4Di5bqZYdD++XiN6VkQmOwN7VMAs0ib5g8Y2zoYM9BQYSy4YaWUxwfQ1G
	DhJNbzaZLjWP21hN29iJjK7ltq8pylllIMv/xic3PaKCfJb8iPyj5nxBl7JF+qJAnfUzryVY=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683591cf.5.1795601374637;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683191cf.5.1795601374194;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:33 -0800 (PST)
Message-ID: <0c37bbf5-e677-4766-bea7-19b02830c91a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:30 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXw24FGpWul6t6
 p3WP1b/5UuHMRpF5OO9SqHiEYARzyLmWZGkh7iJGcPeqPS+3aoCS10Rwy8Dkv4tdhemYsX94ycx
 ViyeZ4zY3ZVjq0hEd2NoWAujQx/WlanNAzplsHpyy19pLBnRT5bXw/HjFo42EDitzKWpmHH2clG
 nrXearmYZsC9NjzCnsprs4V1tbuPRtzxaGTfIUXSSSB/lQDA2nPOVz5YBDFf5rWzHB+Y3tDXZgy
 12Pw29DFVkhb6J7P27fVPwhpcqvln33BYCGsHFRxR6f427VQmh3nB1/DUI1a4BvgkVdKSU4ZioR
 lBkRZjRGfzqddH0QVL20PP3d/AaL7jtNAkhhkE+Jkyo10OR27PY7sIEI4yv7Cdn6Rc79ZVAd6Ky
 OxuYROSzx6O6W8RrMe/JMP6diVEdgOVGmbl22nEL0elHIwxwkoLePBn7C1kUvtVi8h8+AbnbjBz
 yxjM19fZWqLLIHxw+lA==
X-Proofpoint-ORIG-GUID: 6eULBj5mRzfZurJbCZtsFlYtAVLkcYsY
X-Proofpoint-GUID: 6eULBj5mRzfZurJbCZtsFlYtAVLkcYsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXw4wjx4UgTdmH
 rqKVEODgFg0GwH7WY3W0GZBK9fvdmq+5UKR1gfOW5Jb9izvLwKaR6ZP2zCxgEL3h0xfF/PR2QeJ
 Uh7p9ODgvmjGQ47lS4EAuf9wtY/v1Uo=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b3df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
