Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988973;
	b=KBsTpy1aNQ1qxJbtqCJ1PJt5nL88HVaXMq2Qisp+JlfVqfiWA5ml/TNn1+TvKiqFw2w2
	 GpIp0SJnl1uNwk8mxmw9XwvImcY79NzMpsTnzAe+Y8sr1CwNBYMYuMM8V7inhNRafg8wv
	 YC4aGklzDlkXgQmOxxxOtnnyTSxutDJDJLfyAFJDa4lxcG7JeeqXok0mtyQOVdxW9xEE0
	 Dh0RfMTV+uZphKbn2XK6R1jtmlJbS+ue8pwMpLSI6ilWhzadBKo8GYiCta6cnD58HcJ5O
	 rkte5XZ5Mo8LYax9bMj4yQUA09seNzG2wHADX2HqKH2OHAHk25HutDNOBzfTbsnUHMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9STkzjMVjPIpNxwH14oxTf/lz6PUu5XTyHSrAn25HYc=;
	b=LUsTkRom7RRzZUXoH6ZN5yc5RXYQJLNezILIgRLq0Ot+Te8uFR3Sy9Uc7QbU2QMzKU01
	 iMpjzAlKHjJzuzO/NKb5CR03acaSIxJaoBMQJedODCgLNCuiB8wd3ywKzVloFNm1AYv0R
	 QyjF9IViBvag53KDPk+3MhbdcaGQIJ4RgvnpXPEkoI3F6ACau2VFfykHS3FrhqvOnT+lz
	 7FmYAe6hhg6NHrA6I3H59OOH51pWMcSEwDOckoJ+t/JYvX7rB1RBul9tJVBeNGZ7A1mpI
	 FEt7vDIekg45MEycubf7FdENfl5mmyWXGF1eaINjduS+WBblBhd1UriCqKRdZfXwHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/NE09xO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5U5Umxi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D70606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D70606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/NE09xO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5U5Umxi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3u6764123
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9STkzjMVjPIpNxwH14oxTf
	/lz6PUu5XTyHSrAn25HYc=; b=U/NE09xOpic67EPBgMqeDBe6+cnI+mM+HEAc0o
	98oqYyNoF7jIG8VCjhKgN9lSy1yJabhqOTSjbuyzAvi3Rv0AMe+YHTOdwP/NzEN/
	89hG1mxYi+vgus9PY/ClM5cXTwq+t5b1+NT2Pc2TilO+Xhis1LdOg08OQdAwUGn5
	1Vf97c4ox+MnXv1tpmPPcea8+ylFFuqgUHq48lPQsQSkXjDJpEgwbZnYh3TzAF0B
	ndTM6FVGMAMfQKLG796rn4/kpdx0KIaT1cwdECWK14RFVHYQ1Vy5BT89OowQUGIQ
	5A6MdE8CTeYgtJ+8WPGMLC73IFCCdEbBzFkrwzYUKwvH8uYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9xdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:02:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so709998a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988969; x=1795593769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9STkzjMVjPIpNxwH14oxTf/lz6PUu5XTyHSrAn25HYc=;
        b=A5U5UmxiNJEHiIUYp/t7j5xENiOXDPH+Qs0GoxGhGR/pKUPwHkp53efA0yt6dOqIZ9
         y1eucjjjRg9rthCFDQmzoT7W3EiOBzjZTHVAL5XyYFBTReZErX0xsGS8Td43mQujG0OY
         1IHd26MAuUPbQ3RNXEg/xOoiaAmkyzAElWjYwCCtXmSsztdlNS3LLN4mmQRrjglAR700
         IEVXdDBRM/Vb88ODBVXO2sQ8K4X50dhDBtIXnhilc00hZHYfARoZhkKcbxmnOaBjgkMw
         ONyRYk68J/H8rcxD20a5XLvP3k+Ho3jvMZuOwmFh33jRrsIcB4jpvZ7WN6D7ygf+wfop
         uGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988969; x=1795593769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9STkzjMVjPIpNxwH14oxTf/lz6PUu5XTyHSrAn25HYc=;
        b=Afp0hEOPxpE6Totc/QMvKHjmk2gmFRabMkcFKjPCpsEZ6BbTYJjT8CPbeMOOXKCCQD
         JOCM9E2uCShaE5QG4oj+pOcwq0UJO5kGNAPZiv2jKJI1ZuzjkcjnT8qpFHccAESicqhN
         lnL5g66VqQvrb6CTp1EVcqZLQGOsN1GAMpIJJM0DdpHOZYd659svxW61G2DmHcinCkNf
         wDya0tBtXl6Da/c4oOg5oD0b0h7gm/WWZ5orgKzXnshY8fAj59umEwns8Fr50htg2n5d
         eiQHfxKWYDl0QDDSTlVZnx8NaHnGFqnNq01nwIx6dy46OVRrKeHPjPxpsAnh1sg2bigM
         oOlQ==
X-Forwarded-Encrypted: i=1; AL+hErHUuWewO7VLGGSIM75oICnsJEHt5jCwubJx7BERa4Ou/fzdmiVgfnUw5+mc4vFL7MX33W9VJ9OtWBd8@vger.kernel.org
X-Gm-Message-State: APuU4Z8hHI2jFLx97mVI9iAPSdXFfAfIKEX9Niaaq1LPAy0NvNPM2/he
	YCBRIufCGMPsVTLvMHd/0V/aRwINkd4+CPHtnrAjXVVi5Z9np0ATYFFnpBzptJPiXR0mu2W+Oic
	loeeGpLuXuqtYxG+qO7xxlCIls65FUZNSJ06uYFkqbu5XUJKnsNLp0HnJfwUAe28KD3xCy5cC
X-Gm-Gg: AZFdTZcfSMwJqKUmFxjZyV5AJL67kewZkj9phd5JaOhiw0tciad+mx/qmiP9/dVcoR+
	D+jL0AKXzrrLWbTGIpsjAAjSoaQX0IWT1WULJSGJ1uqP8DkL1mDxRItVG4DV0L0V9xLq/LqohaG
	F2/iJefUavNIIo/OgA0OvW3SBzl67UhT161J8auHZfGrXsUH2WIjBwq4WarYj0fJaySM3ujcqEC
	jpH6fP8cw9NfOC3xWLtdPKQZG21ytyao46+od3l5MPuAb3O4L4Uh9pKlnCslBEfiestgnsCFaaU
	Dbk5FzychTBFy/V3OmDUYpOmQuL+++gCkr61SVPntZMnUk7lhfI6wp4KCWcfMhI1RLxcI8O5Qdo
	zCAk+2BqZjj7RfR5SsxUhkIy1BrZY0hFH0OfBCx4/2hcKeiTPPTYaGFztatx6umjFT3Un80qQ2m
	UtGNlOa3OV4g4rUbqBFkBfwDruyj8UpmwxBsPz
X-Received: by 2002:a17:90b:4acb:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b3d07a85damr1899942a91.26.1794988968410;
        Wed, 18 Nov 2026 00:02:48 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b3d07a85damr1899913a91.26.1794988967748;
        Wed, 18 Nov 2026 00:02:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:47 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v23 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Wed, 18 Nov 2026 16:02:21 +0800
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI9b/WoC/43QwU7DMAwA0F+ZciZT7DSJw4n/QBya1GGVRgttN
 zFN+3e8HdgONOJiyZb9bPmsZp56ntXz5qwmPvZzPw6SoH3aqLxrh3fWfScFhQa9sSZqHtq0Z51
 OC+s8LJMu46Tzkg+6FPLsIVIKRcn858Sl/77hr2+S7/p5GafTbdcRmmv5P6y0aqOzIULLriX2L
 +M8b78O7T6PHx9bCerKH8E9kGCrpBMSQggFGu4sxDXSP5BYJ72QoW3AdgiQqFsjw51sEKpkEDL
 mYn0pzpVs1ki6k86EKklCYsLORdN429o1Mt5Jj65KRiGppFQQmSzBConwSwIYrJHyFrnSAhsfU
 yC3diXiAwmmSqKQxnUNZcNJmv8gL5fLDx6GTGgRAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=21213;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=oBjgcuIWefpYSIGsd3+0ieAvnv+SW9ptcyKk37BdBYM=;
 b=sBqo40OqAutsadET7iYtJLa2o7bd9ppAbLy95ZVogop/BzpF07kY6spS43MYBKF+BlFwA+woF
 cVj8DjFSsSnBfupejW+LaPslabHPUcKuMK/ws9nup1YANup6fCvWRgR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 9OHnVQpTaLjjLWzLuvGt9uwE4JS5SWDt
X-Proofpoint-ORIG-GUID: 9OHnVQpTaLjjLWzLuvGt9uwE4JS5SWDt
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd5ba9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Hy0OcOPEQyJVgBM2-xIA:9
 a=4uj_v9FCr4GVyq1V:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX0HwBKIyeco7T
 RfpmprKHYc1jwUacCAiZCHstGcpJqtAlHeLOD8hJkzIdfhpZAOXK16aXXG4kPtQxEwlmhdHTZ6K
 I5Ji3ywY155asJqZiDFFJVtsDQgqtsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX3GIRrd10UspR
 ECIYQ3JsEVmo6LeUSwuitAtjGTwHE4epeoFoDEbalg/Jya+J6NHh4GNVU9JnH1nFHWsgt8cGIX0
 /A6kPq8FetoNBkJqmPsJiTCGlaOeyIxScDUZF2n4DZPOtoZQBASkECQuNINNBRTTEWz1PGCSj1T
 5JIa9F+djE80jhbGQMyPj6PWbekY881bwAKsO0ugUWoJkI432mkdGx3t0Sw1CH4VbX++ve/B+Ty
 fh26O11IWpUrggyXbFdaw8iCSlX5n5lCtPWnb6clxweqyvmgT0W9DmMj9rwWAmDZIs5HLmE6czr
 PIsGUeowi/C8tIdt+1M3hCzHKUUCaHqmgGzoPxngHPv1DcVG4MfGzn1+j/DNzRkanTyyiyFmH4L
 GzEpTsYuDXrdWHGRybGr8fNo93+3GImxMcpFcww46fbk2m1PB5s+kwMoJfaYEuArsEm0sovMliq
 9ROJ1oBT2MUkH5XQBWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

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
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 465 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 200 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  94 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 391 ++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  43 ++
 12 files changed, 1227 insertions(+), 78 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

