Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163F83D75B5
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372384; cv=none; b=PnhkhoMuR/fSSj9FqbwsMKmzIF2+2N8wvJhkHOGBGYzM+6IPp6NrjMrSW3W9R0/AKnv4t/3aOOztK+2cNgwton7geQTcYxZqbkl/D740nJ0ldi8wsXTCiBkLv3eprCLtLsZCyHDSvkyDQqTvUzzxSCHwRv+8gqTQrYnAdm5q8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372384; c=relaxed/simple;
	bh=9y3ZdYxQ1rInJVGpUROVKIIH9d4ExlJ3gXRl1keGvNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lvjW9ZCbEkwpNEi/KPz7qCEkb/RjKpqoZempBkqu7tDwG0y5wQtkHte59CJn+DgcZVMY05S71/zTWF5lFflGcR+Ty0Fq+P/8fieMkh6gWmt4/GKLrrUf6hSP7XV/8Utc0+W+kZ+rrp5pUQqDrZxE0YUi9PKW7chT2T3yU2UbRRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRt+5L86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS1KY3WN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRt+5L86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS1KY3WN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99k1h3343477
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QM3P8PzgJm+dl7DUTcWreE
	3kVwtqS0QLfbrS91c30uY=; b=YRt+5L86dVcqDuOlemlCQZTjt8uF1PGrbU1UT4
	KHyANEgd3ltfnz1JcFr5nXX3SmI/3MXWSk8rtRaAiqtaRCe7fAEADKujarJUDCXi
	SrgxcC+wKGQy2Xmjg+vv6x/3LK6nXwSPkQ/yEiSoxesfqL3JCeIo7ccuCYUpa6OB
	Tvz63v9YOcOilVpn66UjcobmvQUFoS/XW8Yk1tSaLyiBXFFVbvemOOfKvnMtIlg/
	48wmAHFHdsGbTPko6ib0YZ2wCzlOs4pnqs0vPSWYsPIbtphOqjxl97qMSzNuY/So
	K+J+tjXhKCwJ85Cge/oTNvAzmi4Ev6TBPxlNsM/dE6Rm584w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahsnw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:20 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7b3e41a97f0so84575987b3.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372380; x=1779977180; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QM3P8PzgJm+dl7DUTcWreE3kVwtqS0QLfbrS91c30uY=;
        b=FS1KY3WN2YxfSIxnSRBaYhEmbTZaWOLWuODsQObRTDw0lLar9nOPn9Q0OD0GBoHhKQ
         OcPHUzglDzeoz13cN0oxbAfdZPCcWFvyEC3BlBU/mOLxm+BOodlwHZg0STy7cG11sgng
         dYBdbnAHngrgUgAK0zrJTmyyenesPfXGNvt2hRV+fZKC/vsxsNKmPtA/HBb/K/bEKMTO
         icWM8NZ7cYMgEeX0lRhqE8y+GBA0KJ0J2Yrm0HSr6GC2fYFr2jXyNpwLDsxpm7Z+qhMo
         3dcInny5WS90jkK0NzATsJTcGjAq2p7SERvcPJkpjnQjA6vDOZ8pNiIaypSjId42X70O
         4pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372380; x=1779977180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM3P8PzgJm+dl7DUTcWreE3kVwtqS0QLfbrS91c30uY=;
        b=ec3csKcfPDNQu4KRh7snqYkFqEkoBoCgmOxMKlcsHc8Mhsu3iepTq9xxLUTTZgtdx/
         L8Sodh2Ou3Bx6nQ8ErX1HLrYqHx3s6x4gvcv+COo8NXSdSUH3htblDWRJzQXV/dPEerH
         NSRoW3wwmqb84FSCM5AsxY6Yj2wkUJ9GpFb04wIKjbCiz6JkdGsvfK5jrPCTpbAso9Um
         owtYgaNdx1SI3kqGkmuBldbPpTu2a6zMYULR3f9M/pxyVsN3+OEPpRQVDJpBOvDNd6d+
         R9n85K9Hdi1nlWZ+gsmMdo4eQi/2t8gEg095x3vMqCwnWKKYlumyzDX7+h+2mV/fmq9O
         CRBw==
X-Forwarded-Encrypted: i=1; AFNElJ9BgYiipcd+gceRAEwAIwkW7Vlt2/p0ZwqEAmAYnG9Yu9BNb2q8+3Q1udxTxu2Vl7iBmf3pBd7+IaLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5vrcras+9dVfUE9UKMbwIETyspOO9OvfYpvpjKTxMVsW+4jV
	9lzVUQKVqbs4ZPYZk9+UVQavlUHQTfoOuu7VRivpMpkFPlYWeGUqihK/rWkXeIWaGgxZxY0njCu
	LQp01ndXoT6O150DfqC6qV3dchHZdQt1iCO6qwXTDtIi1BIxMqQLs5X2ChKycVSOc
X-Gm-Gg: Acq92OG9WIYDQ/vPUNan5LzGee2FMIX84xMeIVOMvfY6o2kT5EJrVb2b9Yh7QnYQjAb
	bVxhxT/92ltoWa5CBpOhFhfOrNihTNXviXhk9o3hr7yMZg8vexTtTtqzEAFRc6GlYPMiCCgnijK
	N0nrW96uTmGMszHg/MmOPJxW7mFgKr+4F+lLykKs73RGGQ50DpYO22kMAGY88LQE7fLPP/9HmAX
	Dl1WAmjBVBlBlMA4f2oNIf8/VWTq82ymtN9t3+lQTNTgEz5MaIfQKNwCdEKviwY8uBnl1jVXvRg
	zLj3lKxCVKAjFnfT1Lo7WJLGkhvUUfp/NX/EPt3N3TtO/FKtr10WW4Oatk+IhFRNz/vW9ZAHEZt
	+QNQDuOEg/c87hbXuWM4C3tXTX/QQ6VXdVQf0hO5kAdQ+WsznUvPkUkOoTxODGQA=
X-Received: by 2002:a05:690c:6c0a:b0:7cf:af41:50b0 with SMTP id 00721157ae682-7d20c74cafbmr27935417b3.36.1779372380507;
        Thu, 21 May 2026 07:06:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6c0a:b0:7cf:af41:50b0 with SMTP id 00721157ae682-7d20c74cafbmr27934697b3.36.1779372380000;
        Thu, 21 May 2026 07:06:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cab7a5f9sm2920677b3.39.2026.05.21.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:06:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Thu, 21 May 2026 19:36:03 +0530
Message-Id: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsRD2oC/3XNwQ6CMAyA4VcxOzvSbYLMk+9hPIyxQSMw2IRoC
 O/uwIsHuTT5m/TrTILxaAK5HGbizYQBXRdDHA9E16qrDMUyNuHAMzgJoKHGh1dU96P1ZqBBqwa
 7iiprMwlMAGSCxOPeG4uvDb7dY9cYns6/tz8TW7dfMgW2R06MAtXnvJCpTUUh2dWFkAyjarRr2
 yQOssoT/9GY3NV41HgB0oJhWpb5H21Zlg/l+MvHEQEAAA==
X-Change-ID: 20260430-shikra-cpufreq-scaling-aff690130063
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX4p1vxbkT8PMw
 Y9PDIDGIGnp4k9JO72nGys9cBzi2/mNKC6qa8zBj1xMTo4iYQV256maBQQLPfBHGPfeaaLL0vkX
 6rrel+cZyHDceAerkxgE3io0QYrR4FsPWaRogzE869BaDMQPjP1+51ZTcj/dTh2XBp1qkMLwCii
 7DMJrvqmyVzjwHJkRRtgFjrWjiegY9fqxzAhgg9s47b6p9BRfz0lJ2HHaEtMblk2nSiOVMR+o9t
 tDWUPBaofyETLmlEJCFam86vSpwLCWSK3HZcn1J9xQB3hjxiRgl2wwOXlxCkWV2l/hlW0AfvmPN
 jKSwIHCyUTKSdaIK1/l9A+FMeLpza4w4xegdOTof1gFa+C4tkS7/qxY/0SOsobBMYUAfZ6HB2ZL
 eKn0aSflQuBbGVlMFiwKifPmojXuRDFnxOqKUooBgK0o9Yv2lEcowT9m20L2Z7OzmvJii981Tlm
 S5FwfkN6Z+M40uou8Rw==
X-Proofpoint-ORIG-GUID: Dydya-J2iq0-An9rWmDSr2xDCyLFARPp
X-Proofpoint-GUID: Dydya-J2iq0-An9rWmDSr2xDCyLFARPp
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f115d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=65fuDPeu_usOQaeP5yMA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210142

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v3:
- Updated bindings as per the review comments [Krzysztof]
- Updated driver patch commit text [Dmitry]
- Updated compatible in driver patch as per the bindings
- Link to v2: https://lore.kernel.org/r/20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com

Changes in v2:
- Dropped the generic compatible approach, and introduced Shikra
  specific bindings [Krzysztof]
- Updated the driver patch as per the latest bindings changes
- Added R-By tag received in V1.
- Link to v1: https://lore.kernel.org/r/20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com

---
Imran Shaik (1):
      dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

Taniya Das (1):
      cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

 .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  | 23 +++++-
 2 files changed, 116 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

