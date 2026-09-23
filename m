Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BF130C60D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161913; cv=none; b=hlCE+0aAO3CmSIP5DPOr+4AFTHcBDfR03Ye9HkV809h6BQSY/fLkmdaXnEn/mFkMHw5QYkqS/2NW1xdLAFOV0T7Po/seqQ4hr+5F7P3xiSkWPrdUTbUYbf9KxLd6Cj6aVP/KWMXiEw50ASweky5S6485WLax7TNHIgr2qtBjMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161913; c=relaxed/simple;
	bh=712VJTrhRjWyawggAv5BwpI1HWm8an6QzbFo1+kwTBw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AW8ZoP8ore0srmkY0BEzA1jty/gL2lnHxcJu0gqq6qt0LsGtQO1PFeCU/d5GLNGkdDk2QeQkrfZk4pbE4fTFi9fNbBJRgWvjAf/LXNRWpBYOWkB1EnAtyJTZRQT/GPqkdwqB7iDDF9FCgSajSt1ck3MVVyZZaiyX2dt+EboN0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgzqY+tG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWtNRIXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgzqY+tG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWtNRIXA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3fpj1623639
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=; b=CgzqY+tGCY02wBiJ
	fAPq0wU7ZPtaf8PRkgnGfuIzE4HuC/DURFIy+KyssTg2rE1v2bxGJ4prGDObXNth
	s5klDNXaDz+3IM1fUWnuBRMOCxrouhLyzPDP0mPubVrH7kPOMA8KONo9jJK4b/i0
	kewWmkVqQesML+1SxLWOIV2cvGS517ZemRC6wAm4781sS18a/RVaweZhtfymMBnX
	03Ri10tPyy8z/YJvUn+TwP0I3gyg8FKo9vARlbzcFO4BGBoIYVRWgQ5Ph+66/KUJ
	Spku3kQPWpVPRodz6sLEhrRKi4yPqR9Ogb0Q0qUnGpTPNUhjLj6TY5Y4p47YoLlC
	Xisv2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3jpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:11:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-334f782d1abso2723055eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161910; x=1790766710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=;
        b=BWtNRIXA3g35GcyvICY/XTJ2bzprjSKN6cz0hI/qaqkL8zZRTaPzwPGjLVYJUi3zUJ
         Te4HfhqBQfrn5ggXDG2vpZnhKDZt738/EiQl3C/3cjUiMc/m4C/rsPhAG9ge5xZQOg61
         HgRGPcWjKsG6ckv2JIq4DFGPdFQoxspbyxWQ8r5J/1Y16Bszk13ZW2a8O7qUpJcz7MId
         m74UbYUV8b02hFFB+8myE7IkixqWEB6xprhtVzz72bzsDQV21CbkOEQdCT+yVf6AHvGv
         ivBDTf8KTJZ/VRp4Xani+znlDRz2ZBX53ePimJuWFrXtExiULeq5R+2wZOWLZsLJHVie
         uk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161910; x=1790766710;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=;
        b=pX3j8UdqtzibOyjRXnQlvD+HUEl9BP4RP0fK+PvCdhESMayagSmw79myawxYys5Ze1
         Lexmns+6Ka+jffq42XiGgySyLgKiTKlU/k9R3x/tlXJ5oiXMs4zmTtKByhhq3xQgwox2
         6NAb603UuWBvdCxNkqbvbQf14PeDhLj1P9gXMyVX+VrGAv2ktxeUYQp+f5wb0jNzz5l4
         xu+C52ZFKbx2zddh94QHAfjv0q2TI039dM9s+8SOtdL12cyWYN5WZmUBkEH9AbgI4Tzl
         R8IWQsCdY55vZ0bqI5sxOn7ZeVpJ1u6BgxEi2Kxq67jV/GWMPJgA7AJNv4HBITH2eatw
         Ng0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7kR1jGlG/tGi7zR079vGDEGxWEaexs8fmBfVmtpReIytSKe4j7CHfMghjObO3pEAeovOBxj0mk/rw@vger.kernel.org
X-Gm-Message-State: AFuF++ksYYpnpqk9q9XixkBVBMQnvOt+C5u1MPOrtcwFn/h+P3XhOGoP
	OS2Tdvuw1UsW5t+id4tZyxGFHoo3cuHxB3m0SP+v1Qns3C2YSKtcY4ULzy/9A7bijx8J+40QOn0
	yqYQ3lS3UFypHPtm4GDmTvrQAz9TInpsyMrucFepAsENQsz7eHzrepbpl/n8f9Met
X-Gm-Gg: AYBFou1xN3CKhF9aitZA4mxMV276hrHUUBRif+1NXxk36A7RfIf4G062r4Bf9nQNDOp
	ZQT5y97WpUfGG/g4SDar/gLqrQiXsrJwu5EaAqShi7BNq5ZsR0Z2gOf5wQMbFguDxmu5FwpuzuU
	4WEK+4lRNdqiWAuBaz7t6R7Qc3w+WWRhouBHid9pjNGO7HlzOe4PY5BHxO2baY0HeVBvij2F+41
	zoBQEA91HqvY3Zs89fMKbSzbirpv34r1uCO5iwNpl6I1n/HJTAn26YxpR6htE59wf0y/yeqVlMj
	eG2gKBfomUWeuMu9uW9Nj5a+EmyjGg0QqCWA9FTuEWAui11D0W4sQ/UyaudjngO5yTIwyr2YpOI
	uU1vLozUMfueCYIGTLz1c10SSakM=
X-Received: by 2002:a05:7301:7bc4:b0:333:f2a3:5517 with SMTP id 5a478bee46e88-33e8d9cdb24mr3305866eec.26.1790161910324;
        Wed, 23 Sep 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:a05:7301:7bc4:b0:333:f2a3:5517 with SMTP id 5a478bee46e88-33e8d9cdb24mr3305840eec.26.1790161909758;
        Wed, 23 Sep 2026 04:11:49 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm5368121eec.30.2026.09.23.04.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:11:49 -0700 (PDT)
Message-ID: <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:41:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
 <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qrNyS0dGysVGy3DxvgIbz0QrbNa3Ngoh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXw0qKcpwLb+wZ
 3ucD3GXx2pJcif9kmqXZWdZgQ7uXoav7bhu2fbjlKsvPZPOLVbrz8bQhTwOI5WPtMSJQtKEWvPp
 nLsdGUiGDO+Ssh0Udkd/yyCvhNTx950=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXyHNXCiP2I85B
 ++YevgWtDmd9DO/CHVvU2U3CzZmYl04yhGApmOldr84VhIYUhcm/OByKdQW/TwZAMhZBhXJ/KK7
 HYW7t87PkpvVC6LybHaPyDlIS1AfT7G7jWVBZEBWKMP86seRXNXOSFRyWc+oRDeVynC7ac8V75p
 yi9P3HOARh/YsbN/hs0vrnQdlUZYC5c8c0+KNqkGmY7jfQgSvixzFdoqjgshAIrSFez19PiwybA
 rAGiVVrkqwnocUP/h9/3Zvi6M19EQVHBYhH1+Vsgf+I6O2HmBrjtFgZf6bxyMk28laeFkSItXTx
 vBATEqS5bqFNDFZbVGeeXgT3Y7rPVIHGk5V4X6aQi+NnzjhBZBG9PsWEbmqqoDUN9z7u+C55Di1
 xHr4qAOkHERzgP6EpV1dsnp89ooQC/FQvpq+QfZ3tHGfxri1Tp0B3xhrpgKjY6BHEWwpUIcOhoR
 LyS4NGlbT7YtQMh7xvg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b3f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NEAyEa2pAaJLIrQk-qUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: qrNyS0dGysVGy3DxvgIbz0QrbNa3Ngoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 14-09-2026 16:40, Wenmeng Liu wrote:
> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP 10-bit
> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
> exposes the standard controls (exposure, gain, vblank/hblank, test
> pattern).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/s5kjn5.c | 2861 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 2874 insertions(+)
Hi Wenmeng,

This series fails to build against linux-next(20260922) after:

7eef49c16461 ("media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops")

s5kjn5_set_fmt() and s5kjn5_get_selection() need to be updated to
include the new 'const struct v4l2_subdev_client_info *ci' parameter.

---
Regards,
Nihal Kumar Gupta
