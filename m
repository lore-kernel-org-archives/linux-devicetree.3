Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399813BA24E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294328; cv=none; b=Vh1LRD1B0hZoGP2H7DGcyGQFXlYJUKj9CGOlYbFyHWMHpveFrib6VU3A78u2+ysHT8t7U4Ckn7dzN72zoedd//3dFv6mVS/wUopbHFs1gAGxdI5A3dfacUwZPCxOR4X4Hg8PnAwRu/i8rsBsDOGxkBiBEgtXWe+W46e06Jg4JGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294328; c=relaxed/simple;
	bh=s0X/oNtxwUdmyCVyWktNtKMFUbuRfQD4WViCsZVk0y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5eXFDdYdczGcMH1uMRwchso+swY47NYXyVUa2pfJcZX0bT6qk3cBucPNSIOU3Av/flbGBM9/FsZs+QBHlt9uHpj4r1YS9XpcMpUVqyValTxGcGHoM+o6YpK3piXxUpvgFJ2puV6AgKFafQAoWRLY17arnHDwaB5+9aA6+CnroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0SCdai1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI95fiJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0SCdai1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI95fiJM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYRg6429029
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=; b=i0SCdai1BCRmhkuX
	qxUVkKUSwK1/kUM388kyryLOT9LVDbHWb2w6DptC2ckJ4g685MVbEMIHdpqFMoxX
	rn2Lad/qhdTZMrskkQhSFw+AuXT0xa6wi9+JJvF0DNsIyWWirRlNia2UMMVZYmk7
	Zbdi/XtgKmdUQ13GAdxjeHQW2if/w0LlYxYmCODg74XAm7JJjiOtiZDI10fVn9Sx
	Mpg74NvtT7GfZl0Zz/NzcI6lbkF69YiX7ksa6wwbNrm5zPBV4FV2zTy6vDDKx8Is
	kNuatnzJfdpisXcGCDMoC18uC+7y3d9kT4S2IYwbVAnW5Xe0TWqowpok7mc9MNyv
	Hr8wwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x301jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:52:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50de6db1eabso20504601cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294325; x=1777899125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=;
        b=fI95fiJM6FHYtTDumNwgOunuJWQZGmJTeRcATfUnlJUF5HN/0nLd3XgkAJa9wHtJ2p
         WP9DcrFhvsFBo7PPOg9/ZhwnGHsvfHHvkLlOdR7mnv+/yT/84W1ErrDEJW4MafsBnkrz
         NYZzogx9IDvFXd9QN2+vJDuuiE8TI+/F4xRJ9hCKbN8EaJNrGIupN3fBPnoy6RErO3Sh
         ApuBkUvLS2OCCa2agQZuaKDxMIllrYZ4DBJuOgj/PGHgYGJPiNCf8pgmIgFCUW0ztR6u
         cLW/3ru/E3ijSpSje6JFmD7thbzrIqjL2K3ouHPgrf61vpIJvyQzwECEhmjMZysbCOHH
         eAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294325; x=1777899125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1t7Ar7nBvrSlYgzLnazs7rl5oHVGXn8P/AHYILE9m0=;
        b=j4b4/aqKKVdWoFq3X3rXPCBOxKk99I9++UNw1Q3xMzF4FeWx3EEqVwcOuOms60VO7l
         i/U4b9yxdsPTXlwW0Sssk0e8ILVgBWs2bNq2DIP5Cq7pUFvW46qcFMR+QT/DwzI7dfrd
         fvLasoyc3Y+KbKrmRpLZbrOkMLs/tqxHGIkOLr7jJrjRxN92IVBhRJcSdS1H1XJ43o0K
         U6xCLM56N0trTbjk2FFQPHy2oyDcyH+ZJfOyskoOuOXDaRCvU0pPyIBXUpqL/3cDbgr+
         vXcCRZj0bU+68uW/y/CDeIz4DCYeM7A1fEXMl34H4qxJtF2K49EQkvxqftW9KCTfdnVH
         bV+g==
X-Forwarded-Encrypted: i=1; AFNElJ8Tsy75Iq9qIg14L441w9sCXetG7Y5mxkVC8GkKcKGdSHmHYui8atnleyqZs0AWRTK5wYZYetRMUHq1@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIpbPIT+lIUJvHKlOZIrApVxY794DcWsQr60FRt5rONlpvRne
	JKOkyhLlqHea236/BgailxjcP+fCgjT9351mDDaM5sizy06PTxYZkd4PIg0hBoJlPQTl8SadXhm
	wkIj4CmlvjUj2rvg+L/poRmqSGMozSmF9g3yVME6usr/wd5Z3sm2QcjSraidE5JqF
X-Gm-Gg: AeBDietGl7X+ttmYuvhB73CuDM+70QlK3pFaf3DN7dDW4JDGDztSTx+GX2ZUqzurlbO
	xSemkFXsFKydKCKzB003X+PqK1BNn2803H06UqK0FRiLdLMaTD9DEchROaNqNtBX+/hvQ9pNzUJ
	RpT/UmYMFt6u5Vu18TUpfskJYarOcUFU0X4H6jdQwhI4u5J/r9+qdLBQQ0ed/NIuBX9Lm6pE0MZ
	fZyhYL5Ysg5DpTfVRFDBqTx5fv7TuY0TEr/NUslcnB2X8tuXjcC63iStc/X9GpcyP8DypamAM3W
	lbdDrsIcPx+L2/x6J2kBJE4Wv1thwcTfjQpLIZR62iIrW68FrDC89/RBnlTfd2v4puNjENn8LM7
	EmZ8kvs2Yxllg6TXvxw0W4xLi+mGCx9cAfnu/XFUq9bNgcFcEVuWe2rGJ1ZPYlkXsNRSn5g/2cY
	0MtX25uOa+rGjZgQ==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr304289851cf.8.1777294325525;
        Mon, 27 Apr 2026 05:52:05 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr304289411cf.8.1777294325007;
        Mon, 27 Apr 2026 05:52:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm1103157866b.3.2026.04.27.05.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:52:04 -0700 (PDT)
Message-ID: <6b016355-24fa-429f-8558-68581ab8e5ce@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:52:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio
 PD
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXwcvYy2vqPdVr
 WXb/5AAhycX4mSTz9lHDW+UZiRYezTOifUcHi2gnmpNn6td6DUiUgohxqQlc1OfA9kdPf2VKWhA
 7MZmhDgmcWsSja0cep2xbvHoNbkF683f2cNTCIGbZWI6/s1AESf53vBE1pbl90nhSsxgydY0s81
 dWPtY7WecAa8i3suCSbwN82qsVuoNXGEp6rZfF+xuw17GhuhV3L4vpRD8mUUCWpf0U5kOQDgcE5
 JbNgeRYg5FmLSBQ+HIvqnepGs5faCFFnJX6ml9PNFvFZJ/RMtME7/9vEZ3bDgd3nCrmSRhcsYu0
 Mq+ldCvK335nqvKeauydw3uobkd+h5/RRrLQ2e5rwSl1vzZO6tFsingHU0FOHqGe9Eu2c6MjDwK
 3dQeP66gihcaKO+1djc5CTu8+wz+sGf/AoUGr4qAuY3Bgo56eUIBuk/idggizOCoy1Ymm28TxAY
 G4WtVnbKBT7DcgvCfCQ==
X-Proofpoint-ORIG-GUID: g3yeYj1v0kTfnOe0mgXnnIfwqk-BlaUf
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef5bf6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X6ziXWecMEHV84DmvM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g3yeYj1v0kTfnOe0mgXnnIfwqk-BlaUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135

On 4/24/26 12:10 PM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
