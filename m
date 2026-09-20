Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D933986F
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890906; cv=none; b=P9PvW33YI3hSw3UsfeZflGQQKcORb2mkxNLXF9Uj6GJMbQwGGzVjUsiwBzsY0RGmiwyLvlVoCqmmgfK8RXXH7R5pC2cDycmgidDsyjznKIf+kMzQBfA45Jew8bEdHfQDG1YrfBpww92LCOe43g5D4Tw0ODEnno2NvmO9uzTsPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890906; c=relaxed/simple;
	bh=6aMwnDLODsh83cPCbbnt4oDou50vnwnLF5ymrWCvs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdNcq8GyO8pbNyMgbDQ9RTeN11CedKjYS3VVsiWuNmgsoE1YP4LBxlhkq9g4P1jy6bwyuKUXVHHZPMe2ZGUinhjog7xpnGLXBQONZgLrLKyryNqJ1rU6olDmWA26+HvNfoxeWTqGNrUdgHh0XGylkIoExGMPe/7iaZhMv+JvzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9mKPkZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEGxKn6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9mKPkZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEGxKn6R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54u7h1609182
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=; b=V9mKPkZmvG9/i3vr
	926vOaJHcCno21Mf15/CDocoQTFMArdwZ53MKOdd75YRWJIy2A77d0pBLiCxyQvj
	9lRqEI5PX6+eSobdclwfK92eLK+/zL6L+bLVAWhpJ1PebZJxQlHy0ESbL4Azqeij
	G+axa8WhZb+g0wwBxUqJaVTQCUy8F6+N/E5Sq46GlXEtRng1o5ISFZ+Q8clcSqFi
	2/XrsV+e6ZhJGGzkomROJiIe2j2Os0dDytB0VsUvfw9O5+6IvweMO/Gms/oI/k1R
	RmDDqyddivelCy0qA1atrgzu6bg6riA85QU7XRDuTlj413JfyO2hMaNngKHiQlUs
	v5lCnA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32hdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:55:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so37126405ad.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789890904; x=1790495704; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=XEGxKn6RQaE3J0dPvklvhQ5u5HfPqyXF2I5lTWcvI9dtq1K1mkgyWrbFA5SCSpyWJE
         dX423MnMgXkcG2FBtXrR3dMhZGLaXsGoW/nUMD9SEGKOmPRxrY+x1uCPYbW0h/ZPsXPi
         u8N7IpI1SS6ZaKJlfqmcSKXZgsKf3g0ckMMicF80frMhZ72VqhLcx/vCdXurb2gAhYdG
         s9tGGbdwrmrz1CRRPmk9xN9VgZ0KrZBOb394XSsOx9Eai4UPpwvPyVqSo0EY5ym3+gJX
         fMoK7962DPi49k188bnauEXnFm8Hu9QTKX0bASl7TQ0HvhQ0+fBAfvSHFOpTnKTvqm7/
         xY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890904; x=1790495704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=217kSbt6/w/3UyPBAiYH4Fc83uGJsJQQDk482fPrQBDZp9hOfMZ8obQnSJkpiTm23P
         b2S3MnPwHfg9ZUGY+J8Zhjgj8BPvTDC55wdQmkYgdTv1B+tNd8/sa7P3j9df9ZxynO+E
         4fMr2lXgd1vlqeK1JdiPPyZlp8plep0wVIf8Bkiunncp9UAfWezcjkoD6+PK3K6uS4Vy
         8kFXLK2RTr2V8u+ZqWgNqCQNj/SMS0K2QbXBHBlGGfGhbJO/swsX1Kw78O9rrfyIjzxb
         D7HyUO7JOnwA0UFdu2xk/0A25nFfte8DZ0b6KVPidNJqEgZ+rZsu+8jeEeDZsCVvk64e
         mg7A==
X-Forwarded-Encrypted: i=1; AKwUvBwy9AOuQiWglGhxzUYGLgYIxwNN02lbf2uBleANaIB3pNOihMywdZ+okwtdULmxKpkxIp/yp1N/1W7T@vger.kernel.org
X-Gm-Message-State: AFuF++mZxJPZaCBIZi4SiYHJb0nOt1ZdZ/0+5siGNw95IB7JS9f9JCRO
	HMqQEe03pnbwWECa79tWfx0rZMxLSSMrsmwwRchutDDrtr2uqT6p5rnEjdpo308fqHf7pUkqBkk
	TWMgVWVVUTz1ykiO44PHJ7b4qShh84mG+SR/nQpRK8yTvuXOdlnsVVhFghMU4+3ID
X-Gm-Gg: AYBFou2TpI6AxAwWHzpNzDA/+6Z4bBQq29Alurm8uphed9/XI3+iS3lyxFDybsSoApb
	tjpx2/6KEY84k9F0CojX1EU5srbIJxnvgOIzHLAl2Q/+MJFMEiTASx94oMFgqctnU78Cd51LW9K
	orWWvgVb+6KNa7AdQAEzCtIEWzXajeDD9dQmvCAvhoTlLj+oNmGwmFGK40EDH5FAZG5Y912h/5J
	TyPa/+EHl+w1JRamTb5wOb51wwFQdHLt4j7++ZFwOjEae0t+lCKO+f8Ej4RN4tI2yP0Q7fTg6Cq
	6NlAEkXQWySWmh5j0Ukn+vRu/4d45xzUARnZV1zCwBIV1BsqDB0XoPLJ8zpyvnGpge8Pf5pk3J7
	AWdekF2ApvJ2jnppdr103aFNrfNc=
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931285ad.62.1789890904387;
        Sun, 20 Sep 2026 00:55:04 -0700 (PDT)
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931085ad.62.1789890903897;
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331b0d6esm9198574eec.27.2026.09.20.00.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Date: Sun, 20 Sep 2026 13:24:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
Message-ID: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3RtXIWsgJYakkWWzrwWM3IIOjvaZXERb
X-Proofpoint-GUID: 3RtXIWsgJYakkWWzrwWM3IIOjvaZXERb
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf9159 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WbCkzZcx2JvGogR84Y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX+hmspOWUHxJ4
 dIOMijJl1+Xy+Z2QMMg/XW7t1KHLquhsqgGdImrriE9AzupahvzQ/CFD3cHONkpmcvwdjwKIAil
 D7/NQwbM2WONK4UpYaUGfhg0PF2YzftOqIik8MwYAmtVpRmxCB/ZjCXDMuWh2Bp8euRZ+pacsek
 P153EX30wBhGq909hvjBaMyU+pgEmICnwxGQ0uB2fJ8y2xSvr3gf9zR5BIYkXzgvw76Jf1gI4TI
 qnC4piKVYplA9bC5rM+Hfm+//RTWPAjIIIfDI1bHrYpUFHUV2n8MBpdhUCz51+w2vsKxzvIlr+W
 Is9wH4c+q8DOvCVoeVFQthEz7Mh1hX9ss7Wtk3zZ+/sUmwpFfEFJFhc6twnGURWc8buMOowPGNC
 DQAv7qWyP/VstY6IS8KCg/yoDH/jTLnctIJnSAOnoThpamQX4MPWk4DZGKFlujQiYRq8rCt5YEd
 cwkewYtijNFMmrJIYSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX8vEJ8DGTKO1y
 p51UaFgAy9zbC872OqxaZUh7ScHoHIcyXI701soReyVF9nUiyEaU350SaRmneCeSW3DYKjwnKsZ
 4e3dcScaDbWopIO2bm31W2HQvesP4mU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200113

On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
> > The reserved region wlan_ce_mem is device memory used by the WCN6750
> > firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
> > erroneous — the region must remain present regardless of whether the
> > underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
> > both board files.
> 
> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
> matter, no?

This region is used by the WLAN driver when Linux is at EL2, and similar to
Kodiak Chrome, Kodiak IOT also needs to use it.

-- 
-Mukesh Ojha
