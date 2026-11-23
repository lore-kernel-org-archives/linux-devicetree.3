Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430870;
	b=oqFUH7Cw+ItDaa4l1muyDlzE/NF0Bx8VmMB8jz3MVtoq/v8KTomZnptoJ7/URH30Ky+s
	 EKHtUNBBgz3SgGFnnZE/BDhcUbmSxX4Jjq0Qv6FkFldUkitsjv3RucOxPLaG5f+xAXRdL
	 +SgVmONjkrFs8EW1EvZ10OwGaFwnieQfLa33Gy9BYzLyDW30Rbo+SsAbW58kwvv6oYKRd
	 nv1F3AZn8r0SQD83AVfHhP2m++Yibvdcxnw4P3H/bWRz6eCZvQPIupe208Nh9IrzgSeuD
	 Hd85pEwgdI5xcsCNmcVKit2rIkydLkozcOIN2R7F/017ulQaMp+HsE3kwO6yWs6FCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
	b=tHVw5BWialVUCdtGhj9ZU1CjNTngV1KugF1WBeVLXSfODO79VfNvOTMGl39bFejaVs5w
	 JY1IxkCHjvYKWrSzK7vdMWqruiMHN9u5fcd1UqiTZxd2Iczfxm+4tLcDc9ghYKoS07S+i
	 56lS4jis6n0bUVFzCW/BRln/FZjfL4yCb8SYxmYtukl/Cq0oHrSHKQjLzSiOwxAmzMHCj
	 KE0IqebzuEnv4UnhLlmMTeNUUoLDiZrhk1xSJmJ1lcUIqyUYjTTLR+vvQ/7VkgTKuEP4K
	 e23kflSjkcReFJdJYHE4QwOFOEg7eddwlh4BeqDrqahrZcOE8fkekvo/AgLLDXpnv5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/Lf1EU8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE7606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CE7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/Lf1EU8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtGO1543941
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pLDtqrroGwv
	OI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=; b=Ly9Q+0CR8Ggwndo3fOEmB9/BA6D
	8AwsQ4j479LV+4erEoWm4CykwVJDXMHnHjkugQFWalTMG+Jx/uY1BURVDe+aKFFl
	UQqQcpXcLPEPCLCwDS0Tehh1G5bV/29YXn9f8GqfEaQCifv4yyw0BkyZ+JPYlhuq
	nFcsJLJLJns1JAesbqxv5BOVZ01Mjzzqyf+ajVVUDhLa6ZN9gY6ixnGLxE2dUbCu
	uYfx/FCWeY4JmpLHAeuZmjzSf3Et60FeUfzvJbdrBuZ9qCJq1ubeDzil+ct03g37
	dtZbVQyuu6MWKAeEfvx9Xc12TbRnDGbmmNYoGlBeiZystJ/lRoW0GzzmKeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy011mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2279280b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430868; x=1796035668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=K/Lf1EU89tt1abEp7rmYm2hmd1KyWknJeNMnsgvH+D4AbEd+l0PtGlnmsmDgv3rape
         /MkASRvxZ2OUAV7UEoPwOAYpPD36vlmd74USdGwBYbq4f7/BaWfn9zNyWNCFgABYRbpd
         yb0CMZBuIq1+6b+cNBQhPUBBfZTMUDO9cXnEjWzFYaPAuwAcbHewXnKDzHDfpHtKqHFy
         +/jSiN3QUGKOZc9J7R0H52wHlHgE9BHUFhYGaMeJy7rZbjUnQ7vceCU0JclMGfH14R6B
         4qIMZtrEyzBi55LaFL7XORHI8v6lS6awYUWoS00+kMplFr/k6kKb1qmh4K/oUH/ddUJ6
         xF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430868; x=1796035668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=Vh+/aE9iDgLC4fU2qmEUwZXSGFI/NOrZ7qtmoAIFzvgDOEw4r6Ry65yFKWh6WuW8wq
         PJFF1fO73Ww9msORxzeM38a0WGMQ1eDpEUR/MLTNnJBkbODkuDh3JzOTjPWNHVhtHtYV
         e3FaUftZrjTUhHTD01KdXylnLrEioKS8mGDDg+LB5Uk9mq/R5nCZkHYpt8a2KBm2Ojld
         oQRF2M1q66UMyj+KxlW0iX2P6ZNTRnX01N1SNHOXhfD00Uzla6ypsBr6KX0LwdJdYw5R
         7VsDoi38SsDL88C36wUqssZdc5NbEAuEjf8GwAeSElcnPol8CpRCLasL0HIlKStVR9dg
         ewmQ==
X-Forwarded-Encrypted: i=1; AL+hErEU6bV8sBlQWIXBLH78nX1ts+VizmKMjFP01gr+CM3wIS4ZD5glmrMncZKnNALBkSbqaL32CISpEtee@vger.kernel.org
X-Gm-Message-State: APuU4Z/lUxkz8zaO9NP6hcEj8JvP1EI0pQgyAotf+U0TNH/CenVACR6U
	6cZPVqL+ENzJbPzCCZlGnLvVcZNJhAECQ9J9EC3HTdSSYIpf4JUEJXlLvVT3QvhU58Yw3PjJhxd
	m2LByWvABBD16MRZTeI0thWb7j8ketrO/BuUgJT70xGhw8JlF8u71WOEQ3qLwugr5
X-Gm-Gg: AZFdTZdhh7huXmysgXsdtRCOWKSEkhlkq2lftgJKiXG0uwDzCM3Kg81snnyOxoyIhgd
	cYriA+ixyH3iro14K3HwHex98zq+dph71Ha12GW11ceqn0lIkDC/T01/+3nK/MbwfTggpchfZSb
	Y/iSDvAJKGrRf5VqW+H7w++hmtbs8iKK6gazr2p7ktQXz5goAZeln1wTPWakFN/cUBQ12JYPcVl
	ub4cajqFbjtcvTlciXcN3epizQluTMw0vJOihFKBY4lebpGP6KMrLKeLF/BzefT9xeQOmvbdmHM
	JHcJarZT/koY4PQQ38qY2/AyW1qytTUoQcx50eNimMMGcat6koQIZdGdwKsLIKS6rqRfmTcHExQ
	GK46bTazdD3KH5F81Ju3Uqd0SZPrz+ut4dSjKeNVOqknV5prHwwj7Rqp68J5Z6w7tXvWU7ghDhy
	TdXdEfzw==
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625589b3a.45.1795430868069;
        Mon, 23 Nov 2026 02:47:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625582b3a.45.1795430867614;
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system suspend without wakeup
Date: Mon, 23 Nov 2026 16:17:17 +0530
Message-Id: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX82RMYZdHrkTn
 wT2W8d/gHw6CwoLTtmpBBo98XMqtVZOR0k4Mbd0Pa/86+QTrxEmhaUZ2FPOCZf8UtnoRWCmLu8o
 +uLueIYdR5IofdEN6oAKmfHShw/meCItZw67Lm+XsWuxT2ajoP804CZhbFgU44BaigDrhcssAah
 bpQKea3gAPsPvKc3GVLZ77fpPFuKqLPLzlYvrfKuqvTCWm5YbH6gu6k5vDC0DeFE67U2v4fMtCP
 fOgDHM/GmF42AMgrMSti/F8lJ3uXIDgmn+LBTxlaxoeDo5JB6Fq6OATlYE+N31Try43W8hgIy2J
 /JRqDrQUNngZSNs5p/t/xg4Xqq3GIByj/WyLveWTH8Ehi4mCByd2T7NEHbBvXHkM9PjLp0Vvw+1
 GqFK+EAfI/n+neUNRMjAfjZdnBJO8xMOOJ+MUdg0ZcP0HPetP309FCATNAxEfjJROHJoer4ZEGL
 dha3vdVQbUarbFyChQA==
X-Proofpoint-ORIG-GUID: wyp-bCRKNx7Xi5kgyTjxAsNIl31mOQNP
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0419d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f_oCHbJux9u68P6T8RIA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: wyp-bCRKNx7Xi5kgyTjxAsNIl31mOQNP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX71jFAZXvXFrx
 Y+njQoEqbmR2stlOgJEFJcV3noRxleczo4kkPBIdx27AqrbwWYyrN5wGQc5rK7zaTwdBkDoEqHa
 m+bpZt+eWj9l2FhYCOmLmQnVfpWKf5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Runtime suspend always arms the wakeup interrupts in host mode, even if
the device is not wakeup capable. If the controller is still runtime
suspended when system suspend runs without wakeup enabled, the
interrupts stay armed as wakeup sources, so they can still wake the
system. System resume does not disarm them either, as it only does so
when wakeup is enabled, so they remain armed after resume and the next
runtime suspend arms them a second time.

Disarm them in system suspend when the controller is already runtime
suspended and wakeup is not enabled, so the state matches what a system
suspend without a preceding runtime suspend would have left.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7a7225b900b3..18db19cf2065 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 	u32 val;
 	int i, ret;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended) {
+		/*
+		 * Runtime suspend arms the wakeup interrupts in host mode
+		 * regardless of the device wakeup setting. If system suspend
+		 * runs without wakeup, disarm them here, as resume will not.
+		 */
+		if (dwc3_qcom_is_host(qcom) && !wakeup)
+			dwc3_qcom_disable_interrupts(qcom);
 		return 0;
+	}
 
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-- 
2.34.1

