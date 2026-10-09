Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279CA483BC6
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541719; cv=none; b=qEXYllTh31ECgFsVMG/GIhTfcWgJsP/ZgabLwAp11zC6Z90R8BI3cvyxvrEKITBnClnOwXzhsqbC1bsBf122aIox3KHxPY/xD8rw9twiJ1pXXUsp5hT0I8tT5PI67JWmanUVpTKgR2dN8ERZFfBwv6q7cfMcpcUa+MwhWHSlqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541719; c=relaxed/simple;
	bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zhja46iPDFzxH6SxCdQhvJMfDMlUaKQIbLP1x1AAynDIoingX7pnhnOaiL9WGh+E2zJuC/f4cotoSm6Rre+K26yw66Ig38y8Ab23HmHOnqvNLXpersOMLi5fw7AOiYvhHTrsN9dEfMpPBwfHyGkF8QuTwufb0WQdhf6YUJxJS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGQkYIQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asbGsprF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGQkYIQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asbGsprF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KBbp2256978
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=; b=OGQkYIQQ4RvfM+Ap
	IJlSx7rqsMpEPPnw5aSWZpJ5i8aY72mZpAN3V60qPKBdauN2p+oLnmUAFl7gzeaZ
	s5ppFAIMmqzBGtRLXUqWU3f4f6/ZdA8DZQxvwvNXPCmMAuZsWqy4T/QExt80chBI
	LYNQS05udZAEds7J+bAe/XtGPHB0LD5qbc+LNgdeWAepI5m3QsUfyqINmT/clUYQ
	UjZ2yzj56ZOjh5tNMiAU0lvvHw3qsNbOUPWGGeRtBzSYHZEG+NeAcwk/GU3a2nok
	2xC4E5pB5chtds/3RjP1ItTF6IaDzO/KUvNfNAyx89GOK3+eN8HT7n3eKyCDl0VA
	Z4Z2HQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufswmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso7592370eec.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541715; x=1792146515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=asbGsprFNdx00hJeolzwWOh5++cy4cEngbNrzF27Sczalyc9YRbdqY8vd5hbzXp3iL
         h9XCwhz/BR6v+NqOBePe4+w+RqGr55/sxbPHCHQVKoUxRScPzICSj4rWfe2Fu2aPGDkB
         8FnnGd8CO5qErlVLl5VQ5uvxmSbRSJH5gHq330bw5MP6zhuUonUZMlORjykkFOM1GYs7
         momGOLItol8MZsd45AKWMuas3pw8LhT+jIJvVl1HNTZfZCTF4fkwATjzAivXArO2a1kD
         FiP1AZgUYb4u9fy1hc7hGgzTrBv7J2/f/MzpzpnPTvXDB077mhdec+njRs6MavkT1wlD
         cksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541715; x=1792146515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=OpKxt04ZOYFq93xJP09HWhJot8nFn3seDS2IcMLggMYZr20kXz5x+fMyfWnhTfpJSV
         F1NXy/ERRdzOMDSm+0s9DFnp11LTafwVqQWPDQPch8WDNUfd1Z7dTyJBEC8Xq7zAq8x7
         sg0yNdOdo8VWTukYhF7+sma9fb2aojDrsaklsFZLTY8lMRhxZxr2B0gDC5Esdd/mqCOR
         a2JUwNg1eta0lCMzoVNz3go4gD0kxg5oSjTkSqA0dgxIByQ0dTWwxqdkuT/HHLArstQh
         AL7gSJbflMoOKRbp639QXAkg5PyaWh769tXSWSeG5FpjvhxxL1FCkK9HT/K4d1QTrEvx
         bdBA==
X-Forwarded-Encrypted: i=1; AKwUvBwDINQWYZH+kCsUNE/qYUtxL2In6kuODgcfxzP2s7JFjBui+6tmEf3iKOAS0Ug8prkrXOzmglV5quOt@vger.kernel.org
X-Gm-Message-State: AFuF++nUprp6Lfv9gXrfpWhiXZ0nyO9hNQeQEmH4TFVD/Y45IZlG7Xzk
	B5oq3KVaeorRGSB/o5YIxeYTF6xC9cKrrsfPOHn/6gW0OOVXHuDXlKUc0NdFDIV3kAtt4YvdGbP
	4rq40qLKMWyBJAQPcDMSQeuRhh4OXLqxWmQPOoIA1OdtVX1dgwz5iKm/mrsPvOj7r
X-Gm-Gg: AYBFou0uEefoevSD1dVgV9GwJz7AdwSms6oYSt4RhqQcZ3tso5URx2o74RnJPke9vOK
	Gsf3Ea1u4ixqihPa2wUZ0u6qKtSdsFc6QnNuLHa0ovmtw+tooxjRqvBB1AfzmxbiIim07zJCtWh
	6ZccPLWhOQknPHIELMzPEsKpuO7YLW0IN0hFd4G9Lqwowjuimtq268AqBtVZpn3WBG2+eImRy7g
	2uQoIK73WMT5EmOa6GcDzw+7SiaWW+fQMTLowKSLw+F4WCPEWCCorgw0P/8qIAyMBItWfmWjE2k
	YMygwy4R1+DgPOVSJct1+7ZrNchwIOioP07R5f57t91ubs8vNbGqrpdsXEFo67iPJ/T1KpPpIby
	DA1Pl8pFr98AEVYw3x8hxvgjt83IUhyteGA==
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160617c88.4.1791541714521;
        Fri, 09 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160580c88.4.1791541713961;
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm7713134c88.9.2026.10.09.03.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Message-ID: <1db319c6-eb4e-4821-85ae-f8ea5e41d28f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:58:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add
 Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
 <20261009-subtle-tricky-locust-b09108@quoll>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <20261009-subtle-tricky-locust-b09108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8c1d3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=n8cVz6FT7eV6zO6OkoAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfXzeKFX7mZ/Js7
 0VVbSn5Nn1sgl8kFVlC+bqJZMheAB8DC1BjmwonXnRc8e45Ryf+QGI4ETOf7m0WQDU7fSzXOSBe
 S5oIThft7Ca66Me1DZ7Mk/2BwLvTRXQ=
X-Proofpoint-GUID: ZjOx_R8HvoQShaheZUtZdIx6VBeHFVfv
X-Proofpoint-ORIG-GUID: ZjOx_R8HvoQShaheZUtZdIx6VBeHFVfv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX0E/xVaHptmL8
 839Y2pnlKkY3RvkxXCAqLezGMc7SH5jUrwozcUetzT7fQkOv20R2QtzF8ygqsq0geQnY8arnIc2
 l3K+rbidcv9D3yhY742pGL7Hff+EqnbjeBwsct6M7LsDdiQCpaAgX5PV78A0geITMWq2QoC4SLH
 2Y+lbdLynh5Tv9iAOl5Hl44yd4LjZf71D/l3fMi5rchYilCwD9BsvKAvicoDQMqZrqG/rymu2Z3
 X/ahyUODFzLdmbYUiXDwl+U/baQSchssThQ21i+NcVYZ+WDM9ZY5zbiHHPV+81vKUKjNKpf335T
 sBTo4LxNpUSgAseKc6szRRpVJrxSU5PVGL/R0fhGZscOXmP7OXGNmvHoYkPyqCOSZ8UWc8FbGLe
 neVeb/KkAQdhjvTnqQYHUtvJWAuXdw0pEXrmaa0VqIxJTwUZcJeGUurEJgHcSRvmsBqMHT+7447
 sxo1Q7ED5GLVniVi8WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041


On 09-10-2026 01:01 pm, Krzysztof Kozlowski wrote:
> On Mon, Oct 05, 2026 at 12:54:26PM +0530, Balaji Kalkonda wrote:
>> Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
>> fully compatible with earlier SM8650 variant.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
> Dropping, unanswered comments.

Hi krzysztof,

I will address the sashiko bot comments, and it will be part of v2 patchset.

Thanks and regards,

Balaji.

>
> Best regards,
> Krzysztof
