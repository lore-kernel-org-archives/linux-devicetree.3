Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556366;
	b=0ucLe0GTZmmsG8Hv9a/jtXAfiatjStJFGLzlt5XcKrAplVK8hi3L+e0j6sVfERqW7ug1
	 xiOIk3OsLzBJE+CB3XB2qqlBL9fFyrxvkZDog8kELhHCKlNuhP8s6KOZ68/1EwIAIsBK2
	 KxmjxObMKPnZdiyK9VXSWUUBSGCahfXSO/EC/C/PvuMMPDZeZakr5XfIeXV/Vj9p4/ymH
	 yTu5WCzYkfQqa9yb4tThumMtcPW65BejOfff+C+sm/TCqcx1PlfBuTcz70O2EzHP2Cpek
	 8MhwuhO6J2xjaDmmDY/pIUh02B7SVwp7KSu1WP6ROF/mAvqnUk+KeTw0H4JVV/K9XTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
	b=dj73qBJA4EOPvvYZspkt6IbycVsBEcexIGJnTIyRi7g9zbH+JvIWuzrIDu/0A97jZ9BG
	 bgeYUdyR8uA9x706DdIxjiz943AweSm3qWU5Ge8fgcWnKf9kYDaMv1mobyON+7YT5+38Z
	 9N9cpvxdb+4U7QdgdG4ekUHWNmBh8Dvzc7QLLdwFSyi5Ef/RxmiTJkGIWACjJFkQwhc6l
	 1KLv9WQJN8/G8oSwPxjUH5Z6WnWHWySCBB0BbDo1sxH/Sn2cckXKE5kgIj1cQJA6r3QvT
	 KuRGaanv0bWCdOtvsu0BXxp0DIGwy3KCNsLI3sbaM9Via/OKmSolihT0T1gPfzVvNfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOvX5rj8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYAwSlyE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8CE606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOvX5rj8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYAwSlyE
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Bn5073465
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHScfnAlgv/UU4jIpErgd
	kHU0rjdQ4KpLOK/M0xwpo=; b=LOvX5rj8Uo/qlLqAiiV4PNj/a0Md5t6hu3qUUp
	rWT9FV+wFNrEw5rzO3+UpRFC9sg6NGz2qk1baMtxmURtOtPkJGlgnSKQN4DPoMW+
	i4otZMlhviAluu3K1WG/TQ/2fg26QRGA8sYkncxAKB+iX29Jt2hVON6vJSXhp4AV
	8SmCFXhnuf7PvXmuOyLZvg2UHKseQoT8mI6jMR4HPSOdpcpw1HuNigeu7QAA+mRS
	Z93KDwtTHguwFC9a40sejZdNs4DIKwpdj5m+BhiPmAH7CrTSWJYqnZu2zT2lY6Wu
	7fHTAwMQUe1JwDhzDgw4v2/DC9jLM8Jfh6OXUIHzVuEsbg2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs04329-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b19aa066afso631467a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556363; x=1795161163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
        b=hYAwSlyE0YZGGYC0him9UTiKGsqEQLy16braZeqWab7rA2q6XBCVspPqUj7y0lPxAs
         7xQol5QziP48aEW/breewv9ViOKiZzU4oaOANJ161hP9xv2ia6wgY13kf0hz13VsnLFb
         fCmiZ+780cYL1VN5jBe8NVwaS7XIYrkT1vfKmVSU0Mc0fltRjC74nnUAtMPV7fSuooky
         YeCOoW/+130CRkYRKmQyAr8sPEnWrI9lhSjDlnwEkAy4XknmygTA/jZu2MFyOxPo7bxb
         Kz1y1Ptdbt9e4oV6Q/G0MTZ2Vj0HIdU9mx7WBGYkPW/ewp3gK5M82M1vthlDc6axMHP/
         RLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556363; x=1795161163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
        b=Z6//AFj5OI+N/Pe0zyH3tdFAmn85pRUn3V+iwUKBG8cmZ5/7XDPiReTN8LtuWgXMzi
         2sVquo7+4Lptqnbhq+MvnhmZRLvD7f+I4uXj7siwyfhluulJnFu/15amMU9GE++Xnr47
         FQoQKq5F4ASVA5a9WoqGzowGnfKVGP341eCfFgDGaS6bq5VR48q9mbx0G6Fnv8dHYjRR
         PCwE8gtXTLSvardDKfgnfHDfPVOVqBbIQA0fAj0o7K66ElCLQOU9GW/yunrMzw1VGdRc
         Fp222dbBAEy7HdrOAHuy2hn2b1jXZ5dNlmKHVcp2dc16bm183YERPmTynredakHcgPe4
         uXaA==
X-Gm-Message-State: APuU4Z+SxQqlejpykuNrAlG4UilLj0GDMFb8Vnp4OthNAIW0jQXpaqIU
	nuLLlGCvw/JvtgCq0Pg4JN9lBucXeuseVm+4O9C8r65e6KwVhMOSBwmIh7Z8T2P9YwWoVWOSZxb
	VSYneAdtRWwruNKBb75ya4DRrODmHEVNXkHjBig1VnNzXwFfsXmUPUXrWmHPMVgQQ
X-Gm-Gg: AYBFou2/gHltztx1ZrB1q/HK3bKFcoJcOpHcVtrYO5I644muvGpLlg/LOUDfm0njy6I
	9IQFvrWWDyAOddqwEzeySAhE1r3JqDs4obGAffTS3QnjbXYtwCqwsv4bDzAClnlqqy7NRLt56oA
	SUiqClZjXa+qbBe9X8kud+o2yVUSoTw1S4eEU0zaJ71mwBsWD3rAmny8hhLsvPyAAhHONucJwMI
	UomSYGjSrGddxeqmTT3uIODBMp71Bp4unnXanzjK2J4uaRFcWjXOzk7+jKZKnF3vDX3aBOi+lb+
	JuLlIxbGWhfyq86frHnfMZFHOwSOQ9OoB+shlB43FJ0bD2q46X5sFvkAuEYvNzmNXyIbSMIDN+0
	LAevkTBNUadiLIlBd5p+kXTP2n43nM7hqo1nPyzDvmYkglJw/08awdqZUxKywp3uzcecTWJMCu0
	ymIJT5EcrGnjUcgI5uXHz0IwnbT5dE+PH2
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr1020769a91.37.1794556362717;
        Thu, 12 Nov 2026 23:52:42 -0800 (PST)
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr1020758a91.37.1794556362256;
        Thu, 12 Nov 2026 23:52:42 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1277107a91.1.2026.11.12.23.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:52:41 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH 0/2] nvmem: Add byte-mask support for non-contiguous byte
 selection
Date: Fri, 13 Nov 2026 15:52:35 +0800
Message-Id: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMPB9moC/yXNMQ7CMAxA0atUnrGURFAKV0EMaeKCgaSVHSpQ1
 bsTYHzL/wsoCZPCsVlAaGblMVfYTQPh6vOFkGM1OONaa63BPCdK2L8LYfJ6x2EU1OnBpTL4GAX
 9tj103rrO7PZQO5PQwK/f43T+W5/9jUL5hmFdP59jq6aFAAAA
X-Change-ID: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556359; l=1807;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=2mY9aI5E1G4zfF2F6CzfWvCpn1twV8Mrl64m5MG9Gys=;
 b=2mP7NFpsZDCkfE2NIgOC/RzrgW4X2MTp9Rf+ktGnOIK9nP4cyt92QE+C5APjQ5wA8+s87s9zT
 PayMQYieLo9DIq+TBIHR1/DaMi04f6rm67Schdy0ai+8JaC8skVhC4D
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXyhOGtcsjD8te
 OCoJC1f7iOIABlBbmyDwkkiBgVC5hCrD20fE+iUattaoq29xtkc4CIZ7QYD6roIOfQY1Gbm1ySg
 uIxSE9Hhcdzv/+yFKwC36sFsTuNHK7iw5MJKLZ8KA+Ma8mAyDkH1lZ3xPFM0khfZiKMx2xaUZz6
 dKAVFIKFChUEJ+wO8ZjN3zfmQIRwh3+kcJnHbEi3NvODsCKAi1xY6KC8fDdyqY5R7jAIFHMTWEr
 niGHVtdz7Fiv7H1GOP7uvo4KVkYXS6c3Kbhr7B+ApbmQV3C2oShNnVtv+i/9lGpdKgfLE//aYEY
 iMKpoCye4hRI339mhTpSbGt0yTJDcALNZniwY33o2n03W+TshNTZVpejLwcsQ/T0l1/vQgqp/ba
 Lq2zZ6vZ0UNG3W/SIJCE8Y/xWIevq+GMG9BhqCiywILok7F33J6RRwGjiot3zdUchGSQlhOG3NI
 0PO6SrZER5/nbqU3pBQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6c1cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Qa36SSpCRuh_uTHRqdoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX0Z3sXYBWcxIe
 3bHZ+BiHwk6/WKof9qrJPwHaKZ8OgYCMRmBCrchwPH3rgspELWe544+h83A5Q05vD9IQg/OlU3N
 YqyORuHkME2GZ6CxAVMEwokY/RbTU6M=
X-Proofpoint-GUID: YyBDh9uCbn08XBLXpFDdOGl3kY6z0aNB
X-Proofpoint-ORIG-GUID: YyBDh9uCbn08XBLXpFDdOGl3kY6z0aNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

Some hardware stores NVMEM cell data in non-contiguous bytes. For
example, a MAC address cell may span 7 physical bytes with one byte
unused, requiring the driver to skip that byte during readout.

The existing 'bits' property only handles sub-byte granularity and
cannot express byte-level gaps. This series adds a 'byte-mask'
property to the fixed-cell binding and implements it in the nvmem
core, allowing consumers to describe and read such cells.

An example: assume a MAC address is assembled from efuse registers
0xFFFF4320[31:0] (bytes 0-3), 0xFFFF4324[7:0] (byte 4), and
0xFFFF4324[23:16] (byte 6), with 0xFFFF4324[15:8] unused (byte 5).
Map the efuse region as an 8-byte nvmem device and define the cell
skipping byte 5:

  efuse: efuse@ffff4320 {
    compatible = "...";
    reg = <0x0 0xffff4320 0x0 0x8>;
    #address-cells = <1>;
    #size-cells = <1>;

    mac_addr: mac-addr@0 {
      reg = <0x0 0x6>;
      byte-mask = <0x5f>;
    };
  };

  With byte-mask = 0x5f (0101_1111), bytes 0-4 and 6 are selected
  (byte 5 is skipped), forming the 6-byte MAC address output.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Hongmei Xu (2):
      dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection
      nvmem: core: add byte-mask support for non-contiguous cell bytes

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  22 +++++
 drivers/nvmem/core.c                               | 101 +++++++++++++++++++--
 include/linux/nvmem-provider.h                     |   7 ++
 3 files changed, 123 insertions(+), 7 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

