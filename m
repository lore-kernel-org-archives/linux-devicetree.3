Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B733E1704
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389736; cv=none; b=LLavtWUWxuzOL+TsuvcqptMY91/jDJf9p96Z5Bt9I38BbpLszJxHQQOBOqm4Hcb5+g/xQI6150No3SQbHX0hSAjy+03PEKM3m2PqmVbvnA+afLkBkWvhf9K4j6XCgRUZ5gEfa9raYecQB7BWB3dg6awWJtMDeLHFpN4Mn6Y6Wnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389736; c=relaxed/simple;
	bh=jNUUgutEMGVU/laTDo9JXbIf3xhGR/VCZHEiY6C7ios=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyrCtyczbLcbVqDuK4TYc/HiKd1VmYoYUbCmpVpNLRNR1TLWoWX9PlYOCOgP3OkZjYt1Duzlsk12ap67mKHYYk6HPKrSrtpvajtLQNENn0ZvclWHCeFfqMRgNdgo5ilesd7xlgnlxR8S08NTwhl2b3r6xzzfdPUPWm5v6oQUvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxBlgpy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxjGeJHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxBlgpy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxjGeJHN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsPh1454393
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=; b=fxBlgpy4gt6KeW0e
	XYxNkhYa8uZ42aGP8C4DFNF1+gRZhDIsi5R/Z7u06rs813fVxn7gzEgly7N2MzrB
	2ZaJfK16b1tYVbq+xHdTY+dAMuM/ZVKNnKvMBrx3cDJcYlGPTzMGBDHs6EpnAUt3
	JYSMPqOwmVHFCwHa/NOUxBvYzmoolRcMD1/KoRv4c7jcJ9wd5SlqabnOb99gUkFi
	lHBAKa283EosQbpE7Ry4DzPKL4pdn34eSruVpV2A+C9aq59nTe811roqIvftlwsq
	Q9i+47oQddQf2fLfuM9yk+MQznSLFCCM3VcvUZhXQ5SbpAdoebfL/WndXdv1i2me
	kYZ0TA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbujc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:15:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156dc90fdaso41037485a.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389734; x=1782994534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=;
        b=DxjGeJHNU75P+w3XWvooVUYrgsdGGg3qdqUwE/IV5k7gRDEaZV57JLsUxX11NfTVVt
         lwkeq4EupX5K5IN53IVdVbAMb0HBtnoXWPJh/VFfOsmiah+phBvYifhI5GMKtr3kVUuk
         SpVmu2GdDG2OX3+JdQBOVCRk/4cgIby3xow5u1qcSBw8mOaEkGdiIlotOV2DR66k49om
         72epaWTcphJwC6fmWvFUEvx+erXqOZM84Ht3HCt5VXahNjcsUWzU+WqnFaZk7MaYqCLY
         QkvodFle67/FRQsSSxtvJBW3wOy3Hlze5moxUB2f4UjvZk8FCetj5Rkxq5C4q4TqPrS1
         mSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389734; x=1782994534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=;
        b=VDxObbzF7l2REpRDlUiMCbr9+aL6QqQv7K7zYbwgHvR+AZi0pofLwugp8O6O1Ta4X1
         sPmY/K6eAxf4Jq8aMnmgFsSMeDKgKdspbFo6+ZwzlDcVzhxw7uloj8T0kCEeY9Y8jR9v
         tg6nrj9hczZ/LO5PKn0nYT6LYQy6z8CpcYSenfxaC6J33LVlekGLc9Jj3P0gtQ4ESFDs
         hkMW6j/lBZt0b0I9kISmEeX1sFe+DH56Nwad1UffRklBJsJ/atAaCS8EKgWWA/Pk/Fb2
         2AIY0WaDpMu4Em1pTxJdG5sgQVGIzy1cHA+IRop6a1Xoe5X56u9cdNA9GDCm9uoki1lw
         DEog==
X-Forwarded-Encrypted: i=1; AFNElJ8wsqJay0DsTg0+ObUmXpsMsih3Lo3roYJWyABy3gDkVQVUU3i/PIzqCOEFfxJgQZzH2lHVIJiFN7RC@vger.kernel.org
X-Gm-Message-State: AOJu0YzH6j5z1WRlqcdPz78EXgjvWQS5pn8LiaTdknBy8xzP82JEeedY
	x9a3bAdBQK6ETCFq0npiDJJ6laj+EwY4O0wtAQ39cCyIyf1BgZwmwccvPEEjkbR7ie5Y3c5VPZf
	RGWHs8XQbcXCRWbDxzqKCwjMXYIEx8Ans5XJfOMbDIJwf5W0DGXc9eCtKPaZ2729d
X-Gm-Gg: AfdE7cmVlnVTZnZGWSnI8OfabO51MfzQXra4Uj7z9fER2US0y1bbgk6rsdrJbTNNvhW
	jUDTZlRzZAqL2jwGAUrBSiLWIEnHghAobRgd6Xm5WCHzLFyLLq6bFE9yFMck546g/eBjsMFtd7p
	KSJrw0vFMizYc+422NzRWgiZ2zyx5GuUbOdVI+TjNzz7lom+nixTEYIiJ1AyI+BH4BIqzuTcEha
	U3JEAEJcbsJLQwJvc3aw/QxHUlC1+kUMz6xmBWVOSEG4So+mD2h2tNW+4zz18yGv5tJOl9SPfCI
	J8mPcJrzQp4Q1B+vzAmMHEi2+1ORch1rB595A922KKk2Se8MdP2ObEKxPHptqctk84wXITy1Ex2
	xZ1LVeWL9j6JPnqhijbJGCmhKwxQ4jcKXX14=
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr200142985a.1.1782389733707;
        Thu, 25 Jun 2026 05:15:33 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr200132785a.1.1782389733119;
        Thu, 25 Jun 2026 05:15:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe0742fsm167225366b.34.2026.06.25.05.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:15:32 -0700 (PDT)
Message-ID: <f30f09ee-a474-4173-a05b-0acd32c16927@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:15:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250: Add cam_mclk3_default
 pinctrl
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
 <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX4Ir0xNeyZTfT
 utTBnOEePNzCarZ5XswmzP8YccnfMLSt0Clg4oETmnk5TvDcBsypcRx5Ix26ycULeLdOTQjMBvj
 Y7O0nVRcCIm8Rq9fm6FtUx8Mf6SH0FA=
X-Proofpoint-ORIG-GUID: oJ8irU_3R2nvbJKRdd9UJ6dxM_bNMHtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfXyYABXscyrB3f
 WiaBzXfZfvxBPyyNb2QUWBxp0hB3og5xptz6jgZhrloXZivrQZVDD0HTF1Oj58tsKsZqP+ywGDo
 i8hErS5lIeqNE2Y9wVNEskj/2eU8DKscXXK6nVNwHQaX+TzRa5ngMQaWzANs6Ikov7IXgHy9ouj
 j72m6745M15DNhX4ZshQf0YNRyhwGXt8kjvMxIEkYvxrX5Ygs49adrKcmL+OYsO5Et00UWfyXn2
 KOqat3+LPmoK6Dnh5d57wt9/TqHb6AL2s1Y9iVfqDrqME8c4qpVbjLqzVJ1xZOdgL6nV+e3QvuP
 cSf0k20fLINAlqrS4/R3sh98vhqcRqg61Ys5nbifZ3GdcXbwdNRc4UV3OKLi5Y7nDgnVwD3YWpP
 90TpARrJblGw6dZ9kM2jjaPlFvKM1wyeGcnaiqQQN3600B5OzS16IOFwSQp6rIdUUKZ0PjsrWly
 7JyPS+51CR+XCtG4Szw==
X-Proofpoint-GUID: oJ8irU_3R2nvbJKRdd9UJ6dxM_bNMHtK
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d1be6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dZbOZ2KzAAAA:8 a=EUspDBNiAAAA:8 a=fD-KZaBPAyyIcL3pXmkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250105

On 6/25/26 2:05 PM, Xin Xu wrote:
> Add a default pin configuration for CAM_MCLK3 (GPIO97), which is used
> as a master clock for camera sensors on SM8250 boards.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
