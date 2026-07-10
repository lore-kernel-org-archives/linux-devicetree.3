Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB552E762C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692253; cv=none; b=WpL1/awCrnY7Wpb98ImqS86SCFyZu1cBMHkrw4URrjiu3hSrwv19fLJNPF+B0eYMQRz8p4GELBnnQT6g+tHHN6FiAK0vRDjntbdzmtOTPBslIqh6IfUig+EjcsOZFhctWH8LzVmdmml4Krit/OpR/FP8/LjtY8zvtYvq1KD99X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692253; c=relaxed/simple;
	bh=hWmKl4wmptrKz+5XBCLWWbjpeoeG+4z1lfyPJaErS7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAR6Obna3Lw0pJwtlYl8wFnZijrJZJT2N7E0OjzWSf8vo1W/2MHLY2jA2a4PvdrWwqhx5kxNS9MC9GmFYFNarmaxwl/zCaiRPG4ivCK++Aps/ROQJd7SsMPzaUZ+XEqsqwzoTusxzWUzZSqnLpyrduOy8bc2dtR0iXto8dodmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbehK0QK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVnCyikS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbehK0QK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVnCyikS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6cdQ823427
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=; b=BbehK0QKnqLrS0QM
	fryYAY3GD1oikiJsEeFEFPbMPJhrcDs2t/T1tnXADN8xvhQr1zLpvmBJV2EggxtH
	xj+phWHork30/qKYMrHV3KSLRT39rBvv9H5oCo9JwkTkW+H82QaL1CrAmiUckS26
	auVT/r1JMulGbKO5Gpr4xKj5JtqjmswvBwOxR9iZL5fxNWyzUpmOjd0MujTQ1VVq
	Zf+0LjEb6hKzn6jHo70at56X9+P3Jl9prHI6BWGQNUgfh+5/YSspx7lqjibfWkWk
	DWZP4pZ34s3rtmXY3FF6a45G7e9Zb+IsnE01DJTt0+y0arip3KcQjEPL7t1Uzn+E
	J1ql1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjd08j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:04:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so27289685a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783692250; x=1784297050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=CVnCyikSqPZJ8oTT6O1wqyF4Xu/hnjJM2xeqLgi+OhU7pggOiXGq+kxrymz2RzPkXJ
         X26y3EEF2DIkjb0IB9Pa2noIFYNKuVskL+VlUFfCKnRZDpxiOph+QRyWev1SH0XxEcdF
         squRGYVHZpUDL7monpOw+W2jzARhhq6uDBuXoi1vSdA0rEK6Bt3iFfKtXjI3k1KezSiy
         s/Svi/2IfsIxE0Lb+TGnuW/v31dn4VKEOBgIasKXvAp56ZFQMv06TH+0xJSGhwEab/8T
         isbppJXRzQHcBvHvspZUMleJyCOOzT/k8wiWwhHUvwiGIDEELQt1wc8VXZwcsy0NXSzR
         54+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692250; x=1784297050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=F9EC5im0YsX4wyHKZ3GLazkMrVLl+JAs6bOc9EysUbH0sBaBWAC0i2DhekfeYDQjGm
         sZWxq3ukGXZCX24x5mCtJzs+PupObvzUHDfhV7u2QR1qmo4sGmg5TkyGLoOh/UnexOZP
         tuVGTglTr+5wh27sMTqoKO7X7a8w8ljVx0gIFrUr4XczdBg4Hv3UThsX4cDJchzKn3RA
         wEDWyR0LTemibK1ZARb+CTgCgDl1EkAxaolkBAA2E15zQlRT2G61mw898t+DefCvxCzb
         ckAaEK5e9OlTYIj2TMyzIqbRkCpT5mm5fBrQK3qH8czmkLH912kszONr5p89647D/OcG
         lXAw==
X-Forwarded-Encrypted: i=1; AHgh+RpJx66F0S0uY98PoNcYA9cCEm+Msr0G/3WEDIQ445q/KBXnb/9URP3VF7cUb+4gIPXSAmLeQhO//Er8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw62/RMOtO6Sib0jDQA2MQ8MvZpbH5m6WFr/Jb64uK8CvkyOXl
	csxqljWZw0Xoh8DVylo1yy9kUmooEwGpusNgP8LIcIc1gJ6k3n9sSjMLZ6pnKsJLFQ2EzyFs0i2
	Vyidn6Q+lD2WX+s7hz5teYZ3PFHzhN6lS1xJHLvuTinLtrMokvmaSynFL9y8SIXXf
X-Gm-Gg: AfdE7ckb/J5XxA1QfQijLsHWs/Y/BhLF5h6koN9FxGYex24GgyGk3cLeckZ0DcAGWsD
	w/RuWEt4ZMVGBsP6bth31MaUVnv3gmS6Q49RKjyRUQ/kUpZK+uWjbFnQcHs9QoVJDoL/1YJnVzM
	NTnXGgAviRBrmsJX2GQMy1st5ZQ5wI3UfLIiD6DA3g4J8pGc87mM/KzN9l+qOw1opeiZIsQo2gH
	13FpTj1oCjSSUmCKS8w2hbizoe63vqidVrwtTPX5VqACDjPyz5KF28M/8+9GNbCH5Yuiaw7+bm8
	Hwb2nxGAkw50HX8Hx/F9rjNUdUZz0xC1sfg5BdlMUAY9OzuXxX90jYDuAujdfEslbbSijzz8rdr
	MzSmmLPlZJoaCc8ttFuj4t2D1SmQzjDl0YtI=
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698108885a.2.1783692249882;
        Fri, 10 Jul 2026 07:04:09 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698087085a.2.1783692247367;
        Fri, 10 Jul 2026 07:04:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm311138366b.2.2026.07.10.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:04:06 -0700 (PDT)
Message-ID: <0acb2194-3894-4cdc-8f74-a88ec3670d4e@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:04:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
 <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX34Hp6jT4S/sM
 Zgrb+WLotz8i8trSQmg46TKTZ+K1kA32Y100ek+KpBYk0/BXTNe2SbD8eE2AYTD5uRJ0IiPboLb
 qIyYVKyxgLiP+W/pSFh+xaTv7tx1pEHhxbvpbqOftC+XDY/6E5P5aKg9XB84wBwyy8d9tvfD/c7
 WB4X5RYZXoFVCvqcHo/2DP/Y7i+PGxu5NQoIz0J7GUq8L28bknX8f1UvweRUCQ1cJMjgaCvJQQS
 wHxeaNOdArgN2QpaWJYIUyxdktzOmQ5aBgE5XjgBNxITGcHSTnav8/3SuIRuQlGvH2OBuvN8hGu
 9C6Lx5oxecz3DgrsewACHEEARDV4QKW35I7uxpi2NuPBp4IOc880YVFuTyrf+V74w1k+lgbRTLi
 VjcgnIMmmqfoDOwXux9x56xyuTUvroFUNuLT6v8m0xR6zHTxmjnSdsj2VbPp3E9JY2QXnCb2reg
 dqFHknUGiT+NZiMxnHg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50fbda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_B_-jDzFwVDfZiktVnwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: BPt4nDWy7J7-fA3fVm_a9Th1zOPkWigC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX+8xwEvQkp0al
 H+dT2nw4V2WMK33FU+ntsEJRx4TZ7kJvnWiecpX/f+vim4lEm7rHmcZ4FsEZ9tOVqZpXtgNsx5j
 s8nOpgd2gaQCKqh0fz+wn260jjxspgs=
X-Proofpoint-ORIG-GUID: BPt4nDWy7J7-fA3fVm_a9Th1zOPkWigC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100140

On 7/10/26 3:58 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
>> On 7/10/26 11:22 AM, Luca Weiss wrote:
>>> Add the OSC L3 Cache controller node.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> I'd suggest to squash this series into 1 big patch, without patch
>> 3 applied the OSM driver will engage and perform sync_state (with
>> 0 requests, so it will vote for 0/lowest) and the system
>> performance will be tragic
> 
> Fair point I think, I took the structure of the patches from sm8650
> which had it split this way but yes, it doesn't make too much sense in
> terms of keeping system performance alive through bisection.

Please carry my 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for the squashed patch 

Konrad
