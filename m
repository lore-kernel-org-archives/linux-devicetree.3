Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003835;
	b=IjF70XA6KcPmO4JTPH9YlIVrBQQl2Crr+WAPYohz4US/xOtHaBMU5c/RhE8AH5VGd0SS
	 UV/eW2fpuDqTweQfYNote/CJ5U5SwNPI64llF5L8K9SiYVfy2wy0lu/EQJkst0VS2ZrKS
	 xIqUMzqA5L59bthJaNlU+KYB9Hqdgw9YTXlZ3r+zL8j/3iA1un+P0v4AWUryGYZzTUZcZ
	 eeSyy/OnpfCiUtBY1BIQ++6x8gMkUECLsoTmEjH6ZhEeqNmae1qZnasScjS8Z4Jlq/FDe
	 7kqQy9MOJHX19VMv2OIBvnaeVXUSkmL8gvR15YscZolcLSwFDkPZqIQpOb/Tena+QgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
	b=Lrca/NkgMs/wisdTeePDbFag3jCf6LWCSjWp/1Cxd7C2zgMk2CG0ik4JqqRlh/yy4C8D
	 xlXX0lVjhmyq7OVUSp5j8LaOda8p6av1qVV940IOs6V4RTeNk2LdZnAF07HkBE7qRirhv
	 0/wx1Pd1g/qBEEqMwBpwM5VTbUUQyzrmZJWDUS3Ng9Vy64YTAOyZL+/JmszKI17Rq9JSb
	 Kngqw6Q9hNoixeBu5PBDol9m2p2sPRCmWiPg0djSCn5crnEvcERKuWbnnH7jiF/RDHaj1
	 krr0duVTcsH709wyYGtleumMc1P4Yc6TMozlZ1rA1Q3Rf5A+sHh5QjZXAhGBWFrol5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7jCeY3V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E8606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 331E8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7jCeY3V
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkjeT1707209
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=; b=g7SVckrU+lSN7YUl
	hx77qvMUjExSw1YFXAMgAjwwKky3QRqTzg6hL9K4pmLl86PqSxL1SQWFgA+9otUy
	sipuafSdbdphZEkzA0h3f6X4bIsbPL1xCf+blh9+jaT2K691qdFuMLQ5cRmAV3JJ
	6mU0qjgVluFtpL5+v6FIJ3t2H193ky9UC4eIXZxJRN8K36qKXFd7uq2N5RA2wcol
	20cw8raBGWOxXYs6Fs1Gw0aT1QjsXmUoGZrqXe5otjj5GzCQ1EciYxJ6MJk0y8uK
	J0NjR3d3qSUo2QQ+BEMYg9h+lvL99eilKQSV1f4PApOg5GqOoCFxD5pG96zPWoyQ
	JlPkVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8awhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:10:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5364f562140so15239391cf.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003833; x=1795608633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=f7jCeY3VlMpu91Sy3cCwCMBe4NQfIaIOcl3iaZdi/c5t3hzIgO07t/grbufAvszgG7
         S365XOkLK8ra2KvFZUqoHjM5iX0R32kBH33y52jjbFkSt3eVFN4/eRmObturV5tptf3K
         qu6izUEmFEqgE+BTRsh5k6I036jBzoLggZc9XnAGtpxj8QV6u4qmMBQZm6Wn60gcus7q
         3eIH68u11bpYXXU44Nye1/TyMpCeS8fKRIG3IcTiWuAYqvq2lp129QWJfo+fwDmJHWUy
         7Pm7rUVc3NO1x0ny/ovQ0I26tiO8VhlDP+Okfi3zaxFVS94FDkhQSgFCsJhRE7FGlHMc
         2tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003833; x=1795608633;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=eng78UtvRaHOwB4tP4T6IZw7nKQEWLdBl4+/fs6+qG6T9qNCQlug+is+1CZ7BTIQGD
         U2QTIKQhAEY23Yo0MCqxnswQRPow8iihJf+uohEC/i8lj2E2QJuXQDvlpk3EJa37zlno
         jdJs2EXtuhvu4UawlWXC4KW9LpnJL81dXGCsV0rP9W70lnsb41e1ye2lGKAO+/F6jWTP
         DkcOdk89FLDrXOnvAILxAzfYXNiajfn6OWztPpK/IvSNtRV6IwuABah9S91z1DPsxQXB
         BymhiT1fV2nnLWGJdfzLNj7qyze8JYT5dlGxGiv1ZqTuAemlNe//Okj8c4gKIk+DOTTe
         g8dQ==
X-Forwarded-Encrypted: i=1; AL+hErGwSQI2ueYX/+IbChfA5ncNEF+MgJ84SWR54pk8GwtCQZMhrMad0GI1dqpuggLP8bl21jssXGlSmqSd@vger.kernel.org
X-Gm-Message-State: APuU4Z+OFbaf2pSu1Luz06HWxMwrO40TZIxLyrIca69+QrwgynhJHIyO
	m3rYjQKEwLZgT3XTmgYE9icMxF3UwK5IrBpqn2GUe3fpnxPZjhA+IenulF/UgDt5yoZbb6cfX4+
	OpVmLdDEXupHG8sMYv329Buo+Z6bFFWcwneSkCyxinGe798vl9npNk0d2yVcGIHZd
X-Gm-Gg: AYBFou34Y9EViXIGTN3q5TTEiuAiw9+DAr2DxyeE29rOI8wZSHw5pGc10iL88wDVYUc
	ayT6vQ1akuIGrWUaHJu4Sdp3owb6jhtWjcjMxmw6RyPsmEM32KU47e+8uThRR7646/YxZaLTJV9
	t1bG1N/hM+xjpa3LtWlTONOahXtkT6nKruvFVjXa/PXfGC+Ca+V/LYan7dCBsj1pc9ssaZ6Tdjk
	oImiACIW1K/nQsfwZmvXgzFsqKfZFyCqMH4TfCkNwq8D24NHeg8ufBIYt/DUocRB1UewDVra5rx
	3gtUn1M1DNeD4CAi422OOLGCJTABUVmIC/CdPJZBtl2cpjoz2LpGfV68LJBHyZ/lKFL9xh0lWWS
	NvmUL8Zhw9oAvV1uj6Y9Wk8zdibUtxbEMA5o6RPldv8S+BfISHy26HwsK/8FMnV8kncy6tcdYbK
	4=
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959831cf.32.1795003833357;
        Wed, 18 Nov 2026 04:10:33 -0800 (PST)
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959421cf.32.1795003832861;
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63826885e9.0.2026.11.18.04.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Message-ID: <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:10:30 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
To: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
        devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218903@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1-YeDzVwE5wCdayAOw5Brf7Fg2UK4gt3
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd95ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=nKi3LhNZ2G6YK9Nm_qEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX0oQjnYPeXOW4
 kwKN7hpdCIRmeOv5O3tisepWb/zn/FXRgPXoW68DfvqXjclJpIEXSZYGdcc1+3HWtSOdyrpdmuv
 vSFI6uVi7oGsVVvuNTPBt0O9+jWYhq4b/liKDJrXbGCuuAY6cL8TIvH+GLaKYeOBg04kXXClAMa
 elolMgjI9Hvi9K9nenBYtOdIpT2E6QInvzfHQyzgJzWj5AkH4F7D6knbX3T7VVU+LH9VATKMk26
 ZBW0qne2MvmjlV2wMN3KvBKb05yto2iKKY9YAev9bICMvl5gixV+tHc7qK7to7zSbN69LdmeUbv
 csO8S80+ILG/FcEzn0vYzodVS/c0ouXFCSnWSm65EkSDQmVRmdeqknaAhYjMy59n0ECH2k/zq7I
 SuIpVyz0IfhSiKppfIJrngAqk6Gr1p38kfUMHwR14FcRKNrsf2GCheOAMpWDhtuWRT0C1BuSdvL
 yrr11OhsKrdmC1XX4Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX0AYr4NY/XLJL
 3JGUrRgF07NtUKjVRuhZlw9z62Unf3vmKxDMsHPv+jKozIkYoJUIMJgwUIm6IJiT5X5+SVFtk16
 1dmqwT95hhWwXSkL+LwYYOtNdM0STOU=
X-Proofpoint-GUID: 1-YeDzVwE5wCdayAOw5Brf7Fg2UK4gt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 14:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: imx8q: removing vpu-core aliases breaks
>   vpu_core_probe()

That's intentional. Users should not add undocumented ABI and rely on that.

Best regards,
Krzysztof
