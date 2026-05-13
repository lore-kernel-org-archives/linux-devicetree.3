Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671563126B2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682858; cv=none; b=hNNkw9ELwJ10WwHtCTBN7QLC0haZPQbmINxA1ohQ7UuYxUfEOqpE8s3nJ8q2Dhz6s9GnroWmwje9PrM7HPqHdoyH/fuJ8FzJAbc6iVwgyznEJTORoo3oGo4YFotFxraahiz03Wc4JyUL5IhYU9j181fmrmjDPFdfYgQjuYpjKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682858; c=relaxed/simple;
	bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqxLTi/l4Koy0VGFkY1vXtaZTfjURNR8e9ZHVLjSaSPnDxlA4YqnKt9QZdbFUgvWm8YxwM4lREGBIAFk1MyFISOA4ZJuw0N74mi1hKzLMj3Z0SdEBeDBl/1n5j1q0CdhpDRBgqW52YbOI/1wDvVCQudwUeBtWu6xfSgtu3E2Exo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZzQAQr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiKv4drg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZzQAQr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiKv4drg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBfWAm3324795
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=; b=IZzQAQr1MvtSXHUy
	nRdk6TEH621Bx70vtptShrLmWNeTkDRyEIkp1Eop9QpHyJk9P5vrWN9L0zhlJ8rZ
	/VxPepHbsTE9xUrPTEmpEGzyqtyERytihoo64jn6UC2BHoR1jaemg+A+ZgGQQj2b
	rYuGxLnNZnz32ZOCaCtX9uDIFr5nUUpHQqOGNWKZ5ZVYMk+psXbv+Ct6DWLGahSf
	tFoOix36xfh7TeU9LuzJq1SyvFhIh3OOjGQi1OwTFT+tRZteVNhUWgeAA/M4XFrc
	FVsrMKgDLnZx47nnrxIajf44uICFqXhJaD1ojfXUgFguHWFktYfc6lap22jR3Adn
	w3R64w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9ww0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:34:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575296be5b1so662543e0c.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682855; x=1779287655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
        b=eiKv4drgbkMVaMhPl8cVMTsoofOHn5/EhDP4QX/5e0t95MUlEUP9RX3XpEbxOxnigH
         Z6CbwyqXFBLji3BcxJMNGghSg6+X0RkJswuCFFdF66S73XOgrsVXcCQeZPWOeq6Ysaba
         13gvYVAq9RKdTPlgyznHP2O/Ef48sZSMNBtAjlA8ZFt8hOCpEJs+zzTrXaW5ZkiTXhVD
         KVd+XLUrNOazsau7tskJoRXptJzuNnyaCxj9eYFlFmvV/GnRFctnxcIe1jFQLB/6bw9H
         SA2BQAKzEYgIbwwttzNv8XdCZHX0EAeKJv6pXTryQro7s7Mv99pkx00OcXOMxH8ExENX
         NrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682855; x=1779287655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
        b=IWyKYvjNbgjdZHNPNhrAJ1RFHYSXPPu8jzNX1geg6lZ1bgcNeKvF7vnTA3iZnJL80V
         4hXhubFeR8B2n6gJR5CXFiSBxkJYEbGUopALCJBaQfRwFcaqsa2sxuoiNXW5SjftP4mP
         CazfHSmFzZZVmDNEC3Joan3mBsGlgYW5Z+7M19T2ki33nKpkvOkkz3IfJLFFTbLV6Ssf
         +Wchgqhl6lEwAnNzJVFZjMtCprGlIysdU9gNO/7jd6wTv4ri1nYG1vG0pYYEwEE9bPho
         /5rTRivYnRdhWs/zJ39cV/aQFCeXog8CFlIHTLwYjNfjANVhWUqBZXvyDWOhzvfDvbLe
         fTTg==
X-Forwarded-Encrypted: i=1; AFNElJ9c3+4Frxv9WN6cPbluegCE5/dEW4EmTq/CeqfOmCCBIOWmxhdAUN/ccu3ui/dIVpXx4u737JHd5hLl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb1zQfPRAhj8529u7pq/L/cJCLoxrR8LDojIF6r18EPET2cmQz
	Rln+m+t6SbxmgMIuM8wskcrGAhJrIJdl3rsBpquNoo6Bu6BHCuueAqJAg4Z353juc86adi4VStF
	8MH6xLtDSIfArcD5U+cJjX9mni/R5pQcfvrOhvl2323ckdpRnAB9CeocClw+Mih/z
X-Gm-Gg: Acq92OHhayaKPFavdcXcjEU1ZG+0rGZNgCH2t58CGbchN2KCICThxYjlOHwS+0rEYI2
	NOExxaVVgdqOCsdSVHWBxSwGABbgoL4KcZ0sEi0Qqi2C1AbnVQZmHvzLlTLIevDAyu5B7zwQqAr
	KJBDdCc0WeQQl/pfAo+WfXrgiXTTii3n4LcMa73Mco+8k1UAxqPOcNbW/8uV1aLGfEEZbIQMavT
	wUn6ZnFnK4icec01f054SpYMhI3jQQarcn6SsXE7vWlm+6mnUz7C4fI2R+mBXUpWwrRb4Q10nrX
	C9ukEcrDn8aI+RiJd/5uvwxvPyljoDzei3jA+GqXJx4pB1a5bXjvI1Dn9D5aSNz1uOPInwJIWgK
	+BPmTeJ90coqiucZH2ZiikXDp/MIBBqqk3ua6EREbO7p8bUR24WUeCf6mk5thB5/pHRk2HLqUJQ
	cIDXs=
X-Received: by 2002:a05:6122:6d07:b0:56c:ef9c:f9d8 with SMTP id 71dfb90a1353d-575e6b6f598mr758293e0c.0.1778682854751;
        Wed, 13 May 2026 07:34:14 -0700 (PDT)
X-Received: by 2002:a05:6122:6d07:b0:56c:ef9c:f9d8 with SMTP id 71dfb90a1353d-575e6b6f598mr758272e0c.0.1778682854220;
        Wed, 13 May 2026 07:34:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm6338794a12.24.2026.05.13.07.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:34:13 -0700 (PDT)
Message-ID: <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:34:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5hGssZ_sX5mNMT7lLGiUdocmsGGFx5PP
X-Proofpoint-ORIG-GUID: 5hGssZ_sX5mNMT7lLGiUdocmsGGFx5PP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX4U89cX+fV4or
 IsCWPS6iUSGkM/DHPsbI6Hvp6JvxXPwb2FIbeiYWpy0kxzqSCtVx6C6/96IfK2FZqVcVGp00cKB
 komXKtcvmwT7xSFW4V1H3MVZTWfI/5dNDb/d1kkOH9WwvOz+A9JVGPwrhDVy6QUCr1c8maHZ9a8
 uf/I8VkaxGQdI8rsv9ajF3WUNhZmqixclFyvJNuzLWzUTWK0Ex6kbr3Dld9rdIm12lK1B9l6CU0
 k40MXzXzGPMPIO0sci1KwO3NUcCEy9ellqpV1acWBv678GMZhuAJGYvYjrudUijB0lOfgRkzwBh
 ChDUf2DzV3449nFE97SD26yE1hDSvthjiNSHwCFJnEOVS00wpYsh35czZUj387uB5J8R98l3OK5
 VHJujLXaqXlnW1jlbDnS8pX1uwVRfkprKTw3bDfU86NWNvjeKWtvIWQIda//rtHQUPrlH697TeK
 7Pw7Immtn8ZuPz+UErw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a048be7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zU_0Paue0AqbtnCKBaQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149

On 5/13/26 2:45 PM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.

[...]

> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260507-iris-ar50lt-06228469aa5b
> prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

There's 6289 prerequisites listed in this cover letter (probably a record)

Konrad
