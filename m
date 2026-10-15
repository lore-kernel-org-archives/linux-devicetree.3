Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB349DBB1
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048532; cv=none; b=o33oHgyGJUElp2ZAiS93i2jSTKNC0OxReSNBB/XYmjFM17zKwK7vz53fB/scBoPLzP2ISBqJV4+vbQ23mnFaXSPUdwmrFxCtMbwoYPbzgryTADUdkLUsapSDGW+W9mVOyXoy1F8G+4Iklgt2U82E4HMpWYSqtN/cVt+tCiFJYUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048532; c=relaxed/simple;
	bh=2E4LX2gi3ec2r3gAAOo7B3XAFZpCRr918/PUAS/EG/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MgXq40Z1fydgyoKYIWjAoI+a7skTuuWzuE7eoBaC/3yjfwuFWaGDfTFiB92ufZJzSpwBtkyUOcXSG1TE6/B4jql/OXHdDEK0MyJSybglmLOI1OJGy9saWlOLJTcWE2ClPim0V8AOUxmpVKXoqtvtl0pkmo3/6dxG40Vy+1i+tOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfjN3JfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhJgcnFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfjN3JfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhJgcnFT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F60Anw644564
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPl
	OQVWcOZ8=; b=MfjN3JfK73PEQGvN5hZP1ngb5CVdSK+hayCRlmpeSsskoMgE7jp
	7OgXKQBS8jqU9hstk2wWAFEBB+uw4o4psGsW2dhQdbHi5eugcXXnMUozZtLNa28T
	Ne1FjzJ8l0UIq6CKqfIBsKXdiN5xZaAeqES7PYPsXC42kpYRm6QFhh8Moz/UAihG
	LFcj4F1mj9zfw8RE1CCmeXE65TPVKnVkXIep5T0/dzJ2q2CiGDTp6c5TaZWhz5WK
	mZBG/NNUsRiWp9KqTNdNqQeWRJktD4KXMtb+k0oW4nF9WzyYApttq0N6h+rEtcrd
	0CbQCKTIoH1l8db8+N8OcHtU9YmVCqZiEnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9nt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:15:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6006729a91.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048520; x=1792653320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=bhJgcnFTdAQYDErzh8XQANklJO7ckPFDyOhhh40bp0vRYS/WpziY/Csja7fPcACVQ0
         fvkzmy9RraNdIAgig9YR3DvIpQuYcCPY404lqlM4/qT4wXRX5c68FJEJRq9w66igk5wo
         5oifWbZUc1Qx2j8nkeGVpN3xWs7RRUKml5hv7mpvuEKvFTzlL9wy1/WJOv8S1SY+j3cT
         DdM0T2REPy9zjGvcGXk5J2JmFx3ke7xVoQeRgRmuNNU4+18EBjj1fVP8swbOJSMt+N9n
         8y7uOQga/WaDM2cuLwDm3c8YTKMOfTHFJmvL1UOeYBfWh32HX/vrwwL3DMEKnOZHz3WR
         1AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048520; x=1792653320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=YMWUYeFvl7i7lr2wirTf0h6zJ4QKKoGZaM3A9uyLe9EyXakd8EkpP8hEAXk4AeRVsD
         FxMEf5Bb2Ar1QI1STiW64N8zEpb9PGqHdgR50gJoQmgYIDMNew3BPLVvJDV/at04SjGS
         K61d/FyqH+2EXD7o4qmnyBXagdjYgQbDge2hMJ/ZjgLeHIMeUIeOEnwyIcNWmjs+Abs1
         M+cKFZvwZcVfbp1/fTzUBmiFFC53qyHzhTqR/rwGHmwbcGuVUibCcrAGfKsAO7mtfJuk
         uDpWTU86Hmg3CAI+MJ7RMWSrfYYAYz/OADG/d0GciY3wH0yDhjhJHGbcVWL9SkFbpNo+
         ZA2w==
X-Forwarded-Encrypted: i=1; AKwUvBy0+NhFKqZNEaHz5BRHua3LyN47x868QCxXSCedCvFzvTqulXdmAu8JO8w8iFDxNcl1SrWRVZ8ZMAYW@vger.kernel.org
X-Gm-Message-State: AFq9FYK047aoPoOD604qito53qCMWf5d75krJR72FUtsys8oBVDOOGL2
	Hl+Zdie33ipUO277R/0JcGOCcNQyCVh1bJ6t+IqApwFVBN67slbPwEF4I5GGba+xy/eEty2ByZU
	TdHRbKvh1uatG+5zKFZ8U8pAJnuOalHMU++7gJj9nv07qQysZN0JjQtOlMNfjaVNg
X-Gm-Gg: AYBFou2AUBR8yeaeowFFNTfbKNYJpQTvHtxrwvVgEF+UIdyUn8HkxzMQNxLPCm9wM5h
	HcRG0a5G/xTpmV+PEbaeNuE6ta0g/ag1qXRWS1rNmrITi6Yn9jW0uECCjysKM8KIeinYxniyDf1
	9l+qCmlRonPpr35C8hk/BLAeRsXCjgd/Rf1DgNQDelGPfo36kqj0zmEarDYN8vy33g1gmyPNQlR
	KSavWc5yVaIiJcD+zRlxA9wDKOCFVsNeyhz0dIZK9yF3v03ysOuv1DQ1QsKWNOC/jyurn22HTgb
	tkPIzdQNH/6lLTsP3J9ckOjJ4tgrqnFq9bFNCZ+zBjQ1MrMhBQgcbaGR0fg5NRYxcClkXXWYfxj
	nTnMRQ/R02jIzBaDgQi49vDNMVOYppPEwLk18BtRhtaKgely1+UhP94cYgIp25no9mtcvZC8E
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600581a91.33.1792048519826;
        Thu, 15 Oct 2026 00:15:19 -0700 (PDT)
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600546a91.33.1792048518648;
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 0/4] arm64: dts: qcom: Make ADSP remote heaps no-map
Date: Thu, 15 Oct 2026 15:15:07 +0800
Message-Id: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -bQNL8FISCJQJdEikUQKyB9BOVIIf_JO
X-Proofpoint-ORIG-GUID: -bQNL8FISCJQJdEikUQKyB9BOVIIf_JO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX1g+IZhO6TFdB
 coOPOh0mLXMBUZ2/nhCUcjutQCiXk31se2WSpURkJmA2uGyxJ4HVK3r4UajJ5HcJl8PLaFGEtH2
 z2I0VvX5MqSpq6WkroEFJWVemXhOBVc=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad07d88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OBlduepgtoGKHnf9jnsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXxRI2WTXY1TFd
 SpOD5NtJNAujxWxBHgymmIS8xBysooXSh6DbNOYwzb6YDJRvZmd9is3v81aDYsIalSFj1R2g8aX
 eFBm6EEuviZnvtYOcpEOS2wJlXb26CzrJ2H4XBBFRjdhyJ0BkjJq5kPh3boxkzBqcvZ0ohluc1H
 nTo6kOzE1dpkk3vI4oMNU55gnajw8UIbWTE2b5kBQnieJSll/YDUlt+yO442QvfKMz0QmAJcs5U
 11zz+mufBpyEHTHISw6bMKqJxwAxZPwZ5Hsx142mViSVW686UJlMkm63zSWi682xe/zKNbjqgtw
 Q0xWxGy+FLgAsI+C6dBO10ftQmW3P245nj2n3hkH1eafB/bmf+SWHKTqvKntAEoPkV5azkFItGq
 BWtiufiEiEj1Dw45GpGv4wa1uMPvR+7ruA9E9eoKFYZa0OoYXmCe8EsoY7lRWW1eteYfP7/7Lou
 oy85JPSSXl63+Dd0rOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

Several Qualcomm platforms declare the ADSP remote heap as a reusable
shared DMA pool. This allows the kernel to reuse the region for movable
allocations.

When FastRPC assigns the entire region to the DSP without first
allocating its pages from CMA, those pages remain available for HLOS
allocations despite HLOS access permissions having been revoked.
Subsequent kernel accesses can therefore cause synchronous external
aborts.

This issue has been reported on Talos during GPU stress testing and on
Kodiak during storage testing. A further report on a Kodiak-based
Motorola Edge 30 describes similar aborts during everyday use and
indicates that marking the heap no-map resolves the issue.

Following feedback on the Talos patch, this series updates the remaining
identified reusable ADSP remote heaps on Kodiak, Glymur, SM8250 and
SM8750. Each platform is handled in a separate patch to allow independent
review and backporting.

Replace reusable with no-map to prevent normal kernel allocations from
using these regions and exclude them from the kernel's standard memory
mapping. The existing allocation ranges, alignment and sizes are
unchanged.

The Talos fix was submitted separately [1]. Agatti is also excluded
because a separate fix has already been posted [2].

[1] https://lore.kernel.org/all/20261014083820.468-1-jianping.li@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261001085247.1897991-1-benjamin@wendy.sh/

Jianping Li (4):
  arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
  arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

