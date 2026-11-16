Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831515;
	b=C9vIB7afEmNaKzIDWlc+zSiZ1fQFyty0OqdHfMrOHchGAgFpgGosbiDx+ChKxz90fcLl
	 ia11gajDRO0oZAB668LHWaG/a+ibL9hcZUu/hD15MHMEc1FybUzMeboikV2Xv75/KK+Jo
	 UON2/7kmqfq51laY2hBlkmhegRN3+ubissOLwJwE6g8iayXQoDfM1NUyLhvVOWDokgAln
	 21C1esBW45QeSDaEfAEbb+0yXtxY8aQMpiebttkSK/UNFb+RSUgge3KJrKvP72lp/T0y4
	 3Bvz6JdamaZ64yhdfujvrwumeuRRreDctpfHUdYsumqnGTQlk+ffvngo457Pz1J2ffw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
	b=MWC9R2hIGr48TY6Gdoo1VfGNMSkHkWBTPl4xvkj0pjWfR8kh1Dy8UpuE5Qr4qw8T2HNo
	 pJ0r1DozevjRpOHOhZzgJuVDvEyy1WVQYmd/eMoPUXSZKrvh5sZxJjpA4X4poS0qQeAXs
	 mPOeQYDj6gCwG4R2sm9+OyiwCMpk8BKzUJVPMUVE06o3YnduhjGn1UGb0y9lkKWcqjw1q
	 r/EXVddmec6tT2WFeSbsOFIsRyg0GO6HKbK7y8HFp9svDY/A40FKbcfqqIICk4iJ5LdES
	 ZzW8DSwWe7VNyn3h5y0h9sbP95i5m559waFYloAnQdxznH31kfp+iHFDJ5q1xe0UUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A1606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1K2m3117302
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=; b=d1YGkDnE2B1uZO6w
	EfxsjoYCvgCpxAiSilzt1FrP1sxMxee9mD5Ol3p/idGp4kiwr9VRukK2L/212BVq
	rEE+CvtXqzkRC7gWezH6YRTQl9LpBWs5ugXCOSSMxIKGd3T9UkkGQ+EQuITFChQK
	w86O5wQlmq5jjlCACS1Oz5TiwUTE0HQQn3KZe2fsnLx20bFPAhgWnHfdZsCeU0U4
	9/P5Yt1D4+k4X6NjNtRoAS/tXbehhQjbpQ011jgwYHz4XDTzYwgc+8fiZyT896yE
	Csaw+LBfxwClsI8yeBz08ON25eBpWefHH357eu3ywc+yMqinmOW/y3XPfdBU0ji2
	S+kuxw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8022b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so1878897a12.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794831512; x=1795436312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=gY1g7Dmz5fKSyoy7NTCR+hLfEyCJ+wzFervI2HnNSk0NFkPtqkzYt1RJxfwy0pyzYb
         jvkh7mbeZMSd8udsgLby4dA8U0UVQBYvSMneDudq35DzLCcJqt1xCPpc+1WgxvBlNoSF
         HaBrIuY0yIYABIRzDWLjVZqjhDnsuaC2Ct+kbC2Oxb5gYz1g21UNR8dUeC3/huGe0azF
         4n9/3v+ATcKWcVy7LHhLw+NbVJXcD56XPxvxiVKWAt2fBIxLYDRLJyqTGzJmqIcfbp2B
         OrKwDiuGgLi1FH0czB3nqJsIU0fi1/cXtzve1ZbbU8zvp5ipvtonKYqrj+0e1BR4lLI6
         RJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831512; x=1795436312;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=XuRICC3bCcHSaVBKAL+d6WykmV4/iVLc2Goy3+FPTBaSDaWZBVqKPwkvy3U1O3v+Qw
         W6TE18Q5Vv+FCXsbu6pqcuSMIfkKISJkWZBK3G6fwaiE71Ew3xUzsee4ZIGivZf4zrwM
         1tEkfQiUIIVz1+VdvMaN7IbRdY5BOIR9F5WS4rNvJS6MZkqludJbdOcmZbqOKBBUxZWO
         WNAmxGryKaWiXbuD/cCxne019V5yVrYRUFkAMCtfASncnQkz1NOU9/E3hixLLgSz2/sJ
         JvXsIpxV/TAC5FBB+6FHNLRBkZ+o/hfScpXvzRoPjPMZViJFjhQZBXiitzagQ6LtjrFw
         z4+w==
X-Forwarded-Encrypted: i=1; AL+hErF9LZlsXL7sdXlz7EujRCHiGsTj0v+wC/OPag2CtFbYuelAEZittkYCzcXc3YeE+8gMpUh9VxxmFaV6@vger.kernel.org
X-Gm-Message-State: APuU4Z/6LhfV/2Vjhysi6zEiin6fYQfepHDm1cCG4W7ECizWcs5Suqyy
	oJYHOrl8C1tpTLzbrumTfGEJ3+6rHWK4zaF01y/UkSPOSTppkwT/cPzA6X3pwKc+hH5LLgy83b0
	SY2UcF+RppPkr3p5AazeI+v0ccyiBClHx+ajajJDLU8sxX5Cg/2bQPYPx2JJ2UYTJ
X-Gm-Gg: AYBFou3pQ3pzC8vddR8Syi4E47N4J8ysMsaC3lZEDFfD+I1hTAXRx006GxzsaQlWwYC
	ZoBpKwwclrNY6/dx9euAfPd6VV1weCHhmAIqCf12QeI20rPuL3U9LZxOkTswuyILweV/om4xjVX
	eAjven3YhDu3XnfsqQXMv5K1tKf/6dw9HeNOExG6/c13KU9PtwH7Dv4UbGML5D4gmLijLTpt+fi
	dLym3kPj+HUMkHxu7stzEPIZhyRVXbyUIE1EAtYiaF34vQ5H1GjPf5Cfv5HlmyThGRtjHp6c7jV
	oJrvNDg+IZeQjIumMtv/Yiwd3bh1s0tPpTprPzKFoYvoWSshb7UsX9+9maz3+coCeWsTITGWHER
	BGaDMU5qsMuLXA5KJGiBn0uVCOjmGt/nejcSQqVpwqHP0ARZXQCIkYuQWAgwVKHNaV+3RD5IKfH
	VTHw==
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268500637.6.1794831512221;
        Mon, 16 Nov 2026 04:18:32 -0800 (PST)
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268463637.6.1794831511749;
        Mon, 16 Nov 2026 04:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1898afbsm4145008a12.19.2026.11.16.04.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:18:30 -0800 (PST)
Message-ID: <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:48:24 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Language: en-US
In-Reply-To: <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX+rgDrc5uWYlJ
 4/PpCuqUdTnd+Ty3QoHjcL2hPUi33M+1f7Sn0m19YJD1OgcUmVFDjN5TNFyAxSdN+lopAd9JBcL
 fGoeHFiNX+gDBNuPjkqZfdXW3M+PtyHt3hUmb9L32S+HY9U04GfMbSKZ8aBGP7hLKUt3pRRh7Md
 DMBNZxnGU39ol6mgu6d5C47hMFed5vaMU0yUN4TOoQonDuc0PI1MM5S1UrHeteqZy/qrBi26iJu
 6M9FYglmHw1vbU6F4w7bElnoPH+irODAKMSz3xM0XbQ1Cgk6JIhgy0bURUg3jhZSplD1vtAo+7d
 UQol5BbHtmS6NceQKbH6V+4fPUW5AyN3ne/a+52CZmQk6HbnrXi+nISQ2tmffGL4AEaGJGyYx6k
 30ZaS0PQzRgDJmsCT4uMNHynNnibNpGsFK5xjqS54iLB1sQCf8K/D+LkKo/CMDYzdJAGepZuuyO
 IZMJ8I0Ndht7OvhPILQ==
X-Proofpoint-GUID: XKXebX-7UVtpjVwmMxqjBWa_sFWZhYQz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX94lzeQyid/5E
 ZcxMmDxoYeD00isgSdkxINAL4Y4sMZ1N5Z+mtV/3vJ/l4l1l5XcGn06cVwjQQJp+J8VF2yVa+Dh
 dsPJLYcYfFubDfXzdnp58bBBhhmbMxE=
X-Proofpoint-ORIG-GUID: XKXebX-7UVtpjVwmMxqjBWa_sFWZhYQz
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afaf499 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LbPuwnihYiX5_xJIcoMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048



On 16-11-2026 17:39, Krzysztof Kozlowski wrote:
>> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
>> binding.
> ... so this was never working? Or was working but you change something?

It was not used in-tree yet. The existing example was wrong; this patch
fixes it before adding the Glymur DTS.

Glymur has three CSI2 PHY connections, so the logical CAMSS input ports
are 0, 1 and 2.

-- 
Regards,
Nihal Kumar Gupta

