Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430904;
	b=gtgXKms8rRnmu/bfIiw4dvwruXIJz/85B9MLlmfv4FExUtRI4rDve8rFJFJRPLCjrpo6
	 2anHj7KOSzhGAkCxIBPZLzQTfVfQCmahwBa71ll1f2dcX/U68kIEn5OQ6hWyNnWjVnlHW
	 /Z15OXpP0YXMK2ClS/GdMssTJpdTWZdWLKifEIbreKqH7/OlsY+YSGWjzCE37MDnTnGZO
	 9Nc622nlecHZlEvhfr60wBLWnHD/eg7VoIRR47JUWPX/FVJEkCDPVdp0w9hMmmgH4uPKc
	 089lEec+4TpgsAAkseW4Qime84jW2soel+lkH2TcZ8YBUNQu+Wsknlq1kXhcWdrT2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
	b=wU88uodwsPpbgNX5CYQu6j58K32lO2TJzJb1zDrdaSn7wSzvEf5fZ+SRFEQJ05B6KVmT
	 h0qL6aqVw+VDFU+5b5oqKxYkCKhghotN2bKkn35zceW6tpMb0IP3y3Hj98n5TqqttR49r
	 4Lz6SulOwVQ5ebgMxTdVDv+RYSgkb0LIh5sKrG88VqUcKwdI2RWdUjrl6nEcL9jskUPh1
	 6i7cR1/nl4Uy994YdyaZX2heqZ5V35zAsBrbolScaKT2jCWj6XMRE6lGyv8JQEZqa8gfB
	 VbVyuOesClZvZ5z8tHVJDeZhFtVCfXJ9dxzDDkT7k6APBX0RGL6hdfAJDtdvzkHjg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5767606A69C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5767606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fonl2072130
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A4ZZmj98b3J
	yuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=; b=Ff2TL9+fT1OKjC5ByaS5VBM+lk4
	JW1cagTu6jxe/QdjF6RMcrSjg2LdOXRZtUZaP96WaW3gL/zZ5c1o1sypCjrJhmSP
	UA+P7lnIA/lj77KrD/5pg7hU7Vg4CqMIQMixCdPhIW5krXwL8otD4uZ8GtUOGUXO
	pPL461NhttzWo8o2w5qjo4aQO1nxh1/Pq1H0XqGeumv7U8Gv0edyA2qZWzNaihjd
	RaZQz6MjZSrJ5mckhGRfCoiWIMUn2+uUUIGu5P8oxTcI1OwZgoRvR7GUw0HgwOMp
	UgsKvPnPw5cMOw/otubASA3TYkvm9/Fo8ClNA47/DkZVxUFMEgiRYDvWbZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p90fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a079256596so2234023b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430902; x=1796035702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=ix+o1GXpdBNeZ2vgOzSP5/Y6LmN3jxNGdFDMSJgqc/372T8pPlCaKLwz0mYlU8Cw7P
         c+6xwFVM/IlEIRuANgLj84o4HbFynGBy/O5sKUukE0MPVcTIW4IwdQs038N9/IKOi7aK
         3h7+zZJS2qrOEMXsK32vfOdBFbfcCjNPEbriZvqPVTCiWJ4uNLyUionxKc5d0S686pmp
         xXEZWQuo1CDUzrpOxHZTNN4CpYzIkuZn0V/57+4OzpzrOIraQ+4JrvarCywY+qIPouL3
         jsEN8FNQEqjp7fzFk/tm61IsEVCut59/p1wB0PJJqKqgeIZiaqKNTyBWkrIosFHH+mkR
         FqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430902; x=1796035702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=KhFl2w/qomgT+mNFC3PLssFxZUbXsy782brWfCsuggo8nA3khH7u5s4WE4TqFDfunr
         fNokjffZ7oO4NKGkEA8FDKNYpZ1RBrcmIQDN94nIRY00t8NVMa0D332xwkFVY9Sx46DB
         l6vPh6WxvZbNgdw6bj3Ubx1zLsrxyVa4zjVd9Hn0Q+NtTWVnNcknfHY4x0pw/YtEieQ9
         alk8qHtQSf6SjxEm+iU81YZ1GIc0tHCTQcG0/EswmK0QfBfdjqG0ddXQG+WKlrE/nrvb
         x/q6rG+QRRP8lueO4i43+N4jmTe/1BiJRJna8pejusPPIjPuU8bteQehjeN2ZH95gg8w
         nzFQ==
X-Forwarded-Encrypted: i=1; AL+hErEOh+BB+UV/Dez1TVAc7eHBZ2bX4BtNLcb5YT939n0ELY3b2XYu77jhuwidoVu5owFaPG+hcg63Lc6I@vger.kernel.org
X-Gm-Message-State: APuU4Z/hei0KZG+CCXFmCkGXub6qRlqvM/uzz8tEmNPO1gjvYkkF9GvG
	lB1ON6YmRqeto+ZSncHzNpiTF9kpVvZi6LHZlCWXmqSAUlsGAJiz6Bfju7EHy6l6lqBCBUPWLji
	AKzwTB+P0dOjqP7u0h660B7yrqX5NRXLOB9szmJ1hjvpR94lu5I7gvYc58UNuFR2Y
X-Gm-Gg: AZFdTZelT0QIUDAP+X9S0Oe88wwul0rOgTqh82x3qWRKW9gY13ydXc0itxYGzRd4OMh
	7m0lZB+ETKm9hz2/G8o3LGFXUZAaDZEjgiCQWSse9bnGkpBKauGT4vVpacx9x9QNyspXsUCdHRr
	6KUTnbQxd+hXvdCzpCiraFA4P5VSKwAf7a1jCdoP7E/xJO9vFWcywaa0+F01X7mos8huj/+isX6
	Imh/Q0M3uJAxvij+Y1xtSdT4Usy6kvICQRd4jsjcNHVZ4vwiIIM9sXzhd2HFShbEBTPO5m2FByj
	m4LKzzk9iJ1dI2wGQksPVte7B2Y2KqfylcHalqxsNi/hNGmun+Fjt5H+hsDKxrYSUfaBHpLe1hF
	HflihF7E9gcLgk5vquIcsh4w2qBc24Eft1F3hwjv3RmnCyxBo7jrVAPaBCfUxctnyw3XgQ4i7Qz
	ZUDaUFbg==
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115267b3a.37.1795430902489;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115252b3a.37.1795430902002;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:21 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after system resume
Date: Mon, 23 Nov 2026 16:17:23 +0530
Message-Id: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: v4raw74bTEmgG9MB3ilu8aIjY8lgUlBc
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0419f7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IFn2jvwIVmFqnHeiHmEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+Mw23voqB6LP
 6RS2CYsRFE20rnkbz2N1CsqndvAHqTddN3Y95W45CnnAUFrGmo3wPFXm3UFhTApA0BXLeNwi/Fv
 bf81hKuJSdu+MI5DVVyw8kqZZ8epVhQ=
X-Proofpoint-ORIG-GUID: v4raw74bTEmgG9MB3ilu8aIjY8lgUlBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX9CxdlA7twjlr
 XJyvFTaABdrTK2f8HcXXFuJoEH862Act6rV8wEb650X5zHXPZ1IyP92+KYvmKrGechqA4ZojXSq
 tmR7PYvDVe4oX58EyEIcI/WArIKswVkxtbGh2ooGu0ALth/SXCw5Be3LAfsgoI7iVTl7j1ExBmc
 BrrBi/pKyQ7eECVvtbY/iVGSqR34nwGzwIm2VqLWS0Pj25qKS9024iHTn7FEp4bmqQqCKlFP+/1
 kwWCS3kY3Hl6PbkI1jFEdPSMhjl2g46+1n+1fFyZSCa8wGHQt+aanSOO4TDYltCQYkBMc1JaJTZ
 51jZXC+MLTnxlvt5uiKhjdk7mf1/gEyOUnor78/BjCbQit0pxvzPMuodFDK6kJ4KGTenshPSDYL
 L2GMTnISL98K5FLrgWznwh1gAxyNVTfGtJWWdC4ywZyKxM4fG38b5Nv03aGYyT5pOuVVW//sKMY
 95w8QtMrB+8RUsplcVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

The controller reset on system resume returns the Qscratch registers to
their power-on defaults, which clears the VBUS valid override that was
set up for device mode. Without it the PHY does not see VBUS and the
gadget fails to enumerate after resume.

Re-enable the override after resume when the controller is not in host
mode.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8e8d7e59c6d5..50fca06c83d4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	/*
+	 * The reset above returned Qscratch to its power-on defaults, so
+	 * restore the VBUS valid override set up for device mode.
+	 */
+	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
+	    !dwc3_qcom_is_host(qcom))
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->is_suspended = false;
 
 	return 0;
-- 
2.34.1

