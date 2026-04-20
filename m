Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063D37FF7B
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657131; cv=none; b=Qxv3cIs4SGRepi2RzGi4QBUMc+DzRoLI+d6Zd56iV4dpPskmi3eSA8dAsqCHd8mbuyGC4LLiORcLW8YP9mwZKtRLLq1G6v6l83LHikZ0FQDtebGE5VTb/BzQcFH+JAgUOAnq0mSJN79EEsHoFnLACtI7uE2DHFBmSjkLayWWmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657131; c=relaxed/simple;
	bh=LjHpXILgSSxYdRyxuGdqsJT7SAwCxmBr+4K4Jx8gHpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbsKRekokRZH/H8C0ZR6d+XT3DclRhrZvjHMpF8bKgEGHOhS/kP+cUbdaPH508bO9beVOEhvWVAb3rQyExycpgYCv8D+vD7YtxWXp+0gKsBppVOHDiAoxNt8dpL9lRteSP4XaWZpzBDkT8TIy2K14EuV3xdiNkTSN98V1fQrgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h22wBTbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvpZhheu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h22wBTbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvpZhheu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JL1LWm2084743
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfB
	QCJ38fc0=; b=h22wBTbFMh0+QE+o2TkcwKm535QdGYBqOm0QK1H/MknkzLVG4Dl
	YLW0gfL1jePiCSQWWYKeYNDbdc5nw34nRL9nlfJplZdPMOE6aBUENvrxKim3Ti/6
	7SV1wZhpiIs8r35SS164s6c535OCBzQJm6ZyufWiwrxghsEm3+GbAU8Gd1L4szRJ
	mMB0V4gyxnxMdUiaja4EZWyfC+SIQhm8JPBaR6GbP74SoqAsIIU04mbvP0UdM2B0
	/7ofygKLe92g2tXw+5hg5AYlZtg7p3tbGMYXq4rR4qkA913Vn1MSmXzSoYMFJBRc
	f6yIIgoE+sh5UtCjZtZlNwoDmGzHb05on8w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ukvaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:09 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127876be621so2359195c88.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657128; x=1777261928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfBQCJ38fc0=;
        b=fvpZhheuvw1b3IGMU2TQ0p7CxGO/UzkHIERgq/p/ojRuK433zJmLn6tG/NbhDBPkwJ
         /uQFrk+KCriRDjFehOlb/pjZGUDuFpz/hVhf3LVX7NfJCcDKo8daRNiN9M45kvWUOlLN
         /vW8XWy/tet6qd0mMLOCv2breC8xSOMJrWIQWv/svjdM//MoGrzD2KrbJx6p4AP4/dzV
         OVY3o67QOk8pbK9Tl62qRO7D/R0Foiw/jVRKmEkb8Al7YEC3ZoyWzvB8fEGzSHbXX1YX
         f5/K+JiLDlpp7kG9jahLuoaVnLACY3BiIlinQN0OSX8AYR+gn1WZyPmK0h1KcNEjAsQ8
         RazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657128; x=1777261928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJRwZhCKQ5LNn9M5NSckJ+yOwtzDE3hUcfBQCJ38fc0=;
        b=iOpwru/AV9kZkHax/mQWJviJr4ZYynUOYnKJzuKBbqQCaAMwAxtZFAqCv8HdmTVVlT
         U5xRISsk2mcp/mTwgtakRRM7b2+ixdXclr69BxGtRsnCXiE914Dtp4I8o61r9aUcncia
         d8aTp6wddnXxJopkndX7rWgXMBGJRgi1wY6xvioyLotXVx0egVUyoZ2xDF/ahKmLbrTi
         w1D+NSysHT8rhxdpO+rR6pvn3M40RPfsmCUA7DPxnnwZGzrChzCWd6xi+JIo0IBb+1T1
         I2ey//UmxdmyZfC4FHjMTWMkzLMK9vVzVFkSGMiHVyCxl39VFLwCQYHy9eWpyNXRE9RT
         4G/A==
X-Forwarded-Encrypted: i=1; AFNElJ/jO6QTpvbzjhKjJ9SN9iTnQqJiN9JS3EtYnCYU58sCkHso1lVehuRrjtvNfrZlR7OUIuxMPuzOSIDF@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTxTaeMBnsERYUV/zzZtE+djjZj2/LWyPNSZhzfAzpC8THpk7
	QO4YkfKk40yET2T6oT4tSJ6GelS4SHdyeWO6PNleboxzY2iHl3parTUC/81K6WQJfOGhRSglvzZ
	3fjbuMgsx7GI0qdS2DYuFYA/HmJTdPfOuv9zzccwxOiUIj3SJVSMomLToEJ45w99N
X-Gm-Gg: AeBDieuNxdiuj31DjFuHNiB8sfwaLnvg0MpYbn5pKVqzwJiut86m34D4sUnvTYO4+l7
	PdnG7auNg7Ew82vGwOUrmIbUeE6RFUlR0rRMfFx6sgyLCbX9CH/3g7r855P90R+1cCKTLnFoxXY
	eMqeQCnLTYMaejV2elYOEK8ljAidyU1AHrA+JTp9IO7llQquFgJhImlC3sjaGXqpcl8Y1ghYzZK
	aCp1KtuYuM6KOTBcfFdtQ024MX9Jek7fiki5zDDbB2eTbrPF3PT23vPozUi3AKShIf6Q2xdrNmi
	bteaDUV9KVOsbT/tODyyr4KaJq9YbysAjSciOSBY2IgWrb/htMwxd3EqR9armY775Lh0pcV83Yk
	ilzz5rFY016/lwbjYwty3yhY7/gAazx5kKkYAoZMg09k4vIpiEl6Gjt+lYWkTVLAVcbll11PWe4
	b3/MVJ8Hc237Ye2ufL
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr4664730c88.1.1776657128227;
        Sun, 19 Apr 2026 20:52:08 -0700 (PDT)
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr4664724c88.1.1776657127664;
        Sun, 19 Apr 2026 20:52:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm13056111c88.13.2026.04.19.20.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:52:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 11:49:30 +0800
Message-ID: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzMyBTYWx0ZWRfXwq3jmbpQ0CV4
 DrqZASNZSocRlNuRORlbC3LxuSnQ3axAysppersoeh5O9co96JZ5FyMM1JaEC63ssk8wheJyXT/
 XBULEa0M3hwyR89SuGgG4XTMdMz3DaYi7gvP/CR6R4tP29gmyU7SBE3VE5upN6Qf1W2f3sSTDVE
 TthQrdgoeswHFBi3IrvI19ra6zdOYCgGhqeJeHAmM5sKN1oTwQWeK3nH+FY13909ctEc231uAYY
 uU943V2ye+zp1hMIKfo/rwoGQnMeAJH1O88jZXBUpujAvbI/PFWE1NiOWQdtljV/+wCe/zKXkdi
 8Cb9VYyzdcLERMFsnjjhukO/vhGYKMU+fH+sj+848NBFf0hWHfDmQ93lyqh55ZwPxnljS0goEeQ
 gcb2jDJvST9FomBM4T5P6Qie3PDYPw9JGqbwjKPWoneLPVTSjy01pxpX/t5fFuFvITTEAfTLjeP
 1CwT/03quFlUs0iG1bA==
X-Proofpoint-GUID: vE11L5LSOTVHe1eA1PNr8t5x9tXjLtw5
X-Proofpoint-ORIG-GUID: vE11L5LSOTVHe1eA1PNr8t5x9tXjLtw5
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e5a2e9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rxKuTeQDrr0-oB1YhZwA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200033

This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.

The Nord CPUCP mailbox is functionally identical to the existing x1e80100
implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
adds the Nord compatible string to the DT binding.  Patch 2 refactors
the channel count from a hardcoded compile-time constant into
a per-hardware configuration struct populated via the device tree
match data.

Deepti Jaggi (2):
  dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
  mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |  1 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 37 ++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.43.0

