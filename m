Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82717436345
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983920; cv=none; b=n+5JdTgSefYkTgvI+Sjhg5XG2kdWjyYMzX08Esna3RaY2BG9rgNKA/S9O5y9YZGdhNF6SLSz73cCt7rw30knY5i6beSWW4CAkQHRaWGUV6PT3fUWm0b6UR6L7pIdL2B/sTCvXf4a3DJzew/JwEcKM7aDaM4Ap9a/eYF0/5gToM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983920; c=relaxed/simple;
	bh=85/U6iXBPakM0Mmmb5NPMjAPvvGqfJ6KU2VNXgLZ+Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARgt4q0bKKAwdVKU+amIaVzgiFNSQKqCRrbQFrwVIxk6FRh8QnMNxZWveXYri66PxYll08W+2I2wywJBPf6i66XVdJ3P/WkHnjCkw8UNPzk4nQar61EesgVd2OFkXxR1Df5TkyyF6kR0kqU96KgP4nJLYWT4iqNHlUPXSIlmqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAaL/5Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcB4USsL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAaL/5Nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcB4USsL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645B6QWi3091483
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 12:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=; b=RAaL/5NtaOtf/UeJ
	61uZt5QhzCTyJJJm7qnLWJcbdhiiZeVsNfEjlUC6woArxVpPwCTBsn4awDbGUihp
	27m2eWPYJKNON/xUpn+L9hzcGnm89BUF/dnxHZtnlwwB7mRg5QKxVDIu85W1vUn7
	QB0G5Gy3ZDJcxTkbr8k10lpd0xaDWK/i46+Wk54vw9AcceF3hjVkWUXrwgbYGcvn
	sYyHqRHQyheK6Q6aJ0nv9R0ijhpT0ota0WfayP1o1VrX2YDmmGIoU94djvlKHZ/w
	eojB50BIDZ26n5gv9+YFMedY9sIeJD53+3gtgYK5tppWQq1qaIT6v+7Hp/0RUdWW
	h/l2ng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct07fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:25:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8025414a5aso228750a12.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983918; x=1778588718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=bcB4USsLrSCZD23BYRp3R6TWmxFWls/GiOPg/+r4Q7HQ6ctIcQadcTgzjc6Iug6b65
         2vfdhhpN/5V7O5qUDMcsqdXeybMAZh7LHU+cA3EKozL+L9wVbcwu1lRfEeenxFB4vxKf
         5SnSzqSiSMfsiFIGqZgYX/TyL1tsgqaxbgfU+b0pBxdpUcblALsQyTv0zkqwFCIxHEAD
         YJxJ0+yqb3l4XF6TccAiYO7odPhBGO/EqfHj7gvpGOSbexgmWj5PDdwJBVPY9Jngr41u
         E2Sblvz1KVwAMCKzSmr1758GiQ7cXlcd1mBhW0ukiR4/ZMJA4SBCe47EMJUw9utMU40r
         z6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983918; x=1778588718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=MphWnjE2sWDf1l2Q64hQ5grMVWCZ670k2AkTcFtoXUTL8a3PPtG1SMflcuGs+k1kpD
         ltUSFqQvs902wCecaiHRoEdgxf8zD2jYJvcNMCX4gUxQsp2rcoZyGTtypWk3YO3eTxP+
         1DA7xSFU7uC+hafFAZp0Tu7kWGWtPjIjDNPm6FtcyhUDebSsUHMOCandNKfWqJrJNggh
         8MF+YwXQ5JXucONi0RDAPOdNyJYQlHpgZRBu6vNCbf47g5ROTJLCBv00JcTfJgg6o7Q8
         /PFxs/UckxByFvn7b0Jzd/v/2G+A9d9QV1dLa+sQmKgxEg+7y1WYZjI8F86xphAfHbRR
         5UEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UafaMj6j+jb+jyK/mnW1qqZRa+bugNij/CyzafLfAqdyjIWv4BmQ7z2gLChMiDfTSk/p+BvP3IReK@vger.kernel.org
X-Gm-Message-State: AOJu0YwaWKuRU/FODx4uaXbUZhIcDVX+B3oEg+HiI/b+27eVsSVnnxZ8
	e2QxILYnQeWS9EXiwIFqxzS1WQETvHUcEClrJVjIdky5Ig+4lhz88P/KO62ilZtFniErCfdwXNw
	g3LCyQHpwvxFLobXs2PbUknhu5gBtYie5Ir1i6Gws6ne3FM6RSybA9vIqKR8fC79C
X-Gm-Gg: AeBDieutY0PTtxQaLb0qO3Zd84/Kjw5PEYWke9/GFjbY93r3kjnpYWCPRPHEQfmJBig
	OEkudGGTC1iF4sErGUq5eGgnSVAWTW7/5tkFb84jVSg8HP0e943PhjKBwmQBfyLXzi1NO3awmci
	FaYIR3xWm8jRsIhxAxJQvixXe0K7RDIPRhb836q8ffgVRJIPQvCBmoZk8WcOFyGMgbUkLxp1PUN
	oVLVeeU8StcAfCSQLfjU5H9AF7FBk2HjI3LmzH1zfnHSNSM7GnYfIXolj3TQOei1eA/blknvcls
	EQovHpWB+taJObFNW+n74rE7gU53Fw6CNmYFXU5bq/AoC/BgvCnPHPatrQbDLO4ae+mcuLyEaTG
	qErt16AjLcu3nIWNhaGXPnYopj/v/S1faeA2n58Ov6OGlFTvJE+xEaV9uQvXKG7c=
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079547a91.4.1777983917985;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079533a91.4.1777983917473;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:16 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:48 +0530
Subject: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1723;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=85/U6iXBPakM0Mmmb5NPMjAPvvGqfJ6KU2VNXgLZ+Sc=;
 b=uAueX0E+J7mO3vSlmsfq2s5T3DTennvda5xbsWtVnYuvom+4lJANe1HZ9CTFuHCFI9bv0MzJh
 UVBLIZVfoxaCfAJSibykZ21OmsQSeQN479uLTCjjakaC2Y6xWj7Te3x
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-GUID: n1HOxiHpPORijJujXZJV3lYelWVHoHL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfXzVnf8RQdxLAZ
 n73O+7Bv8D/lQWzcLNL/8jP6YYEvJF0Z9PYakApruFcj1HgeDIsEOlUJr5EtlFn7WTvdDGDQsXK
 8nyvsunWlsv8xRG4H/9MGPpOraDfVeawgvnxJll/o47qlZloUtitm+mwCdm0zVmJ5y/32eux6xH
 kPMnhu/RcnUFrhpxZnx7m8m/dfSM8s7ZNc33s08hvdiSpJKaXAX1XH62aEoqytAi81obTs6TgRd
 zW1Sb8y49Oh+zEegJJhzI4kglZJBvnemPvvo30D39IEpcIWmdDt+m3i4CuEs6jwh64YXwY3FAUV
 8/Z/YhS0GGAWE4LHfBozs8lVOJjBRjHbJmMcjTjjPi5AphKeHAIgqT89K4QtBIRjizglyLNL4nM
 gax8ou3dNLvlqnQCWQfnSFb9hbVk5K9olZsACxIPigfDPMRtcsG5UiFP1008z2rURpRl1zsWY7q
 a/o6u9a0TuUWzotA/VA==
X-Proofpoint-ORIG-GUID: n1HOxiHpPORijJujXZJV3lYelWVHoHL_
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69f9e1ae cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y-mMqNAVNQw5A1T741kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117

The driver unconditionally calls panic() whenever an unrecoverable,
uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
for the user to suppress this behaviour, which makes it difficult to
test UE injection or to run in environments where a kernel panic on
every UE is undesirable.

Add a module parameter `aest_panic_on_ue` When set to 0 the driver
logs the UE and continues instead of panicking.

Usage:
  # Boot time (kernel cmdline)
  aest.aest_panic_on_ue=0

  # Runtime
  echo 0 > /sys/module/aest/parameters/aest_panic_on_ue

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index b4f4c975da1d..9ce782a66edf 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+static bool aest_panic_on_ue;
+module_param(aest_panic_on_ue, bool, 0644);
+MODULE_PARM_DESC(aest_panic_on_ue,
+		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *aest_debugfs;
 #endif
@@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record, void *data, bool fake)
 			aest_record_info(
 				record,
 				"Simulated error! Skip panic due to fault injection\n");
-		else
+		else if (aest_panic_on_ue)
 			aest_panic(record, &regs,
 				   "AEST: unrecoverable error encountered");
+		else
+			aest_record_err(record, "UE detected, panic suppressed\n");
 	}
 
 	aest_log(record, &regs);

-- 
2.34.1

