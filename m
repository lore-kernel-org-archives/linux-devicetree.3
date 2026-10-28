Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188077;
	b=u9Nt69Wi/8JQBDqkdoDGZ7k+Tez2OkBjmNMxGOuoXfmDXD4fEcuCCtqmQjQiII0S4RKH
	 kPk7bkwHA1fsWLntFXDMleo+7AZtp+IORtMYIz9RiVi4+ALGHtNlS5+4Y6DZJUV0MXlmV
	 +LBDleMaqbVI5JAEObok8zgnSUaV10ZjfHvLxkQX/nkdFTb73cMEEkQZISi/JXNT0pW0w
	 WY3VWMvCNmle3qdAgFA+lPGyKnp1LMxhwUayMw5jXrfoCCjYAD027ch3CC7AR5W16rPxN
	 PiKOjpU0BfdmSoVOGOyKSk4sGkbug9zm/PnWDw0yAhCPVFBkBUYTXn1mWKtujs3bDSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
	b=PHhax/15CZ/mpLQAlTz9jpbj4ufqIAI0N356rc8iqQN6eMpDkyCB56qGlAs3Yx8lvHVv
	 waqEZBjqk0z7S7CwvxH/8/9sLr01FGrblPbTpPzKs3+ZC0p9eu1Msmc1n8ZAxngp60rym
	 0SlV+/Tapk5/WA4UeQ8sE5jPyKY7zvS6P9tIkJFZihi+5PYxaKWe7kknHg5Miqk6BqPYv
	 XPbpIEl0/zkivGPfnEzzYHiJyg6YYpajIoiIT/3wglro8V5oA4vhkYM+ZxmrwP8XrVfb3
	 0Ede2WWxnDzkPjMPi7QgNnuhj1WRSHqta7vkY56Kb+gQ35WBYOqEGoZofBBlagynv/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UGyCaqoH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C7606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7yWPNL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UGyCaqoH
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdu2r137571
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=; b=c7yWPNL5Vbl5HhwF
	Y9kLuiFzcg/+wthv122esAhjKD4S/YIOR/5NgwWKmWr3JcrQM0Ajx/yo1okU+mvr
	LhXx9Hr5Xu/eYhRyYOm9JDbrICGFnjsu6jF35KlFgWiYOm7ZDxC7n9jlwfsKWKb0
	DZnB0aTzTPURelKiYnZy/Y2iDio+ri0oZIttxcNZJCpJkMyABcmVn0cY6iT8ywqM
	AZbCr6XVBiuw8HWmKyYGX7KzcFvvfG9D9PsPK+mRGlFl70AnUxQybsLT6E+swIZo
	WQ8iKdHh8U7Qmoiei8i5l1raass2Hi1CB+T3zWQ+Q94YC/0CXhSZCQ3cSa5uIwKX
	AVl3eg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92891-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:47:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e80f7acc67so10318795ad.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188075; x=1793792875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=UGyCaqoH2h1dDcvtC+POxcwcxZnx0lg1bwOgPCwx2ElTUtCYEXBYcWiIe5rVzJoKnM
         SjtLySJWMylkT/A1ZtQ0QerO0Lk2p718PK4Y/3ETtiBFzFqwgBzhm/imbThnShmokjAN
         q4FAcwNASCdJ07C6hM6qsa3y8WLYhDiQTGVy9LK+9b/qDUm5cNNlBEZZB06JXG8ELQd/
         owOFPIZctv631ea9YH304Si5BR+u7gEJW6XnELfTd7YrlIWYskVSymB7ozuRXOWgFNw2
         c9nNwmbli9NY8eDqdh59oC4whvPrupxH+x+qIgE00TeovfHl2VsuHuvkYgyKrXXg8Iir
         V4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188075; x=1793792875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wo1UYv5JK+uPW25T9Fc/PeGR70o5WB2JQ5b3Yx/SJ9I=;
        b=yaZM5tHdfkrD+BJOFKBtDEaxsRvSHwM8kD6sT1Cy2j8k8fPcynBheimqIPHFy+pEDH
         u4anOmIqIEKEGJi+q1DOT0PCW1XWl+epYobO0Id8ZjvM6w8962S5CHcZhjaTa2d/GbJA
         /sjLTRXFElLr49JwoURbIIMnaOXYRz6ey1txBtTIZtXEAqnOQa1DcE1p4DR/PGFHIH5T
         RwOl/chumlZyhBsSM9ydomWBuME3xVnUycrf9ZCqqo3+sB3W28j2IXZbwHH6v/l8ZTnP
         8HqJ2m+zHp7fwDbEpKJBSm2jmwvfHtMZ6ABjUKX7xNGVCsBe2xN/IvvKgf3X+YMjjvYC
         5qQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIXkW5qPTLSkIPAcsgf7Nrs/wSHqWrhAiOmo9lnNjeVimjG2uVomflB+RI3H4VP0BrpbdtfiGzgRR5@vger.kernel.org
X-Gm-Message-State: AFq9FYL1uolPi9RNDNH0NIQRZCGn1mPh2id6vFiB5Vqepwn14Hs6DRVs
	9lUnF1bPUQ/0ATzOl//F/ScguwDtZc9mwowyVylZWDAozRmMEXj8Xe5o7QjyWBxyFjimRgCLQKK
	X2H983CX0Bd/Lv1I1uxNWidfqAeTq211Fc8bFqhQHHEid7oMQBevqF6KNv1TnlV23
X-Gm-Gg: AYBFou1S86Zwu7i4DHHBJMvhVHRqD5Joqr1XSHQft9wc3AAvPU39ZYrL3or/ZGw5x+C
	ZQRMvPsJSt2VeiaPE37S/vjfs+EFv4xk8FpVczAJmlqWWYtPsteWxLz0AljF9Rgagr8SopkxEp/
	or2q0PmIXPrWxJFXg8QIfvC+EgcOfDfdL5i047UK4wzol54mJtyqzRxioiFyBE1LqSyJT2ZLK1y
	eMRocUr9aEUp+DSK/9cSF7wKiPbLLV9b2zqfskfLm4OW0A1rnSdxOGXHKAvqpegvVLjFGztth0s
	Pp/T2wnlToZEOjhxR6XzX9qZE04uMpeT5P7T7r0Nx1RhUHaiW/lj97tDqvDuVl439+RJ9vF98u2
	BTKP9F5yiSaXsjAZbXU9EEbFCttitJRcp0hGvjyH0T9IkinvfkuymA7OY2sc81uF18AGX50P0Ig
	vXGCg1Dz+bK5QM/bYMVn6lXzploCbT
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577595ad.1.1793188075441;
        Wed, 28 Oct 2026 04:47:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb0012894amr21577315ad.1.1793188074861;
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:54 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:42 +0800
Subject: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188045; l=1777;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nnENsS345tQgPHx3zmQ+K+zRXVP3ubluTbm6JNHyQSg=;
 b=h2ds47c2oQRKF1vNQUB/QrBIE9LXmZDGjjWF1lGMsTu3cB1/hg297KQ6IRBkgJXKaeVT7jVaw
 5SRqG1WLBWVCC5cujL3fHmxMtZq0KcEeT34zoARvsZTVwcieLZR8ydF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1e0ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX1xvGbwZprRW1
 KPJdkKwiDJFQqbj2r7wh1HfGHitxrynXG7xbvM8wr6qeeXBGTD5TpwaRe4JOSBWLZk5uhwAjBDB
 IfgAfsJ3I0rk2G2zXdeMINhBuXZiomg=
X-Proofpoint-GUID: Sn8CBUcHauSb6Ia-Yn72Tyehmoa3S341
X-Proofpoint-ORIG-GUID: Sn8CBUcHauSb6Ia-Yn72Tyehmoa3S341
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX4tTXnUtLFiqC
 TzP71RD/hpsJsdnfM4c9uZ3df+BGhnIZ4k0n6xV0vkqSMFqDZEdtwM+lBSjZVI0UK05IBlm7SEB
 a6JPLBImEwKDgevNiOwvFUwlg43xrm2n9FaHKUt9/KGpaLdMtt9n5iv9dQKeX7LyNdjgL0WiO1S
 8vBbgtPOPqisG4oDd4ryG4Tqxo6RFUX7BUW78heD36BsuzcXwLfrymWQxgxR8MZ5tD8SqLkzbDW
 1H70fFNFqNfnAei1/VYNSuAXV1OTlN4etdCK6/0WOfB2IlOqI5oHdBD9Bco0sguf1MORi3xwG8e
 OtfyxW6HMGBVPypnbDjoA08ef0JRP2tkGJhyhIMkx1BKJ9/3inARZ3vAZb4zy3E3O/xLdaVl9Cl
 a7eHWRuvldAdWtlgUTFP+dwi3Vt3X6MlA5cXS4NVO53l7L8tqqAVdg7Ydu9PgbTmUGJYlAXkzaU
 r3LIuwoOfBAo82yDIrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 347a5a6d6a1d..0f984fcbcae9 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else if (msc->iface == MPAM_IFACE_PCC) {
 		u32 mpam_fb_msc_id;

-- 
2.34.1

