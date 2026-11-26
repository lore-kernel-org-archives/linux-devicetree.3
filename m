Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687025;
	b=LROEMu0xustXRUevLFd4PbSm7mRRKhm8dFHWTFazznW4ATScV/l0dHSUJxytuaFynE3g
	 P22ynNbt68G13V0b8/kzI26qmnYqW2QFCJ3dEFGEdQ9bUI/QkPnQRwBX5mzKBJnW00Z/c
	 K4mREFyv+O9M/3ATZeGDZRYIe5Rtzgc3SjogGYjc9Zam59bc4nMD/1TPmtRtkD1DucMnm
	 4riGfbFu+h/Aew1ABhQXFUrj73+YLoG4WCNrO1GsQSlJVJQR1Pn/faCf/I8zm/J2B111K
	 s5XlL2fxSBrJYEOyC0mWLWJwRgSan/2WguicxRJkRa6MNlh88Mkgg5E8GokgKVumS7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
	b=JwD5eFsxR0kmvTcwCyH9Zac4V2Up2mi5z1hBi/JpPF9kp7qNsIHPeoVVQBNv8oErCgkW
	 PTIsLXd5cuo4G5TGUfUtb/oWW9K92d8/yi2t2SL0Rizx/1Tnw6viMwvFsY6VELBXARauk
	 7uuHzyL7jg9nJvB/uewKWYpJs9nQjSv5l9ZKXkiQYuY9wPB0ZYxhR6TdFZsh2Yr2EpvWn
	 zq9hXMBq56BFDHfMUj8D9iWNmmaPCNaUYHcRrcchvyMutYFbnhZZY1Kv7ASKyTVhLsJha
	 ZLWL/5THndwHMMVCFFW9w668HfgW87sira1IPQ6Wy5QZfs+vZYf6AvcazIFQXXEh4Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaYkzIRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyC2EXpp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D507606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D507606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaYkzIRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyC2EXpp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B26w1682387
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfRhNGzjGAC
	5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=; b=aaYkzIRxZXcJHaBdp4jSIfCz+5E
	K9xoSbeJbEiDpHz4gtJpWdjdyov6gHHWrrkQO3k8I11CiQ6Na3E4om/F9mLwupcP
	c/PHwgQ1UE2fYyE7tPwyGYqJnTitMHI7qnEP1maElN9pmdh/MhhPQL9cvEeSp38N
	r0rfMzpSagZezwfmgx+2aJZ9ABqQQ8b1Rj4WAMC5X6woy58gCOXVExbNJJe9VLX1
	rUV+OA31IPMSegN9BiKGZtpnUx/A+32Gzh3u5nkMoHGLEjMKPxTBPlPJxmvIAlUW
	H2SACXO3ed8XcaOt79X/jlAZfJWl/zC9ywh1g6cO+wStKnspMPvxiRZ38Qg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekjw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:57:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso4452867a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687024; x=1796291824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=GyC2EXppKYZMZ8mnEmHbWt/4Z2vWKq/TvVPHpBKoz1cCQrq7v6p1dKpLERSAUzMDgl
         9is3TQzRx3xZmqlnuENDcvNyxnC/xdWGgGOO6nhYgSX4EySw5k2CUIFXhvYq6Zm/sCUD
         VyHX/ghKLk8Q2mLm9Jgd2sodyRTgXKv0sBzZ9SrTkXrOLyjYYvdmwKdLbVlgTBBg12Oj
         JfVqk23owPp1mIbzzbSX0Q2K/8FqBorLaNTj+9Um9CN/2xxTasdz1+6E9Idm9llZCK1B
         sIN4V+5bZIKXPPrvIIMRtJ5LTvBq8E7ZE6l42epA1i+gZfJw12O0L/kiCXkl7I79mmff
         T8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687024; x=1796291824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=v4Ykz/3NM/mLn+596C79Lixu4ElgTuvAqMOSPpmOAknio2pe1uHpK7YMsuNUePPPHo
         RzWmXNIrFZfk2BnAzfG7+rm55e3J61UO8cSmYp5JVaSS7HVvdK8zIt2w7GJlJAT0Ss7i
         GUMWJ//a5s3A22LZYUiu5oYkhEB0NteL6FW1UtI+Qwa4XWVBUIHmjSdlengrfiI1BNrV
         xaCCE2szK9q8YjfPAlC1jLPj7OjNhRXSkqaHs7FsSV7cVeSiMicZcXYN5/Q6XPsJ/2xG
         ARvNC8GUTjn0/DJlZyt1MQigKOxRLj6pDijYTzEMp/3l+9iEa4k/PJfgXMB7t+B4LOVz
         33sg==
X-Forwarded-Encrypted: i=1; AL+hErFTYGBII3mI15BeWDlfzxMElJiUk02DU1ClE1siE61P5lj3Oj49xhTv1zyI73+RxQ9GEgQ6aoUn2l2E@vger.kernel.org
X-Gm-Message-State: APuU4Z8XZ2vMVlM7WGQZPWKvdN2hin9bojkIBNwejUK5niYpg0bci5Gq
	Yv4C/stX8mkxhdJBjzOj4qpW/vZyuDAPnzrF66Ox3R1JzufaDzzHO5Q3hok0UwITUN6so6vZCl1
	Iz0nEWidIDrGbKl9kNXqLlR8cYsagTercmFlR3w7dm6CNFG9hsq/+wpsK0vCKVwcU
X-Gm-Gg: AZFdTZdu7ddFE4GASfLVggXeW5SJBGu8vCYlLz7klgOjOAr9yAbbPgtXs0NplhcOS9b
	LDlN8MN9k6iebCDhIAoQd4R+Rtw3tyYyXm8NdQUnlNHcrHYleBzNQcIWiaY1eFEfZclKeUnzn6R
	hK9R0BcEPEEf7V25hD4tQUHDGBylBS6lUunXF7AFaKvGAO8bJY0NOJPhrI/fPrS724ofHWmijhE
	oSzHE5qzaN3ZDokCIBL3+5DT12cDpke7oAvX7PqFqn6IAzBKrWPBb2RucyH/lzqM4jyrsmu2o+K
	hdYaOdxHRgCTZ/NLj4swRQx3Gj32Q5hmVXy4l7CwH+vDDiaYSoKgGP6srpkQOsz62L2JL2Rnu4P
	7ZR1ycXnYThoiGGi5e87MhUb24pQHh/mB7ld8Odtpi8YL7bCaqYKB6XRY6s0Oqk6vB/J7xhhqaU
	ZrgiMAw1fzl9hX07ufyG23EmsWbqMOsEP4bTqza5Jltm4I7n6un4v5CdE+BeLoqUjIELxuHPFBe
	Q==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227865a91.40.1795687023969;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227849a91.40.1795687023520;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 08/14] perf: Add gtrace AUX buffer trace format type
Date: Thu, 26 Nov 2026 15:25:29 +0530
Message-ID: <6a984b05685f80e6d2f5ab57f0fdb1f79fbcce6c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX3hoC5kpFkhM4
 AzD8ORRl+cYp6Lr/KbelESOVC3o5cxwdYazYjl3Oo01S2sATq3n64Fw4uvHqwUviIz8j+vXpTWd
 pwXDhFKKMG+OgX6/uuGjwtlVrbjIFDa4rq9MUhSVKSf5GEZ5a3RkS28oz49MVJw9+DXW1rl/nDm
 Fme7HS0ByGBTGZAlL+aHfvcCcPjxISV18qT5xshhZu/bs7IE4lMDVhl9OSFviDL4F3Y0u4b5ws+
 IvgZIZnqfvtZXau7Lzw/Q4ixjl5UB8BzM/dh6L6uYKb8G8mvIgL/l4Ry5aZahP2DPF7ars8dkJE
 xof95t5A76rZGh6JY+f+1H5AMDlf2kGh8iSLLey+rTPfcnlAjYipjWZlBvlAAS1Ekn6MJMFmgwU
 MxyeVyZ8B49heBNmhZ39OSipRVV/dYLfBJwPl5ElDMLEsRbmvrCmdyZKcFGMnzdBryJ5VRShH5P
 Qe3mMmzt8BB0V5U08Nw==
X-Proofpoint-GUID: YrjubNze-WRT8Zs0wN67bvQLDyC8lODh
X-Proofpoint-ORIG-GUID: YrjubNze-WRT8Zs0wN67bvQLDyC8lODh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyPQsnogRt9Lw
 I9Kjd2Y3GAXvStt6KujT2n2dqIGTP77uB9nAsOl9iLKCS43WDKBhndv4AFrdKbliKAWave5iZ+T
 Mw2F4anLQAKBr/XV20vVgYwYtJSUcRM=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080270 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EjOQMhZftjg6WCmXgxIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h       | 5 +++++
 tools/include/uapi/linux/perf_event.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0

