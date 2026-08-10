Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744A4119EC
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375473; cv=none; b=rWe8w+Y3tC6tR9nNmUWlv7qGfwQYFWzmcBiOUhc0/zveUmQSrl45BEMh8BbHGNdQtU+2ZE84Nf3KOqNOXSJAsW4dyeGInNVTWxZO1nKe7PfOL8wbHLivnAvG0UrQKKV/kF1Qd0VHTyWg9tLNKdjZAjmG5z6b6851Y27nbPTdRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375473; c=relaxed/simple;
	bh=0X7grRdtfkegL6PblKC0RKB6iVbpaSOb9mEgnVIZqWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxwK2GC13edCwUiMhYjaRNHAze2kN7Lzu7NtSHQfrXRtx1YYDUSk947oqMww0916BQatBdMWcoDgQsnFCXhJab1HNRGrMU+0vM4gf4mFUic1VlhR7gIn6fDykluwyzJm1tgy7xK0LXzSPF9GHP5M1cCM0FydT/EmN77DVFgIw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwBHuqx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMzI+uxG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwBHuqx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMzI+uxG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjAZv1367883
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vmqn2TDyzfw
	u0fkZONzvlv8i/iDMucucBNwgndeXY1c=; b=JwBHuqx1ezeASHdBGbjA3CZVxEF
	HdGE8BTeAZKYsZbgiaYxiPL9ywBLbMknPbYF9pUEhQKENnGyZ5Y4HZu+HKwC9VLQ
	sRW0lvLLMeJRgzkoSSvI5WbRN1k8tv0wy+b96kug4l6EHSY5TVmVOhBU6zohAgNg
	GJSUhiiFIgZla0MrUxSj3U4LukviPwAVEu8tVzXO+HfpkqdNe6WhF807yzVxAgU9
	JCtoTrRSBPprLBWZ3BIXfZB/GtxAMyqXVTFoOqFf9B/Q/pvIM/1OlvSqYUrsjTTP
	5CLWcf9T0rAA+Lb/QAfnAXZop8AQWoS6a4mdnl5H1r312mcN+d85eIBgmyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4a7t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:24:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1807835b3a.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375469; x=1786980269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmqn2TDyzfwu0fkZONzvlv8i/iDMucucBNwgndeXY1c=;
        b=KMzI+uxGJjcv+ha7kVgaxZLeldX7A+pSPRBily0FU1mFpnzBv5BXpfmcOMJjOZ1L0O
         bj9Zk/eG31kJeKxErYGdSXm6oebJIwqhYMHWU6tZ6t20Lei2xMdY4xK4TmMCWDM3I5F9
         ii++yYawpRC8APVnJF9zFrSKcGuR2Jqoui96aufoyxHaaGEC+8ZhULcpsEUj6Yzgt9Mc
         epH8T+DZgQZrxCySL54enFfV5Y3mXFEeo+BHrPmsuqKhi79KeXQ8ZVRFpFrnd5hI7zpn
         /YZlxVyL8XfkvScRfwJbMIjR1M9TWZaAug/URjiPyWlg02NJZeTK7fAKxQJ66Rwgd08O
         zooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375469; x=1786980269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmqn2TDyzfwu0fkZONzvlv8i/iDMucucBNwgndeXY1c=;
        b=sAj+62Uwo0kuTH98kPf0NKETnpJMMgtoLza5A8oiWBZ8X6b5wsaPthYp4H2ZrJTa9D
         LIiXoJuHOXU57FiUfSn/bBDwkTj/BzFWJqZiDKN/xy+TjeBmHWQb8xnSZTHMFFQ4MdY3
         x9MGGU5/NBOizSkfqryyhsupBMDYeeQRIEwUEtet11kCLEb4OaKZEXgznhfOfy7lDgIU
         ZdOK84tuyUEtodhK72PL+N2kd2cfFnZbpsK4GN3YsfneyGch5Ntb2XBay4bR4Dea5BGp
         RDb1QVuwdBaimAwKxcmvkLo86+UykPklfX0B14KGYmXWTLIjUwH7YV/h2lE9HAm5g/sJ
         eDXA==
X-Forwarded-Encrypted: i=1; AHgh+RoS+vEkD81AnzacJxzQU3Xzk9mADy09WQOSNBgofhJaMuYNC6jQoFHffFrcNgVPXLze8Abi0kHuA9QT@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmZTMaleThxDDTBCWPKFruNnvL5l1tAL1i/PCPQUnp9n5pULC
	Ngf04iKFC45hq+q18KY5KMVZYuVeJEh3T6xIPiPWvSW2opXsxyK1s24iLi7WXsxP4658eS3IslJ
	5dx9opgoEBC+TeRIY2t4OrCT3cQKLC+Rk2E33Wvs1HAIBvZse0xgUVw/HUo7yLEjW
X-Gm-Gg: AR+sD11mwEzDcSHIVEM+Rc/lO+cMfhE6AAwQyJqYHYTu8XtwxoK4Vp+mYPESXg03v8S
	JjTjxzcLbJYYWZhJYlT8Rt1h6nYTGJJsx72xv3vSXlWNE5blTF3ezzlSokZxzSM9V+4onLD3WoI
	eO/wiyUeaNtq+w37iL4cj/JjGO/A+1pA10t1QjVLvTbdx8A5f24y7Af7iqLxc+e3U9Qnh/3rYBT
	p74Pd/veqMECzX/f+K2Zs5T3vu+lqc5pg/5ef9tPBXcLNiYkZ3iIENwh1hm9Le4Fxi3/czoAlmE
	w9af4swhnPuTYMz+mTEK5w1S/mcpXo9pZGPldx0DLRkYvYKJtsk5oLG6a7v7eFn2nff6JZ6pl2k
	4vLWKsVVmpE11hK1xakk2nsYsZFeH7H4yuApzySSAiwxP4nyImjH9LrCAxgYA3DF4lGY4jeAgbV
	0Wk7nNgXm0YUI/kunW7xUkOaha8w==
X-Received: by 2002:a05:6a00:1a89:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f6b9aae50mr19277145b3a.15.1786375469449;
        Mon, 10 Aug 2026 08:24:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a89:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-84f6b9aae50mr19277094b3a.15.1786375468952;
        Mon, 10 Aug 2026 08:24:28 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:28 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/14] perf: Add gtrace AUX buffer trace format type
Date: Mon, 10 Aug 2026 20:52:10 +0530
Message-ID: <20260810152223.3946743-9-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mdkjfrQ_qHFS2rt4m0VZT_E6Xk_v4aOf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX28uWmqX90QZz
 dpzSCOMF2WuxnspqdYvj/Cv8pxJHPnsztxHmGNuMiC/FcQ17p6ZzNmYIgoTtM5glQN/h+YDH3Vd
 QIIdDbp8BY5qHhRlTC0G1rTCpFUJIFE=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79ed2e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6jy1HB2Bu3O3gCBx7RsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXw8O/dnhPdFR/
 MYVDdkiCGbeIVJ8Y5YIyxrwxOjhY8Q9QG11pa1fdGFxcTrzjvxKBHEeEz7DRbdEsIfFsr4wMkJ9
 ER3FuWBacQb0SiGWKKFePKcu0CXtCFhuQIzsrbI8ZyTSXA63pwGqXXgFZZqDshBz5Cis9TLcRp7
 nUFWsUmkoHKkblZAPBW46fcl4wN5XNi4XT2UOqooB4iZpye7YE9TNo+q7e9Z4iqL28P22FBEHHU
 SDN4StWJrkMNqm1uZQuROM/mjWnLi6K5Gwa7KKfwzDoXrrr30I3Hh1slt8Woyy1rL/Cx6w5umwx
 4/qMDEUJi+EQ6B3AbhbtXdRF5+6orpCGRocg+VnrVEPHd4HYE1DlmQCwU4dByr2hRL4mBovBtPa
 H9ouPabkrJzWO2jCKQyr+eE9bQJcmdKTqpExo4ehIISfBh8NVC7NgFSEeJeZffgQVxjRFYCPerW
 ZRnREaLWNln03yeTkKQ==
X-Proofpoint-GUID: mdkjfrQ_qHFS2rt4m0VZT_E6Xk_v4aOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100132

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..ca2d8614a780 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,10 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0

