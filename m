Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BD24BD781
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473032; cv=none; b=do6YTh6i/qn14SfdoyOGdSwWCKhrCoZhROJlDyMAgCxwQFdwTqncPCfNQAMQ8GTo9eyd1xvr3EB/8ivZ7f1+Wu5MFjBAhBSkt41S8gH1h4VwMW+y548exsz88F8Qaim+QQeoi8xy0JvgyqYvPmn5PqStT2FojTbgXbBoWXj4W7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473032; c=relaxed/simple;
	bh=d8eY+N67prVKWYXmMJH5sh95clXQWjAYYw4e1bbTxVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p//vb/14a3fY1sZFNyAS25eYoL/hElL0Y7kkzUE9wI2eZH17NcQ2WHll7lzaObrXnwsrO49Q5mfCI/d7fvw6SWTypl0SpPEJQovCQeS0Vpop+db2k07TbjyBdE/LilXPoVqRCY+14EAvuRPusyRm0m57YkixciOOkiV3BmnXsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Clx0qpw3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wcm97qKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Clx0qpw3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wcm97qKD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hE8r3911956
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=; b=Clx0qpw3J6vrNonh
	hpv8evw1N1I392+IdDs60nMfRYSw2Z9w+udKqycwb6Jfad1LNbmm4cHY0bJL3TOU
	Uj0HAV8N802PRy/R6KEA0fkKEmALYCKj9uFBH5+XiQn/hJUwWkA7FgH6v4tbRQ4s
	oSMrGT/vcUqF0eEa6h1I6FmAkRhc3PyHKLJgTuGDoxOo+tWJwv0FLL/CYoFYgnOc
	ZVUnLf4Zgwf2V8wC2WGtWKZJTkHAmVwmj3yNZFBk/BLFn/eDcvU30F0t/02HEdhl
	lMLibdWoXikWTwc46tGNBZOaGTQkBZkOEjN+dVMeKKHpTIg0aRkAH2J8njyICx9Q
	R7EClQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jesccx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86ab8302b54so4689233b3a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473024; x=1790077824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=Wcm97qKDGN51sq5d5mZsM2dFmCOajcUbBPz5qzc2YqiqtGk/Q46ytPaFN1/1XrI6sF
         ZmZI5q3V4X1QxqYvZBgi6f/xWAROEPRxlSLq2R8ZLrYbk/CTA7WKN0hGjCk6c5YjRZ1y
         UqrulqrHqx0ip2aKGb8Zm/VfqkZcEAqninLe6gVzh5fIUmn8091y5VJ1SHinP8xKifqI
         3Qn9pJ7aPvh0wsWDxGo4BxY7rLJc90bA0v+etOc7RLOZO/RFR6aCNrWeFQ//Bfdtzfar
         0xh9ttNvgMxasMVxMHkCe0vwZlKftOE4ERiVjCaD2pxwaE6G0ChbowjjIVnQ0AbAKE0I
         8UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473024; x=1790077824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=gDQLvIJaNLu3SRnSCAct3D0J7Qf82UyNvS3IvNELJxfmnJygm7mf2wp3wJgJkdqZgD
         h+3x1cEqeoaXLRmC9T6a4qbYQkxwcyGfEPId2Bvr7hA3YL7JwxBiErf4j8Fxh9wdGinR
         VSpMVRdeiVX51cb4AQJZ7tw/upZluXqpCvIjllio26iVlyCLkOypZSQsGC0s6++t4Ixl
         FIADA66WO4G8A2wobaneqT4JY3dFV9wU0G99fIAcA2ZT8CgrNSQldhVNU5ojihi+Jdda
         Rmyc2XFJmWpdQTmiTbHaphroGjpVY/+cCwnkImRUTgB3XiJYym1Ul9VY6i7CQ/3YikIF
         4zxw==
X-Forwarded-Encrypted: i=1; AKwUvBwcMUpn2haoMnE8UY5g5h1dY0ERpIwgbLa6F9BIsBbe2C76pUtyHrntupck+qwhz4uOr23Zc7h+Fe8l@vger.kernel.org
X-Gm-Message-State: AFuF++mN+gHIqT+luvakngYk9gv+7xbZyJhu6nMYCNhoPjUDM0FU14c+
	qHEGcTLLwN0Hyst7/H6PngnIbtCP46zq0Cv2rzJhIflEXrVCq82pyWN2PEJ1l0LMN1MYOMZbdr3
	6D6EP2YO7flb5go2goHeC6LDuDmj3KCK0QEdUL7u1dYw4n07Nf1t5cRimJ5QUT9Sk
X-Gm-Gg: AYBFou06Ghb8PSQ6dM9/YrWJ4D2gQn+ERpdWWdVy94t1wENAFJODrj//+B/hhigTqnZ
	DEf5uL4I5i8BxOHL9R12hxaZy6QGA56dgGrI7zwj5v+KSRpZMpR38yGMV6DN82gDiN7xw9TadvW
	O+EiEcDyqOWcby/5RR+7LG97tAvAbIgTEGDaBuuWAeYG9/W0pKWmuRdR8f4CHOGYpxCWc/Xn/nU
	yNLpP23PHhhCvfJ4h0Np4zvlsYVy3T7j+YH8Z2DtomsODRlqpnXnzTseS0RZ7pCQsFGs7uyqpEF
	w0l7FOgo1ptbcpLRiylvN44eHOAnqHDnfxdNRYg7BEOvTPkNtWzhld3J3V25b3QyaL1PRMd99zW
	cTUBqwxSL9SLAR28JAMGzjWko1IUs79BM
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328385b3a.12.1789473023518;
        Tue, 15 Sep 2026 04:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328323b3a.12.1789473022970;
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Received: from [10.249.97.198] ([27.59.63.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b5674bc2dsm6188135b3a.59.2026.09.15.04.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Message-ID: <37ce680d-42b1-420f-b42c-1ea4aca424db@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:20:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
 <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX1mdxd3VjCCYS
 0LJbqHuHZ6gltSnuJQixRIrLlxqUX59FAH4mM7jNuiDqVy8lHBKkg2faMOcH7Y8G9wEOJW1US9H
 CCFq4AcofhBEa0f6hzUSBSLTxORb2P0=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa93105 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=blbtgvcJIiEadBFJWCYS5g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZpEcStechgvjzwklZV0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: s3Kxkrma5Io-BwRwULqkp23GlEOt1Ld5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX4JbctWulNz+J
 VmcMHxCVZbuWfDxoCeg/RnGiP+4dSpxjRKnTrc5RS2ZJfcVLq4EsV4CSYGtsYZrU2l7JYEHuS8Y
 cS6HY0V9DiHnqIZW1+ido6oN3Aj/8GDNqNosOCWOipRvj22JlZb2eXDsTyXKrPYcue1doon9+jf
 e4zu79x85mgEvtKhrAF2xDKRhFmxZPFudjOHraeIMvKd85+Mc/i/k2OrDmHqIPa0wRurdO5slqj
 bEOZ3H2W0jy7/aO1Oav67Zs1dKEBix4HIGG3Ou08pPS/egnMF4urUuN4JX/sm9cyMcLkXaBF0H3
 mdKilxeQcMa+jUazG2qMdc9CUekwwsxH7FfhxqhRvUoYA+ox1CjpGDUGt+5yiI85jYsPZang849
 wSaq3dzUO9as1b96tj0vRS2oxG4mvPnaW8NEApIBZ8g7+kHWvcIA5fYXWtUixhM0IYstfaDF1Pz
 wWkxGjSGpDAm3oWw6Yw==
X-Proofpoint-ORIG-GUID: s3Kxkrma5Io-BwRwULqkp23GlEOt1Ld5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150171



On 9/7/2026 1:32 PM, Konrad Dybcio wrote:
> On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
>> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
>> during clk registration.
>>
>> This ensures the RCGs are connected to a valid running source clk before
>> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
>> sequence.
>>
>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
> 
> Is the no_init_park variant an actual problem here? When reading back
> _CFG, is the parent preset to the UFS clock (which isn't running)?
> 
Sorry, it is not the problem, these RCGs don't have UFS clock as parent.
I have retested and realized this patch is not really required. Will drop
it in next version.

Thanks,
Jagadeesh
