Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895486;
	b=5hhVmoT24V+nj7EODHOT6cN9Iyl8Vh6olhg1f0EddX+9HxHGIMT/gYqAtHe5Mql7xQKv
	 Doj4qAr97YGHj/DC59b3kjS+ix0YVo2JPtO+neEVQhmYtAWyeP+NdN/ftd9Abt0bv0hq8
	 SkOiSk9Sfoa79tM8nBhl3i8bKGOeKwJy8sJcV1MBS9OZpu4RPXBtVevCG1ZiXuHj4lkZG
	 IoEyzruvrQYL04rZ+xPMGMA5np+ujBJdjIihtucL+67/uycorktkUIbtA+3j2p+lwyaHB
	 air53j3yEFOwoDw32PgbGShe4hjWKK4oP0Hkeip/Lglt2MGNIVLaDnRBpcwng65s86g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895486;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
	b=engr6r2Y3K19fGMvlV8/EmfskFnxabbyeWjt1UzmsIIHTRtWuJ32nXifU5xDgvx4M/cP
	 QjKbLgKvkqbL3tquPr24jkm/gAeDBam1LI7ZpzYLdq4isKOTJHFZYPwd2UZQJ+XqMnfVu
	 XBgmAd/AeEKMR8kZO2USU4/XhxpcRfAa0lyCWZ1x96nl008bCb3/a49i7l8cWMF4qA7NN
	 n3fC+z6BPVjETyVobTA49hwFFzGUYHo5pWP2zHtDf+4W0Ke5efKP4Iyh9+X71Tj8wzrVR
	 3WUA5Jh9aERD9+fEs6bfLvg3avF1RxYeH5PpR5CBgn3O9639YPD/+JKA9i5ExqWbc2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeLcUwdy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="He9vVrC/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A5606A338
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27A5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeLcUwdy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He9vVrC/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53GDp3458198
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8z5jz5ju4eTvMH/Z7NpLz8
	A5PlCsPZS7bWOvvpNq6zw=; b=YeLcUwdyToszOXgg0Xaa3xkNJtBs67w92wFgR3
	WRAUqTdgjp4oJBLcXcp03EbD9EZ32ZJTIdY9XzZxRKQzcrufLjzX+OS/W5hqBjgb
	Tot7pjx9xr6ZIfiyopF9LhGhhWLF0jIoozlfH9HZ3Qyv9SuTwHntaAN+EHZz7WPw
	jw2+mf8M/K2fq/rfn4+r9MWFRdSQKpks3uJ4EFrrfi037K/ULM/IKCvK5RqHDuo+
	DkH+a2E1SiHZLHLoZqkYvQW7RGtPBkWpZNJUFWLL8rojUXlprCvkieAAxhwPR0d9
	V9uLKKJFCeLR4sGPt9b6zz+mFk58e9pnLFhQO+51xU6aF/yw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8696-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:04:43 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so5098709fac.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794895483; x=1795500283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
        b=He9vVrC/jkqmw8YZk1j64TIzDz19JgkrneP2bSo5DVk/8uy38EK5MYmYAXRIjwCWS1
         qk++ynfsKy62YoV/Uv0ZllSEnZbo2jOKBQsG8XzhCjTP6pjMO33o3ql/AxCjDFpSYhDQ
         UncHsOBQBZhLkjd176merCatGhEoDLD/kNm0MxwFTxwe31Y7tkLc5riVELQjm1Rfeddj
         jcPhkWBySG8y0jzF5K2zXjQirXh59YwSncra3TGYgK2wQ75i8lf86ZeK0FI8YuKm9mYF
         xGZDg/+ozmir7XXkulvk5icnjyPDlEHGu0/nlPftVrXnztNBMT6ajImR8uCfkAz2Qxki
         W6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895483; x=1795500283;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
        b=GAVnkpQ6PpCri9SEYKZKxOQUNDQppg5uQsf3JEx553023MRCO1xVDMNfNW9DwpyHHq
         9rvS3b2GYzNpJlCKB4EtgBTvKpki0n3ps6EljPsCgCczPs3GDawqei+E5C2988WI0LR4
         G7z8+2Bi5D2ZdNRBgyMOkj0KXrqOtWyeGeYwiUQw+aM001zdt5rMTJ1tnpQhvO4nc1tB
         DTR9cnUhC1NyF7EdtCDElw5bXjutZlPcp9nUwSQWldnuw7Sgm46A3EzI49wqMye4WdBT
         d4Fq6nkxlznZp/Hxt+UbfYc2QGoorIUgNEHAvGJT2DNAJJE7DM8PKS3qGbyJDIuvUPAS
         YcKw==
X-Gm-Message-State: APuU4Z/COuHWXU+shXNFDCqGzXFxyCHuNNkVbpSYG8VExmaee9LEJ/FG
	iF8dYbCbOcjwN8y1iwBAnlXdpTC1Ehl3hHf0GpQN8fUZkn/kQ6Q6BxC53KMgWgPsLGNoy6+VHWM
	R0UobPJunN8g2wyRyRFO6e8TXMhUCl0rRKER+6xL02LDREp5DlLR1KI5IqUy0rJog
X-Gm-Gg: AYBFou2HMOESynQZg1vLGyjkQEQWyXOfhms0W4+DorAse4FrC9S6Vuds0E5R46IrEjC
	skTKB7nsuS17hW3M2D640PjLyACRXtBGlDFLkDLQSZcNDf8gi6m2XygHqXpMPGASIzhVTUa8tGi
	bk0612bcDpLm+Vf8hAjeGcFHQROogWk9s0oz3G4fPV1G58AXo9IKMVVKyblRSHhSnWG6ujovc+g
	yWu463J18ADyon1Dqkf5ytdoeqcacgiNUgaEIrSLALLwuXAsbg19Gq5wMK0Q0Zo92jZOCNOSiBb
	Wst9Wi1BcQ46vq0FyQ0JISodbj1CqpPV2I/sidS1C6DZHg6NZfcjequw5xYugsiPtZF5R2Vnus7
	hHijjmqSfNeeocGY3XIUY5NoK8TOIcO1k6pVQdyHcV2C4qo+1u2IEO6dt7DLixpOtBWebK2h1i7
	fnfhWJ3qgG2/NnCVuQidZB8x/KW/FcwRWQ
X-Received: by 2002:a05:6808:c236:b0:573:8745:a983 with SMTP id 5614622812f47-5738745ad03mr6276250b6e.27.1794895481174;
        Mon, 16 Nov 2026 22:04:41 -0800 (PST)
X-Received: by 2002:a05:6808:c236:b0:573:8745:a983 with SMTP id 5614622812f47-5738745ad03mr6276240b6e.27.1794895480670;
        Mon, 16 Nov 2026 22:04:40 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11903464b6e.7.2026.11.16.22.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:04:40 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] nvmem: Add byte-mask support for non-contiguous
 byte selection
Date: Tue, 17 Nov 2026 14:04:33 +0800
Message-Id: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHHu+2oC/42OQQ7CIBBFr2JYO4ahFdGV9zAukIKiUipTicb07
 lKNiQsXbiZ5yc9782Bkk7fEVpMHSzZ78rEtUE0nzBx0u7fgm8JMcCERkUObgw2wu/cWgqYTuJi
 AurPvCxrdNAl0LZdKo1B8vmDF0yXr/O3V2GzfTNfd0Zp+FI+Lg6c+pvvriYzj7tOr/uhlBA5YK
 bfAuUNlcB2JZperPpsYwqwcNmaz+BbLf8SiiJfS1ZobroSsf4iHYXgCTn/oekQBAAA=
X-Change-ID: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794895477; l=3437;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=sKS0bpLc+nWqs97ul0E6mvJlQy5l7TL0Tm+7/6NOoeg=;
 b=CSq9Yqlsc1IpPRHtINKW5yEAoxVspRg1mmSCQT0CFLIAuSAHM6M994xf7ozow1QzKKA83vm1e
 Gc9yVTFQ/viCTRzuLY4M2xMyl4YIGQ8AZ5C7kwvEEe9La7ocwhuk86C
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: WdVhuzuujteitukZxMpQv3diqzLyjUB4
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbee7c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XmgH6ap6i8K7Bl7ZSpsA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: WdVhuzuujteitukZxMpQv3diqzLyjUB4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX0NIfLopVO5d3
 /3cHYN4Sq7j+R0VZccd4thRpcDocbTmVxqUcCtS7Jfl4t4REBLKyqE1ef05HoIDnJnXvHpfAWPN
 6qDPguh/U3g7hu06Ijfd0BOAD7iap10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX7iMVgIU2aDtG
 KyiuPqpdMmEzHvS4JCBONScrMw59Rzlg54QTJOGE6LNdUbIAkay6LYOTv4tliIOF+Jn2ok6eZk0
 qdm5G6yxQIXkRT902pc/9uinEWwuKWrUVZpAp+a8z+grH8y8GkgOYsI0GGGJgoM2/aoOF++pQcT
 40CJsPHvNJWgVFSBszLutuMidIS5xtf3jHdqSsV2+SKtvFBpD0tD/0GBqAiA0bd5Tr1CnBykaBg
 /U9V59ZEAObjOodrwryeQ3gtWOZaKl+Bx0Gc0/RK7uBfenHa/QMWQOVK5i08qk5SHE3WfV+L12j
 HU+M3waHBX1SyvXNiz6LXwkMEtgo1a4m7O0jy7rnia+8ZhnL6NS0q3UAr17aGvsFPuk/mfM2Frx
 cEkfdXUVbeY9XhzyxIFPw6r8pdf+EuULCDeR+nu6SZjuO76f80Wp/q8uWXKF1CkUfMcERnqIGDM
 anp3KcdYXd3FSV23xSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170023

Some hardware stores NVMEM cell data in non-contiguous bytes. For
example, a MAC address cell may span 7 physical bytes with one byte
unused, requiring the driver to skip that byte during readout.

The existing 'bits' property can only selects a contiguous range of
bits within a cell's declared region. This series adds a 'byte-mask'
property to the fixed-cell binding and implements it in the nvmem
core, allowing consumers to describe and read cells whose bytes are
non-contiguous within the NVMEM device.

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
Changes in v3:
- Align cell->raw_len to word_size in byte-mask branch to avoid false
  unaligned error log
- Remove redundant nvmem_validate_byte_mask() call from
  nvmem_add_cells_from_dt(); validation already happens inside
  nvmem_cell_info_to_nvmem_cell_entry_nodup()
- Fix DT binding commit message: remove misleading "multiple reg
  entries" comparison
- Update cover letter description for bits property limitation
- Link to v2: https://patch.msgid.link/20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com

Changes in v2:
- Move nvmem_validate_byte_mask() before the nbits block so byte_mask+nbits
   is rejected even when nbits is set (mutual exclusion bypass fix).
 - Run nvmem_validate_byte_mask() after fixup_dt_cell_info() in the DT path
   so the provider callback can adjust cell info before validation.
 - Set cell->raw_len = fls(byte_mask) instead of nvmem->size - cell->offset,
   limiting the physical read to only the bytes needed; avoids large
   allocations and read failures on providers with protected trailing regions
   (e.g. sec-qfprom).
 - Tighten the device-size check to ALIGN(fls(byte_mask), word_size) so
   word-alignment cannot push the read past the device end.
 - Zero-fill output bytes beyond the last selected byte with memset.
 - Simplify compaction loop guard from i < raw_len && i < 32 to i < raw_len
   since raw_len is now bounded by fls(byte_mask) <= 32.
- Link to v1: https://patch.msgid.link/20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com

---
Hongmei Xu (2):
      dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection
      nvmem: core: add byte-mask support for non-contiguous cell bytes

 .../bindings/nvmem/layouts/fixed-cell.yaml         | 21 +++++
 drivers/nvmem/core.c                               | 95 ++++++++++++++++++++--
 include/linux/nvmem-provider.h                     |  8 ++
 3 files changed, 118 insertions(+), 6 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

