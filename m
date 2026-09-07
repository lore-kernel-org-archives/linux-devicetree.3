Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B0483BC0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786591; cv=none; b=bD/0wTDxmDiLoo7rs4yKzHi4Q5C4Lwiro+QJH6b0f6+q7deY1u42WgIgDVbo576TolgfR8e2F9e7Zi//YbeGBpB6coeyqvGlfy9AHIznq+BRXIgza2k2OyOgNev/JPGlZs42+Dmyd42rR8jE14NiuLS0zMmNhQmb2Gre3LYmxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786591; c=relaxed/simple;
	bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVrqqZnV9U6/8oRKCpCiGzDQwnBv2ilSYOTP/Ob1uvApE+4tBKCjEYVDi8zFxeJu01hWjB8NXwZBTUT7HFGyCKp5tkh6r6P3qRjgNIA7SmcqD8Hd3lChP9j0tPDpjTQ3jz0Mv4pK0cBlM88waAuOzTtuG5l/gxH61xeG1vo7qgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIZa9HO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOeaWNTM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIZa9HO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOeaWNTM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvMfu496196
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=; b=IIZa9HO/AslX4dPj
	QRCBxEXExnjgwe82EyKstxIA984E62m0JBfn/uZsSgohFyZBJJ05eY8w6GZc9iSD
	UIfBrIfqjWyMG+wQphMs6oWh+g4vYcYZzWxWXjsojdvLK9wQ9UsIPuHdPsZ1ESCk
	aOYcGPEuTP609d9hlUZ5J7P0MPyUoIXF+6EV1Oq76N3WA1OEZ/JO19u4CNyMGcZO
	uwg1LBe1P3ddelUu+sbXwCdSD4bvOw4KsdhBCAuMVczzCT64MQs4PSPOPVABMGyi
	B5pQPOOiBLt6w0q7BtzKNpbX1q3Tdbpla20sZxHqsjPw9Ub9eSSaIZHzlhHGH5Yq
	xqBjdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8ehr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:09:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso579807485a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786583; x=1789391383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
        b=fOeaWNTM453yEVpzLnSJDg8MP6oXr+k2NOhZCVYNK2DYUJYpIdhRskweoy00hgCn9D
         Je371JPhE1TU6HRT/8rK3TTIwFNI6blRcSLuxyuSSSDMTfiqpvJwsocnDowEqwgTU//u
         5mxl3goOd7lkpZqADYFeKMbGccagFfJoXeuKfxS7e5HppZF3cOVQN+gV8YbPtC8ZjeB0
         F8xzuz8okQ1opzMPnci2DAaGDfwX3qibe1Ziubc2n+Dg2Xe4TLo1Fr4CPpRsnvTC19yB
         PlxshpdNpW9jRZGx+O0akFwv72Y0ZO/Y9fxoiNNeWFOd1FNcBO8HRGCDAJ9iT5TFI/n1
         VH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786583; x=1789391383;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
        b=R4NGdBLEt6/+nKCcblZqT/PDXvZ53UdZJE2rXBzrX0ps4xXxoG6aXboQ1PNfFcTqDY
         hxgGZcavZ6VH9O0GeImdDfYgg6J3SclVrpeoRGDRMvTyiB3MCuj0KLkBUQdP/2Dmqcq0
         H72+ZYgYS1UqthVLyEF97vuhiuJ5/zCE8OQcizwjct5q0MWBa17863UpISEt7T5dML60
         lMhzZWkQLsLlPBF1kbF/q2OgpVzxHkeLHEhZCjlwIn/+nFPAa4eNP61wP0NkqnYoJoL6
         kgmGDmZepLmhoT+6fTThs+lRjFJSTaheolm06si46/SS0lPhQvYJv0HoOvHdPztDiX50
         i7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf4n/De6jVdgH2DLVUsbBGIZilo8kIA4KPFSs6HIrsDARlXgkuoFDQRvNfeJDi8d+2MVgPLnqEhGfc@vger.kernel.org
X-Gm-Message-State: AFuF++mU4pL7GMgfT3YFK9GsANrgM+ucwKLABuWU7YopuVVTV3vok5n3
	O1AlYZoVOkXylwz3YFOAcv3HyAlS3ALZ/08xPrB8Zl/59Yaf+QveVYeQux2zFt8HPPH13/mtOrO
	dnescuKLbPKVH4uKX3xUz3xoHNnrWMfZ60sTUzvNx1Mi11/woIDLupUW7e1UPnqek
X-Gm-Gg: AYBFou2ycc3f459GZ/fYCy42bNHaoBHxh8YVHMuV4i8Z4yN3EQUwsbfVwjz4kwDOzUi
	Zew+tyGYNC+VG3GeIK8qiNSAf+iL8Vm2kZS1TuMfKnqn3er9N+fVo6R2vpSSj4M96bZIP3Je7P0
	0Wb1bdVeZYLM/LeAHRpd+NhKB7ituoNMg2vH3jCuASnI3dd05D5OD2QjnATki3b08inu5LWzq+w
	wJCkgNl1hukeioWV4+v8HNH3nLdZCXbhh3zweoMJKzGkn/MyqAK+hgouwkhdpUxCnbQXT5Y1NDT
	0wMW6ggOH4VZ4QwekoH2neMxKgdMEfL2VmS4XXW2VpKm7gqAxiUBxG1Ju1a7tOPPIUMPVl5/pTl
	LlpPyrByNrKVIrt2w/otuRkRcdie9
X-Received: by 2002:a05:620a:2903:b0:939:7c8:78a9 with SMTP id af79cd13be357-939802f31c7mr2492766385a.3.1788786582912;
        Mon, 07 Sep 2026 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2903:b0:939:7c8:78a9 with SMTP id af79cd13be357-939802f31c7mr2492750785a.3.1788786582247;
        Mon, 07 Sep 2026 06:09:42 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm208565105e9.10.2026.09.07.06.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:09:41 -0700 (PDT)
Message-ID: <97cc74e7-724b-45a0-a839-758c6fb383e8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:09:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 09/12] drm/msm/hdmi: Add HDMI for Eliza
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org,
        conor+dt@kernel.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-9-67843277de17@oss.qualcomm.com>
 <20260828142220.AB61C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828142220.AB61C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX7qPCugTEVGzA
 Bz1Mgu6E0B4EUUH+rzCyigHDZrNVdCLMkCi/TDKzgYpbUgZh6YOISQ7eOIBg8LAB6jVx72C8DC7
 urPt9m2zCJ9aqjiwTvMZ/YwG+rNI0/Q=
X-Proofpoint-GUID: nCX7PmmWtpuCNDJnVMgCVqHTBv5sJPku
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb797 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nCX7PmmWtpuCNDJnVMgCVqHTBv5sJPku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfXyAc9Z9wg2fBz
 tbrmjTI8P/3uMOyKbKHTlF3rG8tsa6dIZzx+NoRbo6caCsaVS8Xg6C/waiM4Y+c+1W8W/N+m9I/
 E0PWfwYm2BEY1E9CyaL2njrOF+n5RHNM8mAIv6bcpS/YE2UrvXjxT9aRq/mcRoMEzNaaM+K109s
 dMNmAScN8o2j/Q+KH3AMfUYre43xHzZAk2tFZL/FbYjUqoi0HVCL/RXkIuJ3DcgUKwiWe8yl/PN
 uN5erOwnbb6iaGdiOo3cxdVdT0z24JizeS1gTubh6bTk79qU0dHlQRVC3nl1R96r3TnYbJ+WAWx
 iQjNx4N0NQiXgP6G55p/a2ovBXUg2AB3BbqlUXDgIuD5CLTxQw57yGHJjHD0tFGxABYb0u5kTtj
 W5TJ5MR/VGSyfJpTAjNVWFn1G6hmoIuOGjKttTMYdfLRcW2yb43AB9Nxisz9k4uysxsDICdODdO
 Rl3WapRLTuvdl1+84rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070144

On 28/08/2026 16:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The TMDS rate validation for platforms with OPP tables accepts inexact pixel clocks by skipping clock synthesizability checks.
> --

ack

Best regards,
Krzysztof
