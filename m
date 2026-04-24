Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B5330D50
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045600; cv=none; b=JwU9nMIf7ylFaIHU+5DGoGTTleTtmvNJ6s4gleEskgAcaC6lFjzJJJCXvM+LWt9K6ZTY4WteiP+ONFpDFnhebSgBSrw2tvCoE/Emf0n+IE3l3JANJSBRiM2bXaQsiH4fC2izS8ZsTngOElCYc271rt4uhAvwwJFOXT0yiHN0CjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045600; c=relaxed/simple;
	bh=wNxaDkC6wrtTcJ9lwSZH8l/aNgRlmTXFHAH2ydH1Fig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLaCJxNY7SDaBkrO0P25ReNL/RLTOWplLi3tqgDBp2xst02Rzd5tivS4tWiZ9tHWqCnGUmtN/kTJaz1cQz+D/L7Ht8uZEfjvITqgGQFreF7nW4+ovck3SLa1GlLHH/9d41515Kxlzi8r2Nx1Mu8tYNCxjL+ylWo8lzskAIOSR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyDB0HmT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChEnZeOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyDB0HmT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChEnZeOX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OD9E2i4167606
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 15:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=; b=ZyDB0HmT9Qro7imW
	WOZde+TsRJQfcweux9/yIkbAKREPInZwuFzNPl3+jziHSii+tPaIsrcvhDtKevVf
	mvrtCHnvBw9GRh9FJ6e8ezOyonqZpyxExVCBlESpLQQRTLsTLeWvKUIHdjwvis5w
	ugrmIwO/XzUN3Niu/2MOGBGGGHyotHGVVgZflxH0abk/QJFe94OEkWEruM9h4/hv
	GiZy7uv0lrmfS/HeyjtpO3++RaZ1I8+DppyDR/b8+hwHxh7mLhQwU4yPZnmfV+7l
	3B4Q/UfBjmdZP6PMIFstXxRbbjUmOffUIdBG3g7wLuP6MrzaEbcq9YJFP/dXazfJ
	DqoNCQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n22e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 15:46:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7987861595eso219804187b3.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777045597; x=1777650397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=;
        b=ChEnZeOXLVB9CWor+s550+BbnBM+tzweCtgbpf1e7jbtBiia9V2VdUEb6DUyMXenWv
         H7NdGpDC3ONDYAGl19XtRHFwb2Gbluz09+5ZdyP2KuHktWviUy3cDQ7miElmStn9tH71
         ovKGM80T+dgGtcXyXczLhaAzBvEgCnVUIBF18tKQ6CepeTBvQ4Dw7G9ZTNZ0C3FoiF9f
         G6bHmfJzTxzp4mlZ2uXg/THRWFY44EpEfnZSy3zkLF9xVCX8MB0wAzWN+Tsr5dXUXi3o
         nx7Fsi2ibfdb5V3TzQfNpAsZMV1219mvf9thHQweMPo8p3KOQgXyoCGo+rocazPdoW8y
         R2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777045597; x=1777650397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=;
        b=U+mTYYumidBD0Whn+VmD2AhXI0ygtC6ZrKEsk2ImJo82UV/eX7vxaa4dYR3lOhTP56
         QOVvDflzXKNQ1WYEK14ZqVbtfs3gh4M3ntoihX16/wf+cG1uM7kdRKwCkotCrek2V5UE
         fv8m4yPNm43UzkWbKNqvwMp//lVBoi4+sGNRg1SoJ9o8aEQB4FzI7FQlU+tSYi7U4x/O
         z+YOg1xN5lGstFPei9mPDMiJkD2l/61qrapdseYTsf0rDINeP/QxVO2nSuBLVlY9NLIb
         ZZ2okuICUpec3PifcbHNvGugVIbpiHaqcvZs8ENsQt1J/C6xe0QEpOrDrzXtGlHrlXVw
         F0sA==
X-Forwarded-Encrypted: i=1; AFNElJ914AJIKZjEvnHqIngvXyK/7YgLYcHPFtqGlga57TeT0cygLKdQCo5OibcCmdbWfARIt4kqswhBsc41@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1fVCCZ1IVwlfSzPEflQ4+/oN36K9uDSxN/XwSnFkuTN/WaL+9
	lJ02tzG37fIsjJwW/ycWj4iVbCbXaFVa0N389qqm2V2Bitx0DpJrFBpQ8AHk08x5sW3CT3aUKg7
	ngUvbG2nwHAaAkqgsRx/hpyixomvDQ5QcPgOZ+UMrlXycVxBCxdWDLV7/PV4fkuOP
X-Gm-Gg: AeBDietCz4DanvKoUCPmPynb8QQfiUzh1ROz9fKvL2sU9/QkCkhKGZLzMq38/5yfDtM
	euBzMQoHZ6EWg+qEHuAScAqM6D7yXhzDKIBsnlNQw5Pl5+UvVt0tacH6+OhfG7t8BBcO7L7FOpj
	enOOURsHzaASnUYy5aKeqGtWtvweCqEIYBIQ6k5h54dXOMKbRbB1Sv9o+euM1ZIDCKFWjdzMUTB
	9wXTsG7nSG2PUdRiso2A1hkWzn6liITV2s7olCs3ExP3OqiOQf7S0fUPcm2QzRdSR3jXo4f1DGi
	i5dYxl/8C/dTu7HUf2ShVslXR1NsVSncNEvDZ6RE1DmxH5Jz5I/nfrVWCmRDEWeE7OQCGyVxr2t
	Aq6p/q3ZPIxoU+B5HeMW1rOOeWLf5lKaSswT0WUMBftzqQaom7Sz3hasEpD/un5zJSmE=
X-Received: by 2002:a05:690c:6987:b0:7ba:99bb:d4e7 with SMTP id 00721157ae682-7ba99bbe1bdmr297735967b3.8.1777045597176;
        Fri, 24 Apr 2026 08:46:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:7ba:99bb:d4e7 with SMTP id 00721157ae682-7ba99bbe1bdmr297735307b3.8.1777045596645;
        Fri, 24 Apr 2026 08:46:36 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.104])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee99bb09sm97450137b3.32.2026.04.24.08.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 08:46:36 -0700 (PDT)
Message-ID: <76329aa4-bb1a-4ae2-a785-b7815e98d1d2@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 21:16:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
 <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
 <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
 <1bdcb9b1-c703-4a7c-a740-06f237bacfd5@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <1bdcb9b1-c703-4a7c-a740-06f237bacfd5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lW9muriHShicmhzGoPS9vzLnfvOIP2PF
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb905e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=DCeGIJpHnZWVbLPzD22jCA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SZItK02_K8JNU482h3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: lW9muriHShicmhzGoPS9vzLnfvOIP2PF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1MyBTYWx0ZWRfX2Mu0ddzHIJ9n
 /EB/qS4TZQlLMXuu+PKTw46DQfGqlHM9XLKUyUxbMWvfcELK3+M7p8jcuOFaADlW2z9aRHPRmHZ
 dGzoREXTxEOkPQvSR9uaKn74yDxRFLqibiBBWKLtZeUf13UeJY6R+YSXMYD5OcyAVuzSs31PJoV
 kuTbqv14hRC8fW7+N7F6KKkp3Un+ryPSn/haT1/4HXENYLhwUqiwCArNP4CiBUoMZqGO/f2dyQi
 VsvEKNVarof2RSR3jyuNb93/6rBcje+FSO4F2uj432FNZ51WOpDZJK5plo4G8vQfOiGCmzJ8gyH
 BXUQcuTDZsgwWBL6Qx6J5tVcKHGcEXFw19xFsrFr1Kumqr/wJE6DWkHRiWszwq7VtDc0W13qKdG
 xoGvcfZWpGY6BVXUcfRAG0MCdgozSLNY3i0XqCWex/fb++3KonXYhLOZy/VvIJWA8q9848jcx2T
 Y7hc+QFSTLsid5lxnCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240153



On 4/23/2026 5:09 PM, Mark Brown wrote:
> On Thu, Apr 23, 2026 at 01:20:01PM +0200, Konrad Dybcio wrote:
>> On 4/23/26 6:41 AM, Viken Dadhaniya wrote:
>>> On 4/20/2026 10:14 PM, Mark Brown wrote:
> 
>>>> Does this handle missing qspi-memory properly?  It's not conditional on
>>>> the compatible so it'll run even for existing devices.
> 
>>> All existing device trees have been updated to include this path,
>>> so there won't be any probe failures for existing devices.
> 
>> The problem is, not all users of the new kernel also update the device
>> trees
> 
> And also the binding says that for some SoCs there's still only a
> requirement for one DT to be specified in the binding IIRC.

Sure, understood. I’ll update it in the next patch set.
