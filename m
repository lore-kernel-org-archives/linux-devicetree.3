Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031910;
	b=eQ1mxZ9YhhBL34iauHr3o1xaNu9j9zIFU8f9hXQOr71g2bZXMJKRk81Vd/WSdDmqrIyQ
	 ybjv8iCNhqLGmVlu2SEbM9sGjE6VPBCCqmBFmt/b9V4JfYhEyl/62t/xQtk1uas7EswEs
	 HtKylA8YargbfLiYYx2K/OYqj/X8uHSL28yMVs4uzgcKgglJCpbiElgkZN1UqhQtZL2vE
	 avst2uoamr1zJEozdbAupdWhTx1YP4nhg1bfhF3iavi3mevjzecos644HpAdPd9X7KH0H
	 kL2ZX8fmUUw+K6JaY4grkilcj7VpY95TqYrRCyGFbkSK/YAI8zy/R/l5AhRItW47RZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
	b=euCHIaAWFYlQ3hyi+HeZCgJT07Zk7lunlhagN7F9G7p7sEpY554pyrYvR1lXIPIBtjGQ
	 a1+eEQHG3MSxF/UmjhRi446EmO1DaPeBHo42EAupNXnlDkVShx5pyQ4xoLk9VqQV7GgI+
	 /jjAXqFYx/vob5hbl2GcplBLFkqtdBkJvvL4THjBwQsynOacUngur+Kc4rSrnV6yTNKU/
	 //QValzVJrbRjg6mImbGer42QOUHmMdisCfnftrsXFwuB1nidVd52UxP8HvJE9LbTAFlR
	 D98XM+RWHmR6C5pqGhr5ZW0g4OSs+dsP1/erWpXxI4Q/QWXMFh90NbgU4Q1HNEw3dOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGepJCXo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJVDKHhK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5767606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5767606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGepJCXo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJVDKHhK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvj544098777
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=; b=iGepJCXooAiw+zc1
	Huemi/iNRPb3yDkHY3X9TfxGus1tyESpzHZ9wzaHLbF8VjhCdLqS0tV5eyUHUBHG
	sGhuTflT5O22/oVtmL6dYI3ajmO2PatgVp1LoE6kYhOc32E8avJdTDIZXgLr+f3N
	LVhUu0MVrVVXrWP2Bl3EOsUvHzs2Nerqw106MLqYh+V+opRizouOViRuni1/PQRR
	ebSI8bv+hwZS8pc/6ZgOIUSPkpfygAUkEw4LUCAUl7xrubBTqHr6qWJU/gVDbcaL
	ocTCxuV+TvgQQLfPGmDDRGH9dp0K55b/BmJqThrKCHMMvpm7TiZ+rJ6IIUUa4LiJ
	xHGLZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91gup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:25:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so433132385a.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031908; x=1793636708; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
        b=gJVDKHhKDJulQruzQKcgxqkklYg8gYbB9rfWKpMf9PwJ5brwpY1MQfonfGGVkxRUrp
         aRDmKUsidgtvgdlmb6wvs7siVrkoRufiCrrDBFFvtZeBu4Eljg7Hbx2I8wbvSOuszHA6
         /EUdMaBEXCZAJUdoxH65jwuNf2A25ym9hBeX+Eaz/E5frA8AGUBtIdUWcupim8/wuvl6
         Q9caP6OzWcoDU9aH80hercXVpXMOLM++i9yRXuITONKrVZq+DDvbOpRZoCLU0PPvJ6Vr
         TDg4kGwhzrG/vK/Vkfm1fnI8wm2qT/0YcZM6GYkSTCVHhc4WvXn4XkxcE4IDar7KECrO
         xo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031908; x=1793636708;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
        b=XXvLOy8rN4Yp+0pwob9iAxolQKPmH0X70EbEwrIchBm4lTQk8F/tItJQQ7Ot8T9sAt
         Yd+2i+OyyOqb2OZtH6CzMh7Dq87MAnxIi0zXVKOGJTqave7fg5KwCjWZBtGJ8MaSE9BY
         H06IAcJ1QVfmBh68rXmVmesRSF/dQPAJeKJQ7vch9EjstvWcevE4guxGkaEjH5UZdcZY
         FUwGYNji2RD3yErciSit9yIjlTNUfyS8tKQF2DzYthWXCC9jJ5dWWXdW9vtfcYmO/AW1
         rlCSZW4PCMJSTzpY6qpfL/CmvQD/j/lV5lnMxJrqQFhH3tIVojoHzkPRRhvnwtB9pT2O
         Tddg==
X-Forwarded-Encrypted: i=1; AKwUvBxeFL+CmqYYllUVpMlba3Fnpi0sQcizoPp9vuskSi3051UHEkTK6qh6gRgXCPmwtjEJIXqT25qcQ8v8@vger.kernel.org
X-Gm-Message-State: AFq9FYJmWm5o/OXw9+OVg8Yskvl0Ofle8SciTgwLAEuB7Vdj/W0QNa+n
	SEwhieJ/hBwpM03lzZKUZL9He2ojdrCE3wEK5/K6wW1Bq9ZkVrHQJdVpRB2qsNoia20Sc6tynk6
	B4jRK1Q2fefCQOyNRtrKcPuVYDDF8NBdpOyZCLfIo7RGIDAqoTvx+4zUIVb+RZ+2r
X-Gm-Gg: AYBFou2oeamONdmJO2NrJnHv47mqpWa/nrZdW1f9hNMI0PKykxc5x3soI1/Be2sbjd1
	877KeMRbbiQknbd+Qv8ZY5HwBNXgEh7UYGjn9y6CQlU2arMSyidmBjzgRFpzgdDAdruDQklb0z8
	LyjARFQhGLQX1pbRtpTH0oHW7bmt2TE2Blli1088aDRAqTYL2S5ZHOjWuGin/k8Bl/hEVHpO7MQ
	5ELdAq4Ox3dMfrwyGt/rJxPMcEARIqsV+A4butI80fNtfn/4wtOMYyt3km+tZnz5gsncCJkyDdC
	sSkgiqtrE1l+5wEUjxIf7dyPKeZwL5E/1PxIXVFs8P1lOxo2XlOMj8Pu/5XohyFpO7FhcC0uf1A
	c9bpbPt6Z9A==
X-Received: by 2002:a05:620a:4086:b0:93e:61ee:fb01 with SMTP id af79cd13be357-940ef8af1abmr821812385a.17.1793031907656;
        Mon, 26 Oct 2026 09:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:93e:61ee:fb01 with SMTP id af79cd13be357-940ef8af1abmr821808885a.17.1793031907073;
        Mon, 26 Oct 2026 09:25:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm241739015e9.1.2026.10.26.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:25:06 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Roger Shimizu <rosh@debian.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>
 <20261022085844.768508-1-m.szyprowski@samsung.com>
Date: Mon, 26 Oct 2026 18:25:02 +0200
Message-Id: <179303190208.155514.18251297146259001026.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=264;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kPpxmU275He2VmumH10/JAoMY0W3HC1wBCpLGc9ZLV4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq337gIxz7JCyBL3ZVRLAhjmmyigAMaeARtzehR
 y4lWFBKn+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9+4AAKCRAbX0TJAJUV
 VguxEACqjGDhayRa8hlel0+60V4P2s7dQv2KsV7ePiKPwahYlVhG/g3ncjSGqsD2dZ71gZ0dnec
 /jf6aGfFRio4VwfElakCy5m3b+UepLxFsYTWltNU+zYtjCw8NzyscGLEWj3ob1u6vdLGR7xZJ9b
 3nbsDT3PDMUuaGt8bfD+v10IFVHGvWa7Ull+Y7hSFwn7z75CITVaUrkyDQIvj2XRUz5X70VS3qi
 VoE6tAVUfO5a4i+IJSdI+PDbj5X84wU3/R+adhIbCH9Pylx2Dd1GPzVe9RFabpZia0jJdJrXCb1
 O1g/b2vDBnwNaEMHnjFu6H8qCrA756vnwB14anpPzVDg3ybE+Z4FPoy+f6zaMywFfJqudwp37sK
 7H3JbXMASP45zKYCUL2w60HRRcSnpKRhfna4UT43409XyOJ4HyGUPULlFmlFQHtUMHkJ2AAevTg
 F+9KDaFE3oNLEiyCgTX269scBZE4NbS9ti29Y/sugQjg4+AjgXeG904QhUWMkABTjOsaafPRv0+
 Et1JudUyCSsdjbA/twj8SmUsvAUOF/JPMw/gYszP3MRVZSEYdH+Mz8QNEdt9QZX0ESsLrTrceUl
 /kDQcpBvqvNj/qic/Q2V6P1UvzO+4LaAxkiyIONor1Xbv6kNnGJ8t6m0uq66u0NwlzKinbydhKq
 S65vUw/qis472XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX17pSJQeBm2n/
 EeNWD/XIKoW469BNuMoN4EmpS434/YTFt1ApkxNSfFJmIftlpb3a7Dh9gECeO23cGGe2g6VUlpw
 XbbsJqjF8pbzBm5HsYoxvNdrcjxCAFnXGj4YwAUWQkAkUZvJZ3E8KzR4vyclBzVLpqWNL9M1VS3
 UDolEHR/IwVQdoIvX4FKHAmxH8NrvrzLNO9ed7dTPDoXy5WpHaS2zGlrh0g5K6qzPm0uHJdQtwm
 ujGrcg/QqxyDayZytTVKm9sYcoQ6g8YL3vKXgUfey27XSXayYiRYl7uCtF6TQj8CanodlsA7g42
 7YWmE8dTSHiV/OQhMz9GZwOmCUQYtR9dRY2lGQR2GJah5ctOqXwmNB1ovfqSprOwYyvPOg3soob
 fKPw1vO7NF8rNYlubqTx8K+tx58UbB49BTeGNtAiFx6UtWJW3Oettn+jJTwSTk2m1G6q347SWpD
 jFOWZO/mXPILBR6PTBA==
X-Proofpoint-ORIG-GUID: TxKTeyYCSNcflqGxXv1aONFNdCyq_Rk_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX/Yu5wA8FtYfw
 l+mAvzFbTrryIm5dXvisw+3kXqhhauzkxy70NsUrFkdjagHdGQmqV1kSRsZ1IipdtbfHAL2d/mO
 BbPxXPkU+kFDdXwXo1OKt91wZ0TPqJU=
X-Proofpoint-GUID: TxKTeyYCSNcflqGxXv1aONFNdCyq_Rk_
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf7ee4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=HPxN8h9JYl6qewWKfvYA:9 a=QEXdDO2ut3YA:10
 a=VFjOIfaMTjYA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On Thu, 22 Oct 2026 10:58:43 +0200, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware memory reserved

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
