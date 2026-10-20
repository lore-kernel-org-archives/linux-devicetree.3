Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529265;
	b=KKlUZkkN0RcUpzAFtgpI4CjjDOafD3yH2b2oZVSwRBaO0GSXuEQc9NOwzHesMK8yFKAe
	 X/zpAbqxXMAKInS73Jh7PMt3gd9n7UEifMYJ47Xp07YBqmRtyggIEcwVnN32h3XJtnOY4
	 y3Msz+g5WiCITCUUXXu3PRxiGwQ4JiwxbJb1w6f9JjojRUPTy01+CYgJzClffQqmJYM/p
	 dT5VbApkT+n/gi9eW3/d07H652Mk5PmIye6LfhfjwRYAHz5X0gH1KKPFuwv28f94K8Gck
	 cmJOkmnv3mjU2V5PzsD7MPbjeKFUS5K3F4ZkbtMHvA2b4sQywlCzOCN+fobZEdjxSNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
	b=ROXEH8LDJLvVvEgrI0nwoATMWaY6cq1w2x+Qq+VEbABKHtBTRrEhxYCdPOhoehfglHVj
	 9uDUwOCsp26Y/PZgKHNc3wPWAyu0HF49QOYujiJuAOoS3jpGLpGQjVIAD9lQXsIwmJsXN
	 vXq3T78GySDUsrHGZjwbinU8AddXEqsLqnAlH1SHMRYNIeZhz/adxUo2onpO2+tQvJX3/
	 P0+/ZlFxLRoPhobtetwNniRY6FJiRnTBcQR4TwW+XdRlx3EGTP1LgzgGkwlrJLp4B++pM
	 6lnHJ+r9sLkVEomMlYTBoAc25pCh01UJ7h+Mr6LM1oeTagsAiUG99fTsRvvkqFET6xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N2wtZu/T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKOTJrO3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E315606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E315606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2wtZu/T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKOTJrO3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtlv42278785
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=; b=N2wtZu/Ti1khupw8
	0AJI52C3hmauPvt7qec/n/1uMqUSp/eK2IUYDOtx/p7GThbUsfN2kwGe0h+T2PlU
	xJGx9gbBZUnhbm+4cbQ2HTbg7Qdher3/0SwEN8131ZieBa7EFtH1PiG4oM1TIBQO
	JFVc9pOtecXWv9XPMJ0PfkG7ufFB3Ye94+F+khl2P79YmRz5q8AOtQH1Mme+P3vS
	eztoj60h6h7fK2vjj+5KQS652WBpAsVT6yccmORBg2F5IlchFRnCZVzTBIObx8vR
	g6rKdkZM8rR3BLpQA0zWICRErErTsR9cZj9coaYfDqopUHQYBZiZyQJow+K4zTgo
	zL8+JQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:47:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7317141eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529264; x=1793134064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=MKOTJrO3mQ6jEydVB0far2ABt9o97ahDLFU0+wtOtcs3knyNHTEFqDzHSxcCzcgBIb
         iap/k52CL1cKHPOgrAlcFtzuJ30T4aAwGkLndwAXNEHtTFdhTVVPeq3cRcry66+7poNI
         08EMWaL0hJx5U0sKipRPKyghRUEgh/TwfF6wFT8w2WYeE6t7Tek3hkP4L5E/N39424vh
         lFdzwDrJJoEidLPd09bpQb7/g/JwRbl4vOvrI4n3+F+pYH14jILz4VVaewa6D2URPT6f
         bmTuUO4HBBEw7FkrT9G+xFYMuEA/lMe+EY9kWyqQY7Ib1w2PnrTU9g9JWcoHOu03Yu8y
         F9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529264; x=1793134064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=OaFeukw0kC05seJf67btS21v4FRqWcmRxENHXuzHnqs/YRofciJLrkEDp1YZxBLoAf
         LAWxXgyedqj1y/ivToCXuaMw8URO+PGFrlfbm2sc4RNJebmSqGXKNBMuBNcz445TC88R
         LDFC8PALzLbwu35P0KqXVWMmsrECep9BNXLAT/4lV4elvHG7nGqE3Q5xYp2KKKbgV7f8
         Nw3esotQegdf84/ciXzyEudDdIjXqAZBlXxXnwJjvXQKMYZN0ZPkqoLoyhd+YYOYd36k
         UlzJ3Rhcdxpvj47mfndQ8/FeH9X32Y8gplbUKBPSiMsvjdqcPZ3r61jIcgmmm7xrrNSh
         P5xg==
X-Forwarded-Encrypted: i=1; AKwUvBwEN0V2aUgb7Z8+hH2EFPP2AcaNv96S7IACWEPgkuuz4sJEMi67Qwkc40UyaE1OUHXpzsllmYb4wxhc@vger.kernel.org
X-Gm-Message-State: AFq9FYJsPsmfLgvGeCzeWiZFCpzuY3C6YuIFesz3V6Ly6Ir3qa9w+bGQ
	w/Hiod8EraxB0vj+pflmP+DMEpUqNiAUCKVdN8Hj0OO5BlSVD8z2jmV6gXJYglBNVXytYxLKfdT
	etde6grzOKEzK0qcRXTRrKnvodSccrRSmXJg1gVGhDohrQcpaomPdcW6tDIOoqFMH
X-Gm-Gg: AYBFou1V/OmnI7kkJEUNhpOaazOfs+KQISPUM6wLq9PVv3fLDHkNUWuVKr5tHCcXkMR
	QTlTw67TGc2ZeyNhvyC77WI1BjdbrwO4RZslUQDbCQsjtlJS1RZYAwG+bLOwvlpCh304pY5EVX+
	t0slUe/q6UgENefZ/B5F/6uXWL0tV8ooGtlFS0RI9M1wk14mliWeZ7raJaW+jwzuKTVjE9OeUdp
	CDykHjm0o0RkFosI8gtsWnHAE7izMNRmyl/owmz/7c0ydc3VAFHkB+o3XILLq2xeLFJAfSbLEKx
	29oD7kBY7Uhde3IXvTrVCyHnBW3+uNqhD05rMZ36au8OXlCpN4zmHJ3g+Qz0ZwThPXyl8J/my2z
	guv5Jh4AOh79TypCj53rGauPevLGHfOJ/rsX+ZRGCeVMSblRYsmQ9vYCxsw==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991730c88.26.1792529264077;
        Tue, 20 Oct 2026 13:47:44 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991437c88.26.1792529260407;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm880701c88.23.2026.10.20.13.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Message-ID: <624e580e-3d14-4b3e-bd63-9137a63abfa0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:47:39 -0700
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <qLjQvei0fouaxpwPTn80Nhf-aITowIXFteQ3i4M6uq3PVYim2WLaeukVq1MgNcwOeagmzK7HP1tzQbTTlhNXOA==@protonmail.internalid>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BMtwA23IBOK_BNTaVpIM7qPcb-mE4tl4
X-Proofpoint-ORIG-GUID: BMtwA23IBOK_BNTaVpIM7qPcb-mE4tl4
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d370 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=z39C_I-LsHAogVuORkQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXz/833eUNFm0N
 1FYWDa33vsd/T/wR6UMRV2GTEvyHANbKHW5UDLLRtK9ZdBIv3EN0CPQlnII4D9C2d0xxBPAXrpz
 I91JiQSZcFxCqlDc14u38qJOX9RAT+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX8xSx+oKaLsPj
 oDUjNRba9rH+8nRHCPIOoCt8OboA47KI7owrCFpPbmbT7Rd1ReDEQXXccBdWoad8DlBxqyMlI+k
 cGe4+Fqb50Gg8U9Nd93r9YnPy5WQXeV47uLS2jRn/eBBlsoSv2Dr5hICX6YsN9hi829EcbHPPes
 1ezUCxsSKQdnCXCCDh859YvOsWrZFeEwpq/C8BdUqGw51lQ8NKj1e7OVfmSixmFu/7M+iZSPmHa
 cbzdM37NlhFI1RhU1Yj84hvc06iCd5bK/wNM2/GfKASZwnANdeGPlfpQmHXGGfEQmrmbmxEeQ5d
 R6/dvv/P/hiSwPDnP+yYDNwgpYYJQEHsVKKK6k94scqApdhnGX1KubKIU8GbxOqFPhu2Dr2RVsz
 7/fctAbAHXcOB+nQhrbiK2/G0pftoVsPDpgb03BAK3IdNuJxc7gnyIvziAvzDaaQfxhfSdcSUQq
 CWDCTDebGk0Ud0uqi1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

Hi Bryan,

I agree with you. We don't really need a separate file for this. I
was just following with the series pattern that you posted.
Can I tweak the name of the yaml file, which would be more generic and
can be used as a single point of reference?

Best Regards,
Anusha

On 10/19/2026 1:29 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> Do you really need a whole new separate file for this though ?
> 
> ---
> bod

