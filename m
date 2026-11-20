Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145273;
	b=TC2VjlJnFOWucfIyBNI1WJg4cUIjidzPrMGj/th9n2rp6/nAfDQY+dqEXP6LHnUQAO3v
	 zCKKLndKmMxZT8IbcxP0UREDL/uhAUfNyTxEo15c+pXu5oQGSGxatc7AdbdFWCN0OFzTA
	 ToStqM2FPm7/GiO5Zl2kNsq7/q6p2jqVqaiLPWYhDp54YqQ+ybHfuX35Qaqqw5mzNXJMl
	 h7JE6JNKJoWqtXN1+AUikvNmjsYHIV4kHqudN3eS4QtDm4dKivEZ0pvpNZpbyZCVHhdaW
	 GBBsRLKqXD349qu+8X0Nou7Tzad72oAwcCD+Avd+o1ucv2+ZjIUOU3a+GMn0nlf7xfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DS3T+X1wCXRsTi+mAH4YGUt6zEYW5jwzEoUyV6c4eIs=;
	b=wfLEl7G+VOD2iT7wK87GCJ2KxunDfN1lQgeAC5WCNVCoiCCSTm4akTa0x0o5qk8GRH45
	 NWmWcHZuCXIAQMfuIDGj/a4RJTHqrWLLTMuYxVxqNa9a1AqvXSq4rp6jTO8FCB6PSj86O
	 LEpgR3feIY0KLOBEtjEFcTbQX6P+E5u9NfGWmk78XV6S+FCdEjRPYSZLQYjCVQVmmJlhL
	 rd8nW/IsG4Gqi2AuxDXYALZmaixUdzXg08z996GFCMCWZHgx/M/smWlxTA8xWzd7JQ4xW
	 dXqj1k3L4FS58Gp3i5w4oJhlPIJzLC4uExfNVek7J5jSMO2i7H8MuosejauiSO0zg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAADAi78;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRPkmvyL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB4606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DB4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PAADAi78;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRPkmvyL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G7373295116
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DS3T+X1wCXRsTi+mAH4YGU
	t6zEYW5jwzEoUyV6c4eIs=; b=PAADAi78HkCPSqfC0wPBNVi4IYgzf5JBuzsOyy
	k0qZmiZpr2VyDWu4k2460DXNfV8tX/OTj7vNx9ANmEqi2VKwzT+hnblsR2mzOrzg
	RZnOlsIq61FBdcNGH81XnMeXrUr4Nt1f+8Sy5NIXbbLRc4t13Hee+PG8Cs1UBQEy
	k9F7sRpTD7WD0FS1gATesqqNge5ItSdtBqnI0F6W4gydGg8qjyip/qwQSZ8c/1oS
	odIzPlDb+8lbTXSr0fWQ1LglyR2tZZa5AkPYau72n0K0ruKkFGYW1cTm1vY3c9kx
	ercbtHf+3UOK3wIwUx9Mhoz4G3bROotcgeo1nXqk6iT9N7yg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghmk2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:27:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so467233a91.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145271; x=1795750071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DS3T+X1wCXRsTi+mAH4YGUt6zEYW5jwzEoUyV6c4eIs=;
        b=kRPkmvyLV0Ms7kVt2oGcEo61AK/TQ4QqYh7WrSV2oRiocCXdQtKY/ORv9oUF2UmCNl
         qMMyIE+DtDMJlM3d1k9aoE76CETypUN3tDfhsoO2evC4qGRZYVWHKYOTARqVaEHwhGwg
         ytYb9fyuAGLyJWtbBKjjMyWJj1nTutY9C5oXq/YvhbdS0/QHkYZVztx1vtsjEBJfwmX8
         HJNiksRjCx31/q7+k7U3Cht2IdxqGlvxysO2DPvt6KJP1EcONvx0PxJFxNaYj4aprOf1
         aUcRATVzOztbWPAx0vfjoG5XBGu3B7/NaYYZnd98eSDfTLteDY9/Ylf42I1oABO9Hiev
         LIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145271; x=1795750071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DS3T+X1wCXRsTi+mAH4YGUt6zEYW5jwzEoUyV6c4eIs=;
        b=r33bwurBANsLdL0SS2BwfIv5ssMz14UnqlJMtWnRWsSUdlHUVAmLhDiwIFeQpObTez
         H0OiL6rFVB0yoN0n66CQLbQq5tvKL0mqXxdYha7sS3tdWCmaJ0r+dhBz18e8UKEqsNH/
         GlqQaEv1v6Twc9S4L/QLgqIAvRlHvaun5mBMqDUl0cgU+MQPYKarCL0EtD+rgQBvBM3j
         4e56lqJcDcYLdotaVcajrc9g40UoyuVkF4UQ8dLLetBNWHNT1+jYggawJf7hgPxktAgg
         FQ5f3atG28SYat0sRWp+m3CbwpojgaqEWMyQFYv8EDnApFVa4m7zs1pXedh30pbAR5Xz
         S/2g==
X-Forwarded-Encrypted: i=1; AL+hErFxJzNE0KV49rCUlC73DJqv+6VTpW7QSJkBrmVdUXaYAwgg2no3nPWsxCAqhfB+2nhCEsohfa15N/Wk@vger.kernel.org
X-Gm-Message-State: APuU4Z/GdSZhmbkBbwc5YR0wV6idZ5/g5KZxvSDAIZ1+4woXbscPGLBm
	3y4ydnhiVlrTE3iKpwdvVqlgXSW/EXNyVmyMrT2cwXgyjnvi+tBofFGkRU4iJKtoDNfFEcNsQMe
	a3iOyjzLioaZxZqHnDlH96p/QBspcp0ETLBb0glwspAjoXYGk0/QXQiRMz1AbgiF8p2cxBVfiHO
	Y=
X-Gm-Gg: AZFdTZc0iPRIMya97AaTfsB76xTaKrP32uCXnTY6bYut9zRqsOumm8D2H1vmNlKmbY7
	miBG0FY/GqEdzjbT+fqCXEfuA8OrzsdhWk+VAPb88yAlB8EPSZh/rcyjdZf1sfkHzpb/5iltDQZ
	6ZxfZDrjN1Kre2FM//2W9eQUjx4GwVQD6R4nfbZ4yE1rdLklsQx2BjnyA1ygK17f8iCPee58wOw
	Q6ABlaa3Cl5/jt5tL23qZ9tphmiQqk1Wh66ZNLEbfY7BvNZrdVXwXl+nP7UvNgQgrdvot5319Nh
	VceWm9Rc1d/nCwLy5wDttpH1MSeKuLFdIyOfmQgasauXpNonVlekEAVOf4GeBJDklF4ajSNt6JG
	se+afycrOX/nwEC/Z19PfR7zQ6evPBZAhlSRQ2lWFdh8gDBQicuDvX0wHGZLz94p0ruulw9WyeV
	DmXBJ73qQq4BkgmcgVdp/A7R2SbGqY5NXNTb0=
X-Received: by 2002:a17:90b:3a4f:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b41c98bec2mr1331768a91.61.1795145270434;
        Thu, 19 Nov 2026 19:27:50 -0800 (PST)
X-Received: by 2002:a17:90b:3a4f:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b41c98bec2mr1331739a91.61.1795145269729;
        Thu, 19 Nov 2026 19:27:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:27:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v24 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Fri, 20 Nov 2026 11:27:19 +0800
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABm+/2oC/43QzW7CMAwA4FdBOS8odpq/nfYe0w5N4oxK0LK2o
 CHEu89wGD2s0S6WbNmfLV/FRGNHk3jdXMVI527qhp4TbF42Iu3a/pNkl7kgUKFVWgVJfRv3JON
 lJpn6eZRlGGWa00mW4i1ZCD66Inj+OFLpvh/4+wfnu26ah/Hy2HWG5l7+D8utUsmkvEdNpvVk3
 4Zp2n6d2n0aDoctB3Hnz2AWJOgqaZgE51yBhrKGsEbaBYl10jLp2gZ0RoDo8xrpnmSDUCUdkyE
 VbUsxpiS1RvonaZSrkp5JjJhNUI3VrV4jw5O0aKpkYNKXGAsiee1hhUT4JQEU1kh+C1+pgZQN0
 XmzdiXiggRVJZFJZXLjk6LIzWukXpK+SmomrSs55Ggjs3+Qt9vtB/sdUrVkAwAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=24122;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=EeWo/MhuEN4nLqTxyzCGotWqSDNeGXl8DBhANAuDJq8=;
 b=JSQ3yclf+RFUhWfWKJHk0uiGdYU4WK8RMH0dkQf3Ib2cwfW5c8lnRwXkXMOlof1/8KsvYNI++
 bUGjpXYi8MqBKsMiycQ/z4wI74p5reM1pxqIhwpikfbTDJWVvjXVYl9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX1KqIX/JE6HgP
 3mCg65ZYMzdG+RseChlXpDB3SktMDDpbCv4ug7OzZ0yW4akAnEVz70T9asFT0dKpl9yvDc41n+N
 7jedh5iL/bmo+ZAcfrgEYYdvzJfIkLSaOU4f8QGujtvM8dzWodayg717GcLdp9MC5fwNZ9j3rVq
 i4bgym5wGUw0DMgYu1xYmabkOyeuEfeeKbyQ/+Iwsrd/KGihYqE2BdETbpGRQ+U7AdXwuDfJqFA
 TRXmom5W++GFwfpawy2rbpLHxzxp678m9fh1w+fvCrZCKwEWpq4m8tg2DQzotxAOFa0GLFnQzAR
 nJxtNb6eWFncchiy0yb3lXmmGmbwbdU+v9EZkXFMbm40kbHFTURTtvl7jUmQ++ju1CFHFaQ/V8L
 RS5slX8uWUY1Tb1nEl1asqudVgFs1A==
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6affbe37 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Z-5mNY9kedEH7sAHGBgA:9
 a=AWTiQ6kknJYosOI9:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e0qu-VPJ27Pvl2JTMjx2-rlmFRRXwuTi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX9N3cORvwjp13
 3S0IGYtA7W19poC5aj/GS03lR3T0C5h/PZ0Lu/8J8kVFhUe9Dt4z3dNcIcCqxPmm7bMk2s3fOzE
 haNN0u4NsUEhVSopFfv3b14Enw8IHMA=
X-Proofpoint-ORIG-GUID: e0qu-VPJ27Pvl2JTMjx2-rlmFRRXwuTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611200013

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the flag of the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v24
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Allocate all the nodes at once, as their number is known, and the
     buffers first into a local list, and add the list to the
     etr_buf_list in one critical section once the state of the sink is
     checked again, instead of adding every node as it is allocated. The
     array of the nodes is freed at once when the list is cleaned. The
     drvdata is not touched on failure, so drop the special handling of
     the live sysfs_buf when cleaning up.
   - Don't set up the drvdata->sysfs_buf in tmc_create_etr_buf_list(),
     it is done by the sink enabling only. The live sysfs_buf is wrapped
     into the first node and the new nodes are free.
   - Use a common helper to check the state of the sink and a single
     exit path, instead of repeating the unlock, kfree and return.
   - Fail with -EBUSY if the etr_buf_list already exists, as there must
     be only one owner of the list.
   - Rename the is_free of the etr_buf_node to free.
   - Fix a typo in the commit message.
2. coresight: tmc: add a function to switch the ETR to a free etr_buf:
   - Remove tmc_etr_reset_sysfs_buf(), __tmc_etr_enable_hw() programs the
     RRP/RWP/STS.Full for the ETR retaining them, and the other ETRs
     reset them when disabled.
   - Rename the is_free of the etr_buf_node to free.
   - Keep the switched out buffer as the current one if the ETR fails to
     restart in tmc_etr_switch_buf_node(), as the ETR may retain its
     pointers, so a later sync matches the hardware.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Drop the buf_node before the etr_buf_list is freed in
     tmc_read_unprepare_byte_cntr(), so a reader entering while reading
     is still set can't use the freed node.
   - Stop the byte-cntr in tmc_read_prepare_byte_cntr() when it can't
     serve the trace (e.g. the buffer is of the reserved mode) and the
     generic read is used instead, so the enable flag and the byte-cntr
     register are not left set if the path is disabled with the generic
     read still open.
   - End the byte-cntr reading with -ENODEV in tmc_byte_cntr_get_data()
     whenever the byte-cntr is stopped while the sink is still running,
     instead of checking the removing flag, which is not ordered with the
     enable flag. The generic read can't be used for the unsynced buffer
     in use.
   - Start the byte-cntr even if the byte-cntr read of the previous trace
     is still in progress: the sink can't be enabled while its
     etr_buf_list exists, and ctcu_byte_cntr_stop() stops the byte-cntr if
     the enabling of the path fails. A trace enabled while the read is
     being finished or prepared now gets the byte-cntr.
- Link to v23: https://lore.kernel.org/r/20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com

Changes in v23 - addressing Sashiko comments
1. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Serialize the readers of tmc_byte_cntr_get_data() with a per-port
     mutex, so multiple readers of the same file descriptor can't race on
     the buf_node and cause a NULL pointer dereference.
   - Don't start byte-cntr for a sink in the reserved buffer mode, as the
     reserved buffers share one memory region and can't be switched.
   - Return -EBUSY from read_prepare() when a generic read session is in
     progress, instead of marking byte-cntr as reading temporarily, which
     misleads the reader of that session.
   - Start the byte-cntr function only with the first path of a sink, by
     checking the mode of the sink, instead of the enable flag. A path
     enabled later can't start byte-cntr on a running sink, which would
     otherwise leak the enable flag if the enabling of that path fails.
   - Reject changing irq_enabled while the byte-cntr function is running,
     so the generic read can't be forced on an armed byte-cntr. Update the
     ABI file accordingly.
   - Disable the byte-cntr IRQ in ctcu_platform_remove() when byte-cntr is
     running, as ctcu_byte_cntr_stop() skips the register once the enable
     flag is cleared.
- Link to v22: https://lore.kernel.org/r/20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com

Changes in v22 - addressing Sashiko comments
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Don't free the live sysfs_buf when tmc_create_etr_buf_list() fails,
     even if the sink was disabled while the lock was dropped for the
     allocation. The buffer holds the captured trace data.
   - Fail with -EINVAL if the wrapped sysfs_buf or a newly allocated
     buffer is of the reserved mode, as the reserved mode may be selected
     after the sink was enabled or while the buffers are allocated.
   - Allocate the buffers of the list with the size of the live sysfs_buf,
     so all of them match, and match the IRQ threshold, even if the
     buffer_size was changed after the sink was enabled.
2. coresight: tmc: add a function to switch the ETR to a free etr_buf:
   - Don't pick a buffer which is being read when switching, so the ETR
     can't be restarted into it.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Don't treat a zero-length read as the end of the buffer in
     tmc_byte_cntr_get_data(), which dropped the unread data.
   - Don't call the byte-cntr read_unprepare() when closing a generic
     read session (drvdata->reading is set), so it can't tear down the
     state of another session or unbalance disable_irq_wake() and
     module_put().
   - Return the errors of read_prepare() to open(), except the -EINVAL
     and -ENODEV which mean byte-cntr is not applicable, instead of
     falling back to the generic read, which stops the ETR.
   - Start the byte-cntr function only once for a sink: a path enabled on
     a running sink keeps the threshold programmed by the first path, and
     no start while the previous byte-cntr read is still in progress.
   - Return -ENODEV from tmc_byte_cntr_get_data() when the CTCU device is
     removed while the sink is still running, instead of reading the
     buffer in use which is not synced.
   - Drop the byte-cntr ops after the sessions ended and before the CTCU
     device is unregistered, instead of when the devres is released.
     Each device drops its ops user only once.
   - Make ctcu_byte_cntr_init() return the error of
     devm_add_action_or_reset() and fail the probe.
   - Describe in the ABI file when the irq_enabled takes effect.
- Link to v21: https://lore.kernel.org/r/20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com

Changes in v21:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Make the byte-cntr read and the generic sysfs read of the TMC
     exclusive: tmc_create_etr_buf_list() returns -EBUSY if a generic
     read is in progress and tmc_read_prepare_etr() returns -EBUSY if the
     etr_buf_list is not empty.
   - Wrap the live sysfs_buf into the list only while the sink is enabled
     in sysfs mode, and keep it in tmc_clean_etr_buf_list() only in that
     mode, as the sink enable path may reuse or free the sysfs_buf
     otherwise.
   - Don't create the list in the reserved buffer mode, as all the
     etr_buf of this mode share the same reserved region.
   - Fixed the kernel-doc of struct etr_buf_node and
     tmc_create_etr_buf_list().
2. coresight: tmc: add a function to switch the ETR to a free etr_buf (new):
   - Move the buffer switch out of the byte-cntr patch to a TMC helper,
     which stops the ETR, swaps the etr_buf and restarts the ETR in one
     critical section. The switch was done in three separate critical
     sections before, so tmc_disable_etr_sink() could run in between and
     leave drvdata->etr_buf out of sync with the hardware.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed the drain of the last etr_buf after the trace is stopped:
     tmc_etr_get_sysfs_trace() falls back to the generic read when
     byte-cntr has no more data (v20 returned EOF and lost the last
     etr_buf). Other results of the byte-cntr read, such as the one of a
     signal, are returned as they are.
   - Program and reset the byte-cntr register when the path is enabled
     and disabled, instead of in the read prepare/unprepare. The CTCU may
     be powered off once the trace path is released, and accessing its
     register from the read unprepare, which runs when the file is
     closed after the trace is stopped, hangs the bus.
   - Serialise the CTCU register programming with the ATID programming
     with drvdata->spin_lock, as both unlock and lock the same register.
   - Fixed the use-after-free of the byte-cntr data between
     ctcu_platform_remove() and the read unprepare: the remove waits for
     a completion which is the last access of the read unprepare, and a
     new path can't start byte-cntr once the device is being removed.
   - Wake up the blocked reader once the byte-cntr is stopped, instead of
     waiting for the timeout.
   - Start byte-cntr in ctcu_enable() only in sysfs mode and after the
     trace ID is set.
   - Check the interrupt returned by of_irq_get() against 0.
   - Report the interrupt overwrite of the etr_buf which is handed over
     for reading, instead of the one which is tracing.
   - Make byte_cntr_sysfs_ops static and fixed the kernel-doc of the
     structs in coresight-ctcu.h.
   - Count the byte-cntr interrupts since the trace is started, and not reset
     the count when the read session starts, so the first etr_buf is switched
     at the right fill level for a reader which opens after the trace started.
   - Ignore the ports which are not initialized by ctcu_byte_cntr_init().
   - Updated the commit message.
- Link to v20: https://lore.kernel.org/r/20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com

Changes in v20:
1. coresight: core: refactor ctcu_get_active_port and make it generic:
   - Check the port number returned by coresight_get_in_port() against
     ETR_MAX_NUM in ctcu_set_etr_traceid() to avoid an out-of-bounds
     access of the per-port arrays with a bad DT port number.
2. coresight: tmc: add create/clean functions for etr_buf_list:
   - Take drvdata->sysfs_buf and add the first node to etr_buf_list in
     one critical section, and do all etr_buf_list updates (add and
     delete) with drvdata->spinlock held.
   - Return -EBUSY from tmc_etr_get_sysfs_buffer() while etr_buf_list is
     not empty, so the ETR sink enable path cannot free or replace a
     buffer that is still owned by the list during a byte-cntr session.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a NULL pointer dereference in ctcu_get_byte_cntr() when the
     opened ETR is not connected to a CTCU device, since the byte-cntr
     sysfs ops are global to all the TMC ETRs.
   - Fixed the sysfs read fallback: tmc_byte_cntr_get_data() now returns
     -EINVAL unless a byte-cntr read session is active, and
     tmc_etr_get_sysfs_trace() falls back to the generic read only for
     -EINVAL. Errors and EOF of the byte-cntr read are returned as-is
     instead of reading the live buffer.
   - Fixed a race between the buffer switch and the sink disable path:
     tmc_etr_enable_disable_hw() now checks the sink mode with
     drvdata->spinlock held, so the ETR is not restarted after the sink
     has been disabled.
   - tmc_read_prepare_byte_cntr(): check irq_enabled with the
     byte_cntr_data->spin_lock held, and clear reading under the lock
     and wake up the waiter on the buffer list allocation failure path.
   - Pin the module with try_module_get() for the duration of a byte-cntr
     read session, so unloading the module fails with -EBUSY instead of
     blocking in ctcu_platform_remove(). Documented that a manual unbind
     still waits for the tmc_etr file to be closed.
   - Dropped IRQF_SHARED from the byte-cntr interrupt: the handler does
     not check the interrupt source.
   - Read curr_buf with drvdata->spinlock held and handle a missing
     current node in ctcu_byte_cntr_switch_buffer().
   - Initialize the lock and waitqueue of every port before requesting
     its interrupt, skip the ports without a registered IRQ in
     ctcu_platform_remove(), and only expose irq_enabled for the ports
     with a registered IRQ.
   - Refcount the byte-cntr sysfs ops registration across CTCU devices
     with a devm action, so removing one CTCU no longer disables
     byte-cntr for the others. Replaced the single-CTCU-instance comment
     on byte_cntr_sysfs_ops accordingly.
- Link to v19: https://lore.kernel.org/r/20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com

Changes in v19:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
     and tmc_clean_etr_buf_list() to state only the required contract
     (caller must guarantee exclusive access to drvdata->etr_buf_list),
     dropping the over-specific call-path details.
   - Lock the required code block in create/clean functions.
2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a stale reading-state / double-free when irq_enabled was
     cleared between prepare and unprepare: the byte-cntr read_unprepare
     would return an error and tmc_read_unprepare_etr() would fall back
     to the normal unprepare path, freeing drvdata->sysfs_buf while it
     was still owned by the byte-cntr buffer list. irq_enabled_store()
     now returns -EBUSY while byte_cntr_data->reading is set, so the flag
     can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
     additionally guards on byte_cntr_data->reading.
   - Moved enable_irq_wake()/disable_irq_wake() out of the
     byte_cntr_data->spin_lock critical section in
     tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
     irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
     be called under a raw spinlock. The threshold IRQ is already
     disabled by the in-lock register write before disable_irq_wake() on
     the unprepare path, so no wake event can race in the gap.
   - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
     single-CTCU-instance-per-system assumption.
- Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com

Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (8):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: add a function to switch the ETR to a free etr_buf
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |  13 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 484 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 200 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  94 +++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 383 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  45 ++
 12 files changed, 1240 insertions(+), 78 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

